@implementation PKPasscodeUpgradeExplanationViewController

- (PKPasscodeUpgradeExplanationViewController)initWithPasscodeUpgradeFlowController:(id)a3 isForWatch:(BOOL)a4
{
  id v6;
  uint64_t v7;
  PKPasscodeUpgradeExplanationViewController *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = objc_msgSend(v6, "context");
  v11.receiver = self;
  v11.super_class = (Class)PKPasscodeUpgradeExplanationViewController;
  v8 = -[PKExplanationViewController initWithContext:](&v11, sel_initWithContext_, v7);
  if (v8)
  {
    objc_msgSend(v6, "setupDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_setupDelegate, v9);

    v8->_context = v7;
    v8->_isForWatch = a4;
    objc_storeWeak((id *)&v8->_flowController, v6);
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  NSString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t context;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PKPasscodeUpgradeExplanationViewController;
  -[PKExplanationViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D6BB78]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PASSCODE_UPGRADE_REQUIRED_TITLE"), CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v5);

  objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", v4, 5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (self->_upgradeRequiredToAddNewPass)
    v7 = CFSTR("PASSCODE_UPGRADE_REQUIRED_TO_ADD_CARD_BODY");
  else
    v7 = CFSTR("PASSCODE_UPGRADE_REQUIRED_BODY");
  PKDeviceSpecificLocalizedStringKeyForKey(v7, self->_isForWatch);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v6;
  PKLocalizedPaymentString(v8, CFSTR("%@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v9);

  PKPassKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKPaymentSetupContextIsBridge())
    v11 = CFSTR("PasscodeLock_Watch");
  else
    v11 = CFSTR("PasscodeLock");
  objc_msgSend(v10, "URLForResource:withExtension:", v11, CFSTR("pdf"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = PKUIScreenScale();
  PKUIImageFromPDF(v12, 80.0, 80.0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v14);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "statusBarFrame");
  v20 = -(v19 - v17 * 0.09);

  objc_msgSend(v3, "setTopMargin:", v20);
  objc_msgSend(v3, "dockView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "footerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_upgradeRequiredToAddNewPass)
    objc_msgSend(v3, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v22, "setupLaterButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("SET_UP_LATER_BUTTON_TITLE"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTitle:forState:", v24, 0);

  objc_msgSend(v22, "setManualEntryButton:", 0);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  -[PKPasscodeUpgradeExplanationViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E00]);

  context = self->_context;
  -[PKPasscodeUpgradeExplanationViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentSetupApplyContextAppearance(context, v27);

}

- (void)viewWillAppear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPasscodeUpgradeExplanationViewController;
  -[PKPasscodeUpgradeExplanationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (!self->_viewHasAppeared)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    objc_msgSend(WeakRetained, "beginShowingViewController");

    self->_viewHasAppeared = 1;
    if (self->_isForWatch)
      -[PKPasscodeUpgradeExplanationViewController _showSpinner:](self, "_showSpinner:", 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPasscodeUpgradeExplanationViewController;
  -[PKPasscodeUpgradeExplanationViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyUserHasSeenComplianceMessageWithLastLockDate:", v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPasscodeUpgradeExplanationViewController;
  -[PKPasscodeUpgradeExplanationViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (self->_viewHasAppeared)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    objc_msgSend(WeakRetained, "endedShowingViewController");

    self->_viewHasAppeared = 0;
  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  void (**setupLaterHandler)(void);

  setupLaterHandler = (void (**)(void))self->_setupLaterHandler;
  if (setupLaterHandler)
    setupLaterHandler[2]();
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  void (**continuationHandler)(void);
  id v5;

  v5 = a3;
  continuationHandler = (void (**)(void))self->_continuationHandler;
  if (continuationHandler)
  {
    continuationHandler[2]();
    if (self->_isForWatch)
      -[PKPasscodeUpgradeExplanationViewController _showSpinner:](self, "_showSpinner:", 1);
  }

}

- (unint64_t)paymentSetupMarker
{
  return 5;
}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowSpinner:", v3);
  v6 = v3 ^ 1;
  objc_msgSend(v5, "setEnabled:", v6);
  objc_msgSend(v4, "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupLaterButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v6);

}

- (id)continuationHandler
{
  return self->_continuationHandler;
}

- (void)setContinuationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (id)setupLaterHandler
{
  return self->_setupLaterHandler;
}

- (void)setSetupLaterHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (BOOL)upgradeRequiredToAddNewPass
{
  return self->_upgradeRequiredToAddNewPass;
}

- (void)setUpgradeRequiredToAddNewPass:(BOOL)a3
{
  self->_upgradeRequiredToAddNewPass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setupLaterHandler, 0);
  objc_storeStrong(&self->_continuationHandler, 0);
  objc_destroyWeak((id *)&self->_flowController);
  objc_destroyWeak((id *)&self->_setupDelegate);
}

@end
