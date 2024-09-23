@implementation UpgradeClient

- (UpgradeClient)initWithConn:(id)a3 log:(id)a4
{
  _xpc_connection_s *v7;
  id v8;
  UpgradeClient *v9;
  pid_t pid;
  uint64_t v11;
  OS_os_transaction *transaction;
  _rpc_cred *v13;
  objc_super v15;
  _OWORD v16[2];
  uint64_t v17;
  char __str[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[31];
  _OWORD v33[5];

  v7 = (_xpc_connection_s *)a3;
  v8 = a4;
  v31 = 0u;
  memset(v32, 0, sizeof(v32));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  *(_OWORD *)__str = 0u;
  memset(v16, 0, sizeof(v16));
  v15.receiver = self;
  v15.super_class = (Class)UpgradeClient;
  v9 = -[UpgradeClient init](&v15, "init");
  if (v9)
  {
    pid = xpc_connection_get_pid(v7);
    snprintf(__str, 0xFFuLL, "com.apple.security.cryptexd.upgrade_lock.pid%d", pid);
    v11 = os_transaction_create(__str);
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v11;

    objc_storeStrong((id *)&v9->_conn, a3);
    objc_storeStrong((id *)&v9->_logHandle, a4);
    v13 = (_rpc_cred *)malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
    if (!v13)
      sub_10003DA90(&v17, v33);
    v9->_cred = v13;
    xpc_connection_get_audit_token(v7, v16);
    sub_100039E4C(&v9->_cred->var0, v16);
  }

  return v9;
}

- (void)activate
{
  _xpc_connection_s *v3;
  _xpc_connection_s *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[UpgradeClient conn](self, "conn"));
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_100002C64;
  v8 = &unk_100055130;
  objc_copyWeak(&v9, &location);
  xpc_connection_set_event_handler(v3, &v5);

  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[UpgradeClient conn](self, "conn", v5, v6, v7, v8));
  xpc_connection_activate(v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)onCancel:(id)a3
{
  id v4;
  id cancelHandler;

  v4 = objc_retainBlock(a3);
  cancelHandler = self->_cancelHandler;
  self->_cancelHandler = v4;

}

- (void)_handleInterfaceLockMessage:(id)a3
{
  _xpc_connection_s *v3;
  id v5;
  void *v6;
  _xpc_connection_s *v7;
  BOOL v8;
  char *v9;
  _xpc_connection_s *v10;
  pid_t pid;
  int v12;
  NSObject *v13;
  void *v14;
  pid_t v15;
  _xpc_connection_s *v16;
  pid_t v17;
  int v18;
  NSObject *v19;
  void *v20;
  pid_t v21;
  void (**v22)(void);
  OS_os_transaction *transaction;
  OS_xpc_object *conn;
  _xpc_connection_s *v25;
  _xpc_connection_s *v26;
  int v27;
  _BYTE *v28;
  __int16 v29;
  pid_t v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  _BYTE buffer[32];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeClient conn](self, "conn"));
  v7 = 0;
  v8 = sub_100029AF0((uint64_t)v6, (uint64_t)"com.apple.private.security.cryptex.upgrade");

  if (v8)
  {
    v9 = xpc_copy_description(v5);
    if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
    {
      v22 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[UpgradeClient cancelHandler](self, "cancelHandler"));
      v22[2]();

      transaction = self->_transaction;
      self->_transaction = 0;

      conn = self->_conn;
      self->_conn = 0;

    }
    else
    {
      *(_OWORD *)buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = *(_OWORD *)&qword_100044728;
      v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[UpgradeClient conn](self, "conn"));
      pid = xpc_connection_get_pid(v10);
      proc_name(pid, buffer, 0x20u);

      v12 = *__error();
      v13 = objc_claimAutoreleasedReturnValue(-[UpgradeClient logHandle](self, "logHandle"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeClient conn](self, "conn"));
        if (v14)
        {
          v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[UpgradeClient conn](self, "conn"));
          v15 = xpc_connection_get_pid(v3);
        }
        else
        {
          v15 = -1;
        }
        v27 = 136315906;
        v28 = buffer;
        v29 = 1024;
        v30 = v15;
        v31 = 2082;
        v32 = v9;
        v33 = 1024;
        v34 = 5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: unexpected message: %{public}s: %{darwin.errno}d", (uint8_t *)&v27, 0x22u);
        if (v14)

      }
      *__error() = v12;
      v26 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[UpgradeClient conn](self, "conn"));
      xpc_connection_cancel(v26);

    }
  }
  else
  {
    v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[UpgradeClient conn](self, "conn", *(_QWORD *)"unknown", unk_100044720, 0, unk_100044730));
    v17 = xpc_connection_get_pid(v16);
    proc_name(v17, &v27, 0x20u);

    v18 = *__error();
    v19 = objc_claimAutoreleasedReturnValue(-[UpgradeClient logHandle](self, "logHandle"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeClient conn](self, "conn"));
      if (v20)
      {
        v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[UpgradeClient conn](self, "conn"));
        v21 = xpc_connection_get_pid(v7);
      }
      else
      {
        v21 = -1;
      }
      *(_DWORD *)buffer = 136315650;
      *(_QWORD *)&buffer[4] = &v27;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v21;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = 144;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Client lacks entitlement.: %{darwin.errno}d", buffer, 0x18u);
      if (v20)

    }
    *__error() = v18;
    v25 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[UpgradeClient conn](self, "conn"));
    xpc_connection_cancel(v25);

    v9 = 0;
  }
  free(v9);

}

- (void)dealloc
{
  OS_xpc_object *conn;
  objc_super v4;

  conn = self->_conn;
  if (conn)
    xpc_connection_cancel(conn);
  free(self->_cred);
  v4.receiver = self;
  v4.super_class = (Class)UpgradeClient;
  -[UpgradeClient dealloc](&v4, "dealloc");
}

- (OS_xpc_object)conn
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8, 1);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 16, 1);
}

- (id)cancelHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (_rpc_cred)cred
{
  return self->_cred;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end
