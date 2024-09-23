@implementation STWebUsageController

- (STWebUsageController)init
{
  STWebUsageController *v2;
  STPrivateServiceClient *v3;
  STPrivateServiceClient *privateServiceClient;
  NSXPCConnection *v5;
  NSXPCConnection *xpcConnection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STWebUsageController;
  v2 = -[STWebUsageController init](&v8, sel_init);
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = objc_alloc_init(STPrivateServiceClient);
      privateServiceClient = v2->_privateServiceClient;
      v2->_privateServiceClient = v3;

    }
    else
    {
      v5 = +[STScreenTimeAgentPrivateConnection newConnection](STScreenTimeAgentPrivateConnection, "newConnection");
      xpcConnection = v2->_xpcConnection;
      v2->_xpcConnection = v5;

      -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if ((_os_feature_enabled_impl() & 1) == 0)
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STWebUsageController;
  -[STWebUsageController dealloc](&v3, sel_dealloc);
}

- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  STWebUsageController *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_os_feature_enabled_impl())
  {
    -[STWebUsageController privateServiceClient](self, "privateServiceClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteWebHistoryForURL:application:completionHandler:", v8, v9, v10);

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__STWebUsageController_deleteWebHistoryForURL_application_completionHandler___block_invoke;
    v12[3] = &unk_1E9371F70;
    v13 = v8;
    v14 = v9;
    v15 = self;
    v16 = v10;
    -[STWebUsageController _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v12);

  }
}

void __77__STWebUsageController_deleteWebHistoryForURL_application_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = a1[4];
    v8 = a1[5];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__STWebUsageController_deleteWebHistoryForURL_application_completionHandler___block_invoke_2;
    v11[3] = &unk_1E9370B40;
    v9 = (void *)a1[7];
    v11[4] = a1[6];
    v12 = v9;
    objc_msgSend(v5, "deleteWebHistoryForURL:webApplication:replyHandler:", v7, v8, v11);

  }
  else
  {
    v10 = a1[7];
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }

}

uint64_t __77__STWebUsageController_deleteWebHistoryForURL_application_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  STWebUsageController *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_os_feature_enabled_impl())
  {
    -[STWebUsageController privateServiceClient](self, "privateServiceClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteWebHistoryForURLs:application:completionHandler:", v8, v9, v10);

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__STWebUsageController_deleteWebHistoryForURLs_application_completionHandler___block_invoke;
    v12[3] = &unk_1E9371F70;
    v13 = v8;
    v14 = v9;
    v15 = self;
    v16 = v10;
    -[STWebUsageController _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v12);

  }
}

void __78__STWebUsageController_deleteWebHistoryForURLs_application_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = a1[4];
    v8 = a1[5];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__STWebUsageController_deleteWebHistoryForURLs_application_completionHandler___block_invoke_2;
    v11[3] = &unk_1E9370B40;
    v9 = (void *)a1[7];
    v11[4] = a1[6];
    v12 = v9;
    objc_msgSend(v5, "deleteWebHistoryForURLs:webApplication:replyHandler:", v7, v8, v11);

  }
  else
  {
    v10 = a1[7];
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }

}

uint64_t __78__STWebUsageController_deleteWebHistoryForURLs_application_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  STWebUsageController *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_os_feature_enabled_impl())
  {
    -[STWebUsageController privateServiceClient](self, "privateServiceClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteWebHistoryForDomain:application:completionHandler:", v8, v9, v10);

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__STWebUsageController_deleteWebHistoryForDomain_application_completionHandler___block_invoke;
    v12[3] = &unk_1E9371F70;
    v13 = v8;
    v14 = v9;
    v15 = self;
    v16 = v10;
    -[STWebUsageController _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v12);

  }
}

void __80__STWebUsageController_deleteWebHistoryForDomain_application_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = a1[4];
    v8 = a1[5];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__STWebUsageController_deleteWebHistoryForDomain_application_completionHandler___block_invoke_2;
    v11[3] = &unk_1E9370B40;
    v9 = (void *)a1[7];
    v11[4] = a1[6];
    v12 = v9;
    objc_msgSend(v5, "deleteWebHistoryForDomain:webApplication:replyHandler:", v7, v8, v11);

  }
  else
  {
    v10 = a1[7];
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }

}

uint64_t __80__STWebUsageController_deleteWebHistoryForDomain_application_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  STWebUsageController *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_os_feature_enabled_impl())
  {
    -[STWebUsageController privateServiceClient](self, "privateServiceClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteWebHistoryDuringInterval:application:completionHandler:", v8, v9, v10);

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__STWebUsageController_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke;
    v12[3] = &unk_1E9371F70;
    v13 = v8;
    v14 = v9;
    v15 = self;
    v16 = v10;
    -[STWebUsageController _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v12);

  }
}

void __85__STWebUsageController_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = a1[4];
    v8 = a1[5];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__STWebUsageController_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_2;
    v11[3] = &unk_1E9370B40;
    v9 = (void *)a1[7];
    v11[4] = a1[6];
    v12 = v9;
    objc_msgSend(v5, "deleteWebHistoryDuringInterval:webApplication:replyHandler:", v7, v8, v11);

  }
  else
  {
    v10 = a1[7];
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }

}

uint64_t __85__STWebUsageController_deleteWebHistoryDuringInterval_application_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteAllWebHistoryForApplication:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  STWebUsageController *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl())
  {
    -[STWebUsageController privateServiceClient](self, "privateServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteAllWebHistoryForApplication:completionHandler:", v6, v7);

  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__STWebUsageController_deleteAllWebHistoryForApplication_completionHandler___block_invoke;
    v9[3] = &unk_1E9371F98;
    v10 = v6;
    v11 = self;
    v12 = v7;
    -[STWebUsageController _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v9);

  }
}

void __76__STWebUsageController_deleteAllWebHistoryForApplication_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__STWebUsageController_deleteAllWebHistoryForApplication_completionHandler___block_invoke_2;
    v9[3] = &unk_1E9370B40;
    v7 = *(_QWORD *)(a1 + 32);
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "deleteAllWebApplicationHistory:replyHandler:", v7, v9);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }

}

uint64_t __76__STWebUsageController_deleteAllWebHistoryForApplication_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteWebHistoryForURL:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  STWebUsageController *v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (_os_feature_enabled_impl())
  {
    -[STWebUsageController privateServiceClient](self, "privateServiceClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deleteWebHistoryForURL:application:profileIdentifier:completionHandler:", v10, v11, v12, v13);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__STWebUsageController_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E9371FC0;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = self;
    v20 = v13;
    -[STWebUsageController _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v15);

  }
}

void __95__STWebUsageController_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __95__STWebUsageController_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke_2;
    v11[3] = &unk_1E9370B40;
    v9 = *(_QWORD *)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v5, "deleteWebHistoryForURL:webApplication:profileIdentifier:replyHandler:", v7, v8, v9, v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }

}

uint64_t __95__STWebUsageController_deleteWebHistoryForURL_application_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteWebHistoryForURLs:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  STWebUsageController *v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (_os_feature_enabled_impl())
  {
    -[STWebUsageController privateServiceClient](self, "privateServiceClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deleteWebHistoryForURLs:application:profileIdentifier:completionHandler:", v10, v11, v12, v13);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __96__STWebUsageController_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E9371FC0;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = self;
    v20 = v13;
    -[STWebUsageController _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v15);

  }
}

void __96__STWebUsageController_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __96__STWebUsageController_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke_2;
    v11[3] = &unk_1E9370B40;
    v9 = *(_QWORD *)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v5, "deleteWebHistoryForURLs:webApplication:profileIdentifier:replyHandler:", v7, v8, v9, v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }

}

uint64_t __96__STWebUsageController_deleteWebHistoryForURLs_application_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteWebHistoryForDomain:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  STWebUsageController *v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (_os_feature_enabled_impl())
  {
    -[STWebUsageController privateServiceClient](self, "privateServiceClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deleteWebHistoryForDomain:application:profileIdentifier:completionHandler:", v10, v11, v12, v13);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __98__STWebUsageController_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E9371FC0;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = self;
    v20 = v13;
    -[STWebUsageController _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v15);

  }
}

void __98__STWebUsageController_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __98__STWebUsageController_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke_2;
    v11[3] = &unk_1E9370B40;
    v9 = *(_QWORD *)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v5, "deleteWebHistoryForDomain:webApplication:profileIdentifier:replyHandler:", v7, v8, v9, v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }

}

uint64_t __98__STWebUsageController_deleteWebHistoryForDomain_application_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteWebHistoryDuringInterval:(id)a3 application:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  STWebUsageController *v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (_os_feature_enabled_impl())
  {
    -[STWebUsageController privateServiceClient](self, "privateServiceClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deleteWebHistoryDuringInterval:application:profileIdentifier:completionHandler:", v10, v11, v12, v13);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __103__STWebUsageController_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E9371FC0;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = self;
    v20 = v13;
    -[STWebUsageController _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v15);

  }
}

void __103__STWebUsageController_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __103__STWebUsageController_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke_2;
    v11[3] = &unk_1E9370B40;
    v9 = *(_QWORD *)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v5, "deleteWebHistoryDuringInterval:webApplication:profileIdentifier:replyHandler:", v7, v8, v9, v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }

}

uint64_t __103__STWebUsageController_deleteWebHistoryDuringInterval_application_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteAllWebHistoryForApplication:(id)a3 profileIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  STWebUsageController *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_os_feature_enabled_impl())
  {
    -[STWebUsageController privateServiceClient](self, "privateServiceClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteAllWebHistoryForApplication:profileIdentifier:completionHandler:", v8, v9, v10);

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __94__STWebUsageController_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke;
    v12[3] = &unk_1E9371F70;
    v13 = v8;
    v14 = v9;
    v15 = self;
    v16 = v10;
    -[STWebUsageController _asynchronousProxyWithHandler:](self, "_asynchronousProxyWithHandler:", v12);

  }
}

void __94__STWebUsageController_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = a1[4];
    v8 = a1[5];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__STWebUsageController_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke_2;
    v11[3] = &unk_1E9370B40;
    v9 = (void *)a1[7];
    v11[4] = a1[6];
    v12 = v9;
    objc_msgSend(v5, "deleteAllWebApplicationHistory:profileIdentifier:replyHandler:", v7, v8, v11);

  }
  else
  {
    v10 = a1[7];
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }

}

uint64_t __94__STWebUsageController_deleteAllWebHistoryForApplication_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_asynchronousProxyWithHandler:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[STWebUsageController xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__STWebUsageController__asynchronousProxyWithHandler___block_invoke;
  v8[3] = &unk_1E9370BE0;
  v9 = v4;
  v6 = (void (**)(id, void *, _QWORD))v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

}

void __54__STWebUsageController__asynchronousProxyWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[STLog ask](STLog, "ask");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__STWebUsageController__asynchronousProxyWithHandler___block_invoke_cold_1((uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (STPrivateServiceClient)privateServiceClient
{
  return self->_privateServiceClient;
}

- (void)setPrivateServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_privateServiceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateServiceClient, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __54__STWebUsageController__asynchronousProxyWithHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = CFSTR("com.apple.ScreenTimeAgent.private");
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "Connection error from %{public}@: %{public}@", (uint8_t *)&v2, 0x16u);
}

@end
