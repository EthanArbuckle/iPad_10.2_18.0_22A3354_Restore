@implementation PKAccountPromotionsSectionController

- (PKAccountPromotionsSectionController)initWithSectionIdentifier:(id)a3 account:(id)a4 accountService:(id)a5 delegate:(id)a6
{
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  PKAccountPromotionsSectionController *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  NSArray *identifiers;
  uint64_t v20;
  NSArray *items;
  NSMutableSet *v22;
  NSMutableSet *promotionsViewedSinceViewLoad;
  PKRemoteImagePreparer *v24;
  PKRemoteImagePreparer *remoteImagePreparer;
  PKAccountPromotionsPresenter *v26;
  PKRemoteImagePreparer *v27;
  id WeakRetained;
  uint64_t v29;
  PKAccountPromotionsPresenter *presenter;
  objc_super v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)PKAccountPromotionsSectionController;
  v14 = -[PKAccountPromotionsSectionController init](&v32, sel_init);
  if (v14)
  {
    v15 = CFSTR("PKRewardsHubSectionAccountPromotions");
    if (v10)
      v15 = v10;
    v33[0] = v15;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = v15;
    objc_msgSend(v16, "arrayWithObjects:count:", v33, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    identifiers = v14->_identifiers;
    v14->_identifiers = (NSArray *)v18;

    objc_storeStrong((id *)&v14->_account, a4);
    objc_storeStrong((id *)&v14->_accountService, a5);
    objc_storeWeak((id *)&v14->_delegate, v13);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    items = v14->_items;
    v14->_items = (NSArray *)v20;

    v14->_itemsLock._os_unfair_lock_opaque = 0;
    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    promotionsViewedSinceViewLoad = v14->_promotionsViewedSinceViewLoad;
    v14->_promotionsViewedSinceViewLoad = v22;

    v24 = (PKRemoteImagePreparer *)objc_alloc_init(MEMORY[0x1E0D67588]);
    remoteImagePreparer = v14->_remoteImagePreparer;
    v14->_remoteImagePreparer = v24;

    v26 = [PKAccountPromotionsPresenter alloc];
    v27 = v14->_remoteImagePreparer;
    WeakRetained = objc_loadWeakRetained((id *)&v14->_delegate);
    v29 = -[PKAccountPromotionsPresenter initWithRemoteImagePreparer:delegate:](v26, "initWithRemoteImagePreparer:delegate:", v27, WeakRetained);
    presenter = v14->_presenter;
    v14->_presenter = (PKAccountPromotionsPresenter *)v29;

    -[PKAccountPromotionsSectionController _configureDataSource](v14, "_configureDataSource");
    -[PKAccountService registerObserver:](v14->_accountService, "registerObserver:", v14);

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKAccountPromotionsSectionController;
  -[PKAccountPromotionsSectionController dealloc](&v3, sel_dealloc);
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[PKAccountPromotionsSectionController _clearViewedPromotions](self, "_clearViewedPromotions");
  -[PKAccountPromotionsSectionController _reloadDataWithCompletion:](self, "_reloadDataWithCompletion:", v4);

}

- (void)setItems:(id)a3
{
  NSArray *v4;
  NSArray *items;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_itemsLock);
  items = self->_items;
  self->_items = v4;

  os_unfair_lock_unlock(&self->_itemsLock);
}

- (id)itemsCopy
{
  os_unfair_lock_s *p_itemsLock;
  void *v4;

  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  v4 = (void *)-[NSArray copy](self->_items, "copy");
  os_unfair_lock_unlock(p_itemsLock);
  return v4;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  -[PKAccountPromotionsSectionController _promotionsWithOrderingContext:](self, "_promotionsWithOrderingContext:", 100);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[PKAccountPromotionsSectionController _promotionsWithDefaultOrdering](self, "_promotionsWithDefaultOrdering");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_lock(&self->_itemsLock);
  v7 = (void *)-[PKAccountPromotionBehavior copy](self->_promotionBehavior, "copy");
  os_unfair_lock_unlock(&self->_itemsLock);
  -[PKAccountPromotionsSectionController itemsCopy](self, "itemsCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPromotionsSectionController _updateImpressionCountsForAllItems:shouldCountAsImpression:](self, "_updateImpressionCountsForAllItems:shouldCountAsImpression:", v8, 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeVisibleAfterCompleted");
  v11 = v10;
  v12 = objc_msgSend(v7, "maxImpressionCount");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__PKAccountPromotionsSectionController_snapshotWithPreviousSnapshot_forSectionIdentifier___block_invoke;
  v16[3] = &unk_1E3E787A0;
  v17 = v9;
  v18 = v11;
  v19 = v12;
  v13 = v9;
  objc_msgSend(v6, "pk_objectsPassingTest:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendItems:", v14);

  return v5;
}

BOOL __90__PKAccountPromotionsSectionController_snapshotWithPreviousSnapshot_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  _BOOL4 v6;
  _BOOL8 v7;

  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "state") > 4)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", v4);
    v6 = v5 < *(double *)(a1 + 40);

  }
  v7 = objc_msgSend(v3, "impressionCount") < *(_QWORD *)(a1 + 48) && v6;

  return v7;
}

- (id)promotionForProgramIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_itemsLock;
  NSArray *items;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    p_itemsLock = &self->_itemsLock;
    os_unfair_lock_lock(&self->_itemsLock);
    items = self->_items;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__PKAccountPromotionsSectionController_promotionForProgramIdentifier___block_invoke;
    v9[3] = &unk_1E3E787C8;
    v10 = v4;
    -[NSArray pk_firstObjectPassingTest:](items, "pk_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_itemsLock);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __70__PKAccountPromotionsSectionController_promotionForProgramIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "programIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v8 = 1;
  }
  else
  {
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7)
      v8 = 0;
    else
      v8 = objc_msgSend(v4, "isEqualToString:", v5);
  }

  return v8;
}

- (void)_configureDataSource
{
  uint64_t v3;
  void *v4;
  UICollectionViewCellRegistration *v5;
  UICollectionViewCellRegistration *cellRegistration;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_opt_class();
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC35C8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__PKAccountPromotionsSectionController__configureDataSource__block_invoke;
  v7[3] = &unk_1E3E787F0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "registrationWithCellClass:configurationHandler:", v3, v7);
  v5 = (UICollectionViewCellRegistration *)objc_claimAutoreleasedReturnValue();
  cellRegistration = self->_cellRegistration;
  self->_cellRegistration = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __60__PKAccountPromotionsSectionController__configureDataSource__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id *WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained[5], "configureCell:withPromotion:", v7, v6);

}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
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
  double v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", a3, a4, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 500.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v19, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v17, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v5, v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 40.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v10, CFSTR("PKAccountPromotionsHeaderIdentifier"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v10, CFSTR("PKAccountPromotionsFooterIdentifier"), 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBoundarySupplementaryItems:", v13);

  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  objc_msgSend(v7, "setContentInsets:", 0.0, v14, 0.0, v14);
  objc_msgSend(v7, "setInterGroupSpacing:", 16.0);

  return v7;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  char v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 != CFSTR("PKAccountPromotionsHeaderIdentifier"))
  {
    if (v7)
    {
      v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("PKAccountPromotionsHeaderIdentifier"));

      if ((v9 & 1) == 0)
      {
        v10 = v8;
        if (v10 != CFSTR("PKAccountPromotionsFooterIdentifier"))
        {
          v11 = v10;
          -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("PKAccountPromotionsFooterIdentifier"));

        }
      }
    }
  }
  objc_opt_class();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v12;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  id v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  id v17;
  id v18;

  v18 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (__CFString *)v7;
  v10 = v9;
  if (v9 == CFSTR("PKAccountPromotionsHeaderIdentifier"))
    goto LABEL_4;
  if (v9)
  {
    v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("PKAccountPromotionsHeaderIdentifier"));

    if (v11)
    {
LABEL_4:
      v12 = v18;
      objc_msgSend(v12, "setUseLargeBottomInset:", 1);
      PKLocalizedFeatureString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitle:", v13);
LABEL_5:

      goto LABEL_6;
    }
    v14 = v10;
    if (v14 == CFSTR("PKAccountPromotionsFooterIdentifier")
      || (v15 = v14,
          v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("PKAccountPromotionsFooterIdentifier")),
          v15,
          v16))
    {
      v17 = v18;
      objc_msgSend(v17, "setBottomInsetType:", 2);
      objc_msgSend(v17, "setHorizontalAlignment:", 1);
      PKLocalizedFeatureString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFooterText:", v13);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)willDisplayItem:(id)a3
{
  PKAccountService *accountService;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[PKAccountPromotionsSectionController _updateImpressionCountForItem:shouldCountAsImpression:](self, "_updateImpressionCountForItem:shouldCountAsImpression:"))
  {
    accountService = self->_accountService;
    v5 = objc_msgSend(v8, "impressionCount");
    objc_msgSend(v8, "programIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService updateImpressionCount:promotionProgramIdentifier:accountIdentifier:completion:](accountService, "updateImpressionCount:promotionProgramIdentifier:accountIdentifier:completion:", v5, v6, v7, 0);

  }
}

- (void)_updateImpressionCountsForAllItems:(id)a3 shouldCountAsImpression:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  PKAccountService *accountService;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v9 |= -[PKAccountPromotionsSectionController _updateImpressionCountForItem:shouldCountAsImpression:](self, "_updateImpressionCountForItem:shouldCountAsImpression:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
    if ((v9 & 1) != 0)
    {
      accountService = self->_accountService;
      -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountService updateImpressionCountsForPromotions:accountIdentifier:completion:](accountService, "updateImpressionCountsForPromotions:accountIdentifier:completion:", v6, v13, 0);

    }
  }

}

- (BOOL)_updateImpressionCountForItem:(id)a3 shouldCountAsImpression:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  char v10;
  char v11;

  v4 = a4;
  v6 = a3;
  if (!objc_msgSend(v6, "isInTerminalState"))
  {
    if (objc_msgSend(v6, "impressionCount") >= 1)
    {
      objc_msgSend(v6, "resetImpressionCount");
      v11 = 1;
      goto LABEL_12;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  if (!v4)
    goto LABEL_11;
  v7 = objc_msgSend(v6, "impressionCount");
  objc_msgSend(v6, "programIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_itemsLock);
  v9 = -[NSMutableSet containsObject:](self->_promotionsViewedSinceViewLoad, "containsObject:", v8);
  -[NSMutableSet addObject:](self->_promotionsViewedSinceViewLoad, "addObject:", v8);
  os_unfair_lock_unlock(&self->_itemsLock);
  if (v7)
    v10 = v9;
  else
    v10 = 0;
  if ((v10 & 1) == 0)
    objc_msgSend(v6, "incrementImpressionCount");
  v11 = v10 ^ 1;

LABEL_12:
  return v11;
}

- (id)_promotionsWithOrderingContext:(unint64_t)a3
{
  void *v5;
  void *v6;
  os_unfair_lock_s *p_itemsLock;
  uint64_t v8;
  NSArray *orderings;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[PKAccountPromotionsSectionController itemsCopy](self, "itemsCopy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_itemsLock = &self->_itemsLock;
    os_unfair_lock_lock(&self->_itemsLock);
    v8 = MEMORY[0x1E0C809B0];
    orderings = self->_orderings;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __71__PKAccountPromotionsSectionController__promotionsWithOrderingContext___block_invoke;
    v27[3] = &__block_descriptor_40_e33_B16__0__PKAccountEntityOrdering_8l;
    v27[4] = a3;
    -[NSArray pk_firstObjectPassingTest:](orderings, "pk_firstObjectPassingTest:", v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    os_unfair_lock_unlock(p_itemsLock);
    if (v11)
    {
      v21 = v11;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v11, "ordering");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            v22[0] = v8;
            v22[1] = 3221225472;
            v22[2] = __71__PKAccountPromotionsSectionController__promotionsWithOrderingContext___block_invoke_2;
            v22[3] = &unk_1E3E787C8;
            v22[4] = v17;
            objc_msgSend(v5, "pk_firstObjectPassingTest:", v22);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "safelyAddObject:", v18);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v14);
      }

      v19 = (void *)objc_msgSend(v6, "copy");
      v11 = v21;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

BOOL __71__PKAccountPromotionsSectionController__promotionsWithOrderingContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return v2 == objc_msgSend(a2, "context");
}

uint64_t __71__PKAccountPromotionsSectionController__promotionsWithOrderingContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "programIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v8 = 1;
  }
  else
  {
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7)
      v8 = 0;
    else
      v8 = objc_msgSend(v4, "isEqualToString:", v5);
  }

  return v8;
}

- (id)_promotionsWithDefaultOrdering
{
  void *v2;
  void *v3;

  -[PKAccountPromotionsSectionController itemsCopy](self, "itemsCopy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_214);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __70__PKAccountPromotionsSectionController__promotionsWithDefaultOrdering__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v9 = objc_msgSend(v7, "compare:", v6);
      if (!v9)
      {
        objc_msgSend(v5, "programIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "programIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "compare:", v11);

      }
    }
    else
    {
      v9 = -1;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_clearViewedPromotions
{
  os_unfair_lock_s *p_itemsLock;

  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  -[NSMutableSet removeAllObjects](self->_promotionsViewedSinceViewLoad, "removeAllObjects");
  os_unfair_lock_unlock(p_itemsLock);
}

- (void)_reloadDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke;
  v22[3] = &unk_1E3E64410;
  v22[4] = self;
  v8 = v6;
  v23 = v8;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v5, "addOperation:", v22);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_3;
  v19[3] = &unk_1E3E64410;
  v19[4] = self;
  v9 = v8;
  v20 = v9;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v5, "addOperation:", v19);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_5;
  v16[3] = &unk_1E3E64410;
  v16[4] = self;
  v10 = v9;
  v17 = v10;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v5, "addOperation:", v16);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_7;
  v14[3] = &unk_1E3E66078;
  v12 = v4;
  v15 = v12;
  v13 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v11, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_2;
  v14[3] = &unk_1E3E72C30;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  objc_msgSend(v11, "accountPromotionsForAccountWithIdentifier:completion:", v10, v14);

  objc_destroyWeak(&v17);
}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setItems:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_4;
  v14[3] = &unk_1E3E78878;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  objc_msgSend(v11, "accountPromotionBehaviorForAccountWithIdentifier:completion:", v10, v14);

  objc_destroyWeak(&v17);
}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  id v6;

  v6 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 20);
    objc_storeStrong((id *)&v5[12], a2);
    os_unfair_lock_unlock(v5 + 20);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_6;
  v14[3] = &unk_1E3E72C30;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  objc_msgSend(v11, "accountEntityOrderingsForAccountWithIdentifier:entityType:completion:", v10, 2, v14);

  objc_destroyWeak(&v17);
}

void __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  id v6;

  v6 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 20);
    objc_storeStrong((id *)&v5[14], a2);
    os_unfair_lock_unlock(v5 + 20);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __66__PKAccountPromotionsSectionController__reloadDataWithCompletion___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v5;
  uint64_t result;

  v5 = objc_msgSend(a4, "isCanceled");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, v5 ^ 1u);
  return result;
}

- (void)didUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id WeakRetained;
  _QWORD block[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  if (v10 == v9)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

      goto LABEL_11;
    }
    v12 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_11;
  }
  -[PKAccountPromotionsSectionController setItems:](self, "setItems:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__PKAccountPromotionsSectionController_didUpdateAccountPromotions_accountIdentifier___block_invoke;
    block[3] = &unk_1E3E612E8;
    v15 = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
LABEL_11:

}

uint64_t __85__PKAccountPromotionsSectionController_didUpdateAccountPromotions_accountIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataForSectionIdentifier:animated:", CFSTR("PKRewardsHubSectionAccountPromotions"), 1);
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_cellRegistration, a3);
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_remoteImagePreparer, 0);
  objc_storeStrong((id *)&self->_promotionsViewedSinceViewLoad, 0);
  objc_storeStrong((id *)&self->_orderings, 0);
  objc_storeStrong((id *)&self->_promotionBehavior, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
