@implementation PKPhysicalCardReaderModeActivationViewController

- (PKPhysicalCardReaderModeActivationViewController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 paymentPass:(id)a6 physicalCard:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPhysicalCardReaderModeActivationViewController *v17;
  PKPhysicalCardReaderModeActivationViewController *v18;
  id v20;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v20 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKPhysicalCardReaderModeActivationViewController;
  v17 = -[PKExplanationViewController initWithContext:](&v21, sel_initWithContext_, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accountService, a3);
    objc_storeStrong((id *)&v18->_account, a4);
    objc_storeStrong((id *)&v18->_accountUser, a5);
    objc_storeStrong((id *)&v18->_physicalCard, a7);
    objc_storeStrong((id *)&v18->_paymentPass, a6);
    v18->_feature = objc_msgSend(v14, "feature");
    v18->_deviceSupportsReaderMode = +[PKPhysicalCardController deviceSupportsContactlessActivation](PKPhysicalCardController, "deviceSupportsContactlessActivation");
    -[PKExplanationViewController setShowCancelButton:](v18, "setShowCancelButton:", 1);
    -[PKExplanationViewController setShowDoneButton:](v18, "setShowDoneButton:", 0);
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPhysicalCardReaderModeActivationViewController _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicalCardReaderModeActivationViewController;
  -[PKPhysicalCardReaderModeActivationViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  PKPhysicalCardActivationAnimationView *v3;
  PKPhysicalCardActivationAnimationView *animationView;
  PKPhysicalCardActivationAnimationView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPhysicalCardReaderModeActivationViewController;
  -[PKExplanationViewController viewDidLoad](&v15, sel_viewDidLoad);
  v3 = objc_alloc_init(PKPhysicalCardActivationAnimationView);
  animationView = self->_animationView;
  self->_animationView = v3;

  v5 = self->_animationView;
  -[PKPhysicalCard nameOnCard](self->_physicalCard, "nameOnCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPhysicalCardActivationAnimationView setNameOnCard:](v5, "setNameOnCard:", v6);

  -[PKExplanationViewController explanationView](self, "explanationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setShowPrivacyView:", 0);
  objc_msgSend(v7, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v7, "setHeroView:", self->_animationView);
  PKLocalizedFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleText:", v8);

  PKLocalizedFeatureString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBodyText:", v9);

  objc_msgSend(v7, "dockView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPrimaryButton:", 0);
  objc_msgSend(v7, "dockView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "footerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSkipCardButton:", 0);
  objc_msgSend(v12, "setManualEntryButton:", 0);
  objc_msgSend(v12, "setupLaterButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v14, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPhysicalCardReaderModeActivationViewController;
  -[PKPhysicalCardReaderModeActivationViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKPhysicalCardReaderModeActivationViewController _startTagReaderSession](self, "_startTagReaderSession");
  -[PKPhysicalCardActivationAnimationView startAnimation](self->_animationView, "startAnimation");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPhysicalCardReaderModeActivationViewController;
  -[PKPhysicalCardReaderModeActivationViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKPhysicalCardReaderModeActivationViewController _stopTagReaderSession](self, "_stopTagReaderSession");
}

- (void)nfcTagReaderSession:(id)a3 didDetectTags:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSession_didDetectTags___block_invoke;
    v9[3] = &unk_1E3E70388;
    objc_copyWeak(&v11, &location);
    v10 = v8;
    objc_msgSend(v6, "readNDEFMessageFromTag:completion:", v10, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __86__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSession_didDetectTags___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  BOOL v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByTrimmingCharactersInSet:](v3, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v6;
  v7 = CFSTR("wallet://activate/nfc");
  if (v3 == v7)
  {

LABEL_11:
    objc_msgSend(WeakRetained, "_stopTagReaderSession");
    objc_msgSend(*(id *)(a1 + 32), "tagIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hexEncoding");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __86__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSession_didDetectTags___block_invoke_2;
      v13[3] = &unk_1E3E61388;
      v13[4] = WeakRetained;
      v14 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], v13);

    }
    goto LABEL_14;
  }
  v8 = v7;
  if (v3)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {

    goto LABEL_14;
  }
  v10 = -[__CFString isEqualToString:](v3, "isEqualToString:", v7);

  if (v10)
    goto LABEL_11;
LABEL_14:

}

uint64_t __86__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSession_didDetectTags___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentActivationWithActivationCode:", *(_QWORD *)(a1 + 40));
}

- (void)nfcTagReaderSessionDidEndUnexpectedly:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Error in physical card activation reader session. Dismissing...", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSessionDidEndUnexpectedly___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __90__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_stopTagReaderSession");
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)nfcTagReaderSessionDidTimeout:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Error in physical card activation reader session due to timeout. Dismissing...", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSessionDidTimeout___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __82__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSessionDidTimeout___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_stopTagReaderSession");
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  void *v4;
  PKPhysicalCardSupportViewController *v5;

  v5 = -[PKPhysicalCardSupportViewController initWithAccountService:account:accountUser:paymentPass:physicalCard:]([PKPhysicalCardSupportViewController alloc], "initWithAccountService:account:accountUser:paymentPass:physicalCard:", self->_accountService, self->_account, self->_accountUser, self->_paymentPass, self->_physicalCard);
  -[PKPhysicalCardReaderModeActivationViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (void)_dismiss
{
  id v3;

  -[PKPhysicalCardReaderModeActivationViewController _stopTagReaderSession](self, "_stopTagReaderSession");
  -[PKPhysicalCardReaderModeActivationViewController presentingViewController](self, "presentingViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_startTagReaderSession
{
  PKNFCTagReaderSession *readerSession;
  void *v4;
  PKPaymentSessionHandle *v5;
  PKPaymentSessionHandle *sessionHandle;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_invalidated && self->_deviceSupportsReaderMode)
  {
    if (self->_sessionHandle)
    {
      readerSession = self->_readerSession;
      if (readerSession)
        -[PKNFCTagReaderSession startPolling](readerSession, "startPolling");
    }
    else
    {
      objc_initWeak(&location, self);
      v4 = (void *)MEMORY[0x1E0D66E78];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __74__PKPhysicalCardReaderModeActivationViewController__startTagReaderSession__block_invoke;
      v7[3] = &unk_1E3E703B0;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v4, "startReaderSessionWithCompletion:", v7);
      v5 = (PKPaymentSessionHandle *)objc_claimAutoreleasedReturnValue();
      sessionHandle = self->_sessionHandle;
      self->_sessionHandle = v5;

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __74__PKPhysicalCardReaderModeActivationViewController__startTagReaderSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKPhysicalCardReaderModeActivationViewController__startTagReaderSession__block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __74__PKPhysicalCardReaderModeActivationViewController__startTagReaderSession__block_invoke_2(id *a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && !*((_BYTE *)WeakRetained + 1088))
  {
    v3 = a1[4];
    v9 = WeakRetained;
    if (v3)
    {
      objc_storeStrong(WeakRetained + 138, v3);
      objc_msgSend(a1[4], "setDelegate:", v9);
      objc_msgSend(a1[4], "startPolling");
LABEL_5:
      WeakRetained = v9;
      goto LABEL_6;
    }
    objc_msgSend(a1[5], "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    WeakRetained = v9;
    if (v6)
    {
      v7 = objc_msgSend(a1[5], "code") == 50;
      WeakRetained = v9;
      if (v7)
      {
        v8 = PKCreateAlertControllerForNFCRadioDisabled();
        objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

        goto LABEL_5;
      }
    }
  }
LABEL_6:

}

- (void)_stopTagReaderSession
{
  PKNFCTagReaderSession *readerSession;
  PKPaymentSessionHandle *sessionHandle;

  if (!self->_invalidated)
  {
    -[PKPaymentSessionHandle invalidateSession](self->_sessionHandle, "invalidateSession");
    readerSession = self->_readerSession;
    self->_readerSession = 0;

    sessionHandle = self->_sessionHandle;
    self->_sessionHandle = 0;

  }
}

- (void)_presentActivationWithActivationCode:(id)a3
{
  id v4;
  void *v5;
  PKPhysicalCardManualActivationViewController *v6;

  v4 = a3;
  v6 = -[PKPhysicalCardManualActivationViewController initWithAccountService:account:accountUser:paymentPass:physicalCard:activationCode:]([PKPhysicalCardManualActivationViewController alloc], "initWithAccountService:account:accountUser:paymentPass:physicalCard:activationCode:", self->_accountService, self->_account, self->_accountUser, self->_paymentPass, self->_physicalCard, v4);

  -[PKPhysicalCardReaderModeActivationViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)_invalidate
{
  if (!self->_invalidated)
  {
    -[PKPhysicalCardReaderModeActivationViewController _stopTagReaderSession](self, "_stopTagReaderSession");
    self->_invalidated = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_readerSession, 0);
  objc_storeStrong((id *)&self->_sessionHandle, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_physicalCard, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
}

@end
