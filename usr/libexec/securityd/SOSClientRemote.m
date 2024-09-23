@implementation SOSClientRemote

- (id)initSOSConnectionWithConnection:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SOSClientRemote;
  v7 = -[SOSClient initSOSClientWithAccount:](&v10, "initSOSClientWithAccount:", a4);
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "setConnection:", v6);

  return v8;
}

- (BOOL)checkEntitlement:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  BOOL v8;
  const void *v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  id v14;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "valueForEntitlement:", v4));
  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = sub_10000EF14("SecError");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109378;
      v12[1] = objc_msgSend(WeakRetained, "processIdentifier");
      v13 = 2112;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sos: Client pid: %d doesn't have entitlement: %@", (uint8_t *)v12, 0x12u);
    }

    v8 = 0;
  }

  return v8;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
}

@end
