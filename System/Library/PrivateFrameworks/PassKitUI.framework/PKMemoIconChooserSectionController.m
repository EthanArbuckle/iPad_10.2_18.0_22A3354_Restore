@implementation PKMemoIconChooserSectionController

- (PKMemoIconChooserSectionController)initWithDelegate:(id)a3 mode:(unint64_t)a4 memo:(id)a5
{
  id v8;
  id v9;
  PKMemoIconChooserSectionController *v10;
  PKMemoIconChooserSectionController *v11;
  NSMutableArray *v12;
  NSMutableArray *items;
  PKMemoItem *v14;
  PKMemoItem *addNewItem;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  NSMutableArray *v21;
  PKMemoItem *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  NSMutableArray *v30;
  PKMemoItem *v31;
  void *v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v43.receiver = self;
  v43.super_class = (Class)PKMemoIconChooserSectionController;
  v10 = -[PKMemoIconChooserSectionController init](&v43, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11->_mode = a4;
    v11->_style = 1;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = v11->_items;
    v11->_items = v12;

    if (a4 == 1)
    {
      v34 = v8;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      PKPeerPaymentRecurringPaymentMemoColors();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            v29 = objc_alloc_init(MEMORY[0x1E0D67458]);
            objc_msgSend(v29, "setColor:", objc_msgSend(v28, "integerValue"));
            v30 = v11->_items;
            v31 = -[PKMemoItem initWithMemo:type:]([PKMemoItem alloc], "initWithMemo:type:", v29, 0);
            -[NSMutableArray addObject:](v30, "addObject:", v31);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v25);
      }

      -[NSMutableArray firstObject](v11->_items, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "memo");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMemoIconChooserSectionController setMemoSelection:](v11, "setMemoSelection:", v32);

      v8 = v34;
      goto LABEL_20;
    }
    if (!a4)
    {
      -[PKMemoIconChooserSectionController setMemoSelection:](v11, "setMemoSelection:", v9);
      v14 = -[PKMemoItem initWithMemo:type:]([PKMemoItem alloc], "initWithMemo:type:", 0, 1);
      addNewItem = v11->_addNewItem;
      v11->_addNewItem = v14;

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      PKPeerPaymentRecurringPaymentMemoSuggestions();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v40 != v19)
              objc_enumerationMutation(v16);
            v21 = v11->_items;
            v22 = -[PKMemoItem initWithMemo:type:]([PKMemoItem alloc], "initWithMemo:type:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j), 0);
            -[NSMutableArray addObject:](v21, "addObject:", v22);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v18);
      }
LABEL_20:

    }
  }

  return v11;
}

- (void)reloadItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *items;
  PKMemoItem *v10;
  PKMemoItem *v11;
  id WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_items, "removeAllObjects");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  PKPeerPaymentRecurringPaymentMemoSuggestions();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        items = self->_items;
        v10 = [PKMemoItem alloc];
        v11 = -[PKMemoItem initWithMemo:type:](v10, "initWithMemo:type:", v8, 0, (_QWORD)v13);
        -[NSMutableArray addObject:](items, "addObject:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataForSectionIdentifier:animated:", CFSTR("chooser"), 1);

}

- (NSArray)identifiers
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("selectionPresent");
  v3[1] = CFSTR("selectionEmpty");
  v3[2] = CFSTR("chooser");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  void *v10;
  __CFString *v12;
  __CFString *v13;
  int v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t mode;
  void *v25;
  PKMemoItem *v26;
  PKMemoItem *selectionItem;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("chooser"))
    goto LABEL_21;
  if (!v7)
    goto LABEL_7;
  v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("chooser"));

  if (v9)
  {
LABEL_21:
    if (!self->_mode)
    {
      v28[0] = self->_addNewItem;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendItems:", v10);

    }
    objc_msgSend(v6, "appendItems:", self->_items);
    goto LABEL_7;
  }
  v12 = v8;
  if (v12 == CFSTR("selectionPresent")
    || (v13 = v12,
        v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("selectionPresent")),
        v13,
        v14))
  {
    -[PKMemoItem memo](self->_selectionItem, "memo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "emoji");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {

    }
    else
    {
      mode = self->_mode;

      if (mode != 1)
      {
LABEL_18:

        goto LABEL_7;
      }
    }
    selectionItem = self->_selectionItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &selectionItem, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItems:", v25);

    goto LABEL_18;
  }
  v17 = v13;
  if (v17 == CFSTR("selectionEmpty")
    || (v18 = v17,
        v19 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("selectionEmpty")),
        v18,
        v19))
  {
    -[PKMemoItem memo](self->_selectionItem, "memo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "emoji");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (!v22)
    {
      v26 = self->_selectionItem;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendItems:", v23);

    }
  }
LABEL_7:

  return v6;
}

- (id)cellRegistrationForItem:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  v4 = (void *)MEMORY[0x1E0DC35C8];
  v5 = objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PKMemoIconChooserSectionController_cellRegistrationForItem___block_invoke;
  v7[3] = &unk_1E3E7A630;
  v7[4] = self;
  objc_msgSend(v4, "registrationWithCellClass:configurationHandler:", v5, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __62__PKMemoIconChooserSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setItem:", a4);
  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  char v8;
  int v9;
  int v10;
  __CFString *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  id v20;
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
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  PKMemoIconChooserSectionController *v37;
  id v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  if (v6 == CFSTR("selectionPresent"))
    goto LABEL_4;
  if (v6)
  {
    v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("selectionPresent"));

    if ((v8 & 1) != 0)
    {
LABEL_4:
      v9 = 1;
      v10 = 1;
      goto LABEL_10;
    }
    v11 = v7;
    if (v11 == CFSTR("selectionEmpty"))
      v10 = 1;
    else
      v10 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("selectionEmpty"));
  }
  else
  {
    v10 = 0;
  }

  v9 = 0;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 & 1) != 0)
  {
    v13 = 96.0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_itemSizeForStyle:", self->_style);
    v13 = v14;
  }
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v13);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v10)
    v17 = v12;
  else
    v17 = (void *)v15;
  v18 = (objc_class *)MEMORY[0x1E0C99DE8];
  v19 = v17;
  v20 = objc_alloc_init(v18);
  v37 = self;
  v39 = v20;
  if (v9 && !self->_mode)
  {
    objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 26.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v21, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3328], "layoutAnchorWithEdges:absoluteOffset:", 0, v13 * 0.5 + -5.2, -(v13 * 0.5 + -5.2));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3380], "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v22, CFSTR("dismissItem"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v24);

    v20 = v39;
  }
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v19, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:supplementaryItems:", v25, v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v12, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0DC3350];
  v40[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "horizontalGroupWithLayoutSize:subitems:", v27, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3378], "flexibleSpacing:", 20.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setInterItemSpacing:", v31);

  }
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setContentInsetsReference:", 1);
  if (v10)
  {
    -[PKMemoIconChooserSectionController _selectionPreviewTopSpacing](v37, "_selectionPreviewTopSpacing");
    v34 = v33;
    -[PKMemoIconChooserSectionController _selectionPreviewBottomSpacing](v37, "_selectionPreviewBottomSpacing");
    objc_msgSend(v32, "setContentInsets:", v34, 0.0, v35, 0.0);
  }
  else
  {
    objc_msgSend(v32, "setContentInsets:", 0.0, 20.0, 0.0, 20.0);
    objc_msgSend(v32, "setInterGroupSpacing:", 16.0);
  }

  return v32;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id location;
  void *v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = a4;
  v30 = a5;
  v9 = v8;
  objc_msgSend(v9, "backgroundConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v9, "defaultBackgroundConfiguration");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 26.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v16;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configurationWithPaletteColors:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configurationByApplyingConfiguration:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v21);
  objc_msgSend(v13, "setImageContentMode:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStrokeColor:", v22);

  objc_msgSend(v13, "setStrokeWidth:", 1.5);
  objc_msgSend(v13, "setCornerRadius:", 13.0);
  objc_msgSend(v9, "setBackgroundConfiguration:", v13);
  objc_initWeak(&location, self);
  v23 = objc_alloc(MEMORY[0x1E0DC3518]);
  v24 = (void *)MEMORY[0x1E0DC3428];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __103__PKMemoIconChooserSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke;
  v31[3] = &unk_1E3E659D0;
  objc_copyWeak(&v32, &location);
  v31[4] = self;
  objc_msgSend(v24, "actionWithHandler:", v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v23, "initWithFrame:primaryAction:", v25, 0.0, 0.0, 26.0, 26.0);

  objc_msgSend(v26, "setConfigurationUpdateHandler:", &__block_literal_global_234);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v26, 0);
  objc_msgSend(v9, "setIndentsAccessories:", 0);
  v34 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessories:", v28);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

void __103__PKMemoIconChooserSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "setMemoSelection:", 0);
    v3 = objc_loadWeakRetained(v5 + 1);
    objc_msgSend(v3, "didSelectItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

    v4 = objc_loadWeakRetained(v5 + 1);
    objc_msgSend(v4, "deselectCells");

    WeakRetained = v5;
  }

}

uint64_t __103__PKMemoIconChooserSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -20.0, -20.0, -20.0, -20.0);
}

- (void)didSelectItem:(id)a3
{
  uint64_t v4;
  void *v5;
  PKMemoItem *WeakRetained;
  id v7;
  void *v8;
  PKMemoItem *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "type");
  if ((unint64_t)(v4 - 2) >= 2)
  {
    if (v4 != 1)
    {
      if (!v4)
      {
        objc_msgSend(v12, "memo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMemoIconChooserSectionController setMemoSelection:](self, "setMemoSelection:", v5);

        WeakRetained = (PKMemoItem *)objc_loadWeakRetained((id *)&self->_delegate);
        -[PKMemoItem didSelectItem:](WeakRetained, "didSelectItem:", v12);
LABEL_8:

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "didSelectItem:", v12);

  }
  -[PKMemoItem memo](self->_selectionItem, "memo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [PKMemoItem alloc];
    -[PKMemoItem memo](self->_selectionItem, "memo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = -[PKMemoItem initWithMemo:type:](v9, "initWithMemo:type:", v10, 0);

    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "selectCellForItem:", WeakRetained);

    goto LABEL_8;
  }
LABEL_9:

}

- (id)contextMenuConfigurationForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_msgSend(v4, "memo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_mode)
  {
    objc_msgSend(v5, "emoji");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v6, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (!v11)
      {
        objc_initWeak(&location, self);
        v12 = (void *)MEMORY[0x1E0DC36B8];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __70__PKMemoIconChooserSectionController_contextMenuConfigurationForItem___block_invoke;
        v13[3] = &unk_1E3E796F8;
        objc_copyWeak(&v15, &location);
        v14 = v6;
        objc_msgSend(v12, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
        goto LABEL_3;
      }
    }
    else
    {

    }
  }
  v7 = 0;
LABEL_3:

  return v7;
}

id __70__PKMemoIconChooserSectionController_contextMenuConfigurationForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedPeerPaymentRecurringString(CFSTR("MEMO_PICKER_REMOVE_ICON"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("minus.circle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __70__PKMemoIconChooserSectionController_contextMenuConfigurationForItem___block_invoke_2;
  v15 = &unk_1E3E659D0;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAttributes:", 2, v12, v13, v14, v15);
  v8 = (void *)MEMORY[0x1E0DC39D0];
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuWithTitle:children:", &stru_1E3E7D690, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  return v10;
}

void __70__PKMemoIconChooserSectionController_contextMenuConfigurationForItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKPeerPaymentRemoveRecurringPaymentRecentMemoIcon();
    objc_msgSend(WeakRetained, "reloadItems");
  }

}

- (void)cell:(id)a3 didUpdateText:(id)a4
{
  PKMemoIconChooserSectionControllerDelegate **p_delegate;
  id v6;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "cell:didUpdateText:", v7, v6);

}

- (double)_selectionPreviewTopSpacing
{
  double result;

  result = 0.0;
  if (self->_style - 1 < 2)
    return 16.0;
  return result;
}

- (double)_selectionPreviewBottomSpacing
{
  double result;

  result = 60.0;
  if (self->_style - 1 >= 2)
    return 20.0;
  return result;
}

+ (double)_itemSizeForStyle:(unint64_t)a3
{
  double result;

  result = 68.0;
  if (a3 == 1)
    result = 73.0;
  if (a3 == 2)
    return 81.0;
  return result;
}

+ (double)_minimumWidthForStyle:(unint64_t)a3
{
  double v3;

  objc_msgSend(a1, "_itemSizeForStyle:", a3);
  return v3 * 4.0 + 40.0 + 60.0;
}

+ (unint64_t)suggestedStyleForAvailableWidth:(double)a3
{
  double v5;
  double v6;

  objc_msgSend(a1, "_minimumWidthForStyle:", 1);
  if (v5 >= a3)
    return 0;
  objc_msgSend(a1, "_minimumWidthForStyle:", 2);
  if (v6 >= a3)
    return 1;
  else
    return 2;
}

- (id)selectedMemo
{
  void *v2;
  void *v3;

  -[PKMemoItem memo](self->_selectionItem, "memo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(v3, "setText:", 0);
  return v3;
}

- (void)addMemo:(id)a3
{
  id v4;
  id WeakRetained;
  PKMemoItem *v6;

  v4 = a3;
  v6 = -[PKMemoItem initWithMemo:type:]([PKMemoItem alloc], "initWithMemo:type:", v4, 0);

  -[NSMutableArray insertObject:atIndex:](self->_items, "insertObject:atIndex:", v6, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataForSectionIdentifier:animated:", CFSTR("chooser"), 1);

}

- (void)setMemoSelection:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  unint64_t mode;
  PKMemoItem *v8;
  void *v9;
  id v10;
  PKMemoItem *v11;
  PKMemoItem *v12;
  PKMemoItem *selectionItem;
  PKMemoItem *v14;
  PKMemoItem *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  PKMemoIconChooserSectionControllerDelegate **p_delegate;
  id WeakRetained;
  id v22;

  v22 = a3;
  -[PKMemoItem memo](self->_selectionItem, "memo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = 1;
  else
    v6 = self->_mode == 1;

  mode = self->_mode;
  if (mode == 1)
  {
    -[PKMemoItem memo](self->_selectionItem, "memo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "setColor:", objc_msgSend(v22, "color"));
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0D67458]);
      objc_msgSend(v10, "setColor:", objc_msgSend(v22, "color"));
      selectionItem = self->_selectionItem;
      if (selectionItem)
      {
        -[PKMemoItem setMemo:](selectionItem, "setMemo:", v10);
      }
      else
      {
        v14 = -[PKMemoItem initWithMemo:type:]([PKMemoItem alloc], "initWithMemo:type:", v10, 2);
        v15 = self->_selectionItem;
        self->_selectionItem = v14;

      }
    }

  }
  else if (!mode)
  {
    v8 = self->_selectionItem;
    if (v8)
    {
      -[PKMemoItem setMemo:](v8, "setMemo:", v22);
      -[PKMemoItem setType:](self->_selectionItem, "setType:", 3);
    }
    else
    {
      v11 = -[PKMemoItem initWithMemo:type:]([PKMemoItem alloc], "initWithMemo:type:", v22, 3);
      v12 = self->_selectionItem;
      self->_selectionItem = v11;

    }
  }
  -[PKMemoItem memo](self->_selectionItem, "memo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "emoji");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "length"))
  {
    v19 = self->_mode;

    if (v6 == (v19 == 1))
    {
      if (v19 != 1)
        goto LABEL_23;
      goto LABEL_17;
    }
LABEL_21:
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "reloadDataForSectionIdentifier:animated:", CFSTR("selectionPresent"), 0);

    v18 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v18, "reloadDataForSectionIdentifier:animated:", CFSTR("selectionEmpty"), 0);
    goto LABEL_22;
  }

  if (!v6)
    goto LABEL_21;
LABEL_17:
  v18 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v18, "reloadItem:animated:", self->_selectionItem, 0);
LABEL_22:

LABEL_23:
}

- (void)setStyle:(unint64_t)a3
{
  id WeakRetained;

  self->_style = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "invalidateLayout");

}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionItem, 0);
  objc_storeStrong((id *)&self->_addNewItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
