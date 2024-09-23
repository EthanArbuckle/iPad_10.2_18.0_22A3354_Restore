@implementation PKPeerPaymentAddAssociatedAccountViewController

- (PKPeerPaymentAddAssociatedAccountViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 webService:(id)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7 context:(int64_t)a8 setupType:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  PKPeerPaymentAddAssociatedAccountViewController *v20;
  PKPeerPaymentAddAssociatedAccountViewController *v21;
  void *v22;
  uint64_t v23;
  PKPeerPaymentAccount *peerPaymentAccount;
  PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *v25;
  PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *configuration;
  void *v27;
  PKPeerPaymentSetupFlowController *v28;
  PKPeerPaymentSetupFlowController *peerPaymentSetupFlowController;
  void *v30;
  id v32;
  objc_super v33;

  v16 = a3;
  v17 = a4;
  v32 = a5;
  v18 = a6;
  v19 = a7;
  v33.receiver = self;
  v33.super_class = (Class)PKPeerPaymentAddAssociatedAccountViewController;
  v20 = -[PKExplanationViewController initWithContext:](&v33, sel_initWithContext_, a8);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_familyMember, a3);
    objc_storeStrong((id *)&v21->_familyCollection, a4);
    objc_storeStrong((id *)&v21->_webService, a5);
    v21->_setupType = a9;
    -[PKPeerPaymentWebService peerPaymentService](v21->_webService, "peerPaymentService");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "account");
    v23 = objc_claimAutoreleasedReturnValue();
    peerPaymentAccount = v21->_peerPaymentAccount;
    v21->_peerPaymentAccount = (PKPeerPaymentAccount *)v23;

    v25 = -[PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration initWithFamilyMember:associatedAccountSetupDelegate:setupType:]([PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration alloc], "initWithFamilyMember:associatedAccountSetupDelegate:setupType:", v21->_familyMember, v19, v21->_setupType);
    configuration = v21->_configuration;
    v21->_configuration = v25;

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67408]), "initWithPeerPaymentAccount:", v21->_peerPaymentAccount);
    v28 = -[PKPeerPaymentSetupFlowController initWithPeerPaymentCredential:provisioningController:passLibraryDataProvider:configuration:context:]([PKPeerPaymentSetupFlowController alloc], "initWithPeerPaymentCredential:provisioningController:passLibraryDataProvider:configuration:context:", v27, 0, v18, v21->_configuration, a8);
    peerPaymentSetupFlowController = v21->_peerPaymentSetupFlowController;
    v21->_peerPaymentSetupFlowController = v28;

    -[PKPeerPaymentSetupFlowController setParentViewController:](v21->_peerPaymentSetupFlowController, "setParentViewController:", v21);
    -[PKExplanationViewController setShowCancelButton:](v21, "setShowCancelButton:", PKPaymentSetupContextIsSetupAssistant() ^ 1);
    v21->_operations = 127;
    objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationViewController setPrivacyLinkController:](v21, "setPrivacyLinkController:", v30);

  }
  return v21;
}

- (void)viewDidLoad
{
  int IsBridge;
  int IsSetupAssistant;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t setupType;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PKWatchDeviceImageOverlayView *v23;
  PKWatchDeviceImageOverlayView *watchDeviceImageView;
  PKWatchDeviceImageOverlayView *v25;
  void *v26;
  uint8_t buf[16];
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PKPeerPaymentAddAssociatedAccountViewController;
  -[PKExplanationViewController viewDidLoad](&v28, sel_viewDidLoad);
  if ((-[PKPeerPaymentAccount supportsFamilySharing](self->_peerPaymentAccount, "supportsFamilySharing") & 1) != 0)
  {
    -[PKExplanationViewController context](self, "context");
    IsBridge = PKPaymentSetupContextIsBridge();
    -[PKExplanationViewController context](self, "context");
    IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    -[PKExplanationViewController explanationView](self, "explanationView");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject setDelegate:](v5, "setDelegate:", self);
    -[NSObject setShowPrivacyView:](v5, "setShowPrivacyView:", 1);
    if ((IsBridge & 1) == 0)
    {
      PKPassKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("AppleCashIcon"), CFSTR("pdf"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = PKUIScreenScale();
      PKUIImageFromPDF(v7, 80.0, 80.0, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject setImage:](v5, "setImage:", v9);
      -[NSObject imageView](v5, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setClipsToBounds:", 1);
      objc_msgSend(v10, "_setContinuousCornerRadius:", 20.0);
      -[NSObject setTopMargin:](v5, "setTopMargin:", 30.0);

    }
    -[NSObject dockView](v5, "dockView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "footerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setManualEntryButton:", 0);
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_FAMILY_PRIVACY_DISCLOSURE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setBodyButtonText:](v5, "setBodyButtonText:", v13);

    setupType = self->_setupType;
    if (setupType == 1)
    {
      PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_ADD_ASSOCIATED_ACCOUNT_TITLE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setTitleText:](v5, "setTitleText:", v19);

      -[PKFamilyMember firstName](self->_familyMember, "firstName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_ADD_ASSOCIATED_ACCOUNT_DESCRIPTION"), CFSTR("%@"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setBodyText:](v5, "setBodyText:", v21);

      if (!IsSetupAssistant)
      {
LABEL_13:
        if (IsBridge)
        {
          v23 = objc_alloc_init(PKWatchDeviceImageOverlayView);
          watchDeviceImageView = self->_watchDeviceImageView;
          self->_watchDeviceImageView = v23;

          v25 = self->_watchDeviceImageView;
          -[PKPeerPaymentAddAssociatedAccountViewController _imageForWatchView](self, "_imageForWatchView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKWatchDeviceImageOverlayView setOverlayImage:](v25, "setOverlayImage:", v26);

          -[NSObject setBodyView:](v5, "setBodyView:", self->_watchDeviceImageView);
        }

        goto LABEL_16;
      }
      objc_msgSend(v12, "setupLaterButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_ADD_ASSOCIATED_ACCOUNT_BUTTON_NOT_NOW"));
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (setupType)
        goto LABEL_13;
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_TITLE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setTitleText:](v5, "setTitleText:", v15);

      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_DESCRIPTION"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setBodyText:](v5, "setBodyText:", v16);

      if (!IsSetupAssistant)
        goto LABEL_13;
      objc_msgSend(v12, "setupLaterButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_SETUP_LATER"));
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v18;
    objc_msgSend(v17, "setTitle:forState:", v18, 0);

    goto LABEL_13;
  }
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", buf, 2u);
  }
LABEL_16:

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  int64_t setupType;
  id *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint8_t v23[8];
  objc_super v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PKPeerPaymentAddAssociatedAccountViewController;
  -[PKPeerPaymentAddAssociatedAccountViewController viewDidAppear:](&v24, sel_viewDidAppear_, a3);
  if ((-[PKPeerPaymentAccount supportsFamilySharing](self->_peerPaymentAccount, "supportsFamilySharing") & 1) != 0)
  {
    v4 = *MEMORY[0x1E0D698D8];
    objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D698D8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v4);
    setupType = self->_setupType;
    if (setupType)
    {
      if (setupType != 1)
      {
        v12 = 0;
        goto LABEL_13;
      }
      v7 = (id *)MEMORY[0x1E0D69240];
    }
    else
    {
      v7 = (id *)MEMORY[0x1E0D69248];
    }
    v12 = *v7;
LABEL_13:
    v16 = (void *)MEMORY[0x1E0D66A58];
    v17 = *MEMORY[0x1E0D68AA0];
    v26[0] = *MEMORY[0x1E0D69230];
    v18 = *MEMORY[0x1E0D69218];
    v25[0] = v17;
    v25[1] = v18;
    v19 = PKRunningInPassbook();
    v20 = (uint64_t *)MEMORY[0x1E0D69220];
    if (!v19)
      v20 = (uint64_t *)MEMORY[0x1E0D69228];
    v21 = *v20;
    v25[2] = *MEMORY[0x1E0D69238];
    v26[1] = v21;
    v26[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "subject:sendEvent:", v4, v22);

    if (!v5)
      objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", v4);
    goto LABEL_17;
  }
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", v23, 2u);
  }

  v9 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_FEATURE_NOT_SUPPORTED_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_FEATURE_NOT_SUPPORTED_MESSAGE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAction:", v15);
  -[PKPeerPaymentAddAssociatedAccountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

LABEL_17:
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[PKPeerPaymentAddAssociatedAccountViewController _invalidateCLInUseAssertion](self, "_invalidateCLInUseAssertion");
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentAddAssociatedAccountViewController;
  -[PKPeerPaymentAddAssociatedAccountViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)dealloc
{
  objc_super v3;

  -[PKPeerPaymentAddAssociatedAccountViewController _invalidateCLInUseAssertion](self, "_invalidateCLInUseAssertion");
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentAddAssociatedAccountViewController;
  -[PKPeerPaymentAddAssociatedAccountViewController dealloc](&v3, sel_dealloc);
}

- (void)_invalidateCLInUseAssertion
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v4;

  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
}

- (BOOL)shouldPushTerms
{
  return 0;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  void *v4;
  void *v5;
  CLInUseAssertion *v6;
  CLInUseAssertion *inUseAssertion;
  PKPeerPaymentSetupFlowController *peerPaymentSetupFlowController;
  unint64_t operations;
  _QWORD v10[5];

  -[PKPeerPaymentAddAssociatedAccountViewController _showSpinner:](self, "_showSpinner:", 1);
  if (!self->_inUseAssertion)
  {
    v4 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CLInUseAssertion *)objc_msgSend(v4, "newAssertionForBundle:withReason:", v5, CFSTR("Peer Payment Associated Account registration"));
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v6;

  }
  peerPaymentSetupFlowController = self->_peerPaymentSetupFlowController;
  operations = self->_operations;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PKPeerPaymentAddAssociatedAccountViewController_explanationViewDidSelectContinue___block_invoke;
  v10[3] = &unk_1E3E63138;
  v10[4] = self;
  -[PKPeerPaymentSetupFlowController nextViewControllerAfterPerfomingOperations:completion:](peerPaymentSetupFlowController, "nextViewControllerAfterPerfomingOperations:completion:", operations, v10);
}

void __84__PKPeerPaymentAddAssociatedAccountViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCLInUseAssertion");
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentDisplayableError:", v8);
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
    goto LABEL_7;
  }
  if (a3)
    goto LABEL_6;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v7, 1);

    goto LABEL_6;
  }
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "There was no error, cancelation, or next view controller to show for the add peer payment associated account flow. Terminating flow.", v11, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_terminateAddAssociatedAccountFlow");
LABEL_7:

}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  void *v4;
  id v5;

  -[PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration associatedAccountSetupDelegate](self->_configuration, "associatedAccountSetupDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "addPeerPaymentAssociatedAccountDidSkipSetupForFamilyMember:", self->_familyMember);
  else
    -[PKPeerPaymentAddAssociatedAccountViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/legal/privacy/en-ww/parent-disclosure/"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v5);
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  -[PKPeerPaymentAddAssociatedAccountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_presentDisplayableError:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__PKPeerPaymentAddAssociatedAccountViewController__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E3E612E8;
  v6[4] = self;
  v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  if (v4)
  {
    -[PKPeerPaymentAddAssociatedAccountViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else
  {
    -[PKPeerPaymentAddAssociatedAccountViewController _terminateAddAssociatedAccountFlow](self, "_terminateAddAssociatedAccountFlow");
  }

}

uint64_t __76__PKPeerPaymentAddAssociatedAccountViewController__presentDisplayableError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateAddAssociatedAccountFlow");
}

- (void)_terminateAddAssociatedAccountFlow
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terminating peer payment add associated account", v6, 2u);
  }

  -[PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration associatedAccountSetupDelegate](self->_configuration, "associatedAccountSetupDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "addPeerPaymentAssociatedAccountSetupCompletedWithSucess:updatedAccount:forFamilyMember:", 0, 0, self->_familyMember);
  else
    -[PKPeerPaymentAddAssociatedAccountViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dockView");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "primaryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowSpinner:", v3);

  v7 = v3 ^ 1;
  objc_msgSend(v11, "setButtonsEnabled:", v7);
  -[PKPeerPaymentAddAssociatedAccountViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

  objc_msgSend(v8, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v7);

}

- (id)_imageForWatchView
{
  unint64_t v2;
  void *v3;

  v2 = +[PKBridgeWatchAttributeController heroWatchSize](PKBridgeWatchAttributeController, "heroWatchSize");
  if (v2 <= 4)
  {
    PKUIImageNamed(off_1E3E72440[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_watchDeviceImageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentSetupFlowController, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end
