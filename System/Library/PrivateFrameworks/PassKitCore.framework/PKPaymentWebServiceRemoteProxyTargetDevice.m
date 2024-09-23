@implementation PKPaymentWebServiceRemoteProxyTargetDevice

- (PKPaymentWebServiceRemoteProxyTargetDevice)init
{
  return -[PKPaymentWebServiceRemoteProxyTargetDevice initWithWebService:connection:](self, "initWithWebService:connection:", 0, 0);
}

- (PKPaymentWebServiceRemoteProxyTargetDevice)initWithWebService:(id)a3 connection:(id)a4
{
  id v7;
  char *v8;
  PKPaymentWebServiceRemoteProxyTargetDevice *v9;
  PKEntitlementWhitelist *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *handlerQueue;
  void **p_webService;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  NSXPCConnection *connection;
  NSObject *v21;
  void *v22;
  void *v23;
  NSXPCConnection *v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSXPCConnection *v28;
  id v29;
  NSObject *v30;
  PKPaymentWebServiceRemoteProxyTargetDevice *v31;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  objc_super v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (char *)a4;
  v41.receiver = self;
  v41.super_class = (Class)PKPaymentWebServiceRemoteProxyTargetDevice;
  v9 = -[PKPaymentWebServiceRemoteProxyTargetDevice init](&v41, sel_init);
  if (!v9)
  {
LABEL_15:
    v31 = v9;
    goto LABEL_16;
  }
  v10 = -[PKEntitlementWhitelist initWithConnection:]([PKEntitlementWhitelist alloc], "initWithConnection:", v8);
  if (-[PKEntitlementWhitelist paymentAllAccess](v10, "paymentAllAccess")
    || -[PKEntitlementWhitelist peerPaymentAllAccess](v10, "peerPaymentAllAccess"))
  {
    v11 = dispatch_queue_create("com.apple.passkit.remoteTargetDeviceHandlerQueue", MEMORY[0x1E0C80D50]);
    handlerQueue = v9->_handlerQueue;
    v9->_handlerQueue = (OS_dispatch_queue *)v11;

    p_webService = (void **)&v9->_webService;
    objc_storeStrong((id *)&v9->_webService, a3);
    if (!v9->_webService)
    {
      +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *p_webService;
      *p_webService = (void *)v14;

      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (const char *)*p_webService;
        *(_DWORD *)buf = 138412546;
        v43 = v17;
        v44 = 2080;
        v45 = "-[PKPaymentWebServiceRemoteProxyTargetDevice initWithWebService:connection:]";
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Shared webService (%@) used as one was not provided to %s.", buf, 0x16u);
      }

    }
    objc_msgSend(v7, "targetDevice");
    v18 = objc_claimAutoreleasedReturnValue();
    targetDevice = v9->_targetDevice;
    v9->_targetDevice = (PKPaymentWebServiceTargetDeviceProtocol *)v18;

    objc_storeStrong((id *)&v9->_connection, a4);
    connection = v9->_connection;
    if (!connection)
    {
      PKLogFacilityTypeGetObject(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[PKPaymentWebServiceRemoteProxyTargetDevice initWithWebService:connection:]";
        _os_log_error_impl(&dword_18FC92000, v21, OS_LOG_TYPE_ERROR, "No connection provided to %s", buf, 0xCu);
      }

      connection = v9->_connection;
    }
    PKPaymentWebServiceProxyObjectInterface();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](connection, "setExportedInterface:", v22);

    -[NSXPCConnection setExportedObject:](v9->_connection, "setExportedObject:", v9);
    -[NSXPCConnection invalidationHandler](v9->_connection, "invalidationHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v9->_connection;
    v25 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __76__PKPaymentWebServiceRemoteProxyTargetDevice_initWithWebService_connection___block_invoke;
    v39[3] = &unk_1E2ABD9A0;
    v26 = v23;
    v40 = v26;
    -[NSXPCConnection setInvalidationHandler:](v24, "setInvalidationHandler:", v39);
    -[NSXPCConnection interruptionHandler](v9->_connection, "interruptionHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v9->_connection;
    v34 = v25;
    v35 = 3221225472;
    v36 = __76__PKPaymentWebServiceRemoteProxyTargetDevice_initWithWebService_connection___block_invoke_563;
    v37 = &unk_1E2ABD9A0;
    v29 = v27;
    v38 = v29;
    -[NSXPCConnection setInterruptionHandler:](v28, "setInterruptionHandler:", &v34);
    -[NSXPCConnection resume](v9->_connection, "resume", v34, v35, v36, v37);
    PKLogFacilityTypeGetObject(6uLL);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v43 = (const char *)v7;
      v44 = 2112;
      v45 = v8;
      _os_log_impl(&dword_18FC92000, v30, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceRemoteProxyTargetDevice initialized with Web Service: %@ for XPC Connection: %@.", buf, 0x16u);
    }

    goto LABEL_15;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v43 = (const char *)v9;
    _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, "Client is not entitled for PKPaymentWebServiceRemoteProxyTargetDevice (%p)", buf, 0xCu);
  }

  v31 = 0;
LABEL_16:

  return v31;
}

void __76__PKPaymentWebServiceRemoteProxyTargetDevice_initWithWebService_connection___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_INFO, "PKPaymentWebServiceRemoteProxyTargetDevice connection invalidated.", v3, 2u);
  }

}

uint64_t __76__PKPaymentWebServiceRemoteProxyTargetDevice_initWithWebService_connection___block_invoke_563(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  PKLogFacilityTypeGetObject(4uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_INFO, "PKPaymentWebServiceRemoteProxyTargetDevice connection interrupted.", v4, 2u);
  }

  return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unexpected interruption on PKPaymentWebServiceRemoteProxyTargetDevice connection."));
}

- (void)dealloc
{
  NSXPCConnection *connection;
  NSObject *v4;
  PKPaymentWebService *webService;
  objc_super v6;
  uint8_t buf[4];
  PKPaymentWebService *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (connection)
    -[NSXPCConnection invalidate](connection, "invalidate");
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    webService = self->_webService;
    *(_DWORD *)buf = 138412290;
    v8 = webService;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceRemoteProxyTargetDevice with Web Service: %@ dealloc'd.", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentWebServiceRemoteProxyTargetDevice;
  -[PKPaymentWebServiceRemoteProxyTargetDevice dealloc](&v6, sel_dealloc);
}

- (void)getContextWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PKPaymentWebServiceRemoteProxyTargetDevice_getContextWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABDA18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

void __71__PKPaymentWebServiceRemoteProxyTargetDevice_getContextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "context");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)queueConnectionToTrustedServiceManagerForPushTopic:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PKPaymentWebServiceRemoteProxyTargetDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __112__PKPaymentWebServiceRemoteProxyTargetDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "paymentWebService:queueConnectionToTrustedServiceManagerForPushTopic:withCompletion:", *(_QWORD *)(a1[4] + 16), a1[5], a1[6]);
}

- (void)getEncryptedServiceProviderDataForSecureElementPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__PKPaymentWebServiceRemoteProxyTargetDevice_getEncryptedServiceProviderDataForSecureElementPass_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __109__PKPaymentWebServiceRemoteProxyTargetDevice_getEncryptedServiceProviderDataForSecureElementPass_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "encryptedServiceProviderDataForSecureElementPass:completion:", a1[5], a1[6]);
}

- (void)getConfigurationDataWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__PKPaymentWebServiceRemoteProxyTargetDevice_getConfigurationDataWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __81__PKPaymentWebServiceRemoteProxyTargetDevice_getConfigurationDataWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "paymentWebService:configurationDataWithCompletionHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40));
}

- (void)getRegistrationDataWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PKPaymentWebServiceRemoteProxyTargetDevice_getRegistrationDataWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __80__PKPaymentWebServiceRemoteProxyTargetDevice_getRegistrationDataWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "paymentWebService:registrationDataWithCompletionHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40));
}

- (void)getTrustedDeviceEnrollmentInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__PKPaymentWebServiceRemoteProxyTargetDevice_getTrustedDeviceEnrollmentInfoWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABDA18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

void __91__PKPaymentWebServiceRemoteProxyTargetDevice_getTrustedDeviceEnrollmentInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "trustedDeviceEnrollmentInfoForWebService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *handlerQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  handlerQueue = self->_handlerQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__PKPaymentWebServiceRemoteProxyTargetDevice_signData_signatureEntanglementMode_withCompletion___block_invoke;
  v13[3] = &unk_1E2ABE080;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(handlerQueue, v13);

}

uint64_t __96__PKPaymentWebServiceRemoteProxyTargetDevice_signData_signatureEntanglementMode_withCompletion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "paymentWebService:signData:signatureEntanglementMode:withCompletionHandler:", *(_QWORD *)(a1[4] + 16), a1[5], a1[7], a1[6]);
}

- (void)getProvisioningDataIncludingDeviceMetadata:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *handlerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PKPaymentWebServiceRemoteProxyTargetDevice_getProvisioningDataIncludingDeviceMetadata_withCompletion___block_invoke;
  block[3] = &unk_1E2ABE0A8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __104__PKPaymentWebServiceRemoteProxyTargetDevice_getProvisioningDataIncludingDeviceMetadata_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "paymentWebService:provisioningDataIncludingDeviceMetadata:withCompletionHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)deleteApplicationWithAID:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PKPaymentWebServiceRemoteProxyTargetDevice_deleteApplicationWithAID___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __71__PKPaymentWebServiceRemoteProxyTargetDevice_deleteApplicationWithAID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "paymentWebService:deleteApplicationWithAID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40));
}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__PKPaymentWebServiceRemoteProxyTargetDevice_deleteKeyMaterialForSubCredentialId___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __82__PKPaymentWebServiceRemoteProxyTargetDevice_deleteKeyMaterialForSubCredentialId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "deleteKeyMaterialForSubCredentialId:", *(_QWORD *)(a1 + 40));
}

- (void)didRegisterWithRegionMap:(id)a3 primaryRegionTopic:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_didRegisterWithRegionMap_primaryRegionTopic___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __90__PKPaymentWebServiceRemoteProxyTargetDevice_didRegisterWithRegionMap_primaryRegionTopic___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "paymentWebService:didRegisterWithRegionMap:primaryRegionTopic:", *(_QWORD *)(a1[4] + 16), a1[5], a1[6]);
}

- (void)paymentSupportedInCurrentRegion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PKPaymentWebServiceRemoteProxyTargetDevice_paymentSupportedInCurrentRegion___block_invoke;
  v7[3] = &unk_1E2ABDA18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __78__PKPaymentWebServiceRemoteProxyTargetDevice_paymentSupportedInCurrentRegion___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "paymentSupportedInCurrentRegionForWebService:", *(_QWORD *)(*(_QWORD *)(result + 32) + 16)));
  return result;
}

- (void)registrationSupportedInCurrentRegionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *handlerQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    handlerQueue = self->_handlerQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __97__PKPaymentWebServiceRemoteProxyTargetDevice_registrationSupportedInCurrentRegionWithCompletion___block_invoke;
    v7[3] = &unk_1E2ABDA18;
    v7[4] = self;
    v8 = v4;
    dispatch_async(handlerQueue, v7);

  }
}

uint64_t __97__PKPaymentWebServiceRemoteProxyTargetDevice_registrationSupportedInCurrentRegionWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "registrationSupportedInCurrentRegionForWebService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)));
}

- (void)noteProvisioningUserInterfaceDidAppear
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningUserInterfaceDidAppear__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __84__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningUserInterfaceDidAppear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "noteProvisioningUserInterfaceDidAppear");
}

- (void)noteProvisioningUserInterfaceDidDisappear
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningUserInterfaceDidDisappear__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __87__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningUserInterfaceDidDisappear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "noteProvisioningUserInterfaceDidDisappear");
}

- (void)noteProvisioningDidBegin
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningDidBegin__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __70__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningDidBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "noteProvisioningDidBegin");
}

- (void)noteProvisioningDidEnd
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningDidEnd__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __68__PKPaymentWebServiceRemoteProxyTargetDevice_noteProvisioningDidEnd__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "noteProvisioningDidEnd");
}

- (void)setNewAuthRandomIfNecessaryReturningPairingState:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__PKPaymentWebServiceRemoteProxyTargetDevice_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __95__PKPaymentWebServiceRemoteProxyTargetDevice_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "paymentWebService:setNewAuthRandomIfNecessaryReturningPairingState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40));
}

- (void)setNewAuthRandom:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PKPaymentWebServiceRemoteProxyTargetDevice_setNewAuthRandom___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __63__PKPaymentWebServiceRemoteProxyTargetDevice_setNewAuthRandom___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "paymentWebService:setNewAuthRandom:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40));
}

- (void)hasPassesOfType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *handlerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKPaymentWebServiceRemoteProxyTargetDevice_hasPassesOfType_completion___block_invoke;
  block[3] = &unk_1E2ABDBD0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(handlerQueue, block);

}

_QWORD *__73__PKPaymentWebServiceRemoteProxyTargetDevice_hasPassesOfType_completion___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[5];
  if (v1)
    return (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(result[4] + 24), "paymentWebService:hasPassesOfType:", *(_QWORD *)(result[4] + 16), result[6]));
  return result;
}

- (void)passesOfType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *handlerQueue;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    handlerQueue = self->_handlerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__PKPaymentWebServiceRemoteProxyTargetDevice_passesOfType_completion___block_invoke;
    block[3] = &unk_1E2ABDBD0;
    block[4] = self;
    v10 = v6;
    v11 = a3;
    dispatch_async(handlerQueue, block);

  }
}

void __70__PKPaymentWebServiceRemoteProxyTargetDevice_passesOfType_completion___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  v1 = a1[5];
  objc_msgSend(*(id *)(a1[4] + 24), "paymentWebService:passesOfType:", *(_QWORD *)(a1[4] + 16), a1[6]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)canProvisionPaymentPassWithPrimaryAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__PKPaymentWebServiceRemoteProxyTargetDevice_canProvisionPaymentPassWithPrimaryAccountIdentifier_completion___block_invoke;
  block[3] = &unk_1E2ABDA68;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(handlerQueue, block);

}

_QWORD *__109__PKPaymentWebServiceRemoteProxyTargetDevice_canProvisionPaymentPassWithPrimaryAccountIdentifier_completion___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[6];
  if (v1)
    return (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(result[4] + 24), "paymentWebService:canProvisionPaymentPassWithPrimaryAccountIdentifier:", *(_QWORD *)(result[4] + 16), result[5]));
  return result;
}

- (void)validateAddPreconditionsWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PKPaymentWebServiceRemoteProxyTargetDevice_validateAddPreconditionsWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

void __85__PKPaymentWebServiceRemoteProxyTargetDevice_validateAddPreconditionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(v1 + 16);
  v3 = *(void **)(v1 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__PKPaymentWebServiceRemoteProxyTargetDevice_validateAddPreconditionsWithCompletion___block_invoke_2;
  v5[3] = &unk_1E2ABE148;
  v6 = v2;
  objc_msgSend(v3, "paymentWebService:validateAddPreconditionsWithCompletion:", v4, v5);

}

uint64_t __85__PKPaymentWebServiceRemoteProxyTargetDevice_validateAddPreconditionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)downloadAllPaymentPasses
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentWebServiceRemoteProxyTargetDevice_downloadAllPaymentPasses__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __70__PKPaymentWebServiceRemoteProxyTargetDevice_downloadAllPaymentPasses__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "downloadAllPaymentPassesForPaymentWebService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)claimSecureElementForCurrentUserWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__PKPaymentWebServiceRemoteProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __93__PKPaymentWebServiceRemoteProxyTargetDevice_claimSecureElementForCurrentUserWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "claimSecureElementForCurrentUserWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)secureElementOwnershipStateForCurrentUserWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__PKPaymentWebServiceRemoteProxyTargetDevice_secureElementOwnershipStateForCurrentUserWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABDA18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __102__PKPaymentWebServiceRemoteProxyTargetDevice_secureElementOwnershipStateForCurrentUserWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "secureElementOwnershipStateForCurrentUser"));
  return result;
}

- (void)validateTransferPreconditionsWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_validateTransferPreconditionsWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

void __90__PKPaymentWebServiceRemoteProxyTargetDevice_validateTransferPreconditionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(v1 + 16);
  v3 = *(void **)(v1 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_validateTransferPreconditionsWithCompletion___block_invoke_2;
  v5[3] = &unk_1E2ABE148;
  v6 = v2;
  objc_msgSend(v3, "paymentWebService:validateTransferPreconditionsWithCompletion:", v4, v5);

}

uint64_t __90__PKPaymentWebServiceRemoteProxyTargetDevice_validateTransferPreconditionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)handlePotentialExpressPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PKPaymentWebServiceRemoteProxyTargetDevice_handlePotentialExpressPass_withCompletion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __88__PKPaymentWebServiceRemoteProxyTargetDevice_handlePotentialExpressPass_withCompletion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "paymentWebService:handlePotentialExpressPass:withCompletionHandler:", *(_QWORD *)(a1[4] + 16), a1[5], a1[6]);
}

- (void)addPassData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PKPaymentWebServiceRemoteProxyTargetDevice *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentWebServiceRemoteProxyTargetDevice_addPassData_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

void __69__PKPaymentWebServiceRemoteProxyTargetDevice_addPassData_completion___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v2 = +[PKObject createWithData:warnings:error:](PKPass, "createWithData:warnings:error:", a1[4], 0, 0);
  if (objc_msgSend(v2, "passType") == 1)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  if (v4)
  {
    v5 = a1[5];
    v6 = (void *)a1[6];
    v8 = *(_QWORD *)(v5 + 16);
    v7 = *(void **)(v5 + 24);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__PKPaymentWebServiceRemoteProxyTargetDevice_addPassData_completion___block_invoke_2;
    v10[3] = &unk_1E2ABE170;
    v11 = v6;
    objc_msgSend(v7, "paymentWebService:addPaymentPass:withCompletionHandlerV2:", v8, v4, v10);

  }
  else
  {
    v9 = a1[6];
    if (v9)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, 0, 0);
  }

}

uint64_t __69__PKPaymentWebServiceRemoteProxyTargetDevice_addPassData_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, _QWORD))(result + 16))(result, a2 != 0, 0);
  return result;
}

- (void)removePass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentWebServiceRemoteProxyTargetDevice_removePass_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __68__PKPaymentWebServiceRemoteProxyTargetDevice_removePass_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "paymentWebService:removePass:withCompletionHandler:", *(_QWORD *)(a1[4] + 16), a1[5], a1[6]);
}

- (void)supportsPeerPaymentRegistrationWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__PKPaymentWebServiceRemoteProxyTargetDevice_supportsPeerPaymentRegistrationWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABDA18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __92__PKPaymentWebServiceRemoteProxyTargetDevice_supportsPeerPaymentRegistrationWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "paymentWebServiceSupportsPeerPaymentRegistration:", *(_QWORD *)(*(_QWORD *)(result + 32) + 16)));
  return result;
}

- (void)supportsAccountsWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PKPaymentWebServiceRemoteProxyTargetDevice_supportsAccountsWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABDA18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __77__PKPaymentWebServiceRemoteProxyTargetDevice_supportsAccountsWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "paymentWebServiceSupportsAccounts:", *(_QWORD *)(*(_QWORD *)(result + 32) + 16)));
  return result;
}

- (void)supportedFeatureIdentifiersWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__PKPaymentWebServiceRemoteProxyTargetDevice_supportedFeatureIdentifiersWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABDA18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

void __88__PKPaymentWebServiceRemoteProxyTargetDevice_supportedFeatureIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "supportedFeatureIdentifiersWithPaymentWebService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)supportedFeatureIdentifiersForAccountProvisioningWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __110__PKPaymentWebServiceRemoteProxyTargetDevice_supportedFeatureIdentifiersForAccountProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABDA18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

void __110__PKPaymentWebServiceRemoteProxyTargetDevice_supportedFeatureIdentifiersForAccountProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)updatedAccountsForProvisioningWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__PKPaymentWebServiceRemoteProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __91__PKPaymentWebServiceRemoteProxyTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updatedAccountsForProvisioningWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__PKPaymentWebServiceRemoteProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __101__PKPaymentWebServiceRemoteProxyTargetDevice_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "triggerCloudStoreZoneCreationForAccount:withCompletion:", a1[5], a1[6]);
}

- (void)cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __101__PKPaymentWebServiceRemoteProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __101__PKPaymentWebServiceRemoteProxyTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cachedFeatureApplicationsForProvisioningWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)featureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__PKPaymentWebServiceRemoteProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __95__PKPaymentWebServiceRemoteProxyTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "featureApplicationsForProvisioningWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)deviceMetadataWithFields:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *handlerQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKPaymentWebServiceRemoteProxyTargetDevice_deviceMetadataWithFields_completion___block_invoke;
  block[3] = &unk_1E2ABE198;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __82__PKPaymentWebServiceRemoteProxyTargetDevice_deviceMetadataWithFields_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "paymentWebService:deviceMetadataWithFields:completion:", *(_QWORD *)(a1[4] + 16), a1[6], a1[5]);
}

- (void)updateAccountWithIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentWebServiceTargetDeviceProtocol paymentWebService:updateAccountWithIdentifier:completion:](self->_targetDevice, "paymentWebService:updateAccountWithIdentifier:completion:", self->_webService, a3, a4);
}

- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PKPaymentWebServiceRemoteProxyTargetDevice_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke;
  block[3] = &unk_1E2ABDA68;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(handlerQueue, block);

}

uint64_t __112__PKPaymentWebServiceRemoteProxyTargetDevice_willPassWithUniqueIdentifierAutomaticallyBecomeDefault_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(a1[6] + 16))(a1[6], objc_msgSend(*(id *)(a1[4] + 24), "willPassWithUniqueIdentifierAutomaticallyBecomeDefault:", a1[5]));
}

- (void)setDefaultPaymentPassUniqueIdentifier:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__PKPaymentWebServiceRemoteProxyTargetDevice_setDefaultPaymentPassUniqueIdentifier___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __84__PKPaymentWebServiceRemoteProxyTargetDevice_setDefaultPaymentPassUniqueIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "paymentWebService:setDefaultPaymentPassUniqueIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40));
}

- (void)renewAppleAccountWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PKPaymentWebServiceRemoteProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __85__PKPaymentWebServiceRemoteProxyTargetDevice_renewAppleAccountWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "renewAppleAccountWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)appleAccountInformationWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__PKPaymentWebServiceRemoteProxyTargetDevice_appleAccountInformationWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABDA18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

void __84__PKPaymentWebServiceRemoteProxyTargetDevice_appleAccountInformationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "appleAccountInformation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__PKPaymentWebServiceRemoteProxyTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __93__PKPaymentWebServiceRemoteProxyTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "notePasscodeUpgradeFlowWillBeginWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)notePasscodeUpgradeFlowDidEnd
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKPaymentWebServiceRemoteProxyTargetDevice_notePasscodeUpgradeFlowDidEnd__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __75__PKPaymentWebServiceRemoteProxyTargetDevice_notePasscodeUpgradeFlowDidEnd__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "notePasscodeUpgradeFlowDidEnd");
}

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_enforceUpgradedPasscodePolicyWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __90__PKPaymentWebServiceRemoteProxyTargetDevice_enforceUpgradedPasscodePolicyWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enforceUpgradedPasscodePolicyWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__PKPaymentWebServiceRemoteProxyTargetDevice_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __89__PKPaymentWebServiceRemoteProxyTargetDevice_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "currentPasscodeMeetsUpgradedPasscodePolicy:", *(_QWORD *)(a1 + 40));
}

- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3
{
  NSObject *handlerQueue;
  _QWORD v4[5];
  BOOL v5;

  handlerQueue = self->_handlerQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __100__PKPaymentWebServiceRemoteProxyTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke;
  v4[3] = &unk_1E2ABE1C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(handlerQueue, v4);
}

uint64_t __100__PKPaymentWebServiceRemoteProxyTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:", *(unsigned __int8 *)(a1 + 40));
}

- (void)endRequiringUpgradedPasscodeIfNecessary
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentWebServiceRemoteProxyTargetDevice_endRequiringUpgradedPasscodeIfNecessary__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

uint64_t __85__PKPaymentWebServiceRemoteProxyTargetDevice_endRequiringUpgradedPasscodeIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "endRequiringUpgradedPasscodeIfNecessary");
}

- (void)performDeviceCheckInWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__PKPaymentWebServiceRemoteProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __81__PKPaymentWebServiceRemoteProxyTargetDevice_performDeviceCheckInWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "performDeviceCheckInWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *handlerQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  handlerQueue = self->_handlerQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __118__PKPaymentWebServiceRemoteProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke;
  v15[3] = &unk_1E2ABE1E8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(handlerQueue, v15);

}

uint64_t __118__PKPaymentWebServiceRemoteProxyTargetDevice_performDeviceRegistrationReturningContextForReason_brokerURL_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "performDeviceRegistrationReturningContextForReason:brokerURL:completion:", a1[5], a1[6], a1[7]);
}

- (void)storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentWebServiceRemoteProxyTargetDevice_storePassOwnershipToken_withIdentifier___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __85__PKPaymentWebServiceRemoteProxyTargetDevice_storePassOwnershipToken_withIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "paymentWebService:storePassOwnershipToken:withIdentifier:", *(_QWORD *)(a1[4] + 16), a1[5], a1[6]);
}

- (void)passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_passOwnershipTokenWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __90__PKPaymentWebServiceRemoteProxyTargetDevice_passOwnershipTokenWithIdentifier_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "paymentWebService:passOwnershipTokenWithIdentifier:completion:", *(_QWORD *)(a1[4] + 16), a1[5], a1[6]);
}

- (void)familyMembersWithCompletion:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PKPaymentWebServiceRemoteProxyTargetDevice_familyMembersWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __74__PKPaymentWebServiceRemoteProxyTargetDevice_familyMembersWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "familyMembersWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PKPaymentWebServiceRemoteProxyTargetDevice_generateTransactionKeyWithParameters_withCompletion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __98__PKPaymentWebServiceRemoteProxyTargetDevice_generateTransactionKeyWithParameters_withCompletion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "paymentWebService:generateTransactionKeyWithParameters:withCompletion:", *(_QWORD *)(a1[4] + 16), a1[5], a1[6]);
}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKPaymentWebServiceRemoteProxyTargetDevice_statusForShareableCredentials_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __87__PKPaymentWebServiceRemoteProxyTargetDevice_statusForShareableCredentials_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "statusForShareableCredentials:completion:", a1[5], a1[6]);
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *handlerQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  handlerQueue = self->_handlerQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__PKPaymentWebServiceRemoteProxyTargetDevice_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke;
  v13[3] = &unk_1E2ABE210;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(handlerQueue, v13);

}

uint64_t __101__PKPaymentWebServiceRemoteProxyTargetDevice_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "prepareProvisioningTarget:checkFamilyCircle:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__PKPaymentWebServiceRemoteProxyTargetDevice_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __101__PKPaymentWebServiceRemoteProxyTargetDevice_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "provisionHomeKeyPassForSerialNumbers:completionHandler:", a1[5], a1[6]);
}

- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__PKPaymentWebServiceRemoteProxyTargetDevice_availableHomeKeyPassesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, v7);

}

uint64_t __90__PKPaymentWebServiceRemoteProxyTargetDevice_availableHomeKeyPassesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "availableHomeKeyPassesWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *handlerQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  handlerQueue = self->_handlerQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __137__PKPaymentWebServiceRemoteProxyTargetDevice_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke;
  v23[3] = &unk_1E2ABE238;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(handlerQueue, v23);

}

uint64_t __137__PKPaymentWebServiceRemoteProxyTargetDevice_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "createFidoKeyForRelyingParty:relyingPartyAccountHash:challenge:externalizedAuth:completion:", a1[5], a1[6], a1[7], a1[8], a1[9]);
}

- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *handlerQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __129__PKPaymentWebServiceRemoteProxyTargetDevice_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke;
  block[3] = &unk_1E2ABE260;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(handlerQueue, block);

}

uint64_t __129__PKPaymentWebServiceRemoteProxyTargetDevice_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "checkFidoKeyPresenceForRelyingParty:relyingPartyAccountHash:fidoKeyHash:completion:", a1[5], a1[6], a1[7], a1[8]);
}

- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *handlerQueue;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  handlerQueue = self->_handlerQueue;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __171__PKPaymentWebServiceRemoteProxyTargetDevice_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke;
  v30[3] = &unk_1E2ABE288;
  v30[4] = self;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v35 = v19;
  v36 = v20;
  v37 = v21;
  v23 = v21;
  v24 = v20;
  v25 = v19;
  v26 = v18;
  v27 = v17;
  v28 = v16;
  v29 = v15;
  dispatch_async(handlerQueue, v30);

}

uint64_t __171__PKPaymentWebServiceRemoteProxyTargetDevice_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "signWithFidoKeyForRelyingParty:relyingPartyAccountHash:fidoKeyHash:challenge:publicKeyIdentifier:externalizedAuth:completion:", a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11]);
}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__PKPaymentWebServiceRemoteProxyTargetDevice_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __107__PKPaymentWebServiceRemoteProxyTargetDevice_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "generateSEEncryptionCertificateForSubCredentialId:completion:", a1[5], a1[6]);
}

- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__PKPaymentWebServiceRemoteProxyTargetDevice_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __108__PKPaymentWebServiceRemoteProxyTargetDevice_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "generateISOEncryptionCertificateForSubCredentialId:completion:", a1[5], a1[6]);
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *handlerQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  handlerQueue = self->_handlerQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__PKPaymentWebServiceRemoteProxyTargetDevice_addISO18013Blobs_cardType_completion___block_invoke;
  v13[3] = &unk_1E2ABE080;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(handlerQueue, v13);

}

uint64_t __83__PKPaymentWebServiceRemoteProxyTargetDevice_addISO18013Blobs_cardType_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "addISO18013Blobs:cardType:completion:", a1[5], a1[7], a1[6]);
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *handlerQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  handlerQueue = self->_handlerQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __118__PKPaymentWebServiceRemoteProxyTargetDevice_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke;
  v13[3] = &unk_1E2ABE210;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(handlerQueue, v13);

}

uint64_t __118__PKPaymentWebServiceRemoteProxyTargetDevice_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "longTermPrivacyKeyForCredentialGroupIdentifier:reuseExisting:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentWebServiceRemoteProxyTargetDevice_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

uint64_t __102__PKPaymentWebServiceRemoteProxyTargetDevice_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "generateAuxiliaryCapabilitiesForRequirements:completion:", a1[5], a1[6]);
}

- (void)usingSynchronousProxy:(BOOL)a3 meetsProvisioningRequirements:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  void (**v7)(id, uint64_t, id);
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a5;
  v8 = a4;
  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v6)
  {
    v13 = 0;
    v10 = objc_msgSend(v9, "meetsProvisioningRequirements:missingRequirements:", v8, &v13);

    v11 = v13;
    v7[2](v7, v10, v11);

  }
  else
  {
    objc_msgSend(v9, "meetsProvisioningRequirements:completion:", v8, v7);

  }
}

- (void)currentSecureElementSnapshot:(id)a3
{
  id v3;
  PKPaymentService *v4;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentService);
  -[PKPaymentService currentSecureElementSnapshot:](v4, "currentSecureElementSnapshot:", v3);

}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKPaymentService *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PKPaymentService);
  -[PKPaymentService reserveStorageForAppletTypes:metadata:completion:](v10, "reserveStorageForAppletTypes:metadata:completion:", v9, v8, v7);

}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  PKPaymentService *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PKPaymentService);
  -[PKPaymentService deleteReservation:completion:](v7, "deleteReservation:completion:", v6, v5);

}

- (void)archiveContext:(id)a3
{
  id v4;
  NSObject *handlerQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentWebServiceRemoteProxyTargetDevice_archiveContext___block_invoke;
  block[3] = &unk_1E2ABE120;
  v8 = v4;
  v6 = v4;
  dispatch_async(handlerQueue, block);

}

void __61__PKPaymentWebServiceRemoteProxyTargetDevice_archiveContext___block_invoke(uint64_t a1)
{
  PKPaymentService *v2;

  v2 = objc_alloc_init(PKPaymentService);
  -[PKPaymentService setSharedPaymentWebServiceContext:](v2, "setSharedPaymentWebServiceContext:", *(_QWORD *)(a1 + 32));

}

- (void)invalidateRemoteProxyTargetDevice
{
  NSObject *handlerQueue;
  _QWORD block[5];

  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentWebServiceRemoteProxyTargetDevice_invalidateRemoteProxyTargetDevice__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(handlerQueue, block);
}

void __79__PKPaymentWebServiceRemoteProxyTargetDevice_invalidateRemoteProxyTargetDevice__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedObject:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceRemoteProxyTargetDevice with Web Service: %@ invalidated.", (uint8_t *)&v6, 0xCu);
  }

}

- (void)applePayTrustKeyForIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)createApplePayTrustKeyWithRequest:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)deleteApplePayTrustKeyWithIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)maximumPaymentCardsWithCompletion:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = PKMaxPaymentCards();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);

}

- (void)allPaymentApplicationUsageSummariesWithCompletion:(id)a3
{
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  id v5;
  id v6;

  targetDevice = self->_targetDevice;
  v5 = a3;
  -[PKPaymentWebServiceTargetDeviceProtocol allPaymentApplicationUsageSummaries](targetDevice, "allPaymentApplicationUsageSummaries");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)secureElementIsAvailableWithCompletion:(id)a3
{
  _BOOL8 v4;
  id v5;

  v5 = a3;
  v4 = PKSecureElementIsAvailable() != 0;
  (*((void (**)(id, _BOOL8))a3 + 2))(v5, v4);

}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v6;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  targetDevice = self->_targetDevice;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__PKPaymentWebServiceRemoteProxyTargetDevice_addPendingProvisionings_completion___block_invoke;
  v9[3] = &unk_1E2ABD9C8;
  v10 = v6;
  v8 = v6;
  -[PKPaymentWebServiceTargetDeviceProtocol addPendingProvisionings:completion:](targetDevice, "addPendingProvisionings:completion:", a3, v9);

}

uint64_t __81__PKPaymentWebServiceRemoteProxyTargetDevice_addPendingProvisionings_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end
