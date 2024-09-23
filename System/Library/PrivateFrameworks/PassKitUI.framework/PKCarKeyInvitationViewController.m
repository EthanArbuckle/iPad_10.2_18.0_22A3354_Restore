@implementation PKCarKeyInvitationViewController

- (PKCarKeyInvitationViewController)initWithContext:(int64_t)a3 invitation:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PKCarKeyInvitationViewController *v11;
  PKCarKeyInvitationViewController *v12;
  void *v13;

  v9 = a4;
  v10 = a5;
  v11 = -[PKPassShareRedemptionViewController init](self, "init");
  v12 = v11;
  if (v11)
  {
    v11->_setupContext = a3;
    objc_storeStrong((id *)&v11->_invitation, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    -[PKPassShareRedemptionViewController setAnalyticsEnabled:](v12, "setAnalyticsEnabled:", 1);
    -[PKPassShareRedemptionViewController analyticsReporter](v12, "analyticsReporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessPassType:", 4);

  }
  return v12;
}

- (void)viewDidLoad
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  void *v21;
  id v22;
  id v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PKCarKeyInvitationViewController;
  -[PKPassShareRedemptionViewController viewDidLoad](&v24, sel_viewDidLoad);
  -[PKCarKeyInvitationViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  -[PKPassShareRedemptionViewController cardHeaderView](self, "cardHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3870];
  PKPassKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("SubcredentialInvitation"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSharingCarKeyInvitation displayInformation](self->_invitation, "displayInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "showLoadingContent");
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __47__PKCarKeyInvitationViewController_viewDidLoad__block_invoke;
    v21 = &unk_1E3E631A0;
    v22 = v4;
    v23 = v7;
    PKCommonCachedImageFromURL(v9, &v18);

  }
  else
  {
    objc_msgSend(v4, "setCardImage:", v7);
  }
  -[PKCarKeyInvitationViewController _titleText](self, "_titleText", v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v10);

  -[PKCarKeyInvitationViewController _bodyText](self, "_bodyText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v11);

  PKLocalizedCredentialString(CFSTR("ADD_CAR_KEY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareRedemptionViewController setContinueButtonText:](self, "setContinueButtonText:", v12);

  PKLocalizedCredentialString(CFSTR("NOT_NOW"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareRedemptionViewController setContinueLaterText:](self, "setContinueLaterText:", v13);

  -[PKSharingCarKeyInvitation proprietaryData](self->_invitation, "proprietaryData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayableSharedEntitlements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareRedemptionViewController setDisplayableSharedEntitlements:](self, "setDisplayableSharedEntitlements:", v15);

  -[PKSharingCarKeyInvitation activationOptions](self->_invitation, "activationOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareRedemptionViewController setActivationOptions:](self, "setActivationOptions:", v16);

  objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setPrivacyLink:](self, "setPrivacyLink:", v17);
  -[PKPassShareRedemptionViewController showStartingUI](self, "showStartingUI");

}

uint64_t __47__PKCarKeyInvitationViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (!a3)
    a3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setCardImage:", a3);
  return objc_msgSend(*(id *)(a1 + 32), "hideLoadingContent");
}

- (void)resetState
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Reseting state of accept invitaiton view controller", v4, 2u);
  }

  -[PKPassShareRedemptionViewController showStartingUI](self, "showStartingUI");
}

- (id)_titleText
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (self->_isShareActivation)
  {
    PKLocalizedShareableCredentialString(CFSTR("SHARE_ACTIVATION_REENTRY_TITLE"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKSharingCarKeyInvitation vehicleIssuer](self->_invitation, "vehicleIssuer");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      PKLocalizedCredentialString(CFSTR("INVITATION_TITLE_CAR_MAKE"), CFSTR("%@"), v3);
    else
      PKLocalizedCredentialString(CFSTR("INVITATION_TITLE"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_bodyText
{
  void *v2;
  void *v3;
  unint64_t v4;
  __CFString *v5;

  if (self->_isShareActivation)
  {
    PKLocalizedShareableCredentialString(CFSTR("SHARE_ACTIVATION_REENTRY_SUBTITLE"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66AA0]), "initWithCrossPlatformInvitation:", self->_invitation);
    objc_msgSend(v3, "entitlement");
    v4 = PKAppletSubcredentialEntitlementTypeFromValue();
    if (v4 > 6)
      v5 = 0;
    else
      v5 = off_1E3E6F660[v4];
    PKLocalizedCredentialString(&v5->isa);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_localizedIssuerName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[PKSharingCarKeyInvitation vehicleIssuer](self->_invitation, "vehicleIssuer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedRegionFeatureOfType:didFailOSVersionRequirements:", 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedNameForIssuerWithIdentifier:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("GENERIC_PARTNER_NAME"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)continueButtonPressed
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCarKeyInvitationViewController;
  -[PKPassShareRedemptionViewController continueButtonPressed](&v4, sel_continueButtonPressed);
  -[PKPassShareRedemptionViewController showLoadingUI](self, "showLoadingUI");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "carKeyInvitationViewControllerDidRequestStart:", self);

}

- (void)continueLaterButtonPressed
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCarKeyInvitationViewController;
  -[PKPassShareRedemptionViewController continueLaterButtonPressed](&v4, sel_continueLaterButtonPressed);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "carKeyInvitationViewControllerDidCancel:", self);

}

- (void)activationCodeDidChangeToCode:(id)a3
{
  PKCarKeyInvitationViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "carKeyInvitationViewController:didEnterActivationCode:", self, v5);

}

- (void)showWithProvisioningError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if ((objc_msgSend(v4, "hasLocalizedTitleAndMessage") & 1) == 0)
  {
    PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocalizedTitle:", v5);

    -[PKCarKeyInvitationViewController _localizedIssuerName](self, "_localizedIssuerName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCredentialString(CFSTR("CARKEY_FAILED_ADDING_KEY"), CFSTR("%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocalizedMessage:", v7);

  }
  v8 = (void *)MEMORY[0x1E0DC3450];
  v11[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__PKCarKeyInvitationViewController_showWithProvisioningError___block_invoke_2;
  v12[3] = &unk_1E3E61388;
  v12[4] = self;
  v13 = v4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PKCarKeyInvitationViewController_showWithProvisioningError___block_invoke_3;
  v11[3] = &unk_1E3E612E8;
  v9 = v4;
  objc_msgSend(v8, "alertForErrorWithError:acknowledgeButtonText:exitButtonText:onAcknowledge:onExit:onTryAgain:", v9, 0, 0, &__block_literal_global_121, v12, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCarKeyInvitationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

void __62__PKCarKeyInvitationViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "analyticsReporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "underlyingError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v4 = *(void **)(a1 + 40);
  v7 = *MEMORY[0x1E0D697F0];
  v8[0] = *MEMORY[0x1E0D68BE0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEventForPage:error:specifics:", 2, v4, v5);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1368));
  objc_msgSend(WeakRetained, "carKeyInvitationViewControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

uint64_t __62__PKCarKeyInvitationViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueButtonPressed");
}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  if (a4)
  {
    -[PKPassShareRedemptionViewController showLoadingUI](self, "showLoadingUI", a3);
  }
  else if (a3 == 8)
  {
    -[PKPassShareRedemptionViewController showSuccessUI](self, "showSuccessUI");
  }
  else
  {
    -[PKPassShareRedemptionViewController showStartingUI](self, "showStartingUI");
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end
