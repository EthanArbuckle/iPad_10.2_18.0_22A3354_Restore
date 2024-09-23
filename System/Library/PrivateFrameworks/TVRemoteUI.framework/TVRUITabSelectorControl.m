@implementation TVRUITabSelectorControl

- (TVRUITabSelectorControl)initWithItems:(id)a3
{
  id v4;
  TVRUITabSelectorControl *v5;
  void *v6;
  uint64_t v7;
  NSArray *items;
  NSString *previousSelectedItem;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRUITabSelectorControl;
  v5 = -[TVRUITabSelectorControl init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "array");
    v7 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v7;

    v5->_prefersCenteredItems = 1;
    previousSelectedItem = v5->_previousSelectedItem;
    v5->_previousSelectedItem = 0;

    -[TVRUITabSelectorControl _configure](v5, "_configure");
    -[TVRUITabSelectorControl _updateFromItemsAnimated:](v5, "_updateFromItemsAnimated:", 0);
    if (objc_msgSend(v4, "count"))
      -[TVRUITabSelectorControl setSelectedIndex:](v5, "setSelectedIndex:", 0);

  }
  return v5;
}

- (void)setItems:(id)a3
{
  -[TVRUITabSelectorControl updateItems:animated:](self, "updateItems:animated:", a3, 0);
}

- (void)updateItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *v6;
  NSArray *items;
  id v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  self->_items = v6;

  -[TVRUITabSelectorControl _updateFromItemsAnimated:](self, "_updateFromItemsAnimated:", v4);
}

- (void)setSelectedIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[TVRUITabSelectorControl items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[TVRUITabSelectorControl collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectItemAtIndexPath:animated:scrollPosition:", v8, 0, 0);

    -[TVRUITabSelectorControl items](self, "items");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") <= a3)
    {
      -[TVRUITabSelectorControl setPreviousSelectedItem:](self, "setPreviousSelectedItem:", 0);
    }
    else
    {
      -[TVRUITabSelectorControl items](self, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUITabSelectorControl setPreviousSelectedItem:](self, "setPreviousSelectedItem:", v10);

    }
  }
}

- (unint64_t)selectedIndex
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[TVRUITabSelectorControl collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "item");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

+ (double)defaultHeight
{
  return 28.0;
}

- (void)_configure
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  TVRUITabSelectorControl *v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD460], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BEBD450]);
  -[TVRUITabSelectorControl _layout](self, "_layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  objc_msgSend(v6, "setDelegate:", self);
  v7 = objc_alloc(MEMORY[0x24BEBD480]);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __37__TVRUITabSelectorControl__configure__block_invoke_2;
  v26[3] = &unk_24DE2C740;
  v27 = v3;
  v25 = v3;
  v24 = (void *)objc_msgSend(v7, "initWithCollectionView:cellProvider:", v6, v26);
  v8 = self;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v9);

  objc_msgSend(v6, "setBouncesVertically:", 0);
  objc_msgSend(v6, "setClipsToBounds:", 0);
  -[TVRUITabSelectorControl addSubview:](v8, "addSubview:", v6);
  v18 = (void *)MEMORY[0x24BDD1628];
  -[TVRUITabSelectorControl leadingAnchor](v8, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  -[TVRUITabSelectorControl trailingAnchor](v8, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v10;
  -[TVRUITabSelectorControl topAnchor](v8, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v13;
  -[TVRUITabSelectorControl bottomAnchor](v8, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v17);

  -[TVRUITabSelectorControl setCollectionView:](v8, "setCollectionView:", v6);
  -[TVRUITabSelectorControl setDataSource:](v8, "setDataSource:", v24);

}

void __37__TVRUITabSelectorControl__configure__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a2, "label");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

uint64_t __37__TVRUITabSelectorControl__configure__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

- (id)_layout
{
  id v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BEBD468]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__TVRUITabSelectorControl__layout__block_invoke;
  v6[3] = &unk_24DE2C768;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithSectionProvider:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

id __34__TVRUITabSelectorControl__layout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  int v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = objc_msgSend(v8, "numberOfItems");
    v9 = *(void **)(a1 + 32);
    v59 = v8;
    objc_msgSend(v8, "itemIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_cellResolvedLayoutResultsForItems:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v65;
      v16 = 0.0;
      v17 = 0.0;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v65 != v15)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(v19, "resolvedLayoutSize");
          v16 = v16 + v20;
          objc_msgSend(v19, "resolvedLayoutSize");
          if (v21 > v17)
            v17 = v21;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      }
      while (v14);
    }
    else
    {
      v16 = 0.0;
      v17 = 0.0;
    }

    v23 = (double)(v62 - 1) * 10.0 + v16;
    objc_msgSend(v6, "setLayoutHeight:", v17);
    v61 = v4;
    objc_msgSend(v4, "container");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "effectiveContentSize");
    v26 = v25;

    v60 = v6;
    v27 = objc_msgSend(v6, "prefersCenteredItems");
    if (v23 < v26)
      v28 = v27;
    else
      v28 = 0;
    v63 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v29 = 0x24BEBD000uLL;
    if (v62 >= 1)
    {
      v30 = 0;
      v31 = (v26 - v23) * 0.5;
      do
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x24BEBD328];
        v34 = *(void **)(v29 + 768);
        objc_msgSend(v32, "resolvedLayoutSize");
        objc_msgSend(v34, "absoluteDimension:");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v29;
        objc_msgSend(*(id *)(v29 + 768), "absoluteDimension:", v17);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "sizeWithWidthDimension:heightDimension:", v35, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBD318], "itemWithLayoutSize:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v28 ^ 1;
        if (v30)
          v40 = 1;
        if ((v40 & 1) != 0)
        {
          v41 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD330], "fixedSpacing:", v31);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (v62 - 1 == v30)
          v42 = v28;
        else
          v42 = 0;
        if (v42 == 1)
        {
          objc_msgSend(MEMORY[0x24BEBD330], "fixedSpacing:", v31);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v43 = 0;
        }
        objc_msgSend(MEMORY[0x24BEBD308], "spacingForLeading:top:trailing:bottom:", v41, 0, v43, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setEdgeSpacing:", v44);
        objc_msgSend(v63, "addObject:", v39);

        ++v30;
        v29 = v36;
      }
      while (v62 != v30);
    }
    v45 = (void *)MEMORY[0x24BEBD328];
    v46 = *(void **)(v29 + 768);
    if ((v28 & 1) != 0)
      objc_msgSend(v46, "fractionalWidthDimension:", 1.0);
    else
      objc_msgSend(v46, "absoluteDimension:", v23);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v29 + 768), "absoluteDimension:", v17);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "sizeWithWidthDimension:heightDimension:", v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v61;

    if (!objc_msgSend(v63, "count"))
    {
      v50 = (void *)MEMORY[0x24BEBD318];
      v51 = (void *)MEMORY[0x24BEBD328];
      objc_msgSend(*(id *)(v29 + 768), "fractionalWidthDimension:", 1.0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v29 + 768), "fractionalHeightDimension:", 1.0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "sizeWithWidthDimension:heightDimension:", v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "itemWithLayoutSize:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v63, "addObject:", v55);
    }
    objc_msgSend(MEMORY[0x24BEBD310], "horizontalGroupWithLayoutSize:subitems:", v49, v63);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD330], "fixedSpacing:", 10.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setInterItemSpacing:", v57);

    objc_msgSend(MEMORY[0x24BEBD320], "sectionWithGroup:", v56);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v60;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)_updateFromItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a3;
  v9 = objc_alloc_init(MEMORY[0x24BEBD348]);
  objc_msgSend(v9, "appendSectionsWithIdentifiers:", &unk_24DE4DBE0);
  -[TVRUITabSelectorControl items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendItemsWithIdentifiers:", v5);

  -[TVRUITabSelectorControl dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySnapshot:animatingDifferences:", v9, v3);

  if (-[TVRUITabSelectorControl selectedIndex](self, "selectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TVRUITabSelectorControl items](self, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
      -[TVRUITabSelectorControl setSelectedIndex:](self, "setSelectedIndex:", 0);
  }

}

- (id)_cellResolvedLayoutResultsForItems:(id)a3
{
  id v4;
  double Height;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TVRUITabSelectorControlCell *v13;
  _TVRUITabSelectorControlCell *v14;
  void *v15;
  double v16;
  double v17;
  _TVRUITabSelectorControlCellLayoutResult *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVRUITabSelectorControl bounds](self, "bounds");
  Height = CGRectGetHeight(v26);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        v13 = [_TVRUITabSelectorControlCell alloc];
        v14 = -[_TVRUITabSelectorControlCell initWithFrame:](v13, "initWithFrame:", 0.0, 0.0, 20000.0, Height, (_QWORD)v20);
        -[_TVRUITabSelectorControlCell label](v14, "label");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setText:", v12);

        -[_TVRUITabSelectorControlCell systemLayoutSizeFittingSize:](v14, "systemLayoutSizeFittingSize:", 20000.0, Height);
        v18 = -[_TVRUITabSelectorControlCellLayoutResult initWithResolvedLayoutSize:]([_TVRUITabSelectorControlCellLayoutResult alloc], "initWithResolvedLayoutSize:", v16, v17);
        objc_msgSend(v6, "addObject:", v18);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  -[TVRUITabSelectorControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  -[TVRUITabSelectorControl delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_msgSend(v15, "item");
    -[TVRUITabSelectorControl previousSelectedItem](self, "previousSelectedItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      -[TVRUITabSelectorControl items](self, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUITabSelectorControl previousSelectedItem](self, "previousSelectedItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "indexOfObject:", v10);

    }
    else
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }

    -[TVRUITabSelectorControl delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tabSelectorControl:didSelectIndex:previousIndex:", self, v7, v11);

  }
  -[TVRUITabSelectorControl dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemIdentifierForIndexPath:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITabSelectorControl setPreviousSelectedItem:](self, "setPreviousSelectedItem:", v14);

}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)prefersCenteredItems
{
  return self->_prefersCenteredItems;
}

- (void)setPrefersCenteredItems:(BOOL)a3
{
  self->_prefersCenteredItems = a3;
}

- (double)layoutHeight
{
  return self->_layoutHeight;
}

- (void)setLayoutHeight:(double)a3
{
  self->_layoutHeight = a3;
}

- (TVRUITabSelectorControlDelegate)delegate
{
  return (TVRUITabSelectorControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSString)previousSelectedItem
{
  return self->_previousSelectedItem;
}

- (void)setPreviousSelectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_previousSelectedItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSelectedItem, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
