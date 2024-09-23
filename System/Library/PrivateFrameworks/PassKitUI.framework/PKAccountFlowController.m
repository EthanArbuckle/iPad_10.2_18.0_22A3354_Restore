@implementation PKAccountFlowController

- (PKAccountFlowController)init
{
  PKAccountFlowController *v2;
  uint64_t v3;
  PKAccountService *accountService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAccountFlowController;
  v2 = -[PKAccountFlowController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    accountService = v2->_accountService;
    v2->_accountService = (PKAccountService *)v3;

  }
  return v2;
}

- (PKAccountFlowController)initWithAccountCredential:(id)a3 provisioningController:(id)a4 setupDelegate:(id)a5 context:(int64_t)a6 operations:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  PKAccountFlowController *v16;
  PKAccountFlowController *v17;
  uint64_t v18;
  PKAccount *account;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = -[PKAccountFlowController init](self, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_setupDelegate, v15);
    objc_storeStrong((id *)&v17->_accountCredential, a3);
    -[PKAccountCredential account](v17->_accountCredential, "account");
    v18 = objc_claimAutoreleasedReturnValue();
    account = v17->_account;
    v17->_account = (PKAccount *)v18;

    objc_storeStrong((id *)&v17->_provisioningController, a4);
    v17->_context = a6;
    v17->_isMerchantApp = PKPaymentSetupContextIsMerchantApp();
    v17->_operations = -[PKAccountFlowController _fitleredOperations:account:context:](v17, "_fitleredOperations:account:context:", a7, v17->_account, v17->_context);
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAccountFlowController _invalidateAssertion](self, "_invalidateAssertion");
  v3.receiver = self;
  v3.super_class = (Class)PKAccountFlowController;
  -[PKAccountFlowController dealloc](&v3, sel_dealloc);
}

- (unint64_t)_fitleredOperations:(unint64_t)a3 account:(id)a4 context:(int64_t)a5
{
  unint64_t v6;
  unint64_t v7;

  v6 = objc_msgSend(a4, "state");
  if (((0x3Du >> v6) & 1) != 0)
    v7 = 1;
  else
    v7 = a3;
  if (v6 < 6)
    a3 = v7;
  if ((PKPaymentSetupContextIsBridge() & 1) != 0 || !PKIsPairedWithWatch())
    a3 &= ~2uLL;
  return a3;
}

- (id)firstAccountViewController
{
  PKAccountPassActivationResultViewController *v3;
  int64_t context;
  id WeakRetained;
  PKAccountPassActivationResultViewController *v6;
  PKAccountPassMakeDefaultViewContoller *v7;
  int64_t v8;
  id v9;

  if ((self->_operations | 2) == 3)
  {
    v3 = [PKAccountPassActivationResultViewController alloc];
    context = self->_context;
    WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v6 = -[PKAccountPassActivationResultViewController initWithAccountFlowController:context:setupDelegate:](v3, "initWithAccountFlowController:context:setupDelegate:", self, context, WeakRetained);

    -[PKAccountPassActivationResultViewController setShowingLoadingIndicator:](v6, "setShowingLoadingIndicator:", 1);
    -[PKAccountPassActivationResultViewController setDidMakeAccountPassDefault:](v6, "setDidMakeAccountPassDefault:", 0);
  }
  else
  {
    v7 = [PKAccountPassMakeDefaultViewContoller alloc];
    v8 = self->_context;
    v9 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v6 = -[PKAccountPassMakeDefaultViewContoller initWithAccountFlowController:context:setupDelegate:](v7, "initWithAccountFlowController:context:setupDelegate:", self, v8, v9);

  }
  objc_storeWeak((id *)&self->_delegate, v6);
  return v6;
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__PKAccountFlowController_nextViewControllerWithCompletion___block_invoke;
    v6[3] = &unk_1E3E62370;
    v6[4] = self;
    v7 = v4;
    -[PKAccountFlowController _nextPostProvisioningViewControllerWithCompletion:](self, "_nextPostProvisioningViewControllerWithCompletion:", v6);

  }
}

void __60__PKAccountFlowController_nextViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 112))
    {
      objc_msgSend(*(id *)(v5 + 104), "resetForNewProvisioning");
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v8 = *(void **)(v6 + 112);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __60__PKAccountFlowController_nextViewControllerWithCompletion___block_invoke_2;
      v9[3] = &unk_1E3E61720;
      v9[4] = v6;
      v10 = v7;
      objc_msgSend(v8, "nextViewControllerWithCompletion:", v9);

      goto LABEL_6;
    }
    objc_msgSend((id)v5, "_invalidateAssertion");
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();
LABEL_6:

}

void __60__PKAccountFlowController_nextViewControllerWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_invalidateAssertion");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 112);
  *(_QWORD *)(v8 + 112) = 0;

}

- (void)performInitalOperations
{
  void *v3;
  id v4;

  -[PKAccountFlowController _acquireAssertion](self, "_acquireAssertion");
  -[PKAccountFlowController accountProvisioningController](self, "accountProvisioningController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((self->_operations & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v3, "provisionAccountPassToLocalDevice");
    v3 = v4;
  }

}

- (void)makeAccountPassDefault:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  unint64_t operations;
  unint64_t v7;
  id v8;

  v3 = a3;
  v5 = 1;
  if (!a3)
    v5 = 2;
  self->_madeDefault = v5;
  -[PKAccountFlowController accountProvisioningController](self, "accountProvisioningController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    operations = self->_operations;
    if ((operations & 8) != 0)
    {
      objc_msgSend(v8, "addToIDMS");
      operations = self->_operations;
    }
    if ((operations & 4) != 0)
      objc_msgSend(v8, "makeAccountPassDefaultOnLocalDevice");
  }
  v7 = self->_operations;
  if ((v7 & 2) != 0)
  {
    objc_msgSend(v8, "provisionAccountPassToWatchAsDefault:", v3);
    v7 = self->_operations;
  }
  if ((v7 & 0x10) != 0)
    objc_msgSend(v8, "performAMPEnrollmentShouldEnroll:shouldMakeDefault:", v3, v3);
  -[PKAccountFlowController _requestPresentationOfActiviationViewControllerShowingMadeDefault:](self, "_requestPresentationOfActiviationViewControllerShowingMadeDefault:", v3);

}

- (void)accountProvisioningControllerUpdatedState:(id)a3
{
  PKAccountProvisioningController *accountProvisioningController;
  BOOL v4;

  accountProvisioningController = self->_accountProvisioningController;
  if (accountProvisioningController)
    v4 = accountProvisioningController == a3;
  else
    v4 = 0;
  if (v4)
    -[PKAccountFlowController _checkAccountProvisioningControllerState:](self, "_checkAccountProvisioningControllerState:", a3);
}

- (void)accountProvisioningController:(id)a3 displayableError:(id)a4
{
  id v6;
  PKAccountProvisioningController *accountProvisioningController;
  BOOL v8;
  id v9;
  void *v10;
  id WeakRetained;
  id v12;
  PKAccountProvisioningController *v13;

  v13 = (PKAccountProvisioningController *)a3;
  v6 = a4;
  accountProvisioningController = self->_accountProvisioningController;
  if (accountProvisioningController)
    v8 = accountProvisioningController == v13;
  else
    v8 = 0;
  if (v8)
  {
    if (v6)
    {
      v9 = v6;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", 0, -[PKAccount feature](self->_account, "feature"), 0, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "accountFlowController:requestsPresentationOfDisplayableError:", self, v10);

    }
  }

}

- (void)_checkAccountProvisioningControllerState:(id)a3
{
  id v4;
  void *v5;
  unint64_t madeDefault;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  uint8_t buf[2];
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;

  v4 = a3;
  v5 = v4;
  if ((self->_operations & 1) != 0 && objc_msgSend(v4, "provisionLocalPassState") != 3)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v8 = "Local device provisioning is still running. Ignoring update";
      v9 = (uint8_t *)&v15;
      goto LABEL_29;
    }
LABEL_30:

    goto LABEL_31;
  }
  if (self->_isMerchantApp && (self->_operations & 1) != 0 && objc_msgSend(v5, "localPassActivationState") != 3)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v8 = "Local device pass still activating. Ignoring update";
      v9 = (uint8_t *)&v14;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  madeDefault = self->_madeDefault;
  if (madeDefault == 1)
  {
    if ((self->_operations & 4) != 0 && objc_msgSend(v5, "makeAccountPassDefaultOnLocalDeviceState") != 3)
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 0;
        v8 = "Card has not been made default on local device yet. Ignoring update";
        v9 = (uint8_t *)&v12;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    if (self->_isMerchantApp && (self->_operations & 8) != 0 && objc_msgSend(v5, "addToIDMSState") != 3)
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Card has not been added to IDMS. Ignoring update";
        v9 = buf;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if (!madeDefault && (self->_operations & 0x1C) != 0)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v8 = "User default choice not made yet. Ignoring update";
      v9 = (uint8_t *)&v13;
LABEL_29:
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  if ((self->_operations & 0x10) != 0 && objc_msgSend(v5, "addToAMPState") != 3)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v8 = "Card has not been added to AMP. Ignoring update";
      v9 = (uint8_t *)&v10;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  -[PKAccountFlowController _accountProvisioningControllerRequiresNextViewController:](self, "_accountProvisioningControllerRequiresNextViewController:", v5);
LABEL_31:

}

- (void)_accountProvisioningControllerRequiresNextViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;
  PKAccountFlowController *v8;

  objc_msgSend(a3, "setDelegate:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__PKAccountFlowController__accountProvisioningControllerRequiresNextViewController___block_invoke;
    v6[3] = &unk_1E3E71CE8;
    v7 = WeakRetained;
    v8 = self;
    -[PKAccountFlowController nextViewControllerWithCompletion:](self, "nextViewControllerWithCompletion:", v6);

  }
}

uint64_t __84__PKAccountFlowController__accountProvisioningControllerRequiresNextViewController___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (a3)
    return objc_msgSend(v5, "accountFlowController:requestsPresentationOfDisplayableError:", v6);
  else
    return objc_msgSend(v5, "accountFlowController:requestsPresentationOfViewController:", v6, a2);
}

- (void)_requestPresentationOfActiviationViewControllerShowingMadeDefault:(BOOL)a3
{
  _BOOL8 v3;
  PKAccountFlowControllerDelegate **p_delegate;
  id WeakRetained;
  PKAccountPassActivationResultViewController *v7;
  int64_t context;
  id v9;
  PKAccountPassActivationResultViewController *v10;
  void *v11;
  _BOOL8 v12;
  id v13;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v13 = WeakRetained;
    v7 = [PKAccountPassActivationResultViewController alloc];
    context = self->_context;
    v9 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v10 = -[PKAccountPassActivationResultViewController initWithAccountFlowController:context:setupDelegate:](v7, "initWithAccountFlowController:context:setupDelegate:", self, context, v9);

    -[PKAccountFlowController accountProvisioningController](self, "accountProvisioningController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "provisionLocalPassState") != 3
       || objc_msgSend(v11, "makeAccountPassDefaultOnLocalDeviceState") != 3
       || objc_msgSend(v11, "addToAMPState") != 3
       || objc_msgSend(v11, "addToIDMSState") != 3;
    -[PKAccountPassActivationResultViewController setShowingLoadingIndicator:](v10, "setShowingLoadingIndicator:", v12);
    -[PKAccountPassActivationResultViewController setDidMakeAccountPassDefault:](v10, "setDidMakeAccountPassDefault:", v3);
    -[PKAccountPassActivationResultViewController setDidAddToAmp:](v10, "setDidAddToAmp:", objc_msgSend(v11, "didAddToAMP"));
    objc_storeWeak((id *)p_delegate, v10);
    objc_msgSend(v13, "accountFlowController:requestsPresentationOfViewController:", self, v10);

    WeakRetained = v13;
  }

}

- (PKAccountProvisioningController)accountProvisioningController
{
  PKAccountProvisioningController *accountProvisioningController;
  PKAccountProvisioningController *v4;
  PKAccountProvisioningController *v5;
  double v6;
  void *v7;
  void *v8;
  PKAccountProvisioningController *v9;
  void *v10;

  accountProvisioningController = self->_accountProvisioningController;
  if (!accountProvisioningController)
  {
    v4 = (PKAccountProvisioningController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D668B8]), "initWithAccountCredential:provisioningController:usingRemoteLibrary:", self->_accountCredential, self->_provisioningController, PKPaymentSetupContextIsBridge());
    v5 = self->_accountProvisioningController;
    self->_accountProvisioningController = v4;

    -[PKAccountProvisioningController setDelegate:](self->_accountProvisioningController, "setDelegate:", self);
    v6 = 120.0;
    if (self->_isMerchantApp)
      v6 = 30.0;
    -[PKAccountProvisioningController setPassActivationTimeout:](self->_accountProvisioningController, "setPassActivationTimeout:", v6);
    -[PKAccountCredential paymentPass](self->_accountCredential, "paymentPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKAccount state](self->_account, "state") == 1)
    {
      objc_msgSend(v7, "devicePrimaryPaymentApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = self->_accountProvisioningController;
        objc_msgSend(v7, "uniqueID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAccountProvisioningController setProvisionedPassUniqueID:](v9, "setProvisionedPassUniqueID:", v10);

      }
    }

    accountProvisioningController = self->_accountProvisioningController;
  }
  return accountProvisioningController;
}

- (void)endProvisioningFlow
{
  self->_endedProvisioningFlow = 1;
}

- (void)_nextPostProvisioningViewControllerWithCompletion:(id)a3
{
  id v4;
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
  PKProvisioningExternalDeviceFlowItem *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  unint64_t context;
  void *v23;
  unint64_t postProvisoningContentIndex;
  PKProvisioningExternalDeviceFlowItem *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id val;
  PKEducationViewController *vala;
  PKAccountService *accountService;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id buf;
  _QWORD v43[5];
  PKProvisioningExternalDeviceFlowItem *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD aBlock[5];
  id v52;
  id location[2];

  v4 = a3;
  if (v4)
  {
    objc_initWeak(location, self);
    -[PKPaymentProvisioningController provisionedPasses](self->_provisioningController, "provisionedPasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secureElementPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke;
    aBlock[3] = &unk_1E3E64AF8;
    objc_copyWeak(&v52, location);
    aBlock[4] = self;
    v9 = _Block_copy(aBlock);
    -[PKPaymentProvisioningController provisioningResponse](self->_provisioningController, "provisioningResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "externalProvisioningOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      if (!PKShowFakeExternalDevicePicker())
      {
        v11 = 0;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0D66D78], "mockOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!self->_shownExternalDeviceProvisioning && v11 && v8 && (self->_operations & 0x20) != 0)
    {
      self->_shownExternalDeviceProvisioning = 1;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 0, self->_provisioningController, 0);
      -[PKPaymentProvisioningController eligibilityResponse](self->_provisioningController, "eligibilityResponse");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = -[PKProvisioningExternalDeviceFlowItem initWithContext:pass:externalOptions:cardIdentifier:]([PKProvisioningExternalDeviceFlowItem alloc], "initWithContext:pass:externalOptions:cardIdentifier:", v12, v8, v11, v14);
      -[PKProvisioningExternalDeviceFlowItem extract](v15, "extract");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_3;
      v46[3] = &unk_1E3E71D60;
      objc_copyWeak(&v50, location);
      v48 = v4;
      v17 = v16;
      v47 = v17;
      v49 = v9;
      objc_msgSend(v17, "preflightWithCompletion:", v46);

      objc_destroyWeak(&v50);
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
LABEL_11:
    -[PKPaymentProvisioningController moreInfoItems](self->_provisioningController, "moreInfoItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (!self->_shownMoreInfoItems && objc_msgSend(v18, "count"))
    {
      -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "targetDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = -[PKPaymentSetupMoreInfoViewController initWithMoreInfoItems:paymentPass:targetDevice:context:dismissalHandler:]([PKPaymentSetupMoreInfoViewController alloc], "initWithMoreInfoItems:paymentPass:targetDevice:context:dismissalHandler:", v12, v8, v14, self->_context, v9);
      -[PKProvisioningExternalDeviceFlowItem setIsFinalViewController:](v15, "setIsFinalViewController:", 0);
      (*((void (**)(id, PKProvisioningExternalDeviceFlowItem *))v4 + 2))(v4, v15);
      self->_shownMoreInfoItems = 1;
      goto LABEL_19;
    }
    if (self->_endedProvisioningFlow)
    {
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_21:

        objc_destroyWeak(&v52);
        objc_destroyWeak(location);
        goto LABEL_22;
      }
      LOWORD(buf) = 0;
      v20 = "Skipping account pass post provisioning content as provisoning ended";
LABEL_15:
      _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&buf, 2u);
      goto LABEL_16;
    }
    context = self->_context;
    if (context > 8 || ((1 << context) & 0x109) == 0)
    {
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      LOWORD(buf) = 0;
      v20 = "Skipping account pass post provisioning content for the current context";
      goto LABEL_15;
    }
    -[PKAccountCredential passDetailsResponse](self->_accountCredential, "passDetailsResponse");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postProvisioningContent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    postProvisoningContentIndex = self->_postProvisoningContentIndex;
    if (postProvisoningContentIndex >= objc_msgSend(v14, "count"))
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
      goto LABEL_20;
    }
    ++self->_postProvisoningContentIndex;
    objc_msgSend(v14, "objectAtIndex:");
    v25 = (PKProvisioningExternalDeviceFlowItem *)objc_claimAutoreleasedReturnValue();
    v15 = v25;
    if (!v25)
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
      goto LABEL_19;
    }
    v26 = -[PKProvisioningExternalDeviceFlowItem type](v25, "type");
    if (v26 >= 2)
    {
      if (v26 == 2)
      {
        -[PKPaymentProvisioningController provisionedPasses](self->_provisioningController, "provisionedPasses");
        val = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(val, "lastObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "secureElementPass");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "paymentPass");
        v38 = objc_claimAutoreleasedReturnValue();

        if (+[PKEducationViewController shouldPresentForPass:inEducationContext:](PKEducationViewController, "shouldPresentForPass:inEducationContext:", v38, 0))
        {
          PKSetHasSeenApplePayEducation();
          vala = -[PKEducationViewController initWithPaymentPass:setupContext:educationContext:]([PKEducationViewController alloc], "initWithPaymentPass:setupContext:educationContext:", v38, self->_context, 0);
          -[PKAccount feature](self->_account, "feature");
          PKLocalizedFeatureString();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKEducationViewController setTitleOverride:](vala, "setTitleOverride:", v31);

          PKLocalizedFeatureString();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKEducationViewController setBodyAddition:](vala, "setBodyAddition:", v32);

          objc_initWeak(&buf, vala);
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_60;
          v39[3] = &unk_1E3E71DB0;
          v40 = v9;
          objc_copyWeak(&v41, &buf);
          -[PKEducationViewController setContinueHandler:](vala, "setContinueHandler:", v39);
          (*((void (**)(id, PKEducationViewController *))v4 + 2))(v4, vala);
          objc_destroyWeak(&v41);

          objc_destroyWeak(&buf);
        }
        else
        {
          -[PKAccountFlowController _nextPostProvisioningViewControllerWithCompletion:](self, "_nextPostProvisioningViewControllerWithCompletion:", v4);
        }
        v29 = (void *)v38;
        goto LABEL_41;
      }
      if (v26 != 3)
        goto LABEL_19;
      v27 = self->_context;
      if (v27 <= 8 && ((1 << v27) & 0x109) != 0)
      {
        accountService = self->_accountService;
        -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_49;
        v43[3] = &unk_1E3E66008;
        v43[4] = self;
        v45 = v4;
        v15 = v15;
        v44 = v15;
        -[PKAccountService physicalCardsForAccountWithIdentifier:completion:](accountService, "physicalCardsForAccountWithIdentifier:completion:", v28, v43);

        v29 = v45;
LABEL_41:

        goto LABEL_19;
      }
      PKLogFacilityTypeGetObject();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19D178000, v33, OS_LOG_TYPE_DEFAULT, "Limiting Physical card ordering from appearing because of current context", (uint8_t *)&buf, 2u);
      }

    }
    -[PKAccountFlowController _nextPostProvisioningViewControllerWithCompletion:](self, "_nextPostProvisioningViewControllerWithCompletion:", v4);
    goto LABEL_19;
  }
LABEL_22:

}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_2;
    v7[3] = &unk_1E3E71D10;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "nextViewControllerWithCompletion:", v7);

  }
}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a2;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    v5 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, 0);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));

      if (WeakRetained)
      {
        v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 24));
        objc_msgSend(v6, "viewControllerDidTerminateSetupFlow:", *(_QWORD *)(a1 + 32));
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "navigationController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
      }
    }

  }
}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__37;
      v17 = __Block_byref_object_dispose__37;
      v18 = 0;
      v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_45;
      v9[3] = &unk_1E3E71D38;
      v11 = *(id *)(a1 + 48);
      v12 = &v13;
      v10 = *(id *)(a1 + 32);
      objc_msgSend(v6, "viewControllerWithCompletion:", v9);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v14[5];
      v14[5] = v7;

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      _Block_object_dispose(&v13, 8);

    }
    else
    {
      objc_msgSend(WeakRetained, "_nextPostProvisioningViewControllerWithCompletion:", *(_QWORD *)(a1 + 40));
    }
  }

}

uint64_t __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_2_50;
  v5[3] = &unk_1E3E65E08;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_2_50(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  PKPhysicalCardController *v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  PKPhysicalCardController *v15;
  id v16;
  uint8_t buf[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "provisionedPasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secureElementPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PKPhysicalCardController initWithAccountService:paymentPass:account:accountUser:physicalCards:]([PKPhysicalCardController alloc], "initWithAccountService:paymentPass:account:accountUser:physicalCards:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0, *(_QWORD *)(a1 + 40));
  if (-[PKPhysicalCardController canRequestNewPhysicalCard](v6, "canRequestNewPhysicalCard"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    -[PKPhysicalCardController setSetupDelegate:](v6, "setSetupDelegate:", WeakRetained);

    -[PKPhysicalCardController setParentFlowController:](v6, "setParentFlowController:", *(_QWORD *)(a1 + 32));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_52;
    v12[3] = &unk_1E3E71D88;
    v13 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v16 = v9;
    v14 = v10;
    v15 = v6;
    -[PKPhysicalCardController orderFlowViewControllerForReason:content:completion:](v15, "orderFlowViewControllerForReason:content:completion:", 0, v8, v12);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Skipping physical card order flow - user already has one", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_nextPostProvisioningViewControllerWithCompletion:", *(_QWORD *)(a1 + 56));
  }

}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitleOverride:", v7);

    objc_msgSend(*(id *)(a1 + 32), "body");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBodyOverride:", v8);

    objc_msgSend(*(id *)(a1 + 32), "primaryButtonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrimaryButtonTitleOverride:", v9);

    objc_msgSend(*(id *)(a1 + 32), "secondaryButtonTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSecondaryButtonTitleOverride:", v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Skipping physical card order flow - error: %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_nextPostProvisioningViewControllerWithCompletion:", *(_QWORD *)(a1 + 56));
  }

}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_60(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

- (void)_resetPostProvisioningContent
{
  self->_postProvisoningContentIndex = 0;
}

- (void)_acquireAssertion
{
  PKAssertion *notificationSupressionAssertion;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  notificationSupressionAssertion = self->_notificationSupressionAssertion;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (notificationSupressionAssertion)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Notification suppression assertion already acquired", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Acquiring notification suppression assertion", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v6 = (void *)MEMORY[0x1E0D66B80];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__PKAccountFlowController__acquireAssertion__block_invoke;
    v7[3] = &unk_1E3E6F340;
    objc_copyWeak(&v8, buf);
    objc_msgSend(v6, "acquireAssertionOfType:withReason:completion:", 4, CFSTR("Account Pass Provisioning"), v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __44__PKAccountFlowController__acquireAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *v8;
  id *WeakRetained;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (!v6 || v7)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Error acquiring notification suppression assertion: %@", buf, 0xCu);
      }

    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Acquired notification suppression assertion", buf, 2u);
      }

      objc_storeStrong(WeakRetained + 9, a2);
      objc_msgSend(WeakRetained[9], "setInvalidateWhenBackgrounded:", 0);
      v12 = WeakRetained[9];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __44__PKAccountFlowController__acquireAssertion__block_invoke_65;
      v13[3] = &unk_1E3E61310;
      objc_copyWeak(&v14, v8);
      objc_msgSend(v12, "setInvalidationHandler:", v13);
      objc_destroyWeak(&v14);
    }
  }

}

void __44__PKAccountFlowController__acquireAssertion__block_invoke_65(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Executing notification suppression assertion invalidation handler", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 9);
    *((_QWORD *)WeakRetained + 9) = 0;

  }
}

- (void)_invalidateAssertion
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_notificationSupressionAssertion)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating notification suppression assertion", v4, 2u);
    }

    -[PKAssertion invalidate](self->_notificationSupressionAssertion, "invalidate");
  }
}

+ (id)displayableErrorForError:(id)a3 featureIdentifier:(unint64_t)a4 genericErrorTitle:(id)a5 genericErrorMessage:(id)a6
{
  return (id)PKAccountDisplayableError();
}

- (unint64_t)operations
{
  return self->_operations;
}

- (PKAccountCredential)accountCredential
{
  return self->_accountCredential;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKSetupFlowControllerProtocol)parentFlowController
{
  return self->_parentFlowController;
}

- (void)setParentFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_parentFlowController, a3);
}

- (PKAccountFlowControllerDelegate)delegate
{
  return (PKAccountFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parentFlowController, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_accountCredential, 0);
  objc_storeStrong((id *)&self->_notificationSupressionAssertion, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountProvisioningController, 0);
}

@end
