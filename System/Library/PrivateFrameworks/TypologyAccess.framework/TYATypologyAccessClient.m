@implementation TYATypologyAccessClient

- (TYATypologyAccessClient)init
{
  return -[TYATypologyAccessClient initWithAccessMode:](self, "initWithAccessMode:", 0);
}

- (TYATypologyAccessClient)initWithAccessMode:(unint64_t)a3
{
  TYATypologyAccessClient *v4;
  TYATypologyAccessClient *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TYATypologyAccessClient;
  v4 = -[TYATypologyAccessClient init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[TYATypologyAccessClient _initializeConnection](v4, "_initializeConnection");
    -[TYATypologyAccessClient _setTypologyAccessMode:](v5, "_setTypologyAccessMode:", a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[TYATypologyAccessClient _disconnect](self, "_disconnect");
  v3.receiver = self;
  v3.super_class = (Class)TYATypologyAccessClient;
  -[TYATypologyAccessClient dealloc](&v3, sel_dealloc);
}

- (void)_initializeConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  void *v7;
  uint8_t v8[16];

  TYALog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_227147000, v3, OS_LOG_TYPE_INFO, "Client is establishing connection to server.", v8, 2u);
  }

  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.typologyAccess"), 0);
  connection = self->_connection;
  self->_connection = v4;

  v6 = self->_connection;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2558C4A30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

  -[NSXPCConnection resume](self->_connection, "resume");
}

- (void)_disconnect
{
  NSObject *v3;
  NSXPCConnection *connection;
  uint8_t v5[16];

  if (self->_connection)
  {
    TYALog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_227147000, v3, OS_LOG_TYPE_INFO, "Client is disconnecting from server.", v5, 2u);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    connection = self->_connection;
    self->_connection = 0;

  }
}

- (void)enumerateTypologyLogs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[TYATypologyAccessClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke;
  v11[3] = &unk_24EF6A860;
  v11[4] = &v12;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startEnumeration");
  if (v7 && !*((_BYTE *)v13 + 24))
  {
    do
    {
      v8[0] = v6;
      v8[1] = 3221225472;
      v8[2] = __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_17;
      v8[3] = &unk_24EF6A888;
      v10 = &v12;
      v9 = v4;
      objc_msgSend(v7, "nextTypologyURL:", v8);

    }
    while (!*((_BYTE *)v13 + 24));
  }

  _Block_object_dispose(&v12, 8);
}

void __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TYALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_cold_1(v3);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

void __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  TYATypologyURLHandle *v7;

  if (a2)
  {
    v5 = a3;
    v6 = a2;
    v7 = -[TYATypologyURLHandle initWithURL:sandboxExtensionToken:]([TYATypologyURLHandle alloc], "initWithURL:sandboxExtensionToken:", v6, v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)removeTypologyFileWithURLHandle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v6 = a3;
  -[TYATypologyAccessClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__TYATypologyAccessClient_removeTypologyFileWithURLHandle_error___block_invoke;
  v15[3] = &unk_24EF6A860;
  v15[4] = &v20;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "filename");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __65__TYATypologyAccessClient_removeTypologyFileWithURLHandle_error___block_invoke_20;
  v14[3] = &unk_24EF6A8B0;
  v14[4] = &v16;
  v14[5] = &v20;
  objc_msgSend(v9, "removeTypologyFileWithName:completion:", v10, v14);

  if (a4)
  {
    v11 = (void *)v21[5];
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
  v12 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __65__TYATypologyAccessClient_removeTypologyFileWithURLHandle_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  TYALog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_cold_1(v4);

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __65__TYATypologyAccessClient_removeTypologyFileWithURLHandle_error___block_invoke_20(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

- (void)_setTypologyAccessMode:(unint64_t)a3
{
  void *v4;
  id v5;

  -[TYATypologyAccessClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTypologyAccessMode:", a3);
}

void __50__TYATypologyAccessClient__setTypologyAccessMode___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TYALog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_cold_1(v2);

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

- (BOOL)removeAllTypologyFilesWithError:(id *)a3
{
  void *v4;
  char v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__TYATypologyAccessClient_TestSupport__removeAllTypologyFilesWithError___block_invoke;
  v7[3] = &unk_24EF6A918;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  -[TYATypologyAccessClient enumerateTypologyLogs:](self, "enumerateTypologyLogs:", v7);
  if (a3)
  {
    v4 = (void *)v9[5];
    if (v4)
      *a3 = objc_retainAutorelease(v4);
  }
  v5 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __72__TYATypologyAccessClient_TestSupport__removeAllTypologyFilesWithError___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = *(_QWORD *)(a1[5] + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    v4 = (void *)a1[4];
    v5 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v5 + 40);
    v6 = objc_msgSend(v4, "removeTypologyFileWithURLHandle:error:", a2, &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    v2 = *(_QWORD *)(a1[5] + 8);
  }
  else
  {
    v6 = 0;
  }
  *(_BYTE *)(v2 + 24) = v6;
}

- (BOOL)writeData:(id)a3 toTypologyFileWithName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v8 = a4;
  v9 = a3;
  -[TYATypologyAccessClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __79__TYATypologyAccessClient_TestSupport__writeData_toTypologyFileWithName_error___block_invoke;
  v21[3] = &unk_24EF6A860;
  v21[4] = &v22;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __79__TYATypologyAccessClient_TestSupport__writeData_toTypologyFileWithName_error___block_invoke_41;
  v16[3] = &unk_24EF6A8B0;
  v16[4] = &v22;
  v16[5] = &v17;
  objc_msgSend(v12, "writeData:toTypologyFileWithName:completion:", v9, v8, v16);

  if (a5)
  {
    v13 = (void *)v23[5];
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  v14 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __79__TYATypologyAccessClient_TestSupport__writeData_toTypologyFileWithName_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  TYALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __79__TYATypologyAccessClient_TestSupport__writeData_toTypologyFileWithName_error___block_invoke_41(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

void __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "description");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_2(v2, v3);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_227147000, v4, v5, "Remote object proxy error: %{private}s", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

@end
