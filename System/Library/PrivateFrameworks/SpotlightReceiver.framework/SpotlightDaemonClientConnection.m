@implementation SpotlightDaemonClientConnection

- (SpotlightDaemonClientConnection)initWithClient:(id)a3 forServiceName:(id)a4
{
  id v7;
  id *v8;
  SpotlightDaemonClientConnection *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SpotlightDaemonClientConnection;
  v8 = -[CSXPCConnection initMachServiceListenerWithName:](&v11, sel_initMachServiceListenerWithName_, a4);
  v9 = (SpotlightDaemonClientConnection *)v8;
  if (v8)
    objc_storeStrong(v8 + 7, a3);

  return v9;
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  _xpc_connection_s *v3;
  pid_t pid;
  const __CFAllocator *v5;
  __SecTask *v6;
  __SecTask *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  audit_token_t token;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (_xpc_connection_s *)a3;
  pid = xpc_connection_get_pid(v3);
  xpc_connection_get_audit_token();

  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  memset(&token, 0, sizeof(token));
  v6 = SecTaskCreateWithAuditToken(v5, &token);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)SecTaskCopyValueForEntitlement(v6, CFSTR("com.apple.private.corespotlight.sender"), 0);
    v9 = objc_msgSend(v8, "BOOLValue");
    logForCSLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        token.val[0] = 67109120;
        token.val[1] = pid;
        _os_log_impl(&dword_21066D000, v11, OS_LOG_TYPE_INFO, "New sender connection for pid: %d", (uint8_t *)&token, 8u);
      }

      logForCSLogCategoryDaemonClient();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_signpost_id_generate(v12);

      logForCSLogCategoryDaemonClient();
      v14 = objc_claimAutoreleasedReturnValue();
      v11 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        token.val[0] = 67109120;
        token.val[1] = pid;
        _os_signpost_emit_with_name_impl(&dword_21066D000, v11, OS_SIGNPOST_EVENT, v13, "AddClientConnection", "pid:%d", (uint8_t *)&token, 8u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[SpotlightDaemonClientConnection addClientConnectionIfAllowedForConnection:].cold.1(pid, v11);
    }

    CFRelease(v7);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)lostClientConnection:(id)a3 error:(id)a4
{
  return 0;
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  return _SpotlightDaemonClientHandleCommand(a3, a4, self->_spotlightDaemonClient);
}

- (SpotlightDaemonClient)spotlightDaemonClient
{
  return self->_spotlightDaemonClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightDaemonClient, 0);
}

- (void)addClientConnectionIfAllowedForConnection:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21066D000, a2, OS_LOG_TYPE_ERROR, "Error pid: %d missing sender entitlement", (uint8_t *)v2, 8u);
}

@end
