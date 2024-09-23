@implementation PKPaymentSetupProductsSectionController

- (PKPaymentSetupProductsSectionController)initWithProvisoningController:(id)a3
{
  id v5;
  PKPaymentSetupProductsSectionController *v6;
  PKPaymentSetupProductsSectionController *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *searchQueue;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSCharacterSet *tokenizerCharacterSet;
  void *v18;
  void *v19;
  uint64_t v20;
  NSLocale *currentLocale;
  char v22;
  void *v23;
  uint64_t v24;
  NSString *primaryCountryName;
  void *v26;
  uint64_t v27;
  NSString *secondaryCountryName;
  uint64_t v29;
  CLLocation *cachedLocation;
  objc_super v32;

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKPaymentSetupProductsSectionController;
  v6 = -[PKPaymentSetupListSectionController init](&v32, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_provisioningController, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.passkit.products.search", v8);
    searchQueue = v7->_searchQueue;
    v7->_searchQueue = (OS_dispatch_queue *)v9;

    v7->_iconSize = (CGSize)xmmword_19DF16F60;
    v11 = objc_alloc_init(MEMORY[0x1E0CB3780]);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "formUnionWithCharacterSet:", v12);

    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "formUnionWithCharacterSet:", v13);

    objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "formUnionWithCharacterSet:", v14);

    objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "formUnionWithCharacterSet:", v15);

    v16 = objc_msgSend(v11, "copy");
    tokenizerCharacterSet = v7->_tokenizerCharacterSet;
    v7->_tokenizerCharacterSet = (NSCharacterSet *)v16;

    objc_msgSend(v5, "webService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "targetDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v20 = objc_claimAutoreleasedReturnValue();
    currentLocale = v7->_currentLocale;
    v7->_currentLocale = (NSLocale *)v20;

    v22 = objc_opt_respondsToSelector();
    if ((v22 & 1) != 0)
    {
      objc_msgSend(v19, "cellularNetworkRegion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    objc_storeStrong((id *)&v7->_primaryRegion, v23);
    if ((v22 & 1) != 0)

    PKLocalizedStringForCountryCode();
    v24 = objc_claimAutoreleasedReturnValue();
    primaryCountryName = v7->_primaryCountryName;
    v7->_primaryCountryName = (NSString *)v24;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v19, "deviceRegion");
    else
      PKCurrentRegion();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_secondaryRegion, v26);

    PKLocalizedStringForCountryCode();
    v27 = objc_claimAutoreleasedReturnValue();
    secondaryCountryName = v7->_secondaryCountryName;
    v7->_secondaryCountryName = (NSString *)v27;

    objc_msgSend(v5, "cachedLocation");
    v29 = objc_claimAutoreleasedReturnValue();
    cachedLocation = v7->_cachedLocation;
    v7->_cachedLocation = (CLLocation *)v29;

  }
  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSDictionary objectForKey:](self->_sectionIdentifierToItemIdentifierMapping, "objectForKey:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[NSMutableDictionary objectForKey:](self->_itemIdentifierToItemMapping, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safelyAddObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v13, "appendItems:", v6);

  return v13;
}

- (id)identifiers
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_orderedSectionIdentifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_sectionIdentifierToItemIdentifierMapping, "objectForKey:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[PKPaymentSetupListSectionController defaultListLayout](self, "defaultListLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_showSectionHeaders)
    objc_msgSend(v6, "setHeaderMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (self->_showSectionHeaders)
  {
    v6 = (void *)MEMORY[0x1E0DC39A8];
    v7 = a5;
    v8 = a3;
    objc_msgSend(v6, "plainHeaderConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = *MEMORY[0x1E0DC1138];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B58], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v14[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v12);
    objc_msgSend(v9, "setAttributedText:", v13);

    objc_msgSend(v9, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
    objc_msgSend(v8, "setContentConfiguration:", v9);

  }
}

- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGSize *p_iconSize;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int, void *);
  void *v19;
  PKPaymentSetupProductsSectionController *v20;
  id v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentSetupProductsSectionController;
  -[PKPaymentSetupListSectionController decoratePaymentSetListCell:forItem:](&v22, sel_decoratePaymentSetListCell_forItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isLoadingIcon"))
    {
      objc_msgSend(v9, "setIsLoadingIcon:", 1);
      objc_msgSend(v9, "product");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __78__PKPaymentSetupProductsSectionController_decoratePaymentSetListCell_forItem___block_invoke;
      v19 = &unk_1E3E631A0;
      v20 = self;
      v21 = v10;
      objc_msgSend(v11, "thumbnailCachedImageForSize:completion:", &v16, self->_iconSize.width, self->_iconSize.height);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(v8, "setImage:", v12, v16, v17, v18, v19, v20);

    }
    objc_msgSend(v8, "imageProperties", v16, v17, v18, v19, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    p_iconSize = &self->_iconSize;
    objc_msgSend(v13, "setMaximumSize:", p_iconSize->width, p_iconSize->height);
    objc_msgSend(v13, "setReservedLayoutSize:", p_iconSize->width, p_iconSize->height);
    objc_msgSend(v13, "setCornerRadius:", 2.0);
    objc_msgSend(v6, "setContentConfiguration:", v8);

  }
  return v8;
}

void __78__PKPaymentSetupProductsSectionController_decoratePaymentSetListCell_forItem___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id WeakRetained;
  id v9;

  if (a3)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    v7 = a3;
    objc_msgSend(v6, "objectForKey:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsLoadingIcon:", 2);
    objc_msgSend(v9, "setIcon:", v7);

    if (a2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
      objc_msgSend(WeakRetained, "reloadItem:animated:", v9, 0);

    }
  }
}

- (void)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id WeakRetained;
  void *v11;
  char v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, char);
  void *v18;
  PKPaymentSetupProductsSectionController *v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __57__PKPaymentSetupProductsSectionController_didSelectItem___block_invoke;
  v18 = &unk_1E3E619E0;
  v19 = self;
  v6 = v5;
  v20 = v6;
  v7 = _Block_copy(&v15);
  self->_didHideLoadingIndicators = 0;
  objc_msgSend(v4, "identifier", v15, v16, v17, v18, v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("PKAddADifferentCardListItemIdentifier"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained;
  if (v9)
  {
    v12 = objc_msgSend(WeakRetained, "didSelectManualEntryWithCompletion:", v7);

    if ((v12 & 1) == 0)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(v4, "product");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "didSelectProduct:completion:", v13, v7);

    if (!v14)
      goto LABEL_7;
  }
  if (!self->_didHideLoadingIndicators)
    -[PKPaymentSetupProductsSectionController _updateItemWithIdentifier:loadingIndicatorVisibility:animated:](self, "_updateItemWithIdentifier:loadingIndicatorVisibility:animated:", v6, 1, 1);
LABEL_7:

}

uint64_t __57__PKPaymentSetupProductsSectionController_didSelectItem___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
    objc_msgSend(WeakRetained, "deselectCells");

  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateItemWithIdentifier:loadingIndicatorVisibility:animated:", *(_QWORD *)(a1 + 40), 0, 1);
}

- (void)_updateItemWithIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  BOOL v9;
  void *v10;
  NSMutableDictionary *itemIdentifierToItemMapping;
  void *v12;
  id WeakRetained;
  id v14;

  v5 = a5;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_itemIdentifierToItemMapping, "objectForKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14 = v8;
    v9 = objc_msgSend(v8, "loadingIndicatorVisible") == v6;
    v8 = v14;
    if (!v9)
    {
      v10 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v10, "setLoadingIndicatorVisible:", v6);
      itemIdentifierToItemMapping = self->_itemIdentifierToItemMapping;
      objc_msgSend(v10, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](itemIdentifierToItemMapping, "setObject:forKey:", v10, v12);

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "reloadItem:animated:", v10, v5);

      v8 = v14;
    }
  }

}

- (void)hideLoadingIndicatorsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  self->_didHideLoadingIndicators = 1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allKeys](self->_itemIdentifierToItemMapping, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[PKPaymentSetupProductsSectionController _updateItemWithIdentifier:loadingIndicatorVisibility:animated:](self, "_updateItemWithIdentifier:loadingIndicatorVisibility:animated:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0, v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)applySearchString:(id)a3
{
  id v4;
  void *v5;
  NSObject *searchQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  PKPaymentSetupProductsSectionController *v11;
  id v12;

  v4 = a3;
  v5 = (void *)-[NSMutableDictionary copy](self->_itemIdentifierToItemMapping, "copy");
  searchQueue = self->_searchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentSetupProductsSectionController_applySearchString___block_invoke;
  block[3] = &unk_1E3E61400;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(searchQueue, block);

}

void __61__PKPaymentSetupProductsSectionController_applySearchString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  id *v7;
  id *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = *(_QWORD **)(a1 + 40);
  +[PKPaymentSetupProductsSectionFactoryContext contextWithPrimaryRegion:primaryCountryName:secondaryRegion:secondaryCountryName:location:tokenizerCharacterSet:](PKPaymentSetupProductsSectionFactoryContext, "contextWithPrimaryRegion:primaryCountryName:secondaryRegion:secondaryCountryName:location:tokenizerCharacterSet:", v4[19], v4[20], v4[21], v4[22], v4[17], v4[14]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    v6 = *(_QWORD *)(a1 + 48);
    v22 = 0;
    v23 = 0;
    v7 = (id *)&v23;
    v8 = (id *)&v22;
    +[PKPaymentSetupProductsSectionMainFactory generateSectionsWithSearchFilter:forItems:withContext:outSectionIdentifierToItemIdentifierMapping:outOrderedSectionIdentifiers:](PKPaymentSetupProductsSectionMainFactory, "generateSectionsWithSearchFilter:forItems:withContext:outSectionIdentifierToItemIdentifierMapping:outOrderedSectionIdentifiers:", v6, v3, v5, &v23, &v22);
  }
  else
  {
    v20 = 0;
    v21 = 0;
    v7 = (id *)&v21;
    v8 = (id *)&v20;
    +[PKPaymentSetupProductsSectionMainFactory generateSectionsWithDefaultSortingForItems:withContext:outSectionIdentifierToItemIdentifierMapping:outOrderedSectionIdentifiers:](PKPaymentSetupProductsSectionMainFactory, "generateSectionsWithDefaultSortingForItems:withContext:outSectionIdentifierToItemIdentifierMapping:outOrderedSectionIdentifiers:", v3, v5, &v21, &v20);
  }
  v9 = *v7;
  v10 = *v8;
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(v11 + 88);
  *(_QWORD *)(v11 + 88) = v9;
  v13 = v9;

  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(v14 + 96);
  *(_QWORD *)(v14 + 96) = v10;
  v16 = v10;

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__PKPaymentSetupProductsSectionController_applySearchString___block_invoke_2;
  v18[3] = &unk_1E3E61388;
  v17 = *(void **)(a1 + 48);
  v18[4] = *(_QWORD *)(a1 + 40);
  v19 = v17;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

}

void __61__PKPaymentSetupProductsSectionController_applySearchString___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
    objc_msgSend(WeakRetained, "hideNoResultsView");

    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
    objc_msgSend(v4, "reloadSectionsRequired");
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_NO_RESULTS_SUBTITLE"), CFSTR("%@"), *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
    objc_msgSend(v3, "displayNoResultsViewWithSubtitle:needsManualEntryButton:", v4, objc_msgSend(*(id *)(a1 + 32), "_needsManualEntryButton"));

  }
}

- (BOOL)_needsManualEntryButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[NSMutableDictionary allValues](self->_itemIdentifierToItemMapping, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "product");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type") == 5;

  return v6;
}

- (id)_sectionIdentifierForProduct:(id)a3 alwaysWantsHeaders:(BOOL *)a4 wantsAddAdifferentCardButton:(BOOL *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  NSString *v11;
  NSString *primaryRegion;
  NSString *v13;

  v8 = a3;
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");

  if (v10 <= 0xB)
  {
    if (((1 << v10) & 0x39F) != 0)
    {
      *a4 = 1;
    }
    else if (((1 << v10) & 0x60) != 0)
    {
      *a4 = 1;
      *a5 = 1;
      PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_CREDIT_DEBIT_HEADER"));
      self = (PKPaymentSetupProductsSectionController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(v8, "primaryRegion");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    primaryRegion = v11;
    if (!v11)
    {
      primaryRegion = self->_primaryRegion;
      if (!primaryRegion)
        primaryRegion = self->_secondaryRegion;
    }
    v13 = primaryRegion;

    PKLocalizedStringForCountryCode();
    self = (PKPaymentSetupProductsSectionController *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return self;
}

- (void)updateWithPaymentSetupProducts:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _BOOL4 v9;
  uint64_t i;
  void *v11;
  PKPaymentSetupProductsSectionController *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  PKPaymentSetupProductsSectionListItem *addADifferentCardListItem;
  void *v21;
  void *v22;
  PKPaymentSetupProductsSectionListItem *v23;
  PKPaymentSetupProductsSectionListItem *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id obj;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  __int16 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    LOBYTE(v9) = 0;
    v31 = *(_QWORD *)v39;
    v32 = 0;
    obj = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v37 = 0;
        v12 = self;
        -[PKPaymentSetupProductsSectionController _sectionIdentifierForProduct:alwaysWantsHeaders:wantsAddAdifferentCardButton:](self, "_sectionIdentifierForProduct:alwaysWantsHeaders:wantsAddAdifferentCardButton:", v11, (char *)&v37 + 1, &v37, obj);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = HIBYTE(v37) != 0;
        if (v9)
        {
          v9 = 1;
        }
        else
        {
          v16 = v13;

          v9 = (_BYTE)v37 != 0;
          v32 = v16;
        }
        objc_msgSend(v11, "productIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          -[PKPaymentSetupProductsSectionController _listItemFromProduct:sectionIdentifier:](v12, "_listItemFromProduct:sectionIdentifier:", v11, v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKey:", v18, v19);

        }
        v8 |= v15;
        objc_msgSend(v33, "addObject:", v18);

        self = v12;
      }
      v5 = obj;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v7);

    if (v9)
    {
      addADifferentCardListItem = v12->_addADifferentCardListItem;
      if (!addADifferentCardListItem)
      {
        PKLocalizedPaymentString(CFSTR("ADD_A_DIFFERENT_CARD"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[PKPaymentSetupListItem initWithTitle:subtitle:icon:]([PKPaymentSetupProductsSectionListItem alloc], "initWithTitle:subtitle:icon:", v22, 0, 0);
        v24 = v12->_addADifferentCardListItem;
        v12->_addADifferentCardListItem = v23;

        -[PKPaymentSetupListItem setDisplayChevron:](v12->_addADifferentCardListItem, "setDisplayChevron:", 1);
        -[PKPaymentSetupListItem setIdentifier:](v12->_addADifferentCardListItem, "setIdentifier:", CFSTR("PKAddADifferentCardListItemIdentifier"));

        addADifferentCardListItem = v12->_addADifferentCardListItem;
      }
      v21 = v32;
      -[PKPaymentSetupProductsSectionListItem setSectionIdentifier:](addADifferentCardListItem, "setSectionIdentifier:", v32);
      objc_msgSend(v34, "setObject:forKey:", v12->_addADifferentCardListItem, CFSTR("PKAddADifferentCardListItemIdentifier"));
      objc_msgSend(v33, "addObject:", v12->_addADifferentCardListItem);
    }
    else
    {
      v21 = v32;
    }
  }
  else
  {

    v21 = 0;
    v8 = 0;
  }
  objc_storeStrong((id *)&self->_itemIdentifierToItemMapping, v34);
  +[PKPaymentSetupProductsSectionFactoryContext contextWithPrimaryRegion:primaryCountryName:secondaryRegion:secondaryCountryName:location:](PKPaymentSetupProductsSectionFactoryContext, "contextWithPrimaryRegion:primaryCountryName:secondaryRegion:secondaryCountryName:location:", self->_primaryRegion, self->_primaryCountryName, self->_secondaryRegion, self->_secondaryCountryName, self->_cachedLocation);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = 0;
  +[PKPaymentSetupProductsSectionMainFactory generateSectionsWithDefaultSortingForItems:withContext:outSectionIdentifierToItemIdentifierMapping:outOrderedSectionIdentifiers:](PKPaymentSetupProductsSectionMainFactory, "generateSectionsWithDefaultSortingForItems:withContext:outSectionIdentifierToItemIdentifierMapping:outOrderedSectionIdentifiers:", v33, v25, &v36, &v35);
  v26 = v36;
  v27 = v36;
  v28 = v35;
  v29 = v35;
  objc_storeStrong((id *)&self->_sectionIdentifierToItemIdentifierMapping, v26);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, v28);
  if ((v8 & 1) != 0 || -[NSArray count](self->_orderedSectionIdentifiers, "count") >= 2)
    self->_showSectionHeaders = 1;

}

- (id)_cleanedSearchTermsFromString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "localizedLowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", self->_tokenizerCharacterSet, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)_listItemFromProduct:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  PKPaymentSetupProductsSectionListItem *v20;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDescription");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "badge");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (!objc_msgSend(v9, "length"))
  {
    v11 = v10;

  }
  objc_msgSend(v6, "productIdentifier", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  objc_msgSend(v6, "searchTerms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v13, "addObjectsFromArray:", v14);
  }
  else
  {
    -[PKPaymentSetupProductsSectionController _cleanedSearchTermsFromString:](self, "_cleanedSearchTermsFromString:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unionOrderedSet:", v15);

    -[PKPaymentSetupProductsSectionController _cleanedSearchTermsFromString:](self, "_cleanedSearchTermsFromString:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unionOrderedSet:", v16);

  }
  objc_msgSend(v6, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "type");

  v19 = 0;
  if (v18 <= 0xB && ((1 << v18) & 0xF9B) != 0)
  {
    PKUIImageNamed(CFSTR("PlaceholderCardArt_Small"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = -[PKPaymentSetupListItem initWithTitle:subtitle:icon:]([PKPaymentSetupProductsSectionListItem alloc], "initWithTitle:subtitle:icon:", v8, v11, v19);
  -[PKPaymentSetupProductsSectionListItem setSearchTerms:](v20, "setSearchTerms:", v13);
  -[PKPaymentSetupListItem setIdentifier:](v20, "setIdentifier:", v12);
  -[PKPaymentSetupProductsSectionListItem setProduct:](v20, "setProduct:", v6);
  -[PKPaymentSetupProductsSectionListItem setSectionIdentifier:](v20, "setSectionIdentifier:", v7);

  -[PKPaymentSetupListItem setDisplayChevron:](v20, "setDisplayChevron:", 1);
  -[PKPaymentSetupListItem setBadgeText:](v20, "setBadgeText:", v23);

  return v20;
}

- (PKPaymentSetupProductsSectionControllerDelegate)delegate
{
  return (PKPaymentSetupProductsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryCountryName, 0);
  objc_storeStrong((id *)&self->_secondaryRegion, 0);
  objc_storeStrong((id *)&self->_primaryCountryName, 0);
  objc_storeStrong((id *)&self->_primaryRegion, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_cachedLocation, 0);
  objc_storeStrong((id *)&self->_tokenizerCharacterSet, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToItemIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_itemIdentifierToItemMapping, 0);
  objc_storeStrong((id *)&self->_addADifferentCardListItem, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
