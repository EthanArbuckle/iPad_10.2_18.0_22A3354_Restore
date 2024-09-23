@implementation SLDisambiguationCollectionViewController

- (SLDisambiguationCollectionViewController)initWithHighlight:(id)a3
{
  id v4;
  SLDisambiguationCompositionalLayout *v5;
  SLDisambiguationCompositionalLayout *v6;
  void *v7;
  SLDisambiguationCollectionViewController *v8;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [SLDisambiguationCompositionalLayout alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__SLDisambiguationCollectionViewController_initWithHighlight___block_invoke;
  v11[3] = &unk_1E37960D0;
  objc_copyWeak(&v12, &location);
  v6 = -[SLDisambiguationCompositionalLayout initWithSectionProvider:](v5, "initWithSectionProvider:", v11);
  -[SLDisambiguationCollectionViewController setLayout:](self, "setLayout:", v6);

  -[SLDisambiguationCollectionViewController setIsInitialLoad:](self, "setIsInitialLoad:", 1);
  -[SLDisambiguationCollectionViewController layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SLDisambiguationCollectionViewController;
  v8 = -[SLDisambiguationCollectionViewController initWithCollectionViewLayout:](&v10, sel_initWithCollectionViewLayout_, v7);

  if (v8)
    -[SLDisambiguationCollectionViewController setHighlight:](v8, "setHighlight:", v4);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

id __62__SLDisambiguationCollectionViewController_initWithHighlight___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "initialLayoutSectionForEnvironment:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)loadView
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)SLDisambiguationCollectionViewController;
  -[SLDisambiguationCollectionViewController loadView](&v30, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0DC35B8]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SLDisambiguationCollectionViewController layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);
  -[SLDisambiguationCollectionViewController setCollectionView:](self, "setCollectionView:", v14);

  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPrefetchingEnabled:", 0);

  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_collectionViewBackgroundTapped_);
  objc_msgSend(v16, "addGestureRecognizer:", v17);

  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDisambiguationCollectionViewController dataSourceWithCollectionView:](self, "dataSourceWithCollectionView:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDisambiguationCollectionViewController setDataSource:](self, "setDataSource:", v19);

  -[SLDisambiguationCollectionViewController dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDataSource:", v20);

  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDelegate:", self);

  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_class();
  +[SLHighlightDisambiguationCell reuseIdentifier](SLHighlightDisambiguationCell, "reuseIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerClass:forCellWithReuseIdentifier:", v24, v25);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "colorWithAlphaComponent:", 0.7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v27);

  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAlpha:", 1.0);

  -[SLDisambiguationCollectionViewController updateDataSourceSnapshot](self, "updateDataSourceSnapshot");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)SLDisambiguationCollectionViewController;
  -[SLDisambiguationCollectionViewController viewDidLayoutSubviews](&v36, sel_viewDidLayoutSubviews);
  if (-[SLDisambiguationCollectionViewController isInitialLoad](self, "isInitialLoad"))
  {
    -[SLDisambiguationCollectionViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDisambiguationCollectionViewController attributionViewFrame](self, "attributionViewFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertRect:toView:", v13, v6, v8, v10, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "visibleCells");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      if (-[SLDisambiguationCollectionViewController isInitialLoad](self, "isInitialLoad"))
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        -[SLDisambiguationCollectionViewController collectionView](self, "collectionView", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "visibleCells");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v33;
          do
          {
            v30 = 0;
            do
            {
              if (*(_QWORD *)v33 != v29)
                objc_enumerationMutation(v26);
              v31 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * v30);
              objc_msgSend(v31, "setContentMode:", 1);
              objc_msgSend(v31, "setFrame:", v15, v17, v19, v21);

              ++v30;
            }
            while (v28 != v30);
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          }
          while (v28);
        }

        -[SLDisambiguationCollectionViewController startAnimation](self, "startAnimation");
        -[SLDisambiguationCollectionViewController setIsInitialLoad:](self, "setIsInitialLoad:", 0);
      }
    }
  }
}

- (void)startAnimation
{
  void *v3;
  SLDisambiguationCompositionalLayout *v4;
  SLDisambiguationCompositionalLayout *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  id v11;
  id location;

  +[SLDisambiguationCollectionViewAnimator init](SLDisambiguationCollectionViewAnimator, "init");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = [SLDisambiguationCompositionalLayout alloc];
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __58__SLDisambiguationCollectionViewController_startAnimation__block_invoke;
  v10 = &unk_1E37960D0;
  objc_copyWeak(&v11, &location);
  v5 = -[SLDisambiguationCompositionalLayout initWithSectionProvider:](v4, "initWithSectionProvider:", &v7);
  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCollectionViewLayout:withAnimator:", v5, v3);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

id __58__SLDisambiguationCollectionViewController_startAnimation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "finalLayoutSectionForEnvironment:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setHighlight:(id)a3
{
  void *v5;
  SLHighlight *v6;

  v6 = (SLHighlight *)a3;
  if (self->_highlight != v6)
  {
    objc_storeStrong((id *)&self->_highlight, a3);
    -[SLDisambiguationCollectionViewController createAttributionMapWithHighlight:](self, "createAttributionMapWithHighlight:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDisambiguationCollectionViewController setAttributionMap:](self, "setAttributionMap:", v5);

  }
}

- (void)updateDataSourceSnapshot
{
  id v3;
  void (**v4)(_QWORD);
  _QWORD aBlock[5];

  v3 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[SLDisambiguationCollectionViewController setSnapshot:](self, "setSnapshot:", v3);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__SLDisambiguationCollectionViewController_updateDataSourceSnapshot__block_invoke;
  aBlock[3] = &unk_1E3794360;
  aBlock[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v4[2](v4);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __68__SLDisambiguationCollectionViewController_updateDataSourceSnapshot__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFString *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "attributionMap", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v2, "containsObject:", v9) & 1) == 0)
          objc_msgSend(v2, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "snapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfSectionIdentifier:", CFSTR("MainSection"));

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "snapshot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("MainSection");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendSectionsWithIdentifiers:", v13);

  }
  objc_msgSend(*(id *)(a1 + 32), "snapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v2, CFSTR("MainSection"));

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "snapshot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySnapshot:animatingDifferences:", v16, 1);

}

- (id)createAttributionMapWithHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = v4;
  objc_msgSend(v4, "attributions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
          objc_msgSend(v11, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v11, v14);

        }
        else
        {
          NSLog(CFSTR("[SLAttributionDisambiguationViewController: %p] Tried to add an attribution to our map (%@), but it does not have a unique identifier!"), self, v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)collectionViewBackgroundTapped:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    -[SLDisambiguationCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)dataSourceWithCollectionView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SLDisambiguationCollectionViewController_dataSourceWithCollectionView___block_invoke;
  v8[3] = &unk_1E37960F8;
  objc_copyWeak(&v9, &location);
  v6 = (void *)objc_msgSend(v5, "initWithCollectionView:cellProvider:", v4, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

id __73__SLDisambiguationCollectionViewController_dataSourceWithCollectionView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "cellForIndexPath:inCollectionView:withItemIdentifier:", v8, v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)cellForIndexPath:(id)a3 inCollectionView:(id)a4 withItemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[SLHighlightDisambiguationCell reuseIdentifier](SLHighlightDisambiguationCell, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLDisambiguationCollectionViewController attributionMap](self, "attributionMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v12, "updateWithAttribution:", v14);

  return v12;
}

- (id)finalCompositionalLayout
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__SLDisambiguationCollectionViewController_finalCompositionalLayout__block_invoke;
  v5[3] = &unk_1E37960D0;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithSectionProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __68__SLDisambiguationCollectionViewController_finalCompositionalLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "finalLayoutSectionForEnvironment:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)initialCompositionalLayout
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__SLDisambiguationCollectionViewController_initialCompositionalLayout__block_invoke;
  v5[3] = &unk_1E37960D0;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithSectionProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __70__SLDisambiguationCollectionViewController_initialCompositionalLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "initialLayoutSectionForEnvironment:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)finalLayoutSectionForEnvironment:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v22;

  v4 = (void *)MEMORY[0x1E0DC3340];
  v5 = a3;
  objc_msgSend(v4, "absoluteDimension:", 335.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 64.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v22, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDisambiguationCollectionViewController finalLayoutGroup:itemsCount:collectionWidth:targetItemHeight:](self, "finalLayoutGroup:itemsCount:collectionWidth:targetItemHeight:", v11, -[NSDiffableDataSourceSnapshot numberOfItems](self->_snapshot, "numberOfItems"), 335.0, 64.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 10.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInterItemSpacing:", v13);

  objc_msgSend(v5, "container");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentSize");
  objc_msgSend(v5, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "displayScale");
  UIRoundToScale();
  v17 = v16;

  objc_msgSend(v12, "contentInsets");
  v19 = v18;
  objc_msgSend(v12, "contentInsets");
  objc_msgSend(v12, "setContentInsets:", v19, v17);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)initialLayoutSectionForEnvironment:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v22;

  v4 = (void *)MEMORY[0x1E0DC3340];
  v5 = a3;
  objc_msgSend(v4, "absoluteDimension:", 335.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 64.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v22, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDisambiguationCollectionViewController initialLayoutGroup:itemsCount:collectionWidth:targetItemHeight:](self, "initialLayoutGroup:itemsCount:collectionWidth:targetItemHeight:", v11, -[NSDiffableDataSourceSnapshot numberOfItems](self->_snapshot, "numberOfItems"), 335.0, 64.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 10.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInterItemSpacing:", v13);

  objc_msgSend(v5, "container");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentSize");
  objc_msgSend(v5, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "displayScale");
  UIRoundToScale();
  v17 = v16;

  objc_msgSend(v12, "contentInsets");
  v19 = v18;
  objc_msgSend(v12, "contentInsets");
  objc_msgSend(v12, "setContentInsets:", v19, v17);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)initialLayoutGroup:(id)a3 itemsCount:(unint64_t)a4 collectionWidth:(double)a5 targetItemHeight:(double)a6
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13[2];
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0DC3350];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__SLDisambiguationCollectionViewController_initialLayoutGroup_itemsCount_collectionWidth_targetItemHeight___block_invoke;
  v12[3] = &unk_1E3796120;
  v13[1] = (id)a4;
  objc_copyWeak(v13, &location);
  objc_msgSend(v9, "customGroupWithLayoutSize:itemProvider:", v8, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v10;
}

id __107__SLDisambiguationCollectionViewController_initialLayoutGroup_itemsCount_collectionWidth_targetItemHeight___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  void *v26;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "attributionViewFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v15, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toView:", v16, v8, v10, v12, v14);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  if (*(_QWORD *)(a1 + 40))
  {
    v25 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:zIndex:", v25, v18, v20, v22, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v26);
      ++v25;

    }
    while (*(_QWORD *)(a1 + 40) > v25);
  }
  return v2;
}

- (id)finalLayoutGroup:(id)a3 itemsCount:(unint64_t)a4 collectionWidth:(double)a5 targetItemHeight:(double)a6
{
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15[4];
  id location;

  v10 = a3;
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0DC3350];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __105__SLDisambiguationCollectionViewController_finalLayoutGroup_itemsCount_collectionWidth_targetItemHeight___block_invoke;
  v14[3] = &unk_1E3796148;
  v15[1] = (id)a4;
  objc_copyWeak(v15, &location);
  v15[2] = *(id *)&a5;
  v15[3] = *(id *)&a6;
  objc_msgSend(v11, "customGroupWithLayoutSize:itemProvider:", v10, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v12;
}

id __105__SLDisambiguationCollectionViewController_finalLayoutGroup_itemsCount_collectionWidth_targetItemHeight___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double MaxY;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  CGRect v23;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  v7 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v11 = *(double *)(a1 + 48);

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
  {
    v13 = 0;
    v14 = v6 * 0.5;
    v15 = (v10 - v11) * 0.5;
    MaxY = 0.0;
    do
    {
      v18 = *(double *)(a1 + 48);
      v17 = *(double *)(a1 + 56);
      v19 = v14 + (double)v12 * -0.5 * v17;
      if (v13)
        v19 = MaxY;
      v20 = v19 + 10.0;
      objc_msgSend(MEMORY[0x1E0DC3358], "customItemWithFrame:zIndex:", v13, v15, v19 + 10.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v21);
      v23.origin.x = v15;
      v23.origin.y = v20;
      v23.size.width = v18;
      v23.size.height = v17;
      MaxY = CGRectGetMaxY(v23);
      ++v13;

      v12 = *(_QWORD *)(a1 + 40);
    }
    while (v12 > v13);
  }
  return v2;
}

- (unint64_t)cellPillViewVariant
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[SLDisambiguationCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "expandedAttributionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pillVariant");

  return v9;
}

- (CGRect)attributionViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_attributionViewFrame.origin.x;
  y = self->_attributionViewFrame.origin.y;
  width = self->_attributionViewFrame.size.width;
  height = self->_attributionViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAttributionViewFrame:(CGRect)a3
{
  self->_attributionViewFrame = a3;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (NSDictionary)attributionMap
{
  return self->_attributionMap;
}

- (void)setAttributionMap:(id)a3
{
  objc_storeStrong((id *)&self->_attributionMap, a3);
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (SLDisambiguationCompositionalLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (void)setIsInitialLoad:(BOOL)a3
{
  self->_isInitialLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_attributionMap, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
