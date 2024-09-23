@implementation PKInAppPaymentService

- (PKInAppPaymentService)init
{
  PKInAppPaymentService *v2;
  PKXPCService *v3;
  void *v4;
  uint64_t v5;
  PKXPCService *remoteService;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKInAppPaymentService;
  v2 = -[PKInAppPaymentService init](&v8, sel_init);
  if (v2)
  {
    v3 = [PKXPCService alloc];
    PDInAppPaymentServiceInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v3, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.in-app-payment"), v4, 0, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v5;

  }
  return v2;
}

- (id)_remoteObjectProxy
{
  return -[PKXPCService remoteObjectProxy](self->_remoteService, "remoteObjectProxy");
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithFailureHandler:](self->_remoteService, "remoteObjectProxyWithFailureHandler:", a3);
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", a3);
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](self->_remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (void)registerPaymentListenerEndpoint:(id)a3 forHostIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKInAppPaymentService_registerPaymentListenerEndpoint_forHostIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKInAppPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __86__PKInAppPaymentService_registerPaymentListenerEndpoint_forHostIdentifier_completion___block_invoke_8;
  v17[3] = &unk_1E2ABDDB0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "registerPaymentListenerEndpoint:forHostIdentifier:handler:", v13, v12, v17);

}

uint64_t __86__PKInAppPaymentService_registerPaymentListenerEndpoint_forHostIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __86__PKInAppPaymentService_registerPaymentListenerEndpoint_forHostIdentifier_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)retrievePaymentListenerEndpointForHostIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKInAppPaymentService_retrievePaymentListenerEndpointForHostIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKInAppPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __85__PKInAppPaymentService_retrievePaymentListenerEndpointForHostIdentifier_completion___block_invoke_10;
  v14[3] = &unk_1E2AC91D8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "retrievePaymentListenerEndpointForHostIdentifier:handler:", v10, v14);

}

uint64_t __85__PKInAppPaymentService_retrievePaymentListenerEndpointForHostIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __85__PKInAppPaymentService_retrievePaymentListenerEndpointForHostIdentifier_completion___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentInAppPaymentInterfaceWithPaymentRequest:(id)a3 awaitingRemoteNetworkPaymentRequest:(BOOL)a4 forHostIdentifier:(id)a5 hostSceneIdentifier:(id)a6 hostSceneBundleIdentifier:(id)a7 orientation:(id)a8 omitPresentationTarget:(BOOL)a9 analyticsSubject:(id)a10 analyticsArchivedSessionToken:(id)a11 completion:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  _BOOL4 v32;
  _QWORD v33[5];
  id v34;
  _QWORD aBlock[5];
  id v36;
  SEL v37;

  v32 = a4;
  v19 = a12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __265__PKInAppPaymentService_presentInAppPaymentInterfaceWithPaymentRequest_awaitingRemoteNetworkPaymentRequest_forHostIdentifier_hostSceneIdentifier_hostSceneBundleIdentifier_orientation_omitPresentationTarget_analyticsSubject_analyticsArchivedSessionToken_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v37 = a2;
  v20 = v19;
  aBlock[4] = self;
  v36 = v20;
  v21 = a11;
  v22 = a10;
  v23 = a8;
  v24 = a7;
  v25 = a6;
  v26 = a5;
  v27 = a3;
  v31 = _Block_copy(aBlock);
  -[PKInAppPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __265__PKInAppPaymentService_presentInAppPaymentInterfaceWithPaymentRequest_awaitingRemoteNetworkPaymentRequest_forHostIdentifier_hostSceneIdentifier_hostSceneBundleIdentifier_orientation_omitPresentationTarget_analyticsSubject_analyticsArchivedSessionToken_completion___block_invoke_15;
  v33[3] = &unk_1E2ABDF68;
  v33[4] = self;
  v34 = v20;
  v29 = v20;
  LOBYTE(v30) = a9;
  objc_msgSend(v28, "presentInAppPaymentInterfaceWithPaymentRequest:awaitingRemoteNetworkPaymentRequest:forHostIdentifier:hostSceneIdentifier:hostSceneBundleIdentifier:orientation:omitPresentationTarget:analyticsSubject:analyticsArchivedSessionToken:handler:", v27, v32, v26, v25, v24, v23, v30, v22, v21, v33);

}

void __265__PKInAppPaymentService_presentInAppPaymentInterfaceWithPaymentRequest_awaitingRemoteNetworkPaymentRequest_forHostIdentifier_hostSceneIdentifier_hostSceneBundleIdentifier_orientation_omitPresentationTarget_analyticsSubject_analyticsArchivedSessionToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(7uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      buf,
      0xCu);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB3388];
    v10 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __265__PKInAppPaymentService_presentInAppPaymentInterfaceWithPaymentRequest_awaitingRemoteNetworkPaymentRequest_forHostIdentifier_hostSceneIdentifier_hostSceneBundleIdentifier_orientation_omitPresentationTarget_analyticsSubject_analyticsArchivedSessionToken_completion___block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)merchantStatusCheck:(id)a3 merchantDomain:(id)a4 sourceApplicationSecondaryIdentifier:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  _QWORD aBlock[5];
  id v37;
  SEL v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__PKInAppPaymentService_merchantStatusCheck_merchantDomain_sourceApplicationSecondaryIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v38 = a2;
  v15 = v14;
  aBlock[4] = self;
  v37 = v15;
  v16 = _Block_copy(aBlock);
  -[PKInAppPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v18 = objc_msgSend(v12, "length") == 0;
  else
    v18 = 1;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v11;
  objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "lowercaseString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v23 = objc_msgSend(v22, "length") == 0;
  else
    v23 = 1;
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("null")) & 1) != 0
    || (objc_msgSend(v22, "isEqualToString:", CFSTR("undefined")) & 1) != 0
    || (objc_msgSend(v22, "isEqualToString:", CFSTR("example.com.store")) & 1) != 0)
  {
    v24 = 1;
  }
  else
  {
    v32 = objc_msgSend(v22, "rangeOfString:options:", CFSTR("^[A-Za-z0-9.-]+$"), 1024);
    v24 = v32 == 0x7FFFFFFFFFFFFFFFLL;
    if (!v18 && !v23 && v32 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __108__PKInAppPaymentService_merchantStatusCheck_merchantDomain_sourceApplicationSecondaryIdentifier_completion___block_invoke_26;
      v34[3] = &unk_1E2ABDF68;
      v34[4] = self;
      v35 = v15;
      v28 = v20;
      objc_msgSend(v17, "merchantStatusCheck:merchantDomain:sourceApplicationSecondaryIdentifier:handler:", v20, v12, v13, v34);
      v30 = v35;
      v29 = v33;
      goto LABEL_22;
    }
  }
  if (v18)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v26;
      v27 = "%@ called with empty domainName";
LABEL_17:
      _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (v23)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v26;
      v27 = "%@ called with empty merchantIdentifier";
      goto LABEL_17;
    }
LABEL_18:
    v28 = v20;
    v29 = v33;
LABEL_19:

    goto LABEL_20;
  }
  v28 = v20;
  v29 = v33;
  if (v24)
  {
    PKLogFacilityTypeGetObject(7uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v31;
      _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "%@ called with invalid merchantIdentifier", buf, 0xCu);

    }
    goto LABEL_19;
  }
LABEL_20:
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v30);
LABEL_22:

  }
}

void __108__PKInAppPaymentService_merchantStatusCheck_merchantDomain_sourceApplicationSecondaryIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(7uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      buf,
      0xCu);

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = *MEMORY[0x1E0CB3388];
    v11 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v7);
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v8);

  }
}

uint64_t __108__PKInAppPaymentService_merchantStatusCheck_merchantDomain_sourceApplicationSecondaryIdentifier_completion___block_invoke_26(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKInAppPaymentService_paymentServicesMerchantURLForAPIType_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v17 = a2;
  v9 = v7;
  aBlock[4] = self;
  v16 = v9;
  v10 = _Block_copy(aBlock);
  -[PKInAppPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __73__PKInAppPaymentService_paymentServicesMerchantURLForAPIType_completion___block_invoke_27;
  v13[3] = &unk_1E2AC9200;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "paymentServicesMerchantURLForAPIType:handler:", a3, v13);

}

uint64_t __73__PKInAppPaymentService_paymentServicesMerchantURLForAPIType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __73__PKInAppPaymentService_paymentServicesMerchantURLForAPIType_completion___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(7uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend(v5, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Returned payment services merchant URL: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (v7)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Received no payment services merchant URL. This is an error.", (uint8_t *)&v10, 2u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

- (BOOL)secureElementStatus:(unint64_t *)a3
{
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PKInAppPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PKInAppPaymentService_secureElementStatus___block_invoke;
  v6[3] = &unk_1E2AC9228;
  v6[4] = &v7;
  v6[5] = a3;
  objc_msgSend(v4, "secureElementStatusWithCompletion:", v6);
  LOBYTE(a3) = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return (char)a3;
}

uint64_t __45__PKInAppPaymentService_secureElementStatus___block_invoke(uint64_t result, char a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(result + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  if (v3)
    *v3 = a3;
  return result;
}

- (void)secureElementStatusWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKInAppPaymentService_secureElementStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKInAppPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __59__PKInAppPaymentService_secureElementStatusWithCompletion___block_invoke_30;
  v11[3] = &unk_1E2AC9250;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "secureElementStatusWithCompletion:", v11);

}

uint64_t __59__PKInAppPaymentService_secureElementStatusWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __59__PKInAppPaymentService_secureElementStatusWithCompletion___block_invoke_30(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)paymentHardwareStatusWithType:(unint64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__21;
  v12 = __Block_byref_object_dispose__21;
  v13 = 0;
  -[PKInAppPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PKInAppPaymentService_paymentHardwareStatusWithType___block_invoke;
  v7[3] = &unk_1E2AC9278;
  v7[4] = &v8;
  objc_msgSend(v4, "paymentHardwareStatusWithType:completion:", a3, v7);
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __55__PKInAppPaymentService_paymentHardwareStatusWithType___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKInAppPaymentService_paymentHardwareStatusWithType_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v17 = a2;
  v9 = v7;
  aBlock[4] = self;
  v16 = v9;
  v10 = _Block_copy(aBlock);
  -[PKInAppPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __66__PKInAppPaymentService_paymentHardwareStatusWithType_completion___block_invoke_32;
  v13[3] = &unk_1E2AC92A0;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "paymentHardwareStatusWithType:completion:", a3, v13);

}

uint64_t __66__PKInAppPaymentService_paymentHardwareStatusWithType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __66__PKInAppPaymentService_paymentHardwareStatusWithType_completion___block_invoke_32(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)hasValidSecurityConfigurationWithType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[3];
  char v14;
  _QWORD v15[4];

  v6 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  -[PKInAppPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PKInAppPaymentService_hasValidSecurityConfigurationWithType_completion___block_invoke;
  v9[3] = &unk_1E2AC92F0;
  v11 = v13;
  v12 = v15;
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "paymentHardwareStatusWithType:completion:", a3, v9);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);

}

void __74__PKInAppPaymentService_hasValidSecurityConfigurationWithType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;
  uint64_t v11;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKInAppPaymentService_hasValidSecurityConfigurationWithType_completion___block_invoke_2;
  block[3] = &unk_1E2AC92C8;
  v4 = *(_QWORD *)(a1 + 48);
  v9 = v3;
  v11 = v4;
  v7 = *(_OWORD *)(a1 + 32);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __74__PKInAppPaymentService_hasValidSecurityConfigurationWithType_completion___block_invoke_2(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24));
}

- (void)cardsAvailableForAMPWithCountryCode:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKInAppPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __72__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode_completion___block_invoke_33;
  v14[3] = &unk_1E2AC3E98;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "cardsAvailableForAMPWithCountryCode:completion:", v10, v14);

}

uint64_t __72__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __72__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode_completion___block_invoke_33(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)cardsAvailableForAMPWithCountryCode:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
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
  -[PKInAppPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode___block_invoke;
  v8[3] = &unk_1E2AC9318;
  v8[4] = &v9;
  objc_msgSend(v5, "cardsAvailableForAMPWithCountryCode:completion:", v4, v8);
  v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __61__PKInAppPaymentService_cardsAvailableForAMPWithCountryCode___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)cardDataForMerchantIdentifier:(id)a3 countryCode:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKInAppPaymentService_cardDataForMerchantIdentifier_countryCode_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKInAppPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __78__PKInAppPaymentService_cardDataForMerchantIdentifier_countryCode_completion___block_invoke_35;
  v17[3] = &unk_1E2AC9340;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "cardDataForMerchantIdentifier:countryCode:completion:", v13, v12, v17);

}

uint64_t __78__PKInAppPaymentService_cardDataForMerchantIdentifier_countryCode_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __78__PKInAppPaymentService_cardDataForMerchantIdentifier_countryCode_completion___block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)enrollPaymentPassWithUniqueIdentifier:(id)a3 merchantSession:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKInAppPaymentService_enrollPaymentPassWithUniqueIdentifier_merchantSession_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKInAppPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __90__PKInAppPaymentService_enrollPaymentPassWithUniqueIdentifier_merchantSession_completion___block_invoke_37;
  v17[3] = &unk_1E2AC9368;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "enrollPaymentPassWithUniqueIdentifier:merchantSession:completion:", v13, v12, v17);

}

uint64_t __90__PKInAppPaymentService_enrollPaymentPassWithUniqueIdentifier_merchantSession_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __90__PKInAppPaymentService_enrollPaymentPassWithUniqueIdentifier_merchantSession_completion___block_invoke_37(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)validatePayLaterMerchandisingConfiguration:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKInAppPaymentService_validatePayLaterMerchandisingConfiguration_type_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKInAppPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __84__PKInAppPaymentService_validatePayLaterMerchandisingConfiguration_type_completion___block_invoke_39;
  v16[3] = &unk_1E2AC9390;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "validatePayLaterMerchandisingConfiguration:type:completion:", v12, a4, v16);

}

uint64_t __84__PKInAppPaymentService_validatePayLaterMerchandisingConfiguration_type_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(7uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKInAppPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __84__PKInAppPaymentService_validatePayLaterMerchandisingConfiguration_type_completion___block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
