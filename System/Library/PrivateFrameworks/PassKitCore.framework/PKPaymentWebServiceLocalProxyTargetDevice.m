@implementation PKPaymentWebServiceLocalProxyTargetDevice

- (PKPaymentWebServiceLocalProxyTargetDevice)initWithConnection:(id)a3
{
  id v5;
  PKPaymentWebServiceLocalProxyTargetDevice *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *handlerQueue;
  NSXPCConnection *connection;
  void *v10;
  void *v11;
  NSXPCConnection *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSXPCConnection *v16;
  id v17;
  NSObject *v18;
  NSXPCConnection *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  objc_super v28;
  uint8_t buf[4];
  NSXPCConnection *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentWebServiceLocalProxyTargetDevice;
  v6 = -[PKPaymentWebServiceLocalProxyTargetDevice init](&v28, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.passkit.localTargetDeviceHandlerQueue", MEMORY[0x1E0C80D50]);
    handlerQueue = v6->_handlerQueue;
    v6->_handlerQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_connection, a3);
    connection = v6->_connection;
    PKPaymentWebServiceProxyObjectInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](connection, "setRemoteObjectInterface:", v10);

    -[NSXPCConnection invalidationHandler](v6->_connection, "invalidationHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6->_connection;
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __64__PKPaymentWebServiceLocalProxyTargetDevice_initWithConnection___block_invoke;
    v26[3] = &unk_1E2ABD9A0;
    v14 = v11;
    v27 = v14;
    -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v26);
    -[NSXPCConnection interruptionHandler](v6->_connection, "interruptionHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v6->_connection;
    v21 = v13;
    v22 = 3221225472;
    v23 = __64__PKPaymentWebServiceLocalProxyTargetDevice_initWithConnection___block_invoke_250;
    v24 = &unk_1E2ABD9A0;
    v17 = v15;
    v25 = v17;
    -[NSXPCConnection setInterruptionHandler:](v16, "setInterruptionHandler:", &v21);
    -[NSXPCConnection resume](v6->_connection, "resume", v21, v22, v23, v24);
    PKLogFacilityTypeGetObject(4uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = v6->_connection;
      *(_DWORD *)buf = 138412290;
      v30 = v19;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_INFO, "PKPaymentWebServiceLocalProxyTargetDevice initialized with XPC Connection: %@.", buf, 0xCu);
    }

  }
  return v6;
}

void __64__PKPaymentWebServiceLocalProxyTargetDevice_initWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  PKLogFacilityTypeGetObject(4uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_INFO, "PKPaymentWebServiceLocalProxyTargetDevice connection invalidated.", v3, 2u);
  }

}

void __64__PKPaymentWebServiceLocalProxyTargetDevice_initWithConnection___block_invoke_250(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  PKLogFacilityTypeGetObject(4uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_INFO, "PKPaymentWebServiceLocalProxyTargetDevice connection interrupted.", v3, 2u);
  }

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  -[PKPaymentWebServiceLocalProxyTargetDevice _invalidateConnection](self, "_invalidateConnection");
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceLocalProxyTargetDevice dealloc'd.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentWebServiceLocalProxyTargetDevice;
  -[PKPaymentWebServiceLocalProxyTargetDevice dealloc](&v4, sel_dealloc);
}

- (void)_invalidateConnection
{
  void *v3;
  NSObject *v4;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  int v7;
  NSXPCConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateRemoteProxyTargetDevice");

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v7 = 138412290;
    v8 = connection;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceLocalProxyTargetDevice invalidated XPC Connection: %@.", (uint8_t *)&v7, 0xCu);
  }

  v6 = self->_connection;
  self->_connection = 0;

}

- (id)_proxy
{
  return -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", 0);
}

- (id)_proxyWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;

  v4 = a3;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PKPaymentWebServiceLocalProxyTargetDevice__proxyWithErrorHandler___block_invoke;
  v11[3] = &unk_1E2ABD9C8;
  v6 = v4;
  v12 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceLocalProxyTargetDevice failed to create a remote proxy object.", v10, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPaymentWebServiceLocalProxyTargetDevice failed to create a remote proxy object."));
  }

  return v7;
}

void __68__PKPaymentWebServiceLocalProxyTargetDevice__proxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "PKPaymentWebServiceLocalProxyTargetDevice XPC Error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (id)_synchronousProxy
{
  return -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxyWithErrorHandler:](self, "_synchronousProxyWithErrorHandler:", 0);
}

- (id)_synchronousProxyWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;

  v4 = a3;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__PKPaymentWebServiceLocalProxyTargetDevice__synchronousProxyWithErrorHandler___block_invoke;
  v11[3] = &unk_1E2ABD9C8;
  v6 = v4;
  v12 = v6;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceLocalProxyTargetDevice failed to create a synchronous remote proxy object.", v10, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPaymentWebServiceLocalProxyTargetDevice failed to create a synchronous remote proxy object."));
  }

  return v7;
}

void __79__PKPaymentWebServiceLocalProxyTargetDevice__synchronousProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "PKPaymentWebServiceLocalProxyTargetDevice synchronous XPC Error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (id)context
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PKPaymentWebServiceLocalProxyTargetDevice_context__block_invoke;
  v7[3] = &unk_1E2ABD9F0;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  -[PKPaymentWebServiceLocalProxyTargetDevice contextWithCompletion:](self, "contextWithCompletion:", v7);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __52__PKPaymentWebServiceLocalProxyTargetDevice_context__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)contextWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke;
  v11[3] = &unk_1E2ABD9C8;
  v6 = v4;
  v12 = v6;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke_2;
  v9[3] = &unk_1E2ABDA40;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "getContextWithCompletion:", v9);

}

uint64_t __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke_3;
  v7[3] = &unk_1E2ABDA18;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __67__PKPaymentWebServiceLocalProxyTargetDevice_contextWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)encryptedServiceProviderDataForSecureElementPass:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke;
  v14[3] = &unk_1E2ABD9C8;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke_2;
  v12[3] = &unk_1E2ABDA90;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "getEncryptedServiceProviderDataForSecureElementPass:completion:", v9, v12);

}

uint64_t __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke_3;
  block[3] = &unk_1E2ABDA68;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __105__PKPaymentWebServiceLocalProxyTargetDevice_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)paymentWebService:(id)a3 queueConnectionToTrustedServiceManagerForPushTopic:(id)a4 withCompletion:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke;
  v15[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v16 = v9;
  v10 = a4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_2;
  v13[3] = &unk_1E2ABDAE0;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "queueConnectionToTrustedServiceManagerForPushTopic:withCompletion:", v10, v13);

}

uint64_t __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_3;
  block[3] = &unk_1E2ABDAB8;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __129__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)paymentWebService:(id)a3 configurationDataWithCompletionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v13 = v7;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E2ABDB08;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "getConfigurationDataWithCompletion:", v10);

}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E2ABDA68;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_configurationDataWithCompletionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)paymentWebService:(id)a3 registrationDataWithCompletionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_registrationDataWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v13 = v7;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __101__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_registrationDataWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E2ABDB30;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "getRegistrationDataWithCompletion:", v10);

}

uint64_t __101__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_registrationDataWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __101__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_registrationDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)paymentWebService:(id)a3 signData:(id)a4 signatureEntanglementMode:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v9 = a6;
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v18 = v11;
  v12 = a4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_2;
  v15[3] = &unk_1E2ABDB80;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "signData:signatureEntanglementMode:withCompletion:", v12, a5, v15);

}

uint64_t __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

void __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_3;
  v15[3] = &unk_1E2ABDB58;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v11, v15);

}

uint64_t __120__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)paymentWebService:(id)a3 provisioningDataIncludingDeviceMetadata:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v7 = a5;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v15 = v9;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E2ABDBA8;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "getProvisioningDataIncludingDeviceMetadata:withCompletion:", v5, v12);

}

uint64_t __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E2ABDA68;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __125__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)paymentWebService:(id)a3 deleteApplicationWithAID:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteApplicationWithAID:", v5);

}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteKeyMaterialForSubCredentialId:", v4);

}

- (void)paymentWebService:(id)a3 didRegisterWithRegionMap:(id)a4 primaryRegionTopic:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didRegisterWithRegionMap:primaryRegionTopic:", v8, v7);

}

- (id)paymentWebService:(id)a3 filterVerificationChannels:(id)a4
{
  return a4;
}

- (void)renewAppleAccountWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E2ABD9C8;
  v6 = v4;
  v12 = v6;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E2ABDBF8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "renewAppleAccountWithCompletionHandler:", v9);

}

uint64_t __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 2, 0);
  return result;
}

void __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E2ABDBD0;
  v11 = v6;
  v12 = a2;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __84__PKPaymentWebServiceLocalProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[6], a1[4]);
  return result;
}

- (id)appleAccountInformation
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PKPaymentWebServiceLocalProxyTargetDevice_appleAccountInformation__block_invoke;
  v5[3] = &unk_1E2ABDC20;
  v5[4] = &v6;
  objc_msgSend(v2, "appleAccountInformationWithCompletion:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __68__PKPaymentWebServiceLocalProxyTargetDevice_appleAccountInformation__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (unint64_t)paymentSupportedInCurrentRegionForWebService:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_paymentSupportedInCurrentRegionForWebService___block_invoke;
  v8[3] = &unk_1E2ABDC48;
  v8[4] = &v9;
  objc_msgSend(v5, "paymentSupportedInCurrentRegion:", v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __90__PKPaymentWebServiceLocalProxyTargetDevice_paymentSupportedInCurrentRegionForWebService___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)registrationSupportedInCurrentRegionForWebService:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95__PKPaymentWebServiceLocalProxyTargetDevice_registrationSupportedInCurrentRegionForWebService___block_invoke;
  v8[3] = &unk_1E2ABDC48;
  v8[4] = &v9;
  objc_msgSend(v5, "registrationSupportedInCurrentRegionWithCompletion:", v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __95__PKPaymentWebServiceLocalProxyTargetDevice_registrationSupportedInCurrentRegionForWebService___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)bridgedClientInfo
{
  return 0;
}

- (id)deviceVersion
{
  return +[PKOSVersionRequirement fromDeviceVersion](PKOSVersionRequirement, "fromDeviceVersion");
}

- (BOOL)supportsAutomaticPassPresentation
{
  return PKIsPad() ^ 1;
}

- (void)noteProvisioningUserInterfaceDidAppear
{
  id v2;

  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteProvisioningUserInterfaceDidAppear");

}

- (void)noteProvisioningUserInterfaceDidDisappear
{
  id v2;

  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteProvisioningUserInterfaceDidDisappear");

}

- (void)noteProvisioningDidBegin
{
  id v2;

  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteProvisioningDidBegin");

}

- (void)noteProvisioningDidEnd
{
  id v2;

  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteProvisioningDidEnd");

}

- (id)secureElementIdentifiers
{
  return +[PKSecureElement secureElementIdentifiers](PKSecureElement, "secureElementIdentifiers");
}

- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__PKPaymentWebServiceLocalProxyTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABD9C8;
  v8 = v4;
  v5 = v4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notePasscodeUpgradeFlowWillBeginWithCompletion:", v5);

}

uint64_t __92__PKPaymentWebServiceLocalProxyTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)notePasscodeUpgradeFlowDidEnd
{
  id v2;

  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notePasscodeUpgradeFlowDidEnd");

}

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__PKPaymentWebServiceLocalProxyTargetDevice_enforceUpgradedPasscodePolicyWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABD9C8;
  v8 = v4;
  v5 = v4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enforceUpgradedPasscodePolicyWithCompletion:", v5);

}

uint64_t __89__PKPaymentWebServiceLocalProxyTargetDevice_enforceUpgradedPasscodePolicyWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__PKPaymentWebServiceLocalProxyTargetDevice_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke;
  v7[3] = &unk_1E2ABD9C8;
  v8 = v4;
  v5 = v4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPasscodeMeetsUpgradedPasscodePolicy:", v5);

}

uint64_t __88__PKPaymentWebServiceLocalProxyTargetDevice_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:", v3);

}

- (void)endRequiringUpgradedPasscodeIfNecessary
{
  id v2;

  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endRequiringUpgradedPasscodeIfNecessary");

}

- (void)paymentWebService:(id)a3 setNewAuthRandomIfNecessaryReturningPairingState:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke;
  v12[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v13 = v7;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke_2;
  v10[3] = &unk_1E2ABDC98;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "setNewAuthRandomIfNecessaryReturningPairingState:", v10);

}

uint64_t __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, 0);
  return result;
}

void __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke_3;
  v13[3] = &unk_1E2ABDC70;
  v15 = v8;
  v16 = v9;
  v17 = a2;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, v13);

}

uint64_t __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)paymentWebService:(id)a3 setNewAuthRandom:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke;
  v12[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v13 = v7;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke_2;
  v10[3] = &unk_1E2ABDCE8;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "setNewAuthRandom:", v10);

}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke_3;
  v5[3] = &unk_1E2ABDCC0;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_setNewAuthRandom___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (BOOL)paymentWebService:(id)a3 hasPassesOfType:(unint64_t)a4
{
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_hasPassesOfType___block_invoke;
  v9[3] = &unk_1E2ABDD10;
  v9[4] = &v10;
  objc_msgSend(v7, "hasPassesOfType:completion:", a4, v9);

  LOBYTE(a4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return a4;
}

uint64_t __79__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_hasPassesOfType___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)paymentWebService:(id)a3 passesOfType:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passesOfType___block_invoke;
  v10[3] = &unk_1E2ABDD38;
  v10[4] = &v11;
  objc_msgSend(v7, "passesOfType:completion:", a4, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __76__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passesOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PKRemoteDataAccessor *v11;
  void *v12;
  PKRemoteDataAccessor *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = [PKRemoteDataAccessor alloc];
        objc_msgSend(v10, "uniqueID", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PKRemoteDataAccessor initWithLibrary:objectUniqueID:](v11, "initWithLibrary:objectUniqueID:", v4, v12);

        objc_msgSend(v10, "setDataAccessor:", v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v5;

}

- (BOOL)paymentWebService:(id)a3 canProvisionPaymentPassWithPrimaryAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __115__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_canProvisionPaymentPassWithPrimaryAccountIdentifier___block_invoke;
  v10[3] = &unk_1E2ABDD10;
  v10[4] = &v11;
  objc_msgSend(v8, "canProvisionPaymentPassWithPrimaryAccountIdentifier:completion:", v7, v10);

  LOBYTE(v8) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v8;
}

uint64_t __115__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_canProvisionPaymentPassWithPrimaryAccountIdentifier___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)paymentWebService:(id)a3 validateAddPreconditionsWithCompletion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke;
  v12[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v13 = v7;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E2ABDAE0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "validateAddPreconditionsWithCompletion:", v10);

}

void __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKDisplayableErrorForCommonType(0, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke_3;
  block[3] = &unk_1E2ABDAB8;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateAddPreconditionsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)paymentWebService:(id)a3 handlePotentialExpressPass:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v16 = v9;
  v10 = a4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E2ABDD60;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "handlePotentialExpressPass:withCompletion:", v10, v13);

}

uint64_t __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E2ABDA18;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __112__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x19400CFE8]();
  objc_msgSend(v9, "archiveData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v11);
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v14 = v10;
  v20 = v14;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke_2;
  v17[3] = &unk_1E2ABDAE0;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "addPassData:completion:", v12, v17);

}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)downloadAllPaymentPassesForPaymentWebService:(id)a3
{
  id v3;

  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadAllPaymentPasses");

}

- (BOOL)claimSecureElementForCurrentUser
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUser__block_invoke;
  v4[3] = &unk_1E2ABDD10;
  v4[4] = &v5;
  objc_msgSend(v2, "claimSecureElementForCurrentUserWithCompletion:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __77__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUser__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)claimSecureElementForCurrentUserWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke;
  v11[3] = &unk_1E2ABDD88;
  v6 = v4;
  v11[4] = self;
  v12 = v6;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_3;
  v9[3] = &unk_1E2ABDDB0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "claimSecureElementForCurrentUserWithCompletion:", v9);

}

void __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_2;
    block[3] = &unk_1E2ABD9A0;
    v4 = v1;
    dispatch_async(v2, block);

  }
}

uint64_t __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_4;
    v5[3] = &unk_1E2ABDCC0;
    v6 = v2;
    v7 = a2;
    dispatch_async(v4, v5);

  }
}

uint64_t __92__PKPaymentWebServiceLocalProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (unint64_t)secureElementOwnershipStateForCurrentUser
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_secureElementOwnershipStateForCurrentUser__block_invoke;
  v5[3] = &unk_1E2ABDC48;
  v5[4] = &v6;
  objc_msgSend(v2, "secureElementOwnershipStateForCurrentUserWithCompletion:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_secureElementOwnershipStateForCurrentUser__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)paymentWebService:(id)a3 validateTransferPreconditionsWithCompletion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke;
  v12[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v13 = v7;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E2ABDAE0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "validateTransferPreconditionsWithCompletion:", v10);

}

void __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKDisplayableErrorForCommonType(0, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke_3;
  block[3] = &unk_1E2ABDAB8;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_validateTransferPreconditionsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandlerV2:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x19400CFE8]();
  objc_msgSend(v9, "archiveData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v11);
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke;
  v21[3] = &unk_1E2ABD9C8;
  v14 = v10;
  v22 = v14;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke_2;
  v18[3] = &unk_1E2ABDDD8;
  v19 = v9;
  v20 = v14;
  v18[4] = self;
  v16 = v9;
  v17 = v14;
  objc_msgSend(v15, "addPassData:completion:", v12, v18);

}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke_3;
  block[3] = &unk_1E2ABDAB8;
  v7 = *(id *)(a1 + 48);
  v8 = a2;
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_addPaymentPass_withCompletionHandlerV2___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    if (*(_BYTE *)(a1 + 48))
      v3 = *(_QWORD *)(a1 + 32);
    else
      v3 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)paymentWebService:(id)a3 removePass:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v16 = v9;
  v10 = a4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E2ABDAE0;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "removePass:completion:", v10, v13);

}

uint64_t __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E2ABDAB8;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __96__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_removePass_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (BOOL)paymentWebServiceSupportsPeerPaymentRegistration:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebServiceSupportsPeerPaymentRegistration___block_invoke;
  v7[3] = &unk_1E2ABDD10;
  v7[4] = &v8;
  objc_msgSend(v5, "supportsPeerPaymentRegistrationWithCompletion:", v7);

  LOBYTE(v5) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

uint64_t __94__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebServiceSupportsPeerPaymentRegistration___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)paymentWebServiceSupportsAccounts:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebServiceSupportsAccounts___block_invoke;
  v7[3] = &unk_1E2ABDD10;
  v7[4] = &v8;
  objc_msgSend(v5, "supportsAccountsWithCompletion:", v7);

  LOBYTE(v5) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

uint64_t __79__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebServiceSupportsAccounts___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)supportedFeatureIdentifiersWithPaymentWebService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_supportedFeatureIdentifiersWithPaymentWebService___block_invoke;
  v8[3] = &unk_1E2ABDE00;
  v8[4] = &v9;
  objc_msgSend(v5, "supportedFeatureIdentifiersWithCompletion:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __94__PKPaymentWebServiceLocalProxyTargetDevice_supportedFeatureIdentifiersWithPaymentWebService___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __116__PKPaymentWebServiceLocalProxyTargetDevice_supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService___block_invoke;
  v8[3] = &unk_1E2ABDE00;
  v8[4] = &v9;
  objc_msgSend(v5, "supportedFeatureIdentifiersForAccountProvisioningWithCompletion:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __116__PKPaymentWebServiceLocalProxyTargetDevice_supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)updatedAccountsForProvisioningWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke;
    v11[3] = &unk_1E2ABD9C8;
    v7 = v4;
    v12 = v7;
    -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_2;
    v9[3] = &unk_1E2ABDE28;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "updatedAccountsForProvisioningWithCompletion:", v9);

  }
}

uint64_t __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_3;
  block[3] = &unk_1E2ABDA68;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __90__PKPaymentWebServiceLocalProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke;
    v14[3] = &unk_1E2ABD9C8;
    v9 = v6;
    v15 = v9;
    v10 = a3;
    -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_2;
    v12[3] = &unk_1E2ABDCE8;
    v12[4] = self;
    v13 = v9;
    objc_msgSend(v11, "triggerCloudStoreZoneCreationForAccount:withCompletion:", v10, v12);

  }
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_3;
  v5[3] = &unk_1E2ABDCC0;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke;
    v11[3] = &unk_1E2ABD9C8;
    v7 = v4;
    v12 = v7;
    -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke_2;
    v9[3] = &unk_1E2ABDE50;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "cachedFeatureApplicationsForProvisioningWithCompletion:", v9);

  }
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke_3;
  v7[3] = &unk_1E2ABDA18;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)featureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke;
    v11[3] = &unk_1E2ABD9C8;
    v7 = v4;
    v12 = v7;
    -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke_2;
    v9[3] = &unk_1E2ABDE50;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "featureApplicationsForProvisioningWithCompletion:", v9);

  }
}

uint64_t __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke_3;
  v7[3] = &unk_1E2ABDA18;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __94__PKPaymentWebServiceLocalProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)paymentWebService:(id)a3 deviceMetadataWithFields:(unint64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a5;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke;
    v14[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v15 = v10;
    -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke_2;
    v12[3] = &unk_1E2ABDE78;
    v12[4] = self;
    v13 = v10;
    objc_msgSend(v11, "deviceMetadataWithFields:completion:", a4, v12);

  }
}

uint64_t __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke_3;
  v7[3] = &unk_1E2ABDA18;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __99__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_deviceMetadataWithFields_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)paymentWebService:(id)a3 updateAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke;
    v15[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v16 = v10;
    v11 = a4;
    -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E2ABDEA0;
    v13[4] = self;
    v14 = v10;
    objc_msgSend(v12, "updateAccountWithIdentifier:completion:", v11, v13);

  }
}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E2ABDA68;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __102__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_updateAccountWithIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)applePayTrustKeyForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke;
    v14[3] = &unk_1E2ABD9C8;
    v9 = v6;
    v15 = v9;
    v10 = a3;
    -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke_2;
    v12[3] = &unk_1E2ABDEC8;
    v12[4] = self;
    v13 = v9;
    objc_msgSend(v11, "applePayTrustKeyForIdentifier:completion:", v10, v12);

  }
}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E2ABDA18;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)createApplePayTrustKeyWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke;
  v14[3] = &unk_1E2ABD9C8;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke_2;
  v12[3] = &unk_1E2ABDEF0;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "createApplePayTrustKeyWithRequest:completion:", v9, v12);

}

uint64_t __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke_3;
    block[3] = &unk_1E2ABDA68;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __90__PKPaymentWebServiceLocalProxyTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deleteApplePayTrustKeyWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke;
  v14[3] = &unk_1E2ABD9C8;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E2ABDDB0;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "deleteApplePayTrustKeyWithIdentifier:completion:", v9, v12);

}

uint64_t __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke_3;
    v5[3] = &unk_1E2ABDCC0;
    v6 = v2;
    v7 = a2;
    dispatch_async(v4, v5);

  }
}

uint64_t __93__PKPaymentWebServiceLocalProxyTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)supportsCheckingProvisioningRequirements
{
  return 1;
}

- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke;
  v15[3] = &unk_1E2ABDD88;
  v9 = v7;
  v16 = v6;
  v17 = v9;
  v10 = v6;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke_2;
  v13[3] = &unk_1E2ABDF18;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "usingSynchronousProxy:meetsProvisioningRequirements:completion:", 0, v10, v13);

}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke_3;
  block[3] = &unk_1E2ABDAB8;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_missingRequirements___block_invoke;
  v10[3] = &unk_1E2ABDF40;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v7, "usingSynchronousProxy:meetsProvisioningRequirements:completion:", 1, v6, v10);

  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __95__PKPaymentWebServiceLocalProxyTargetDevice_meetsProvisioningRequirements_missingRequirements___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)currentSecureElementSnapshot:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PKPaymentWebServiceLocalProxyTargetDevice_currentSecureElementSnapshot___block_invoke;
  v7[3] = &unk_1E2ABD9C8;
  v8 = v4;
  v5 = v4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentSecureElementSnapshot:", v5);

}

uint64_t __74__PKPaymentWebServiceLocalProxyTargetDevice_currentSecureElementSnapshot___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__PKPaymentWebServiceLocalProxyTargetDevice_reserveStorageForAppletTypes_metadata_completion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reserveStorageForAppletTypes:metadata:completion:", v11, v10, v9);

}

uint64_t __94__PKPaymentWebServiceLocalProxyTargetDevice_reserveStorageForAppletTypes_metadata_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PKPaymentWebServiceLocalProxyTargetDevice_deleteReservation_completion___block_invoke;
  v10[3] = &unk_1E2ABD9C8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteReservation:completion:", v8, v7);

}

uint64_t __74__PKPaymentWebServiceLocalProxyTargetDevice_deleteReservation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)maximumPaymentCards
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PKPaymentWebServiceLocalProxyTargetDevice_maximumPaymentCards__block_invoke;
  v5[3] = &unk_1E2ABDC48;
  v5[4] = &v6;
  objc_msgSend(v2, "maximumPaymentCardsWithCompletion:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__PKPaymentWebServiceLocalProxyTargetDevice_maximumPaymentCards__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)allPaymentApplicationUsageSummaries
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_allPaymentApplicationUsageSummaries__block_invoke;
  v5[3] = &unk_1E2ABDD38;
  v5[4] = &v6;
  objc_msgSend(v2, "allPaymentApplicationUsageSummariesWithCompletion:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __80__PKPaymentWebServiceLocalProxyTargetDevice_allPaymentApplicationUsageSummaries__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_addPendingProvisionings_completion___block_invoke;
  v14[3] = &unk_1E2ABD9C8;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_addPendingProvisionings_completion___block_invoke_2;
  v12[3] = &unk_1E2ABD9C8;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "addPendingProvisionings:completion:", v9, v12);

}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_addPendingProvisionings_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_addPendingProvisionings_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)secureElementIsAvailable
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__PKPaymentWebServiceLocalProxyTargetDevice_secureElementIsAvailable__block_invoke;
  v4[3] = &unk_1E2ABDD10;
  v4[4] = &v5;
  objc_msgSend(v2, "secureElementIsAvailableWithCompletion:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __69__PKPaymentWebServiceLocalProxyTargetDevice_secureElementIsAvailable__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_willPassWithUniqueIdentifierAutomaticallyBecomeDefault___block_invoke;
  v7[3] = &unk_1E2ABDD10;
  v7[4] = &v8;
  objc_msgSend(v5, "willPassWithUniqueIdentifierAutomaticallyBecomeDefault:completion:", v4, v7);

  LOBYTE(v5) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_willPassWithUniqueIdentifierAutomaticallyBecomeDefault___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)paymentWebService:(id)a3 setDefaultPaymentPassUniqueIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultPaymentPassUniqueIdentifier:", v5);

}

- (void)paymentWebService:(id)a3 requestPassUpgrade:(id)a4 pass:(id)a5 completion:(id)a6
{
  if (a6)
    (*((void (**)(id, _QWORD, id))a6 + 2))(a6, 0, a5);
}

- (void)performDeviceCheckInWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke;
  v11[3] = &unk_1E2ABD9C8;
  v6 = v4;
  v12 = v6;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke_2;
  v9[3] = &unk_1E2ABDF68;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performDeviceCheckInWithCompletion:", v9);

}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke_3;
    block[3] = &unk_1E2ABDAB8;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __80__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke;
  v17[3] = &unk_1E2ABD9C8;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke_2;
  v15[3] = &unk_1E2ABDFB8;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "performDeviceRegistrationReturningContextForReason:brokerURL:completion:", v12, v11, v15);

}

uint64_t __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, 0);
  return result;
}

void __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke_3;
    v11[3] = &unk_1E2ABDF90;
    v14 = v9;
    v15 = a2;
    v12 = v7;
    v13 = v8;
    dispatch_async(v10, v11);

  }
}

uint64_t __117__PKPaymentWebServiceLocalProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[7], a1[4], a1[5]);
}

- (void)paymentWebService:(id)a3 storePassOwnershipToken:(id)a4 withIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storePassOwnershipToken:withIdentifier:", v8, v7);

}

- (void)paymentWebService:(id)a3 passOwnershipTokenWithIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v16 = v9;
  v10 = a4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E2ABDFE0;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "passOwnershipTokenWithIdentifier:completion:", v10, v13);

}

uint64_t __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke_3;
    v6[3] = &unk_1E2ABDA18;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __107__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_passOwnershipTokenWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)familyMembersWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke;
  v11[3] = &unk_1E2ABD9C8;
  v6 = v4;
  v12 = v6;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke_2;
  v9[3] = &unk_1E2ABE008;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "familyMembersWithCompletion:", v9);

}

uint64_t __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke_3;
    v6[3] = &unk_1E2ABDA18;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __73__PKPaymentWebServiceLocalProxyTargetDevice_familyMembersWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)paymentWebService:(id)a3 generateTransactionKeyWithParameters:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_generateTransactionKeyWithParameters_withCompletion___block_invoke;
  v11[3] = &unk_1E2ABD9C8;
  v12 = v7;
  v8 = v7;
  v9 = a4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generateTransactionKeyWithParameters:withCompletion:", v9, v8);

}

uint64_t __115__PKPaymentWebServiceLocalProxyTargetDevice_paymentWebService_generateTransactionKeyWithParameters_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, 0, a2);
  return result;
}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__PKPaymentWebServiceLocalProxyTargetDevice_statusForShareableCredentials_completion___block_invoke;
  v10[3] = &unk_1E2ABD9C8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statusForShareableCredentials:completion:", v8, v7);

}

uint64_t __86__PKPaymentWebServiceLocalProxyTargetDevice_statusForShareableCredentials_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke;
  v12[3] = &unk_1E2ABD9C8;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareProvisioningTarget:checkFamilyCircle:completion:", v10, v5, v9);

}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__PKPaymentWebServiceLocalProxyTargetDevice_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke;
  v10[3] = &unk_1E2ABD9C8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "provisionHomeKeyPassForSerialNumbers:completionHandler:", v8, v7);

}

uint64_t __100__PKPaymentWebServiceLocalProxyTargetDevice_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__PKPaymentWebServiceLocalProxyTargetDevice_availableHomeKeyPassesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E2ABD9C8;
  v8 = v4;
  v5 = v4;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableHomeKeyPassesWithCompletionHandler:", v5);

}

uint64_t __89__PKPaymentWebServiceLocalProxyTargetDevice_availableHomeKeyPassesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v12 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __136__PKPaymentWebServiceLocalProxyTargetDevice_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v20 = v12;
  v13 = v12;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "createFidoKeyForRelyingParty:relyingPartyAccountHash:challenge:externalizedAuth:completion:", v17, v16, v15, v14, v13);

}

uint64_t __136__PKPaymentWebServiceLocalProxyTargetDevice_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __128__PKPaymentWebServiceLocalProxyTargetDevice_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v17 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "checkFidoKeyPresenceForRelyingParty:relyingPartyAccountHash:fidoKeyHash:completion:", v14, v13, v12, v11);

}

uint64_t __128__PKPaymentWebServiceLocalProxyTargetDevice_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;

  v16 = a9;
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __170__PKPaymentWebServiceLocalProxyTargetDevice_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke;
  v28 = &unk_1E2ABD9C8;
  v29 = v16;
  v17 = v16;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", &v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "signWithFidoKeyForRelyingParty:relyingPartyAccountHash:fidoKeyHash:challenge:publicKeyIdentifier:externalizedAuth:completion:", v23, v22, v21, v20, v19, v18, v17, v25, v26, v27, v28);

}

uint64_t __170__PKPaymentWebServiceLocalProxyTargetDevice_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __106__PKPaymentWebServiceLocalProxyTargetDevice_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke;
  v10[3] = &unk_1E2ABD9C8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generateSEEncryptionCertificateForSubCredentialId:completion:", v8, v7);

}

uint64_t __106__PKPaymentWebServiceLocalProxyTargetDevice_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __107__PKPaymentWebServiceLocalProxyTargetDevice_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke;
  v10[3] = &unk_1E2ABD9C8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generateISOEncryptionCertificateForSubCredentialId:completion:", v8, v7);

}

uint64_t __107__PKPaymentWebServiceLocalProxyTargetDevice_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)areUnifiedAccessPassesSupported
{
  void *v2;
  char v3;

  -[PKPaymentWebServiceLocalProxyTargetDevice _synchronousProxy](self, "_synchronousProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areUnifiedAccessPassesSupported");

  return v3;
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__PKPaymentWebServiceLocalProxyTargetDevice_addISO18013Blobs_cardType_completion___block_invoke;
  v12[3] = &unk_1E2ABD9C8;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addISO18013Blobs:cardType:completion:", v10, a4, v9);

}

uint64_t __82__PKPaymentWebServiceLocalProxyTargetDevice_addISO18013Blobs_cardType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __117__PKPaymentWebServiceLocalProxyTargetDevice_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke;
  v12[3] = &unk_1E2ABD9C8;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "longTermPrivacyKeyForCredentialGroupIdentifier:reuseExisting:completion:", v10, v5, v9);

}

uint64_t __117__PKPaymentWebServiceLocalProxyTargetDevice_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__PKPaymentWebServiceLocalProxyTargetDevice_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke;
  v10[3] = &unk_1E2ABD9C8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generateAuxiliaryCapabilitiesForRequirements:completion:", v8, v7);

}

uint64_t __101__PKPaymentWebServiceLocalProxyTargetDevice_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)archiveContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "archiveContext:", v4);

}

- (void)archiveBackgroundContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentWebServiceLocalProxyTargetDevice _proxy](self, "_proxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "archiveBackgroundContext:", v4);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end
