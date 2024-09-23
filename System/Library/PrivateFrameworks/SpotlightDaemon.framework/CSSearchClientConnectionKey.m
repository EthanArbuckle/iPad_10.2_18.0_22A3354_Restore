@implementation CSSearchClientConnectionKey

- (unint64_t)hash
{
  return xpc_hash(self->_connection);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (id)keyWithConnection:(id)a3
{
  id v3;
  CSSearchClientConnectionKey *v4;

  v3 = a3;
  v4 = -[CSSearchClientConnectionKey initWithConnection:]([CSSearchClientConnectionKey alloc], "initWithConnection:", v3);

  return v4;
}

- (CSSearchClientConnectionKey)initWithConnection:(id)a3
{
  id v5;
  CSSearchClientConnectionKey *v6;
  CSSearchClientConnectionKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSSearchClientConnectionKey;
  v6 = -[CSSearchClientConnectionKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CSSearchClientConnectionKey *v4;
  OS_xpc_object *v5;
  OS_xpc_object *connection;
  void *v7;
  BOOL v8;

  v4 = (CSSearchClientConnectionKey *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CSSearchClientConnectionKey connection](v4, "connection");
      v5 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue();
      connection = self->_connection;
      if (v5 == connection)
      {
        v8 = 1;
      }
      else
      {
        -[CSSearchClientConnectionKey connection](v4, "connection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = xpc_equal(connection, v7);

      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

@end
