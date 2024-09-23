@implementation PKSharePreviewOverviewSectionController

- (PKSharePreviewOverviewSectionController)init
{

  return 0;
}

- (PKSharePreviewOverviewSectionController)initWithInitiationContext:(id)a3 entitlementComposer:(id)a4 delegate:(id)a5
{
  return (PKSharePreviewOverviewSectionController *)-[PKSharePreviewOverviewSectionController _initWithMode:entitlementComposer:context:delegate:](self, "_initWithMode:entitlementComposer:context:delegate:", 0, a4, a3, a5);
}

- (PKSharePreviewOverviewSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5
{
  return (PKSharePreviewOverviewSectionController *)-[PKSharePreviewOverviewSectionController _initWithMode:entitlementComposer:context:delegate:](self, "_initWithMode:entitlementComposer:context:delegate:", a3, a4, 0, a5);
}

- (id)_initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 context:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  PKSharePreviewOverviewSectionController *v15;
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
  v24[0] = CFSTR("RecipientSection");
  v24[1] = CFSTR("EntitlementsSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)PKSharePreviewOverviewSectionController;
  v15 = -[PKPassShareSectionController initWithIdentifiers:](&v23, sel_initWithIdentifiers_, v14);

  if (v15)
  {
    v15->_mode = a3;
    objc_storeWeak((id *)&v15->_delegate, v13);
    objc_storeStrong((id *)&v15->_context, a5);
    objc_storeStrong((id *)&v15->_entitlementComposer, a4);
    objc_initWeak(&location, v15);
    v16 = (void *)MEMORY[0x1E0DC35C8];
    v17 = objc_opt_class();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __94__PKSharePreviewOverviewSectionController__initWithMode_entitlementComposer_context_delegate___block_invoke;
    v20[3] = &unk_1E3E62748;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v16, "registrationWithCellClass:configurationHandler:", v17, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v15, "setCellRegistration:", v18);

    -[PKSharePreviewOverviewSectionController reloadItemsAnimated:](v15, "reloadItemsAnimated:", 0);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __94__PKSharePreviewOverviewSectionController__initWithMode_entitlementComposer_context_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
    v8 = (id)objc_msgSend(WeakRetained, "decorateListCell:forRowItem:", v9, v6);

  }
}

- (id)sharedEntitlements
{
  return (id)-[PKPassEntitlementsComposer composeSharedEntitlements](self->_entitlementComposer, "composeSharedEntitlements");
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  unint64_t mode;
  id v5;
  id WeakRetained;
  char v7;
  _BOOL4 v8;
  PKSharePreviewRowItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *recipientItems;
  id v16;
  void *v17;
  uint64_t v18;
  PKSharePreviewRowItem *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  int CanAllowResharing;
  uint64_t v25;
  PKSharePreviewRowItem *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  NSArray *v31;
  NSArray *entitlementItems;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  id v37;
  _BOOL4 v38;
  _QWORD v39[2];
  _QWORD v40[2];

  v38 = a3;
  v40[1] = *MEMORY[0x1E0C80C00];
  mode = self->_mode;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  v8 = -[PKPassShareInitiationContext requiresContactSelection](self->_context, "requiresContactSelection");
  if (!mode && (v7 & 1) != 0 && v8)
  {
    v9 = -[PKSharePreviewRowItem initWithIdentifier:]([PKSharePreviewRowItem alloc], "initWithIdentifier:", CFSTR("RecipientRowItemIdentifier"));
    -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recipientNickname");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      -[PKSharePreviewRowItem setTitle:](v9, "setTitle:", v11);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    }
    else
    {
      PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_SECTION_ADD_CONTACT"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharePreviewRowItem setTitle:](v9, "setTitle:", v12);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharePreviewRowItem setTitleColor:](v9, "setTitleColor:", v13);

    objc_msgSend(v5, "addObject:", v9);
  }
  v14 = (NSArray *)objc_msgSend(v5, "copy");
  recipientItems = self->_recipientItems;
  self->_recipientItems = v14;

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPassEntitlementsComposer predefinedEntitlementEntries](self->_entitlementComposer, "predefinedEntitlementEntries");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18
    && -[PKPassEntitlementsComposer canAllowResharing](self->_entitlementComposer, "canAllowResharing"))
  {
    -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
    v19 = (PKSharePreviewRowItem *)objc_claimAutoreleasedReturnValue();
    if (-[PKSharePreviewRowItem isManagingEntitlementConfiguration](v19, "isManagingEntitlementConfiguration"))
    {
      v20 = -[PKPassEntitlementsComposer preferDetailedCapabilityDisplay](self->_entitlementComposer, "preferDetailedCapabilityDisplay");

      if ((v20 & 1) != 0)
        goto LABEL_17;
      v19 = -[PKSharePreviewRowItem initWithIdentifier:]([PKSharePreviewRowItem alloc], "initWithIdentifier:", CFSTR("ShareabilityRowItem"));
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("person.2.fill"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharePreviewRowItem setIcon:](v19, "setIcon:", v21);

      PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_SECTION_SHAREABILITY_ROW_TITLE"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharePreviewRowItem setTitle:](v19, "setTitle:", v22);

      -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shareability");
      CanAllowResharing = PKSharingCapabilityShareabilityCanAllowResharing();

      if (CanAllowResharing)
        v25 = 1;
      else
        v25 = 2;
      -[PKSharePreviewRowItem setDisplayToggleState:](v19, "setDisplayToggleState:", v25);
      -[PKSharePreviewRowItem setAccessoryEnabled:](v19, "setAccessoryEnabled:", -[PKPassEntitlementsComposer editable](self->_entitlementComposer, "editable"));
      objc_msgSend(v16, "addObject:", v19);
    }

  }
LABEL_17:
  v26 = -[PKSharePreviewRowItem initWithIdentifier:]([PKSharePreviewRowItem alloc], "initWithIdentifier:", CFSTR("EntitlementsRowItem"));
  if (self->_mode == 1)
  {
    PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_SECTION_VIEW_ENTITLEMENTS_TITLE"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharePreviewRowItem setTitle:](v26, "setTitle:", v27);
  }
  else
  {
    if (mode == 1)
      v28 = CFSTR("lock.shield.fill");
    else
      v28 = CFSTR("checklist.checked");
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharePreviewRowItem setIcon:](v26, "setIcon:", v29);

    PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_SECTION_ENTITLEMENTS_TITLE"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharePreviewRowItem setTitle:](v26, "setTitle:", v30);

    -[PKSharePreviewOverviewSectionController _localizedEntitlementSummary](self, "_localizedEntitlementSummary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharePreviewRowItem setSubtitle:](v26, "setSubtitle:", v27);
  }

  -[PKSharePreviewRowItem setDisplayChevron:](v26, "setDisplayChevron:", 1);
  objc_msgSend(v16, "addObject:", v26);
  v31 = (NSArray *)objc_msgSend(v16, "copy");
  entitlementItems = self->_entitlementItems;
  self->_entitlementItems = v31;

  if (-[NSArray count](self->_recipientItems, "count"))
  {
    v39[0] = CFSTR("RecipientSection");
    v39[1] = CFSTR("EntitlementsSection");
    v33 = (void *)MEMORY[0x1E0C99D20];
    v34 = v39;
    v35 = 2;
  }
  else
  {
    v40[0] = CFSTR("EntitlementsSection");
    v33 = (void *)MEMORY[0x1E0C99D20];
    v34 = v40;
    v35 = 1;
  }
  objc_msgSend(v33, "arrayWithObjects:count:", v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupListSectionController setIdentifiers:](self, "setIdentifiers:", v36);

  v37 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v37, "reloadDataAnimated:", v38);

}

- (id)_localizedEntitlementSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  _QWORD v13[5];

  -[PKSharePreviewOverviewSectionController _activePredefinedSelection](self, "_activePredefinedSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[PKPassEntitlementsComposer entitlementEntries](self->_entitlementComposer, "entitlementEntries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__PKSharePreviewOverviewSectionController__localizedEntitlementSummary__block_invoke;
    v13[3] = &unk_1E3E6C1D0;
    v13[4] = self;
    objc_msgSend(v6, "pk_objectsPassingTest:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      if (objc_msgSend(v7, "count") == 1)
      {
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "displayableEntitlement");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedTitle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        goto LABEL_12;
      }
      v11 = objc_msgSend(v6, "count");
      if (v11 == objc_msgSend(v7, "count"))
        v10 = CFSTR("SHARE_OVERVIEW_SECTION_ENTITLEMENTS_FULL");
      else
        v10 = CFSTR("SHARE_OVERVIEW_SECTION_ENTITLEMENTS_CUSTOM");
    }
    else
    {
      v10 = CFSTR("SHARE_OVERVIEW_SECTION_ENTITLEMENTS_NONE");
    }
    PKLocalizedShareableCredentialString(&v10->isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v3, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v5;
}

uint64_t __71__PKSharePreviewOverviewSectionController__localizedEntitlementSummary__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "viewFor:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabled");

  return v3;
}

- (id)_activePredefinedSelection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKPassEntitlementsComposer predefinedEntitlementEntries](self->_entitlementComposer, "predefinedEntitlementEntries", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[PKPassEntitlementsComposer viewForPredefined:](self->_entitlementComposer, "viewForPredefined:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "enabled");

        if ((v10 & 1) != 0)
        {
          objc_msgSend(v8, "predefinedSelection");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)decorateListCell:(id)a3 forRowItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v7, "titleColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "textProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setColor:", v10);

  }
  objc_msgSend(v7, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryText:", v12);

  objc_msgSend(v8, "secondaryTextProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColor:", v14);

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  objc_msgSend(v7, "icon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v15);

  objc_msgSend(v8, "imageProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTintColor:", v17);

  objc_msgSend(v6, "setContentConfiguration:", v8);
  if (self->_mode == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __71__PKSharePreviewOverviewSectionController_decorateListCell_forRowItem___block_invoke;
  v28[3] = &unk_1E3E6C1F8;
  v19 = v18;
  v29 = v19;
  objc_msgSend(v6, "setConfigurationUpdateHandler:", v28);
  if (objc_msgSend(v7, "displayChevron"))
  {
    v20 = objc_alloc_init(MEMORY[0x1E0DC3568]);
    if (!v20)
    {
LABEL_14:
      objc_msgSend(v6, "setAccessories:", MEMORY[0x1E0C9AA60]);
      goto LABEL_15;
    }
  }
  else
  {
    v21 = objc_msgSend(v7, "displayToggleState");
    if (!v21)
      goto LABEL_14;
    v22 = v21;
    v23 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v7, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = PKEqualObjects();

    if (v25)
      objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel__shareabilitySwitchValueChanged_, 4096);
    objc_msgSend(v23, "setOn:", v22 == 1);
    objc_msgSend(v23, "setEnabled:", objc_msgSend(v7, "accessoryEnabled"));
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v23, 1);
    objc_msgSend(v20, "setMaintainsFixedSize:", 1);

    if (!v20)
      goto LABEL_14;
  }
  v30[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessories:", v26);

LABEL_15:
  return v8;
}

void __71__PKSharePreviewOverviewSectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)MEMORY[0x1E0DC34D8];
  v6 = a2;
  objc_msgSend(v5, "listGroupedCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isHighlighted") & 1) != 0 || (objc_msgSend(v9, "isSelected") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
  else
  {
    objc_msgSend(v7, "setBackgroundColor:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(v6, "setBackgroundConfiguration:", v7);

}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  int v4;
  __CFString *v5;
  objc_class *v6;
  NSString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (self->_mode == 1)
    return 0;
  v4 = PKEqualObjects();
  v5 = CFSTR("SHARE_OVERVIEW_SECTION_ENTITLEMENTS_HEADER");
  if (v4)
    v5 = CFSTR("SHARE_OVERVIEW_SECTION_RECIPIENT_HEADER");
  v6 = (objc_class *)MEMORY[0x1E0CB3498];
  v7 = v5;
  v8 = [v6 alloc];
  PKLocalizedShareableCredentialString(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v14[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v12);

  return v13;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  if (PKEqualObjects() && self->_recipientItems
    || PKEqualObjects() && self->_entitlementItems)
  {
    objc_msgSend(v6, "appendItems:");
  }

  return v6;
}

- (void)didSelectItem:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(a3, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (PKEqualObjects())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "sharePreviewSectionControllerDidSelectShowContactPicker:", self);
LABEL_7:

    }
  }
  else if (!PKEqualObjects() && PKEqualObjects())
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "sharePreviewSectionControllerDidSelectEntitlements:", self);
    goto LABEL_7;
  }
  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "deselectCells");

}

- (void)_shareabilitySwitchValueChanged:(id)a3
{
  unsigned int v4;
  void *v5;
  id WeakRetained;

  v4 = objc_msgSend(a3, "isOn");
  -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShareability:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sharePreviewSectionControllerDidUpdateEntitlements:", self);

}

- (PKSharePreviewOverviewSectionControllerDelegate)delegate
{
  return (PKSharePreviewOverviewSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PKPassShareInitiationContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entitlementItems, 0);
  objc_storeStrong((id *)&self->_recipientItems, 0);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end
