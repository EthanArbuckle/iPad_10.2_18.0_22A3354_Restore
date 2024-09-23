@implementation PKPassEntitlementSelectionSectionController

- (PKPassEntitlementSelectionSectionController)init
{

  return 0;
}

- (PKPassEntitlementSelectionSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PKPassEntitlementSelectionSectionController *v11;
  PKPassEntitlementSelectionSectionController *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *toggleTags;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, void *);
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PKPassEntitlementSelectionSectionController;
  v11 = -[PKPassShareSectionController initWithIdentifiers:](&v25, sel_initWithIdentifiers_, &unk_1E3FAE9B0);
  v12 = v11;
  if (v11)
  {
    v11->_mode = a3;
    objc_storeStrong((id *)&v11->_entitlementComposer, a4);
    -[PKPassEntitlementSelectionSectionController _updateEntitlementGroups](v12, "_updateEntitlementGroups");
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    toggleTags = v12->_toggleTags;
    v12->_toggleTags = v13;

    objc_initWeak(&location, v12);
    v15 = (void *)MEMORY[0x1E0DC35C8];
    v16 = objc_opt_class();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __89__PKPassEntitlementSelectionSectionController_initWithMode_entitlementComposer_delegate___block_invoke;
    v22 = &unk_1E3E62748;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v15, "registrationWithCellClass:configurationHandler:", v16, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v12, "setCellRegistration:", v17, v19, v20, v21, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __89__PKPassEntitlementSelectionSectionController_initWithMode_entitlementComposer_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
    v8 = (id)objc_msgSend(WeakRetained, "decorateListCell:forEntitlementEntry:", v9, v6);

  }
}

- (void)_updateEntitlementGroups
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *groupedEntitlements;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPassEntitlementsComposer entitlementEntries](self->_entitlementComposer, "entitlementEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pk_groupDictionaryByApplyingBlock:", &__block_literal_global_212);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __71__PKPassEntitlementSelectionSectionController__updateEntitlementGroups__block_invoke_2;
  v24[3] = &unk_1E3E786C8;
  v8 = v6;
  v25 = v8;
  objc_msgSend(v7, "sortedArrayUsingComparator:", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v15, (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v12);
  }

  -[PKPaymentSetupListSectionController setIdentifiers:](self, "setIdentifiers:", v10);
  v18 = (NSDictionary *)objc_msgSend(v8, "copy");
  groupedEntitlements = self->_groupedEntitlements;
  self->_groupedEntitlements = v18;

}

__CFString *__71__PKPassEntitlementSelectionSectionController__updateEntitlementGroups__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a2, "displayableEntitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedGroup");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("Default");
  v5 = v3;

  return v5;
}

uint64_t __71__PKPassEntitlementSelectionSectionController__updateEntitlementGroups__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v12, "displayableEntitlement");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 <= objc_msgSend(v13, "groupPriority"))
        {
          objc_msgSend(v12, "displayableEntitlement");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v14, "groupPriority");

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v21, "displayableEntitlement");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 <= objc_msgSend(v22, "groupPriority"))
        {
          objc_msgSend(v21, "displayableEntitlement");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v23, "groupPriority");

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  v24 = 1;
  if (v9 >= v18)
    v24 = -1;
  if (v9 == v18)
    v25 = 0;
  else
    v25 = v24;

  return v25;
}

uint64_t __71__PKPassEntitlementSelectionSectionController__updateEntitlementGroups__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayableEntitlement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayableEntitlement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)decorateListCell:(id)a3 forEntitlementEntry:(id)a4
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
  uint64_t v20;
  __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  NSMutableDictionary *toggleTags;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "displayableEntitlement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassEntitlementsComposer viewFor:](self->_entitlementComposer, "viewFor:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  objc_msgSend(v8, "localizedSubtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSecondaryText:", v12);

  objc_msgSend(v10, "secondaryTextProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColor:", v14);

  objc_msgSend(v10, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  objc_msgSend(v8, "iconName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v8, "iconName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "systemImageNamed:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v18);

  }
  objc_msgSend(v6, "setContentConfiguration:", v10);
  objc_msgSend(v6, "setConfigurationUpdateHandler:", &__block_literal_global_23_0);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = objc_msgSend(v9, "enabled");
  if ((objc_msgSend(v9, "isManagingTimeConfiguration") & 1) != 0
    || objc_msgSend(v9, "isManagingEntitlementConfiguration"))
  {
    if ((_DWORD)v20)
      v21 = CFSTR("SHARED_ENTITLEMENT_ENABLED");
    else
      v21 = CFSTR("SHARED_ENTITLEMENT_DISABLED");
    PKLocalizedShareableCredentialString(&v21->isa);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3578]), "initWithText:", v22);
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4938]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFont:", v24);

    objc_msgSend(v19, "addObject:", v23);
    v25 = objc_alloc_init(MEMORY[0x1E0DC3568]);
    objc_msgSend(v19, "addObject:", v25);

LABEL_9:
    goto LABEL_10;
  }
  if (!-[PKPassEntitlementsComposer editable](self->_entitlementComposer, "editable"))
    goto LABEL_10;
  v27 = objc_msgSend(v8, "displayStyle");
  if (v27)
  {
    if (v27 == 2)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0DC3548]);
      objc_msgSend(v22, "setReservedLayoutWidth:", *MEMORY[0x1E0DC4890]);
      if ((v20 & 1) == 0)
        objc_msgSend(v22, "setHidden:", 1);
      objc_msgSend(v19, "addObject:", v22);
      goto LABEL_9;
    }
    if (v27 == 1)
    {
      v28 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
      objc_msgSend(v28, "setOn:", v20);
      objc_msgSend(v8, "entitlementIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "hash");

      objc_msgSend(v28, "setTag:", v30);
      toggleTags = self->_toggleTags;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](toggleTags, "setObject:forKey:", v7, v32);

      objc_msgSend(v28, "addTarget:action:forControlEvents:", self, sel_toggleValueChanged_, 4096);
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v28, 1);
      objc_msgSend(v33, "setMaintainsFixedSize:", 1);
      objc_msgSend(v19, "addObject:", v33);

    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "entitlementIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412290;
      v37 = v35;
      _os_log_impl(&dword_19D178000, v34, OS_LOG_TYPE_DEFAULT, "Disabling entitlement %@ due to unknown display style", (uint8_t *)&v36, 0xCu);

    }
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);
  }
LABEL_10:
  objc_msgSend(v6, "setAccessories:", v19);

  return v10;
}

void __84__PKPassEntitlementSelectionSectionController_decorateListCell_forEntitlementEntry___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v5, "setBackgroundConfiguration:", v6);
}

- (void)toggleValueChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_toggleTags, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PKPassEntitlementSelectionSectionController didSelectItem:](self, "didSelectItem:", v6);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Error: Did not find matching entitlement for toggle", v8, 2u);
    }

    objc_msgSend(v4, "setOn:", objc_msgSend(v4, "isOn") ^ 1);
  }

}

- (void)didSelectItem:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  int v7;
  void *v8;
  PKPassEntitlementSelectionSectionControllerDelegate **p_delegate;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "displayableEntitlement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassEntitlementsComposer viewFor:](self->_entitlementComposer, "viewFor:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isManagingTimeConfiguration") & 1) != 0
    || objc_msgSend(v5, "isManagingEntitlementConfiguration"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "showAdvancedScheduleSelectionFlowForEntitlementEntry:", v12);
  }
  else
  {
    if (!-[PKPassEntitlementsComposer editable](self->_entitlementComposer, "editable"))
      goto LABEL_5;
    v7 = objc_msgSend(v5, "enabled");
    if ((v7 & 1) == 0)
    {
      if (objc_msgSend(v5, "maxSelectionCount") == 1)
        -[PKPassEntitlementSelectionSectionController _clearEntitlementSelectionAnimated:](self, "_clearEntitlementSelectionAnimated:", 1);
      if (objc_msgSend(v4, "clearGroupWhenSelected"))
      {
        objc_msgSend(v4, "localizedGroup");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPassEntitlementSelectionSectionController _clearEntitlementSelectionInGroup:animated:](self, "_clearEntitlementSelectionInGroup:animated:", v8, 1);

      }
    }
    objc_msgSend(v5, "setEnabled:", v7 ^ 1u);
    p_delegate = &self->_delegate;
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "reloadItem:animated:", v12, 1);

    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "deselectCells");

    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "entitlementSelectionDidChange");
  }

LABEL_5:
}

- (void)_clearEntitlementSelectionInGroup:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_groupedEntitlements, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[PKPassEntitlementsComposer viewFor:](self->_entitlementComposer, "viewFor:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setEnabled:", 0);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "reloadItem:animated:", v11, v4);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)_clearEntitlementSelectionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKPassEntitlementsComposer entitlementEntries](self->_entitlementComposer, "entitlementEntries", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "reloadItem:animated:", v11, v3);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "length")
    || (v4 = (__CFString *)v3, v4 == CFSTR("Default"))
    || (v5 = v4) != 0
    && (v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("Default")), v5, (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    v13[0] = *MEMORY[0x1E0DC1138];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v13[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithString:attributes:", v5, v11);

  }
  return v7;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v8;

  v4 = a3;
  -[PKPassEntitlementsComposer viewFor:](self->_entitlementComposer, "viewFor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isManagingTimeConfiguration") & 1) != 0
    || (objc_msgSend(v5, "isManagingEntitlementConfiguration") & 1) != 0)
  {
    v6 = 1;
  }
  else if (-[PKPassEntitlementsComposer editable](self->_entitlementComposer, "editable"))
  {
    objc_msgSend(v4, "displayableEntitlement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "displayStyle") == 2;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  -[NSDictionary objectForKeyedSubscript:](self->_groupedEntitlements, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_groupedEntitlements, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItems:", v8);

  }
  return v6;
}

- (PKPassEntitlementSelectionSectionControllerDelegate)delegate
{
  return (PKPassEntitlementSelectionSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
  objc_storeStrong((id *)&self->_toggleTags, 0);
  objc_storeStrong((id *)&self->_groupedEntitlements, 0);
}

@end
