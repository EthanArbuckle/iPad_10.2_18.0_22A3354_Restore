@implementation SSDittoRemoteConnection

- (SSDittoRemoteConnection)init
{
  SSDittoRemoteConnection *v2;
  uint64_t v3;
  FBSOpenApplicationService *openApplicationService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSDittoRemoteConnection;
  v2 = -[SSDittoRemoteConnection init](&v6, sel_init);
  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v3 = objc_claimAutoreleasedReturnValue();
  openApplicationService = v2->_openApplicationService;
  v2->_openApplicationService = (FBSOpenApplicationService *)v3;

  return v2;
}

- (void)_sendAction:(id)a3
{
  -[SSDittoRemoteConnection _sendAction:completion:](self, "_sendAction:completion:", a3, 0);
}

- (void)_sendAction:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  FBSOpenApplicationService *openApplicationService;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x24BE38478];
  v8 = *MEMORY[0x24BE382A0];
  v18 = a3;
  v19[0] = v8;
  v9 = (void *)MEMORY[0x24BDBCE30];
  v10 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = *MEMORY[0x24BE382B8];
  v20[0] = v11;
  v20[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "optionsWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  openApplicationService = self->_openApplicationService;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __50__SSDittoRemoteConnection__sendAction_completion___block_invoke;
  v16[3] = &unk_24D06C098;
  v17 = v6;
  v15 = v6;
  -[FBSOpenApplicationService openApplication:withOptions:completion:](openApplicationService, "openApplication:withOptions:completion:", CFSTR("com.apple.ScreenshotServicesService"), v13, v16);

}

uint64_t __50__SSDittoRemoteConnection__sendAction_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  return result;
}

- (void)preheatDittoProcess
{
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213892000, v3, OS_LOG_TYPE_INFO, "Preheating Ditto process", v5, 2u);
  }

  v4 = objc_alloc_init(MEMORY[0x24BE0BD80]);
  -[SSDittoRemoteConnection _sendAction:](self, "_sendAction:", v4);

}

- (void)sendDittoProcessEnvironmentDescription:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SSScreenshotAction *v9;
  id v10;
  SSScreenshotAction *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bsSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [SSScreenshotAction alloc];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__SSDittoRemoteConnection_sendDittoProcessEnvironmentDescription_completion___block_invoke;
  v14[3] = &unk_24D06B900;
  v15 = v7;
  v10 = v7;
  v11 = -[SSScreenshotAction initWithInfo:timeout:forResponseOnQueue:withHandler:](v9, "initWithInfo:timeout:forResponseOnQueue:withHandler:", v8, 0, v14, 5.0);
  v12 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "loggableDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v13;
    _os_log_impl(&dword_213892000, v12, OS_LOG_TYPE_INFO, "Sending environment description %@", buf, 0xCu);

  }
  -[SSDittoRemoteConnection _sendAction:](self, "_sendAction:", v11);

}

void __77__SSDittoRemoteConnection_sendDittoProcessEnvironmentDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  os_log_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = os_log_create("com.apple.screenshotservices", "XPC");
  v6 = v5;
  if (v4)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __77__SSDittoRemoteConnection_sendDittoProcessEnvironmentDescription_completion___block_invoke_cold_1(v3);

  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_213892000, v6, OS_LOG_TYPE_INFO, "Heard back from service regarding environment description", v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendDittoProcessImageIdentifierUpdate:(id)a3
{
  id v4;
  void *v5;
  SSImageIdentifierAction *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "bsSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SSImageIdentifierAction initWithInfo:timeout:forResponseOnQueue:withHandler:]([SSImageIdentifierAction alloc], "initWithInfo:timeout:forResponseOnQueue:withHandler:", v5, 0, 0, 0.0);
  v7 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "loggableDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_213892000, v7, OS_LOG_TYPE_INFO, "Sending image identifier update %@", (uint8_t *)&v9, 0xCu);

  }
  -[SSDittoRemoteConnection _sendAction:](self, "_sendAction:", v6);

}

- (void)sendDittoProcessMetadataUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SSMetadataUpdateAction *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bsSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SSMetadataUpdateAction initWithInfo:timeout:forResponseOnQueue:withHandler:]([SSMetadataUpdateAction alloc], "initWithInfo:timeout:forResponseOnQueue:withHandler:", v8, 0, v7, 0.0);
  v10 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "loggableDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v11;
    _os_log_impl(&dword_213892000, v10, OS_LOG_TYPE_INFO, "Sending environment metadata update %@", buf, 0xCu);

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__SSDittoRemoteConnection_sendDittoProcessMetadataUpdate_completion___block_invoke;
  v13[3] = &unk_24D06BF48;
  v14 = v7;
  v12 = v7;
  -[SSDittoRemoteConnection _sendAction:completion:](self, "_sendAction:completion:", v9, v13);

}

uint64_t __69__SSDittoRemoteConnection_sendDittoProcessMetadataUpdate_completion___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

- (void)sendDittoProcessDocumentUpdate:(id)a3
{
  id v4;
  void *v5;
  SSDocumentUpdateAction *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "bsSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SSDocumentUpdateAction initWithInfo:timeout:forResponseOnQueue:withHandler:]([SSDocumentUpdateAction alloc], "initWithInfo:timeout:forResponseOnQueue:withHandler:", v5, 0, 0, 0.0);
  v7 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "loggableDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_213892000, v7, OS_LOG_TYPE_INFO, "Sending environment metadata update %@", (uint8_t *)&v9, 0xCu);

  }
  -[SSDittoRemoteConnection _sendAction:](self, "_sendAction:", v6);

}

- (void)sendDittoProcessPreheatRequestWithPresentationMode:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SSPreheatAction *v9;
  id v10;
  SSPreheatAction *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 9);

  v9 = [SSPreheatAction alloc];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __89__SSDittoRemoteConnection_sendDittoProcessPreheatRequestWithPresentationMode_completion___block_invoke;
  v13[3] = &unk_24D06B900;
  v14 = v6;
  v10 = v6;
  v11 = -[SSPreheatAction initWithInfo:timeout:forResponseOnQueue:withHandler:](v9, "initWithInfo:timeout:forResponseOnQueue:withHandler:", v7, 0, v13, 5.0);
  v12 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v16 = a3;
    _os_log_impl(&dword_213892000, v12, OS_LOG_TYPE_INFO, "Sending preheating request with presentation mode %td", buf, 0xCu);
  }

  -[SSDittoRemoteConnection _sendAction:](self, "_sendAction:", v11);
}

void __89__SSDittoRemoteConnection_sendDittoProcessPreheatRequestWithPresentationMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  os_log_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = os_log_create("com.apple.screenshotservices", "XPC");
  v6 = v5;
  if (v4)
  {
    v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __89__SSDittoRemoteConnection_sendDittoProcessPreheatRequestWithPresentationMode_completion___block_invoke_cold_1(v3);

  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_213892000, v6, OS_LOG_TYPE_INFO, "Heard back from service regarding preheating environment description", v9, 2u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openApplicationService, 0);
}

void __77__SSDittoRemoteConnection_sendDittoProcessEnvironmentDescription_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_213892000, v2, v3, "Didn't hear back from service regarding environment description with error %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

void __89__SSDittoRemoteConnection_sendDittoProcessPreheatRequestWithPresentationMode_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_213892000, v2, v3, "Didn't hear back from service regarding preheating presentation mode with error %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

@end
