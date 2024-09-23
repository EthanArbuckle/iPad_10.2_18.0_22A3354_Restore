@implementation PKPaymentSetupAddToWatchOfferViewController

+ (void)shouldShowAddToWatchOfferForPass:(id)a3 inContext:(int64_t)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__PKPaymentSetupAddToWatchOfferViewController_shouldShowAddToWatchOfferForPass_inContext_withCompletion___block_invoke;
  v9[3] = &unk_1E3E6BC68;
  v10 = v7;
  v8 = v7;
  +[PKPaymentSetupAddToWatchOfferViewController shouldShowAddToWatchOfferForPass:inContext:externalProvisioningDeviceSerialNumbers:completion:](PKPaymentSetupAddToWatchOfferViewController, "shouldShowAddToWatchOfferForPass:inContext:externalProvisioningDeviceSerialNumbers:completion:", a3, a4, 0, v9);

}

uint64_t __105__PKPaymentSetupAddToWatchOfferViewController_shouldShowAddToWatchOfferForPass_inContext_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)shouldShowAddToWatchOfferForPass:(id)a3 inContext:(int64_t)a4 externalProvisioningDeviceSerialNumbers:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, const __CFString *);
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(id, _QWORD, const __CFString *);
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = (void (**)(id, _QWORD, const __CFString *))a6;
  if (v10)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Checking add to watch offer for pass", buf, 2u);
    }

    if (PKPaymentSetupContextIsBridge())
    {
      v10[2](v10, 0, CFSTR("FlowType is bridge"));
      goto LABEL_19;
    }
    if (PKPaymentSetupContextIsSetupAssistant())
    {
      v10[2](v10, 0, CFSTR("FlowType is setup assistant"));
      goto LABEL_19;
    }
    if (PKPaymentSetupContextIsIssuerApp())
    {
      v10[2](v10, 0, CFSTR("FlowType is issuer app"));
      goto LABEL_19;
    }
    if (PKPaymentSetupContextIsMerchantApp())
    {
      v10[2](v10, 0, CFSTR("FlowType is merchant app"));
      goto LABEL_19;
    }
    if ((PKIsPhone() & 1) == 0)
    {
      v10[2](v10, 0, CFSTR("Companion is not supported on device"));
      goto LABEL_19;
    }
    if (!v8 || (objc_msgSend(v8, "supportsSerialNumberBasedProvisioning") & 1) == 0)
    {
      v10[2](v10, 0, CFSTR("pass doesn't support serial number based provisioning"));
      goto LABEL_19;
    }
    if (objc_msgSend(v8, "requiresTransferSerialNumberBasedProvisioning"))
    {
      v10[2](v10, 0, CFSTR("pass requires transfer"));
      goto LABEL_19;
    }
    if (v9)
    {
      PKPairedOrPairingDevice();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKSerialNumberFromNRDevice();
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "containsObject:", v13))
      {
        v10[2](v10, 0, CFSTR("pass already provisioned onto watch earlier in flow"));
LABEL_26:

        goto LABEL_19;
      }

    }
    v13 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_3[0]());
    if (v13)
    {
      objc_msgSend(v8, "paymentPass");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __141__PKPaymentSetupAddToWatchOfferViewController_shouldShowAddToWatchOfferForPass_inContext_externalProvisioningDeviceSerialNumbers_completion___block_invoke;
      v15[3] = &unk_1E3E669E0;
      v16 = v13;
      v17 = v10;
      objc_msgSend(v16, "shouldShowWatchOfferForPaymentPass:withCompletion:", v14, v15);

    }
    goto LABEL_26;
  }
LABEL_19:

}

void __141__PKPaymentSetupAddToWatchOfferViewController_shouldShowAddToWatchOfferForPass_inContext_externalProvisioningDeviceSerialNumbers_completion___block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __141__PKPaymentSetupAddToWatchOfferViewController_shouldShowAddToWatchOfferForPass_inContext_externalProvisioningDeviceSerialNumbers_completion___block_invoke_2;
  v2[3] = &unk_1E3E61A58;
  v4 = a2;
  v3 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __141__PKPaymentSetupAddToWatchOfferViewController_shouldShowAddToWatchOfferForPass_inContext_externalProvisioningDeviceSerialNumbers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PKPaymentSetupAddToWatchOfferViewController)initWithPaymentPass:(id)a3 context:(int64_t)a4 dismissalHandler:(id)a5
{
  id v8;
  PKPaymentSetupAddToWatchOfferViewController *v9;
  uint64_t v10;
  id dismissalHandler;

  v8 = a5;
  v9 = -[PKAddToWatchOfferViewController initWithPass:context:](self, "initWithPass:context:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    dismissalHandler = v9->_dismissalHandler;
    v9->_dismissalHandler = (id)v10;

  }
  return v9;
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupAddToWatchOfferViewController;
  -[PKPaymentSetupAddToWatchOfferViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
  v4 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_3[0]());
  -[PKAddToWatchOfferViewController pass](self, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteWatchOfferShownForPaymentPass:", v6);

}

- (void)_handleBridgeProvisioningError:(id)a3
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
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  PKPaymentSetupAddToWatchOfferViewController *v23;

  v4 = a3;
  if (v4)
  {
    -[PKProvisioningAnalyticsSessionUIReporter reportError:context:](self->_reporter, "reportError:context:", v4, 0);
    v5 = (void *)MEMORY[0x1E0DC3450];
    PKTitleForDisplayableError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE46BC](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "localizedRecoveryOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D69EF0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = CFSTR("OK_BUTTON_TITLE");
    if (v10 && v12)
    {
      v14 = (void *)MEMORY[0x1E0DC3448];
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __78__PKPaymentSetupAddToWatchOfferViewController__handleBridgeProvisioningError___block_invoke;
      v21 = &unk_1E3E61D90;
      v22 = v12;
      v23 = self;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v10, 0, &v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v15, v18, v19, v20, v21);

      v13 = CFSTR("CANCEL");
    }
    PKLocalizedString(&v13->isa);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v16, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v17);
    -[PKPaymentSetupAddToWatchOfferViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    -[PKPaymentSetupAddToWatchOfferViewController _handleDismissal:](self, "_handleDismissal:", 0);
  }

}

uint64_t __78__PKPaymentSetupAddToWatchOfferViewController__handleBridgeProvisioningError___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

  return objc_msgSend(*(id *)(a1 + 40), "_handleDismissal:", 0);
}

- (void)_handleDismissal:(BOOL)a3
{
  _BOOL8 v3;
  void (**dismissalHandler)(id, PKPaymentSetupAddToWatchOfferViewController *, _BOOL8);
  id v6;

  v3 = a3;
  -[PKProvisioningAnalyticsSessionUIReporter reportPageCompleted:context:](self->_reporter, "reportPageCompleted:context:", a3, 0);
  dismissalHandler = (void (**)(id, PKPaymentSetupAddToWatchOfferViewController *, _BOOL8))self->_dismissalHandler;
  if (dismissalHandler)
  {
    dismissalHandler[2](dismissalHandler, self, v3);
  }
  else
  {
    -[PKPaymentSetupAddToWatchOfferViewController presentingViewController](self, "presentingViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", v3 ^ 1, 0);

  }
}

- (void)addToWatchOfferViewControllerDidNotRequestToAddToWatch
{
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 2);
  -[PKPaymentSetupAddToWatchOfferViewController _handleDismissal:](self, "_handleDismissal:", 0);
}

- (void)addToWatchOfferViewControllerDidRequestToAddToWatch
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PKPaymentSetupAddToWatchOfferViewController *v13;
  uint64_t *v14;
  uint8_t buf[8];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  v3 = objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_3[0]());
  -[PKAddToWatchOfferViewController showSpinner:](self, "showSpinner:", 1);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__PKPaymentSetupAddToWatchOfferViewController_addToWatchOfferViewControllerDidRequestToAddToWatch__block_invoke;
  v16[3] = &unk_1E3E62060;
  v16[4] = &v17;
  v6 = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.passbook.watchOffer"), v16);
  v18[3] = v6;

  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Asking bridge to open from watch offer", buf, 2u);
  }

  -[PKAddToWatchOfferViewController pass](self, "pass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __98__PKPaymentSetupAddToWatchOfferViewController_addToWatchOfferViewControllerDidRequestToAddToWatch__block_invoke_39;
  v11[3] = &unk_1E3E6BC90;
  v10 = v3;
  v12 = v10;
  v13 = self;
  v14 = &v17;
  objc_msgSend(v10, "beginProvisioningFromWatchOfferForPaymentPass:withCompletion:", v9, v11);

  _Block_object_dispose(&v17, 8);
}

void __98__PKPaymentSetupAddToWatchOfferViewController_addToWatchOfferViewControllerDidRequestToAddToWatch__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __98__PKPaymentSetupAddToWatchOfferViewController_addToWatchOfferViewControllerDidRequestToAddToWatch__block_invoke_39(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__PKPaymentSetupAddToWatchOfferViewController_addToWatchOfferViewControllerDidRequestToAddToWatch__block_invoke_2;
  v8[3] = &unk_1E3E68188;
  v11 = a2;
  v6 = *(_QWORD *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __98__PKPaymentSetupAddToWatchOfferViewController_addToWatchOfferViewControllerDidRequestToAddToWatch__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "showSpinner:", 0);
  if (*(_BYTE *)(a1 + 56))
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Success opening bridge", buf, 2u);
    }

    v3 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__PKPaymentSetupAddToWatchOfferViewController_addToWatchOfferViewControllerDidRequestToAddToWatch__block_invoke_40;
    block[3] = &unk_1E3E612E8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
    goto LABEL_15;
  }
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D69DC8]) & 1) != 0)
    {
      v6 = objc_msgSend(*(id *)(a1 + 40), "code");

      if (v6 == 10)
      {
        PKLogFacilityTypeGetObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Bridge failed to open from watch offer. Wallet not installed in Watch", buf, 2u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "reportPageCompleted:context:", 0, 0);
        v8 = PKCreateAlertControllerForWatchWalletUninstalled(0);
        objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);

        goto LABEL_15;
      }
    }
    else
    {

    }
  }
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Bridge failed to open from watch offer showing error", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleBridgeProvisioningError:", *(_QWORD *)(a1 + 40));
LABEL_15:
  v10 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
  }
}

uint64_t __98__PKPaymentSetupAddToWatchOfferViewController_addToWatchOfferViewControllerDidRequestToAddToWatch__block_invoke_40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDismissal:", 1);
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong((id *)&self->_interactionDisabledView, 0);
}

@end
