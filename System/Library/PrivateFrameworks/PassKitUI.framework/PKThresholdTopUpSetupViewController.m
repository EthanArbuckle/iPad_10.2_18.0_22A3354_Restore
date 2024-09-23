@implementation PKThresholdTopUpSetupViewController

- (PKThresholdTopUpSetupViewController)initWithAmountSuggestions:(id)a3 selectedAmount:(id)a4 thresholdSuggestions:(id)a5 selectedThreshold:(id)a6 currencyCode:(id)a7 paymentMethodName:(id)a8 paymentMethodIdentifier:(id)a9 mode:(int64_t)a10 viewStyle:(int64_t)a11 delegate:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  PKThresholdTopUpSetupViewController *v26;
  PKThresholdTopUpSelectionSectionController *v27;
  PKThresholdTopUpSelectionSectionController *sectionController;
  PKThresholdTopUpActionsSectionController *v29;
  PKThresholdTopUpActionsSectionController *actionController;
  PKDashboardMessageSectionController *v31;
  id v32;
  uint64_t v33;
  PKDashboardMessageSectionController *messageSectionController;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  id obj;
  id v52;
  objc_super v53;
  _QWORD v54[4];

  v54[2] = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  obj = a8;
  v23 = a8;
  v24 = a9;
  v25 = a12;
  v53.receiver = self;
  v53.super_class = (Class)PKThresholdTopUpSetupViewController;
  v26 = -[PKPaymentSetupOptionsViewController init](&v53, sel_init);
  if (v26)
  {
    v52 = v25;
    v48 = v24;
    v49 = v20;
    v50 = v19;
    v27 = -[PKThresholdTopUpSelectionSectionController initWithAmountSuggestions:selectedAmount:thresholdSuggestions:selectedThreshold:currencyCode:paymentMethodName:paymentMethodIdentifier:viewStyle:delegate:]([PKThresholdTopUpSelectionSectionController alloc], "initWithAmountSuggestions:selectedAmount:thresholdSuggestions:selectedThreshold:currencyCode:paymentMethodName:paymentMethodIdentifier:viewStyle:delegate:", v18, v19, v20, v21, v22, v23, v24, a11, v26);
    sectionController = v26->_sectionController;
    v26->_sectionController = v27;

    v29 = -[PKThresholdTopUpActionsSectionController initWithExistingThresholdTopUp:delegate:]([PKThresholdTopUpActionsSectionController alloc], "initWithExistingThresholdTopUp:delegate:", a10 == 1, v26);
    actionController = v26->_actionController;
    v26->_actionController = v29;

    v31 = [PKDashboardMessageSectionController alloc];
    v32 = objc_alloc_init(MEMORY[0x1E0C99E40]);
    v33 = -[PKDashboardMessageSectionController initWithMessages:delegate:](v31, "initWithMessages:delegate:", v32, v26);
    messageSectionController = v26->_messageSectionController;
    v26->_messageSectionController = (PKDashboardMessageSectionController *)v33;

    objc_storeStrong((id *)&v26->_paymentMethodName, obj);
    objc_storeStrong((id *)&v26->_paymentMethodIdentifier, a9);
    objc_storeWeak((id *)&v26->_delegate, v25);
    v26->_viewStyle = a11;
    v26->_mode = a10;
    switch(a10)
    {
      case 1:
        -[PKPaymentSetupOptionsViewController setHeaderMode:](v26, "setHeaderMode:", 1);
        -[PKThresholdTopUpSetupViewController _setupDefaultNavigationItem](v26, "_setupDefaultNavigationItem");
        -[PKThresholdTopUpSelectionSectionController setEditing:](v26->_sectionController, "setEditing:", 0);
        break;
      case 2:
        -[PKPaymentSetupOptionsViewController dockView](v26, "dockView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "primaryButton");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedPaymentString(CFSTR("THRESHOLD_TURN_ON"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setTitle:forState:", v37, 0);

        objc_msgSend(v36, "addTarget:action:forControlEvents:", v26, sel__continuousButtonPressed_, 64);
        -[PKPaymentSetupOptionsViewController dockView](v26, "dockView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "footerView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "skipCardButton");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedPaymentString(CFSTR("THRESHOLD_SKIP"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setTitle:forState:", v41, 0);

        objc_msgSend(v40, "addTarget:action:forControlEvents:", v26, sel__skipButtonPressed_, 64);
        -[PKThresholdTopUpSetupViewController navigationItem](v26, "navigationItem");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setHidesBackButton:", 1);

        -[PKPaymentSetupOptionsViewController dockView](v26, "dockView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "footerView");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setManualEntryButton:", 0);

        break;
      case 0:
        -[PKThresholdTopUpSetupViewController _setupCreateNavigationItem](v26, "_setupCreateNavigationItem");
        break;
    }
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v26, "setUseItemIdentityWhenUpdating:", 1);
    v54[0] = v26->_sectionController;
    v54[1] = v26->_actionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](v26, "setSections:animated:", v45, 0);

    -[PKThresholdTopUpSetupViewController navigationItem](v26, "navigationItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v46, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

    v20 = v49;
    v19 = v50;
    v24 = v48;
    v25 = v52;
  }

  return v26;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKThresholdTopUpSetupViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v6, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PKPaymentSetupOptionsViewController setHeaderBackgroundColor:](self, "setHeaderBackgroundColor:", v3);
  -[PKThresholdTopUpSetupViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678D8]);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKThresholdTopUpSetupViewController;
  -[PKPaymentSetupOptionsViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKThresholdTopUpSetupViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)setShowNavigationBarSpinner:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKThresholdTopUpSetupViewController;
  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](&v5, sel_setShowNavigationBarSpinner_);
  -[PKThresholdTopUpSetupViewController setModalInPresentation:](self, "setModalInPresentation:", v3);
}

- (void)didSelectPaymentMethod
{
  void *v3;
  PKPaymentPass *v4;
  PKPaymentPass *selectedPass;
  void *v6;
  PKPaymentMethodSelectionViewController *v7;

  if (self->_paymentRequest)
  {
    if (!self->_selectedPass)
    {
      if (-[NSString length](self->_paymentMethodIdentifier, "length"))
      {
        objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "passWithFPANIdentifier:", self->_paymentMethodIdentifier);
        v4 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
        selectedPass = self->_selectedPass;
        self->_selectedPass = v4;

      }
    }
    v7 = -[PKPaymentMethodSelectionViewController initWithPaymentRequest:selectedPass:paymentMethodName:paymentMethodIdentifier:allowAppleCashToggle:useAppleCashBalance:viewStyle:delegate:]([PKPaymentMethodSelectionViewController alloc], "initWithPaymentRequest:selectedPass:paymentMethodName:paymentMethodIdentifier:allowAppleCashToggle:useAppleCashBalance:viewStyle:delegate:", self->_paymentRequest, self->_selectedPass, self->_paymentMethodName, self->_paymentMethodIdentifier, 0, 0, self->_viewStyle, self);
    -[PKThresholdTopUpSetupViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v7, 1);

  }
  else
  {
    -[PKThresholdTopUpSetupViewController triggerUpdate:](self, "triggerUpdate:", 0);
  }
}

- (void)setAmountTitle:(id)a3
{
  -[PKThresholdTopUpSelectionSectionController setAmountTitle:](self->_sectionController, "setAmountTitle:", a3);
}

- (void)setThresholdTitle:(id)a3
{
  -[PKThresholdTopUpSelectionSectionController setThresholdTitle:](self->_sectionController, "setThresholdTitle:", a3);
}

- (void)setPaymentMethodTitle:(id)a3
{
  -[PKThresholdTopUpSelectionSectionController setPaymentMethodTitle:](self->_sectionController, "setPaymentMethodTitle:", a3);
}

- (void)setCancelTitle:(id)a3
{
  -[PKThresholdTopUpActionsSectionController setCancelTitle:](self->_actionController, "setCancelTitle:", a3);
}

- (NSDecimalNumber)currentThreshold
{
  return -[PKThresholdTopUpSelectionSectionController currentThreshold](self->_sectionController, "currentThreshold");
}

- (NSDecimalNumber)currentAmount
{
  return -[PKThresholdTopUpSelectionSectionController currentAmount](self->_sectionController, "currentAmount");
}

- (void)_setupCreateNavigationItem
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[PKThresholdTopUpSetupViewController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedPaymentString(CFSTR("THRESHOLD_TURN_ON"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 2, self, sel_turnOn_);

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D98]);
  objc_msgSend(v9, "setRightBarButtonItem:", v5);
  v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedString(CFSTR("CANCEL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 0, self, sel_cancel_);

  objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
  objc_msgSend(v9, "setLeftBarButtonItem:", v8);

}

- (void)_setupDefaultNavigationItem
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_mode == 1)
  {
    -[PKThresholdTopUpSetupViewController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_editingUnavailable)
    {
      objc_msgSend(v6, "setRightBarButtonItem:", 0);
    }
    else
    {
      v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PKLocalizedPaymentString(CFSTR("THRESHOLD_EDIT"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, self, sel_changeEditMode_);

      objc_msgSend(v5, "setEnabled:", !self->_editingUnavailable);
      objc_msgSend(v6, "setRightBarButtonItem:", v5);

    }
    objc_msgSend(v6, "setLeftBarButtonItem:", 0);
    objc_msgSend(v6, "setHidesBackButton:", 0);

  }
}

- (void)_setupEditNavigationItem
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_mode == 1)
  {
    -[PKThresholdTopUpSetupViewController navigationItem](self, "navigationItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("THRESHOLD_UPDATE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 2, self, sel_triggerUpdate_);

    objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D98]);
    objc_msgSend(v5, "setEnabled:", -[PKThresholdTopUpSelectionSectionController valuesEdited](self->_sectionController, "valuesEdited"));
    objc_msgSend(v9, "setRightBarButtonItem:", v5);
    v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("CANCEL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 0, self, sel_changeEditMode_);

    objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
    objc_msgSend(v9, "setLeftBarButtonItem:", v8);
    objc_msgSend(v9, "setHidesBackButton:", 1);

  }
}

- (void)changeEditMode:(id)a3
{
  -[PKThresholdTopUpSetupViewController setEditingValues:](self, "setEditingValues:", !self->_editingValues);
}

- (void)setEditingValues:(BOOL)a3
{
  _BOOL4 v3;
  PKPaymentPass *selectedPass;

  if (((!self->_editingValues ^ a3) & 1) == 0)
  {
    v3 = a3;
    self->_editingValues = a3;
    -[PKThresholdTopUpSelectionSectionController setEditing:](self->_sectionController, "setEditing:");
    selectedPass = self->_selectedPass;
    self->_selectedPass = 0;

    if (v3)
      -[PKThresholdTopUpSetupViewController _setupEditNavigationItem](self, "_setupEditNavigationItem");
    else
      -[PKThresholdTopUpSetupViewController _setupDefaultNavigationItem](self, "_setupDefaultNavigationItem");
  }
}

- (void)setEditingUnavailable:(BOOL)a3
{
  if (self->_mode == 1 && ((!self->_editingUnavailable ^ a3) & 1) == 0)
  {
    self->_editingUnavailable = a3;
    -[PKThresholdTopUpSelectionSectionController setEnabled:](self->_sectionController, "setEnabled:", !a3);
    if (self->_editingValues)
      -[PKThresholdTopUpSetupViewController _setupEditNavigationItem](self, "_setupEditNavigationItem");
    else
      -[PKThresholdTopUpSetupViewController _setupDefaultNavigationItem](self, "_setupDefaultNavigationItem");
  }
}

- (void)setMessages:(id)a3
{
  PKDashboardMessageSectionController *messageSectionController;
  id v5;
  uint64_t v6;
  PKThresholdTopUpSelectionSectionController *sectionController;
  void *v8;
  PKDashboardMessageSectionController **v9;
  uint64_t v10;
  PKThresholdTopUpActionsSectionController *v11;
  void *v12;
  PKThresholdTopUpSelectionSectionController *v13;
  PKThresholdTopUpActionsSectionController *v14;
  PKDashboardMessageSectionController *v15;
  PKThresholdTopUpSelectionSectionController *v16;
  PKThresholdTopUpActionsSectionController *actionController;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  messageSectionController = self->_messageSectionController;
  v5 = a3;
  -[PKDashboardMessageSectionController updateWithMessages:currentMessageIndex:](messageSectionController, "updateWithMessages:currentMessageIndex:", v5, 0);
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    sectionController = self->_sectionController;
    v15 = self->_messageSectionController;
    v16 = sectionController;
    actionController = self->_actionController;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = &v15;
    v10 = 3;
  }
  else
  {
    v11 = self->_actionController;
    v13 = self->_sectionController;
    v14 = v11;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = (PKDashboardMessageSectionController **)&v13;
    v10 = 2;
  }
  objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v13, v14, v15, v16, actionController, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v12, 0);

}

- (void)reloadItem:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKThresholdTopUpSetupViewController;
  -[PKDynamicCollectionViewController reloadItem:animated:](&v7, sel_reloadItem_animated_, a3, a4);
  if (self->_editingValues)
  {
    -[PKThresholdTopUpSetupViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", -[PKThresholdTopUpSelectionSectionController valuesEdited](self->_sectionController, "valuesEdited"));

  }
}

- (void)triggerUpdate:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  -[PKThresholdTopUpSetupViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__PKThresholdTopUpSetupViewController_triggerUpdate___block_invoke;
    v6[3] = &unk_1E3E61C58;
    objc_copyWeak(&v7, &location);
    objc_msgSend(WeakRetained, "thresholdTopUpDidSelectUpdate:completion:", self, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __53__PKThresholdTopUpSetupViewController_triggerUpdate___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShowNavigationBarSpinner:", 0);
  if (a2)
  {
    objc_msgSend(WeakRetained[159], "applyUpdate");
    objc_msgSend(WeakRetained, "setEditingValues:", 0);
  }

}

- (void)turnOn:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  -[PKThresholdTopUpSetupViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__PKThresholdTopUpSetupViewController_turnOn___block_invoke;
    v6[3] = &unk_1E3E61C58;
    objc_copyWeak(&v7, &location);
    objc_msgSend(WeakRetained, "thresholdTopUpDidSelectContinue:completion:", self, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __46__PKThresholdTopUpSetupViewController_turnOn___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShowNavigationBarSpinner:", 0);

}

- (void)cancel:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "thresholdTopUpDidSelectCancel:", self);
  else
    -[PKThresholdTopUpSetupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)performedCancelWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKThresholdTopUpSetupViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 0);

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PKThresholdTopUpSetupViewController_performedCancelWithCompletion___block_invoke;
    v8[3] = &unk_1E3E61C30;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    objc_msgSend(WeakRetained, "thresholdTopUpPerformCancel:completion:", self, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __69__PKThresholdTopUpSetupViewController_performedCancelWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);

}

- (void)paymentMethodSelectionViewController:(id)a3 didSelectPaymentMethod:(id)a4
{
  id v6;
  id v7;
  id v8;

  objc_storeStrong((id *)&self->_selectedPass, a4);
  v6 = a4;
  -[PKThresholdTopUpSelectionSectionController updatePaymentMethod:](self->_sectionController, "updatePaymentMethod:", v6);

  -[PKThresholdTopUpSetupViewController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "popToViewController:animated:", self, 1);

}

- (NSString)amountTitle
{
  return self->_amountTitle;
}

- (NSString)thresholdTitle
{
  return self->_thresholdTitle;
}

- (NSString)paymentMethodTitle
{
  return self->_paymentMethodTitle;
}

- (NSString)paymentMethodIdentifier
{
  return self->_paymentMethodIdentifier;
}

- (void)setPaymentMethodIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethodIdentifier, a3);
}

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void)setPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_paymentRequest, a3);
}

- (NSString)cancelTitle
{
  return self->_cancelTitle;
}

- (PKPaymentPass)selectedPass
{
  return self->_selectedPass;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)editingValues
{
  return self->_editingValues;
}

- (BOOL)editingUnavailable
{
  return self->_editingUnavailable;
}

- (NSOrderedSet)messages
{
  return self->_messages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_cancelTitle, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_paymentMethodIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentMethodTitle, 0);
  objc_storeStrong((id *)&self->_thresholdTitle, 0);
  objc_storeStrong((id *)&self->_amountTitle, 0);
  objc_storeStrong((id *)&self->_paymentMethodName, 0);
  objc_storeStrong((id *)&self->_selectedPass, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageSectionController, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end
