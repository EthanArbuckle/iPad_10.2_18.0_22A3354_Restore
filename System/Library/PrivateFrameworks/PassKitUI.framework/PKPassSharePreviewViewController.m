@implementation PKPassSharePreviewViewController

- (PKPassSharePreviewViewController)initWithSharesController:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPassSharePreviewViewController *v12;
  PKPassSharePreviewViewController *v13;
  id *p_sharesController;
  PKPassSnapshotter *v15;
  PKPassSnapshotter *passSnapshotter;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PKPassEntitlementsComposer *entitlementComposer;
  PKPassEntitlementsComposer *v23;
  void *v24;
  void *v25;
  PKPassEntitlementsComposer *v26;
  void *v27;
  void *v28;
  PKSharePreviewOverviewSectionController *v29;
  PKSharePreviewOverviewSectionController *overviewSectionController;
  PKSharePreviewAdditionalSecuritySectionController *v31;
  PKSharePreviewAdditionalSecuritySectionController *additionalSecuritySectionController;
  void *v33;
  objc_super v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v35.receiver = self;
  v35.super_class = (Class)PKPassSharePreviewViewController;
  v12 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v35, sel_initWithProvisioningController_context_delegate_, 0, 0, 0);
  v13 = v12;
  if (v12)
  {
    p_sharesController = (id *)&v12->_sharesController;
    objc_storeStrong((id *)&v12->_sharesController, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v15 = objc_alloc_init(PKPassSnapshotter);
    passSnapshotter = v13->_passSnapshotter;
    v13->_passSnapshotter = v15;

    v17 = objc_alloc(MEMORY[0x1E0D66EE8]);
    -[PKPassShareInitiationContext composedShare](v13->_context, "composedShare");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sharedEntitlements");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_sharesController, "shareableEntitlements");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "initWithSharedEntitlements:availableEntitlements:editable:", v19, v20, 1);
    entitlementComposer = v13->_entitlementComposer;
    v13->_entitlementComposer = (PKPassEntitlementsComposer *)v21;

    -[PKPassEntitlementsComposer setMaxSelectionCount:](v13->_entitlementComposer, "setMaxSelectionCount:", objc_msgSend(*p_sharesController, "maxEntitlementSelectionCount"));
    v23 = v13->_entitlementComposer;
    objc_msgSend(*p_sharesController, "possiblePredefinedEntitlements");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassEntitlementsComposer setPossiblePredefinedSharedEntitlementSelection:](v23, "setPossiblePredefinedSharedEntitlementSelection:", v24);

    -[PKPassEntitlementsComposer predefinedEntitlementEntries](v13->_entitlementComposer, "predefinedEntitlementEntries");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {
      v26 = v13->_entitlementComposer;
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassEntitlementsComposer viewForPredefined:](v26, "viewForPredefined:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setEnabled:", 1);
    }
    v29 = -[PKSharePreviewOverviewSectionController initWithInitiationContext:entitlementComposer:delegate:]([PKSharePreviewOverviewSectionController alloc], "initWithInitiationContext:entitlementComposer:delegate:", v10, v13->_entitlementComposer, v13);
    overviewSectionController = v13->_overviewSectionController;
    v13->_overviewSectionController = v29;

    v31 = -[PKSharePreviewAdditionalSecuritySectionController initWithInitiationContext:delegate:]([PKSharePreviewAdditionalSecuritySectionController alloc], "initWithInitiationContext:delegate:", v13->_context, v13);
    additionalSecuritySectionController = v13->_additionalSecuritySectionController;
    v13->_additionalSecuritySectionController = v31;

    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v13, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPassSharePreviewViewController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 6);
    v36[0] = v13->_overviewSectionController;
    v36[1] = v13->_additionalSecuritySectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](v13, "setSections:animated:", v33, 0);

  }
  return v13;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  PKHeroCardExplanationHeaderView *v14;
  void *v15;
  PKPassSnapshotter *passSnapshotter;
  void *v17;
  PKHeroCardExplanationHeaderView *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  PKHeroCardExplanationHeaderView *v25;
  PKPassSharePreviewViewController *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PKPassSharePreviewViewController;
  -[PKDynamicCollectionViewController loadView](&v27, sel_loadView);
  -[PKPassSharePreviewViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPressed);
  objc_msgSend(v3, "setLeftBarButtonItem:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedPaymentString(CFSTR("CONTINUE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 0, self, sel__continueButtonPressed);
  objc_msgSend(v3, "setRightBarButtonItem:", v7);

  -[PKSharedPassSharesController pass](self->_sharesController, "pass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizationKeyForPassType();
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedShareableCredentialString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v10);

  PKLocalizationKeyForPassType();
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedShareableCredentialString(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v12);

  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKHeroCardExplanationHeaderView initWithImage:]([PKHeroCardExplanationHeaderView alloc], "initWithImage:", 0);
  -[PKHeroCardExplanationHeaderView setPadding:](v14, "setPadding:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHeroCardExplanationHeaderView setBackgroundColor:](v14, "setBackgroundColor:", v15);

  -[PKHeroCardExplanationHeaderView setSize:](v14, "setSize:", 0);
  objc_msgSend(v13, "setTopArtView:", v14);
  passSnapshotter = self->_passSnapshotter;
  -[PKSharedPassSharesController pass](self->_sharesController, "pass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __44__PKPassSharePreviewViewController_loadView__block_invoke;
  v24 = &unk_1E3E61428;
  v25 = v14;
  v26 = self;
  v18 = v14;
  -[PKPassSnapshotter snapshotWithPass:size:completion:](passSnapshotter, "snapshotWithPass:size:completion:", v17, &v21, 142.0, 90.0);

  objc_msgSend(v13, "setAdditionalBottomPadding:", 5.0, v21, v22, v23, v24);
  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "footerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPrimaryButton:", 0);
  objc_msgSend(v20, "setSetupLaterButton:", 0);
  objc_msgSend(v20, "setManualEntryButton:", 0);

}

void __44__PKPassSharePreviewViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PKPassSharePreviewViewController_loadView__block_invoke_2;
  block[3] = &unk_1E3E61400;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __44__PKPassSharePreviewViewController_loadView__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setCardImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassSharePreviewViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PKPassSharePreviewViewController contextDidChange](self, "contextDidChange");
  -[PKPassSharePreviewViewController sheetPresentationController](self, "sheetPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)_continueButtonPressed
{
  PKPassShareInitiationContext *context;
  void *v4;
  BOOL v5;
  id v6;
  id WeakRetained;
  id v8;

  context = self->_context;
  v8 = 0;
  -[PKSharedPassSharesController pass](self->_sharesController, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPassShareInitiationContext isShareConfiguredEnoughToBeSentOverChannelWithDisplayableError:pass:](context, "isShareConfiguredEnoughToBeSentOverChannelWithDisplayableError:pass:", &v8, v4);
  v6 = v8;

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sharePreviewViewControllerDidContinue:", self);
  }
  else
  {
    WeakRetained = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    -[PKPassSharePreviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", WeakRetained, 1, 0);
  }

}

- (void)_cancelPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sharePreviewViewControllerDidCancel:", self);

}

- (void)contextDidChange
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PKPassEntitlementsComposer composeSharedEntitlements](self->_entitlementComposer, "composeSharedEntitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedEntitlements:", v3);

  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Entitlements To Shares: %@", (uint8_t *)&v6, 0xCu);
  }

  -[PKSharePreviewOverviewSectionController setContext:](self->_overviewSectionController, "setContext:", self->_context);
  -[PKSharePreviewOverviewSectionController reloadItemsAnimated:](self->_overviewSectionController, "reloadItemsAnimated:", 0);

}

- (void)_closeContactPicker
{
  -[CNAutocompleteSearchController dismissViewControllerAnimated:completion:](self->_contactSearchController, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setShowHeaderSpinner:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassSharePreviewViewController;
  -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](&v10, sel_setShowHeaderSpinner_);
  v5 = !v3;
  -[PKPassSharePreviewViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

  objc_msgSend(v6, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v5);

  -[PKPassSharePreviewViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", v5);

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)sharePreviewSectionControllerDidSelectShowContactPicker:(id)a3
{
  CNAutocompleteSearchController *v4;
  CNAutocompleteSearchController *contactSearchController;
  CNAutocompleteSearchController *v6;
  void *v7;
  void *v8;
  void *v9;
  PKNavigationController *v10;
  id v11;

  v4 = (CNAutocompleteSearchController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13648]), "initWithSearchType:", 5);
  contactSearchController = self->_contactSearchController;
  self->_contactSearchController = v4;

  v6 = self->_contactSearchController;
  PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_CONTACT_PICKER_SUGGESTED_HEADER"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController setSuggestionsHeaderTitleOverride:](v6, "setSuggestionsHeaderTitleOverride:", v7);

  -[CNAutocompleteSearchController setDelegate:](self->_contactSearchController, "setDelegate:", self);
  -[CNAutocompleteSearchController navigationItem](self->_contactSearchController, "navigationItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__closeContactPicker);
  objc_msgSend(v11, "setRightBarButtonItem:", v8);

  PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_SECTION_ADD_CONTACT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v9);

  v10 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", self->_contactSearchController);
  -[PKPassSharePreviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)sharePreviewSectionControllerDidSelectEntitlements:(id)a3
{
  void *v4;
  PKPassSharePredefinedEntitlementSelectionViewController *v5;
  PKPassEntitlementsComposer *entitlementComposer;
  void *v7;
  void *v8;
  PKPassShareEntitlementSelectionViewController *v9;

  -[PKPassEntitlementsComposer predefinedEntitlementEntries](self->_entitlementComposer, "predefinedEntitlementEntries", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [PKPassSharePredefinedEntitlementSelectionViewController alloc];
    entitlementComposer = self->_entitlementComposer;
    -[PKSharedPassSharesController pass](self->_sharesController, "pass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKPassSharePredefinedEntitlementSelectionViewController initWithMode:entitlementComposer:pass:](v5, "initWithMode:entitlementComposer:pass:", 0, entitlementComposer, v7);

  }
  else
  {
    v9 = -[PKPassShareEntitlementSelectionViewController initWithMode:entitlementComposer:]([PKPassShareEntitlementSelectionViewController alloc], "initWithMode:entitlementComposer:", 0, self->_entitlementComposer);
  }
  -[PKPassSharePreviewViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v9, 1);

}

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x1E0D13688];
  v5 = a4;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContact:address:kind:", 0, v5, 2);

  return v6;
}

- (void)searchController:(id)a3 didAddRecipient:(id)a4
{
  void *v6;
  uint64_t v7;
  PKPassShareInitiationContext *context;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(v10, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v10, "address");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  context = self->_context;
  objc_msgSend(v10, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareInitiationContext setRecipient:fallbackNickname:](context, "setRecipient:fallbackNickname:", v9, v6);

  -[PKPassSharePreviewViewController contextDidChange](self, "contextDidChange");
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0C974B0];
  v6 = a4;
  v8 = (id)objc_msgSend([v5 alloc], "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setEditing:", 0);
  objc_msgSend(v8, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourceView:", v6);

  -[CNAutocompleteSearchController presentViewController:animated:completion:](self->_contactSearchController, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)contactPickerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;

  v5 = (objc_class *)MEMORY[0x1E0D13688];
  v6 = a4;
  v7 = (id)objc_msgSend([v5 alloc], "initWithContact:address:kind:", v6, 0, 2);

  -[PKPassSharePreviewViewController searchController:didAddRecipient:](self, "searchController:didAddRecipient:", self->_contactSearchController, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passSnapshotter, 0);
  objc_storeStrong((id *)&self->_contactSearchController, 0);
  objc_storeStrong((id *)&self->_additionalSecuritySectionController, 0);
  objc_storeStrong((id *)&self->_overviewSectionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sharesController, 0);
}

@end
