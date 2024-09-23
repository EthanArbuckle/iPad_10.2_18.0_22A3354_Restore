@implementation PKPushableExternalOfferCredentialProvisioningViewController

- (PKPushableExternalOfferCredentialProvisioningViewController)initWithContext:(int64_t)a3 credential:(id)a4 reporter:(id)a5
{
  id v9;
  id v10;
  PKPushableExternalOfferCredentialProvisioningViewController *v11;
  PKPushableExternalOfferCredentialProvisioningViewController *v12;
  unint64_t v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  v11 = -[PKPassShareRedemptionViewController init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_context = a3;
    objc_storeStrong((id *)&v11->_credential, a4);
    objc_storeStrong((id *)&v12->_reporter, a5);
    v12->_isRunningInForeground = 1;
    v12->_autoProvision = 1;
    v13 = -[PKPaymentExternalOfferCredential cardType](v12->_credential, "cardType");
    if (v13 <= 4)
      a5 = **((id **)&unk_1E3E66CB8 + v13);
    -[PKProvisioningAnalyticsSessionUIReporter setProductType:subtype:](v12->_reporter, "setProductType:subtype:", a5, 0);

  }
  return v12;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController viewDidLoad](&v3, sel_viewDidLoad);
  if (self->_autoProvision)
    -[PKPushableExternalOfferCredentialProvisioningViewController showLoadingUI](self, "showLoadingUI");
  else
    -[PKPushableExternalOfferCredentialProvisioningViewController showStartingUI](self, "showStartingUI");
  -[PKPushableExternalOfferCredentialProvisioningViewController _loadPassThumbnail](self, "_loadPassThumbnail");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  -[PKPaymentSetupOptionsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
  if (self->_autoProvision)
  {
    self->_autoProvision = 0;
    -[PKPushableExternalOfferCredentialProvisioningViewController continueButtonPressed](self, "continueButtonPressed");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  -[PKPushableExternalOfferCredentialProvisioningViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (-[PKPushableExternalOfferCredentialProvisioningViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))-[PKProvisioningAnalyticsSessionUIReporter resetProductTypes](self->_reporter, "resetProductTypes");
}

- (void)cancelButtonPressed
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController cancelButtonPressed](&v4, sel_cancelButtonPressed);
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 2);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPushableExternalOfferCredentialProvisioningViewController _terminateSetupFlowWithPasses:error:](self, "_terminateSetupFlowWithPasses:error:", 0, v3);

}

- (void)continueButtonPressed
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController continueButtonPressed](&v3, sel_continueButtonPressed);
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  -[PKPushableExternalOfferCredentialProvisioningViewController _startProvisioning](self, "_startProvisioning");
}

- (void)_startProvisioning
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  uint8_t v6[16];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Pushable Identity Credential VC - starting provisioning", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v7[0] = self->_credential;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "startProvisioningWithCredentials:", v5);

}

- (void)_loadPassThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  -[PKPassShareRedemptionViewController cardHeaderView](self, "cardHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showLoadingContent");
  -[PKPaymentExternalOfferCredential passThumbnailImageURL](self->_credential, "passThumbnailImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKUIImageNamed(CFSTR("PlaceholderCardArt_Large"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __81__PKPushableExternalOfferCredentialProvisioningViewController__loadPassThumbnail__block_invoke;
    v6[3] = &unk_1E3E66C78;
    objc_copyWeak(&v8, &location);
    v7 = v5;
    PKCommonCachedImageFromURL(v4, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKPushableExternalOfferCredentialProvisioningViewController setPassThumbnailImage:](self, "setPassThumbnailImage:", v5);
  }

}

void __81__PKPushableExternalOfferCredentialProvisioningViewController__loadPassThumbnail__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  id v7;
  id v8;

  v4 = (id *)(a1 + 40);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  v7 = v5;
  if (!v5)
    v7 = *(id *)(a1 + 32);
  v8 = WeakRetained;
  objc_msgSend(WeakRetained, "setPassThumbnailImage:", v7);

}

- (void)setPassThumbnailImage:(id)a3
{
  UIImage **p_passThumbnailImage;
  id v6;
  id v7;

  p_passThumbnailImage = &self->_passThumbnailImage;
  objc_storeStrong((id *)&self->_passThumbnailImage, a3);
  v6 = a3;
  -[PKPassShareRedemptionViewController cardHeaderView](self, "cardHeaderView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCardImage:", *p_passThumbnailImage);

  objc_msgSend(v7, "hideLoadingContent");
}

- (void)showStartingUI
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController showStartingUI](&v5, sel_showStartingUI);
  -[PKPushableExternalOfferCredentialProvisioningViewController _setTitleAndBodyText](self, "_setTitleAndBodyText");
  -[PKPushableExternalOfferCredentialProvisioningViewController _setContinueButtonText](self, "_setContinueButtonText");
  -[PKPushableExternalOfferCredentialProvisioningViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

}

- (void)_setTitleAndBodyText
{
  id v3;

  PKLocalizedPaymentOffersString(CFSTR("PROVISION_PASS_TITLE"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v3);

}

- (void)_setContinueButtonText
{
  id v3;

  PKLocalizedIdentityString(CFSTR("ADD_PUSHABLE_IDENTITY_PASS_CONTINUE_TITLE"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassShareRedemptionViewController setContinueButtonText:](self, "setContinueButtonText:", v3);

}

- (void)_showExitingLostModeUI
{
  id v3;

  -[PKPushableExternalOfferCredentialProvisioningViewController showLoadingUI](self, "showLoadingUI");
  PKLocalizedShareableCredentialString(CFSTR("EXITING_LOST_MODE_SHAREABLE_CREDENTIAL_PASS"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v3);

}

- (void)showLoadingUI
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPushableExternalOfferCredentialProvisioningViewController;
  -[PKPassShareRedemptionViewController showLoadingUI](&v6, sel_showLoadingUI);
  PKLocalizedPaymentOffersString(CFSTR("PROVISION_ADDING_PASS_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v3);

  -[PKPushableExternalOfferCredentialProvisioningViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

}

- (void)showSuccessUI
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D66A58];
  v4 = *MEMORY[0x1E0D698F8];
  v8 = *MEMORY[0x1E0D68AA0];
  v9[0] = *MEMORY[0x1E0D68BE8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subject:sendEvent:", v4, v5);

  -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](self, "setShowHeaderSpinner:", 0);
  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowCheckmark:", 1);

  PKLocalizedPaymentOffersString(CFSTR("PROVISION_CARD_ADDED_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v7);

}

- (void)showWithProvisioningError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = a3;
  v5 = v4;
  if ((objc_msgSend(v4, "hasLocalizedTitleAndMessage") & 1) == 0)
  {
    objc_msgSend(v4, "underlyingError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPushableExternalOfferCredentialProvisioningViewController _provisioningErrorWithNumberOfPassesFailed:error:](self, "_provisioningErrorWithNumberOfPassesFailed:error:", 1, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89__PKPushableExternalOfferCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2;
  v9[3] = &unk_1E3E612E8;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__PKPushableExternalOfferCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3;
  v8[3] = &unk_1E3E612E8;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertForErrorWithError:acknowledgeButtonText:exitButtonText:onAcknowledge:onExit:onTryAgain:", v4, 0, 0, &__block_literal_global_50, v9, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPushableExternalOfferCredentialProvisioningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

void __89__PKPushableExternalOfferCredentialProvisioningViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D66A58];
  v3 = *MEMORY[0x1E0D698F8];
  v6 = *MEMORY[0x1E0D68AA0];
  v7[0] = *MEMORY[0x1E0D68BE0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subject:sendEvent:", v3, v4);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1400));
  objc_msgSend(WeakRetained, "cancel");

}

uint64_t __89__PKPushableExternalOfferCredentialProvisioningViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueButtonPressed");
}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  if (a4)
  {
    if (a3 == 1)
    {
      -[PKPushableExternalOfferCredentialProvisioningViewController _showExitingLostModeUI](self, "_showExitingLostModeUI");
      return;
    }
LABEL_7:
    -[PKPushableExternalOfferCredentialProvisioningViewController showLoadingUI](self, "showLoadingUI");
    return;
  }
  if (a3 == 8)
  {
    -[PKPushableExternalOfferCredentialProvisioningViewController showSuccessUI](self, "showSuccessUI");
    return;
  }
  if (self->_autoProvision)
    goto LABEL_7;
  -[PKPushableExternalOfferCredentialProvisioningViewController showStartingUI](self, "showStartingUI");
}

- (void)_terminateSetupFlowWithPasses:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  uint64_t *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v17 = objc_msgSend(v6, "count");
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Pushable External Offer Credential VC - Terminating setup flow with passes: %lu error: %@", buf, 0x16u);
  }

  -[PKPassShareRedemptionViewController analyticsReporter](self, "analyticsReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v10 = 1;
  else
    v10 = v6 == 0;
  v14 = *MEMORY[0x1E0D697F0];
  if (v10)
    v11 = (uint64_t *)MEMORY[0x1E0D68BE0];
  else
    v11 = (uint64_t *)MEMORY[0x1E0D68BE8];
  v15 = *v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendEventForPage:error:specifics:", 2, v7, v12, v14);

  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "pushableViewController:didFailWithError:", self, v7);

}

- (int64_t)_accessPassType
{
  return 0;
}

- (id)_provisioningErrorWithNumberOfPassesFailed:(int64_t)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v16;

  v6 = a4;
  v16 = 1;
  v7 = -[PKPushableExternalOfferCredentialProvisioningViewController _accessPassType](self, "_accessPassType");
  PKAddSEPassDisplayableError(v6, a3, v7, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    PKAddSEPassGenericDisplayableError(a3, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  if (v16)
    v12 = 5;
  else
    v12 = 4;
  if (v11)
    v13 = v11;
  else
    v13 = v6;
  objc_msgSend(MEMORY[0x1E0D67548], "errorWithUnderlyingError:defaultSeverity:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  -[PKPushableExternalOfferCredentialProvisioningViewController _terminateSetupFlowWithPasses:error:](self, "_terminateSetupFlowWithPasses:error:", 0, 0);
}

- (PKPushableCredentialProvisioningViewControllerCoordinator)coordinator
{
  return (PKPushableCredentialProvisioningViewControllerCoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (BOOL)isRunningInForeground
{
  return self->_isRunningInForeground;
}

- (void)setIsRunningInForeground:(BOOL)a3
{
  self->_isRunningInForeground = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_passThumbnailImage, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
