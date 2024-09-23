@implementation LDXPCConnection

- (BOOL)remoteProcessHasEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  if (!a3)
    return 1;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LDXPCConnection connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", v4));

  v8 = 0;
  if (v6)
  {
    v7 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
      v8 = 1;
  }

  return v8;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
