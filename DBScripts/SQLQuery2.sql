USE [DBPedidos]
GO

CREATE OR ALTER PROCEDURE [dbo].[paUsuario_editarclave]
    @IdUsuario INT,
    @Clave binary,
    @CodUsuario VARCHAR(50),
    @Nombres VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar usuario en la tabla Usuario
    UPDATE Usuario
    SET Clave = @Clave,
		CodUsuario = @CodUsuario,
        Nombres = @Nombres
    WHERE IdUsuario = @IdUsuario;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[paUsuario_editar]
    @IdUsuario INT,
    @CodUsuario VARCHAR(50),
    @Nombres VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar usuario en la tabla Usuario
    UPDATE Usuario
    SET CodUsuario = @CodUsuario,
        Nombres = @Nombres
    WHERE IdUsuario = @IdUsuario;
END;
GO

USE DBPedidos;
GO

CREATE OR ALTER PROCEDURE [dbo].[paUsuario_eliminar]
    @IdUsuario INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Eliminar el usuario de la tabla Usuario
    DELETE FROM Usuario
    WHERE IdUsuario = @IdUsuario;
END;
GO


CREATE OR ALTER PROCEDURE [dbo].[paUsuario_buscaId]
	@IdUsuario int
AS
BEGIN
	
	SET NOCOUNT ON;

	-- Buscar el usuario por Id
	SELECT IdUsuario,CodUsuario,Nombres From Usuario
	Where IdUsuario = @IdUsuario
END
GO

CREATE OR ALTER PROCEDURE [dbo].[paUsuarioExiste]
    @CodUsuario VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si existe el CodUsuario en la tabla Usuario
    IF EXISTS (SELECT 1 FROM Usuario WHERE CodUsuario = @CodUsuario)
    BEGIN
        -- Si el usuario existe, devolver 1
        RETURN 1;
    END
    ELSE
    BEGIN
        -- Si el usuario no existe, devolver 0
        RETURN 0;
    END
END
GO

CREATE OR ALTER PROCEDURE [dbo].[paBorrarCliente]
    @Codigo INT
AS
BEGIN
    --SET NOCOUNT ON;
    DELETE FROM Clientes WHERE Codigo = @Codigo;
END;
GO