@implementation PKRewardsHubSummarySectionController

- (PKRewardsHubSummarySectionController)initWithSectionIdentifiers:(id)a3 rewardsFetcher:(id)a4 paymentDataProvider:(id)a5 showRewardsGraph:(BOOL)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKRewardsHubSummarySectionController *v17;
  PKRewardsHubSummarySectionController *v18;
  NSMutableSet *v19;
  NSMutableSet *pendingCompletionHandlers;
  uint64_t v21;
  NSMutableDictionary *sectionIDToPresenterMap;
  uint64_t v23;
  NSMutableDictionary *sectionIDToItemsMap;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)PKRewardsHubSummarySectionController;
  v17 = -[PKRewardsHubSummarySectionController init](&v38, sel_init);
  v18 = v17;
  if (v17)
  {
    v33 = v14;
    objc_storeStrong((id *)&v17->_identifiers, a3);
    v18->_showRewardsGraph = a6;
    objc_storeStrong((id *)&v18->_rewardsFetcher, a4);
    v18->_summaryFetchLock._os_unfair_lock_opaque = 0;
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingCompletionHandlers = v18->_pendingCompletionHandlers;
    v18->_pendingCompletionHandlers = v19;

    objc_storeStrong((id *)&v18->_paymentDataProvider, a5);
    -[PKPaymentDataProvider addDelegate:](v18->_paymentDataProvider, "addDelegate:", v18);
    objc_storeWeak((id *)&v18->_delegate, v16);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
    v21 = objc_claimAutoreleasedReturnValue();
    sectionIDToPresenterMap = v18->_sectionIDToPresenterMap;
    v18->_sectionIDToPresenterMap = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
    v23 = objc_claimAutoreleasedReturnValue();
    sectionIDToItemsMap = v18->_sectionIDToItemsMap;
    v18->_sectionIDToItemsMap = (NSMutableDictionary *)v23;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = v13;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v35 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[PKRewardsHubSummarySectionController _createPresenterForSection:](v18, "_createPresenterForSection:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v18->_sectionIDToPresenterMap, "setObject:forKey:", v31, v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v27);
    }

    v14 = v33;
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentDataProvider removeDelegate:](self->_paymentDataProvider, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKRewardsHubSummarySectionController;
  -[PKRewardsHubSummarySectionController dealloc](&v3, sel_dealloc);
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allValues](self->_sectionIDToPresenterMap, "allValues", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "traitCollectionDidChangeFromTrait:toTrait:inCollectionView:", v8, v9, v10);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_showRewardsGraph)
  {
    v9 = (__CFString *)v7;
    v10 = CFSTR("PKRewardsHubSectionLifetimeSummary");
    if (v10 == v9)
    {

      goto LABEL_8;
    }
    v11 = v10;
    if (v9 && v10)
    {
      v12 = -[__CFString isEqualToString:](v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_10;
LABEL_8:
      v13 = objc_alloc_init(MEMORY[0x1E0DC3390]);
      v20[0] = self->_lifetimeSummary;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendItems:", v14);

      goto LABEL_14;
    }

  }
LABEL_10:
  v13 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  -[PKRewardsHubSummarySectionController _itemsForSection:](self, "_itemsForSection:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  objc_msgSend(v13, "appendItems:", v18);
LABEL_14:

  return v13;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v4 = a3;
  if (self->_showRewardsGraph)
  {
    objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_168);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_opt_class();
    -[PKRewardsHubSummarySectionController _sectionIdentifierForItem:](self, "_sectionIdentifierForItem:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRewardsHubSummarySectionController _presenterForSection:](self, "_presenterForSection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PKRewardsHubSummarySectionController _cellPresenterIdentifierForItem:](self, "_cellPresenterIdentifierForItem:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "collectionViewCellClasses");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "objectForKey:", v9);

      if (v6 && objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()))
        v6 = (void *)v11;

    }
    -[PKRewardsHubSummarySectionController _collectionView](self, "_collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E0DC35C8];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __64__PKRewardsHubSummarySectionController_cellRegistrationForItem___block_invoke_2;
    v18[3] = &unk_1E3E74248;
    objc_copyWeak(&v22, &location);
    v14 = v8;
    v19 = v14;
    v15 = v12;
    v20 = v15;
    v16 = v7;
    v21 = v16;
    objc_msgSend(v13, "registrationWithCellClass:configurationHandler:", v6, v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __64__PKRewardsHubSummarySectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "performSelector:withObject:", NSSelectorFromString(CFSTR("configureWithRewardsTierSummary:")), v5);

}

void __64__PKRewardsHubSummarySectionController_cellRegistrationForItem___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v8, "wrappedItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "updateCell:forItem:inCollectionView:atIndexPath:", v12, v11, *(_QWORD *)(a1 + 40), v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(WeakRetained, "_setCornerMaskForCell:indexPath:section:", v12, v7, *(_QWORD *)(a1 + 48));

}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v6 = (objc_class *)MEMORY[0x1E0DC35A8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithAppearance:", 2);
  LODWORD(v6) = -[PKRewardsHubSummarySectionController _hasHeaderForSection:](self, "_hasHeaderForSection:", v7);
  LODWORD(self) = -[PKRewardsHubSummarySectionController _hasFooterForSection:](self, "_hasFooterForSection:", v7);

  objc_msgSend(v9, "setHeaderMode:", v6);
  objc_msgSend(v9, "setFooterMode:", self);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setHeaderTopPadding:", 0.0);
  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  if ((_DWORD)self)
    v12 = 0.0;
  else
    v12 = 16.0;
  objc_msgSend(v10, "setContentInsets:", 0.0, v11, v12, v11);

  return v10;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)*MEMORY[0x1E0DC48A8];
  v8 = v5;
  v9 = v7;
  if (v9 == v8)
  {

    goto LABEL_15;
  }
  v10 = v9;
  if (v8 && v9)
  {
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v11 & 1) != 0)
      goto LABEL_15;
  }
  else
  {

  }
  v12 = (void *)*MEMORY[0x1E0DC48A0];
  v13 = v8;
  v14 = v12;
  if (v14 == v13)
  {

  }
  else
  {
    v15 = v14;
    if (v8 && v14)
    {
      objc_msgSend(v13, "isEqualToString:", v14);

    }
    else
    {

    }
  }
LABEL_15:
  objc_opt_class();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v16;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  int v25;
  id v26;

  v26 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)*MEMORY[0x1E0DC48A8];
  v11 = (__CFString *)v8;
  v12 = v10;
  if (v12 == v11)
  {

  }
  else
  {
    v13 = v12;
    if (!v11 || !v12)
    {
      v15 = v11;
      goto LABEL_13;
    }
    v14 = -[__CFString isEqualToString:](v11, "isEqualToString:", v12);

    if (!v14)
    {
LABEL_14:
      if (self->_showRewardsGraph)
      {
        v18 = (__CFString *)v9;
        v19 = CFSTR("PKRewardsHubSectionLifetimeSummary");
        v20 = v19;
        if (v19 == v18)
        {
          v21 = 1;
        }
        else
        {
          v21 = 0;
          if (v18 && v19)
            v21 = -[__CFString isEqualToString:](v18, "isEqualToString:", v19);
        }

      }
      else
      {
        v21 = 0;
      }
      v22 = (__CFString *)v9;
      v23 = CFSTR("PKRewardsHubSectionDateRangeSummary");
      if (v23 == v22)
      {

      }
      else
      {
        v24 = v23;
        v25 = 0;
        if (v22 && v23)
          v25 = -[__CFString isEqualToString:](v22, "isEqualToString:", v23);

        if ((v21 | v25) != 1)
          goto LABEL_33;
      }
      -[PKRewardsHubSummarySectionController _configureFooterView:inSection:](self, "_configureFooterView:inSection:", v26, v22);
      goto LABEL_33;
    }
  }
  v15 = (__CFString *)v9;
  v16 = CFSTR("PKRewardsHubSectionLifetimeSummary");
  if (v16 == v15)
  {

    goto LABEL_21;
  }
  v13 = v16;
  if (!v15 || !v16)
  {
LABEL_13:

    goto LABEL_14;
  }
  v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", v16);

  if (!v17)
    goto LABEL_14;
LABEL_21:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PKRewardsHubSummarySectionController _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:", v26, v15);
LABEL_33:

}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "transactionType");
  v9 = objc_msgSend(v7, "transactionStatus");
  if (!v8 && (v9 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    objc_msgSend(v7, "rewardsTotalAmount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10
      && (objc_msgSend(v10, "pk_isZeroNumber") & 1) == 0
      && -[PKRewardsSummaryFetcher isTransactionSourceIdentifierRelevant:](self->_rewardsFetcher, "isTransactionSourceIdentifierRelevant:", v6))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __90__PKRewardsHubSummarySectionController_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
      block[3] = &unk_1E3E612E8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }

  }
}

uint64_t __90__PKRewardsHubSummarySectionController_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDataAndUpdateDelegate");
}

- (BOOL)_hasHeaderForSection:(id)a3
{
  return 0;
}

- (void)_configureHeaderView:(id)a3 inSection:(id)a4
{
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  objc_msgSend(v4, "setHorizontalInset:");
  objc_msgSend(v4, "setUseCompactTopInset:", 0);

}

- (BOOL)_hasFooterForSection:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  BOOL showRewardsGraph;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  char v12;
  NSObject *v13;
  int v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = CFSTR("PKRewardsHubSectionLifetimeSummary");
  if (v5 == v4)
  {

    goto LABEL_7;
  }
  v6 = v5;
  if (!v4 || !v5)
  {

    goto LABEL_9;
  }
  v7 = -[__CFString isEqualToString:](v4, "isEqualToString:", v5);

  if (v7)
  {
LABEL_7:
    showRewardsGraph = self->_showRewardsGraph;
    goto LABEL_20;
  }
LABEL_9:
  v9 = v4;
  v10 = CFSTR("PKRewardsHubSectionDateRangeSummary");
  if (v10 == v9)
  {

    goto LABEL_15;
  }
  v11 = v10;
  if (v4 && v10)
  {
    v12 = -[__CFString isEqualToString:](v9, "isEqualToString:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_17;
LABEL_15:
    showRewardsGraph = 1;
    goto LABEL_20;
  }

LABEL_17:
  PKLogFacilityTypeGetObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v9;
    _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Unrecognized section identifier in rewards hub: %@", (uint8_t *)&v15, 0xCu);
  }

  showRewardsGraph = 0;
LABEL_20:

  return showRewardsGraph;
}

- (void)_configureFooterView:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  char v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  objc_msgSend(v6, "setHorizontalInset:");
  v8 = (__CFString *)v7;
  v9 = CFSTR("PKRewardsHubSectionDateRangeSummary");
  if (v9 == v8)
    goto LABEL_13;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = -[__CFString isEqualToString:](v8, "isEqualToString:", v9);

    if ((v11 & 1) != 0)
      goto LABEL_14;
  }
  else
  {

  }
  if (self->_showRewardsGraph)
  {
    v12 = v8;
    v13 = CFSTR("PKRewardsHubSectionLifetimeSummary");
    if (v13 != v12)
    {
      v14 = v13;
      if (!v8 || !v13)
        goto LABEL_15;
      v15 = -[__CFString isEqualToString:](v12, "isEqualToString:", v13);

      if ((v15 & 1) == 0)
        goto LABEL_16;
LABEL_14:
      PKLocalizedFeatureString();
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBottomInsetType:", 2, v12);
      objc_msgSend(v6, "setFooterText:", v14);
      v16 = objc_msgSend(v14, "rangeOfString:", v12);
      objc_msgSend(v6, "setLinkRange:", v16, v17);
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLinkTextColor:", v18);

      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __71__PKRewardsHubSummarySectionController__configureFooterView_inSection___block_invoke;
      v19[3] = &unk_1E3E61310;
      objc_copyWeak(&v20, &location);
      objc_msgSend(v6, "setAction:", v19);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
LABEL_15:

      goto LABEL_16;
    }
LABEL_13:

    goto LABEL_14;
  }
LABEL_16:

}

void __71__PKRewardsHubSummarySectionController__configureFooterView_inSection___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained(WeakRetained + 5);
  if (v2)
  {
    v3 = *MEMORY[0x1E0D68B18];
    v4 = *MEMORY[0x1E0D68858];
    v7[0] = *MEMORY[0x1E0D68AA0];
    v7[1] = v4;
    v5 = *MEMORY[0x1E0D68D18];
    v8[0] = v3;
    v8[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reportEventIfNecessary:", v6);

    objc_msgSend(v2, "presentEducationViewController");
  }

}

- (void)_setCornerMaskForCell:(id)a3 indexPath:(id)a4 section:(id)a5
{
  id v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a5;
  v9 = objc_msgSend(a4, "row");
  if (self->_showRewardsGraph)
  {
    v10 = 0;
    v11 = 3;
  }
  else
  {
    v12 = v9;
    v13 = v9 != 0;
    -[PKRewardsHubSummarySectionController _itemsForSection:](self, "_itemsForSection:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    v10 = v12 != v15 - 1;
    v16 = v12 != v15 - 1 || v13;
    v17 = v16 == 0;
    v18 = 3;
    if (!v17)
      v18 = 1;
    if (v12)
      v11 = 2 * (v12 == v15 - 1);
    else
      v11 = v18;

  }
  objc_msgSend(v22, "setMaskType:", v11);
  objc_msgSend(v22, "setShowsBottomSeparator:", v10);
  objc_msgSend(v22, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v22, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCornerRadius:", 4.0);

  }
}

- (id)_createPresenterForSection:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  int v6;
  PKDashboardBalancePresenter *v7;
  PKDashboardBalancePresenter *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  NSObject *v14;
  int v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = CFSTR("PKRewardsHubSectionLifetimeSummary");
  if (v4 == v3)
  {

    goto LABEL_7;
  }
  v5 = v4;
  if (!v3 || !v4)
  {

    goto LABEL_9;
  }
  v6 = -[__CFString isEqualToString:](v3, "isEqualToString:", v4);

  if (v6)
  {
LABEL_7:
    v7 = objc_alloc_init(PKDashboardBalancePresenter);
    v8 = v7;
    v9 = 0;
LABEL_16:
    -[PKDashboardBalancePresenter setCellStyle:](v7, "setCellStyle:", v9);
    goto LABEL_21;
  }
LABEL_9:
  v10 = v3;
  v11 = CFSTR("PKRewardsHubSectionDateRangeSummary");
  if (v11 == v10)
  {

LABEL_15:
    v7 = objc_alloc_init(PKDashboardBalanceSummaryItemPresenter);
    v8 = v7;
    v9 = 1;
    goto LABEL_16;
  }
  v12 = v11;
  if (v3 && v11)
  {
    v13 = -[__CFString isEqualToString:](v10, "isEqualToString:", v11);

    if (!v13)
      goto LABEL_18;
    goto LABEL_15;
  }

LABEL_18:
  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v10;
    _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Unrecognized section identifier in rewards hub: %@", (uint8_t *)&v16, 0xCu);
  }

  v8 = 0;
LABEL_21:

  return v8;
}

- (void)_setItems:(id)a3 forSection:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_sectionIDToItemsMap, "removeObjectForKey:", v6);
    if (v7)
      -[NSMutableDictionary setObject:forKey:](self->_sectionIDToItemsMap, "setObject:forKey:", v7, v6);
  }

}

- (id)_itemsForSection:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_sectionIDToItemsMap, "objectForKey:", a3);
}

- (id)_presenterForSection:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_sectionIDToPresenterMap, "objectForKey:", a3);
}

- (id)_sectionIdentifierForItem:(id)a3
{
  void *v3;
  __CFString **v4;
  __CFString *v5;
  NSObject *v6;
  id v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "wrappedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = PKRewardsHubSectionLifetimeSummary;
LABEL_5:
    v5 = *v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = PKRewardsHubSectionDateRangeSummary;
    goto LABEL_5;
  }
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = (id)objc_opt_class();
    v7 = v10;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Unrecognized item type for rewards hub summary: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (id)_cellPresenterIdentifierForItem:(id)a3
{
  void *v3;
  __CFString **v4;
  __CFString *v5;
  NSObject *v6;
  id v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "wrappedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = &PKDashboardBalancePresenterIdentifier;
LABEL_5:
    v5 = *v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = PKDashboardBalanceSummaryItemPresenterIdentifier;
    goto LABEL_5;
  }
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = (id)objc_opt_class();
    v7 = v10;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Unrecognized item type for rewards hub summary: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (id)_collectionView
{
  PKRewardsHubSectionControllerDelegate **p_delegate;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;
  void *v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (v4 = WeakRetained,
        v5 = objc_loadWeakRetained((id *)p_delegate),
        v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "rewardsHubCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_reloadData
{
  -[PKRewardsHubSummarySectionController _reloadDataWithCompletion:](self, "_reloadDataWithCompletion:", 0);
}

- (void)_reloadDataAndUpdateDelegate
{
  PKAccountRewardsTierSummary *v3;
  PKAccountRewardsTierSummary *v4;
  _QWORD v5[4];
  PKAccountRewardsTierSummary *v6;
  id v7;
  id location;

  v3 = self->_lifetimeSummary;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PKRewardsHubSummarySectionController__reloadDataAndUpdateDelegate__block_invoke;
  v5[3] = &unk_1E3E62FA0;
  objc_copyWeak(&v7, &location);
  v4 = v3;
  v6 = v4;
  -[PKRewardsHubSummarySectionController _reloadDataWithCompletion:](self, "_reloadDataWithCompletion:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __68__PKRewardsHubSummarySectionController__reloadDataAndUpdateDelegate__block_invoke(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__PKRewardsHubSummarySectionController__reloadDataAndUpdateDelegate__block_invoke_2;
    v6[3] = &unk_1E3E61B68;
    objc_copyWeak(&v8, v4);
    v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v6);

    objc_destroyWeak(&v8);
  }

}

void __68__PKRewardsHubSummarySectionController__reloadDataAndUpdateDelegate__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = WeakRetained[4];
  if ((PKEqualObjects() & 1) == 0)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v4 = WeakRetained[10];
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v10;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(v3, "reloadDataForSectionIdentifier:animated:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1, (_QWORD)v9);
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v6);
      }

    }
  }

}

- (void)_reloadDataWithCompletion:(id)a3
{
  id v4;
  os_unfair_lock_s *p_summaryFetchLock;
  NSMutableSet *pendingCompletionHandlers;
  void *v7;
  NSMutableSet *v8;
  void *v9;
  PKRewardsSummaryFetcher *rewardsFetcher;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  p_summaryFetchLock = &self->_summaryFetchLock;
  os_unfair_lock_lock(&self->_summaryFetchLock);
  if (self->_summaryFetchInProgress)
  {
    self->_transactionsNeedUpdate = 1;
    pendingCompletionHandlers = self->_pendingCompletionHandlers;
    v7 = _Block_copy(v4);
    -[NSMutableSet pk_safelyAddObject:](pendingCompletionHandlers, "pk_safelyAddObject:", v7);

    os_unfair_lock_unlock(p_summaryFetchLock);
  }
  else
  {
    self->_summaryFetchInProgress = 1;
    v8 = self->_pendingCompletionHandlers;
    v9 = _Block_copy(v4);
    -[NSMutableSet pk_safelyAddObject:](v8, "pk_safelyAddObject:", v9);

    os_unfair_lock_unlock(&self->_summaryFetchLock);
    objc_initWeak(&location, self);
    rewardsFetcher = self->_rewardsFetcher;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__PKRewardsHubSummarySectionController__reloadDataWithCompletion___block_invoke;
    v11[3] = &unk_1E3E74270;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    -[PKRewardsSummaryFetcher rewardsTierSummariesWithCompletion:](rewardsFetcher, "rewardsTierSummariesWithCompletion:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __66__PKRewardsHubSummarySectionController__reloadDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKRewardsHubSummarySectionController__reloadDataWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E6C598;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  v10 = *(id *)(a1 + 32);
  v15 = v9;
  v16 = v7;
  v17 = v8;
  v18 = v10;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v19);
}

void __66__PKRewardsHubSummarySectionController__reloadDataWithCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  PKDashboardBalanceItem *v4;
  void *v5;
  void *v6;
  void *v7;
  _PKDashboardItemWrapper *v8;
  PKDashboardBalanceSummaryItem *v9;
  void *v10;
  _PKDashboardItemWrapper *v11;
  PKDashboardBalanceSummaryItem *v12;
  void *v13;
  _PKDashboardItemWrapper *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  _PKDashboardItemWrapper *v25;
  _PKDashboardItemWrapper *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 4, *(id *)(a1 + 32));
    v4 = objc_alloc_init(PKDashboardBalanceItem);
    objc_msgSend(*(id *)(a1 + 32), "totalCurrencyAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedStringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardBalanceItem setBalance:](v4, "setBalance:", v6);

    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardBalanceItem setTitle:](v4, "setTitle:", v7);

    v8 = -[_PKDashboardItemWrapper initWithDashboardItem:]([_PKDashboardItemWrapper alloc], "initWithDashboardItem:", v4);
    v9 = objc_alloc_init(PKDashboardBalanceSummaryItem);
    -[PKDashboardBalanceSummaryItem setType:](v9, "setType:", 19);
    objc_msgSend(*(id *)(a1 + 40), "totalCurrencyAmount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardBalanceSummaryItem setRewardsCurrencyAmount:](v9, "setRewardsCurrencyAmount:", v10);

    v11 = -[_PKDashboardItemWrapper initWithDashboardItem:]([_PKDashboardItemWrapper alloc], "initWithDashboardItem:", v9);
    v12 = objc_alloc_init(PKDashboardBalanceSummaryItem);
    -[PKDashboardBalanceSummaryItem setType:](v12, "setType:", 20);
    objc_msgSend(*(id *)(a1 + 48), "totalCurrencyAmount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardBalanceSummaryItem setRewardsCurrencyAmount:](v12, "setRewardsCurrencyAmount:", v13);

    v14 = -[_PKDashboardItemWrapper initWithDashboardItem:]([_PKDashboardItemWrapper alloc], "initWithDashboardItem:", v12);
    v26 = v8;
    v33[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setItems:forSection:", v15, CFSTR("PKRewardsHubSectionLifetimeSummary"));

    v25 = v11;
    v32[0] = v11;
    v32[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setItems:forSection:", v16, CFSTR("PKRewardsHubSectionDateRangeSummary"));

    os_unfair_lock_lock((os_unfair_lock_t)v3 + 12);
    v17 = *((unsigned __int8 *)v3 + 53);
    *((_WORD *)v3 + 26) = 0;
    v18 = (void *)objc_msgSend(v3[7], "copy");
    objc_msgSend(v3[7], "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)v3 + 12);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i) + 16))();
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v21);
    }

    if (v17)
      objc_msgSend(v3, "_reloadData");

  }
  else
  {
    v24 = *(_QWORD *)(a1 + 56);
    if (v24)
      (*(void (**)(uint64_t, _QWORD))(v24 + 16))(v24, 0);
  }

}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_sectionIDToItemsMap, 0);
  objc_storeStrong((id *)&self->_sectionIDToPresenterMap, 0);
  objc_storeStrong((id *)&self->_pendingCompletionHandlers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lifetimeSummary, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_rewardsFetcher, 0);
}

@end
