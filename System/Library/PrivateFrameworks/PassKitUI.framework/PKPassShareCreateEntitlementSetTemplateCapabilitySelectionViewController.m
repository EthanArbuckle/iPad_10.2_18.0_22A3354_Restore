@implementation PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController

- (PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 pass:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController *v14;
  PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController *v15;
  id *p_entitlementComposer;
  void *v17;
  PKPassEntitlementCapabilitySectionController *v18;
  PKPassEntitlementCapabilitySectionController *capabilitySectionController;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController;
  v14 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v26, sel_initWithProvisioningController_context_delegate_, 0, 0, 0);
  v15 = v14;
  if (v14)
  {
    v14->_mode = a3;
    p_entitlementComposer = (id *)&v14->_entitlementComposer;
    objc_storeStrong((id *)&v14->_entitlementComposer, a4);
    objc_storeStrong((id *)&v15->_pass, a5);
    objc_storeStrong((id *)&v15->_delegate, a6);
    objc_msgSend(*p_entitlementComposer, "viewForEnabledEntitlements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIsManagingEntitlementConfiguration:", 1);
    objc_msgSend(v17, "setShareability:", 0);
    objc_msgSend(v17, "setVisibility:", 1);
    objc_msgSend(v17, "setManageability:", 1);
    objc_msgSend(v17, "setIntraAccountSharingEnabled:", objc_msgSend(v17, "possibleIntraAccountSharing"));
    objc_msgSend(v17, "setEnabled:", 1);
    v18 = -[PKPassEntitlementCapabilitySectionController initWithMode:entitlementComposer:composerView:isDisabled:delegate:]([PKPassEntitlementCapabilitySectionController alloc], "initWithMode:entitlementComposer:composerView:isDisabled:delegate:", v15->_mode, *p_entitlementComposer, v17, 0, v15);
    capabilitySectionController = v15->_capabilitySectionController;
    v15->_capabilitySectionController = v18;

    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v15, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController setModalPresentationStyle:](v15, "setModalPresentationStyle:", 6);
    v27[0] = v15->_capabilitySectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](v15, "setSections:animated:", v20, 0);

    -[PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController navigationItem](v15, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithTitle:style:target:action:", v23, 0, v15, sel__nextButtonPressed);

    objc_msgSend(v21, "setRightBarButtonItem:", v24);
  }

  return v15;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController;
  -[PKDynamicCollectionViewController loadView](&v9, sel_loadView);
  -[PKPaymentSetupOptionsViewController setHeaderMode:](self, "setHeaderMode:", 0);
  PKLocalizedShareableCredentialString(CFSTR("SHARE_INITIATION_ADVANCED_SETUP_CAPABILITY_SELECTION_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v3);

  PKLocalizedShareableCredentialString(CFSTR("SHARE_INITIATION_ADVANCED_SETUP_CAPABILITY_SELECTION_DESCRIPTION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v4);

  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleAccessoriesEnabled:", 0);

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
  v4.super_class = (Class)PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController _reloadSections:](self, "_reloadSections:", 0);
}

- (void)_nextButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  -[PKPassEntitlementsComposer composeSharedEntitlements](self->_entitlementComposer, "composeSharedEntitlements");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entitlementIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassEntitlementsComposer entitlementEntries](self->_entitlementComposer, "entitlementEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController__nextButtonPressed__block_invoke;
  v13[3] = &unk_1E3E76340;
  v14 = v4;
  v6 = v4;
  objc_msgSend(v5, "pk_firstObjectPassingTest:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_PREDEFINED_CUSTOM_CREATION_ROW"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayableEntitlement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D674F0]), "initWithTitle:description:sharedEntitlements:", v8, v10, v12);
  -[PKPassShareCreateEntitlementSetTemplateDelegate createPredefinedSelectionViewController:didCreatePredefinedSelection:](self->_delegate, "createPredefinedSelectionViewController:didCreatePredefinedSelection:", self, v11);

}

uint64_t __94__PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController__nextButtonPressed__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a2, "displayableEntitlement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entitlementIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
      v9 = objc_msgSend(v6, "isEqualToString:", v7);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilitySectionController, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end
