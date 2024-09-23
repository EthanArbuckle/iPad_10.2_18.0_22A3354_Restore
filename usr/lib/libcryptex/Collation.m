@implementation Collation

- (Collation)init
{
  return (Collation *)-[Collation initForUser:](self, "initForUser:", getuid());
}

- (id)initForUser:(unsigned int)a3
{
  Collation *v4;
  os_log_t v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  _xpc_endpoint_s *v9;
  xpc_connection_t v10;
  _xpc_connection_s *v11;
  Collation *v12;
  _xpc_connection_s *v13;
  NSObject *v14;
  _xpc_connection_s *v15;
  xpc_object_t empty;
  _xpc_connection_s *v17;
  xpc_object_t v18;
  void *v19;
  void *v20;
  Collation *v21;
  _QWORD handler[4];
  Collation *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)Collation;
  v4 = -[Collation init](&v25, sel_init);
  if (!v4)
  {
LABEL_6:
    v21 = v4;
    goto LABEL_10;
  }
  v5 = os_log_create("com.apple.libcryptex", "collations");
  -[Collation setLog:](v4, "setLog:", v5);

  v6 = dispatch_queue_create("com.apple.security.libcryptex.collations", 0);
  -[Collation setDq:](v4, "setDq:", v6);

  collation_interface_request_endpoint_for_user();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[Collation setEndpoint:](v4, "setEndpoint:", v7);

  -[Collation endpoint](v4, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[Collation endpoint](v4, "endpoint");
    v9 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
    v10 = xpc_connection_create_from_endpoint(v9);
    -[Collation setClient_con:](v4, "setClient_con:", v10);

    -[Collation client_con](v4, "client_con");
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __25__Collation_initForUser___block_invoke;
    handler[3] = &unk_24CE0BA90;
    v12 = v4;
    v24 = v12;
    xpc_connection_set_event_handler(v11, handler);

    -[Collation client_con](v12, "client_con");
    v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    -[Collation dq](v12, "dq");
    v14 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue(v13, v14);

    -[Collation client_con](v12, "client_con");
    v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_activate(v15);

    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_string(empty, "command", "package");
    -[Collation client_con](v12, "client_con");
    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v18 = xpc_connection_send_message_with_reply_sync(v17, empty);

    if (v18)
    {
      xpc_dictionary_get_value(v18, "package");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEDBA28]), "initWithXPC:", v19);
      -[Collation setCcore:](v12, "setCcore:", v20);

    }
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[Collation initForUser:].cold.1(a3);
  v21 = 0;
LABEL_10:

  return v21;
}

void __25__Collation_initForUser___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *string;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x212BF18F8]();
  if (v4 == MEMORY[0x24BDACFA0])
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl(&dword_2126F8000, v5, OS_LOG_TYPE_DEFAULT, "Received message %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else if (v4 == MEMORY[0x24BDACFB8])
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
    objc_msgSend(*(id *)(a1 + 32), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __25__Collation_initForUser___block_invoke_cold_1((uint64_t)string, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __25__Collation_initForUser___block_invoke_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (__CFDictionary)package
{
  void *v2;
  void *v3;
  __CFDictionary *v4;
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[Collation ccore](self, "ccore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "packToXPC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CFDictionary *)_CFXPCCreateCFObjectFromXPCObject();

  if (!v4)
    -[Collation package].cold.1(&v6, v7);
  return v4;
}

- (id)mountPointOfBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[Collation ccore](self, "ccore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mountPointOfBundleID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getValidPaths:(id)a3 forLabels:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[Collation ccore](self, "ccore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getValidPaths:forBundleID:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CollationCore)ccore
{
  return self->_ccore;
}

- (void)setCcore:(id)a3
{
  objc_storeStrong((id *)&self->_ccore, a3);
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (OS_xpc_object)client_con
{
  return self->_client_con;
}

- (void)setClient_con:(id)a3
{
  objc_storeStrong((id *)&self->_client_con, a3);
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (void)setDq:(id)a3
{
  objc_storeStrong((id *)&self->_dq, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSString)coll_description
{
  return self->_coll_description;
}

- (void)setColl_description:(id)a3
{
  objc_storeStrong((id *)&self->_coll_description, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coll_description, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dq, 0);
  objc_storeStrong((id *)&self->_client_con, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_ccore, 0);
}

- (void)initForUser:(int)a1 .cold.1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_2126F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "No endpoint for user %d", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_1_5();
}

void __25__Collation_initForUser___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_2126F8000, a2, OS_LOG_TYPE_ERROR, "Client message returned error %s", (uint8_t *)&v2, 0xCu);
}

void __25__Collation_initForUser___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2126F8000, a1, a3, "Unknown XPC type", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_5();
}

- (void)package
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

@end
