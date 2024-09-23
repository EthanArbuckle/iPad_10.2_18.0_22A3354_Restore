@implementation PKPassKitServicesXPCService

- (PKPassKitServicesXPCService)init
{
  PKPassKitServicesXPCService *v2;
  PKPassKitServicesXPCService *v3;
  uint64_t v4;
  NSXPCConnection *connection;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassKitServicesXPCService;
  v2 = -[PKPassKitServicesXPCService init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PKPassKitServicesXPCService _createConnection](v2, "_createConnection");
    v4 = objc_claimAutoreleasedReturnValue();
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPassKitServicesXPCService _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPassKitServicesXPCService;
  -[PKPassKitServicesXPCService dealloc](&v3, sel_dealloc);
}

- (void)snapshotDataForPassUniqueIdentifier:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    if (objc_msgSend(v9, "length"))
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __83__PKPassKitServicesXPCService_snapshotDataForPassUniqueIdentifier_size_completion___block_invoke;
      v13[3] = &unk_24DBBFF00;
      v11 = v10;
      v14 = v11;
      -[PKPassKitServicesXPCService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageDataForPassUniqueIdentifier:size:completion:", v9, v11, width, height);

    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

void __83__PKPassKitServicesXPCService_snapshotDataForPassUniqueIdentifier_size_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_219BFC000, v4, OS_LOG_TYPE_DEFAULT, "Failed to connect to PassKitServicesXPCService: %@.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)imageDataForTransaction:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    if (v9)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __71__PKPassKitServicesXPCService_imageDataForTransaction_size_completion___block_invoke;
      v14[3] = &unk_24DBBFF00;
      v12 = v10;
      v15 = v12;
      -[PKPassKitServicesXPCService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageDataForTransaction:size:completion:", v9, v12, width, height);

    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

void __71__PKPassKitServicesXPCService_imageDataForTransaction_size_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_219BFC000, v4, OS_LOG_TYPE_DEFAULT, "Failed to connect to PassKitServicesXPCService: %@.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)imageDataForRecurringPaymentMemo:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    if (v9)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __80__PKPassKitServicesXPCService_imageDataForRecurringPaymentMemo_size_completion___block_invoke;
      v14[3] = &unk_24DBBFF00;
      v12 = v10;
      v15 = v12;
      -[PKPassKitServicesXPCService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageDataForRecurringPaymentMemo:size:completion:", v9, v12, width, height);

    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

void __80__PKPassKitServicesXPCService_imageDataForRecurringPaymentMemo_size_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_219BFC000, v4, OS_LOG_TYPE_DEFAULT, "Failed to connect to PassKitServicesXPCService: %@.", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_createConnection
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.PassKitServicesXPCService"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550B0C70);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__PKPassKitServicesXPCService__createConnection__block_invoke;
  v9[3] = &unk_24DBBFF28;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __48__PKPassKitServicesXPCService__createConnection__block_invoke_2;
  v7[3] = &unk_24DBBFF28;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_msgSend(v3, "resume");
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v3;
}

void __48__PKPassKitServicesXPCService__createConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219BFC000, v2, OS_LOG_TYPE_DEFAULT, "PKPassKitServicesXPCService connection interrupted", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__PKPassKitServicesXPCService__createConnection__block_invoke_19;
  block[3] = &unk_24DBBFF28;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v4);
}

void __48__PKPassKitServicesXPCService__createConnection__block_invoke_19(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidate");

}

void __48__PKPassKitServicesXPCService__createConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219BFC000, v2, OS_LOG_TYPE_DEFAULT, "PKPassKitServicesXPCService connection invalidated", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__PKPassKitServicesXPCService__createConnection__block_invoke_21;
  block[3] = &unk_24DBBFF28;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v4);
}

void __48__PKPassKitServicesXPCService__createConnection__block_invoke_21(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidate");

}

- (void)_invalidate
{
  NSXPCConnection *connection;

  if (!self->_connection)
  {
    objc_msgSend(0, "invalidate");
    connection = self->_connection;
    self->_connection = 0;

  }
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
