@implementation PKPassShareEntitlementSelectionViewController

- (PKPassShareEntitlementSelectionViewController)initWithMyEntitlements:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PKPassShareEntitlementSelectionViewController *v7;

  v4 = (objc_class *)MEMORY[0x1E0D66EE8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMyEntitlements:", v5);

  v7 = -[PKPassShareEntitlementSelectionViewController _initWithMode:entitlementComposer:isShowingMyEntitlements:](self, "_initWithMode:entitlementComposer:isShowingMyEntitlements:", 2, v6, 1);
  return v7;
}

- (PKPassShareEntitlementSelectionViewController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4
{
  return (PKPassShareEntitlementSelectionViewController *)-[PKPassShareEntitlementSelectionViewController _initWithMode:entitlementComposer:isShowingMyEntitlements:](self, "_initWithMode:entitlementComposer:isShowingMyEntitlements:", a3, a4, 0);
}

- (id)_initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 isShowingMyEntitlements:(BOOL)a5
{
  id v9;
  PKPassShareEntitlementSelectionViewController *v10;
  PKPassShareEntitlementSelectionViewController *v11;
  id *p_entitlementComposer;
  PKPassEntitlementSelectionSectionController *v13;
  PKPassEntitlementSelectionSectionController *entitlementSectionController;
  PKPassEntitlementTimeSectionController *v15;
  PKPassEntitlementTimeSectionController *timeSectionController;
  void *v17;
  PKPassEntitlementCapabilitySectionController *v18;
  PKPassEntitlementCapabilitySectionController *capabilitySectionController;
  id v20;
  objc_super v22;

  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PKPassShareEntitlementSelectionViewController;
  v10 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v22, sel_initWithProvisioningController_context_delegate_, 0, 0, 0);
  v11 = v10;
  if (v10)
  {
    v10->_mode = a3;
    p_entitlementComposer = (id *)&v10->_entitlementComposer;
    objc_storeStrong((id *)&v10->_entitlementComposer, a4);
    v11->_isShowingMyEntitlements = a5;
    v13 = -[PKPassEntitlementSelectionSectionController initWithMode:entitlementComposer:delegate:]([PKPassEntitlementSelectionSectionController alloc], "initWithMode:entitlementComposer:delegate:", a3, *p_entitlementComposer, v11);
    entitlementSectionController = v11->_entitlementSectionController;
    v11->_entitlementSectionController = v13;

    v15 = -[PKPassEntitlementTimeSectionController initWithMode:entitlementComposer:delegate:]([PKPassEntitlementTimeSectionController alloc], "initWithMode:entitlementComposer:delegate:", v11->_mode, *p_entitlementComposer, v11);
    timeSectionController = v11->_timeSectionController;
    v11->_timeSectionController = v15;

    objc_msgSend(*p_entitlementComposer, "globalView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isManagingTimeConfiguration")
      && objc_msgSend(*p_entitlementComposer, "preferDetailedCapabilityDisplay"))
    {
      v18 = -[PKPassEntitlementCapabilitySectionController initWithMode:entitlementComposer:composerView:isDisabled:delegate:]([PKPassEntitlementCapabilitySectionController alloc], "initWithMode:entitlementComposer:composerView:isDisabled:delegate:", v11->_mode, *p_entitlementComposer, v17, 0, v11);
      capabilitySectionController = v11->_capabilitySectionController;
      v11->_capabilitySectionController = v18;

    }
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v11, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPassShareEntitlementSelectionViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 6);
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v20, "addObject:", v11->_entitlementSectionController);
    objc_msgSend(v20, "safelyAddObject:", v11->_capabilitySectionController);
    objc_msgSend(v20, "addObject:", v11->_timeSectionController);
    -[PKPaymentSetupOptionsViewController setSections:animated:](v11, "setSections:animated:", v20, 0);

  }
  return v11;
}

- (void)loadView
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassShareEntitlementSelectionViewController;
  -[PKDynamicCollectionViewController loadView](&v9, sel_loadView);
  if (self->_mode == 2 && self->_isShowingMyEntitlements)
  {
    v3 = CFSTR("MY_ENTITLEMENTS_TITLE");
    v4 = 1;
  }
  else
  {
    v3 = CFSTR("SHARE_OVERVIEW_SECTION_ENTITLEMENTS_TITLE");
    v4 = 2;
  }
  PKLocalizedShareableCredentialString(&v3->isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareEntitlementSelectionViewController setTitle:](self, "setTitle:", v5);

  -[PKPaymentSetupOptionsViewController setHeaderMode:](self, "setHeaderMode:", v4);
  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrimaryButton:", 0);
  objc_msgSend(v6, "setButtonsEnabled:", 1);
  objc_msgSend(v7, "setSetupLaterButton:", 0);
  objc_msgSend(v7, "setManualEntryButton:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setBackgroundColor:](self, "setBackgroundColor:", v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassShareEntitlementSelectionViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPassShareEntitlementSelectionViewController _reloadSections:](self, "_reloadSections:", 0);
}

- (void)_dismissButtonPressed
{
  -[PKPassShareEntitlementSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setShowDoneButton:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_showDoneButton != a3)
  {
    self->_showDoneButton = a3;
    -[PKPassShareEntitlementSelectionViewController navigationItem](self, "navigationItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_showDoneButton)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismissButtonPressed);
      objc_msgSend(v5, "setLeftBarButtonItem:", v4);

    }
    else
    {
      objc_msgSend(v5, "setLeftBarButtonItem:", 0);
    }

  }
}

- (void)_reloadSections:(BOOL)a3
{
  -[PKPassEntitlementTimeSectionController reloadItemsAnimated:](self->_timeSectionController, "reloadItemsAnimated:", a3);
  -[PKDynamicCollectionViewController reloadDataWithoutRebuildingDataStores](self, "reloadDataWithoutRebuildingDataStores");
}

- (void)entitlementSelectionDidChange
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[PKPassEntitlementsComposer composeSharedEntitlements](self->_entitlementComposer, "composeSharedEntitlements");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKPaymentSetupOptionsViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewController:entitlementSelectionDidChange:", self, v6);

  }
}

- (void)showAdvancedScheduleSelectionFlowForEntitlementEntry:(id)a3
{
  id v4;
  void *v5;
  PKPassShareTimeLimitViewController *v6;

  v4 = a3;
  v6 = -[PKPassShareTimeLimitViewController initWithMode:entitlementComposer:entitlementEntry:delegate:]([PKPassShareTimeLimitViewController alloc], "initWithMode:entitlementComposer:entitlementEntry:delegate:", self->_mode, self->_entitlementComposer, v4, self);

  -[PKPassShareEntitlementSelectionViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)didTapPassEntitlementTimeSectionController:(id)a3
{
  void *v4;
  PKPassShareTimeLimitViewController *v5;

  v5 = -[PKPassShareTimeLimitViewController initWithMode:entitlementComposer:entitlementEntry:delegate:]([PKPassShareTimeLimitViewController alloc], "initWithMode:entitlementComposer:entitlementEntry:delegate:", self->_mode, self->_entitlementComposer, 0, self);
  -[PKPassShareEntitlementSelectionViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (BOOL)showDoneButton
{
  return self->_showDoneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSectionController, 0);
  objc_storeStrong((id *)&self->_capabilitySectionController, 0);
  objc_storeStrong((id *)&self->_entitlementSectionController, 0);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end
