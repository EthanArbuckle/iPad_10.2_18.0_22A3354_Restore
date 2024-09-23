@implementation PKPeerPaymentWebServiceTargetDevice

- (PKPeerPaymentWebServiceTargetDevice)initWithTargetDeviceDelegate:(id)a3
{
  id v5;
  PKPeerPaymentWebServiceTargetDevice *v6;
  PKPeerPaymentWebServiceTargetDevice *v7;
  uint64_t v8;
  PKPeerPaymentService *peerPaymentService;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentWebServiceTargetDevice;
  v6 = -[PKPeerPaymentWebServiceTargetDevice init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_targetDeviceDelegate, a3);
    if ((PKRunningInPassd() & 1) == 0)
    {
      +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
      v8 = objc_claimAutoreleasedReturnValue();
      peerPaymentService = v7->_peerPaymentService;
      v7->_peerPaymentService = (PKPeerPaymentService *)v8;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__handleAccountChangedNotification_, CFSTR("PKPeerPaymentServiceAccountChangedNotification"), v7->_peerPaymentService);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__handlePreferencesChangedNotification_, CFSTR("PKPeerPaymentServicePreferencesChangedNotification"), v7->_peerPaymentService);

    }
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentWebServiceTargetDevice;
  -[PKPeerPaymentWebServiceTargetDevice dealloc](&v4, sel_dealloc);
}

- (void)peerPaymentReRegisterWithURL:(id)a3 pushToken:(id)a4 peerPaymentWebService:(id)a5 completion:(id)a6
{
  id v10;
  PKPeerPaymentTargetDeviceDelegate *targetDeviceDelegate;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  targetDeviceDelegate = self->_targetDeviceDelegate;
  if (targetDeviceDelegate)
  {
    -[PKPeerPaymentTargetDeviceDelegate registerDeviceWithRegistrationURL:pushToken:forceReregister:completion:](targetDeviceDelegate, "registerDeviceWithRegistrationURL:pushToken:forceReregister:completion:", a3, a4, 1, v10);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __111__PKPeerPaymentWebServiceTargetDevice_peerPaymentReRegisterWithURL_pushToken_peerPaymentWebService_completion___block_invoke;
    v12[3] = &unk_1E2AC4D58;
    v13 = v10;
    objc_msgSend(a5, "peerPaymentRegisterWithURL:pushToken:completion:", a3, a4, v12);

  }
}

uint64_t __111__PKPeerPaymentWebServiceTargetDevice_peerPaymentReRegisterWithURL_pushToken_peerPaymentWebService_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  BOOL v4;
  uint64_t v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2)
      v4 = a3 == 0;
    else
      v4 = 0;
    v5 = v4;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  return result;
}

- (void)downloadPassIfNecessaryWithCompletion:(id)a3
{
  -[PKPeerPaymentTargetDeviceDelegate downloadPassIfNecessaryWithCompletion:](self->_targetDeviceDelegate, "downloadPassIfNecessaryWithCompletion:", a3);
}

- (id)account
{
  return -[PKPeerPaymentService account](self->_peerPaymentService, "account");
}

- (id)preferences
{
  return -[PKPeerPaymentService preferences](self->_peerPaymentService, "preferences");
}

- (void)setPreferences:(id)a3 completion:(id)a4
{
  -[PKPeerPaymentService setPreferences:completion:](self->_peerPaymentService, "setPreferences:completion:", a3, a4);
}

- (void)updateAccountWithCompletion:(id)a3
{
  void *targetDeviceDelegate;

  targetDeviceDelegate = self->_targetDeviceDelegate;
  if (!targetDeviceDelegate)
    targetDeviceDelegate = self->_peerPaymentService;
  objc_msgSend(targetDeviceDelegate, "updateAccountWithCompletion:", a3);
}

- (id)bridgedClientInfo
{
  return 0;
}

- (id)secureElementIdentifiers
{
  return +[PKSecureElement secureElementIdentifiers](PKSecureElement, "secureElementIdentifiers");
}

- (void)setUserHasDisabledPeerPayment:(BOOL)a3
{
  PKSetUserHasDisabledPeerPayment(a3);
}

- (void)provisionPeerPaymentPassWithProvisioningController:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[PKPeerPaymentWebService sharedService](PKPeerPaymentWebService, "sharedService");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebServiceTargetDevice provisionPeerPaymentPassWithProvisioningController:peerPaymentWebService:credential:completion:](self, "provisionPeerPaymentPassWithProvisioningController:peerPaymentWebService:credential:completion:", v10, v11, v9, v8);

}

- (void)provisionPeerPaymentPassWithProvisioningController:(id)a3 peerPaymentWebService:(id)a4 credential:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  PKProvisioningContext *v24;
  PKProvisioningBackgroundCoordinator *v25;
  PKProvisioningBackgroundCoordinator *v26;
  _QWORD v27[4];
  id v28;
  PKProvisioningBackgroundCoordinator *v29;
  id v30;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "webService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  if (!v10)
  {
    +[PKPeerPaymentWebService sharedService](PKPeerPaymentWebService, "sharedService");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke;
  aBlock[3] = &unk_1E2ABE148;
  v18 = v12;
  v33 = v18;
  v19 = _Block_copy(aBlock);
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_DOWNLOAD_PASS_ERROR_TITLE"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_DOWNLOAD_PASS_ERROR_MESSAGE"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustomWithType(-1, v20, v21, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16
    && v10
    && (objc_msgSend(v16, "needsRegistration") & 1) == 0
    && !objc_msgSend(v10, "needsRegistration"))
  {
    v24 = -[PKProvisioningContext initWithEnvironment:provisioningController:groupsController:]([PKProvisioningContext alloc], "initWithEnvironment:provisioningController:groupsController:", 0, v9, 0);
    -[PKProvisioningContext setPeerPaymentWebService:](v24, "setPeerPaymentWebService:", v10);
    v25 = -[PKProvisioningBackgroundCoordinator initWithSetupContext:credential:previouslyAcceptedTerms:]([PKProvisioningBackgroundCoordinator alloc], "initWithSetupContext:credential:previouslyAcceptedTerms:", v24, v11, 1);
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke_34;
    v27[3] = &unk_1E2AC4D80;
    v30 = v19;
    v28 = v22;
    v29 = v25;
    v26 = v25;
    -[PKProvisioningBackgroundCoordinator startWithCompletion:](v26, "startWithCompletion:", v27);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "provisionPeerPaymentPassWithProvisioningController called, but failed to validate preconditions", buf, 2u);
    }

    (*((void (**)(void *, _QWORD, void *))v19 + 2))(v19, 0, v22);
  }

}

void __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke_2;
    block[3] = &unk_1E2ABDAB8;
    v9 = v6;
    v10 = a2;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __134__PKPeerPaymentWebServiceTargetDevice_provisionPeerPaymentPassWithProvisioningController_peerPaymentWebService_credential_completion___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(0xBuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v5 || v6)
  {
    if (v8)
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Pass provisioning failed with error: %@", (uint8_t *)&v18, 0xCu);
    }

    if (objc_msgSend(v6, "hasLocalizedTitleAndMessage"))
    {
      objc_msgSend(v6, "underlyingError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "domain");
      v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("PKPeerPaymentWebServiceErrorDomain");
      if (v10 == v11)
      {

      }
      else
      {
        v12 = v11;
        if (!v10 || !v11)
        {

LABEL_19:
          v17 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v6, "displayableError");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v15);
LABEL_20:

          goto LABEL_21;
        }
        v13 = -[__CFString isEqualToString:](v10, "isEqualToString:", v11);

        if ((v13 & 1) == 0)
          goto LABEL_19;
      }
    }
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "underlyingError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15)
      v16 = *(void **)(a1 + 32);
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v16);
    goto LABEL_20;
  }
  if (v8)
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Successfully provisioned peer payment pass!", (uint8_t *)&v18, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_21:

}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
  -[PKPeerPaymentService cloudStoreStatusWithCompletion:](self->_peerPaymentService, "cloudStoreStatusWithCompletion:", a3);
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  -[PKPeerPaymentService checkTLKsMissingWithCompletion:](self->_peerPaymentService, "checkTLKsMissingWithCompletion:", a3);
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  -[PKPeerPaymentService resetApplePayManateeViewWithCompletion:](self->_peerPaymentService, "resetApplePayManateeViewWithCompletion:", a3);
}

- (void)_handleAccountChangedNotification:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PKPeerPaymentTargetDeviceAccountDidChangeNotification"), self);

}

- (void)_handlePreferencesChangedNotification:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PKPeerPaymentTargetDevicePreferencesDidChangeNotification"), self);

}

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

- (void)renewAppleAccountWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PKAppleAccountManager sharedInstance](PKAppleAccountManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renewAppleAccountWithCompletionHandler:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceDelegate, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
}

@end
