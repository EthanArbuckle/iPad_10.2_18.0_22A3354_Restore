@implementation TailspinSymbolicationClient

- (id)symbolicateUUID:(id)a3 pid:(int)a4 path:(id)a5 offsets:(id)a6 options:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!self->_connection)
    -[TailspinSymbolicationClient _initConnection](self, "_initConnection");
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_1;
  v19[3] = &unk_251966078;
  v19[4] = &v20;
  objc_msgSend(v16, "symbolicateUUID:pid:path:offsets:options:completionBlock:", v12, v10, v13, v14, v15, v19);

  v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

void __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_cold_1(a2);
}

void __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_1_cold_1(v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_initConnection
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.tailspin.symbolicationserver"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257717828);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v3);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_7);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_9);
  -[TailspinSymbolicationClient setConnection:](self, "setConnection:", v5);
  -[TailspinSymbolicationClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

}

void __46__TailspinSymbolicationClient__initConnection__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_247EA4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "XPC connection invalidated.", v0, 2u);
  }
}

void __46__TailspinSymbolicationClient__initConnection__block_invoke_8()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __46__TailspinSymbolicationClient__initConnection__block_invoke_8_cold_1();
}

- (void)invalidateConnection
{
  NSXPCConnection *connection;

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection invalidate](connection, "invalidate");
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

void __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_cold_1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_247EA4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Received error from call to symbolication server: %@", (uint8_t *)&v2, 0xCu);

}

void __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_1_cold_1(void *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = objc_msgSend(a1, "length");
  _os_log_debug_impl(&dword_247EA4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Received reply from symbolication server with data of size %zu bytes", (uint8_t *)&v1, 0xCu);
}

void __46__TailspinSymbolicationClient__initConnection__block_invoke_8_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_247EA4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "XPC connection interrupted.", v0, 2u);
}

@end
