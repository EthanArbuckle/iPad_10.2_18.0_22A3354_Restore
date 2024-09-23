@implementation SSRVoiceProfileXPCClient

- (SSRVoiceProfileXPCClient)init
{
  SSRVoiceProfileXPCClient *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSRVoiceProfileXPCClient;
  v2 = -[SSRVoiceProfileXPCClient init](&v4, sel_init);
  if (v2)
    SSRLogInitIfNeeded();
  return v2;
}

- (void)connect
{
  OS_xpc_object *mach_service;
  OS_xpc_object *xpcConnection;
  OS_xpc_object *v5;
  _QWORD v6[4];
  id v7;
  id location;

  mach_service = xpc_connection_create_mach_service("com.apple.private.ssr.voiceprofileservice", 0, 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = mach_service;

  objc_initWeak(&location, self);
  v5 = self->_xpcConnection;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__SSRVoiceProfileXPCClient_connect__block_invoke;
  v6[3] = &unk_24CC856A0;
  objc_copyWeak(&v7, &location);
  xpc_connection_set_event_handler(v5, v6);
  xpc_connection_activate(self->_xpcConnection);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_handleListenerEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (MEMORY[0x212BE1BA4](v4) == MEMORY[0x24BDACFB8])
    {
      -[SSRVoiceProfileXPCClient _handleListenerError:](self, "_handleListenerError:", v5);
      goto LABEL_9;
    }
    v6 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[SSRVoiceProfileXPCClient _handleListenerEvent:]";
      v7 = "%s ignore unknown types of message ";
      v8 = v6;
      v9 = 12;
LABEL_7:
      _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    v10 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[SSRVoiceProfileXPCClient _handleListenerEvent:]";
      v13 = 2050;
      v14 = 0;
      v7 = "%s cannot handle event : event = %{public}p";
      v8 = v10;
      v9 = 22;
      goto LABEL_7;
    }
  }
LABEL_9:

}

- (void)_handleListenerError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v7;
  const char *v8;
  const char *string;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v12 = 136315394;
    v13 = "-[SSRVoiceProfileXPCClient _handleListenerError:]";
    v14 = 2050;
    v15 = 0;
    v8 = "%s cannot handle error : error = %{public}p";
    goto LABEL_15;
  }
  if (v4 != (id)MEMORY[0x24BDACF38] && v4 != (id)MEMORY[0x24BDACF30])
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x24BDACF40]);
    v10 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v12 = 136315394;
    v13 = "-[SSRVoiceProfileXPCClient _handleListenerError:]";
    v14 = 2082;
    v15 = string;
    v8 = "%s connection error: %{public}s";
LABEL_15:
    _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, 0x16u);
    goto LABEL_13;
  }
  v7 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[SSRVoiceProfileXPCClient _handleListenerError:]";
    _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Listener connection disconnected", (uint8_t *)&v12, 0xCu);
  }
  -[SSRVoiceProfileXPCClient _handleListenerDisconnectedError:](self, "_handleListenerDisconnectedError:", v5);
LABEL_13:

}

- (void)_handleListenerDisconnectedError:(id)a3
{
  void *v4;
  char v5;
  id WeakRetained;

  -[SSRVoiceProfileXPCClient delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "ssrVoiceProfileXPCClient:didDisconnect:", self, 1);

  }
}

- (void)dealloc
{
  OS_xpc_object *xpcConnection;
  NSObject *v4;
  OS_xpc_object *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[SSRVoiceProfileXPCClient dealloc]";
      _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s disconnect VoiceProfileXPCClient", buf, 0xCu);
      xpcConnection = self->_xpcConnection;
    }
    xpc_connection_cancel(xpcConnection);
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)SSRVoiceProfileXPCClient;
  -[SSRVoiceProfileXPCClient dealloc](&v6, sel_dealloc);
}

- (void)fetchEnrollmentStatusForSiriProfileId:(id)a3 forLanguageCode:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  id v12;
  xpc_object_t v13;
  xpc_object_t v14;
  id v15;
  xpc_object_t v16;
  NSObject *v17;
  OS_xpc_object *xpcConnection;
  id v19;
  uint64_t i;
  uint64_t j;
  _QWORD handler[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  xpc_object_t v26[2];
  char *v27[2];
  xpc_object_t values[3];
  char *keys[2];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  *(_OWORD *)keys = xmmword_24CC856C0;
  v30 = "siriProfileId";
  values[0] = xpc_int64_create(1);
  if (v9)
    v11 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  else
    v11 = xpc_null_create();
  v12 = v11;
  values[1] = v12;
  if (v8)
    v13 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  else
    v13 = xpc_null_create();
  values[2] = v13;

  v14 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  *(_OWORD *)v27 = xmmword_24CC856D8;
  v26[0] = xpc_int64_create(2);
  v15 = v14;
  v26[1] = v15;
  v16 = xpc_dictionary_create((const char *const *)v27, v26, 2uLL);
  v17 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SSRVoiceProfileXPCClient fetchEnrollmentStatusForSiriProfileId:forLanguageCode:completion:]";
    _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s Sending xpc message", buf, 0xCu);
  }
  xpcConnection = self->_xpcConnection;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __93__SSRVoiceProfileXPCClient_fetchEnrollmentStatusForSiriProfileId_forLanguageCode_completion___block_invoke;
  handler[3] = &unk_24CC856F0;
  v19 = v10;
  v23 = v19;
  xpc_connection_send_message_with_reply(xpcConnection, v16, 0, handler);

  for (i = 1; i != -1; --i)
  for (j = 2; j != -1; --j)

}

- (SSRVoiceProfileXPCClientDelegate)delegate
{
  return (SSRVoiceProfileXPCClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __93__SSRVoiceProfileXPCClient_fetchEnrollmentStatusForSiriProfileId_forLanguageCode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = xpc_dictionary_get_BOOL(v3, "result");
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, _BOOL8, _QWORD))(v5 + 16))(v5, v4, 0);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 1101, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
  }

}

void __35__SSRVoiceProfileXPCClient_connect__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleListenerEvent:", v3);

}

@end
