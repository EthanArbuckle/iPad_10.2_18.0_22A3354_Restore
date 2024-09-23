@implementation PKDashboardViewController

+ (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

- (PKDashboardViewController)initWithDataSource:(id)a3 presenters:(id)a4 layout:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  PKDashboardViewController *v13;
  uint64_t v14;
  PKUISpringAnimationFactory *collectionViewFactory;
  PKUISpringAnimationFactory *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *titlesForSection;
  NSMutableDictionary *v20;
  NSMutableDictionary *footerTextItemsBySection;
  NSMutableDictionary *v22;
  NSMutableDictionary *blocksOnVisibilityChange;
  PKDashboardTitleHeaderView *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  PKDashboardTitleHeaderView *sampleHeaderView;
  PKDashboardFooterTextView *v31;
  PKDashboardFooterTextView *sampleFooterView;
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0DC3610]);
    objc_msgSend(v12, "setScrollDirection:", 0);
    objc_msgSend(v12, "setSectionInset:", 12.0, 0.0, 12.0, 0.0);
  }
  v34.receiver = self;
  v34.super_class = (Class)PKDashboardViewController;
  v13 = -[PKDashboardViewController initWithCollectionViewLayout:](&v34, sel_initWithCollectionViewLayout_, v12);
  if (v13)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D6C038]), "initWithMass:stiffness:damping:", 1.0, 107.313414, 18.18598);
    collectionViewFactory = v13->_collectionViewFactory;
    v13->_collectionViewFactory = (PKUISpringAnimationFactory *)v14;

    v16 = v13->_collectionViewFactory;
    PKMagicCurve();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKUISpringAnimationFactory setTiming:](v16, "setTiming:", v17);

    -[PKDashboardViewController _setupPresenters:](v13, "_setupPresenters:", v10);
    objc_storeStrong((id *)&v13->_dataSource, a3);
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "setDataSourceDelegate:", v13);
    if (v11)
      objc_storeStrong((id *)&v13->_customLayout, a5);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    titlesForSection = v13->_titlesForSection;
    v13->_titlesForSection = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    footerTextItemsBySection = v13->_footerTextItemsBySection;
    v13->_footerTextItemsBySection = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    blocksOnVisibilityChange = v13->_blocksOnVisibilityChange;
    v13->_blocksOnVisibilityChange = v22;

    v13->_shouldUseClearNavigationBar = 0;
    v24 = [PKDashboardTitleHeaderView alloc];
    v25 = *MEMORY[0x1E0C9D648];
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v29 = -[PKDashboardTitleHeaderView initWithFrame:](v24, "initWithFrame:", *MEMORY[0x1E0C9D648], v26, v27, v28);
    sampleHeaderView = v13->_sampleHeaderView;
    v13->_sampleHeaderView = (PKDashboardTitleHeaderView *)v29;

    v31 = -[PKDashboardFooterTextView initWithFrame:]([PKDashboardFooterTextView alloc], "initWithFrame:", v25, v26, v27, v28);
    sampleFooterView = v13->_sampleFooterView;
    v13->_sampleFooterView = v31;

    -[PKDashboardViewController _updateNavigationBarAppearance](v13, "_updateNavigationBarAppearance");
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_presentersOptionalMethods);
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardViewController;
  -[PKDashboardViewController dealloc](&v3, sel_dealloc);
}

- (void)_setupPresenters:(id)a3
{
  id v4;
  id v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  size_t v14;
  id v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  NSDictionary *v28;
  NSDictionary *presentersPerIdentifier;
  NSDictionary *v30;
  NSDictionary *presenterMethodsIndexPerIdentifier;
  PKDashboardViewController *v32;
  id v33;
  id v34;

  v34 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_msgSend(v34, "count");
  v7 = 1016;
  self->_presentersOptionalMethods = ($EBFECD39B7590C85DF69C2EC68399AD0 *)malloc_type_malloc(v6, 0x100004077774924uLL);
  if (v6)
  {
    v8 = 0;
    v32 = self;
    v33 = v4;
    do
    {
      objc_msgSend(v34, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend(v9, "itemClass"), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v11, v10);

      v12 = objc_opt_respondsToSelector();
      v13 = v7;
      v14 = v6;
      v15 = v5;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = 2;
      else
        v16 = 0;
      v17 = v16 & 0xFE | v12 & 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = 4;
      else
        v18 = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = 8;
      else
        v19 = 0;
      v20 = v17 | v18 | v19;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = 16;
      else
        v21 = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v22 = 32;
      else
        v22 = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = 64;
      else
        v23 = 0;
      v24 = v21 | v22;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v25 = 0x80;
      else
        v25 = 0;
      v26 = v24 | v23;
      v5 = v15;
      v6 = v14;
      v7 = v13;
      v27 = v20 | v26;
      self = v32;
      v4 = v33;
      (*(_BYTE **)((char *)&v32->super.super.super.super.isa + v7))[v8] = v27 | v25;

      ++v8;
    }
    while (v6 != v8);
  }
  v28 = (NSDictionary *)objc_msgSend(v4, "copy");
  presentersPerIdentifier = self->_presentersPerIdentifier;
  self->_presentersPerIdentifier = v28;

  v30 = (NSDictionary *)objc_msgSend(v5, "copy");
  presenterMethodsIndexPerIdentifier = self->_presenterMethodsIndexPerIdentifier;
  self->_presenterMethodsIndexPerIdentifier = v30;

}

- ($EBFECD39B7590C85DF69C2EC68399AD0)methodsForItemIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;

  -[NSDictionary objectForKey:](self->_presenterMethodsIndexPerIdentifier, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return ($EBFECD39B7590C85DF69C2EC68399AD0)*((unsigned __int8 *)self->_presentersOptionalMethods + v5);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  NSDictionary *presentersPerIdentifier;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKDashboardViewController;
  -[PKDashboardViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PKDashboardViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v3, "setBounces:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setPrefetchDataSource:", self);
  objc_msgSend(v3, "_setAdjustsContentInsetWhenScrollDisabled:", 1);
  presentersPerIdentifier = self->_presentersPerIdentifier;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PKDashboardViewController_viewDidLoad__block_invoke;
  v8[3] = &unk_1E3E70D68;
  v6 = v3;
  v9 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](presentersPerIdentifier, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("HeaderViewIdentifier"));
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("FooterViewIdentifier"));
  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("HeaderSupplementaryViewIdentifier"));
  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A0], CFSTR("FooterSupplementaryViewIdentifier"));
  -[PKDashboardViewController _updateNavigationBarVisibility](self, "_updateNavigationBarVisibility");
  if (self->_contentIsLoaded)
    -[PKDashboardViewController updateContent](self, "updateContent");
  -[PKDashboardViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67A90]);

}

void __40__PKDashboardViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
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
  objc_msgSend(a3, "collectionViewCellClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
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
        objc_msgSend(*(id *)(a1 + 32), "registerClass:forCellWithReuseIdentifier:", objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8)), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)setActionForVisibilityChange:(id)a3 indexPath:(id)a4
{
  id v6;
  NSMutableDictionary *blocksOnVisibilityChange;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSSet *v12;
  NSSet *visibleCellsExcludingSafeArea;
  NSSet *v14;
  id aBlock;

  aBlock = a3;
  v6 = a4;
  if (v6)
  {
    blocksOnVisibilityChange = self->_blocksOnVisibilityChange;
    if (aBlock)
    {
      v8 = _Block_copy(aBlock);
      -[NSMutableDictionary setObject:forKey:](blocksOnVisibilityChange, "setObject:forKey:", v8, v6);

      -[PKDashboardViewController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeAreaInsets");
      v11 = v10;
      objc_msgSend(v9, "contentOffset");
      if (-[PKDashboardViewController _isCellVisibleAtIndexPath:withTopSafeArea:contentOffset:](self, "_isCellVisibleAtIndexPath:withTopSafeArea:contentOffset:", v6, v11))
      {
        -[NSSet setByAddingObject:](self->_visibleCellsExcludingSafeArea, "setByAddingObject:", v6);
        v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
        visibleCellsExcludingSafeArea = self->_visibleCellsExcludingSafeArea;
        self->_visibleCellsExcludingSafeArea = v12;

      }
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](blocksOnVisibilityChange, "removeObjectForKey:", v6);
      -[NSSet pk_setByRemovingObject:](self->_visibleCellsExcludingSafeArea, "pk_setByRemovingObject:", v6);
      v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v9 = self->_visibleCellsExcludingSafeArea;
      self->_visibleCellsExcludingSafeArea = v14;
    }

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  _BOOL4 inScrollViewDidScroll;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  void *v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  void *v40;
  NSSet *v41;
  NSSet *visibleCellsExcludingSafeArea;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  inScrollViewDidScroll = self->_inScrollViewDidScroll;
  self->_inScrollViewDidScroll = 1;
  -[PKDashboardViewController collectionView](self, "collectionView", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "shouldOverrideContentOffset"))
    {
      objc_msgSend(v11, "preferredContentOffset");
      v13 = v12 == v7;
      if (v14 != v9)
        v13 = 0;
      if (!inScrollViewDidScroll && !v13)
      {
        objc_msgSend(v5, "setContentOffset:");
        goto LABEL_40;
      }
    }
    objc_msgSend(v11, "contentDidScroll");
  }
  -[PKDashboardViewController _updateNavigationBarVisibility](self, "_updateNavigationBarVisibility");
  objc_msgSend(v5, "safeAreaInsets");
  v16 = v15;
  if (vabdd_f64(v9, self->_lastScrollOffset) > 10.0)
  {
    v44 = v11;
    self->_lastScrollOffset = v9;
    -[NSMutableDictionary allKeys](self->_blocksOnVisibilityChange, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v17);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v54 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (!-[PKDashboardViewController _isCellVisibleAtIndexPath:withTopSafeArea:contentOffset:](self, "_isCellVisibleAtIndexPath:withTopSafeArea:contentOffset:", v24, v16, v9))objc_msgSend(v18, "removeObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v21);
    }

    if (self->_visibleCellsExcludingSafeArea)
    {
      v43 = v5;
      v25 = (void *)objc_msgSend(v18, "mutableCopy");
      objc_msgSend(v25, "minusSet:", self->_visibleCellsExcludingSafeArea);
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v26 = v25;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v50 != v29)
              objc_enumerationMutation(v26);
            -[NSMutableDictionary objectForKey:](self->_blocksOnVisibilityChange, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j));
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = (void *)v31;
            if (v31)
              (*(void (**)(uint64_t, uint64_t))(v31 + 16))(v31, 1);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        }
        while (v28);
      }

      v33 = (void *)-[NSSet mutableCopy](self->_visibleCellsExcludingSafeArea, "mutableCopy");
      objc_msgSend(v33, "minusSet:", v18);
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v34 = v33;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v46;
        do
        {
          for (k = 0; k != v36; ++k)
          {
            if (*(_QWORD *)v46 != v37)
              objc_enumerationMutation(v34);
            -[NSMutableDictionary objectForKey:](self->_blocksOnVisibilityChange, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k));
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = (void *)v39;
            if (v39)
              (*(void (**)(uint64_t, _QWORD))(v39 + 16))(v39, 0);

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        }
        while (v36);
      }

      v5 = v43;
    }
    v41 = (NSSet *)objc_msgSend(v18, "copy");
    visibleCellsExcludingSafeArea = self->_visibleCellsExcludingSafeArea;
    self->_visibleCellsExcludingSafeArea = v41;

    v11 = v44;
  }
LABEL_40:
  self->_inScrollViewDidScroll = 0;

}

- (BOOL)_isCellVisibleAtIndexPath:(id)a3 withTopSafeArea:(double)a4 contentOffset:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;

  -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "frame");
    v14 = a4 + a5 <= v12 + v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)shouldPresentAllContent:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_shouldPresentAllContent != a3)
  {
    self->_shouldPresentAllContent = a3;
    if (a3)
    {
      self->_presentationAnimated = a4;
      if (self->_contentIsLoaded)
        -[PKDashboardViewController _presentAllContent](self, "_presentAllContent");
    }
    else
    {
      self->_presentationAnimated = 0;
      -[PKDashboardViewController _hideAllContentAnimated:](self, "_hideAllContentAnimated:", a4);
    }
  }
}

- (void)setShouldUseClearNavigationBar:(BOOL)a3
{
  if (((!self->_shouldUseClearNavigationBar ^ a3) & 1) == 0)
  {
    self->_shouldUseClearNavigationBar = a3;
    -[PKDashboardViewController _updateNavigationBarAppearance](self, "_updateNavigationBarAppearance");
  }
}

- (NSArray)actualIndexPathsForSelectedItems
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKDashboardViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
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
        -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return (NSArray *)v3;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return -[PKDashboardDataSource numberOfSections](self->_dataSource, "numberOfSections", a3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *titlesForSection;
  void *v11;
  void *v12;
  NSMutableDictionary *footerTextItemsBySection;
  void *v14;
  _BOOL4 v15;
  int64_t v16;
  int64_t v17;

  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AE621C]();
  v8 = -[PKDashboardDataSource numberOfItemsInSection:](self->_dataSource, "numberOfItemsInSection:", a4);
  -[PKDashboardDataSource titleForSection:](self->_dataSource, "titleForSection:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  titlesForSection = self->_titlesForSection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[NSMutableDictionary setObject:forKey:](titlesForSection, "setObject:forKey:", v9, v11);
  else
    -[NSMutableDictionary removeObjectForKey:](titlesForSection, "removeObjectForKey:", v11);

  -[PKDashboardDataSource footerTextItemForSection:](self->_dataSource, "footerTextItemForSection:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  footerTextItemsBySection = self->_footerTextItemsBySection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    -[NSMutableDictionary setObject:forKey:](footerTextItemsBySection, "setObject:forKey:", v12, v14);
  else
    -[NSMutableDictionary removeObjectForKey:](footerTextItemsBySection, "removeObjectForKey:", v14);

  v15 = -[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", a4);
  if (v9)
    v16 = v8 + 1;
  else
    v16 = v8;
  if (v12)
    ++v16;
  if (v15)
    v17 = v8;
  else
    v17 = v16;

  objc_autoreleasePoolPop(v7);
  return v17;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSMutableDictionary *footerTextItemsBySection;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v29;
  void *v30;
  uint64_t v31;

  v6 = a3;
  v7 = a4;
  if (!-[PKDashboardViewController _isIndexPathAHeader:](self, "_isIndexPathAHeader:", v7))
  {
    if (-[PKDashboardViewController _isIndexPathAFooter:](self, "_isIndexPathAFooter:", v7))
    {
      -[PKDashboardViewController _footerViewAtIndexPath:isCell:](self, "_footerViewAtIndexPath:isCell:", v7, 1);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardDataSource itemAtIndexPath:](self->_dataSource, "itemAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_presentersPerIdentifier, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForItem:inCollectionView:atIndexPath:", v11, v6, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", objc_msgSend(v7, "section"));
    if ((objc_msgSend(v9, "wantsCustomAppearance") & 1) != 0)
    {
LABEL_24:

      goto LABEL_25;
    }
    v29 = v13;
    v30 = v12;
    v31 = objc_msgSend(v10, "row");
    footerTextItemsBySection = self->_footerTextItemsBySection;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "section"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](footerTextItemsBySection, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v6, "numberOfItemsInSection:", objc_msgSend(v7, "section"));
    v19 = objc_msgSend(v7, "row");
    if (v17)
      v20 = v14;
    else
      v20 = 1;
    v21 = v20 == 0;
    v22 = 1;
    if (v21)
      v22 = 2;
    v23 = v19 + v22;
    if (v31 || v18 != v23)
    {
      if (!v31 || v18 != v23)
      {
        objc_msgSend(v9, "setMaskType:", v31 == 0);
        v12 = v30;
        v13 = v29;
        if ((-[PKDashboardViewController methodsForItemIdentifier:](self, "methodsForItemIdentifier:", v30) & 0x80) != 0)
          v27 = objc_msgSend(v29, "hideSeparatorForItem:inCollectionView:", v11, v6) | v14;
        else
          v27 = v14;
        v26 = v27 ^ 1u;
        goto LABEL_23;
      }
      v24 = v9;
      v25 = 2;
    }
    else
    {
      v24 = v9;
      v25 = 3;
    }
    objc_msgSend(v24, "setMaskType:", v25);
    v26 = 0;
    v13 = v29;
    v12 = v30;
LABEL_23:
    objc_msgSend(v9, "setShowsBottomSeparator:", v26);
    goto LABEL_24;
  }
  -[PKDashboardViewController _headerViewAtIndexPath:isCell:](self, "_headerViewAtIndexPath:isCell:", v7, 1);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v9 = (void *)v8;
LABEL_25:

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    -[PKDashboardViewController _headerViewAtIndexPath:isCell:](self, "_headerViewAtIndexPath:isCell:", v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC48A0]))
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[PKDashboardViewController _footerViewAtIndexPath:isCell:](self, "_footerViewAtIndexPath:isCell:", v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  int *v20;
  void *v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v10 = &OBJC_IVAR___PKPaymentPassAMPEnrollmentViewController__flowItemDelegate;
    do
    {
      v11 = 0;
      v23 = v8;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11);
        if (!-[PKDashboardViewController _isIndexPathAHeader:](self, "_isIndexPathAHeader:", v12, v22)
          && !-[PKDashboardViewController _isIndexPathAFooter:](self, "_isIndexPathAFooter:", v12))
        {
          v13 = (void *)MEMORY[0x1A1AE621C]();
          -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v10[255]), "itemAtIndexPath:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((-[PKDashboardViewController methodsForItemIdentifier:](self, "methodsForItemIdentifier:", v16) & 0x40) != 0)
          {
            -[NSDictionary objectForKey:](self->_presentersPerIdentifier, "objectForKey:", v16);
            v17 = v9;
            v18 = v13;
            v19 = v6;
            v20 = v10;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "prefetchForItem:inCollectionView:", v15, v22);

            v10 = v20;
            v6 = v19;
            v13 = v18;
            v9 = v17;
            v8 = v23;
          }

          objc_autoreleasePoolPop(v13);
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

}

- (BOOL)_isListSectionAtIndex:(int64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PKDashboardDataSource isListLayoutForSection:](self->_dataSource, "isListLayoutForSection:", a3);
  else
    return 0;
}

- (BOOL)_isIndexPathAHeader:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  NSMutableDictionary *titlesForSection;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (-[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", v5)
    || objc_msgSend(v4, "row"))
  {
    v6 = 0;
  }
  else
  {
    titlesForSection = self->_titlesForSection;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](titlesForSection, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9 != 0;

  }
  return v6;
}

- (BOOL)_isIndexPathAFooter:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *footerTextItemsBySection;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (-[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", v5))
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(v4, "row") + 1;
    -[PKDashboardViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == -[PKDashboardViewController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v8, v5))
    {
      footerTextItemsBySection = self->_footerTextItemsBySection;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](footerTextItemsBySection, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)_actualItemIndexPathForIndexPath:(id)a3
{
  id v4;
  NSMutableDictionary *titlesForSection;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  titlesForSection = self->_titlesForSection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](titlesForSection, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && !-[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", objc_msgSend(v4, "section"))
    && objc_msgSend(v4, "row") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v4, "row") - 1, objc_msgSend(v4, "section"));
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }

  return v4;
}

- (id)_internalIndexPathForItemIndexPath:(id)a3
{
  id v4;
  NSMutableDictionary *titlesForSection;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  titlesForSection = self->_titlesForSection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](titlesForSection, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && !-[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", objc_msgSend(v4, "section")))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v4, "row") + 1, objc_msgSend(v4, "section"));
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }

  return v4;
}

- (id)_headerViewAtIndexPath:(id)a3 isCell:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableDictionary *titlesForSection;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a4;
  v6 = a3;
  titlesForSection = self->_titlesForSection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](titlesForSection, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v12 = 0;
    goto LABEL_21;
  }
  -[PKDashboardViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v4)
    objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("HeaderViewIdentifier"), v6);
  else
    objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", *MEMORY[0x1E0DC48A8], CFSTR("HeaderSupplementaryViewIdentifier"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v13);

  objc_msgSend(v9, "titleColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitleColor:", v15);

  }
  objc_msgSend(v12, "setTitleStyle:", objc_msgSend(v9, "style"));
  objc_msgSend(v9, "actionTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v9, "actionTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActionTitle:", v17);
  }
  else
  {
    objc_msgSend(v9, "actionImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_13;
    objc_msgSend(v9, "actionImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActionImage:", v17);
  }

LABEL_13:
  objc_msgSend(v9, "action");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v9, "action");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAction:", v20);
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v9, "menu");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v9, "menu");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMenu:", v20);
    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(v9, "actionColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v9, "actionColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActionColor:", v23);

  }
  objc_msgSend(v12, "setActionStyle:", objc_msgSend(v9, "actionStyle"));
  objc_msgSend(v12, "setUseActionInsets:", objc_msgSend(v9, "useActionInsets"));
  objc_msgSend(v12, "setPreferBaselineAlignment:", objc_msgSend(v9, "preferBaselineAlignment"));

LABEL_21:
  return v12;
}

- (id)_footerViewAtIndexPath:(id)a3 isCell:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableDictionary *footerTextItemsBySection;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a4;
  v6 = a3;
  footerTextItemsBySection = self->_footerTextItemsBySection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](footerTextItemsBySection, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PKDashboardViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v4)
      objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("FooterViewIdentifier"), v6);
    else
      objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", *MEMORY[0x1E0DC48A0], CFSTR("FooterSupplementaryViewIdentifier"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setMaximumLines:", objc_msgSend(v9, "maximumNumberOfLines"));
    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
    objc_msgSend(v12, "setHorizontalInset:");
    objc_msgSend(v9, "footerText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFooterText:", v13);

    v14 = objc_msgSend(v9, "linkRange");
    objc_msgSend(v12, "setLinkRange:", v14, v15);
    objc_msgSend(v9, "linkTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLinkTextColor:", v16);

    objc_msgSend(v9, "action");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAction:", v17);

    objc_msgSend(v12, "setBottomInsetType:", objc_msgSend(v9, "bottomInsetType"));
    if ((objc_msgSend(v9, "useHorizontalInsets") & 1) == 0)
      objc_msgSend(v12, "setHorizontalInset:", 0.0);
    objc_msgSend(v12, "setRemoveContainerInsets:", objc_msgSend(v9, "useContentInsets") ^ 1);
    objc_msgSend(v9, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v18);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (-[PKDashboardViewController _isIndexPathAHeader:](self, "_isIndexPathAHeader:", v7)
    || -[PKDashboardViewController _isIndexPathAFooter:](self, "_isIndexPathAFooter:", v7))
  {
    v8 = 0;
    v9 = v7;
  }
  else
  {
    -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKDashboardDataSource itemAtIndexPath:](self->_dataSource, "itemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[PKDashboardViewController methodsForItemIdentifier:](self, "methodsForItemIdentifier:", v11) & 1) != 0)
    {
      -[NSDictionary objectForKey:](self->_presentersPerIdentifier, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "canSelectItem:inCollectionView:atIndexPath:", v10, v6, v9);

    }
    else
    {
      v8 = 1;
    }

  }
  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!-[PKDashboardViewController _isIndexPathAHeader:](self, "_isIndexPathAHeader:", v6)
    && !-[PKDashboardViewController _isIndexPathAFooter:](self, "_isIndexPathAFooter:", v6)
    && (objc_msgSend(v12, "isEditing") & 1) == 0)
  {
    -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    -[PKDashboardDataSource itemAtIndexPath:](self->_dataSource, "itemAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_presentersPerIdentifier, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didSelectItem:inCollectionView:atIndexPath:navigationController:canPresent:", v8, v12, v7, v11, 0);

    v6 = (id)v7;
  }

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", objc_msgSend(v7, "section"));
  if (objc_msgSend(v7, "item") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v6, "item") - 1, objc_msgSend(v6, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v10, "setBottomSeparatorVisible:animated:", 1, 1);
    }

  }
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", objc_msgSend(v7, "section"));
  if (objc_msgSend(v7, "item") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v6, "item") - 1, objc_msgSend(v6, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v10, "setBottomSeparatorVisible:animated:", 0, 1);
    }

  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  NSMutableDictionary *titlesForSection;
  void *v12;
  void *v13;
  PKDashboardTitleHeaderView *sampleHeaderView;
  void *v15;
  PKDashboardTitleHeaderView *v16;
  void *v17;
  PKDashboardTitleHeaderView *v18;
  void *v19;
  PKDashboardTitleHeaderView *v20;
  void *v21;
  PKDashboardTitleHeaderView *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSMutableDictionary *footerTextItemsBySection;
  void *v29;
  void *v30;
  PKDashboardFooterTextView *sampleFooterView;
  void *v32;
  PKDashboardFooterTextView *v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGSize result;

  v7 = a3;
  v8 = a5;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (-[PKDashboardViewController _isIndexPathAHeader:](self, "_isIndexPathAHeader:", v8))
  {
    titlesForSection = self->_titlesForSection;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](titlesForSection, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      sampleHeaderView = self->_sampleHeaderView;
      objc_msgSend(v13, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardTitleHeaderView setTitle:](sampleHeaderView, "setTitle:", v15);

      -[PKDashboardTitleHeaderView setTitleStyle:](self->_sampleHeaderView, "setTitleStyle:", objc_msgSend(v13, "style"));
      v16 = self->_sampleHeaderView;
      objc_msgSend(v13, "actionTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardTitleHeaderView setActionTitle:](v16, "setActionTitle:", v17);

      v18 = self->_sampleHeaderView;
      objc_msgSend(v13, "actionImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardTitleHeaderView setActionImage:](v18, "setActionImage:", v19);

      v20 = self->_sampleHeaderView;
      objc_msgSend(v13, "action");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardTitleHeaderView setAction:](v20, "setAction:", v21);

      -[PKDashboardTitleHeaderView setActionStyle:](self->_sampleHeaderView, "setActionStyle:", objc_msgSend(v13, "actionStyle"));
      v22 = self->_sampleHeaderView;
      objc_msgSend(v7, "bounds");
      v24 = v23;
      +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
      -[PKDashboardTitleHeaderView sizeThatFits:](v22, "sizeThatFits:", v24 + v25 * -2.0, 3.40282347e38);
      v9 = v26;
      v10 = v27;
    }
  }
  else if (-[PKDashboardViewController _isIndexPathAFooter:](self, "_isIndexPathAFooter:", v8))
  {
    footerTextItemsBySection = self->_footerTextItemsBySection;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "section"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](footerTextItemsBySection, "objectForKey:", v29);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "footerText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        -[PKDashboardFooterTextView setMaximumLines:](self->_sampleFooterView, "setMaximumLines:", objc_msgSend(v13, "maximumNumberOfLines"));
        -[PKDashboardFooterTextView setFooterText:](self->_sampleFooterView, "setFooterText:", v30);
        -[PKDashboardFooterTextView setBottomInsetType:](self->_sampleFooterView, "setBottomInsetType:", objc_msgSend(v13, "bottomInsetType"));
        if ((objc_msgSend(v13, "useHorizontalInsets") & 1) == 0)
          -[PKDashboardCollectionViewCell setHorizontalInset:](self->_sampleFooterView, "setHorizontalInset:", 0.0);
        -[PKDashboardFooterTextView setRemoveContainerInsets:](self->_sampleFooterView, "setRemoveContainerInsets:", objc_msgSend(v13, "useContentInsets") ^ 1);
        sampleFooterView = self->_sampleFooterView;
        objc_msgSend(v13, "font");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardFooterTextView setFont:](sampleFooterView, "setFont:", v32);

        v33 = self->_sampleFooterView;
        objc_msgSend(v7, "bounds");
        -[PKDashboardFooterTextView sizeThatFits:](v33, "sizeThatFits:", v34 + -32.0, 3.40282347e38);
        v9 = v35;
        v10 = v36;
      }

    }
  }
  else
  {
    -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v8);
    v37 = objc_claimAutoreleasedReturnValue();

    -[PKDashboardDataSource itemAtIndexPath:](self->_dataSource, "itemAtIndexPath:", v37);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_presentersPerIdentifier, "objectForKey:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "sizeForItem:inCollectionView:atIndexPath:", v13, v7, v37);
    v9 = v40;
    v10 = v41;

    v8 = (id)v37;
  }

  v42 = v9;
  v43 = v10;
  result.height = v43;
  result.width = v42;
  return result;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "section");
  if (v10 >= -[PKDashboardViewController numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", v16)|| (v11 = objc_msgSend(v9, "item"), v11 >= -[PKDashboardViewController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v16, objc_msgSend(v9, "section")))|| -[PKDashboardViewController _isIndexPathAHeader:](self, "_isIndexPathAHeader:", v9)|| -[PKDashboardViewController _isIndexPathAFooter:](self, "_isIndexPathAFooter:", v9))
  {
    v12 = v9;
  }
  else
  {
    -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKDashboardDataSource itemAtIndexPath:](self->_dataSource, "itemAtIndexPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend((id)objc_opt_class(), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[PKDashboardViewController methodsForItemIdentifier:](self, "methodsForItemIdentifier:", v14) & 2) != 0)
      {
        -[NSDictionary objectForKey:](self->_presentersPerIdentifier, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cellDidDisappear:forItem:inCollectionView:atIndexPath:", v8, v13, v16, v12);

      }
    }

  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (-[PKDashboardViewController _isIndexPathAHeader:](self, "_isIndexPathAHeader:", v9)
    || -[PKDashboardViewController _isIndexPathAFooter:](self, "_isIndexPathAFooter:", v9))
  {
    v10 = v9;
  }
  else
  {
    -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKDashboardDataSource itemAtIndexPath:](self->_dataSource, "itemAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend((id)objc_opt_class(), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[PKDashboardViewController methodsForItemIdentifier:](self, "methodsForItemIdentifier:", v12) & 4) != 0)
      {
        -[NSDictionary objectForKey:](self->_presentersPerIdentifier, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cellWillAppear:forItem:inCollectionView:atIndexPath:", v8, v11, v14, v10);

      }
    }

  }
}

- (BOOL)itemIsStackableInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (-[PKDashboardViewController _isIndexPathAHeader:](self, "_isIndexPathAHeader:", v7)
    || -[PKDashboardViewController _isIndexPathAFooter:](self, "_isIndexPathAFooter:", v7))
  {
    v8 = 0;
    v9 = v7;
  }
  else
  {
    -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKDashboardDataSource itemAtIndexPath:](self->_dataSource, "itemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[PKDashboardViewController methodsForItemIdentifier:](self, "methodsForItemIdentifier:", v11) & 0x10) != 0)
      {
        -[NSDictionary objectForKey:](self->_presentersPerIdentifier, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v12, "cellIsStackableForItem:inCollectionView:atIndexPath:", v10, v6, v9);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)itemIsIndependentInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (-[PKDashboardViewController _isIndexPathAHeader:](self, "_isIndexPathAHeader:", v7)
    || -[PKDashboardViewController _isIndexPathAFooter:](self, "_isIndexPathAFooter:", v7))
  {
    v8 = 0;
    v9 = v7;
  }
  else
  {
    -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKDashboardDataSource itemAtIndexPath:](self->_dataSource, "itemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[PKDashboardViewController methodsForItemIdentifier:](self, "methodsForItemIdentifier:", v11) & 0x20) != 0)
      {
        -[NSDictionary objectForKey:](self->_presentersPerIdentifier, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v12, "cellIsIndependentForItem:inCollectionView:atIndexPath:", v10, v6, v9);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 isListSectionAtIndex:(int64_t)a5
{
  return -[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", a5, a4);
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 hasHeaderForSectionAtIndex:(int64_t)a5
{
  NSMutableDictionary *titlesForSection;
  void *v6;
  void *v7;

  titlesForSection = self->_titlesForSection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](titlesForSection, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(titlesForSection) = v7 != 0;

  return (char)titlesForSection;
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 hasFooterForSectionAtIndex:(int64_t)a5
{
  NSMutableDictionary *footerTextItemsBySection;
  void *v6;
  void *v7;

  footerTextItemsBySection = self->_footerTextItemsBySection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](footerTextItemsBySection, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(footerTextItemsBySection) = v7 != 0;

  return (char)footerTextItemsBySection;
}

- (id)collectionView:(id)a3 layout:(id)a4 trailingSwipeActionsConfigurationForItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDashboardDataSource *dataSource;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dataSource = self->_dataSource;
  -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardDataSource itemAtIndexPath:](dataSource, "itemAtIndexPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && -[PKDashboardDataSource canDeleteItem:](self->_dataSource, "canDeleteItem:", v13))
  {
    PKLocalizedString(CFSTR("DASHBOARD_TRAILING_SWIPE_ACTION_TITLE_REMOVE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v15 = (void *)MEMORY[0x1E0DC36C8];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __103__PKDashboardViewController_collectionView_layout_trailingSwipeActionsConfigurationForItemAtIndexPath___block_invoke;
    v21[3] = &unk_1E3E70500;
    objc_copyWeak(&v23, &location);
    v22 = v13;
    objc_msgSend(v15, "contextualActionWithStyle:title:handler:", 1, v14, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0DC3D08];
    v25[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "configurationWithActions:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setPerformsFirstActionWithFullSwipe:", 0);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __103__PKDashboardViewController_collectionView_layout_trailingSwipeActionsConfigurationForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id *WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a4;
  WeakRetained = (id *)objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained[141], "deleteItem:completionHandler:", *(_QWORD *)(a1 + 32), v6);

}

- (void)updateContent
{
  void *v3;
  void *v4;

  if (self->_contentIsLoaded)
  {
    -[PKDashboardViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

    -[PKDashboardViewController collectionViewLayout](self, "collectionViewLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateLayout");

    if (self->_shouldPresentAllContent)
    {
      self->_presentationAnimated = 1;
      -[PKDashboardViewController _presentAllContent](self, "_presentAllContent");
    }
  }
}

- (void)contentIsLoaded
{
  if (!self->_contentIsLoaded)
  {
    self->_contentIsLoaded = 1;
    if (-[PKDashboardViewController isViewLoaded](self, "isViewLoaded"))
      -[PKDashboardViewController updateContent](self, "updateContent");
  }
}

- (void)invalidateLayoutForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKDashboardViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PKDashboardViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadItemsAtIndexPaths:", v8);

  }
}

- (void)itemChanged:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[PKDashboardViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardViewController _internalIndexPathForItemIndexPath:](self, "_internalIndexPathForItemIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_presentersPerIdentifier, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateCell:forItem:inCollectionView:atIndexPath:", v9, v12, v7, v6);

  }
}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  -[PKDashboardViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__PKDashboardViewController_performBatchUpdates_completion___block_invoke;
  v13[3] = &unk_1E3E61590;
  v14 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__PKDashboardViewController_performBatchUpdates_completion___block_invoke_2;
  v11[3] = &unk_1E3E614F0;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBatchUpdates:completion:", v13, v11);

}

uint64_t __60__PKDashboardViewController_performBatchUpdates_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__PKDashboardViewController_performBatchUpdates_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)reloadSections:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PKDashboardViewController_reloadSections___block_invoke;
  v6[3] = &unk_1E3E62150;
  v6[4] = self;
  v4 = a3;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v6);
  -[PKDashboardViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSections:", v4);

}

void __44__PKDashboardViewController_reloadSections___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "titleForSection:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setObject:forKey:", v9, v5);
  else
    objc_msgSend(v4, "removeObjectForKey:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "footerTextItemForSection:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1056);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v7, "setObject:forKey:", v6, v8);
  else
    objc_msgSend(v7, "removeObjectForKey:", v8);

}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
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
        -[PKDashboardViewController _internalIndexPathForItemIndexPath:](self, "_internalIndexPathForItemIndexPath:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[PKDashboardViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteItemsAtIndexPaths:", v5);

}

- (void)insertItemsAtIndexPaths:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
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
        -[PKDashboardViewController _internalIndexPathForItemIndexPath:](self, "_internalIndexPathForItemIndexPath:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[PKDashboardViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertItemsAtIndexPaths:", v5);

}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PKDashboardViewController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveItemAtIndexPath:toIndexPath:", v7, v6);

}

- (void)insertSections:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKDashboardViewController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSections:", v4);

}

- (void)deleteSections:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKDashboardViewController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteSections:", v4);

}

- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4
{
  id v6;

  -[PKDashboardViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moveSection:toSection:", a3, a4);

}

- (void)_presentAllContent
{
  void *v3;
  PKDashboardLayout *customLayout;
  _QWORD v5[5];
  id v6;

  if (!self->_isPresentingContent)
  {
    -[PKDashboardViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    customLayout = self->_customLayout;
    if (customLayout)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        self->_isPresentingContent = 1;
        if (self->_presentationAnimated)
        {
          objc_msgSend(v3, "setScrollEnabled:", 0);
          v5[0] = MEMORY[0x1E0C809B0];
          v5[1] = 3221225472;
          v5[2] = __47__PKDashboardViewController__presentAllContent__block_invoke_2;
          v5[3] = &unk_1E3E619E0;
          v5[4] = self;
          v6 = v3;
          objc_msgSend(v6, "performBatchUpdates:completion:", &__block_literal_global_141, v5);

        }
        else
        {
          -[PKDashboardLayout revealContentAnimated:](self->_customLayout, "revealContentAnimated:", 0);
          -[PKDashboardLayout invalidateLayout](self->_customLayout, "invalidateLayout");
          self->_isPresentingContent = 0;
        }
        goto LABEL_8;
      }
      customLayout = self->_customLayout;
    }
    -[PKDashboardLayout invalidateLayout](customLayout, "invalidateLayout");
    objc_msgSend(v3, "setScrollEnabled:", 1);
LABEL_8:

  }
}

void __47__PKDashboardViewController__presentAllContent__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  double v8;
  dispatch_time_t v9;
  _QWORD block[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104);
  v12[2] = __47__PKDashboardViewController__presentAllContent__block_invoke_3;
  v12[3] = &unk_1E3E61388;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v7;
  objc_msgSend(v2, "pkui_animateUsingFactory:withDelay:options:animations:completion:", v4, 0, v12, 0, 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "duration");
  v9 = dispatch_time(0, (uint64_t)(v8 * 0.8 * 1000000000.0));
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __47__PKDashboardViewController__presentAllContent__block_invoke_6;
  block[3] = &unk_1E3E612E8;
  v11 = *(id *)(a1 + 40);
  dispatch_after(v9, MEMORY[0x1E0C80D38], block);

}

uint64_t __47__PKDashboardViewController__presentAllContent__block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  _QWORD v4[4];
  uint64_t v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__PKDashboardViewController__presentAllContent__block_invoke_4;
  v4[3] = &unk_1E3E612E8;
  v1 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__PKDashboardViewController__presentAllContent__block_invoke_5;
  v3[3] = &unk_1E3E62288;
  v3[4] = v5;
  return objc_msgSend(v1, "performBatchUpdates:completion:", v4, v3);
}

uint64_t __47__PKDashboardViewController__presentAllContent__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "revealContentAnimated:", 1);
}

uint64_t __47__PKDashboardViewController__presentAllContent__block_invoke_5(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1099) = 0;
  return result;
}

uint64_t __47__PKDashboardViewController__presentAllContent__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setScrollEnabled:", 1);
}

- (void)_hideAllContentAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  PKUISpringAnimationFactory *collectionViewFactory;
  _QWORD v8[4];
  id v9;
  PKDashboardViewController *v10;

  if (!self->_isHidingContent)
  {
    v3 = a3;
    -[PKDashboardViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScrollEnabled:", 0);
    if (self->_customLayout && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v3)
      {
        self->_isHidingContent = 1;
        v6 = (void *)MEMORY[0x1E0DC3F10];
        collectionViewFactory = self->_collectionViewFactory;
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __53__PKDashboardViewController__hideAllContentAnimated___block_invoke;
        v8[3] = &unk_1E3E61388;
        v9 = v5;
        v10 = self;
        objc_msgSend(v6, "pkui_animateUsingFactory:withDelay:options:animations:completion:", collectionViewFactory, 0x20000, v8, 0, 0.0);

      }
      else
      {
        -[PKDashboardLayout hideContent](self->_customLayout, "hideContent");
      }
    }

  }
}

void __53__PKDashboardViewController__hideAllContentAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PKDashboardViewController__hideAllContentAnimated___block_invoke_2;
  v8[3] = &unk_1E3E612E8;
  v2 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PKDashboardViewController__hideAllContentAnimated___block_invoke_3;
  v5[3] = &unk_1E3E619E0;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v3, "performBatchUpdates:completion:", v8, v5);

}

uint64_t __53__PKDashboardViewController__hideAllContentAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "hideContent");
}

uint64_t __53__PKDashboardViewController__hideAllContentAnimated___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setScrollEnabled:", 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1100) = 0;
  return result;
}

- (void)_updateNavigationBarAppearance
{
  void *v3;
  _BOOL8 shouldUseClearNavigationBar;
  id v5;

  -[PKDashboardViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (self->_shouldUseClearNavigationBar)
  {
    -[PKDashboardViewController _updateNavigationBarVisibility](self, "_updateNavigationBarVisibility");
    objc_msgSend(v5, "pkui_setupScrollEdgeChromelessAppearance");
    v3 = v5;
    shouldUseClearNavigationBar = self->_shouldUseClearNavigationBar;
  }
  else
  {
    shouldUseClearNavigationBar = 0;
  }
  objc_msgSend(v3, "_setManualScrollEdgeAppearanceEnabled:", shouldUseClearNavigationBar);
  if (!self->_shouldUseClearNavigationBar)
  {
    objc_msgSend(v5, "setScrollEdgeAppearance:", 0);
    objc_msgSend(v5, "_setManualScrollEdgeAppearanceProgress:", 1.0);
  }

}

- (void)_updateNavigationBarVisibility
{
  void *v3;
  id v4;

  if (self->_shouldUseClearNavigationBar)
  {
    -[PKDashboardViewController navigationItem](self, "navigationItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (-[PKDashboardViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PKDashboardViewController collectionView](self, "collectionView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

    }
    else
    {
      objc_msgSend(v4, "_setManualScrollEdgeAppearanceProgress:", 0.0);
    }

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *presentersPerIdentifier;
  id v7;
  id v8;
  NSString *v9;
  NSString *v10;
  NSComparisonResult v11;
  PKDashboardTitleHeaderView *v12;
  PKDashboardTitleHeaderView *v13;
  PKDashboardTitleHeaderView *sampleHeaderView;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKDashboardViewController;
  -[PKDashboardViewController traitCollectionDidChange:](&v19, sel_traitCollectionDidChange_, v4);
  if (self->_contentIsLoaded)
  {
    -[PKDashboardViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    presentersPerIdentifier = self->_presentersPerIdentifier;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__PKDashboardViewController_traitCollectionDidChange___block_invoke;
    v16[3] = &unk_1E3E70DB0;
    v16[4] = self;
    v7 = v4;
    v17 = v7;
    v8 = v5;
    v18 = v8;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](presentersPerIdentifier, "enumerateKeysAndObjectsUsingBlock:", v16);
    if (v7)
    {
      if (v8)
      {
        objc_msgSend(v7, "preferredContentSizeCategory");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "preferredContentSizeCategory");
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        v11 = UIContentSizeCategoryCompareToCategory(v9, v10);

        if (v11)
        {
          v12 = [PKDashboardTitleHeaderView alloc];
          v13 = -[PKDashboardTitleHeaderView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          sampleHeaderView = self->_sampleHeaderView;
          self->_sampleHeaderView = v13;

          -[PKDashboardViewController collectionView](self, "collectionView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "reloadData");

        }
      }
    }

  }
}

void __54__PKDashboardViewController_traitCollectionDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "methodsForItemIdentifier:", a2) & 8) != 0)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traitCollectionDidChangeFromTrait:toTrait:inCollectionView:", v6, v5, v7);

  }
}

- (PKDashboardDataSource)dataSource
{
  return self->_dataSource;
}

- (PKDashboardDelegate)delegate
{
  return (PKDashboardDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPresentingContent
{
  return self->_isPresentingContent;
}

- (BOOL)shouldUseClearNavigationBar
{
  return self->_shouldUseClearNavigationBar;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_blocksOnVisibilityChange, 0);
  objc_storeStrong((id *)&self->_collectionViewFactory, 0);
  objc_storeStrong((id *)&self->_customLayout, 0);
  objc_storeStrong((id *)&self->_visibleCellsExcludingSafeArea, 0);
  objc_storeStrong((id *)&self->_footerTextItemsBySection, 0);
  objc_storeStrong((id *)&self->_sampleFooterView, 0);
  objc_storeStrong((id *)&self->_titlesForSection, 0);
  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
  objc_storeStrong((id *)&self->_presenterMethodsIndexPerIdentifier, 0);
  objc_storeStrong((id *)&self->_presentersPerIdentifier, 0);
}

@end
