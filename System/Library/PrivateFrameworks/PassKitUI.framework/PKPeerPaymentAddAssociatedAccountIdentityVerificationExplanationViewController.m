@implementation PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController

- (PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController)initWithPeerPaymentSetupFlowController:(id)a3
{
  id v5;
  PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController *v6;
  PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v13, sel_initWithContext_, objc_msgSend(v5, "context"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    -[PKExplanationViewController explanationView](v7, "explanationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentSetupFlowController passSnapShot](v7->_controller, "passSnapShot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v9);

    objc_msgSend(v8, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIgnoresInvertColors:", 1);

    objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationViewController setPrivacyLinkController:](v7, "setPrivacyLinkController:", v11);

    -[PKExplanationViewController setShowDoneButton:](v7, "setShowDoneButton:", 0);
    -[PKExplanationViewController setShowCancelButton:](v7, "setShowCancelButton:", 1);
    -[PKExplanationViewController setExplanationViewControllerDelegate:](v7, "setExplanationViewControllerDelegate:", v7);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController;
  -[PKExplanationViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PKPeerPaymentSetupFlowController configuration](self->_controller, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "peerPaymentSetupConfigurationType");

  if (v4 == 1)
  {
    -[PKPeerPaymentSetupFlowController configuration](self->_controller, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "familyMember");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController explanationView](self, "explanationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_IDENTITY_VERIFICATION_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleText:", v8);

  objc_msgSend(v6, "firstName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ADD_ASSOCIATED_ACCOUNT_IDENTITY_VERIFICATION_MESSAGE"), CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBodyText:", v10);

  objc_msgSend(v7, "setShowPrivacyView:", 1);
  objc_msgSend(v7, "setTopMargin:", 12.0);
  objc_msgSend(v7, "setBodyDataDetectorTypes:", 0);
  objc_msgSend(v7, "dockView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "footerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSetupLaterButton:", 0);
  objc_msgSend(v12, "setManualEntryButton:", 0);

}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __123__PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController_explanationViewControllerDidSelectCancel___block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  -[PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __123__PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController_explanationViewControllerDidSelectCancel___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  void (**continueHandler)(void);

  continueHandler = (void (**)(void))self->_continueHandler;
  if (continueHandler)
    continueHandler[2]();
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (id)continueHandler
{
  return self->_continueHandler;
}

- (void)setContinueHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
