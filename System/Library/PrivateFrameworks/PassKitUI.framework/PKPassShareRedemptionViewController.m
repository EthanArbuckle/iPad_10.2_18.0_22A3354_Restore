@implementation PKPassShareRedemptionViewController

- (PKPassShareRedemptionViewController)init
{
  PKPassShareRedemptionViewController *v2;
  PKPassShareRedemptionViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassShareRedemptionViewController;
  v2 = -[PKPaymentSetupOptionsViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v2, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPaymentSetupOptionsViewController setShouldCollapseHeaderOnKeyboardShow:](v3, "setShouldCollapseHeaderOnKeyboardShow:", 0);
  }
  return v3;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassShareRedemptionViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKPassShareRedemptionViewController _reloadSections](self, "_reloadSections");
  -[PKPassShareRedemptionViewController _updateContinueButtonState](self, "_updateContinueButtonState");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *referralSource;
  void *v8;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKPassShareRedemptionViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[PKPassShareRedemptionViewController analyticsReporter](self, "analyticsReporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x1E0D694D8];
  PKAnalyticsReportSwitchToggleResultValue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v10[1] = *MEMORY[0x1E0D69528];
  referralSource = self->_referralSource;
  if (!referralSource)
    referralSource = (NSString *)*MEMORY[0x1E0D69530];
  v11[0] = v5;
  v11[1] = referralSource;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEventForPage:specifics:", 0, v8);

}

- (void)_reloadSections
{
  void *v3;
  _BOOL8 v4;
  id v5;

  -[PKPassShareRedemptionViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = self->_activationCodeSectionController != 0;
    -[PKPassShareSectionController setUseCompactInsets:](self->_sharePreviewSectionController, "setUseCompactInsets:", v4);
    -[PKPassShareSectionController setUseCompactInsets:](self->_activationCodeSectionController, "setUseCompactInsets:", v4);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "safelyAddObject:", self->_activationCodeSectionController);
    objc_msgSend(v5, "safelyAddObject:", self->_sharePreviewSectionController);
    -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v5, 1);
    -[PKPassShareRedemptionViewController _configureHeaderSize](self, "_configureHeaderSize");

  }
}

- (PKPassShareActivationOptions)activationOptions
{
  return -[PKPassShareRedemptionActivationCodeSectionController activationOptions](self->_activationCodeSectionController, "activationOptions");
}

- (void)setActivationOptions:(id)a3
{
  id v4;
  PKPassShareRedemptionActivationCodeSectionController *activationCodeSectionController;
  PKPassShareRedemptionActivationCodeSectionController *v6;
  PKPassShareRedemptionActivationCodeSectionController *v7;
  PKPassShareRedemptionActivationCodeSectionController *v8;
  id v9;

  v4 = a3;
  activationCodeSectionController = self->_activationCodeSectionController;
  v9 = v4;
  if (!activationCodeSectionController)
  {
    v6 = -[PKPassShareRedemptionActivationCodeSectionController initWithMode:delegate:]([PKPassShareRedemptionActivationCodeSectionController alloc], "initWithMode:delegate:", 1, self);
    v7 = self->_activationCodeSectionController;
    self->_activationCodeSectionController = v6;

    v4 = v9;
    activationCodeSectionController = self->_activationCodeSectionController;
  }
  -[PKPassShareRedemptionActivationCodeSectionController setActivationOptions:](activationCodeSectionController, "setActivationOptions:", v4);
  -[PKPassShareRedemptionViewController activationCodeDidChange](self, "activationCodeDidChange");
  if (!-[PKPassShareRedemptionActivationCodeSectionController requiresActivationCode](self->_activationCodeSectionController, "requiresActivationCode"))
  {
    v8 = self->_activationCodeSectionController;
    self->_activationCodeSectionController = 0;

  }
  -[PKPassShareRedemptionViewController _reloadSections](self, "_reloadSections");

}

- (void)setDisplayableSharedEntitlements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D66D10], "localizedEntitlementsFromDisplayableEntitlements:pass:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareRedemptionViewController _setDisplayableSharedEntitlements:](self, "_setDisplayableSharedEntitlements:", v5);
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D66D10];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__PKPassShareRedemptionViewController_setDisplayableSharedEntitlements___block_invoke;
    v7[3] = &unk_1E3E61BE0;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "localizedEntitlementsFromDisplayableEntitlements:pass:useCachedTemplates:completion:", v4, 0, 0, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
  else
  {
    -[PKPassShareRedemptionViewController _setDisplayableSharedEntitlements:](self, "_setDisplayableSharedEntitlements:", 0);
  }

}

void __72__PKPassShareRedemptionViewController_setDisplayableSharedEntitlements___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__PKPassShareRedemptionViewController_setDisplayableSharedEntitlements___block_invoke_2;
    v6[3] = &unk_1E3E61388;
    v6[4] = WeakRetained;
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __72__PKPassShareRedemptionViewController_setDisplayableSharedEntitlements___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDisplayableSharedEntitlements:", *(_QWORD *)(a1 + 40));
}

- (void)_setDisplayableSharedEntitlements:(id)a3
{
  void *v5;
  PKPassEntitlementsComposer *v6;
  PKPassEntitlementsComposer *entitlementComposer;
  PKSharePreviewOverviewSectionController *v8;
  PKSharePreviewOverviewSectionController *sharePreviewSectionController;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_displayableSharedEntitlements, a3);
  if (!v10)
  {
    v5 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v10, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
LABEL_5:
    sharePreviewSectionController = self->_sharePreviewSectionController;
    self->_sharePreviewSectionController = 0;
    goto LABEL_6;
  }
  v6 = (PKPassEntitlementsComposer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66EE8]), "initWithSharedEntitlements:availableEntitlements:editable:", v5, v10, 0);
  entitlementComposer = self->_entitlementComposer;
  self->_entitlementComposer = v6;

  v8 = -[PKSharePreviewOverviewSectionController initWithMode:entitlementComposer:delegate:]([PKSharePreviewOverviewSectionController alloc], "initWithMode:entitlementComposer:delegate:", 1, self->_entitlementComposer, self);
  sharePreviewSectionController = self->_sharePreviewSectionController;
  self->_sharePreviewSectionController = v8;
LABEL_6:

  -[PKPassShareRedemptionViewController _reloadSections](self, "_reloadSections");
}

uint64_t __73__PKPassShareRedemptionViewController__setDisplayableSharedEntitlements___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharedEntitlement");
}

- (PKShareRedemptionAnalyticsReporter)analyticsReporter
{
  PKShareRedemptionAnalyticsReporter *analyticsReporter;
  PKShareRedemptionAnalyticsReporter *v4;
  PKShareRedemptionAnalyticsReporter *v5;

  analyticsReporter = self->_analyticsReporter;
  if (!analyticsReporter)
  {
    if (self->_analyticsEnabled)
    {
      v4 = objc_alloc_init(PKShareRedemptionAnalyticsReporter);
      v5 = self->_analyticsReporter;
      self->_analyticsReporter = v4;

      analyticsReporter = self->_analyticsReporter;
    }
    else
    {
      analyticsReporter = 0;
    }
  }
  return analyticsReporter;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  PKHeroCardExplanationHeaderView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *continueButtonText;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPassShareRedemptionViewController;
  -[PKDynamicCollectionViewController loadView](&v15, sel_loadView);
  -[PKPassShareRedemptionViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonPressed);
  objc_msgSend(v3, "setLeftBarButtonItem:", v4);

  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleAccessoriesEnabled:", 1);
  v6 = -[PKHeroCardExplanationHeaderView initWithImage:]([PKHeroCardExplanationHeaderView alloc], "initWithImage:", 0);
  -[PKHeroCardExplanationHeaderView setPadding:](v6, "setPadding:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHeroCardExplanationHeaderView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[PKPassShareRedemptionViewController _configureHeaderSize](self, "_configureHeaderSize");
  objc_msgSend(v5, "setTopArtView:", v6);
  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "footerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (self->_continueLaterText)
  {
    objc_msgSend(v9, "setupLaterButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:forState:", self->_continueLaterText, 0);
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_continueLaterButtonPressed, 0x2000);

  }
  else
  {
    objc_msgSend(v9, "setSetupLaterButton:", 0);
  }
  objc_msgSend(v10, "setManualEntryButton:", 0);
  objc_msgSend(v8, "primaryButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", 1);
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_continueButtonPressed, 0x2000);
  continueButtonText = self->_continueButtonText;
  if (continueButtonText)
  {
    objc_msgSend(v12, "setTitle:forState:", continueButtonText, 0);
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("CONTINUE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:forState:", v14, 0);

  }
  objc_msgSend(v8, "setButtonsEnabled:", 1);

}

- (void)_configureHeaderSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[PKPassShareRedemptionViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_activationCodeSectionController || self->_sharePreviewSectionController)
    {
      -[PKPassShareRedemptionViewController cardHeaderView](self, "cardHeaderView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v4;
      v5 = 2;
    }
    else
    {
      -[PKPassShareRedemptionViewController cardHeaderView](self, "cardHeaderView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v4;
      v5 = 4;
    }
    objc_msgSend(v4, "setSize:", v5);

  }
}

- (void)continueButtonPressed
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (-[PKPassShareRedemptionActivationCodeSectionController requiresActivationCode](self->_activationCodeSectionController, "requiresActivationCode"))
  {
    v4 = *MEMORY[0x1E0D694D0];
    v5[0] = *MEMORY[0x1E0D695B0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[PKShareRedemptionAnalyticsReporter sendEventForPage:button:specifics:](self->_analyticsReporter, "sendEventForPage:button:specifics:", 0, 2, v3);

}

- (void)cancelButtonPressed
{
  -[PKShareRedemptionAnalyticsReporter sendEventForPage:button:specifics:](self->_analyticsReporter, "sendEventForPage:button:specifics:", 0, 1, 0);
}

- (void)continueLaterButtonPressed
{
  -[PKShareRedemptionAnalyticsReporter sendEventForPage:button:specifics:](self->_analyticsReporter, "sendEventForPage:button:specifics:", 0, 1, 0);
}

- (void)setHeaderImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPassShareRedemptionViewController cardHeaderView](self, "cardHeaderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCardImage:", v4);

}

- (void)setContinueButtonText:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_continueButtonText, a3);
  -[PKPassShareRedemptionViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v8, 0);

  }
}

- (void)setContinueLaterText:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_continueLaterText, a3);
  -[PKPassShareRedemptionViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "footerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "setForceShowSetupLaterButton:", 1);
      objc_msgSend(v7, "setupLaterButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:forState:", v11, 0);
      objc_msgSend(v8, "allTargets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (!v10)
        objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_continueLaterButtonPressed, 0x2000);

    }
    else
    {
      objc_msgSend(v7, "setSetupLaterButton:", 0);
    }

  }
}

- (PKHeroCardExplanationHeaderView)cardHeaderView
{
  void *v2;
  void *v3;

  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topArtView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKHeroCardExplanationHeaderView *)v3;
}

- (void)showStartingUI
{
  id v3;

  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);
  -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](self, "setShowHeaderSpinner:", 0);
  if (self->_privacyLinkController)
    -[PKPaymentSetupOptionsViewController setPrivacyLink:](self, "setPrivacyLink:");
  -[PKPassShareRedemptionViewController _updateContinueButtonState](self, "_updateContinueButtonState");
  -[PKPassShareRedemptionViewController updateUserInteractionEnabled:](self, "updateUserInteractionEnabled:", 1);

}

- (void)showLoadingUI
{
  OBPrivacyLinkController *v3;
  OBPrivacyLinkController *privacyLinkController;
  id v5;

  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);
  -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](self, "setShowHeaderSpinner:", 1);
  -[PKPaymentSetupOptionsViewController privacyLink](self, "privacyLink");
  v3 = (OBPrivacyLinkController *)objc_claimAutoreleasedReturnValue();
  privacyLinkController = self->_privacyLinkController;
  self->_privacyLinkController = v3;

  -[PKPaymentSetupOptionsViewController setPrivacyLink:](self, "setPrivacyLink:", 0);
  -[PKPassShareRedemptionViewController updateUserInteractionEnabled:](self, "updateUserInteractionEnabled:", 0);

}

- (void)showSuccessUI
{
  void *v3;
  id v4;

  -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](self, "setShowHeaderSpinner:", 0);
  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowCheckmark:", 1);

  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);
  -[PKPassShareRedemptionViewController updateUserInteractionEnabled:](self, "updateUserInteractionEnabled:", 1);

}

- (void)showFailureUI
{
  -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](self, "setShowHeaderSpinner:", 0);
  -[PKPassShareRedemptionViewController updateUserInteractionEnabled:](self, "updateUserInteractionEnabled:", 1);
}

- (void)updateUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (void)_updateContinueButtonState
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  -[PKPassShareRedemptionViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (-[PKPassShareRedemptionActivationCodeSectionController requiresActivationCode](self->_activationCodeSectionController, "requiresActivationCode"))
    {
      -[PKPassShareRedemptionActivationCodeSectionController enteredActivationCode](self->_activationCodeSectionController, "enteredActivationCode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length") != 0;

    }
    else
    {
      v5 = 1;
    }
    objc_msgSend(v7, "primaryButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v5);

  }
}

- (void)activationCodeDidChange
{
  PKPassShareRedemptionActivationCodeSectionController *activationCodeSectionController;
  id v4;

  -[PKPassShareRedemptionViewController _updateContinueButtonState](self, "_updateContinueButtonState");
  activationCodeSectionController = self->_activationCodeSectionController;
  if (activationCodeSectionController)
  {
    -[PKPassShareRedemptionActivationCodeSectionController enteredActivationCode](activationCodeSectionController, "enteredActivationCode");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPassShareRedemptionViewController activationCodeDidChangeToCode:](self, "activationCodeDidChangeToCode:", v4);

  }
}

- (void)sharePreviewSectionControllerDidSelectEntitlements:(id)a3
{
  void *v4;
  PKPassShareEntitlementSelectionViewController *v5;

  v5 = -[PKPassShareEntitlementSelectionViewController initWithMode:entitlementComposer:]([PKPassShareEntitlementSelectionViewController alloc], "initWithMode:entitlementComposer:", 1, self->_entitlementComposer);
  -[PKPassShareRedemptionViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (BOOL)analyticsEnabled
{
  return self->_analyticsEnabled;
}

- (void)setAnalyticsEnabled:(BOOL)a3
{
  self->_analyticsEnabled = a3;
}

- (NSString)referralSource
{
  return self->_referralSource;
}

- (void)setReferralSource:(id)a3
{
  objc_storeStrong((id *)&self->_referralSource, a3);
}

- (NSArray)displayableSharedEntitlements
{
  return self->_displayableSharedEntitlements;
}

- (NSString)continueButtonText
{
  return self->_continueButtonText;
}

- (NSString)continueLaterText
{
  return self->_continueLaterText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueLaterText, 0);
  objc_storeStrong((id *)&self->_continueButtonText, 0);
  objc_storeStrong((id *)&self->_displayableSharedEntitlements, 0);
  objc_storeStrong((id *)&self->_referralSource, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
  objc_storeStrong((id *)&self->_sharePreviewSectionController, 0);
  objc_storeStrong((id *)&self->_activationCodeSectionController, 0);
}

@end
