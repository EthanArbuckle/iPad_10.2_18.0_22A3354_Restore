@implementation PKAccountInvitationOnboardingViewController

- (PKAccountInvitationOnboardingViewController)initWithController:(id)a3
{
  id v5;
  PKAccountInvitationOnboardingViewController *v6;
  PKAccountInvitationOnboardingViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountInvitationOnboardingViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v9, sel_initWithContext_, objc_msgSend(v5, "context"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_controller, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  PKAccountInvitationOnboardingListView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKAccountInvitationOnboardingListView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PKAccountInvitationOnboardingViewController;
  -[PKExplanationViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("APPLE_CARD_FOR_FAMILY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  PKLocalizedMadisonString(CFSTR("APPLE_CARD_INVITATION_ONBOARDING_BODY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  objc_msgSend(v3, "setBodyViewPadding:", 24.0);
  v6 = [PKAccountInvitationOnboardingListView alloc];
  PKLocalizedMadisonString(CFSTR("APPLE_CARD_INVITATION_ONBOARDING_COOWNERS_TITLE"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("APPLE_CARD_INVITATION_ONBOARDING_COOWNERS_BODY"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountInvitationOnboardingViewController _listItemConfigWithTitle:body:image:](self, "_listItemConfigWithTitle:body:image:", v19, v18, CFSTR("CardFamilySharing/CoOwners"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  PKLocalizedMadisonString(CFSTR("APPLE_CARD_INVITATION_ONBOARDING_PARTICIPANTS_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("APPLE_CARD_INVITATION_ONBOARDING_PARTICIPANTS_BODY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountInvitationOnboardingViewController _listItemConfigWithTitle:body:image:](self, "_listItemConfigWithTitle:body:image:", v7, v8, CFSTR("CardFamilySharing/Participants"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  PKLocalizedMadisonString(CFSTR("APPLE_CARD_INVITATION_ONBOARDING_CREDIT_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("APPLE_CARD_INVITATION_ONBOARDING_CREDIT_BODY"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountInvitationOnboardingViewController _listItemConfigWithTitle:body:image:](self, "_listItemConfigWithTitle:body:image:", v10, v11, CFSTR("CardFamilySharing/BuildCredit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKAccountInvitationOnboardingListView initWithConfigurations:](v6, "initWithConfigurations:", v13);
  objc_msgSend(v3, "setBodyView:", v14);

  objc_msgSend(v3, "setShowPrivacyView:", 1);
  objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController setPrivacyLinkController:](self, "setPrivacyLinkController:", v15);

  -[PKAccountInvitationOnboardingViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678B0]);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKAccountInvitationOnboardingViewController;
  -[PKAccountInvitationOnboardingViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[PKAccountInvitationOnboardingViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  -[PKAccountInvitationController applyController](self->_controller, "applyController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D698C8];
  v6 = *MEMORY[0x1E0D68610];
  v9 = *MEMORY[0x1E0D68AA0];
  v10[0] = *MEMORY[0x1E0D68C50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportAnalyticsDictionaryForPage:subject:pageTag:additionalValues:", 0, v5, v6, v7);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKAccountInvitationOnboardingViewController;
  -[PKAccountInvitationOnboardingViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  -[PKAccountInvitationController applyController](self->_controller, "applyController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D698C8];
  v6 = *MEMORY[0x1E0D68610];
  v9 = *MEMORY[0x1E0D68AA0];
  v10[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportAnalyticsDictionaryForPage:subject:pageTag:additionalValues:", 0, v5, v6, v7);

  -[PKAccountInvitationOnboardingViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
}

- (id)_listItemConfigWithTitle:(id)a3 body:(id)a4 image:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
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

  v7 = (void *)MEMORY[0x1E0DC39A8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "cellConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v11, "textProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

  objc_msgSend(v11, "setSecondaryText:", v9);
  objc_msgSend(v11, "secondaryTextProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v15);

  objc_msgSend(v11, "secondaryTextProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setColor:", v17);

  v18 = (void *)MEMORY[0x1E0DC3870];
  PKPassKitUIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageNamed:inBundle:withConfiguration:", v8, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setImage:", v20);
  objc_msgSend(v11, "imageProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setReservedLayoutSize:", 52.0, 53.0);

  objc_msgSend(v11, "setImageToTextPadding:", 20.0);
  return v11;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  PKAccountInvitationController *controller;
  _QWORD v5[5];

  -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  -[PKAccountInvitationOnboardingViewController _reportContinueTapped](self, "_reportContinueTapped");
  -[PKAccountInvitationController setFamilyMember:](self->_controller, "setFamilyMember:", 0);
  -[PKAccountInvitationController setAccessLevel:](self->_controller, "setAccessLevel:", 0);
  controller = self->_controller;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__PKAccountInvitationOnboardingViewController_explanationViewDidSelectContinue___block_invoke;
  v5[3] = &unk_1E3E62260;
  v5[4] = self;
  -[PKAccountInvitationController nextViewControllerWithCompletion:](controller, "nextViewControllerWithCompletion:", v5);
}

void __80__PKAccountInvitationOnboardingViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v7, "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__PKAccountInvitationOnboardingViewController_explanationViewDidSelectContinue___block_invoke_2;
    v9[3] = &unk_1E3E62288;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v9);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v7, "showNavigationBarSpinner:", 0);
  if (v6)
  {
    v8 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __80__PKAccountInvitationOnboardingViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNavigationBarSpinner:", 0);
}

- (void)_reportContinueTapped
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D68B18];
  v3 = *MEMORY[0x1E0D68858];
  v6[0] = *MEMORY[0x1E0D68AA0];
  v6[1] = v3;
  v4 = *MEMORY[0x1E0D68958];
  v7[0] = v2;
  v7[1] = v4;
  v6[2] = *MEMORY[0x1E0D68F50];
  v7[2] = *MEMORY[0x1E0D68610];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D698C8], v5);
  objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D698C0], v5);

}

- (void)_beginReportingIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D698C8];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D698C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    self->_didBeginOnboardingSubject = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v3);
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginOnboardingSubject)
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D698C8]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
