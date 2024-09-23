@implementation PKVirtualCardEnrollmentViewController

- (PKVirtualCardEnrollmentViewController)initWithPaymentPass:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PKVirtualCardEnrollmentViewController *v11;
  PKVirtualCardEnrollmentViewController *v12;
  PKHeroCardExplanationHeaderView *v13;
  PKHeroCardExplanationHeaderView *heroCardView;

  v9 = a3;
  v10 = a5;
  v11 = -[PKExplanationViewController initWithContext:](self, "initWithContext:", a4);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_paymentPass, a3);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13 = -[PKHeroCardExplanationHeaderView initWithImage:]([PKHeroCardExplanationHeaderView alloc], "initWithImage:", 0);
    heroCardView = v12->_heroCardView;
    v12->_heroCardView = v13;

    v12->_state = 0;
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:", self);
  v4.receiver = self;
  v4.super_class = (Class)PKVirtualCardEnrollmentViewController;
  -[PKVirtualCardEnrollmentViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKVirtualCardEnrollmentViewController;
  -[PKExplanationViewController loadView](&v10, sel_loadView);
  -[PKExplanationViewController setExplanationViewControllerDelegate:](self, "setExplanationViewControllerDelegate:", self);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "setDelegate:", self);
  PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_SET_UP_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_SET_UP_EXPLANATION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  objc_msgSend(v3, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v3, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupLaterButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_SET_UP_DECLINE_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  objc_msgSend(v7, "setManualEntryButton:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  PKPaymentPass *paymentPass;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)PKVirtualCardEnrollmentViewController;
  -[PKExplanationViewController viewDidLoad](&v23, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_receivedPassUpdatedNotification_, *MEMORY[0x1E0D6A7A0], 0);

  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHeroCardExplanationHeaderView backgroundColor](self->_heroCardView, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTopBackgroundColor:", v5);

  +[PKHeroCardExplanationHeaderView recommendedCardImageSize](PKHeroCardExplanationHeaderView, "recommendedCardImageSize");
  v7 = v6;
  v9 = v8;
  +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  paymentPass = self->_paymentPass;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__PKVirtualCardEnrollmentViewController_viewDidLoad__block_invoke;
  v21[3] = &unk_1E3E61428;
  v21[4] = self;
  v12 = v4;
  v22 = v12;
  objc_msgSend(v10, "snapshotWithPass:size:completion:", paymentPass, v21, v7, v9);

  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController setShowCloseButton:](self, "setShowCloseButton:", 1);
  v13 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v13, "configureWithTransparentBackground");
  -[PKVirtualCardEnrollmentViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStandardAppearance:", v13);
  objc_msgSend(v14, "setCompactAppearance:", v13);
  objc_msgSend(v14, "setScrollEdgeAppearance:", v13);
  -[PKVirtualCardEnrollmentViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  v15 = objc_alloc(MEMORY[0x1E0C99E08]);
  v16 = *MEMORY[0x1E0D68F50];
  v24[0] = *MEMORY[0x1E0D68AA0];
  v24[1] = v16;
  v17 = *MEMORY[0x1E0D69868];
  v25[0] = *MEMORY[0x1E0D68C50];
  v25[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithDictionary:", v18);

  PKDefaultPaymentNetworkNameForPaymentPass();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v19, "setValue:forKey:", v20, *MEMORY[0x1E0D690E0]);
  objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D69910], v19);

}

void __52__PKVirtualCardEnrollmentViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKVirtualCardEnrollmentViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E3E61400;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __52__PKVirtualCardEnrollmentViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setCardImage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "setHeroView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032));
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKVirtualCardEnrollmentViewController;
  -[PKVirtualCardEnrollmentViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKVirtualCardEnrollmentViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D69910];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69910]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    self->_didBeginPassManagementSubject = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v3);
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginPassManagementSubject)
  {
    self->_didBeginPassManagementSubject = 0;
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69910]);
  }
}

- (void)waitForPassToUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Waiting for pass to update with virtual card info…", v8, 2u);
  }

  -[PKVirtualCardEnrollmentViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_SET_UP_IN_PROGRESS_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleText:", v5);

  PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_SET_UP_IN_PROGRESS_BODY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBodyText:", v6);

  objc_msgSend(v4, "setShowSpinner:", 1);
  objc_msgSend(v4, "dockView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[PKVirtualCardEnrollmentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_passDidNotUpdateInTime, 0, 10.0);
}

- (void)receivedPassUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (self->_state == 1)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A7F0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPass uniqueID](self->_paymentPass, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Got pass update notification, for pass being enrolled to virtual card", buf, 2u);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__PKVirtualCardEnrollmentViewController_receivedPassUpdatedNotification___block_invoke;
      block[3] = &unk_1E3E612E8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Got pass update notification, but not for the pass being enrolled", buf, 2u);
      }

    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Got pass update notification, but not in the virtual card enrolling state. Ignoring.", buf, 2u);
    }

  }
}

uint64_t __73__PKVirtualCardEnrollmentViewController_receivedPassUpdatedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "passDidUpdate");
}

- (void)passDidNotUpdateInTime
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_state != 2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Successfully enrolled virtual card, but didn't receive pass update notification in time. Treating as successful", v4, 2u);
    }

    -[PKVirtualCardEnrollmentViewController passDidUpdate](self, "passDidUpdate");
  }
}

- (void)passDidUpdate
{
  NSObject *v3;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[8];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (self->_state != 2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Updating virtual card enrollment UI to success", buf, 2u);
    }

    self->_state = 2;
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:", self);
    -[PKExplanationViewController explanationView](self, "explanationView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_SET_UP_COMPLETE_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleText:", v5);

    -[PKPaymentPass localizedDescription](self->_paymentPass, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_SET_UP_COMPLETE_BODY"), CFSTR("%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBodyText:", v7);

    -[PKExplanationViewController explanationView](self, "explanationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShowSpinner:", 0);

    -[PKExplanationViewController explanationView](self, "explanationView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShowCheckmark:", 1);

    objc_msgSend(v4, "dockView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_SET_UP_COMPLETE_BUTTON"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:forState:", v12, 0);

    objc_msgSend(v4, "setForceShowSetupLaterButton:", 0);
    objc_msgSend(v4, "dockView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

    v14 = (void *)MEMORY[0x1E0D66A58];
    v15 = *MEMORY[0x1E0D69910];
    v16 = *MEMORY[0x1E0D68F50];
    v20[0] = *MEMORY[0x1E0D68AA0];
    v20[1] = v16;
    v17 = *MEMORY[0x1E0D69860];
    v21[0] = *MEMORY[0x1E0D68C50];
    v21[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subject:sendEvent:", v15, v18);

  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  PKPaymentAuthorizationViewController *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint8_t v20[8];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_state == 2)
  {
    -[PKVirtualCardEnrollmentViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "virtualCardEnrollmentViewController:didCompleteWithSuccess:", self, 1);

    v6 = (void *)MEMORY[0x1E0D66A58];
    v7 = *MEMORY[0x1E0D69910];
    v8 = *MEMORY[0x1E0D68B18];
    v9 = *MEMORY[0x1E0D68F50];
    v23[0] = *MEMORY[0x1E0D68AA0];
    v23[1] = v9;
    v10 = *MEMORY[0x1E0D69860];
    v24[0] = v8;
    v24[1] = v10;
    v23[2] = *MEMORY[0x1E0D68858];
    v24[2] = *MEMORY[0x1E0D68A68];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subject:sendEvent:", v7, v11);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Presenting virtual card enrollment Oslo sheet", v20, 2u);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67788]), "initWithPaymentPass:", self->_paymentPass);
    v13 = -[PKPaymentAuthorizationViewController initWithPaymentRequest:]([PKPaymentAuthorizationViewController alloc], "initWithPaymentRequest:", v11);
    -[PKPaymentAuthorizationViewController setDelegate:](v13, "setDelegate:", self);
    -[PKVirtualCardEnrollmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
    v14 = (void *)MEMORY[0x1E0D66A58];
    v15 = *MEMORY[0x1E0D69910];
    v16 = *MEMORY[0x1E0D68B18];
    v17 = *MEMORY[0x1E0D68F50];
    v21[0] = *MEMORY[0x1E0D68AA0];
    v21[1] = v17;
    v18 = *MEMORY[0x1E0D69868];
    v22[0] = v16;
    v22[1] = v18;
    v21[2] = *MEMORY[0x1E0D68858];
    v22[2] = *MEMORY[0x1E0D68958];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subject:sendEvent:", v15, v19);

  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[PKVirtualCardEnrollmentViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "virtualCardEnrollmentViewController:didCompleteWithSuccess:", self, 0);

  v5 = (void *)MEMORY[0x1E0D66A58];
  v6 = *MEMORY[0x1E0D69910];
  v7 = *MEMORY[0x1E0D68B18];
  v8 = *MEMORY[0x1E0D68F50];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v8;
  v9 = *MEMORY[0x1E0D69868];
  v12[0] = v7;
  v12[1] = v9;
  v11[2] = *MEMORY[0x1E0D68858];
  v12[2] = *MEMORY[0x1E0D68E60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject:sendEvent:", v6, v10);

}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[PKVirtualCardEnrollmentViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "virtualCardEnrollmentViewController:didCompleteWithSuccess:", self, 0);

  v5 = (void *)MEMORY[0x1E0D66A58];
  v6 = *MEMORY[0x1E0D69910];
  v7 = *MEMORY[0x1E0D68B18];
  v8 = *MEMORY[0x1E0D68F50];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v8;
  v9 = *MEMORY[0x1E0D69868];
  v12[0] = v7;
  v12[1] = v9;
  v11[2] = *MEMORY[0x1E0D68858];
  v12[2] = *MEMORY[0x1E0D68A60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject:sendEvent:", v6, v10);

}

- (void)paymentAuthorizationViewController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  void (**v6)(id, void *);
  NSObject *v7;
  id v8;
  void *v9;
  uint8_t v10[16];

  v6 = (void (**)(id, void *))a5;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Finished virtual card enrollment", v10, 2u);
  }

  self->_state = 1;
  -[PKExplanationViewController setShowCloseButton:](self, "setShowCloseButton:", 0);
  v8 = objc_alloc(MEMORY[0x1E0D670A8]);
  v9 = (void *)objc_msgSend(v8, "initWithStatus:errors:", 0, MEMORY[0x1E0C9AA60]);
  v6[2](v6, v9);

}

- (void)paymentAuthorizationViewControllerDidFinish:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__PKVirtualCardEnrollmentViewController_paymentAuthorizationViewControllerDidFinish___block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  -[PKVirtualCardEnrollmentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

_QWORD *__85__PKVirtualCardEnrollmentViewController_paymentAuthorizationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[133] == 1)
    return (_QWORD *)objc_msgSend(result, "waitForPassToUpdate");
  return result;
}

- (PKVirtualCardEnrollmentViewControllerDelegate)delegate
{
  return (PKVirtualCardEnrollmentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPass, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heroCardView, 0);
}

@end
