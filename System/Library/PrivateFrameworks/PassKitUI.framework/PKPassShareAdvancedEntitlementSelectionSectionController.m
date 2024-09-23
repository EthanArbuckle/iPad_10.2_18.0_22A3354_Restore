@implementation PKPassShareAdvancedEntitlementSelectionSectionController

- (PKPassShareAdvancedEntitlementSelectionSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  void *v11;
  PKPassShareAdvancedEntitlementSelectionSectionController *v12;
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
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v24[0] = CFSTR("AdvancedEntitlementSelection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)PKPassShareAdvancedEntitlementSelectionSectionController;
  v12 = -[PKPassShareSectionController initWithIdentifiers:](&v23, sel_initWithIdentifiers_, v11);

  if (v12)
  {
    v12->_mode = a3;
    objc_storeStrong((id *)&v12->_entitlementComposer, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_initWeak(&location, v12);
    v13 = (void *)MEMORY[0x1E0DC35C8];
    v14 = objc_opt_class();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __102__PKPassShareAdvancedEntitlementSelectionSectionController_initWithMode_entitlementComposer_delegate___block_invoke;
    v20 = &unk_1E3E62748;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v13, "registrationWithCellClass:configurationHandler:", v14, &v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v12, "setCellRegistration:", v15, v17, v18, v19, v20);

    -[PKPassShareAdvancedEntitlementSelectionSectionController reloadItemsAnimated:](v12, "reloadItemsAnimated:", 0);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __102__PKPassShareAdvancedEntitlementSelectionSectionController_initWithMode_entitlementComposer_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

- (void)reloadItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  PKSharePreviewRowItem *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("AdvancedEntitlementSelection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupListSectionController setIdentifiers:](self, "setIdentifiers:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = -[PKSharePreviewRowItem initWithIdentifier:]([PKSharePreviewRowItem alloc], "initWithIdentifier:", CFSTR("SelectAdvanced"));
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("gearshape.2.fill"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharePreviewRowItem setIcon:](v7, "setIcon:", v8);

  PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_PREDEFINED_SELECT_ADVANCED_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharePreviewRowItem setTitle:](v7, "setTitle:", v9);

  -[PKSharePreviewRowItem setDisplayChevron:](v7, "setDisplayChevron:", 1);
  objc_msgSend(v6, "addObject:", v7);
  -[PKPaymentSetupListSectionController setItems:](self, "setItems:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataAnimated:", v3);

}

- (id)decorateListCell:(id)a3 forRowItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  objc_msgSend(v6, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSecondaryText:", v9);

  objc_msgSend(v7, "secondaryTextProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v11);

  objc_msgSend(v7, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  objc_msgSend(v6, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "icon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v13);

    objc_msgSend(v7, "imageProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v15);

  }
  objc_msgSend(v5, "setContentConfiguration:", v7);
  objc_msgSend(v5, "setConfigurationUpdateHandler:", &__block_literal_global_217);
  if (objc_msgSend(v6, "displayChevron") && (v16 = objc_alloc_init(MEMORY[0x1E0DC3568])) != 0)
  {
    v17 = v16;
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessories:", v18);

  }
  else
  {
    objc_msgSend(v5, "setAccessories:", MEMORY[0x1E0C9AA60]);
  }

  return v7;
}

void __88__PKPassShareAdvancedEntitlementSelectionSectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)footerAttributedStringForIdentifier:(id)a3
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
  PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_PREDEFINED_SELECT_ADVANCED_FOOTER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  v10[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4900]);
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

- (void)didSelectItem:(id)a3
{
  PKPassShareAdvancedEntitlementSelectionSectionControllerDelegate **p_delegate;
  id WeakRetained;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didTapAdvancedEntitlementSelectionSectionController:", self);

  v6 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v6, "deselectCells");

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end
