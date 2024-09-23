@implementation RMBaseStore

- (RMBaseStore)initWithIdentifier:(id)a3 type:(int64_t)a4 scope:(int64_t)a5 name:(id)a6 description:(id)a7 enrollmentURL:(id)a8 accountIdentifier:(id)a9 defaultToInteractive:(BOOL)a10 dataSeparated:(BOOL)a11 personaIdentifier:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  RMBaseStore *v21;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *accountIdentifier;
  id v29;
  objc_super v30;

  v29 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a12;
  v30.receiver = self;
  v30.super_class = (Class)RMBaseStore;
  v21 = -[RMBaseStore init](&v30, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v29, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v21->_type = a4;
    v21->_scope = a5;
    objc_storeStrong((id *)&v21->_name, a6);
    objc_storeStrong((id *)&v21->_storeDescription, a7);
    objc_storeStrong((id *)&v21->_enrollmentURL, a8);
    v24 = objc_msgSend(v19, "copy");
    accountIdentifier = v21->_accountIdentifier;
    v21->_accountIdentifier = (NSString *)v24;

    v21->_defaultToInteractive = a10;
    v21->_dataSeparated = a11;
    objc_storeStrong((id *)&v21->_personaIdentifier, a12);
  }

  return v21;
}

- (BOOL)isManagedStore
{
  return -[RMBaseStore type](self, "type") != 2;
}

- (void)declarationManifestWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke;
  v14[3] = &unk_25162EF90;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_20;
  v12[3] = &unk_25162EFE0;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "declarationManifestForStoreIdentifier:completionHandler:", v10, v12);

}

void __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_20_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched declaration manifest", v8, 2u);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (void)declarationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_25162EF90;
  v11 = v6;
  v18 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_22;
  v15[3] = &unk_25162F008;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v12, "declarationWithIdentifier:storeIdentifier:completionHandler:", v7, v13, v15);

}

void __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_22_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched declaration", v8, 2u);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (void)declarationsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke;
  v14[3] = &unk_25162EF90;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_24;
  v12[3] = &unk_25162F030;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "declarationsForStoreIdentifier:completionHandler:", v10, v12);

}

void __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_24_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched declarations", v8, 2u);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (void)declarationsWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke;
  v17[3] = &unk_25162EF90;
  v11 = v6;
  v18 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_26;
  v15[3] = &unk_25162F030;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v12, "declarationsWithTypes:storeIdentifier:completionHandler:", v7, v13, v15);

}

void __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_26_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched declarations with types", v8, 2u);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (BOOL)isValidDeclaration:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BE7EBF0];
  v5 = a3;
  v6 = objc_msgSend(v4, "currentPlatform");
  v7 = -[RMBaseStore scope](self, "scope");
  v8 = -[RMBaseStore type](self, "type");
  v9 = (void *)objc_opt_class();

  return objc_msgSend(v9, "isSupportedForPlatform:scope:enrollmentType:", v6, v7, v8);
}

- (void)setShouldInstallConfiguration:(id)a3 shouldInstall:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke;
  v19[3] = &unk_25162EF90;
  v13 = v8;
  v20 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_27;
  v17[3] = &unk_25162EF18;
  v17[4] = self;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v14, "setShouldInstallConfiguration:shouldInstall:storeIdentifier:completionHandler:", v9, v5, v15, v17);

}

void __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  uint8_t v5[16];

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_27_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Set shouldInstallConfiguration", v5, 2u);
    }
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (void)fetchDataAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke;
  v17[3] = &unk_25162EF90;
  v11 = v6;
  v18 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[RMBaseStore identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_28;
  v15[3] = &unk_25162F058;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v12, "fetchDataAtURL:storeIdentifier:completionHandler:", v7, v13, v15);

}

void __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_28_cold_1();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetched data for URL", v8, 2u);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");

}

- (id)metadataReturningError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;

  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24[0] = &v23;
  v24[1] = 0x3032000000;
  v24[2] = __Block_byref_object_copy_;
  v24[3] = __Block_byref_object_dispose_;
  v25 = 0;
  v20 = 0;
  v21[0] = &v20;
  v21[1] = 0x3032000000;
  v21[2] = __Block_byref_object_copy_;
  v21[3] = __Block_byref_object_dispose_;
  v22 = 0;
  -[RMBaseStore identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __38__RMBaseStore_metadataReturningError___block_invoke_30;
  v19[3] = &unk_25162F0A0;
  v19[4] = &v23;
  v19[5] = &v20;
  objc_msgSend(v7, "metadataForStoreIdentifier:completionHandler:", v8, v19);

  if (*(_QWORD *)(v21[0] + 40))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[RMBaseStore metadataReturningError:].cold.2((uint64_t)v21, v9, v10, v11, v12, v13, v14, v15);
      if (!a3)
        goto LABEL_10;
    }
    else if (!a3)
    {
      goto LABEL_10;
    }
    v16 = *(void **)(v21[0] + 40);
    if (v16)
    {
      v17 = 0;
      *a3 = objc_retainAutorelease(v16);
      goto LABEL_11;
    }
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[RMBaseStore metadataReturningError:].cold.1((uint64_t)v24);
  v17 = *(id *)(v24[0] + 40);
LABEL_11:
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v23, 8);
  return v17;
}

void __38__RMBaseStore_metadataReturningError___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __38__RMBaseStore_metadataReturningError___block_invoke_cold_1();
}

void __38__RMBaseStore_metadataReturningError___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)metadataValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[4];
  id v30;

  v6 = a3;
  -[RMBaseStore xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __41__RMBaseStore_metadataValueForKey_error___block_invoke;
  v29[3] = &unk_25162F0C8;
  v10 = v6;
  v30 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  -[RMBaseStore identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __41__RMBaseStore_metadataValueForKey_error___block_invoke_32;
  v16[3] = &unk_25162F0F0;
  v16[4] = &v23;
  v16[5] = &v17;
  objc_msgSend(v11, "metadataValueForKey:storeIdentifier:completionHandler:", v10, v12, v16);

  if (v18[5])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[RMBaseStore metadataValueForKey:error:].cold.2();
      if (!a4)
        goto LABEL_10;
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    v13 = (void *)v18[5];
    if (v13)
    {
      v14 = 0;
      *a4 = objc_retainAutorelease(v13);
      goto LABEL_11;
    }
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[RMBaseStore metadataValueForKey:error:].cold.1();
  v14 = (id)v24[5];
LABEL_11:
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __41__RMBaseStore_metadataValueForKey_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __41__RMBaseStore_metadataValueForKey_error___block_invoke_cold_1(a1, a2, v4, v5, v6, v7, v8, v9);
}

void __41__RMBaseStore_metadataValueForKey_error___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMBaseStore)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  RMBaseStore *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"));
  v17 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("scope"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enrollmentURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultToInteractive"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataSeparated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v16) = v12;
  LOBYTE(v16) = v10;
  v14 = -[RMBaseStore initWithIdentifier:type:scope:name:description:enrollmentURL:accountIdentifier:defaultToInteractive:dataSeparated:personaIdentifier:](self, "initWithIdentifier:type:scope:name:description:enrollmentURL:accountIdentifier:defaultToInteractive:dataSeparated:personaIdentifier:", v4, v18, v17, v5, v6, v7, v8, v16, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[RMBaseStore identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v4, CFSTR("identifier"));

  objc_msgSend(v17, "encodeInteger:forKey:", -[RMBaseStore type](self, "type"), CFSTR("type"));
  objc_msgSend(v17, "encodeInteger:forKey:", -[RMBaseStore scope](self, "scope"), CFSTR("scope"));
  -[RMBaseStore name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RMBaseStore name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("name"));

  }
  -[RMBaseStore storeDescription](self, "storeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RMBaseStore storeDescription](self, "storeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v8, CFSTR("description"));

  }
  -[RMBaseStore enrollmentURL](self, "enrollmentURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[RMBaseStore enrollmentURL](self, "enrollmentURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v10, CFSTR("enrollmentURL"));

  }
  -[RMBaseStore accountIdentifier](self, "accountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[RMBaseStore accountIdentifier](self, "accountIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v12, CFSTR("accountIdentifier"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[RMBaseStore defaultToInteractive](self, "defaultToInteractive"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("defaultToInteractive"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[RMBaseStore dataSeparated](self, "dataSeparated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v14, CFSTR("dataSeparated"));

  -[RMBaseStore personaIdentifier](self, "personaIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[RMBaseStore personaIdentifier](self, "personaIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v16, CFSTR("personaIdentifier"));

  }
}

- (BOOL)isEqualToStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v37;
  void *v38;
  id v39;

  v4 = a3;
  -[RMBaseStore identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = -[RMBaseStore type](self, "type");
    if (v7 == objc_msgSend(v4, "type"))
    {
      -[RMBaseStore name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {

      }
      else
      {
        v13 = 0;
        v14 = v11;
        v15 = v10;
        if (!v10 || !v11)
          goto LABEL_35;
        v16 = objc_msgSend(v10, "isEqual:", v11);

        if (!v16)
        {
          v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
      }
      -[RMBaseStore storeDescription](self, "storeDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "storeDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      v19 = v18;
      v14 = v19;
      if (v15 == v19)
      {

      }
      else
      {
        v13 = 0;
        v20 = v19;
        v21 = v15;
        if (!v15 || !v19)
          goto LABEL_34;
        v22 = objc_msgSend(v15, "isEqual:", v19);

        if (!v22)
        {
          v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
      }
      -[RMBaseStore accountIdentifier](self, "accountIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v23;
      v25 = v24;
      v39 = v25;
      if (v21 == v25)
      {

      }
      else
      {
        v13 = 0;
        if (!v21)
        {
          v26 = v25;
          v27 = 0;
          goto LABEL_32;
        }
        v26 = v25;
        v27 = v21;
        if (!v25)
        {
LABEL_32:
          v35 = v27;

          goto LABEL_33;
        }
        v28 = v25;
        LODWORD(v37) = objc_msgSend(v21, "isEqual:", v25);

        if (!(_DWORD)v37)
        {
LABEL_24:
          v13 = 0;
LABEL_33:
          v20 = v39;
LABEL_34:

          goto LABEL_35;
        }
      }
      v29 = -[RMBaseStore defaultToInteractive](self, "defaultToInteractive", v37);
      if (v29 != objc_msgSend(v4, "defaultToInteractive"))
        goto LABEL_24;
      v30 = -[RMBaseStore dataSeparated](self, "dataSeparated");
      if (v30 != objc_msgSend(v4, "dataSeparated"))
        goto LABEL_24;
      -[RMBaseStore personaIdentifier](self, "personaIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "personaIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v31;
      v34 = v32;
      v38 = v34;
      if (v33 == v34)
      {
        v13 = 1;
      }
      else
      {
        v13 = 0;
        if (v33 && v34)
          v13 = objc_msgSend(v33, "isEqual:", v34);
      }

      v26 = v38;
      v27 = v33;
      goto LABEL_32;
    }
  }
  v13 = 0;
LABEL_37:

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)storeDescription
{
  return self->_storeDescription;
}

- (void)setStoreDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)enrollmentURL
{
  return self->_enrollmentURL;
}

- (void)setEnrollmentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)defaultToInteractive
{
  return self->_defaultToInteractive;
}

- (void)setDefaultToInteractive:(BOOL)a3
{
  self->_defaultToInteractive = a3;
}

- (BOOL)dataSeparated
{
  return self->_dataSeparated;
}

- (void)setDataSeparated:(BOOL)a3
{
  self->_dataSeparated = a3;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (void)setPersonaIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (RMStoreXPCConnection)xpcConnection
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
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_enrollmentURL, 0);
  objc_storeStrong((id *)&self->_storeDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching declaration manifest: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __56__RMBaseStore_declarationManifestWithCompletionHandler___block_invoke_20_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch declaration manifest: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching declaration: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __59__RMBaseStore_declarationWithIdentifier_completionHandler___block_invoke_22_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch declaration: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching declarations: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __49__RMBaseStore_declarationsWithCompletionHandler___block_invoke_24_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch declarations: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while fetching declarations with types: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __55__RMBaseStore_declarationsWithTypes_completionHandler___block_invoke_26_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch declarations with types: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while setting shouldInstallConfiguration: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __77__RMBaseStore_setShouldInstallConfiguration_shouldInstall_completionHandler___block_invoke_27_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to set shouldInstallConfiguration: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while setting fetchDataAtURL: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __48__RMBaseStore_fetchDataAtURL_completionHandler___block_invoke_28_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to fetch data for URL: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)metadataReturningError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v2 = 138543362;
  v3 = v1;
  _os_log_debug_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Read all metadata: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)metadataReturningError:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], a3, "Failed to read all metadata: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __38__RMBaseStore_metadataReturningError___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed XPC connection while reading all metadata: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)metadataValueForKey:error:.cold.1()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_245188000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Read metadata key %{public}@: %{public}@", v0, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)metadataValueForKey:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_245188000, MEMORY[0x24BDACB70], v0, "Failed to read metadata key %{public}@: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __41__RMBaseStore_metadataValueForKey_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_245188000, MEMORY[0x24BDACB70], a3, "Failed XPC connection while reading metadata key %{public}@: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
