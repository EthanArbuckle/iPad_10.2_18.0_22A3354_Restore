@implementation PKPaymentDevice

- (PKPaymentDevice)initWithCallbackQueue:(id)a3
{
  id v5;
  PKPaymentDevice *v6;
  PKSecureElement *v7;
  PKSecureElement *secureElement;
  NSMutableArray *v9;
  NSMutableArray *metdataFetchTasks;
  dispatch_queue_t v11;
  OS_dispatch_queue *internalQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentDevice;
  v6 = -[PKPaymentDevice init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(PKSecureElement);
    secureElement = v6->_secureElement;
    v6->_secureElement = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    metdataFetchTasks = v6->_metdataFetchTasks;
    v6->_metdataFetchTasks = v9;

    objc_storeStrong((id *)&v6->_callbackQueue, a3);
    v11 = dispatch_queue_create("PKPaymentDevice", 0);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v11;

  }
  return v6;
}

- (PKPaymentDevice)init
{
  return -[PKPaymentDevice initWithCallbackQueue:](self, "initWithCallbackQueue:", MEMORY[0x1E0C80D38]);
}

- (void)dealloc
{
  NSObject *locationFixTimeout;
  objc_super v4;

  locationFixTimeout = self->_locationFixTimeout;
  if (locationFixTimeout)
    dispatch_source_cancel(locationFixTimeout);
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDevice;
  -[PKPaymentDevice dealloc](&v4, sel_dealloc);
}

+ (id)clientInfoHTTPHeader
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PKPaymentDevice_clientInfoHTTPHeader__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECF22140 != -1)
    dispatch_once(&qword_1ECF22140, block);
  return (id)_MergedGlobals_190;
}

void __39__PKPaymentDevice_clientInfoHTTPHeader__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v0 = (void *)MEMORY[0x1E0CB3940];
  PKProductType();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@"), v1);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  PKClientHTTPHeaderOSPartOverride();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (void *)MGCopyAnswer();
    PKOSVersion();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKDeviceBuildVersion();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@;%@;%@"), v6, v7, v8);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0C9AE90];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "infoDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@ (%@/%@)"), v17, v12, v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@> <%@> <%@>"), v22, v4, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)_MergedGlobals_190;
  _MergedGlobals_190 = v20;

}

+ (id)clientHardwarePlatformInfoHTTPHeader
{
  if (qword_1ECF22148 != -1)
    dispatch_once(&qword_1ECF22148, &__block_literal_global_5);
  return (id)qword_1ECF22138;
}

void __55__PKPaymentDevice_clientHardwarePlatformInfoHTTPHeader__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  PKClientHTTPHeaderHardwarePlatformOverride();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v0;
  if (v0)
  {
    v1 = v0;
  }
  else
  {
    PKHardwarePlatform();
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  v2 = (void *)qword_1ECF22138;
  qword_1ECF22138 = (uint64_t)v1;

}

- (void)queueConnectionToTrustedServiceManagerForPushTopic:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  PKSecureElement *secureElement;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  secureElement = self->_secureElement;
  if (secureElement)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__PKPaymentDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke;
    v12[3] = &unk_1E2ABDDB0;
    v12[4] = self;
    v13 = v7;
    -[PKSecureElement connectToServerWithPushTopic:completion:](secureElement, "connectToServerWithPushTopic:completion:", v6, v12);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "No secure element, cannot connect to server with push topic.", v11, 2u);
    }

    if (v8)
      v8[2](v8, 0, 0);
  }

}

void __85__PKPaymentDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD v6[4];
  id v7;
  char v8;
  _QWORD block[4];
  id v10;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __85__PKPaymentDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_2;
    v6[3] = &unk_1E2ABDCC0;
    v8 = a2;
    v7 = v2;
    v5 = v6;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke;
    block[3] = &unk_1E2ABD9A0;
    v10 = v5;
    dispatch_async(v4, block);

  }
}

void __85__PKPaymentDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (id)v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)registrationDataWithAuthToken:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  PKSecureElement *secureElement;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD aBlock[4];
  id v15;
  PKPaymentDevice *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke;
    aBlock[3] = &unk_1E2ABE030;
    v15 = v6;
    v16 = self;
    v17 = v7;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    v10 = v9;
    secureElement = self->_secureElement;
    if (secureElement)
    {
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_321;
      v12[3] = &unk_1E2ABE340;
      v13 = v9;
      -[PKSecureElement initializeSecureElementIfNecessaryWithHandler:](secureElement, "initializeSecureElementIfNecessaryWithHandler:", v12);

    }
    else
    {
      v9[2](v9);
    }

  }
}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke(uint64_t a1)
{
  PKPaymentDeviceRegistrationData *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PKPaymentDeviceRegistrationData *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  PKPaymentDeviceRegistrationData *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  PKPaymentDeviceRegistrationData *v20;
  _QWORD v21[4];
  PKPaymentDeviceRegistrationData *v22;
  id v23;
  _QWORD v24[4];
  PKPaymentDeviceRegistrationData *v25;
  NSObject *v26;
  _QWORD v27[4];
  PKPaymentDeviceRegistrationData *v28;
  NSObject *v29;
  _QWORD v30[4];
  PKPaymentDeviceRegistrationData *v31;
  NSObject *v32;

  v2 = objc_alloc_init(PKPaymentDeviceRegistrationData);
  -[PKPaymentDeviceRegistrationData setAuthorizationHeader:](v2, "setAuthorizationHeader:", *(_QWORD *)(a1 + 32));
  -[PKPaymentDeviceRegistrationData setDevSigned:](v2, "setDevSigned:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "isProductionSigned") ^ 1);
  PKProductType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDeviceRegistrationData setProductType:](v2, "setProductType:", v3);

  PKSerialNumber();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDeviceRegistrationData setDeviceSerialNumber:](v2, "setDeviceSerialNumber:", v4);

  PKMLBSerialNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDeviceRegistrationData setDeviceMLBSerialNumber:](v2, "setDeviceMLBSerialNumber:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "primarySecureElementIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDeviceRegistrationData setSecureElementIdentifier:](v2, "setSecureElementIdentifier:", v6);

  -[PKPaymentDeviceRegistrationData setWalletDeleted:](v2, "setWalletDeleted:", (unint64_t)PKCurrentPassbookState() > 1);
  v7 = dispatch_group_create();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(v9 + 32))
  {
    dispatch_group_enter(v7);
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v30[0] = v10;
    v30[1] = 3221225472;
    v30[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_2;
    v30[3] = &unk_1E2ABE2C8;
    v12 = v2;
    v31 = v12;
    v13 = v8;
    v32 = v13;
    objc_msgSend(v11, "stateInformationWithCompletion:", v30);
    dispatch_group_enter(v13);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v27[0] = v10;
    v27[1] = 3221225472;
    v27[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_3;
    v27[3] = &unk_1E2ABE2F0;
    v16 = v12;
    v28 = v16;
    v17 = v13;
    v29 = v17;
    objc_msgSend(v15, "signatureForAuthToken:completion:", v14, v27);
    dispatch_group_enter(v17);
    v18 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_4;
    v24[3] = &unk_1E2ABE318;
    v25 = v16;
    v26 = v17;
    objc_msgSend(v18, "signedPlatformDataWithCompletion:", v24);

    v9 = *(_QWORD *)(a1 + 40);
  }
  v19 = *(NSObject **)(v9 + 56);
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_5;
  v21[3] = &unk_1E2ABE058;
  v22 = v2;
  v23 = *(id *)(a1 + 48);
  v20 = v2;
  dispatch_group_notify(v8, v19, v21);

}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setSecureElementStateInformation:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setSignedAuthToken:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setPlatformData:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setPlatformDataSignature:", v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "secureElementIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "secureElementStateInformation"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "secureElementStateInformation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "secureElementIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134218240;
      v10 = v7;
      v11 = 2048;
      v12 = v8;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Discarding invalid registration data: Secure Element State Information=%p SEID=%p", (uint8_t *)&v9, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_321(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v7 = a3;
  v8 = a4;
  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKPaymentDevice: se-sep sync failed!!! Proceeding with registration...", v10, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  PKSecureElement *secureElement;
  void *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    if (PKRunningInPassd() && (secureElement = self->_secureElement) != 0)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __76__PKPaymentDevice_signData_signatureEntanglementMode_withCompletionHandler___block_invoke;
      v14[3] = &unk_1E2ABE368;
      v15 = v9;
      -[PKSecureElement signChallenge:signatureEntanglementMode:completion:](secureElement, "signChallenge:signatureEntanglementMode:completion:", v8, a4, v14);

    }
    else
    {
      +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "signData:signatureEntanglementMode:withCompletionHandler:", v8, a4, v9);

    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "No challenge provided to sign", v13, 2u);
    }

    if (v9)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
  }

}

uint64_t __76__PKPaymentDevice_signData_signatureEntanglementMode_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, a3, 0);
  return result;
}

- (void)signatureForAuthToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  PKSecureElement *secureElement;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    secureElement = self->_secureElement;
    if (secureElement)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __52__PKPaymentDevice_signatureForAuthToken_completion___block_invoke;
      v18[3] = &unk_1E2ABE390;
      v19 = v7;
      -[PKSecureElement signatureForAuthToken:completion:](secureElement, "signatureForAuthToken:completion:", v6, v18);
      v10 = v19;
LABEL_12:

      goto LABEL_13;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "No secure element, cannot sign authToken", v17, 2u);
    }

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("No secure element, cannot sign authToken");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_12;
LABEL_11:
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v10);
    goto LABEL_12;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "No authToken provided to sign", v17, 2u);
  }

  if (v8)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("No authToken provided to sign");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
LABEL_13:

}

uint64_t __52__PKPaymentDevice_signatureForAuthToken_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void)rewrapDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PKSecureElement *secureElement;
  _QWORD v10[4];
  id v11;
  _QWORD aBlock[5];
  id v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E2ABE3B8;
    aBlock[4] = self;
    v13 = v4;
    v7 = _Block_copy(aBlock);
    v8 = v7;
    secureElement = self->_secureElement;
    if (secureElement)
    {
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke_331;
      v10[3] = &unk_1E2ABE3E0;
      v11 = v7;
      -[PKSecureElement signedPlatformDataWithCompletion:](secureElement, "signedPlatformDataWithCompletion:", v10);

    }
    else
    {
      (*((void (**)(void *, _QWORD))v7 + 2))(v7, 0);
    }

  }
}

void __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E2ABE058;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "platformData");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "platformDataSignature"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Rewrap data not available", v7, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke_331(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PKPaymentDevicePlatfomData *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(PKPaymentDevicePlatfomData);
  -[PKPaymentDevicePlatfomData setPlatformData:](v7, "setPlatformData:", v6);

  -[PKPaymentDevicePlatfomData setPlatformDataSignature:](v7, "setPlatformDataSignature:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)configurationData
{
  PKPaymentDeviceConfigurationData *configurationData;
  PKPaymentDeviceConfigurationData *v4;
  void *v5;
  void *v6;
  PKPaymentDeviceConfigurationData *v7;

  configurationData = self->_configurationData;
  if (!configurationData)
  {
    v4 = objc_alloc_init(PKPaymentDeviceConfigurationData);
    -[PKSecureElement primarySecureElementIdentifier](self->_secureElement, "primarySecureElementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDeviceConfigurationData setSecureElementIdentifier:](v4, "setSecureElementIdentifier:", v5);

    -[PKPaymentDeviceConfigurationData setDevSigned:](v4, "setDevSigned:", -[PKSecureElement isProductionSigned](self->_secureElement, "isProductionSigned") ^ 1);
    -[PKSecureElement primaryJSBLSequenceCounter](self->_secureElement, "primaryJSBLSequenceCounter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDeviceConfigurationData setPrimaryJSBLSequenceCounter:](v4, "setPrimaryJSBLSequenceCounter:", v6);

    v7 = self->_configurationData;
    self->_configurationData = v4;

    configurationData = self->_configurationData;
  }
  return configurationData;
}

- (id)trustedDeviceEnrollmentInfo
{
  void *v3;
  PKTrustedDeviceEnrollmentInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  PKSecureElement *secureElement;
  void *v9;

  PKUniqueDeviceIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PKTrustedDeviceEnrollmentInfo);
  PKAssignedDeviceName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTrustedDeviceEnrollmentInfo setDeviceName:](v4, "setDeviceName:", v5);

  PKSerialNumber();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTrustedDeviceEnrollmentInfo setDeviceSerialNumber:](v4, "setDeviceSerialNumber:", v6);

  -[PKTrustedDeviceEnrollmentInfo setDeviceUDID:](v4, "setDeviceUDID:", v3);
  PKProductType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTrustedDeviceEnrollmentInfo setProductType:](v4, "setProductType:", v7);

  secureElement = self->_secureElement;
  if (secureElement)
  {
    -[PKSecureElement primarySecureElementIdentifier](secureElement, "primarySecureElementIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTrustedDeviceEnrollmentInfo setSecureElementIdentifier:](v4, "setSecureElementIdentifier:", v9);

    -[PKTrustedDeviceEnrollmentInfo setSupportsAccessExpressMode:](v4, "setSupportsAccessExpressMode:", -[PKSecureElement supportsExpressModeForExpressPassType:](self->_secureElement, "supportsExpressModeForExpressPassType:", 2));
  }

  return v4;
}

- (void)provisioningDataIncludingDeviceMetadata:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  PKPaymentDeviceProvisioningData *v8;
  PKPaymentDeviceProvisioningData *v9;
  _QWORD v10[4];
  PKPaymentDeviceProvisioningData *v11;
  id v12;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    if (v4)
      v7 = 498;
    else
      v7 = 256;
    v8 = objc_alloc_init(PKPaymentDeviceProvisioningData);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__PKPaymentDevice_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke;
    v10[3] = &unk_1E2ABE408;
    v11 = v8;
    v12 = v6;
    v9 = v8;
    -[PKPaymentDevice _populateDeviceMetadata:withFields:completion:](self, "_populateDeviceMetadata:withFields:completion:", v9, v7, v10);

  }
}

uint64_t __81__PKPaymentDevice_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)paymentDeviceMetadataFields:(unint64_t)a3 completion:(id)a4
{
  id v6;
  PKPaymentDeviceMetadata *v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(PKPaymentDeviceMetadata);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__PKPaymentDevice_paymentDeviceMetadataFields_completion___block_invoke;
    v8[3] = &unk_1E2ABE430;
    v9 = v6;
    -[PKPaymentDevice _populateDeviceMetadata:withFields:completion:](self, "_populateDeviceMetadata:withFields:completion:", v7, a3, v8);

  }
}

uint64_t __58__PKPaymentDevice_paymentDeviceMetadataFields_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_populateDeviceMetadata:(id)a3 withFields:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *internalQueue;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  PKPaymentDevice *v16;
  id v17;
  unint64_t v18;
  _QWORD block[4];
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    if (v8 && a4)
    {
      v11 = MEMORY[0x1E0C809B0];
      internalQueue = self->_internalQueue;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke;
      v14[3] = &unk_1E2ABE080;
      v18 = a4;
      v15 = v8;
      v16 = self;
      v17 = v10;
      v13 = v14;
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __dispatch_async_ar_block_invoke;
      block[3] = &unk_1E2ABD9A0;
      v20 = v13;
      dispatch_async(internalQueue, block);

    }
    else
    {
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }
  }

}

void __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  _QWORD *v38;
  PKPaymentDeviceMetadataFetchTask *v39;
  uint64_t v40;
  dispatch_source_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  dispatch_time_t v45;
  _QWORD *v46;
  void *v47;
  NSObject *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  PKPaymentDeviceMetadataFetchTask *v54;
  _QWORD handler[4];
  id v56[2];
  _QWORD block[5];
  uint8_t buf[8];
  uint64_t v59;
  void (*v60)(uint64_t);
  void *v61;
  id v62;

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x10) != 0)
  {
    v3 = *(void **)(a1 + 32);
    PKAssignedDeviceName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeviceName:", v4);

    v2 = *(_QWORD *)(a1 + 56);
    if ((v2 & 8) == 0)
    {
LABEL_3:
      if ((v2 & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v2 & 8) == 0)
  {
    goto LABEL_3;
  }
  v5 = *(void **)(a1 + 32);
  PKSerialNumber();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSerialNumber:", v6);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 2) == 0)
  {
LABEL_4:
    if ((v2 & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v7 = *(void **)(a1 + 32);
  PKUniqueDeviceIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUniqueDeviceIdentifier:", v8);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 4) == 0)
  {
LABEL_5:
    if ((v2 & 1) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v9 = *(void **)(a1 + 32);
  PKUniqueChipIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUniqueChipIdentifier:", v10);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 1) == 0)
  {
LABEL_6:
    if ((v2 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "primarySecureElementIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSecureElementIdentifier:", v12);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x100) == 0)
  {
LABEL_7:
    if ((v2 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "primaryJSBLSequenceCounter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPrimaryJSBLSequenceCounter:", v14);

  v2 = *(_QWORD *)(a1 + 56);
  if ((v2 & 0x20) == 0)
  {
LABEL_8:
    if ((v2 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_19;
  }
LABEL_16:
  PKDevicePhoneNumber();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setPhoneNumber:", v15);

  if ((*(_QWORD *)(a1 + 56) & 0x40) != 0)
  {
LABEL_19:
    PKDevicePhoneNumberSignature();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = *(void **)(a1 + 32);
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CA78C8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSignedPhoneNumber:", v19);

      v20 = *(void **)(a1 + 32);
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CA78D0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSignedPhoneNumberVersion:", v21);

    }
  }
LABEL_22:
  v22 = (void *)MEMORY[0x1E0C9E3C8];
  PKPassKitCoreBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bundlePath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v22, "authorizationStatusForBundlePath:", v24);

  if (objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled")
    && (v25 - 3) <= 0xFFFFFFFD
    && (objc_msgSend(*(id *)(a1 + 40), "skipLocationCheck") & 1) == 0
    && (*(_BYTE *)(a1 + 56) & 0x80) != 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v32, OS_LOG_TYPE_DEFAULT, "Can determine device location.", buf, 2u);
    }

    v33 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(v33 + 8))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_336;
      block[3] = &unk_1E2ABE120;
      block[4] = v33;
      dispatch_sync(MEMORY[0x1E0C80D38], block);
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v32, OS_LOG_TYPE_DEFAULT, "Requesting when in user authorization for PassKitCore", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "requestWhenInUseAuthorization");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "location");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v34;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) && v34 && _LocationMeetsAccuracyCriteria(v34))
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v32, OS_LOG_TYPE_DEFAULT, "Immediately retrieved location", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setLocation:", v31);
      v35 = *(void **)(a1 + 48);
      v36 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
      v37 = MEMORY[0x1E0C809B0];
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_340;
      v52[3] = &unk_1E2ABDA18;
      v54 = v35;
      v53 = *(id *)(a1 + 32);
      v38 = v52;
      *(_QWORD *)buf = v37;
      v59 = 3221225472;
      v60 = __dispatch_async_ar_block_invoke;
      v61 = &unk_1E2ABD9A0;
      v62 = v38;
      dispatch_async(v36, buf);

      v39 = v54;
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v32, OS_LOG_TYPE_DEFAULT, "Start updating location…", buf, 2u);
      }

      v39 = objc_alloc_init(PKPaymentDeviceMetadataFetchTask);
      -[PKPaymentDeviceMetadataFetchTask setDeviceMetadata:](v39, "setDeviceMetadata:", *(_QWORD *)(a1 + 32));
      -[PKPaymentDeviceMetadataFetchTask setRequestedFields:](v39, "setRequestedFields:", *(_QWORD *)(a1 + 56));
      -[PKPaymentDeviceMetadataFetchTask setRemaningFields:](v39, "setRemaningFields:", 128);
      -[PKPaymentDeviceMetadataFetchTask setCompletion:](v39, "setCompletion:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "addObject:", v39);
      v40 = *(_QWORD *)(a1 + 40);
      if (!*(_QWORD *)(v40 + 24))
      {
        v41 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v40 + 64));
        v42 = *(_QWORD *)(a1 + 40);
        v43 = *(void **)(v42 + 24);
        *(_QWORD *)(v42 + 24) = v41;

        v44 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
        v45 = dispatch_walltime(0, 10000000000);
        dispatch_source_set_timer(v44, v45, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        v46 = *(_QWORD **)(a1 + 40);
        v47 = (void *)v46[3];
        objc_initWeak((id *)buf, v46);
        v48 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_339;
        handler[3] = &unk_1E2ABE458;
        objc_copyWeak(v56, (id *)buf);
        v56[1] = v47;
        dispatch_source_set_event_handler(v48, handler);
        dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 24));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "startUpdatingLocation");
        objc_destroyWeak(v56);
        objc_destroyWeak((id *)buf);
      }
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Returning device metadata without location", buf, 2u);
    }

    v27 = *(void **)(a1 + 48);
    v28 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
    v29 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_341;
    v49[3] = &unk_1E2ABDA18;
    v51 = v27;
    v50 = *(id *)(a1 + 32);
    v30 = v49;
    *(_QWORD *)buf = v29;
    v59 = 3221225472;
    v60 = __dispatch_async_ar_block_invoke;
    v61 = &unk_1E2ABD9A0;
    v62 = v30;
    dispatch_async(v28, buf);

    v31 = v51;
  }

}

void __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_336(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0C9E3C8]);
  PKPassKitCoreBundle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithEffectiveBundlePath:delegate:onQueue:", v3, *(_QWORD *)(a1 + 32), MEMORY[0x1E0C80D38]);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

}

void __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_339(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = (void *)MEMORY[0x19400CFE8]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *((_QWORD *)WeakRetained + 3);
    if (v5)
    {
      if (*(_QWORD *)(a1 + 40) == v5)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Location did time out", v7, 2u);
        }

        objc_msgSend(v4, "_finishLocationFixWithLocation:", 0);
      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_340(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_341(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)hasRegistrationRegionMap
{
  return -[PKSecureElement hasRegistrationInformation](self->_secureElement, "hasRegistrationInformation");
}

- (void)setRegistrationRegionMap:(id)a3 primaryRegionTopic:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Setting registration information on Secure Element %@ primaryRegionTopic %@", (uint8_t *)&v9, 0x16u);
  }

  -[PKSecureElement setRegistrationInformation:primaryRegionTopic:](self->_secureElement, "setRegistrationInformation:primaryRegionTopic:", v6, v7);
}

- (void)deleteApplicationWithAID:(id)a3
{
  -[PKSecureElement markAppletWithIdentifierForDeletion:completion:](self->_secureElement, "markAppletWithIdentifierForDeletion:completion:", a3, 0);
}

- (void)SEPParingInformationWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  PKSecureElement *secureElement;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v4;
  secureElement = self->_secureElement;
  if (secureElement)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__PKPaymentDevice_SEPParingInformationWithCompletion___block_invoke;
    v9[3] = &unk_1E2ABE340;
    v10 = v4;
    -[PKSecureElement SEPPairingInfoWithCompletion:](secureElement, "SEPPairingInfoWithCompletion:", v9);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "No secure element, cannot return SEP Pairing info", v8, 2u);
    }

    if (v5)
      v5[2](v5, 0, 0, 0);
  }

}

uint64_t __54__PKPaymentDevice_SEPParingInformationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)primarySecureElementIdentifier
{
  return -[PKSecureElement primarySecureElementIdentifier](self->_secureElement, "primarySecureElementIdentifier");
}

- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4
{
  -[PKSecureElement generateTransactionKeyWithParameters:withCompletion:](self->_secureElement, "generateTransactionKeyWithParameters:withCompletion:", a3, a4);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  NSObject *internalQueue;
  uint64_t v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[8];
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Location did update", buf, 2u);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  v11 = v9;
  if (!v10)
    goto LABEL_16;
  v12 = v10;
  v13 = 0;
  v14 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v24 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      if (_LocationMeetsAccuracyCriteria(v16))
      {
        v17 = v16;

        v13 = v17;
      }
    }
    v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  }
  while (v12);

  if (v13)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Found candidate location", buf, 2u);
    }

    internalQueue = self->_internalQueue;
    v19 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __54__PKPaymentDevice_locationManager_didUpdateLocations___block_invoke;
    v21[3] = &unk_1E2ABE0D0;
    v21[4] = self;
    v22 = v13;
    v20 = v21;
    *(_QWORD *)buf = v19;
    v28 = 3221225472;
    v29 = __dispatch_async_ar_block_invoke;
    v30 = &unk_1E2ABD9A0;
    v31 = v20;
    v11 = v13;
    dispatch_async(internalQueue, buf);

LABEL_16:
  }

}

uint64_t __54__PKPaymentDevice_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishLocationFixWithLocation:", *(_QWORD *)(a1 + 40));
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *internalQueue;
  _QWORD *v12;
  objc_class *v13;
  void *v14;
  _QWORD v15[5];
  _BYTE buf[24];
  void *v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(a4, "code");
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Location did fail", buf, 2u);
    }

    v10 = MEMORY[0x1E0C809B0];
    internalQueue = self->_internalQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__PKPaymentDevice_locationManager_didFailWithError___block_invoke;
    v15[3] = &unk_1E2ABE120;
    v15[4] = self;
    v12 = v15;
    *(_QWORD *)buf = v10;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __dispatch_async_ar_block_invoke;
    v17 = &unk_1E2ABD9A0;
    v18 = v12;
    dispatch_async(internalQueue, buf);

  }
  else
  {
    if (v9)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@: Location Manager %@ unable to retreve location, will retry.", buf, 0x16u);

    }
  }

}

uint64_t __52__PKPaymentDevice_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishLocationFixWithLocation:", 0);
}

- (void)_finishLocationFixWithLocation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *locationFixTimeout;
  OS_dispatch_source *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_metdataFetchTasks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "remaningFields", (_QWORD)v15);
        if ((v11 & 0x80) != 0)
        {
          objc_msgSend(v10, "setRemaningFields:", v11 & 0xFFFFFFFFFFFFFF7FLL);
          if (v4)
          {
            objc_msgSend(v10, "deviceMetadata");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setLocation:", v4);

          }
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  locationFixTimeout = self->_locationFixTimeout;
  if (locationFixTimeout)
  {
    dispatch_source_cancel(locationFixTimeout);
    v14 = self->_locationFixTimeout;
    self->_locationFixTimeout = 0;

  }
  -[PKPaymentDevice _executeDeviceMetadataFetchTasksCompletionHandlers](self, "_executeDeviceMetadataFetchTasksCompletionHandlers", (_QWORD)v15);

}

- (void)_executeDeviceMetadataFetchTasksCompletionHandlers
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *callbackQueue;
  id v14;
  _QWORD *v15;
  NSMutableArray *metdataFetchTasks;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_metdataFetchTasks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = MEMORY[0x1E0C809B0];
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "remaningFields"))
        {
          -[NSMutableArray addObject:](v3, "addObject:", v10);
        }
        else
        {
          objc_msgSend(v10, "completion");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            callbackQueue = self->_callbackQueue;
            v17[0] = v7;
            v17[1] = 3221225472;
            v17[2] = __69__PKPaymentDevice__executeDeviceMetadataFetchTasksCompletionHandlers__block_invoke;
            v17[3] = &unk_1E2ABDA18;
            v14 = v11;
            v17[4] = v10;
            v18 = v14;
            v15 = v17;
            block[0] = v7;
            block[1] = 3221225472;
            block[2] = __dispatch_async_ar_block_invoke;
            block[3] = &unk_1E2ABD9A0;
            v24 = v15;
            dispatch_async(callbackQueue, block);

          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

  metdataFetchTasks = self->_metdataFetchTasks;
  self->_metdataFetchTasks = v3;

}

void __69__PKPaymentDevice__executeDeviceMetadataFetchTasksCompletionHandlers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Calling device metadata completion handler", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "deviceMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (void)queueConnectionToTrustedServiceManagerWithCompletion:(id)a3
{
  -[PKPaymentDevice queueConnectionToTrustedServiceManagerForPushTopic:withCompletion:](self, "queueConnectionToTrustedServiceManagerForPushTopic:withCompletion:", CFSTR("com.apple.seld"), a3);
}

- (void)configurationDataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *callbackQueue;
  uint64_t v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    callbackQueue = self->_callbackQueue;
    v7 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__PKPaymentDevice_configurationDataWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E2ABDA18;
    v9[4] = self;
    v10 = v4;
    v8 = v9;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke;
    block[3] = &unk_1E2ABD9A0;
    v12 = v8;
    dispatch_async(callbackQueue, block);

  }
}

void __58__PKPaymentDevice_configurationDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "configurationData");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (BOOL)skipLocationCheck
{
  return self->_skipLocationCheck;
}

- (void)setSkipLocationCheck:(BOOL)a3
{
  self->_skipLocationCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_metdataFetchTasks, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_locationFixTimeout, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
