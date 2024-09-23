@implementation PKPaymentWebServiceTargetDevice

- (id)appleAccountInformation
{
  void *v2;
  void *v3;

  +[PKAppleAccountManager sharedInstance](PKAppleAccountManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleAccountInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __52__PKPaymentWebServiceTargetDevice_localTargetDevice__block_invoke()
{
  PKPaymentWebServiceTargetDevice *v0;
  void *v1;

  v0 = objc_alloc_init(PKPaymentWebServiceTargetDevice);
  v1 = (void *)_MergedGlobals_191;
  _MergedGlobals_191 = (uint64_t)v0;

}

- (PKPaymentWebServiceTargetDevice)init
{
  PKPaymentWebServiceTargetDevice *v2;
  uint64_t v3;
  PKPassLibrary *passLibrary;
  PKPaymentService *v5;
  PKPaymentService *paymentService;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentWebServiceTargetDevice;
  v2 = -[PKPaymentWebServiceTargetDevice init](&v8, sel_init);
  if (v2 && (PKRunningInPassd() & 1) == 0)
  {
    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    passLibrary = v2->_passLibrary;
    v2->_passLibrary = (PKPassLibrary *)v3;

    v5 = objc_alloc_init(PKPaymentService);
    paymentService = v2->_paymentService;
    v2->_paymentService = v5;

  }
  return v2;
}

+ (id)localTargetDevice
{
  if (qword_1ECF22158 != -1)
    dispatch_once(&qword_1ECF22158, &__block_literal_global_7);
  return (id)_MergedGlobals_191;
}

- (unint64_t)paymentSupportedInCurrentRegionForWebService:(id)a3
{
  return PKPaymentSupportedInCurrentRegionForWebService(a3);
}

- (BOOL)paymentWebService:(id)a3 hasPassesOfType:(unint64_t)a4
{
  return -[PKPassLibrary hasPassesOfType:](self->_passLibrary, "hasPassesOfType:", a4);
}

- (void)dealloc
{
  objc_super v3;

  -[PKAssertion invalidate](self->_provisioningAssertion, "invalidate");
  -[PKAssertion invalidate](self->_requiringUpgradedPasscodeAssertion, "invalidate");
  -[PKAssertion invalidate](self->_activePasscodeUpgradeFlowAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentWebServiceTargetDevice;
  -[PKPaymentWebServiceTargetDevice dealloc](&v3, sel_dealloc);
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

- (void)noteProvisioningDidBegin
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Note Provisioning Did Begin.", buf, 2u);
  }

  if (!self->_provisioningAssertionActive)
  {
    self->_provisioningAssertionActive = 1;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "processIdentifier");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%ld"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__PKPaymentWebServiceTargetDevice_noteProvisioningDidBegin__block_invoke;
    v8[3] = &unk_1E2ABE4C8;
    v8[4] = self;
    +[PKAssertion acquireAssertionOfType:withReason:completion:](PKAssertion, "acquireAssertionOfType:withReason:completion:", 1, v7, v8);

  }
}

void __59__PKPaymentWebServiceTargetDevice_noteProvisioningDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_storeStrong((id *)(v5 + 24), a2);
    objc_msgSend(v4, "setInvalidateWhenBackgrounded:", 0);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__PKPaymentWebServiceTargetDevice_noteProvisioningDidBegin__block_invoke_2;
    v8[3] = &unk_1E2ABE120;
    v8[4] = v6;
    objc_msgSend(v7, "setInvalidationHandler:", v8);
  }
  else
  {
    *(_BYTE *)(v5 + 32) = 0;
  }

}

void __59__PKPaymentWebServiceTargetDevice_noteProvisioningDidBegin__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (void)noteProvisioningDidEnd
{
  NSObject *v3;
  PKAssertion *provisioningAssertion;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Note Provisioning Did End.", v5, 2u);
  }

  -[PKAssertion invalidate](self->_provisioningAssertion, "invalidate");
  provisioningAssertion = self->_provisioningAssertion;
  self->_provisioningAssertion = 0;

}

- (void)noteProvisioningUserInterfaceDidAppear
{
  NSObject *v2;
  uint8_t v3[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Note Provisioning User Interface Did Appear.", v3, 2u);
  }

}

- (void)noteProvisioningUserInterfaceDidDisappear
{
  NSObject *v2;
  uint8_t v3[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Note Provisioning User Interface Did Disappear.", v3, 2u);
  }

}

- (void)setMaximumPaymentCards:(unint64_t)a3
{
  PKSetMaxPaymentCards(a3);
}

- (id)deviceIDSIdentifier
{
  return (id)IDSCopyLocalDeviceUniqueID();
}

- (id)allPaymentApplicationUsageSummaries
{
  return -[PKPaymentService allPaymentApplicationUsageSummaries](self->_paymentService, "allPaymentApplicationUsageSummaries");
}

- (void)noteForegroundVerificationObserverActive:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD v8[5];

  if (a3)
  {
    if (!self->_verificationAssertionActive)
    {
      self->_verificationAssertionActive = 1;
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "processName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "processIdentifier");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%ld"), v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __76__PKPaymentWebServiceTargetDevice_noteForegroundVerificationObserverActive___block_invoke;
      v8[3] = &unk_1E2ABE4C8;
      v8[4] = self;
      +[PKAssertion acquireAssertionOfType:withReason:completion:](PKAssertion, "acquireAssertionOfType:withReason:completion:", 2, v7, v8);

    }
  }
  else
  {
    -[PKAssertion invalidate](self->_verificationAssertion, "invalidate");
  }
}

void __76__PKPaymentWebServiceTargetDevice_noteForegroundVerificationObserverActive___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_storeStrong((id *)(v5 + 40), a2);
    objc_msgSend(v4, "setInvalidateWhenBackgrounded:", 1);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__PKPaymentWebServiceTargetDevice_noteForegroundVerificationObserverActive___block_invoke_2;
    v8[3] = &unk_1E2ABE120;
    v8[4] = v6;
    objc_msgSend(v7, "setInvalidationHandler:", v8);
  }
  else
  {
    *(_BYTE *)(v5 + 48) = 0;
  }

}

void __76__PKPaymentWebServiceTargetDevice_noteForegroundVerificationObserverActive___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (id)secureElementIdentifiers
{
  return +[PKSecureElement secureElementIdentifiers](PKSecureElement, "secureElementIdentifiers");
}

- (void)paymentWebService:(id)a3 queueConnectionToTrustedServiceManagerForPushTopic:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "_paymentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasRegistrationRegionMap");

  PKLogFacilityTypeGetObject(6uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "NF appears to be missing its registration region map. Re-setting per <rdar://33865268>", buf, 2u);
    }

    AnalyticsSendEvent();
    objc_msgSend(v7, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "TSMURLStringByPushTopic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "primaryRegion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trustedServiceManagerPushTopic");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_paymentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRegistrationRegionMap:primaryRegionTopic:", v15, v18);

  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v8;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Queueing TSM connection on local SE for %@", buf, 0xCu);
  }

  objc_msgSend(v7, "_paymentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __119__PKPaymentWebServiceTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke;
  v22[3] = &unk_1E2ABE148;
  v23 = v9;
  v21 = v9;
  objc_msgSend(v20, "queueConnectionToTrustedServiceManagerForPushTopic:withCompletion:", v8, v22);

}

uint64_t __119__PKPaymentWebServiceTargetDevice_paymentWebService_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)encryptedServiceProviderDataForSecureElementPass:(id)a3 completion:(id)a4
{
  -[PKPaymentWebServiceTargetDevice serviceProviderDataForSecureElementPass:encrypted:completion:](self, "serviceProviderDataForSecureElementPass:encrypted:completion:", a3, 1, a4);
}

- (void)serviceProviderDataForSecureElementPass:(id)a3 encrypted:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (v8)
  {
    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __96__PKPaymentWebServiceTargetDevice_serviceProviderDataForSecureElementPass_encrypted_completion___block_invoke;
      v13[3] = &unk_1E2ABE9A8;
      v10 = &v14;
      v14 = v8;
      objc_msgSend(v9, "encryptedServiceProviderDataForSecureElementPass:completion:", v7, v13);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __96__PKPaymentWebServiceTargetDevice_serviceProviderDataForSecureElementPass_encrypted_completion___block_invoke_32;
      v11[3] = &unk_1E2ABE4F0;
      v10 = &v12;
      v12 = v8;
      objc_msgSend(v9, "serviceProviderDataForSecureElementPass:completion:", v7, v11);
    }

  }
}

void __96__PKPaymentWebServiceTargetDevice_serviceProviderDataForSecureElementPass_encrypted_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Received nil service provider data with error %@", (uint8_t *)&v10, 0xCu);

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();

}

void __96__PKPaymentWebServiceTargetDevice_serviceProviderDataForSecureElementPass_encrypted_completion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0, CFSTR("data"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Received nil service provider data with error %@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)paymentWebService:(id)a3 configurationDataWithCompletionHandler:(id)a4
{
  void (**v5)(id, void *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, void *))a4;
  if (v5)
  {
    objc_msgSend(a3, "_paymentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB2938];
      v12[0] = CFSTR("Failed to obtain device configuration data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v5[2](v5, v7, v8);

  }
}

- (void)paymentWebService:(id)a3 registrationDataWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentWebServiceTargetDevice appleAccountInformation](self, "appleAccountInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationHeader");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_paymentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "registrationDataWithAuthToken:completionHandler:", v10, v6);
}

- (void)paymentWebService:(id)a3 registrationDataWithAuthToken:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "_paymentDevice");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registrationDataWithAuthToken:completionHandler:", v8, v7);

}

- (void)paymentWebService:(id)a3 signData:(id)a4 signatureEntanglementMode:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a6;
  v10 = a4;
  objc_msgSend(a3, "_paymentDevice");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "signData:signatureEntanglementMode:withCompletionHandler:", v10, a5, v9);

}

- (void)paymentWebService:(id)a3 provisioningDataIncludingDeviceMetadata:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  objc_msgSend(a3, "_paymentDevice");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "provisioningDataIncludingDeviceMetadata:withCompletionHandler:", v5, v7);

}

- (id)trustedDeviceEnrollmentInfoForWebService:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "_paymentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trustedDeviceEnrollmentInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)signatureForAuthToken:(id)a3 webService:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "_paymentDevice");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "signatureForAuthToken:completion:", v8, v7);

}

- (void)paymentWebService:(id)a3 didRegisterWithRegionMap:(id)a4 primaryRegionTopic:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "_paymentDevice");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRegistrationRegionMap:primaryRegionTopic:", v8, v7);

}

- (id)paymentWebService:(id)a3 filterVerificationChannels:(id)a4
{
  return a4;
}

- (unint64_t)registrationSupportedInCurrentRegionForWebService:(id)a3
{
  return PKRegistrationSupportedInCurrentRegionForWebService(a3);
}

- (void)paymentWebService:(id)a3 deleteApplicationWithAID:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "_paymentDevice");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteApplicationWithAID:", v5);

}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  -[PKPassLibrary deleteKeyMaterialForSubCredentialId:](self->_passLibrary, "deleteKeyMaterialForSubCredentialId:", a3);
}

- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4
{
  -[PKPaymentService retrievePendingProvisioningsWithType:completion:](self->_paymentService, "retrievePendingProvisioningsWithType:completion:", a3, a4);
}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v6;
  PKPaymentService *paymentService;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  paymentService = self->_paymentService;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__PKPaymentWebServiceTargetDevice_addPendingProvisionings_completion___block_invoke;
  v9[3] = &unk_1E2ABD9C8;
  v10 = v6;
  v8 = v6;
  -[PKPaymentService addPendingProvisionings:completion:](paymentService, "addPendingProvisionings:completion:", a3, v9);

}

uint64_t __70__PKPaymentWebServiceTargetDevice_addPendingProvisionings_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5
{
  -[PKPaymentService removePendingProvisioningOfType:withUniqueIdentifier:completion:](self->_paymentService, "removePendingProvisioningOfType:withUniqueIdentifier:completion:", a3, a4, a5);
}

- (void)renewAppleAccountWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PKAppleAccountManager sharedInstance](PKAppleAccountManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renewAppleAccountWithCompletionHandler:", v3);

}

- (BOOL)supportsCheckingProvisioningRequirements
{
  return 1;
}

- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4
{
  -[PKPassLibrary meetsProvisioningRequirements:completion:](self->_passLibrary, "meetsProvisioningRequirements:completion:", a3, a4);
}

- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4
{
  return -[PKPassLibrary meetsProvisioningRequirements:missingRequirements:](self->_passLibrary, "meetsProvisioningRequirements:missingRequirements:", a3, a4);
}

- (void)paymentWebService:(id)a3 setNewAuthRandomIfNecessaryReturningPairingState:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke;
  v7[3] = &unk_1E2ABE340;
  v8 = v5;
  v6 = v5;
  -[PKPaymentWebServiceTargetDevice _initializeSecureElementIfNecessaryWithCompletion:](self, "_initializeSecureElementIfNecessaryWithCompletion:", v7);

}

uint64_t __102__PKPaymentWebServiceTargetDevice_paymentWebService_setNewAuthRandomIfNecessaryReturningPairingState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)paymentWebService:(id)a3 setNewAuthRandom:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PKPaymentWebServiceTargetDevice_paymentWebService_setNewAuthRandom___block_invoke;
  v7[3] = &unk_1E2ABE518;
  v8 = v5;
  v6 = v5;
  -[PKPaymentWebServiceTargetDevice _initializeSecureElement:](self, "_initializeSecureElement:", v7);

}

uint64_t __70__PKPaymentWebServiceTargetDevice_paymentWebService_setNewAuthRandom___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)paymentWebService:(id)a3 passesOfType:(unint64_t)a4
{
  return -[PKPassLibrary passesOfType:](self->_passLibrary, "passesOfType:", a4);
}

- (id)paymentWebService:(id)a3 passWithUniqueID:(id)a4
{
  return -[PKPassLibrary passWithUniqueID:](self->_passLibrary, "passWithUniqueID:", a4);
}

- (BOOL)paymentWebService:(id)a3 canProvisionPaymentPassWithPrimaryAccountIdentifier:(id)a4
{
  id v5;
  int IsAvailable;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  IsAvailable = PKSecureElementIsAvailable();
  v7 = IsAvailable != 0;
  if (v5 && IsAvailable)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = 1;
    -[PKPassLibrary passesOfType:](self->_passLibrary, "passesOfType:", 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "primaryAccountIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v5);

          if (v15 && (unint64_t)objc_msgSend(v13, "activationState") < 4)
          {
            v7 = 0;
            goto LABEL_14;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
      v7 = 1;
    }
LABEL_14:

  }
  return v7;
}

- (void)paymentWebService:(id)a3 validateAddPreconditionsWithCompletion:(id)a4
{
  -[PKPaymentWebServiceTargetDevice _validateCommonPreconditionsWithCompletion:](self, "_validateCommonPreconditionsWithCompletion:", a4);
}

- (void)_validateCommonPreconditionsWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  PKPassLibrary *passLibrary;
  __int16 v12[8];
  uint8_t buf[16];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (!v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "No completion, bailing out", buf, 2u);
    }
    goto LABEL_15;
  }
  if (PKSecureElementIsAvailable())
  {
    if (!PKHasVerifiedPrimaryAppleAccount())
    {
      v9 = 6;
      goto LABEL_14;
    }
    if (!PKPasscodeEnabled())
    {
      v9 = 9;
      goto LABEL_14;
    }
    -[PKPaymentWebServiceTargetDevice appleAccountInformation](self, "appleAccountInformation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aaAlternateDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PKIsBeneficiaryAccountWithAltDsid(v6);

    if (v7)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12[0] = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Common precondition validation failed because account is beneficiary account", (uint8_t *)v12, 2u);
      }

    }
    else
    {
      passLibrary = self->_passLibrary;
      if (!passLibrary || -[PKPassLibrary canAddPassOfType:](passLibrary, "canAddPassOfType:", 1))
      {
        v4[2](v4, 1, 0);
        goto LABEL_16;
      }
      if ((PKDisableDynamicSEAllocation() & 1) != 0)
      {
        v9 = 8;
        goto LABEL_14;
      }
    }
  }
  v9 = 0;
LABEL_14:
  PKDisplayableErrorForCommonType(v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, NSObject *))v4)[2](v4, 0, v10);
LABEL_15:

LABEL_16:
}

- (void)_paymentHardwareStatusWithType:(unint64_t)a3 completion:(id)a4
{
  id v5;
  PKInAppPaymentService *v6;

  v5 = a4;
  v6 = objc_alloc_init(PKInAppPaymentService);
  -[PKInAppPaymentService paymentHardwareStatusWithType:completion:](v6, "paymentHardwareStatusWithType:completion:", a3, v5);

}

- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v7 = a4;
  v8 = a5;
  PKLogFacilityTypeGetObject(6uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Adding Payment pass to pass library", buf, 2u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__PKPaymentWebServiceTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E2ABE170;
  v12 = v8;
  v10 = v8;
  -[PKPaymentWebServiceTargetDevice _addPass:properties:completion:](self, "_addPass:properties:completion:", v7, 0, v11);

}

void __90__PKPaymentWebServiceTargetDevice_paymentWebService_addPaymentPass_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Added pass with result: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)paymentWebService:(id)a3 addPaymentPass:(id)a4 withCompletionHandlerV2:(id)a5
{
  -[PKPaymentWebServiceTargetDevice _addPass:properties:completion:](self, "_addPass:properties:completion:", a4, 0, a5);
}

- (void)paymentWebService:(id)a3 addSecureElementPass:(id)a4 properties:(id)a5 completion:(id)a6
{
  -[PKPaymentWebServiceTargetDevice _addPass:properties:completion:](self, "_addPass:properties:completion:", a4, a5, a6);
}

- (void)paymentWebService:(id)a3 handlePotentialExpressPass:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  PKExpressPassConfiguration *v18;
  PKExpressPassConfiguration *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  PKExpressPassConfiguration *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  PKExpressPassConfiguration *v33;
  id v34;
  void *v35;
  void *v36;
  void (**v37)(void);
  id v38;
  _QWORD v39[4];
  id v40;
  PKPaymentWebServiceTargetDevice *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void (**v47)(void);
  _QWORD v48[4];
  id v49;
  PKExpressPassConfiguration *v50;
  id v51;
  void (**v52)(void);
  _QWORD v53[5];
  id v54;
  void (**v55)(void);
  _QWORD aBlock[5];
  id v57;
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E2ABE058;
  aBlock[4] = self;
  v12 = v9;
  v57 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[PKPaymentWebServiceTargetDevice secureElementSupportsExpressMode](self, "secureElementSupportsExpressMode"))
  {
    v53[0] = v11;
    v53[1] = 3221225472;
    v53[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_46;
    v53[3] = &unk_1E2ABE5B8;
    v53[4] = self;
    v54 = v12;
    v37 = v13;
    v55 = v37;
    v14 = _Block_copy(v53);
    v15 = -[PKExpressPassInformation initForPaymentPass:withTechologyTest:]([PKExpressPassInformation alloc], "initForPaymentPass:withTechologyTest:", v8, &__block_literal_global_60);
    if (v15)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "uniqueID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v59 = v17;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Pass %@ has express info", buf, 0xCu);

      }
      v18 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]([PKExpressPassConfiguration alloc], "initWithPassInformation:forSecureElementPass:", v15, v8);
      v48[0] = v11;
      v48[1] = 3221225472;
      v48[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_63;
      v48[3] = &unk_1E2ABE620;
      v51 = v14;
      v49 = v8;
      v50 = v18;
      v52 = v37;
      v19 = v18;
      -[PKPaymentWebServiceTargetDevice _paymentWebService:pass:withExpressConfig:hasDisqualifyingConflicts:](self, "_paymentWebService:pass:withExpressConfig:hasDisqualifyingConflicts:", v38, v49, v19, v48);

    }
    else
    {
      v36 = v14;
      v21 = v10;
      objc_msgSend(v8, "devicePrimaryContactlessPaymentApplication");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "paymentNetworkIdentifier") - 1;

      if (v23 > 0x62)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v59 = v10;
          _os_log_impl(&dword_18FC92000, v32, OS_LOG_TYPE_DEFAULT, "Pass %@ doesn't support express", buf, 0xCu);
        }

        v37[2]();
        v15 = 0;
        v14 = v36;
      }
      else
      {
        -[PKPaymentWebServiceTargetDevice upgradeRequestForPass:](self, "upgradeRequestForPass:", v8);
        v24 = objc_claimAutoreleasedReturnValue();
        PKLogFacilityTypeGetObject(6uLL);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        v35 = (void *)v24;
        if (v24)
        {
          v10 = v21;
          if (v26)
          {
            objc_msgSend(v8, "uniqueID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v59 = v27;
            _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Pass %@ has upgrade request", buf, 0xCu);

          }
          v28 = -[PKExpressPassInformation initDummyExpressInfoForAutomaticSelectionCriteriaUpgradeRequest:paymentPass:withTechologyTest:]([PKExpressPassInformation alloc], "initDummyExpressInfoForAutomaticSelectionCriteriaUpgradeRequest:paymentPass:withTechologyTest:", v35, v8, &__block_literal_global_60);
          v14 = v36;
          if (v28)
          {
            v29 = [PKExpressPassConfiguration alloc];
            objc_msgSend(v8, "devicePaymentApplications");
            v34 = v28;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = -[PKExpressPassConfiguration initWithPassInformation:forPaymentApplications:](v29, "initWithPassInformation:forPaymentApplications:", v34, v30);

            v39[0] = v11;
            v39[1] = 3221225472;
            v39[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_64;
            v39[3] = &unk_1E2ABE670;
            v40 = v8;
            v41 = self;
            v42 = v38;
            v43 = v35;
            v45 = &__block_literal_global_60;
            v46 = v36;
            v44 = v10;
            v47 = v37;
            v28 = v34;
            -[PKPaymentWebServiceTargetDevice _paymentWebService:pass:withExpressConfig:hasDisqualifyingConflicts:](self, "_paymentWebService:pass:withExpressConfig:hasDisqualifyingConflicts:", v42, v40, v33, v39);

            v31 = v35;
          }
          else
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v10;
              _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Invalid upgrade request on pass %@, could not create test express info", buf, 0xCu);
            }

            v37[2]();
            v31 = v35;
          }

          v15 = 0;
        }
        else
        {
          v10 = v21;
          if (v26)
          {
            *(_DWORD *)buf = 138412290;
            v59 = v21;
            _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Pass %@ can't be upgraded to express", buf, 0xCu);
          }

          v37[2]();
          v15 = 0;
          v14 = v36;
          v31 = 0;
        }

      }
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v10;
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Skipping potential express enablement of %@ as SE does not support express", buf, 0xCu);
    }

    v13[2](v13);
  }

}

uint64_t __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_sanitizeExpressPasses");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 && v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Pass can become express. Setting it now.", buf, 2u);
    }

    v9 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_47;
    v11[3] = &unk_1E2ABE590;
    v12 = v6;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v9, "_setExpressWithPassConfiguration:credential:handler:", v12, 0, v11);

  }
  else
  {
    if (v8)
    {
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "No express upgrade for pass %@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_47(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    objc_msgSend(*(id *)(a1 + 32), "passUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Express set success: %@ for passUniqueIdentifier: %@", buf, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    if (a2)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(*(id *)(a1 + 32), "passInformation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_53;
      v14[3] = &unk_1E2ABE568;
      v12 = v10;
      v15 = v12;
      objc_msgSend(v11, "enumerateCredentialsWithHandler:", v14);

      if (objc_msgSend(v12, "count"))
        v13 = (void *)objc_msgSend(v12, "copy");
      else
        v13 = 0;

      v9 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      v13 = 0;
    }
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v13);

  }
}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E2ABE540;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);

}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "supportsExpress"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "type");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

BOOL __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_58(uint64_t a1, uint64_t a2)
{
  return +[PKSecureElement supportsExpressForAutomaticSelectionTechnologyType:](PKSecureElement, "supportsExpressForAutomaticSelectionTechnologyType:", a2);
}

uint64_t __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_63(uint64_t a1, char a2)
{
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Pass %@ has conflict with pre-existing pass, not enabling express", (uint8_t *)&v6, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_64(uint64_t a1, char a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v5)
    {
      v6 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Pass %@ upgrade request has potential conflicts, not upgrading for express", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Attempting upgrade of pass %@", buf, 0xCu);

    }
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_65;
    v12[3] = &unk_1E2ABE648;
    v15 = *(id *)(a1 + 72);
    v13 = *(id *)(a1 + 32);
    v16 = *(id *)(a1 + 80);
    v14 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 88);
    objc_msgSend(v10, "paymentWebService:requestPassUpgrade:pass:completion:", v8, v9, v11, v12);

  }
}

void __102__PKPaymentWebServiceTargetDevice_paymentWebService_handlePotentialExpressPass_withCompletionHandler___block_invoke_65(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  PKExpressPassConfiguration *v8;
  void *v9;
  PKExpressPassConfiguration *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[PKExpressPassInformation initForPaymentPass:withTechologyTest:]([PKExpressPassInformation alloc], "initForPaymentPass:withTechologyTest:", v5, *(_QWORD *)(a1 + 48));
  v7 = v6;
  if (!a2 && v5 && v6)
  {
    v8 = [PKExpressPassConfiguration alloc];
    objc_msgSend(*(id *)(a1 + 32), "devicePaymentApplications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKExpressPassConfiguration initWithPassInformation:forPaymentApplications:](v8, "initWithPassInformation:forPaymentApplications:", v7, v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Express upgrade of pass %@ failed", (uint8_t *)&v13, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (void)_paymentWebService:(id)a3 pass:(id)a4 withExpressConfig:(id)a5 hasDisqualifyingConflicts:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD aBlock[4];
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke;
  aBlock[3] = &unk_1E2ABE518;
  v26 = v13;
  v15 = v13;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke_2;
  v20[3] = &unk_1E2ABE6C0;
  v23 = v11;
  v24 = _Block_copy(aBlock);
  v20[4] = self;
  v21 = v10;
  v22 = v12;
  v16 = v11;
  v17 = v12;
  v18 = v10;
  v19 = v24;
  -[PKPaymentWebServiceTargetDevice _conflictingExpressPassIdentifiersForPassConfiguration:withCompletion:](self, "_conflictingExpressPassIdentifiersForPassConfiguration:withCompletion:", v17, v20);

}

uint64_t __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  PKExpressPassConfiguration *v12;
  PKExpressPassConfiguration *v13;
  PKExpressPassConfiguration *v14;
  int v15;
  PKExpressPassConfiguration *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "count"))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Potential express state conflicts with existing express state, not enabling for express", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "paymentWebService:passesOfType:", *(_QWORD *)(a1 + 40), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 48), "passUniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (!v7)
      goto LABEL_24;
    v8 = v7;
    v9 = *(_QWORD *)v26;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "uniqueID", v19);
        v12 = (PKExpressPassConfiguration *)(id)objc_claimAutoreleasedReturnValue();
        v13 = v5;
        v14 = v13;
        if (v12 == v13)
        {

LABEL_17:
          v16 = -[PKExpressPassInformation initForPaymentPass:withTechologyTest:]([PKExpressPassInformation alloc], "initForPaymentPass:withTechologyTest:", v11, 0);
          if (v16)
          {
            v12 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]([PKExpressPassConfiguration alloc], "initWithPassInformation:forSecureElementPass:", v16, v11);
            objc_msgSend(v20, "addObject:", v12);
            goto LABEL_20;
          }
LABEL_21:

          continue;
        }
        if (!v5 || !v12)
        {

          v16 = v12;
LABEL_20:

          goto LABEL_21;
        }
        v15 = -[PKExpressPassConfiguration isEqualToString:](v12, "isEqualToString:", v13);

        if (v15)
          goto LABEL_17;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (!v8)
      {
LABEL_24:

        v17 = *(void **)(a1 + 32);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke_67;
        v21[3] = &unk_1E2ABE698;
        v18 = *(_QWORD *)(a1 + 48);
        v22 = *(id *)(a1 + 56);
        v23 = v6;
        v24 = *(id *)(a1 + 64);
        objc_msgSend(v17, "_conflictingExpressPassIdentifiersForPassConfiguration:withReferenceExpressState:completion:", v18, v20, v21);

        v4 = v19;
        goto LABEL_26;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_26:

}

void __103__PKPaymentWebServiceTargetDevice__paymentWebService_pass_withExpressConfig_hasDisqualifyingConflicts___block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v17;
  NSObject *oslog;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "count"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_28;
  }
  PKExpressPassCategoryIdentifier(*(void **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Comparing category conflicts for new pass of category: %@", buf, 0xCu);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (!v8)
    goto LABEL_25;
  oslog = v5;
  v19 = a1;
  v9 = *(_QWORD *)v21;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      objc_msgSend(v11, "uniqueID", oslog);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v3, "containsObject:", v12);

      if (v13)
      {
        PKExpressPassCategoryIdentifier(v11);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v4 && v14)
        {
          if ((objc_msgSend(v4, "isEqual:", v14) & 1) != 0)
            goto LABEL_13;
        }
        else if (v4 == (void *)v14)
        {
LABEL_13:
          if ((objc_msgSend(v11, "hasAssociatedPeerPaymentAccount") & 1) == 0)
          {
            v5 = oslog;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "uniqueID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v25 = v15;
              v26 = 2112;
              v27 = v17;
              _os_log_impl(&dword_18FC92000, oslog, OS_LOG_TYPE_DEFAULT, "Exiting early, found conflicting category:%@ for pass with unique ID:%@", buf, 0x16u);

            }
            a1 = v19;
            goto LABEL_25;
          }
          goto LABEL_17;
        }
        objc_msgSend(v6, "addObject:", v15);
LABEL_17:

        continue;
      }
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v8)
      continue;
    break;
  }
  v5 = oslog;
  a1 = v19;
LABEL_25:

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "The following categories were checked and did not conflict:\n%@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_28:

}

- (void)paymentWebService:(id)a3 isPassExpressWithUniqueIdentifier:(id)a4 completion:(id)a5
{
  -[PKPaymentService isPassExpressWithUniqueIdentifier:completion:](self->_paymentService, "isPassExpressWithUniqueIdentifier:completion:", a4, a5);
}

- (void)paymentWebService:(id)a3 removePass:(id)a4 withCompletionHandler:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(a4, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceTargetDevice _removePassWithUniqueID:diagnosticReason:](self, "_removePassWithUniqueID:diagnosticReason:", v7, CFSTR("Target device remove requested"));

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
    v8 = v9;
  }

}

- (BOOL)claimSecureElementForCurrentUser
{
  void *v2;
  char v3;

  PKCurrentUserUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKSetSecureElementOwnerUserUUID(v2, 0);

  return v3;
}

- (void)claimSecureElementForCurrentUserWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (unint64_t)secureElementOwnershipStateForCurrentUser
{
  void *v2;
  unint64_t v3;

  PKCurrentUserUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKGetSecureElementOwnershipState(v2);

  return v3;
}

- (void)paymentWebService:(id)a3 validateTransferPreconditionsWithCompletion:(id)a4
{
  -[PKPaymentWebServiceTargetDevice _validateCommonPreconditionsWithCompletion:](self, "_validateCommonPreconditionsWithCompletion:", a4);
}

- (BOOL)felicaSecureElementIsAvailable
{
  return PKFelicaSecureElementIsAvailable() != 0;
}

- (BOOL)secureElementIsAvailable
{
  int IsAvailable;

  IsAvailable = PKSecureElementIsAvailable();
  if (IsAvailable)
    LOBYTE(IsAvailable) = !+[PKSecureElement isInFailForward](PKSecureElement, "isInFailForward");
  return IsAvailable;
}

- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  return +[PKSecureElement supportsExpressForAutomaticSelectionTechnologyType:](PKSecureElement, "supportsExpressForAutomaticSelectionTechnologyType:", a3);
}

- (BOOL)supportsCredentialType:(int64_t)a3
{
  return 1;
}

- (BOOL)paymentWebServiceSupportsPeerPaymentRegistration:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!PKIsManagedAppleID() && (unint64_t)PKCurrentPassbookState() <= 1)
  {
    PKPeerPaymentServiceOverrideURL();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16[0]) = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Payment web service supports peer payments due to service override URL", (uint8_t *)v16, 2u);
      }
      LOBYTE(v7) = 1;
LABEL_16:

      goto LABEL_9;
    }
    if ((objc_msgSend(v4, "needsRegistration") & 1) == 0)
    {
      objc_msgSend(v4, "context");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject peerPaymentServiceURL](v6, "peerPaymentServiceURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = -[NSObject hasPeerPaymentAccount](v6, "hasPeerPaymentAccount");
      objc_msgSend(v4, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentWebServiceTargetDevice deviceRegion](self, "deviceRegion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "peerPaymentEnabledForRegion:", v13);

      if (v9)
        v7 = v10 | v14;
      else
        v7 = 0;
      PKLogFacilityTypeGetObject(0xBuLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16[0] = 67109888;
        v16[1] = v7;
        v17 = 1024;
        v18 = v10;
        v19 = 1024;
        v20 = v14;
        v21 = 1024;
        v22 = v9 != 0;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Payment web service supports peer payments = %d, hasAccount: %d, regionEnabled: %d, hasURL: %d", (uint8_t *)v16, 0x1Au);
      }

      goto LABEL_16;
    }
  }
  LOBYTE(v7) = 0;
LABEL_9:

  return v7;
}

- (id)supportedFeatureIdentifiersWithPaymentWebService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceTargetDevice deviceRegion](self, "deviceRegion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "applyServiceEnabledForRegion:", v6);
  PKLogFacilityTypeGetObject(0xDuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 67109120;
    LODWORD(v17) = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Payment web service supports apply service: %d", (uint8_t *)&v16, 8u);
  }

  if (v7)
  {
    objc_msgSend(v4, "applyServiceFeaturesForRegionMeetingEnablementThreshold:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKDeviceSupportedFeatureIdentifiers();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v10;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Device supported feature identifiers: %@", (uint8_t *)&v16, 0xCu);
    }

    v11 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v9, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Config supported feature identifiers: %@", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(v13, "intersectSet:", v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Final supported feature identifiers: %@", (uint8_t *)&v16, 0xCu);
    }

    v14 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:(id)a3
{
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKDeviceSupportedFeatureIdentifiers();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0xDuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Device supported feature identifiers: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (BOOL)paymentWebServiceSupportsAccounts:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "needsRegistration") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasAccounts");

    objc_msgSend(v6, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceTargetDevice deviceRegion](self, "deviceRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "accountServiceEnabledForRegion:", v10);

    v5 = v8 | v11;
    PKLogFacilityTypeGetObject(0xEuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109632;
      v14[1] = v8 | v11;
      v15 = 1024;
      v16 = v8;
      v17 = 1024;
      v18 = v11;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Payment web service supports accounts = %d, hasAccount: %d, regionEnabled: %d", (uint8_t *)v14, 0x14u);
    }

  }
  return v5;
}

- (void)updatedAccountsForProvisioningWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a3;
  if (v3)
  {
    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__PKPaymentWebServiceTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke;
    v6[3] = &unk_1E2ABE710;
    v7 = v4;
    v8 = v3;
    v5 = v4;
    objc_msgSend(v5, "updateAccountsWithCompletion:", v6);

  }
}

void __80__PKPaymentWebServiceTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __80__PKPaymentWebServiceTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_2;
  v2[3] = &unk_1E2ABE6E8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "accountsForProvisioningWithCompletion:", v2);

}

uint64_t __80__PKPaymentWebServiceTargetDevice_updatedAccountsForProvisioningWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)accountsWithCompletion:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  if (v3)
  {
    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__PKPaymentWebServiceTargetDevice_accountsWithCompletion___block_invoke;
    v5[3] = &unk_1E2ABE738;
    v6 = v3;
    objc_msgSend(v4, "accountsWithCompletion:", v5);

  }
}

uint64_t __58__PKPaymentWebServiceTargetDevice_accountsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)accountWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  if (a4)
  {
    v5 = a4;
    v6 = a3;
    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountWithIdentifier:completion:", v6, v5);

  }
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;

  if (a4)
  {
    v5 = a4;
    v6 = a3;
    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "triggerCloudStoreZoneCreationForAccount:withCompletion:", v6, v5);

  }
}

- (void)cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __90__PKPaymentWebServiceTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke;
    v6[3] = &unk_1E2ABE760;
    v7 = v4;
    -[PKPaymentWebServiceTargetDevice _cachedFeatureApplicationsForProvisioningWithCompletion:](self, "_cachedFeatureApplicationsForProvisioningWithCompletion:", v6);

  }
}

uint64_t __90__PKPaymentWebServiceTargetDevice_cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)featureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__PKPaymentWebServiceTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke;
    v6[3] = &unk_1E2ABE738;
    v7 = v4;
    -[PKPaymentWebServiceTargetDevice _featureApplicationsForProvisioningWithCompletion:](self, "_featureApplicationsForProvisioningWithCompletion:", v6);

  }
}

uint64_t __84__PKPaymentWebServiceTargetDevice_featureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)applePayTrustKeyForIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__PKPaymentWebServiceTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke;
    v8[3] = &unk_1E2ABE788;
    v9 = v5;
    v10 = v6;
    v7 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:](PKPaymentSession, "startApplePayTrustSessionWithCompletion:", v8);

  }
}

void __76__PKPaymentWebServiceTargetDevice_applePayTrustKeyForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "keyWithIdentifier:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateSession");
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[PKPaymentWebServiceTargetDevice applePayTrustKeyForIdentifier:completion:]_block_invoke";
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get Apple Pay Trust session for method: %s", (uint8_t *)&v7, 0xCu);
    }

    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)createApplePayTrustKeyWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PKPaymentWebServiceTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke;
  v10[3] = &unk_1E2ABE788;
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  v9 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:](PKPaymentSession, "startApplePayTrustSessionWithCompletion:", v10);

}

void __80__PKPaymentWebServiceTargetDevice_createApplePayTrustKeyWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "keyIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteKeyWithIdentifier:", v4);

    v5 = *(_QWORD *)(a1 + 32);
    v10 = 0;
    objc_msgSend(v3, "createKeyWithRequest:error:", v5, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    objc_msgSend(v3, "invalidateSession");
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[PKPaymentWebServiceTargetDevice createApplePayTrustKeyWithRequest:completion:]_block_invoke";
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get Apple Pay Trust session for method: %s", buf, 0xCu);
    }

    v7 = 0;
    v6 = 0;
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v6, v7);

}

- (void)deleteApplePayTrustKeyWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__PKPaymentWebServiceTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke;
  v10[3] = &unk_1E2ABE788;
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  v9 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:](PKPaymentSession, "startApplePayTrustSessionWithCompletion:", v10);

}

void __83__PKPaymentWebServiceTargetDevice_deleteApplePayTrustKeyWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "deleteKeyWithIdentifier:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "invalidateSession");
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[PKPaymentWebServiceTargetDevice deleteApplePayTrustKeyWithIdentifier:completion:]_block_invoke";
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get Apple Pay Trust session for method: %s", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v5);

}

- (void)paymentWebService:(id)a3 deviceMetadataWithFields:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  objc_msgSend(a3, "_paymentDevice");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paymentDeviceMetadataFields:completion:", a4, v7);

}

- (void)paymentWebService:(id)a3 updateAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a5;
  v7 = a4;
  +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateAccountWithIdentifier:extended:completion:", v7, 0, v6);

}

- (void)paymentWebService:(id)a3 accountAttestationAnonymizationSaltWithCompletion:(id)a4
{
  -[PKPaymentWebServiceTargetDevice _accountAttestationAnonymizationSaltWithCompletion:](self, "_accountAttestationAnonymizationSaltWithCompletion:", a4);
}

- (void)paymentWebService:(id)a3 setAccountAttestationAnonymizationSalt:(id)a4 withCompletion:(id)a5
{
  -[PKPaymentWebServiceTargetDevice _setAccountAttestationAnonymizationSalt:withCompletion:](self, "_setAccountAttestationAnonymizationSalt:withCompletion:", a4, a5);
}

- (void)notePasscodeUpgradeFlowWillBeginWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;
  id location;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (!self->_activePasscodeUpgradeFlowAssertionActive)
  {
    self->_activePasscodeUpgradeFlowAssertionActive = 1;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "processIdentifier");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%ld"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__PKPaymentWebServiceTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke;
    v11[3] = &unk_1E2ABE7D8;
    objc_copyWeak(&v13, &location);
    v12 = v5;
    +[PKAssertion acquireAssertionOfType:withReason:completion:](PKAssertion, "acquireAssertionOfType:withReason:completion:", 7, v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

    goto LABEL_5;
  }
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("PasscodeUpgradeFlowActive assertion already exists.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v8);
LABEL_5:

  }
}

void __82__PKPaymentWebServiceTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(v6, "setInvalidateWhenBackgrounded:", 1);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __82__PKPaymentWebServiceTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke_2;
      v11[3] = &unk_1E2ABE7B0;
      objc_copyWeak(&v13, (id *)(a1 + 40));
      v12 = v6;
      objc_msgSend(v12, "setInvalidationHandler:", v11);
      objc_storeStrong(v9 + 9, a2);

      objc_destroyWeak(&v13);
    }
    else
    {
      *((_BYTE *)WeakRetained + 80) = 0;
    }
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, *((unsigned __int8 *)v9 + 80), v7);
  }

}

void __82__PKPaymentWebServiceTargetDevice_notePasscodeUpgradeFlowWillBeginWithCompletion___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[9];
    if (v3 == *(void **)(a1 + 32))
    {
      *((_BYTE *)WeakRetained + 80) = 0;
      WeakRetained[9] = 0;
      v4 = WeakRetained;

      WeakRetained = v4;
    }
  }

}

- (void)notePasscodeUpgradeFlowDidEnd
{
  PKAssertion *activePasscodeUpgradeFlowAssertion;

  -[PKAssertion invalidate](self->_activePasscodeUpgradeFlowAssertion, "invalidate");
  activePasscodeUpgradeFlowAssertion = self->_activePasscodeUpgradeFlowAssertion;
  self->_activePasscodeUpgradeFlowAssertion = 0;

  self->_activePasscodeUpgradeFlowAssertionActive = 0;
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
  -[PKPaymentService currentPasscodeMeetsUpgradedPasscodePolicy:](self->_paymentService, "currentPasscodeMeetsUpgradedPasscodePolicy:", a3);
}

- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentService plansForPaymentPassWithUniqueIdentifier:completion:](self->_paymentService, "plansForPaymentPassWithUniqueIdentifier:completion:", v7, v6);

}

- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_requiringUpgradedPasscodeAssertionActive)
  {
    self->_requiringUpgradedPasscodeAssertionActive = 1;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "processIdentifier");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%ld"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __89__PKPaymentWebServiceTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke;
    v8[3] = &unk_1E2ABE800;
    objc_copyWeak(&v9, &location);
    +[PKAssertion acquireAssertionOfType:withReason:completion:](PKAssertion, "acquireAssertionOfType:withReason:completion:", 6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);

  }
}

void __89__PKPaymentWebServiceTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *v8;
  id *WeakRetained;
  id *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a2;
  v7 = a3;
  v8 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(v6, "setInvalidateWhenBackgrounded:", 0);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __89__PKPaymentWebServiceTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke_2;
      v11[3] = &unk_1E2ABE7B0;
      objc_copyWeak(&v13, v8);
      v12 = v6;
      objc_msgSend(v12, "setInvalidationHandler:", v11);
      objc_storeStrong(v10 + 7, a2);

      objc_destroyWeak(&v13);
    }
    else
    {
      *((_BYTE *)WeakRetained + 64) = 0;
    }
  }

}

void __89__PKPaymentWebServiceTargetDevice_startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[7];
    if (v3 == *(void **)(a1 + 32))
    {
      *((_BYTE *)WeakRetained + 64) = 0;
      WeakRetained[7] = 0;
      v4 = WeakRetained;

      WeakRetained = v4;
    }
  }

}

- (void)endRequiringUpgradedPasscodeIfNecessary
{
  PKAssertion *requiringUpgradedPasscodeAssertion;

  -[PKAssertion invalidate](self->_requiringUpgradedPasscodeAssertion, "invalidate");
  requiringUpgradedPasscodeAssertion = self->_requiringUpgradedPasscodeAssertion;
  self->_requiringUpgradedPasscodeAssertion = 0;

  self->_requiringUpgradedPasscodeAssertionActive = 0;
}

- (void)paymentWebService:(id)a3 updateMetadataOnPass:(id)a4 withCredential:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v9 = a6;
  v10 = a5;
  objc_msgSend(a4, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__PKPaymentWebServiceTargetDevice_paymentWebService_updateMetadataOnPass_withCredential_completion___block_invoke;
  v13[3] = &unk_1E2ABE170;
  v14 = v9;
  v12 = v9;
  -[PKPaymentWebServiceTargetDevice _updateMetadataOnPassWithIdentifier:credential:completion:](self, "_updateMetadataOnPassWithIdentifier:credential:completion:", v11, v10, v13);

}

uint64_t __100__PKPaymentWebServiceTargetDevice_paymentWebService_updateMetadataOnPass_withCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)paymentWebService:(id)a3 addPassShare:(id)a4 onCredential:(id)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a6;
  v10 = a4;
  objc_msgSend(a5, "identifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceTargetDevice _addPassShare:onCredentialWithIdentifier:completion:](self, "_addPassShare:onCredentialWithIdentifier:completion:", v10, v11, v9);

}

- (void)paymentWebService:(id)a3 removeSharingInvitationReceipts:(id)a4 onCredential:(id)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "identifier", (_QWORD)v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  v19 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v10, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceTargetDevice _removeSharingInvitationReceiptWithIdentifiers:onCredential:completion:](self, "_removeSharingInvitationReceiptWithIdentifiers:onCredential:completion:", v19, v20, v11);

}

- (void)paymentWebService:(id)a3 declineRelatedSharingInvitationsIfNecessary:(id)a4 withCompletion:(id)a5
{
  -[PKPaymentWebServiceTargetDevice _declineRelatedSharingInvitationsIfNecessary:withCompletion:](self, "_declineRelatedSharingInvitationsIfNecessary:withCompletion:", a4, a5);
}

- (void)paymentWebService:(id)a3 removeSharingInvitation:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  PKLogFacilityTypeGetObject(0x16uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Removing sharing invitation: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__PKPaymentWebServiceTargetDevice_paymentWebService_removeSharingInvitation_withCompletion___block_invoke;
  v12[3] = &unk_1E2ABDCE8;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[PKPaymentWebServiceTargetDevice _removeSharingInvitation:withCompletion:](self, "_removeSharingInvitation:withCompletion:", v11, v12);

}

uint64_t __92__PKPaymentWebServiceTargetDevice_paymentWebService_removeSharingInvitation_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x16uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "failed";
    v6 = *(_QWORD *)(a1 + 32);
    if ((_DWORD)a2)
      v5 = "succeeded";
    v8 = 138412546;
    v9 = v6;
    v10 = 2080;
    v11 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Removing sharing invitation (%@) %s", (uint8_t *)&v8, 0x16u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)requestBackgroundRegistrationForCredential:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0x16uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Requesting to background register credential: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceTargetDevice _requestBackgroundRegistrationForCredentialWithIdentifier:completion:](self, "_requestBackgroundRegistrationForCredentialWithIdentifier:completion:", v9, v7);

}

- (void)paymentWebService:(id)a3 canAddSecureElementPassWithConfiguration:(id)a4 completion:(id)a5
{
  -[PKPaymentWebServiceTargetDevice _canAddSecureElementPassWithConfiguration:completion:](self, "_canAddSecureElementPassWithConfiguration:completion:", a4, a5);
}

- (void)paymentWebService:(id)a3 canAcceptInvitation:(id)a4 withCompletionV2:(id)a5
{
  -[PKPaymentWebServiceTargetDevice _canAcceptInvitation:withCompletion:](self, "_canAcceptInvitation:withCompletion:", a4, a5);
}

- (void)paymentWebService:(id)a3 subcredentialInvitationsWithCompletion:(id)a4
{
  -[PKPaymentWebServiceTargetDevice _subcredentialInvitationsWithCompletion:](self, "_subcredentialInvitationsWithCompletion:", a4);
}

- (void)paymentWebService:(id)a3 matchingInvitationOnDevice:(id)a4 withTimeout:(unint64_t)a5 completion:(id)a6
{
  -[PKPaymentWebServiceTargetDevice _matchingInvitationOnDevice:withTimeout:completion:](self, "_matchingInvitationOnDevice:withTimeout:completion:", a4, a5, a6);
}

- (void)paymentWebService:(id)a3 credentialWithIdentifier:(id)a4 completion:(id)a5
{
  -[PKPaymentWebServiceTargetDevice _credentialWithIdentifier:completion:](self, "_credentialWithIdentifier:completion:", a4, a5);
}

- (void)paymentWebService:(id)a3 passSharesForCredentialIdentifier:(id)a4 completion:(id)a5
{
  -[PKPaymentWebServiceTargetDevice _passSharesForCredentialIdentifier:completion:](self, "_passSharesForCredentialIdentifier:completion:", a4, a5);
}

- (void)hasActiveExternallySharedPasses:(id)a3
{
  -[PKPaymentService hasActiveExternallySharedPasses:](self->_paymentService, "hasActiveExternallySharedPasses:", a3);
}

- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService displayableSharesForPassIdentifier:completion:](self->_paymentService, "displayableSharesForPassIdentifier:completion:", a3, a4);
}

- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService displayableEntitlementsForPassIdentifier:completion:](self->_paymentService, "displayableEntitlementsForPassIdentifier:completion:", a3, a4);
}

- (id)entitlementsForPassIdentifier:(id)a3
{
  return -[PKPaymentService entitlementsForPassIdentifier:](self->_paymentService, "entitlementsForPassIdentifier:", a3);
}

- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService prewarmCreateShareForPassIdentifier:completion:](self->_paymentService, "prewarmCreateShareForPassIdentifier:completion:", a3, a4);
}

- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5
{
  -[PKPaymentService createShareForPartialShareInvitation:authorization:completion:](self->_paymentService, "createShareForPartialShareInvitation:authorization:completion:", a3, a4, a5);
}

- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6
{
  -[PKPaymentService createShareInvitationForPartialShareInvitation:existingTransportIdentifier:authorization:completion:](self->_paymentService, "createShareInvitationForPartialShareInvitation:existingTransportIdentifier:authorization:completion:", a3, a4, a5, a6);
}

- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4
{
  -[PKPaymentService checkInvitationStatusForMailboxAddress:completion:](self->_paymentService, "checkInvitationStatusForMailboxAddress:completion:", a3, a4);
}

- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4
{
  -[PKPaymentService retrieveShareInvitationForMailboxAddress:completion:](self->_paymentService, "retrieveShareInvitationForMailboxAddress:completion:", a3, a4);
}

- (void)relinquishInvitation:(id)a3 completion:(id)a4
{
  -[PKPaymentService relinquishInvitation:completion:](self->_paymentService, "relinquishInvitation:completion:", a3, a4);
}

- (void)deleteInvitation:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[PKPaymentService deleteSharingMessage:](self->_paymentService, "deleteSharingMessage:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    v6 = v7;
  }

}

- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  -[PKPaymentService acceptCarKeyShareForMessage:activationCode:completion:](self->_paymentService, "acceptCarKeyShareForMessage:activationCode:completion:", a3, a4, a5);
}

- (BOOL)supportsSharingInAChain
{
  return 1;
}

- (void)carKeyStartShareAcceptanceFlow:(id)a3 transportIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKDAManager *v10;
  PKDAManager *v11;
  id v12;
  _QWORD v13[4];
  PKDAManager *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__PKPaymentWebServiceTargetDevice_carKeyStartShareAcceptanceFlow_transportIdentifier_completion___block_invoke;
  v13[3] = &unk_1E2ABDD88;
  v14 = v10;
  v15 = v7;
  v11 = v10;
  v12 = v7;
  -[PKDAManager startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completion:](v11, "startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completion:", v9, v8, v13);

}

uint64_t __97__PKPaymentWebServiceTargetDevice_carKeyStartShareAcceptanceFlow_transportIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeyRoutingInformationForInvitationWithIdentifier:(id)a3 transportIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKDAManager *v10;
  PKDAManager *v11;
  id v12;
  _QWORD v13[4];
  PKDAManager *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __118__PKPaymentWebServiceTargetDevice_carKeyRoutingInformationForInvitationWithIdentifier_transportIdentifier_completion___block_invoke;
  v13[3] = &unk_1E2ABE828;
  v14 = v10;
  v15 = v7;
  v11 = v10;
  v12 = v7;
  -[PKDAManager routingInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:](v11, "routingInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:", v9, v8, v13);

}

uint64_t __118__PKPaymentWebServiceTargetDevice_carKeyRoutingInformationForInvitationWithIdentifier_transportIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeyGetProductPlanIdentifierRequestForInvitationWithIdentifier:(id)a3 transportIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKDAManager *v10;
  PKDAManager *v11;
  id v12;
  _QWORD v13[4];
  PKDAManager *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __131__PKPaymentWebServiceTargetDevice_carKeyGetProductPlanIdentifierRequestForInvitationWithIdentifier_transportIdentifier_completion___block_invoke;
  v13[3] = &unk_1E2ABE850;
  v14 = v10;
  v15 = v7;
  v11 = v10;
  v12 = v7;
  -[PKDAManager getProductPlanIdentifierRequestForInvitationWithIdentifier:fromMailboxIdentifier:completion:](v11, "getProductPlanIdentifierRequestForInvitationWithIdentifier:fromMailboxIdentifier:completion:", v9, v8, v13);

}

uint64_t __131__PKPaymentWebServiceTargetDevice_carKeyGetProductPlanIdentifierRequestForInvitationWithIdentifier_transportIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeySetEncryptedProductPlanIdentifierContainer:(id)a3 invitationIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKDAManager *v10;
  PKDAManager *v11;
  id v12;
  _QWORD v13[4];
  PKDAManager *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __116__PKPaymentWebServiceTargetDevice_carKeySetEncryptedProductPlanIdentifierContainer_invitationIdentifier_completion___block_invoke;
  v13[3] = &unk_1E2ABDD88;
  v14 = v10;
  v15 = v7;
  v11 = v10;
  v12 = v7;
  -[PKDAManager setEncryptedProductPlanIdentifierContainer:forInvitationIdentifier:completion:](v11, "setEncryptedProductPlanIdentifierContainer:forInvitationIdentifier:completion:", v9, v8, v13);

}

uint64_t __116__PKPaymentWebServiceTargetDevice_carKeySetEncryptedProductPlanIdentifierContainer_invitationIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeyAccountAttestationRequestForCredential:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  PKDAManager *v7;
  PKDAManager *v8;
  id v9;
  _QWORD v10[4];
  PKDAManager *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PKDAManager);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__PKPaymentWebServiceTargetDevice_carKeyAccountAttestationRequestForCredential_completion___block_invoke;
  v10[3] = &unk_1E2ABE878;
  v11 = v7;
  v12 = v5;
  v8 = v7;
  v9 = v5;
  -[PKDAManager accountAttestionRequestForCredential:withCompletion:](v8, "accountAttestionRequestForCredential:withCompletion:", v6, v10);

}

uint64_t __91__PKPaymentWebServiceTargetDevice_carKeyAccountAttestationRequestForCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeyGetPretrackRequestForKeyWithInvitationIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  PKDAManager *v7;
  PKDAManager *v8;
  id v9;
  _QWORD v10[4];
  PKDAManager *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PKDAManager);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__PKPaymentWebServiceTargetDevice_carKeyGetPretrackRequestForKeyWithInvitationIdentifier_completion___block_invoke;
  v10[3] = &unk_1E2ABE850;
  v11 = v7;
  v12 = v5;
  v8 = v7;
  v9 = v5;
  -[PKDAManager getPretrackRequestForKeyWithIdentifier:withCompletion:](v8, "getPretrackRequestForKeyWithIdentifier:withCompletion:", v6, v10);

}

uint64_t __101__PKPaymentWebServiceTargetDevice_carKeyGetPretrackRequestForKeyWithInvitationIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeySetAccountAttestation:(id)a3 forCredential:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKDAManager *v10;
  PKDAManager *v11;
  id v12;
  _QWORD v13[4];
  PKDAManager *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__PKPaymentWebServiceTargetDevice_carKeySetAccountAttestation_forCredential_completion___block_invoke;
  v13[3] = &unk_1E2ABDD88;
  v14 = v10;
  v15 = v7;
  v11 = v10;
  v12 = v7;
  -[PKDAManager setAccountAttestation:forCredential:withCompletion:](v11, "setAccountAttestation:forCredential:withCompletion:", v9, v8, v13);

}

uint64_t __88__PKPaymentWebServiceTargetDevice_carKeySetAccountAttestation_forCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeyUpdateTrackingAttestation:(id)a3 forCredential:(id)a4 encryptedContainer:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PKDAManager *v13;
  PKDAManager *v14;
  id v15;
  _QWORD v16[4];
  PKDAManager *v17;
  id v18;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(PKDAManager);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __111__PKPaymentWebServiceTargetDevice_carKeyUpdateTrackingAttestation_forCredential_encryptedContainer_completion___block_invoke;
  v16[3] = &unk_1E2ABDDB0;
  v17 = v13;
  v18 = v9;
  v14 = v13;
  v15 = v9;
  -[PKDAManager updateTrackingAttestation:forCredential:encryptedContainer:completion:](v14, "updateTrackingAttestation:forCredential:encryptedContainer:completion:", v12, v11, v10, v16);

}

uint64_t __111__PKPaymentWebServiceTargetDevice_carKeyUpdateTrackingAttestation_forCredential_encryptedContainer_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeyAcceptInvitationWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKDAManager *v10;
  PKDAManager *v11;
  id v12;
  _QWORD v13[4];
  PKDAManager *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__PKPaymentWebServiceTargetDevice_carKeyAcceptInvitationWithInvitationIdentifier_activationCode_completion___block_invoke;
  v13[3] = &unk_1E2ABE8A0;
  v14 = v10;
  v15 = v7;
  v11 = v10;
  v12 = v7;
  -[PKDAManager acceptInvitationWithIdentifier:activationCode:completion:](v11, "acceptInvitationWithIdentifier:activationCode:completion:", v9, v8, v13);

}

uint64_t __108__PKPaymentWebServiceTargetDevice_carKeyAcceptInvitationWithInvitationIdentifier_activationCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeyRejectInvitation:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  PKDAManager *v7;
  PKDAManager *v8;
  id v9;
  _QWORD v10[4];
  PKDAManager *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PKDAManager);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PKPaymentWebServiceTargetDevice_carKeyRejectInvitation_completion___block_invoke;
  v10[3] = &unk_1E2ABE8C8;
  v11 = v7;
  v12 = v5;
  v8 = v7;
  v9 = v5;
  -[PKDAManager rejectInvitation:completion:](v8, "rejectInvitation:completion:", v6, v10);

}

uint64_t __69__PKPaymentWebServiceTargetDevice_carKeyRejectInvitation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeyHandleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKDAManager *v10;
  PKDAManager *v11;
  id v12;
  _QWORD v13[4];
  PKDAManager *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__PKPaymentWebServiceTargetDevice_carKeyHandleRecipientMessage_forInvitationIdentifier_completion___block_invoke;
  v13[3] = &unk_1E2ABE8A0;
  v14 = v10;
  v15 = v7;
  v11 = v10;
  v12 = v7;
  -[PKDAManager handleRecipientMessage:forInvitationIdentifier:completion:](v11, "handleRecipientMessage:forInvitationIdentifier:completion:", v9, v8, v13);

}

uint64_t __99__PKPaymentWebServiceTargetDevice_carKeyHandleRecipientMessage_forInvitationIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeyRetryActivationCodeWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKDAManager *v10;
  PKDAManager *v11;
  id v12;
  _QWORD v13[4];
  PKDAManager *v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PKDAManager);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __111__PKPaymentWebServiceTargetDevice_carKeyRetryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke;
  v13[3] = &unk_1E2ABE8A0;
  v14 = v10;
  v15 = v7;
  v11 = v10;
  v12 = v7;
  -[PKDAManager retryActivationCode:forInvitationIdentifier:completion:](v11, "retryActivationCode:forInvitationIdentifier:completion:", v8, v9, v13);

}

uint64_t __111__PKPaymentWebServiceTargetDevice_carKeyRetryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)carKeyDecryptData:(id)a3 credential:(id)a4 ephemeralPublicKey:(id)a5 completion:(id)a6
{
  void (**v9)(id, void *, _QWORD);
  id v10;
  id v11;
  id v12;
  void *v13;
  PKDAManager *v14;

  v9 = (void (**)(id, void *, _QWORD))a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v14 = objc_alloc_init(PKDAManager);
  -[PKDAManager decryptData:withCredential:ephemeralPublicKey:](v14, "decryptData:withCredential:ephemeralPublicKey:", v12, v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v9[2](v9, v13, 0);
}

- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4
{
  -[PKPaymentService cacheSharingMessageFromMailboxAddress:message:](self->_paymentService, "cacheSharingMessageFromMailboxAddress:message:", a3, a4);
}

- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6
{
  -[PKPaymentService updateShareForPassIdentifier:share:authorization:completion:](self->_paymentService, "updateShareForPassIdentifier:share:authorization:completion:", a3, a4, a5, a6);
}

- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  -[PKPaymentService revokeShareForPassIdentifier:share:shouldCascade:completion:](self->_paymentService, "revokeShareForPassIdentifier:share:shouldCascade:completion:", a3, a4, a5, a6);
}

- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  -[PKPaymentService revokeSharesForPassIdentifier:shares:shouldCascade:completion:](self->_paymentService, "revokeSharesForPassIdentifier:shares:shouldCascade:completion:", a3, a4, a5, a6);
}

- (void)rejectShareForMailboxAddress:(id)a3
{
  -[PKPaymentService rejectShareForMailboxAddress:](self->_paymentService, "rejectShareForMailboxAddress:", a3);
}

- (void)paymentWebService:(id)a3 generateTransactionKeyWithParameters:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "_paymentDevice");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generateTransactionKeyWithParameters:withCompletion:", v8, v7);

}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
  -[PKPaymentService statusForShareableCredentials:completion:](self->_paymentService, "statusForShareableCredentials:completion:", a3, a4);
}

- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (v8)
  {
    -[PKPaymentService saveProvisioningSupportData:completion:](self->_paymentService, "saveProvisioningSupportData:completion:", v8, v6);
  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4
{
  -[PKPaymentService clearProvisioningSupportDataOfType:completion:](self->_paymentService, "clearProvisioningSupportDataOfType:completion:", a3, a4);
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
  -[PKPaymentService prepareProvisioningTarget:checkFamilyCircle:completion:](self->_paymentService, "prepareProvisioningTarget:checkFamilyCircle:completion:", a3, a4, a5);
}

- (id)paymentWebService:(id)a3 supportedRegionFeatureOfType:(int64_t)a4
{
  return (id)objc_msgSend(a3, "supportedRegionFeatureOfType:didFailOSVersionRequirements:", a4, 0);
}

- (void)paymentWebService:(id)a3 setDefaultPaymentPassUniqueIdentifier:(id)a4
{
  -[PKPaymentWebServiceTargetDevice _setDefaultPaymentPassUniqueIdentifier:](self, "_setDefaultPaymentPassUniqueIdentifier:", a4);
}

- (void)paymentWebService:(id)a3 storePassOwnershipToken:(id)a4 withIdentifier:(id)a5
{
  -[PKPaymentWebServiceTargetDevice _storePassOwnershipToken:withIdentifier:](self, "_storePassOwnershipToken:withIdentifier:", a4, a5);
}

- (void)paymentWebService:(id)a3 passOwnershipTokenWithIdentifier:(id)a4 completion:(id)a5
{
  -[PKPaymentWebServiceTargetDevice _passOwnershipTokenWithIdentifier:completion:](self, "_passOwnershipTokenWithIdentifier:completion:", a4, a5);
}

- (void)paymentWebService:(id)a3 requestPassUpgrade:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPassUpgradeController *passUpgradeController;
  PKPassUpgradeController *v14;
  PKPassUpgradeController *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    passUpgradeController = self->_passUpgradeController;
    if (!passUpgradeController)
    {
      v14 = -[PKPassUpgradeController initWithWebService:]([PKPassUpgradeController alloc], "initWithWebService:", v16);
      v15 = self->_passUpgradeController;
      self->_passUpgradeController = v14;

      passUpgradeController = self->_passUpgradeController;
    }
    -[PKPassUpgradeControllerBase requestPassUpgrade:pass:diagnosticReason:completion:](passUpgradeController, "requestPassUpgrade:pass:diagnosticReason:completion:", v10, v11, CFSTR("User upgrade"), v12);
  }

}

- (void)_addPass:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PKPassIngestionPayload *v12;
  PKPassLibrary *passLibrary;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    v12 = -[PKPassIngestionPayload initWithPass:]([PKPassIngestionPayload alloc], "initWithPass:", v8);
    -[PKPassIngestionPayload setProperties:](v12, "setProperties:", v9);
    passLibrary = self->_passLibrary;
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__PKPaymentWebServiceTargetDevice__addPass_properties_completion___block_invoke;
    v15[3] = &unk_1E2ABE8F0;
    v15[4] = self;
    v16 = v8;
    v17 = v11;
    -[PKPassLibrary addPassesWithIngestionPayloads:withCompletionHandler:](passLibrary, "addPassesWithIngestionPayloads:withCompletionHandler:", v14, v15);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __66__PKPaymentWebServiceTargetDevice__addPass_properties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;

  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PKPaymentWebServiceTargetDevice__addPass_properties_completion___block_invoke_2;
  v9[3] = &unk_1E2ABE080;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v12 = a2;
  v9[4] = v6;
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  v8 = v9;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E2ABD9A0;
  v14 = v8;
  dispatch_async(v4, block);

}

void __66__PKPaymentWebServiceTargetDevice__addPass_properties_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (!*(_QWORD *)(a1 + 56))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "passWithUniqueID:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v7;
    if ((isKindOfClass & 1) != 0)
      goto LABEL_5;

  }
  v5 = 0;
LABEL_5:
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    v8 = v5;
    (*(void (**)(void))(v6 + 16))();
    v5 = v8;
  }

}

- (void)_startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  -[PKPaymentService startBackgroundVerificationObserverForPass:verificationMethod:](self->_paymentService, "startBackgroundVerificationObserverForPass:verificationMethod:", a3, a4);
}

- (void)_setExpressWithPassConfiguration:(id)a3 credential:(id)a4 handler:(id)a5
{
  -[PKPaymentService setExpressWithPassConfiguration:credential:handler:](self->_paymentService, "setExpressWithPassConfiguration:credential:handler:", a3, a4, a5);
}

- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4
{
  -[PKPaymentService conflictingExpressPassIdentifiersForPassConfiguration:withCompletion:](self->_paymentService, "conflictingExpressPassIdentifiersForPassConfiguration:withCompletion:", a3, a4);
}

- (void)_conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
  -[PKPaymentService conflictingExpressPassIdentifiersForPassConfiguration:withReferenceExpressState:completion:](self->_paymentService, "conflictingExpressPassIdentifiersForPassConfiguration:withReferenceExpressState:completion:", a3, a4, a5);
}

- (void)_sanitizeExpressPasses
{
  -[PKPaymentService sanitizeExpressPasses](self->_paymentService, "sanitizeExpressPasses");
}

- (id)upgradeRequestForPass:(id)a3
{
  id v4;
  PKPaymentDefaultDataProvider *v5;
  PKPaymentService *paymentService;
  void *v7;
  PKPaymentDefaultDataProvider *v8;
  PKPassLibraryDefaultDataProvider *v9;
  PKExpressPassController *v10;
  void *v11;

  v4 = a3;
  v5 = [PKPaymentDefaultDataProvider alloc];
  paymentService = self->_paymentService;
  +[PKSecureElement sharedSecureElement](PKSecureElement, "sharedSecureElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKPaymentDefaultDataProvider initWithPaymentService:secureElement:](v5, "initWithPaymentService:secureElement:", paymentService, v7);

  v9 = -[PKPassLibraryDefaultDataProvider initWithPassLibrary:]([PKPassLibraryDefaultDataProvider alloc], "initWithPassLibrary:", self->_passLibrary);
  v10 = -[PKExpressPassController initWithPaymentDataProvider:passLibraryDataProvider:isForWatch:]([PKExpressPassController alloc], "initWithPaymentDataProvider:passLibraryDataProvider:isForWatch:", v8, v9, 0);
  -[PKExpressPassController expressModeUpgradeRequestForPass:](v10, "expressModeUpgradeRequestForPass:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService removeExpressPassWithUniqueIdentifierV2:completion:](self->_paymentService, "removeExpressPassWithUniqueIdentifierV2:completion:", a3, a4);
}

- (void)_downloadAllPaymentPasses
{
  -[PKPaymentService downloadAllPaymentPasses](self->_paymentService, "downloadAllPaymentPasses");
}

- (void)_removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4
{
  -[PKPassLibrary removePassWithUniqueID:diagnosticReason:](self->_passLibrary, "removePassWithUniqueID:diagnosticReason:", a3, a4);
}

- (void)_cachedFeatureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v4;
  PKPaymentService *paymentService;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  paymentService = self->_paymentService;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__PKPaymentWebServiceTargetDevice__cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E2ABE760;
  v8 = v4;
  v6 = v4;
  -[PKPaymentService featureApplicationsWithCompletion:](paymentService, "featureApplicationsWithCompletion:", v7);

}

void __91__PKPaymentWebServiceTargetDevice__cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "pk_objectsPassingTest:", &__block_literal_global_101);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

BOOL __91__PKPaymentWebServiceTargetDevice__cachedFeatureApplicationsForProvisioningWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applicationType") == 1;
}

- (void)_featureApplicationsForProvisioningWithCompletion:(id)a3
{
  -[PKPaymentService featureApplicationsForProvisioningWithCompletion:](self->_paymentService, "featureApplicationsForProvisioningWithCompletion:", a3);
}

- (void)_accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  -[PKPaymentService accountAttestationAnonymizationSaltWithCompletion:](self->_paymentService, "accountAttestationAnonymizationSaltWithCompletion:", a3);
}

- (void)_setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4
{
  -[PKPaymentService setAccountAttestationAnonymizationSalt:withCompletion:](self->_paymentService, "setAccountAttestationAnonymizationSalt:withCompletion:", a3, a4);
}

- (void)_enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  -[PKPaymentService enforceUpgradedPasscodePolicyWithCompletion:](self->_paymentService, "enforceUpgradedPasscodePolicyWithCompletion:", a3);
}

- (void)_updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  PKPaymentService *paymentService;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  paymentService = self->_paymentService;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__PKPaymentWebServiceTargetDevice__updateMetadataOnPassWithIdentifier_credential_completion___block_invoke;
  v13[3] = &unk_1E2ABE938;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  -[PKPaymentService updateMetadataOnPassWithIdentifier:credential:completion:](paymentService, "updateMetadataOnPassWithIdentifier:credential:completion:", v11, a4, v13);

}

void __93__PKPaymentWebServiceTargetDevice__updateMetadataOnPassWithIdentifier_credential_completion___block_invoke(_QWORD *a1, char a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = a1[6];
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "passWithUniqueID:", a1[5]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentPass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(a1[6], 0);
  }
}

- (void)_addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 completion:(id)a5
{
  -[PKPaymentService addPassShare:onCredentialWithIdentifier:completion:](self->_paymentService, "addPassShare:onCredentialWithIdentifier:completion:", a3, a4, a5);
}

- (void)_removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5
{
  -[PKPaymentService removeSharingInvitationReceiptWithIdentifiers:onCredential:completion:](self->_paymentService, "removeSharingInvitationReceiptWithIdentifiers:onCredential:completion:", a3, a4, a5);
}

- (void)_declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4
{
  -[PKPaymentService declineRelatedSharingInvitationsIfNecessary:withCompletion:](self->_paymentService, "declineRelatedSharingInvitationsIfNecessary:withCompletion:", a3, a4);
}

- (void)_removeSharingInvitation:(id)a3 withCompletion:(id)a4
{
  -[PKPaymentService removeSharingInvitation:withCompletion:](self->_paymentService, "removeSharingInvitation:withCompletion:", a3, a4);
}

- (void)_requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService requestBackgroundRegistrationForCredentialWithIdentifier:completion:](self->_paymentService, "requestBackgroundRegistrationForCredentialWithIdentifier:completion:", a3, a4);
}

- (void)_canAddSecureElementPassWithConfiguration:(id)a3 completion:(id)a4
{
  PKPassLibrary *passLibrary;
  void (**v6)(id, uint64_t, _QWORD);

  if (a4)
  {
    passLibrary = self->_passLibrary;
    v6 = (void (**)(id, uint64_t, _QWORD))a4;
    v6[2](v6, -[PKPassLibrary canAddSecureElementPassWithConfiguration:](passLibrary, "canAddSecureElementPassWithConfiguration:", a3), 0);

  }
}

- (void)_canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
  -[PKPaymentService canAcceptInvitation:withCompletion:](self->_paymentService, "canAcceptInvitation:withCompletion:", a3, a4);
}

- (void)_credentialWithIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService credentialWithIdentifier:completion:](self->_paymentService, "credentialWithIdentifier:completion:", a3, a4);
}

- (void)_subcredentialInvitationsWithCompletion:(id)a3
{
  -[PKPaymentService subcredentialInvitationsWithCompletion:](self->_paymentService, "subcredentialInvitationsWithCompletion:", a3);
}

- (void)_passSharesForCredentialIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService passSharesForCredentialIdentifier:completion:](self->_paymentService, "passSharesForCredentialIdentifier:completion:", a3, a4);
}

- (void)_matchingInvitationOnDevice:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5
{
  -[PKPaymentService matchingInvitationOnDevice:withTimeout:completion:](self->_paymentService, "matchingInvitationOnDevice:withTimeout:completion:", a3, a4, a5);
}

- (void)_setDefaultPaymentPassUniqueIdentifier:(id)a3
{
  -[PKPaymentService setDefaultPaymentPassUniqueIdentifier:](self->_paymentService, "setDefaultPaymentPassUniqueIdentifier:", a3);
}

- (void)_performDeviceCheckInWithCompletion:(id)a3
{
  -[PKPaymentService performDeviceCheckInWithCompletion:](self->_paymentService, "performDeviceCheckInWithCompletion:", a3);
}

- (void)_performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[PKDeviceRegistrationService sharedInstance](PKDeviceRegistrationService, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performDeviceRegistrationReturningContextForReason:brokerURL:actionType:completion:", v9, v8, 1, v7);

}

- (void)_storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
  -[PKPaymentService storePassOwnershipToken:withIdentifier:](self->_paymentService, "storePassOwnershipToken:withIdentifier:", a3, a4);
}

- (void)_passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService passOwnershipTokenWithIdentifier:completion:](self->_paymentService, "passOwnershipTokenWithIdentifier:completion:", a3, a4);
}

- (void)_productsWithRequest:(id)a3 completion:(id)a4
{
  -[PKPaymentService productsWithRequest:completion:](self->_paymentService, "productsWithRequest:completion:", a3, a4);
}

- (void)_performProductActionRequest:(id)a3 completion:(id)a4
{
  -[PKPaymentService performProductActionRequest:completion:](self->_paymentService, "performProductActionRequest:completion:", a3, a4);
}

- (BOOL)_willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3
{
  return -[PKPaymentService willPassWithUniqueIdentifierAutomaticallyBecomeDefault:](self->_paymentService, "willPassWithUniqueIdentifierAutomaticallyBecomeDefault:", a3);
}

- (void)_consistencyCheck
{
  -[PKPaymentService consistencyCheck](self->_paymentService, "consistencyCheck");
}

- (void)_initializeSecureElementIfNecessaryWithCompletion:(id)a3
{
  -[PKPaymentService initializeSecureElementIfNecessaryWithCompletion:](self->_paymentService, "initializeSecureElementIfNecessaryWithCompletion:", a3);
}

- (void)_initializeSecureElement:(id)a3
{
  -[PKPaymentService initializeSecureElement:](self->_paymentService, "initializeSecureElement:", a3);
}

- (void)familyMembersWithCompletion:(id)a3
{
  -[PKPaymentService familyMembersWithCompletion:](self->_paymentService, "familyMembersWithCompletion:", a3);
}

- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4
{
  -[PKPassLibrary provisionHomeKeyPassForSerialNumbers:completionHandler:](self->_passLibrary, "provisionHomeKeyPassForSerialNumbers:completionHandler:", a3, a4);
}

- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3
{
  -[PKPassLibrary availableHomeKeyPassesWithCompletionHandler:](self->_passLibrary, "availableHomeKeyPassesWithCompletionHandler:", a3);
}

- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7
{
  -[PKPassLibrary createFidoKeyForRelyingParty:relyingPartyAccountHash:challenge:externalizedAuth:completion:](self->_passLibrary, "createFidoKeyForRelyingParty:relyingPartyAccountHash:challenge:externalizedAuth:completion:", a3, a4, a5, a6, a7);
}

- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6
{
  -[PKPassLibrary checkFidoKeyPresenceForRelyingParty:relyingPartyAccountHash:fidoKeyHash:completion:](self->_passLibrary, "checkFidoKeyPresenceForRelyingParty:relyingPartyAccountHash:fidoKeyHash:completion:", a3, a4, a5, a6);
}

- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9
{
  -[PKPassLibrary signWithFidoKeyForRelyingParty:relyingPartyAccountHash:fidoKeyHash:challenge:publicKeyIdentifier:externalizedAuth:completion:](self->_passLibrary, "signWithFidoKeyForRelyingParty:relyingPartyAccountHash:fidoKeyHash:challenge:publicKeyIdentifier:externalizedAuth:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  -[PKPassLibrary generateSEEncryptionCertificateForSubCredentialId:completion:](self->_passLibrary, "generateSEEncryptionCertificateForSubCredentialId:completion:", a3, a4);
}

- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  -[PKPassLibrary generateISOEncryptionCertificateForSubCredentialId:completion:](self->_passLibrary, "generateISOEncryptionCertificateForSubCredentialId:completion:", a3, a4);
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
  -[PKPassLibrary addISO18013Blobs:cardType:completion:](self->_passLibrary, "addISO18013Blobs:cardType:completion:", a3, a4, a5);
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
  -[PKPassLibrary longTermPrivacyKeyForCredentialGroupIdentifier:reuseExisting:completion:](self->_passLibrary, "longTermPrivacyKeyForCredentialGroupIdentifier:reuseExisting:completion:", a3, a4, a5);
}

- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4
{
  -[PKPassLibrary generateAuxiliaryCapabilitiesForRequirements:completion:](self->_passLibrary, "generateAuxiliaryCapabilitiesForRequirements:completion:", a3, a4);
}

- (void)generateIdentityProvisioningAttestationsWithISOCredential:(id)a3 pairingID:(id)a4 completion:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0D16A20];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __114__PKPaymentWebServiceTargetDevice_generateIdentityProvisioningAttestationsWithISOCredential_pairingID_completion___block_invoke;
  v13[3] = &unk_1E2ABE980;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "generateIdentityProvisioningAttestationsWithCredential:pairingID:completion:", v10, v9, v13);

}

void __114__PKPaymentWebServiceTargetDevice_generateIdentityProvisioningAttestationsWithISOCredential_pairingID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  PKIdentityProvisioningAttestations *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKIdentityProvisioningAttestations *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "transactionKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_106);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [PKIdentityProvisioningAttestations alloc];
    objc_msgSend(v5, "authorizationKeyAttestation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceEncryptionKeyAttestation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceEncryptionKeyAuthorization");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "progenitorKeyCASDAttestation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverAttestedProvisioningData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKIdentityProvisioningAttestations initWithAuthorizationKeyAttestation:deviceEncryptionKeyAttestation:deviceEncryptionKeyAuthorization:progenitorKeyCASDAttestation:transactionKeys:serverAttestedProvisioningData:](v9, "initWithAuthorizationKeyAttestation:deviceEncryptionKeyAttestation:deviceEncryptionKeyAuthorization:progenitorKeyCASDAttestation:transactionKeys:serverAttestedProvisioningData:", v10, v11, v12, v13, v8, v14);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject(0x23uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Failed to generate identity attestations with error: %@", (uint8_t *)&v18, 0xCu);
    }

    v17 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v17 + 16))(v17, 0, v6);
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v8);
  }

LABEL_8:
}

PKIdentityProvisioningTransactionKey *__114__PKPaymentWebServiceTargetDevice_generateIdentityProvisioningAttestationsWithISOCredential_pairingID_completion___block_invoke_104(uint64_t a1, void *a2)
{
  id v2;
  PKIdentityProvisioningTransactionKey *v3;
  void *v4;
  void *v5;
  PKIdentityProvisioningTransactionKey *v6;

  v2 = a2;
  v3 = [PKIdentityProvisioningTransactionKey alloc];
  objc_msgSend(v2, "casdAttestation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PKIdentityProvisioningTransactionKey initWithCASDAttestation:authorization:](v3, "initWithCASDAttestation:authorization:", v4, v5);
  return v6;
}

- (void)currentSecureElementSnapshot:(id)a3
{
  -[PKPaymentService currentSecureElementSnapshot:](self->_paymentService, "currentSecureElementSnapshot:", a3);
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  -[PKPaymentService reserveStorageForAppletTypes:metadata:completion:](self->_paymentService, "reserveStorageForAppletTypes:metadata:completion:", a3, a4, a5);
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  -[PKPaymentService deleteReservation:completion:](self->_paymentService, "deleteReservation:completion:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUpgradeController, 0);
  objc_storeStrong((id *)&self->_activePasscodeUpgradeFlowAssertion, 0);
  objc_storeStrong((id *)&self->_requiringUpgradedPasscodeAssertion, 0);
  objc_storeStrong((id *)&self->_verificationAssertion, 0);
  objc_storeStrong((id *)&self->_provisioningAssertion, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end
