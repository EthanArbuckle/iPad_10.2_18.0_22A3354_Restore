@implementation PKPassShareDetailsViewController

- (PKPassShareDetailsViewController)initWithShare:(id)a3 sharesController:(id)a4 authorizer:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPassShareDetailsViewController *v11;
  uint64_t v12;
  PKPassShare *share;
  uint64_t v14;
  PKPassShare *senderShare;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PKPassEntitlementsComposer *entitlementComposer;
  id v21;
  PKSharePreviewOverviewSectionController *v22;
  PKSharePreviewOverviewSectionController *overviewSectionController;
  void *v24;
  int v25;
  PKSharePreviewAdditionalSecuritySectionController *v26;
  void *v27;
  uint64_t v28;
  PKSharePreviewAdditionalSecuritySectionController *additionalSecuritySectionController;
  PKPassSharesListSectionController *v30;
  PKPassSharesListSectionController *sharesSectionController;
  objc_super v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)PKPassShareDetailsViewController;
  v11 = -[PKPaymentSetupOptionsViewController init](&v33, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    share = v11->_share;
    v11->_share = (PKPassShare *)v12;

    objc_storeStrong((id *)&v11->_sharesController, a4);
    objc_storeStrong((id *)&v11->_authorizer, a5);
    -[PKSharedPassSharesController senderShareForShare:](v11->_sharesController, "senderShareForShare:", v11->_share);
    v14 = objc_claimAutoreleasedReturnValue();
    senderShare = v11->_senderShare;
    v11->_senderShare = (PKPassShare *)v14;

    v16 = objc_alloc(MEMORY[0x1E0D66EE8]);
    -[PKPassShare sharedEntitlements](v11->_share, "sharedEntitlements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharedPassSharesController shareableEntitlements](v11->_sharesController, "shareableEntitlements");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "initWithSharedEntitlements:availableEntitlements:editable:", v17, v18, -[PKPassShare isEditable](v11->_share, "isEditable"));
    entitlementComposer = v11->_entitlementComposer;
    v11->_entitlementComposer = (PKPassEntitlementsComposer *)v19;

    -[PKPassEntitlementsComposer setMaxSelectionCount:](v11->_entitlementComposer, "setMaxSelectionCount:", -[PKSharedPassSharesController maxEntitlementSelectionCount](v11->_sharesController, "maxEntitlementSelectionCount"));
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = -[PKSharePreviewOverviewSectionController initWithMode:entitlementComposer:delegate:]([PKSharePreviewOverviewSectionController alloc], "initWithMode:entitlementComposer:delegate:", 2, v11->_entitlementComposer, v11);
    overviewSectionController = v11->_overviewSectionController;
    v11->_overviewSectionController = v22;

    objc_msgSend(v21, "addObject:", v11->_overviewSectionController);
    objc_msgSend(v8, "status");
    if ((PKShareStatusIsPending() & 1) != 0
      || (objc_msgSend(v8, "status"), (PKShareStatusIsPendingVerification() & 1) != 0)
      || (-[PKPassShare activationOptions](v11->_share, "activationOptions"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "containsVehicleEnteredPin"),
          v24,
          v25))
    {
      v26 = [PKSharePreviewAdditionalSecuritySectionController alloc];
      -[PKPassShare activationOptions](v11->_share, "activationOptions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[PKSharePreviewAdditionalSecuritySectionController initWithMode:activationOptions:delegate:](v26, "initWithMode:activationOptions:delegate:", 2, v27, v11);
      additionalSecuritySectionController = v11->_additionalSecuritySectionController;
      v11->_additionalSecuritySectionController = (PKSharePreviewAdditionalSecuritySectionController *)v28;

      objc_msgSend(v21, "addObject:", v11->_additionalSecuritySectionController);
    }
    v30 = -[PKPassSharesListSectionController initWithMode:sharesController:rootShare:delegate:]([PKPassSharesListSectionController alloc], "initWithMode:sharesController:rootShare:delegate:", 2, v11->_sharesController, v11->_share, v11);
    sharesSectionController = v11->_sharesSectionController;
    v11->_sharesSectionController = v30;

    objc_msgSend(v21, "addObject:", v11->_sharesSectionController);
    -[PKPaymentSetupOptionsViewController setSections:animated:](v11, "setSections:animated:", v21, 0);

  }
  return v11;
}

- (void)loadView
{
  PKAvatarView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKSharedPassSharesController *sharesController;
  PKPassShare *senderShare;
  void *v10;
  PKSharedPassSharesController *v11;
  PKPassShare *share;
  _QWORD v13[5];
  _QWORD v14[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPassShareDetailsViewController;
  -[PKDynamicCollectionViewController loadView](&v15, sel_loadView);
  v3 = objc_alloc_init(PKAvatarView);
  -[PKAvatarView setDiameter:](v3, "setDiameter:", 100.0);
  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTopArtView:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setBackgroundColor:](self, "setBackgroundColor:", v5);

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentInset:", 10.0, 0.0, 0.0, 0.0);

  if (self->_senderShare)
  {
    -[PKSharedPassSharesController contactForShare:](self->_sharesController, "contactForShare:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PKPassShareDetailsViewController _setSender:](self, "_setSender:", v7);
    }
    else
    {
      sharesController = self->_sharesController;
      senderShare = self->_senderShare;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __44__PKPassShareDetailsViewController_loadView__block_invoke;
      v14[3] = &unk_1E3E69FC0;
      v14[4] = self;
      -[PKSharedPassSharesController fetchContactForShare:withCompletion:](sharesController, "fetchContactForShare:withCompletion:", senderShare, v14);
    }

  }
  -[PKSharedPassSharesController contactForShare:](self->_sharesController, "contactForShare:", self->_share);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PKPassShareDetailsViewController _setRecipient:](self, "_setRecipient:", v10);
  }
  else
  {
    v11 = self->_sharesController;
    share = self->_share;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__PKPassShareDetailsViewController_loadView__block_invoke_2;
    v13[3] = &unk_1E3E69FC0;
    v13[4] = self;
    -[PKSharedPassSharesController fetchContactForShare:withCompletion:](v11, "fetchContactForShare:withCompletion:", share, v13);
  }

}

void __44__PKPassShareDetailsViewController_loadView__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setSender:", a2);
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1280), "recipientNickname");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNickname:", v3);

    objc_msgSend(*(id *)(a1 + 32), "_setSender:", v4);
  }
}

void __44__PKPassShareDetailsViewController_loadView__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setRecipient:", a2);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "recipientNickname");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNickname:", v3);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "recipientNickname");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGivenName:", v4);

    objc_msgSend(*(id *)(a1 + 32), "_setRecipient:", v5);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPassShareDetailsViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[PKPassShareDetailsViewController showSaveButtonIfNecessary](self, "showSaveButtonIfNecessary");
  -[PKPassShareDetailsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    -[PKPassShareDetailsViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__donePressed);
    objc_msgSend(v7, "setRightBarButtonItem:", v8);

  }
  -[PKPassShareDetailsViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLargeTitleDisplayMode:", 2);

}

- (void)_setSender:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", a3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[PKPassShare recipientNickname](self->_senderShare, "recipientNickname");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (id)v4;
  v5 = -[PKPassShare status](self->_share, "status");
  if ((unint64_t)(v5 - 2) < 4)
  {
    v6 = CFSTR("SHARED_KEY_INVITED_CELL_SUBTITLE");
    goto LABEL_7;
  }
  if ((unint64_t)(v5 - 6) >= 3)
  {
    if (v5 != 1)
    {
      v7 = 0;
      goto LABEL_8;
    }
    -[PKPassShare creationDate](self->_share, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && v8)
    {
      PKLongDateString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(CFSTR("SHARE_MANAGEMENT_ADDED_BY_ON"), CFSTR("%@%@"), v10, v9);
    }
    else
    {
      if (v10)
      {
        PKLocalizedShareableCredentialString(CFSTR("SHARE_MANAGEMENT_ADDED_BY"), CFSTR("%@"), v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      if (!v8)
      {
        v7 = 0;
        goto LABEL_17;
      }
      PKLongDateString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(CFSTR("SHARE_MANAGEMENT_ADDED_ON"), CFSTR("%@"), v9);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    goto LABEL_8;
  }
  v6 = CFSTR("SHARED_KEY_REVOKING_CELL_SUBTITLE");
LABEL_7:
  PKLocalizedCredentialString(&v6->isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v7);

}

- (void)_setRecipient:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = a3;
  -[PKPassShareDetailsViewController avatarView](self, "avatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContact:", v4);

  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (uint64_t)v7;
  if (!v7)
  {
    -[PKPassShare recipientNickname](self->_share, "recipientNickname");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (id)v6;
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v6);

}

- (void)_saveTapped
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id location;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[PKPassEntitlementsComposer composeSharedEntitlements](self->_entitlementComposer, "composeSharedEntitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[PKPassShare copy](self->_share, "copy");
  objc_msgSend(v4, "setSharedEntitlements:", v3);
  if (objc_msgSend(v3, "count"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = v3;
    v6 = 0;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (v6 <= objc_msgSend(v10, "creationVersion"))
            v6 = objc_msgSend(v10, "creationVersion");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v7);
    }

    if (v6 <= *MEMORY[0x1E0D6B888])
    {
      -[PKPassShareDetailsViewController _updateShareToShare:](self, "_updateShareToShare:", v4);
    }
    else
    {
      -[PKSharedPassSharesController pass](self->_sharesController, "pass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizationKeyForPassType();
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKSharedPassSharesController pass](self->_sharesController, "pass");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizationKeyForPassType();
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedShareableCredentialString(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v13, v16, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v18 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(CFSTR("CONTINUE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __47__PKPassShareDetailsViewController__saveTapped__block_invoke;
      v31[3] = &unk_1E3E69FE8;
      objc_copyWeak(&v33, &location);
      v32 = v4;
      objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v20);

      v21 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v23);

      -[PKPassShareDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedShareableCredentialString(CFSTR("SHARE_MANAGEMENT_SAVE_ALERT_TITLE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHARE_MANAGEMENT_SAVE_ALERT_DESCRIPTION"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "alertControllerWithTitle:message:preferredStyle:", v25, v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:", v30);

    -[PKPassShareDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v27, 1, 0);
  }

}

void __47__PKPassShareDetailsViewController__saveTapped__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateShareToShare:", *(_QWORD *)(a1 + 32));

}

- (void)_updateShareToShare:(id)a3
{
  id v4;
  PKShareAuthorizationSession *authorizer;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  id location;

  v4 = a3;
  -[PKPassShareDetailsViewController _setIsLoading:](self, "_setIsLoading:", 1);
  objc_initWeak(&location, self);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__16;
  v16[4] = __Block_byref_object_dispose__16;
  authorizer = self->_authorizer;
  v6 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke;
  v13[3] = &unk_1E3E6A038;
  v13[4] = self;
  v7 = v4;
  v14 = v7;
  v15 = v16;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke_3;
  v9[3] = &unk_1E3E6A060;
  objc_copyWeak(&v12, &location);
  v11 = v16;
  v8 = v7;
  v10 = v8;
  -[PKShareAuthorizationSession authorizeDeviceOwnerWithAuthHandler:completion:](authorizer, "authorizeDeviceOwnerWithAuthHandler:completion:", v13, v9);

  objc_destroyWeak(&v12);
  _Block_object_dispose(v16, 8);

  objc_destroyWeak(&location);
}

void __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = a1[5];
  v7 = *(void **)(a1[4] + 1288);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke_2;
  v10[3] = &unk_1E3E6A010;
  v8 = a1[6];
  v11 = v5;
  v12 = v8;
  v9 = v5;
  objc_msgSend(v7, "updateShare:authorization:completion:", v6, a2, v10);

}

void __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  id v5;
  void *v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "_setIsLoading:", 0);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) || (a2 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pkSharingError:", 9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_showDisplayableError:", v6);
    }
    else
    {
      v5 = *(id *)(a1 + 32);
      v6 = (void *)v7[159];
      v7[159] = v5;
    }

    objc_msgSend(v7, "showSaveButtonIfNecessary");
    objc_msgSend(v7, "reloadDataAnimated:", 1);
    WeakRetained = v7;
  }

}

- (void)_setIsLoading:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v8, "startAnimating");
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v8);
    -[PKPassShareDetailsViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v4);

    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  }
  else
  {
    -[PKPassShareDetailsViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", 0);

    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInteractionEnabled:", 1);
  }

}

- (void)_showDisplayableError:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  PKSharingDisplayableError((NSError *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    PKDisplayableErrorForCommonType();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v6;

  v7 = (void *)MEMORY[0x1E0DC3450];
  PKTitleForDisplayableError();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A1AE46BC](v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v13);

  -[PKPassShareDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)_donePressed
{
  -[PKPassShareDetailsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)avatarView
{
  void *v2;
  void *v3;

  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topArtView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)showSaveButtonIfNecessary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *saveButton;
  void *v11;
  void *v12;
  UIBarButtonItem *v13;
  id v14;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[PKPassShare sharedEntitlements](self->_share, "sharedEntitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "initWithArray:", v4);

  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[PKPassEntitlementsComposer composeSharedEntitlements](self->_entitlementComposer, "composeSharedEntitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v8 = objc_msgSend(v7, "isEqualToSet:", v14);
  if (!self->_saveButton)
  {
    v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 3, self, sel__saveTapped);
    saveButton = self->_saveButton;
    self->_saveButton = v9;

  }
  -[PKPassShareDetailsViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v8 & 1) != 0)
    v13 = 0;
  else
    v13 = self->_saveButton;
  objc_msgSend(v11, "setRightBarButtonItem:", v13);

}

- (void)passSharesListSectionController:(id)a3 didSelectShare:(id)a4
{
  id v5;
  void *v6;
  PKPassShareDetailsViewController *v7;

  v5 = a4;
  v7 = -[PKPassShareDetailsViewController initWithShare:sharesController:authorizer:]([PKPassShareDetailsViewController alloc], "initWithShare:sharesController:authorizer:", v5, self->_sharesController, self->_authorizer);

  -[PKPassShareDetailsViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v7, 1);

}

- (void)passSharesListSectionController:(id)a3 setIsLoading:(BOOL)a4
{
  -[PKPassShareDetailsViewController _setIsLoading:](self, "_setIsLoading:", a4);
}

- (void)passSharesListSectionControllerDidFinishRevokingShares:(id)a3
{
  id v3;
  id v4;

  -[PKPassShareDetailsViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)passSharesListSectionController:(id)a3 presentAlert:(id)a4
{
  -[PKPassShareDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)sharePreviewSectionControllerDidSelectEntitlements:(id)a3
{
  void *v4;
  PKPassShareEntitlementSelectionViewController *v5;

  v5 = -[PKPassShareEntitlementSelectionViewController initWithMode:entitlementComposer:]([PKPassShareEntitlementSelectionViewController alloc], "initWithMode:entitlementComposer:", 2, self->_entitlementComposer);
  -[PKPassShareDetailsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_sharesSectionController, 0);
  objc_storeStrong((id *)&self->_additionalSecuritySectionController, 0);
  objc_storeStrong((id *)&self->_entitlementSectionController, 0);
  objc_storeStrong((id *)&self->_overviewSectionController, 0);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
  objc_storeStrong((id *)&self->_authorizer, 0);
  objc_storeStrong((id *)&self->_sharesController, 0);
  objc_storeStrong((id *)&self->_senderShare, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

@end
