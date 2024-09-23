@implementation PKPaymentSetupListSectionController

- (PKPaymentSetupListSectionController)initWithIdentifiers:(id)a3
{
  id v5;
  PKPaymentSetupListSectionController *v6;
  PKPaymentSetupListSectionController *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  UICollectionViewCellRegistration *cellRegistration;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupListSectionController;
  v6 = -[PKPaymentSetupListSectionController init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifiers, a3);
    *(_OWORD *)&v7->_headerDirectionalLayoutMargins.top = xmmword_19DF16A10;
    *(_OWORD *)&v7->_headerDirectionalLayoutMargins.bottom = xmmword_19DF16A10;
    objc_initWeak(&location, v7);
    v8 = (void *)MEMORY[0x1E0DC35C8];
    v9 = objc_opt_class();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__PKPaymentSetupListSectionController_initWithIdentifiers___block_invoke;
    v13[3] = &unk_1E3E62748;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v8, "registrationWithCellClass:configurationHandler:", v9, v13);
    v10 = objc_claimAutoreleasedReturnValue();
    cellRegistration = v7->_cellRegistration;
    v7->_cellRegistration = (UICollectionViewCellRegistration *)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __59__PKPaymentSetupListSectionController_initWithIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
    v8 = (id)objc_msgSend(WeakRetained, "decoratePaymentSetListCell:forItem:", v9, v6);

  }
}

- (PKPaymentSetupListSectionController)init
{
  id v3;
  void *v4;
  void *v5;
  PKPaymentSetupListSectionController *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPaymentSetupListSectionController initWithIdentifiers:](self, "initWithIdentifiers:", v5);

  return v6;
}

- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v34;
  void *v35;
  void *v36;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
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

  objc_msgSend(v7, "directionalLayoutMargins");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v5, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  v18 = 10.0;
  if (v17 == 6)
    v18 = 12.0;
  objc_msgSend(v7, "setDirectionalLayoutMargins:", v18, v13, v18, v15);
  objc_msgSend(v6, "icon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v19);

  objc_msgSend(v7, "imageProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityIgnoresInvertColors:", 1);
  objc_msgSend(v5, "setContentConfiguration:", v7);
  objc_msgSend(v6, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v21);

  objc_msgSend(v5, "setConfigurationUpdateHandler:", &__block_literal_global_140);
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "badgeText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    +[PKCellAccessoryBadge accessoryBadgeWithTitle:](PKCellAccessoryBadge, "accessoryBadgeWithTitle:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v24);

  }
  objc_msgSend(v6, "labelText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3578]), "initWithText:", v25);
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4938]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v27);

    objc_msgSend(v22, "addObject:", v26);
  }
  if (objc_msgSend(v6, "loadingIndicatorVisible"))
  {
    +[PKCellAccessoryLoadingIndicator accessory](PKCellAccessoryLoadingIndicator, "accessory");
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "displayChevron"))
    {
      v29 = (objc_class *)MEMORY[0x1E0DC3568];
    }
    else
    {
      if (objc_msgSend(v6, "displayInfo"))
      {
        v34 = objc_alloc(MEMORY[0x1E0DC3890]);
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("info.circle"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v34, "initWithImage:", v35);

        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v36, 1);
        goto LABEL_13;
      }
      if (!objc_msgSend(v6, "selected") || (objc_msgSend(v6, "useMultiSelectAccessory") & 1) != 0)
      {
        v30 = 0;
        goto LABEL_13;
      }
      v29 = (objc_class *)MEMORY[0x1E0DC3548];
    }
    v28 = objc_alloc_init(v29);
  }
  v30 = v28;
LABEL_13:
  objc_msgSend(v22, "safelyAddObject:", v30);
  objc_msgSend(v30, "setReservedLayoutWidth:", *MEMORY[0x1E0DC4890]);
  if (objc_msgSend(v6, "reserverSpaceForSelectedAccessory") && !objc_msgSend(v22, "count"))
  {
    v31 = objc_alloc_init(MEMORY[0x1E0DC3548]);
    objc_msgSend(v31, "setHidden:", 1);
    objc_msgSend(v31, "setIsAccessibilityElement:", 0);
    objc_msgSend(v22, "addObject:", v31);

  }
  if (objc_msgSend(v6, "useMultiSelectAccessory"))
  {
    +[PKCellAccessoryMultiSelectIndicator accessoryWithSelected:](PKCellAccessoryMultiSelectIndicator, "accessoryWithSelected:", objc_msgSend(v6, "selected"));
    v32 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "safelyAddObject:", v32);
    v30 = (void *)v32;
  }
  objc_msgSend(v5, "setAccessories:", v22);

  return v7;
}

void __74__PKPaymentSetupListSectionController_decoratePaymentSetListCell_forItem___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)defaultListLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (id)footerAttributedStringForIdentifier:(id)a3
{
  return 0;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  return 0;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  void *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v6 = v5;
  if (self->_items)
    objc_msgSend(v5, "appendItems:");
  return v6;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[PKPaymentSetupListSectionController defaultListLayout](self, "defaultListLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupListSectionController headerAttributedStringForIdentifier:](self, "headerAttributedStringForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "setHeaderMode:", 1);
  -[PKPaymentSetupListSectionController footerAttributedStringForIdentifier:](self, "footerAttributedStringForIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "setFooterMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if ((id)*MEMORY[0x1E0DC48A8] == v8)
  {
    -[PKPaymentSetupListSectionController headerAttributedStringForIdentifier:](self, "headerAttributedStringForIdentifier:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v11 = (void *)v13;
      objc_msgSend(MEMORY[0x1E0DC39A8], "plainHeaderConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttributedText:", v11);
      objc_msgSend(v12, "setDirectionalLayoutMargins:", self->_headerDirectionalLayoutMargins.top, self->_headerDirectionalLayoutMargins.leading, self->_headerDirectionalLayoutMargins.bottom, self->_headerDirectionalLayoutMargins.trailing);
      goto LABEL_7;
    }
  }
  else if ((id)*MEMORY[0x1E0DC48A0] == v8)
  {
    -[PKPaymentSetupListSectionController footerAttributedStringForIdentifier:](self, "footerAttributedStringForIdentifier:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(MEMORY[0x1E0DC39A8], "plainFooterConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttributedText:", v11);
LABEL_7:
      objc_msgSend(v14, "setContentConfiguration:", v12);

    }
  }

}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_cellRegistration, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSDirectionalEdgeInsets)headerDirectionalLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_headerDirectionalLayoutMargins.top;
  leading = self->_headerDirectionalLayoutMargins.leading;
  bottom = self->_headerDirectionalLayoutMargins.bottom;
  trailing = self->_headerDirectionalLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setHeaderDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  self->_headerDirectionalLayoutMargins = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
