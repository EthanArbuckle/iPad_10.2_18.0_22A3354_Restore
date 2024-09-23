@implementation PKPassSharesListSectionController

- (PKPassSharesListSectionController)init
{

  return 0;
}

- (PKPassSharesListSectionController)initWithMode:(unint64_t)a3 sharesController:(id)a4 rootShare:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  PKPassSharesListSectionController *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24[0] = CFSTR("SharesSection");
  v24[1] = CFSTR("ShareActionsSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)PKPassSharesListSectionController;
  v15 = -[PKPassShareSectionController initWithIdentifiers:](&v23, sel_initWithIdentifiers_, v14);

  if (v15)
  {
    v15->_mode = a3;
    objc_storeStrong((id *)&v15->_sharesController, a4);
    -[PKSharedPassSharesController addDelegate:](v15->_sharesController, "addDelegate:", v15);
    objc_storeWeak((id *)&v15->_delegate, v13);
    objc_storeStrong((id *)&v15->_rootShare, a5);
    objc_initWeak(&location, v15);
    v16 = (void *)MEMORY[0x1E0DC35C8];
    v17 = objc_opt_class();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __86__PKPassSharesListSectionController_initWithMode_sharesController_rootShare_delegate___block_invoke;
    v20[3] = &unk_1E3E62748;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v16, "registrationWithCellClass:configurationHandler:", v17, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v15, "setCellRegistration:", v18);

    -[PKPassSharesListSectionController _updatePKShareRowItems](v15, "_updatePKShareRowItems");
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __86__PKPassSharesListSectionController_initWithMode_sharesController_rootShare_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = (id)objc_msgSend(WeakRetained, "decorateListCell:forPKShareRowItem:", v9, v6);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[PKSharedPassSharesController removeDelegate:](self->_sharesController, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKPassSharesListSectionController;
  -[PKPassSharesListSectionController dealloc](&v3, sel_dealloc);
}

- (void)_updatePKShareRowItems
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  PKShareRowItem *v10;
  void *v11;
  void *v12;
  void *v13;
  PKShareRowItem *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *shareItems;
  id v25;
  PKPassShare *rootShare;
  char v27;
  void *v28;
  int v29;
  PKShareRowItem *v30;
  void *v31;
  void *v32;
  NSArray *v33;
  NSArray *actionItems;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[PKPassSharesListSectionController _displayableShares](self, "_displayableShares", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v10 = objc_alloc_init(PKShareRowItem);
        -[PKShareRowItem setShare:](v10, "setShare:", v9);
        -[PKPassSharesListSectionController _titleForPKShareRowItem:](self, "_titleForPKShareRowItem:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKShareRowItem setTitle:](v10, "setTitle:", v11);

        -[PKPassSharesListSectionController _subtitleForShare:](self, "_subtitleForShare:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKShareRowItem setSubtitle:](v10, "setSubtitle:", v12);

        -[PKPassSharesListSectionController _contactForPKShareRowItem:](self, "_contactForPKShareRowItem:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKShareRowItem setContact:](v10, "setContact:", v13);

        -[PKShareRowItem setShowContactAvatar:](v10, "setShowContactAvatar:", 1);
        objc_msgSend(v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v6);
  }

  if (-[PKSharedPassSharesController sharingEnabled](self->_sharesController, "sharingEnabled")
    && !self->_rootShare)
  {
    v14 = objc_alloc_init(PKShareRowItem);
    PKLocalizedShareableCredentialString(CFSTR("SHARE_MANAGEMENT_ADD_PEOPLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShareRowItem setTitle:](v14, "setTitle:", v15);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShareRowItem setTitleTextColor:](v14, "setTitleTextColor:", v16);

    v17 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v18;
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "configurationWithPaletteColors:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShareRowItem setIcon:](v14, "setIcon:", v22);

    -[PKShareRowItem setIsAddShareItem:](v14, "setIsAddShareItem:", 1);
    objc_msgSend(v3, "addObject:", v14);

  }
  v23 = (NSArray *)objc_msgSend(v3, "copy");
  shareItems = self->_shareItems;
  self->_shareItems = v23;

  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  rootShare = self->_rootShare;
  if (rootShare)
  {
    v27 = -[PKPassShare isRevokable](rootShare, "isRevokable");
    if (self->_rootShare)
      goto LABEL_18;
  }
  else
  {
    v27 = 0;
  }
  if (-[PKSharedPassSharesController hasRevokableShares](self->_sharesController, "hasRevokableShares"))
  {
    -[PKSharedPassSharesController pass](self->_sharesController, "pass");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isCarKeyPass") & 1) != 0)
      v29 = 1;
    else
      v29 = PKSharingUseBulkRevokeAPI();

    if ((v27 & 1) != 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_18:
  v29 = 0;
  if ((v27 & 1) != 0)
    goto LABEL_23;
LABEL_22:
  if (v29)
  {
LABEL_23:
    v30 = objc_alloc_init(PKShareRowItem);
    PKLocalizedShareableCredentialString(CFSTR("SHARES_LIST_STOP_SHARING_BUTTON_TEXT"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShareRowItem setTitle:](v30, "setTitle:", v31);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShareRowItem setTitleTextColor:](v30, "setTitleTextColor:", v32);

    -[PKShareRowItem setIsStopSharingItem:](v30, "setIsStopSharingItem:", 1);
    -[PKShareRowItem setShouldCenterText:](v30, "setShouldCenterText:", 1);
    objc_msgSend(v25, "addObject:", v30);

  }
  v33 = (NSArray *)objc_msgSend(v25, "copy");
  actionItems = self->_actionItems;
  self->_actionItems = v33;

}

- (id)_contactForPKShareRowItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKSharedPassSharesController *sharesController;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "share");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharedPassSharesController contactForShare:](self->_sharesController, "contactForShare:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 && (objc_msgSend(v4, "hasFetchedContact") & 1) == 0)
    {
      objc_msgSend(v4, "setHasFetchedContact:", 1);
      objc_initWeak(&location, self);
      sharesController = self->_sharesController;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __63__PKPassSharesListSectionController__contactForPKShareRowItem___block_invoke;
      v10[3] = &unk_1E3E652D8;
      objc_copyWeak(&v12, &location);
      v11 = v4;
      -[PKSharedPassSharesController fetchContactForShare:withCompletion:](sharesController, "fetchContactForShare:withCompletion:", v7, v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }

  }
  return v6;
}

void __63__PKPassSharesListSectionController__contactForPKShareRowItem___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 && WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setContact:", v5);
    v4 = objc_loadWeakRetained(WeakRetained + 14);
    objc_msgSend(v4, "reloadItem:animated:", *(_QWORD *)(a1 + 32), 1);

  }
}

- (id)_titleForPKShareRowItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "share");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "recipientNickname");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v4, "recipientHandle");
      v11 = objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_8;
    }
    v9 = v10;
    v8 = v9;
LABEL_6:
    v11 = (uint64_t)v9;
LABEL_8:

    v8 = (void *)v11;
    goto LABEL_9;
  }
  v6 = (void *)MEMORY[0x1E0D67400];
  objc_msgSend(v4, "recipientHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayNameForCounterpartHandle:contact:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(v4, "recipientNickname");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_9:

  return v8;
}

- (id)_subtitleForShare:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "status");
  if ((unint64_t)(v5 - 2) < 4)
  {
    v6 = CFSTR("SHARED_KEY_INVITED_CELL_SUBTITLE");
    goto LABEL_5;
  }
  if ((unint64_t)(v5 - 6) < 3)
  {
    v6 = CFSTR("SHARED_KEY_REVOKING_CELL_SUBTITLE");
LABEL_5:
    PKLocalizedCredentialString(&v6->isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v5 == 1)
  {
    -[PKSharedPassSharesController pass](self->_sharesController, "pass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCarKeyPass");

    objc_msgSend(v4, "displayableSharedEntitlements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      objc_msgSend(v11, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "localizedTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[PKSharedPassSharesController shareableEntitlements](self->_sharesController, "shareableEntitlements");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "count");
      if (v15 >= objc_msgSend(v14, "count"))
        v16 = CFSTR("SHARE_OVERVIEW_SECTION_ENTITLEMENTS_FULL_ACCESS");
      else
        v16 = CFSTR("SHARE_OVERVIEW_SECTION_ENTITLEMENTS_CUSTOM_ACCESS");
      PKLocalizedShareableCredentialString(&v16->isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }
LABEL_6:

  return v7;
}

- (id)_displayableShares
{
  void *v3;
  int v4;
  PKSharedPassSharesController *sharesController;

  if (self->_rootShare)
  {
    -[PKSharedPassSharesController childSharesOfShare:](self->_sharesController, "childSharesOfShare:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = PKShowLocalPassShares();
    sharesController = self->_sharesController;
    if (v4)
      -[PKSharedPassSharesController shares](sharesController, "shares");
    else
      -[PKSharedPassSharesController nonLocalShares](sharesController, "nonLocalShares");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_updateStopSharingItemToDisabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v3 = a3;
  -[NSArray pk_firstObjectPassingTest:](self->_actionItems, "pk_firstObjectPassingTest:", &__block_literal_global_38);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = v5;
    if (v3)
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleTextColor:", v6);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "reloadItem:animated:", v8, 1);

    v5 = v8;
  }

}

uint64_t __70__PKPassSharesListSectionController__updateStopSharingItemToDisabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isStopSharingItem");
}

- (id)decorateListCell:(id)a3 forPKShareRowItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKAvatarView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  id v32;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v9);

  objc_msgSend(v7, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  objc_msgSend(v6, "titleTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "titleTextColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v13);

  }
  if (objc_msgSend(v6, "showContactAvatar"))
  {
    v14 = objc_alloc_init(PKAvatarView);
    -[PKAvatarView setDiameter:](v14, "setDiameter:", 35.0);
    objc_msgSend(v6, "contact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[PKAvatarView setContact:](v14, "setContact:", v15);
    }
    else
    {
      objc_msgSend(v6, "share");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "recipientNickname");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAvatarView setPlaceholderName:](v14, "setPlaceholderName:", v19);

    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v14, 0);
    objc_msgSend(v8, "addObject:", v20);
    objc_msgSend(v20, "setReservedLayoutWidth:", 35.0);

  }
  else
  {
    objc_msgSend(v6, "icon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_11;
    v14 = objc_alloc_init(PKAvatarView);
    -[PKAvatarView setDiameter:](v14, "setDiameter:", 35.0);
    objc_msgSend(v6, "icon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAvatarView setPlaceholderImage:](v14, "setPlaceholderImage:", v17);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v14, 0);
    objc_msgSend(v8, "addObject:", v15);
    objc_msgSend(v15, "setReservedLayoutWidth:", 35.0);
  }

LABEL_11:
  if (objc_msgSend(v6, "shouldCenterText"))
    objc_msgSend(v10, "setAlignment:", 1);
  objc_msgSend(v7, "directionalLayoutMargins");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v6, "subtitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v6, "subtitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSecondaryText:", v26);

    objc_msgSend(v7, "secondaryTextProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setColor:", v28);

    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFont:", v29);

    v30 = 10.0;
  }
  else
  {
    v30 = 15.0;
  }
  objc_msgSend(v7, "setDirectionalLayoutMargins:", v30, v22, v30, v24);
  objc_msgSend(v5, "setContentConfiguration:", v7);
  objc_msgSend(v5, "setConfigurationUpdateHandler:", &__block_literal_global_155);
  objc_msgSend(v6, "share");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = objc_alloc_init(MEMORY[0x1E0DC3568]);
    objc_msgSend(v8, "addObject:", v32);

  }
  objc_msgSend(v5, "setAccessories:", v8);

  return v7;
}

void __72__PKPassSharesListSectionController_decorateListCell_forPKShareRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)MEMORY[0x1E0DC34D8];
  v5 = a2;
  objc_msgSend(v4, "listGroupedCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isHighlighted") & 1) != 0 || (objc_msgSend(v9, "isSelected") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v5, "setBackgroundConfiguration:", v6);
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  NSArray *shareItems;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  if (PKEqualObjects())
  {
    shareItems = self->_shareItems;
    if (shareItems)
      goto LABEL_5;
  }
  if (PKEqualObjects())
  {
    shareItems = self->_actionItems;
LABEL_5:
    objc_msgSend(v6, "appendItems:", shareItems);
  }

  return v6;
}

- (void)didSelectItem:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "share");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "share");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "passSharesListSectionController:didSelectShare:", self, v6);

LABEL_5:
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isAddShareItem"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "passSharesListSectionControllerDidSelectAddShare:", self);
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "isStopSharingItem"))
  {
    -[PKPassSharesListSectionController _updateStopSharingItemToDisabled:](self, "_updateStopSharingItemToDisabled:", 1);
    -[PKPassSharesListSectionController _confirmRevokeShare:](self, "_confirmRevokeShare:", self->_rootShare);
  }
LABEL_6:
  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "deselectCells");

}

- (void)_confirmRevokeShare:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  -[PKPassSharesListSectionController _alertForRevokeOptionsForShare:](self, "_alertForRevokeOptionsForShare:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "passSharesListSectionController:presentAlert:", self, v4);

  }
  else
  {
    -[PKPassSharesListSectionController _revokeShare:cascade:](self, "_revokeShare:cascade:", v6, 0);
  }

}

- (void)_revokeShare:(id)a3 cascade:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PKSharedPassSharesController *sharesController;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = a4;
  v6 = a3;
  objc_initWeak(&location, self);
  sharesController = self->_sharesController;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PKPassSharesListSectionController__revokeShare_cascade___block_invoke;
  v8[3] = &unk_1E3E65360;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  -[PKSharedPassSharesController revokeShare:shouldCascade:withCompletion:](sharesController, "revokeShare:shouldCascade:withCompletion:", v6, v4, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __58__PKPassSharesListSectionController__revokeShare_cascade___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    objc_msgSend(v4, "passSharesListSectionController:setIsLoading:", WeakRetained, 0);

    objc_msgSend(WeakRetained, "_updateStopSharingItemToDisabled:", 0);
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    v6 = v5;
    if (v9)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "_alertForDisplayableError:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "passSharesListSectionController:presentAlert:", v7, v8);

    }
    else
    {
      objc_msgSend(v5, "passSharesListSectionControllerDidFinishRevokingShares:", WeakRetained);
    }

  }
}

- (void)_revokeAllShares
{
  id WeakRetained;
  PKSharedPassSharesController *sharesController;
  _QWORD v5[5];
  id v6;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passSharesListSectionController:setIsLoading:", self, 1);

  objc_initWeak(&location, self);
  sharesController = self->_sharesController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PKPassSharesListSectionController__revokeAllShares__block_invoke;
  v5[3] = &unk_1E3E65360;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  -[PKSharedPassSharesController revokeAllSharesWithCompletion:](sharesController, "revokeAllSharesWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__PKPassSharesListSectionController__revokeAllShares__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    objc_msgSend(v4, "passSharesListSectionController:setIsLoading:", WeakRetained, 0);

    objc_msgSend(WeakRetained, "_updateStopSharingItemToDisabled:", 0);
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    v6 = v5;
    if (v9)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "_alertForDisplayableError:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "passSharesListSectionController:presentAlert:", v7, v8);

    }
    else
    {
      objc_msgSend(v5, "passSharesListSectionControllerDidFinishRevokingShares:", WeakRetained);
    }

  }
}

- (id)_alertForRevokeOptionsForShare:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  PKPassSharesListSectionController *v25;
  _QWORD v26[5];
  id v27;

  v4 = a3;
  -[PKSharedPassSharesController childSharesOfShare:](self->_sharesController, "childSharesOfShare:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v4 || v6)
  {
    if (self->_rootShare)
      v8 = CFSTR("SHARE_MANAGEMENT_REVOKE_CONFIRMATION_STOP_SHARING");
    else
      v8 = CFSTR("SHARE_MANAGEMENT_REVOKE_CONFIRMATION_STOP_SHARING_ALL_SHARE");
    PKLocalizedShareableCredentialString(&v8->isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    if (!v4)
      goto LABEL_9;
    v11 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedShareableCredentialString(CFSTR("SHARE_MANAGEMENT_REVOKE_CONFIRMATION_THIS_SHARE_ONLY"));
    v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke;
    v26[3] = &unk_1E3E61D90;
    v26[4] = self;
    v27 = v4;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 2, v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v14);

    v10 = v12;
    if (v6)
    {
LABEL_9:
      v15 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedShareableCredentialString(CFSTR("SHARE_MANAGEMENT_REVOKE_CONFIRMATION_ALL_SHARES"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke_2;
      v23[3] = &unk_1E3E61D90;
      v24 = v4;
      v25 = self;
      objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 2, v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAction:", v17);

    }
    v18 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke_3;
    v22[3] = &unk_1E3E61D68;
    v22[4] = self;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v20);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_revokeShare:cascade:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v1, "_revokeShare:cascade:", v2, 1);
  else
    return objc_msgSend(v1, "_revokeAllShares");
}

uint64_t __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStopSharingItemToDisabled:", 0);
}

- (id)_alertForDisplayableError:(id)a3
{
  NSError *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (NSError *)a3;
  PKSharingDisplayableError(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PKLocalizedShareableCredentialString(CFSTR("REVOKE_SHARE_ERROR_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("REVOKE_SHARE_ERROR_MESSAGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D80]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v14);

  return v11;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_rootShare && -[NSArray count](self->_shareItems, "count") && PKEqualObjects())
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3498]);
    PKLocalizedShareableCredentialString(CFSTR("SHARE_VIEWING_SHARED_WITH_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = *MEMORY[0x1E0DC1138];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v12[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)sharedPassSharesControllerDidUpdateShares:(id)a3
{
  id WeakRetained;

  -[PKPassSharesListSectionController _updatePKShareRowItems](self, "_updatePKShareRowItems", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataAnimated:", 1);

}

- (PKPassSharesListSectionControllerDelegate)delegate
{
  return (PKPassSharesListSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong((id *)&self->_shareItems, 0);
  objc_storeStrong((id *)&self->_rootShare, 0);
  objc_storeStrong((id *)&self->_sharesController, 0);
}

@end
