@implementation PKPassSharePredefinedEntitlementSelectionViewController

- (PKPassSharePredefinedEntitlementSelectionViewController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 pass:(id)a5
{
  id v9;
  id v10;
  PKPassSharePredefinedEntitlementSelectionViewController *v11;
  PKPassSharePredefinedEntitlementSelectionViewController *v12;
  PKPassSharePredefinedEntitlementSectionController *v13;
  PKPassSharePredefinedEntitlementSectionController *predefinedSelectionSectionController;
  void *v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPassSharePredefinedEntitlementSelectionViewController;
  v11 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v17, sel_initWithProvisioningController_context_delegate_, 0, 0, 0);
  v12 = v11;
  if (v11)
  {
    v11->_mode = a3;
    objc_storeStrong((id *)&v11->_entitlementComposer, a4);
    objc_storeStrong((id *)&v12->_pass, a5);
    v13 = -[PKPassSharePredefinedEntitlementSectionController initWithMode:entitlementComposer:delegate:]([PKPassSharePredefinedEntitlementSectionController alloc], "initWithMode:entitlementComposer:delegate:", a3, v12->_entitlementComposer, v12);
    predefinedSelectionSectionController = v12->_predefinedSelectionSectionController;
    v12->_predefinedSelectionSectionController = v13;

    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v12, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPassSharePredefinedEntitlementSelectionViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 6);
    v18[0] = v12->_predefinedSelectionSectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](v12, "setSections:animated:", v15, 0);

  }
  return v12;
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
  v11.super_class = (Class)PKPassSharePredefinedEntitlementSelectionViewController;
  -[PKDynamicCollectionViewController loadView](&v11, sel_loadView);
  -[PKPaymentSetupOptionsViewController setHeaderMode:](self, "setHeaderMode:", 0);
  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleAccessoriesEnabled:", 0);

  PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_SECTION_ENTITLEMENTS_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v4);

  PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_PREDEFINED_ENTITLEMENTS_SECTION_DESCRIPTION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v5);

  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrimaryButton:", 0);
  objc_msgSend(v6, "setButtonsEnabled:", 1);
  objc_msgSend(v7, "setSetupLaterButton:", 0);
  objc_msgSend(v7, "setManualEntryButton:", 0);
  objc_msgSend(v7, "secondaryActionButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_PREDEFINED_SELECT_ADVANCED_FOOTER_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__createAdvancedEntitlementSelection, 0x2000);
  objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE0]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setBackgroundColor:](self, "setBackgroundColor:", v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassSharePredefinedEntitlementSelectionViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKDynamicCollectionViewController reloadDataWithoutRebuildingDataStores](self, "reloadDataWithoutRebuildingDataStores");
}

- (void)_createAdvancedEntitlementSelection
{
  void *v3;
  PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController *v4;

  v4 = -[PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController initWithMode:entitlementComposer:pass:delegate:]([PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController alloc], "initWithMode:entitlementComposer:pass:delegate:", self->_mode, self->_entitlementComposer, self->_pass, self);
  -[PKPassSharePredefinedEntitlementSelectionViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushViewController:animated:", v4, 1);

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

- (void)createPredefinedSelectionViewController:(id)a3 didCreatePredefinedSelection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Creating custom predefined selection: %@", (uint8_t *)&v18, 0xCu);
  }

  -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 0);

  -[PKPassEntitlementsComposer addPredefinedSharedEntitlementSelection:](self->_entitlementComposer, "addPredefinedSharedEntitlementSelection:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassEntitlementsComposer viewForPredefined:](self->_entitlementComposer, "viewForPredefined:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  -[PKDynamicCollectionViewController reloadDataAnimated:](self, "reloadDataAnimated:", 0);
  -[PKPassSharePredefinedEntitlementSelectionViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", self);

  v13 = v12 - 1;
  objc_msgSend(v10, "viewControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassSharePredefinedEntitlementSelectionViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "popToViewController:animated:", v15, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predefinedSelectionSectionController, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end
