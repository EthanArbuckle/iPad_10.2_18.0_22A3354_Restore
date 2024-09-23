@implementation PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController

- (PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 pass:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController *v14;
  PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController *v15;
  id *p_entitlementComposer;
  void *v17;
  PKPassEntitlementSelectionSectionController *v18;
  PKPassEntitlementSelectionSectionController *entitlementSectionController;
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
  v26.super_class = (Class)PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController;
  v14 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v26, sel_initWithProvisioningController_context_delegate_, 0, 0, 0);
  v15 = v14;
  if (v14)
  {
    v14->_mode = a3;
    p_entitlementComposer = (id *)&v14->_entitlementComposer;
    objc_storeStrong((id *)&v14->_entitlementComposer, a4);
    objc_storeStrong((id *)&v15->_pass, a5);
    objc_storeStrong((id *)&v15->_delegate, a6);
    objc_msgSend(*p_entitlementComposer, "globalView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIsManagingEntitlementConfiguration:", 1);
    objc_msgSend(v17, "setIsManagingTimeConfiguration:", 1);
    objc_msgSend(v17, "setEnabled:", 0);
    v18 = -[PKPassEntitlementSelectionSectionController initWithMode:entitlementComposer:delegate:]([PKPassEntitlementSelectionSectionController alloc], "initWithMode:entitlementComposer:delegate:", a3, *p_entitlementComposer, v15);
    entitlementSectionController = v15->_entitlementSectionController;
    v15->_entitlementSectionController = v18;

    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v15, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController setModalPresentationStyle:](v15, "setModalPresentationStyle:", 6);
    v27[0] = v15->_entitlementSectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](v15, "setSections:animated:", v20, 0);

    -[PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController navigationItem](v15, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithTitle:style:target:action:", v23, 0, v15, sel__nextButtonPressed);

    objc_msgSend(v24, "setEnabled:", 0);
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
  v9.super_class = (Class)PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController;
  -[PKDynamicCollectionViewController loadView](&v9, sel_loadView);
  -[PKPaymentSetupOptionsViewController setHeaderMode:](self, "setHeaderMode:", 0);
  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleAccessoriesEnabled:", 0);

  if (-[PKSecureElementPass accessType](self->_pass, "accessType") == 4)
  {
    PKLocalizedShareableCredentialString(CFSTR("SHARE_INITIATION_ADVANCED_SETUP_ENTITLEMENT_SELECTION_TITLE_VEHICLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v4);

    PKLocalizedShareableCredentialString(CFSTR("SHARE_INITIATION_ADVANCED_SETUP_ENTITLEMENT_SELECTION_DESCRIPTION_VEHICLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v5);
  }
  else
  {
    PKLocalizedShareableCredentialString(CFSTR("SHARE_INITIATION_ADVANCED_SETUP_ENTITLEMENT_SELECTION_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v5);
  }

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
  v4.super_class = (Class)PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController _reloadSections:](self, "_reloadSections:", 0);
}

- (void)_nextButtonPressed
{
  void *v3;
  PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController *v4;

  v4 = -[PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController initWithMode:entitlementComposer:pass:delegate:]([PKPassShareCreateEntitlementSetTemplateCapabilitySelectionViewController alloc], "initWithMode:entitlementComposer:pass:delegate:", self->_mode, self->_entitlementComposer, self->_pass, self->_delegate);
  -[PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushViewController:animated:", v4, 1);

}

- (void)entitlementSelectionDidChange
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  -[PKPassEntitlementsComposer composeSharedEntitlements](self->_entitlementComposer, "composeSharedEntitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  -[PKPassShareCreateEntitlementSetTemplateEntitlementSelectionViewController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementSectionController, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end
