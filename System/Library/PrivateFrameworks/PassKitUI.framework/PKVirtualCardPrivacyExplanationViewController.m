@implementation PKVirtualCardPrivacyExplanationViewController

- (PKVirtualCardPrivacyExplanationViewController)initWithContext:(int64_t)a3 referralSource:(unint64_t)a4 resultCallback:(id)a5
{
  id v8;
  PKVirtualCardPrivacyExplanationViewController *v9;
  PKVirtualCardPrivacyExplanationViewController *v10;
  void *v11;
  id resultCallback;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKVirtualCardPrivacyExplanationViewController;
  v9 = -[PKExplanationViewController initWithContext:](&v14, sel_initWithContext_, a3);
  v10 = v9;
  if (v9)
  {
    v9->_referralSource = a4;
    v11 = _Block_copy(v8);
    resultCallback = v10->_resultCallback;
    v10->_resultCallback = v11;

  }
  return v10;
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
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKVirtualCardPrivacyExplanationViewController;
  -[PKExplanationViewController loadView](&v11, sel_loadView);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowPrivacyView:", 1);
  objc_msgSend(v3, "setDelegate:", self);
  PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_PRIVACY_EXPLANATION_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_PRIVACY_EXPLANATION_BODY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  objc_msgSend(v3, "setTopMargin:", 80.0);
  PKUIImageNamed(CFSTR("WalletSafariHero"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

  objc_msgSend(v3, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v3, "dockView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setupLaterButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_SET_UP_DECLINE_BUTTON"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:forState:", v10, 0);

  objc_msgSend(v8, "setManualEntryButton:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKVirtualCardPrivacyExplanationViewController;
  -[PKExplanationViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PKVirtualCardPrivacyExplanationViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[PKVirtualCardPrivacyExplanationViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  v3 = (void *)MEMORY[0x1E0D66A58];
  v13[0] = *MEMORY[0x1E0D69950];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D68C50];
  v6 = *MEMORY[0x1E0D68F50];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v6;
  v7 = *MEMORY[0x1E0D68918];
  v12[0] = v5;
  v12[1] = v7;
  v11[2] = *MEMORY[0x1E0D693B0];
  objc_msgSend(MEMORY[0x1E0D66A58], "virtualCardReferralSource:", self->_referralSource);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subjects:sendEvent:", v4, v9);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKVirtualCardPrivacyExplanationViewController;
  -[PKVirtualCardPrivacyExplanationViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKVirtualCardPrivacyExplanationViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D69950];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69950]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    self->_didBeginWalletProvisioningSubject = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v3);
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginWalletProvisioningSubject)
  {
    self->_didBeginWalletProvisioningSubject = 0;
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69950]);
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D66A58];
  v13[0] = *MEMORY[0x1E0D69950];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D68B18];
  v7 = *MEMORY[0x1E0D68F50];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v7;
  v8 = *MEMORY[0x1E0D68918];
  v12[0] = v6;
  v12[1] = v8;
  v11[2] = *MEMORY[0x1E0D68858];
  v12[2] = *MEMORY[0x1E0D68958];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subjects:sendEvent:", v5, v9);

  PKSetSafariCredentialImportConsented();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PKVirtualCardPrivacyExplanationViewController_explanationViewDidSelectContinue___block_invoke;
  v10[3] = &unk_1E3E612E8;
  v10[4] = self;
  -[PKVirtualCardPrivacyExplanationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10);
}

uint64_t __82__PKVirtualCardPrivacyExplanationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D66A58];
  v13[0] = *MEMORY[0x1E0D69950];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D68B18];
  v7 = *MEMORY[0x1E0D68F50];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v7;
  v8 = *MEMORY[0x1E0D68918];
  v12[0] = v6;
  v12[1] = v8;
  v11[2] = *MEMORY[0x1E0D68858];
  v12[2] = *MEMORY[0x1E0D68E60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subjects:sendEvent:", v5, v9);

  PKSetSafariCredentialImportConsented();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PKVirtualCardPrivacyExplanationViewController_explanationViewDidSelectSetupLater___block_invoke;
  v10[3] = &unk_1E3E612E8;
  v10[4] = self;
  -[PKVirtualCardPrivacyExplanationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10);
}

uint64_t __84__PKVirtualCardPrivacyExplanationViewController_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (id)resultCallback
{
  return self->_resultCallback;
}

- (void)setResultCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultCallback, 0);
}

@end
