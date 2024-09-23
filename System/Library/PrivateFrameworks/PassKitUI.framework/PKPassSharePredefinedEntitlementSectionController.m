@implementation PKPassSharePredefinedEntitlementSectionController

- (PKPassSharePredefinedEntitlementSectionController)init
{

  return 0;
}

- (PKPassSharePredefinedEntitlementSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PKPassSharePredefinedEntitlementSectionController *v11;
  PKPassSharePredefinedEntitlementSectionController *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, void *);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKPassSharePredefinedEntitlementSectionController;
  v11 = -[PKPassShareSectionController initWithIdentifiers:](&v23, sel_initWithIdentifiers_, &unk_1E3FAE758);
  v12 = v11;
  if (v11)
  {
    v11->_mode = a3;
    objc_storeStrong((id *)&v11->_entitlementComposer, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_initWeak(&location, v12);
    v13 = (void *)MEMORY[0x1E0DC35C8];
    v14 = objc_opt_class();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __95__PKPassSharePredefinedEntitlementSectionController_initWithMode_entitlementComposer_delegate___block_invoke;
    v20 = &unk_1E3E62748;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v13, "registrationWithCellClass:configurationHandler:", v14, &v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v12, "setCellRegistration:", v15, v17, v18, v19, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __95__PKPassSharePredefinedEntitlementSectionController_initWithMode_entitlementComposer_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
    v8 = (id)objc_msgSend(WeakRetained, "decorateListCell:forPredefinedSelectionEntry:", v9, v6);

  }
}

- (id)decorateListCell:(id)a3 forPredefinedSelectionEntry:(id)a4
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
  int v19;
  id v20;
  id v21;
  void *v22;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "predefinedSelection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  objc_msgSend(v8, "localizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSecondaryText:", v11);

  objc_msgSend(v9, "secondaryTextProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setColor:", v13);

  objc_msgSend(v9, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  objc_msgSend(v8, "iconName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v8, "iconName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "systemImageNamed:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v17);

  }
  objc_msgSend(v7, "setContentConfiguration:", v9);
  objc_msgSend(v7, "setConfigurationUpdateHandler:", &__block_literal_global_91);
  -[PKPassEntitlementsComposer viewForPredefined:](self->_entitlementComposer, "viewForPredefined:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "enabled");
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = objc_alloc_init(MEMORY[0x1E0DC3548]);
  objc_msgSend(v21, "setReservedLayoutWidth:", *MEMORY[0x1E0DC4890]);
  objc_msgSend(v21, "setHidden:", v19 ^ 1u);
  objc_msgSend(v20, "addObject:", v21);

  v22 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v7, "setAccessories:", v22);

  return v9;
}

void __98__PKPassSharePredefinedEntitlementSectionController_decorateListCell_forPredefinedSelectionEntry___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)didSelectItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  if (-[PKPassEntitlementsComposer editable](self->_entitlementComposer, "editable"))
  {
    -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 0);

    -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsManagingEntitlementConfiguration:", 1);

    -[PKPassEntitlementsComposer viewForPredefined:](self->_entitlementComposer, "viewForPredefined:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", objc_msgSend(v6, "enabled") ^ 1);
    -[PKPassSharePredefinedEntitlementSectionController _selectionDidChange](self, "_selectionDidChange");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "deselectCells");

  }
}

- (void)_selectionDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKPassEntitlementsComposer predefinedEntitlementEntries](self->_entitlementComposer, "predefinedEntitlementEntries", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "reloadItem:animated:", v8, 1);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v10, "entitlementSelectionDidChange");

}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_PREDEFINED_SECTION_HEADER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  v10[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", v3, v7);

  return v8;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return -[PKPassEntitlementsComposer editable](self->_entitlementComposer, "editable", a3);
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  void *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  -[PKPassEntitlementsComposer predefinedEntitlementEntries](self->_entitlementComposer, "predefinedEntitlementEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendItems:", v6);

  return v5;
}

- (PKPassSharePredefinedEntitlementSectionControllerDelegate)delegate
{
  return (PKPassSharePredefinedEntitlementSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end
