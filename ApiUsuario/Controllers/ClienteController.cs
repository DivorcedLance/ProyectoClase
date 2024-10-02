using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MiBotica.SolPedido.Entidades.Core;

namespace ApiUsuario.Controllers
{
    public class ClienteController : ApiController
    {
        // GET: api/Cliente
        public IEnumerable<Cliente> Get()
        {
            return Variables.ListaClientes;
        }

        // GET: api/Cliente/5
        public Cliente Get(int id)
        {
            return (from x in Variables.ListaClientes
                    where x.Codigo == id
                    select x).FirstOrDefault();
        }

        // POST: api/Cliente
        public IHttpActionResult Post([FromBody] Cliente value)
        {
            // Verificar si ya existe un cliente con el mismo código
            var clienteExistente = Variables.ListaClientes.FirstOrDefault(c => c.Codigo == value.Codigo);

            if (clienteExistente != null)
            {
                return BadRequest("Ya existe un cliente con el mismo código.");
            }

            // Si no existe, agregar el nuevo cliente
            Variables.ListaClientes.Add(value);

            return Ok("Cliente agregado correctamente.");
        }


        // PUT: api/Cliente/5
        public void Put(int id, [FromBody] Cliente value)
        {
        }

        // DELETE: api/Cliente/5
        public void Delete(int id)
        {
        }
    }
}

