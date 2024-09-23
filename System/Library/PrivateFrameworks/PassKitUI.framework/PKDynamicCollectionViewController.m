@implementation PKDynamicCollectionViewController

- (PKDynamicCollectionViewController)init
{
  PKDynamicCollectionViewController *v2;
  PKDynamicCollectionViewController *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *cellRegistrations;
  NSMutableDictionary *v6;
  NSMutableDictionary *supplementaryViewRegistrations;
  NSMutableDictionary *v8;
  NSMutableDictionary *itemsPendingDeletion;
  NSMutableDictionary *v10;
  NSMutableDictionary *itemsMap;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKDynamicCollectionViewController;
  v2 = -[PKDynamicCollectionViewController init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_deselectSelectedCellsOnViewWillAppear = 1;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cellRegistrations = v3->_cellRegistrations;
    v3->_cellRegistrations = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    supplementaryViewRegistrations = v3->_supplementaryViewRegistrations;
    v3->_supplementaryViewRegistrations = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemsPendingDeletion = v3->_itemsPendingDeletion;
    v3->_itemsPendingDeletion = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemsMap = v3->_itemsMap;
    v3->_itemsMap = v10;

  }
  return v3;
}

- (void)loadView
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  UICollectionView *v14;
  UICollectionView *collectionView;
  id v16;
  UICollectionView *v17;
  uint64_t v18;
  UICollectionViewDiffableDataSource *v19;
  UICollectionViewDiffableDataSource *dataSource;
  UICollectionViewDiffableDataSource *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PKDynamicCollectionViewController;
  -[PKDynamicCollectionViewController loadView](&v27, sel_loadView);
  -[PKDynamicCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PKDynamicCollectionViewController layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);
  collectionView = self->_collectionView;
  self->_collectionView = v14;

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "addSubview:", self->_collectionView);
  objc_initWeak(&location, self);
  v16 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v17 = self->_collectionView;
  v18 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __45__PKDynamicCollectionViewController_loadView__block_invoke;
  v24[3] = &unk_1E3E638F8;
  objc_copyWeak(&v25, &location);
  v19 = (UICollectionViewDiffableDataSource *)objc_msgSend(v16, "initWithCollectionView:cellProvider:", v17, v24);
  dataSource = self->_dataSource;
  self->_dataSource = v19;

  v21 = self->_dataSource;
  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __45__PKDynamicCollectionViewController_loadView__block_invoke_2;
  v22[3] = &unk_1E3E63920;
  objc_copyWeak(&v23, &location);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v21, "setSupplementaryViewProvider:", v22);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

id __45__PKDynamicCollectionViewController_loadView__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_sectionAtIndexPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "_cellRegistrationForSection:itemIdentifier:item:", v12, v9, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v13, v8, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __45__PKDynamicCollectionViewController_loadView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_sectionIdentifierForIndex:", objc_msgSend(v9, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sectionForIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_supplementaryRegistrationForSection:sectionIdentifier:elementKind:", v12, v11, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDynamicCollectionViewController;
  -[PKDynamicCollectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PKDynamicCollectionViewController reloadDataAnimated:](self, "reloadDataAnimated:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDynamicCollectionViewController;
  -[PKDynamicCollectionViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_isViewControllerActive = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDynamicCollectionViewController;
  -[PKDynamicCollectionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKDynamicCollectionViewController _deselectCellsForce:](self, "_deselectCellsForce:", 0);
  self->_viewDidAppear = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDynamicCollectionViewController;
  -[PKDynamicCollectionViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_isViewControllerActive = 0;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDynamicCollectionViewController;
  -[PKDynamicCollectionViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[PKDynamicCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");

}

- (void)viewDidDismissModalView
{
  -[PKDynamicCollectionViewController _deselectCellsForce:](self, "_deselectCellsForce:", 0);
}

- (void)_reloadSectionMapForSections:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  NSArray *sections;
  NSArray *v25;
  NSArray *v26;
  NSArray *sectionIdentifiers;
  NSDictionary *v28;
  NSDictionary *sectionMap;
  void *v30;
  _BOOL4 v31;
  NSArray *obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v31 = a4;
  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (NSArray *)v5;
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v42;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v42 != v33)
          objc_enumerationMutation(obj);
        v35 = v7;
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v7);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v8, "identifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v38 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
              objc_msgSend(v6, "objectForKey:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                PKLogFacilityTypeGetObject();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  v17 = (void *)objc_opt_class();
                  *(_DWORD *)buf = 138412546;
                  v46 = v17;
                  v47 = 2112;
                  v48 = v14;
                  v18 = v17;
                  _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "PKDynamicCollectionViewController (%@) attempting to set sections with duplicate section ids. Discarding duplicate %@ section id.", buf, 0x16u);

                }
              }
              else
              {
                objc_msgSend(v36, "addObject:", v14);
                objc_msgSend(v6, "setObject:forKey:", v8, v14);
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          }
          while (v11);
        }

        v7 = v35 + 1;
      }
      while (v35 + 1 != v34);
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v34);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_sectionIdentifiers);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "minusSet:", v19);
  if (objc_msgSend(v20, "count"))
  {
    -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deleteSectionsWithIdentifiers:", v22);

    v23 = v31 && self->_isViewControllerActive;
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v21, v23);

  }
  sections = self->_sections;
  self->_sections = obj;
  v25 = obj;

  v26 = (NSArray *)objc_msgSend(v36, "copy");
  sectionIdentifiers = self->_sectionIdentifiers;
  self->_sectionIdentifiers = v26;

  v28 = (NSDictionary *)objc_msgSend(v6, "copy");
  sectionMap = self->_sectionMap;
  self->_sectionMap = v28;

  -[PKDynamicCollectionViewController _reloadDataForSections:recreateSnapshot:animated:](self, "_reloadDataForSections:recreateSnapshot:animated:", self->_sectionIdentifiers, 1, v31);
  -[PKDynamicCollectionViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setNeedsLayout");

}

- (id)cellForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PKDynamicCollectionViewController _indexPathForItem:](self, "_indexPathForItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_indexPathForItem:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 useItemIdentityWhenUpdating;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    useItemIdentityWhenUpdating = self->_useItemIdentityWhenUpdating;
    v7 = v4;
    v8 = v7;
    if (useItemIdentityWhenUpdating)
    {
      if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE54AB28))
      {
        v9 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKDynamicCollectionViewController: useItemIdentityWhenUpdating was set to true but item %@ does not conform to PKIdentifiable"), v8);
        v9 = 0;
      }

      objc_msgSend(v9, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[PKDynamicCollectionViewController _indexPathForItemIdentifier:](self, "_indexPathForItemIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_indexPathForItemIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_dataSource, "indexPathForItemIdentifier:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKDynamicCollectionViewController;
  -[PKDynamicCollectionViewController setEditing:animated:](&v6, sel_setEditing_animated_, a3, a4);
  -[UICollectionView setEditing:](self->_collectionView, "setEditing:", v4);
}

- (void)reloadItem:(id)a3 animated:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  unsigned int v23;
  _QWORD v24[2];

  v4 = a4;
  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  v10 = v8;
  if (self->_useItemIdentityWhenUpdating)
  {
    v11 = v8;
    if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE54AB28))
    {
      v12 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKDynamicCollectionViewController: useItemIdentityWhenUpdating was set to true but item %@ does not conform to PKIdentifiable"), v11);
      v12 = 0;
    }

    objc_msgSend(v12, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[NSMutableDictionary removeObjectForKey:](self->_itemsPendingDeletion, "removeObjectForKey:", v10);
  }
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_dataSource, "indexPathForItemIdentifier:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (self->_useItemIdentityWhenUpdating)
    {
      -[NSMutableDictionary setObject:forKey:](self->_itemsMap, "setObject:forKey:", v9, v10);
      -[PKDynamicCollectionViewController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cellForItemAtIndexPath:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKDynamicCollectionViewController _sectionAtIndexPath:](self, "_sectionAtIndexPath:", v13);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v15)
        v18 = v16 == 0;
      else
        v18 = 1;
      if (!v18)
      {
        v23 = v4;
        -[PKDynamicCollectionViewController _cellRegistrationForSection:itemIdentifier:item:](self, "_cellRegistrationForSection:itemIdentifier:item:", v16, 0, v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "cellClass");
        if (v20 == objc_opt_class())
        {
          objc_msgSend(v19, "configurationHandler");
          v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *, void *))v22)[2](v22, v15, v13, v10);

          goto LABEL_17;
        }

        v4 = v23;
      }

    }
    v24[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadItemsWithIdentifiers:", v21);

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v7, v4);
  }
LABEL_17:

}

- (void)deselectCells
{
  -[PKDynamicCollectionViewController _deselectCellsForce:](self, "_deselectCellsForce:", 1);
}

- (void)scrollToItem:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;

  v5 = a5;
  -[PKDynamicCollectionViewController _indexPathForItem:](self, "_indexPathForItem:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollToItemAtIndexPath:atScrollPosition:animated:", v9, a4, v5);

  }
}

- (void)setUseItemIdentityWhenUpdating:(BOOL)a3
{
  self->_useItemIdentityWhenUpdating = a3;
}

- (void)reloadDataWithoutRebuildingDataStores
{
  id v2;

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)reconfigureHeaderAndFooterForSectionIdentifier:(id)a3
{
  void *v4;
  NSInteger v5;
  void *v6;
  uint64_t v7;
  void *v8;
  UICollectionView *collectionView;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PKDynamicCollectionViewController _sectionForIdentifier:](self, "_sectionForIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[UICollectionViewDiffableDataSource indexForSectionIdentifier:](self->_dataSource, "indexForSectionIdentifier:", v12);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *MEMORY[0x1E0DC48A8];
      -[UICollectionView supplementaryViewForElementKind:atIndexPath:](self->_collectionView, "supplementaryViewForElementKind:atIndexPath:", *MEMORY[0x1E0DC48A8], v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v4, "configureSupplementaryRegistration:elementKind:sectionIdentifier:", v8, v7, v12);
      collectionView = self->_collectionView;
      v10 = *MEMORY[0x1E0DC48A0];
      -[UICollectionView supplementaryViewForElementKind:atIndexPath:](collectionView, "supplementaryViewForElementKind:atIndexPath:", *MEMORY[0x1E0DC48A0], v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v4, "configureSupplementaryRegistration:elementKind:sectionIdentifier:", v11, v10, v12);

    }
  }

}

- (void)reloadDataAnimated:(BOOL)a3
{
  -[PKDynamicCollectionViewController _reloadSectionMapForSections:animated:](self, "_reloadSectionMapForSections:animated:", self->_sections, a3);
}

- (void)reloadDataForSectionIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[2];

  v4 = a4;
  v8[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[UICollectionViewDiffableDataSource indexForSectionIdentifier:](self->_dataSource, "indexForSectionIdentifier:", v6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PKDynamicCollectionViewController sections](self, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicCollectionViewController _reloadSectionMapForSections:animated:](self, "_reloadSectionMapForSections:animated:", v7, v4);
  }
  else
  {
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicCollectionViewController _reloadDataForSections:recreateSnapshot:animated:](self, "_reloadDataForSections:recreateSnapshot:animated:", v7, 0, v4);
  }

}

- (void)reloadDataForSection:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  _QWORD v8[5];

  v4 = a4;
  objc_msgSend(a3, "identifiers");
  v8[1] = 3221225472;
  v8[2] = __67__PKDynamicCollectionViewController_reloadDataForSection_animated___block_invoke;
  v8[3] = &unk_1E3E63948;
  v8[4] = self;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  if (objc_msgSend(v7, "pk_containsObjectPassingTest:", v8))
  {
    -[PKDynamicCollectionViewController sections](self, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicCollectionViewController _reloadSectionMapForSections:animated:](self, "_reloadSectionMapForSections:animated:", v6, v4);

  }
  else
  {
    -[PKDynamicCollectionViewController _reloadDataForSections:recreateSnapshot:animated:](self, "_reloadDataForSections:recreateSnapshot:animated:", v7, 0, v4);
  }

}

BOOL __67__PKDynamicCollectionViewController_reloadDataForSection_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "indexForSectionIdentifier:", a2) == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_reloadDataForSections:(id)a3 recreateSnapshot:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  int v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  id v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  id v50;
  id v51;
  id v52;
  UICollectionViewDiffableDataSource *dataSource;
  _BOOL8 v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t n;
  void *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  id obj;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  uint64_t v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[5];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;
  uint8_t buf[4];
  PKDynamicCollectionViewController *v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  void *v111;
  _BYTE v112[128];
  uint64_t v113;

  v61 = a5;
  v5 = a4;
  v113 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!self->_sections)
    goto LABEL_74;
  if (!self->_dataSource)
    goto LABEL_74;
  v62 = v7;
  v8 = -[PKDynamicCollectionViewController isViewLoaded](self, "isViewLoaded");
  v7 = v62;
  if (!v8)
    goto LABEL_74;
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = !self->_retainCellSelectionCellOnReload || !v5;
  v63 = (void *)v9;
  if (v10)
  {
    if (!self->_retainCellSelectionCellOnReload)
    {
LABEL_12:
      v60 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v11 = (void *)v9;
    v12 = objc_msgSend(v62, "count");
    objc_msgSend(v11, "sectionIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 != v14)
      goto LABEL_12;
  }
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  if (v5)
  {
    v75 = objc_alloc_init(MEMORY[0x1E0DC3398]);
    v15 = v62;
    objc_msgSend(v75, "appendSectionsWithIdentifiers:", v62);
  }
  else
  {
    v75 = v63;
    v15 = v62;
  }
  v78 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v63, "sectionIdentifiers");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v15;
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
  if (v69)
  {
    v67 = *(_QWORD *)v98;
    v77 = *MEMORY[0x1E0C99768];
    v65 = *MEMORY[0x1E0DC48A8];
    v66 = *MEMORY[0x1E0DC48A0];
    do
    {
      for (i = 0; i != v69; ++i)
      {
        if (*(_QWORD *)v98 != v67)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i);
        if (objc_msgSend(v68, "containsObject:", v17))
        {
          objc_msgSend(v63, "itemIdentifiersInSectionWithIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        if (self->_useItemIdentityWhenUpdating)
          objc_msgSend(v79, "addObjectsFromArray:", v18);
        -[PKDynamicCollectionViewController _sectionForIdentifier:](self, "_sectionForIdentifier:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "itemIdentifiersInSectionWithIdentifier:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "deleteItemsWithIdentifiers:", v20);

        -[UICollectionViewDiffableDataSource snapshotForSection:](self->_dataSource, "snapshotForSection:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "snapshotWithPreviousSnapshot:forSectionIdentifier:", v21, v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "items");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "count"))
        {
          v71 = v21;
          v72 = v18;
          v73 = i;
          v74 = v17;
          v70 = v23;
          if (self->_useItemIdentityWhenUpdating)
          {
            v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v93 = 0u;
            v94 = 0u;
            v95 = 0u;
            v96 = 0u;
            v25 = v23;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v94;
              do
              {
                for (j = 0; j != v27; ++j)
                {
                  if (*(_QWORD *)v94 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(id *)(*((_QWORD *)&v93 + 1) + 8 * j);
                  if (objc_msgSend(v30, "conformsToProtocol:", &unk_1EE54AB28))
                  {
                    v31 = v30;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v77, CFSTR("PKDynamicCollectionViewController: useItemIdentityWhenUpdating was set to true but item %@ does not conform to PKIdentifiable"), v30, v60);
                    v31 = 0;
                  }

                  objc_msgSend(v31, "identifier");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  -[NSMutableDictionary objectForKey:](self->_itemsMap, "objectForKey:", v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v33 && (PKEqualObjects() & 1) == 0)
                    objc_msgSend(v76, "addObject:", v32);
                  -[NSMutableDictionary removeObjectForKey:](self->_itemsPendingDeletion, "removeObjectForKey:", v32);
                  objc_msgSend(v79, "removeObject:", v32);
                  objc_msgSend(v78, "setObject:forKey:", v30, v32);
                  objc_msgSend(v24, "addObject:", v32);

                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
              }
              while (v27);
            }

            objc_msgSend(v75, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v24, v74);
            objc_msgSend(v75, "reloadItemsWithIdentifiers:", v76);

          }
          else
          {
            objc_msgSend(v75, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v23, v17);
          }
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          v36 = v79;
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v90;
            do
            {
              for (k = 0; k != v38; ++k)
              {
                if (*(_QWORD *)v90 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * k);
                -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsPendingDeletion, "objectForKeyedSubscript:", v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "integerValue") + 1;

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemsPendingDeletion, "setObject:forKeyedSubscript:", v44, v41);

              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
            }
            while (v38);
          }

          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v23 = v70;
          v45 = v70;
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
          v18 = v72;
          i = v73;
          if (v46)
          {
            v47 = v46;
            v48 = *(_QWORD *)v86;
            do
            {
              for (m = 0; m != v47; ++m)
              {
                if (*(_QWORD *)v86 != v48)
                  objc_enumerationMutation(v45);
                v50 = -[PKDynamicCollectionViewController _cellRegistrationForSection:itemIdentifier:item:](self, "_cellRegistrationForSection:itemIdentifier:item:", v19, 0, *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * m));
              }
              v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
            }
            while (v47);
          }

          v51 = -[PKDynamicCollectionViewController _supplementaryRegistrationForSection:sectionIdentifier:elementKind:](self, "_supplementaryRegistrationForSection:sectionIdentifier:elementKind:", v19, v74, v66);
          v52 = -[PKDynamicCollectionViewController _supplementaryRegistrationForSection:sectionIdentifier:elementKind:](self, "_supplementaryRegistrationForSection:sectionIdentifier:elementKind:", v19, v74, v65);
          v21 = v71;
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v107 = self;
            v108 = 2112;
            v109 = v17;
            v110 = 2112;
            v111 = v19;
            _os_log_impl(&dword_19D178000, v34, OS_LOG_TYPE_DEFAULT, "PKDynamicCollectionViewController (%@) attempting to render section %@-%@ with no items..", buf, 0x20u);
          }

          v105 = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "deleteSectionsWithIdentifiers:", v35);

        }
      }
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
    }
    while (v69);
  }

  -[NSMutableDictionary addEntriesFromDictionary:](self->_itemsMap, "addEntriesFromDictionary:", v78);
  dataSource = self->_dataSource;
  v54 = v61 && self->_isViewControllerActive;
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __86__PKDynamicCollectionViewController__reloadDataForSections_recreateSnapshot_animated___block_invoke;
  v84[3] = &unk_1E3E612E8;
  v84[4] = self;
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:](dataSource, "applySnapshot:animatingDifferences:completion:", v75, v54, v84);
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v55 = v60;
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v81;
    do
    {
      for (n = 0; n != v57; ++n)
      {
        if (*(_QWORD *)v81 != v58)
          objc_enumerationMutation(v55);
        -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_collectionView, "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * n), 0, 0);
      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
    }
    while (v57);
  }

  v7 = v62;
LABEL_74:

}

void __86__PKDynamicCollectionViewController__reloadDataForSections_recreateSnapshot_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 1028))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*(id *)(v1 + 1008), "allKeys", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "integerValue");

          if (v10 == 1)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "removeObjectForKey:", v8);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "removeObjectForKey:", v8);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10 - 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setObject:forKeyedSubscript:", v11, v8);

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
}

- (id)layout
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
  v5[2] = __43__PKDynamicCollectionViewController_layout__block_invoke;
  v5[3] = &unk_1E3E63970;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithSectionProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __43__PKDynamicCollectionViewController_layout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  _QWORD *WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_sectionIdentifierForIndex:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutWithLayoutEnvironment:sectionIdentifier:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (objc_msgSend(WeakRetained, "pkui_userInterfaceIdiomSupportsLargeLayouts")
      && !objc_msgSend(v9, "contentInsetsReference"))
    {
      objc_msgSend(v9, "setContentInsetsReference:", 4);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v13 = WeakRetained[123];
      v14 = 134218754;
      v15 = a2;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v13;
      _os_log_fault_impl(&dword_19D178000, v10, OS_LOG_TYPE_FAULT, "PKDynamicCollectionViewController: Failed to find layout. Something has gone horribly wrong. sectionIndex %li; s"
        "ectionIdentifier: %@; section: %@; sectionMap: %@.",
        (uint8_t *)&v14,
        0x2Au);
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = WeakRetained[123];
      v14 = 134218754;
      v15 = a2;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKDynamicCollectionViewController: Failed to find layout. Something has gone horribly wrong. sectionIndex %li; s"
        "ectionIdentifier: %@; section: %@; sectionMap: %@.",
        (uint8_t *)&v14,
        0x2Au);
    }

  }
  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_useItemIdentityWhenUpdating)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsMap, "objectForKey:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  -[PKDynamicCollectionViewController _sectionAtIndexPath:](self, "_sectionAtIndexPath:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "didSelectItem:", v5);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  v5 = a4;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_useItemIdentityWhenUpdating)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsMap, "objectForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  -[PKDynamicCollectionViewController _sectionAtIndexPath:](self, "_sectionAtIndexPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v8, "shouldHighlightItem:", v6);
  else
    v9 = 1;

  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a5;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_useItemIdentityWhenUpdating)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsMap, "objectForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  -[PKDynamicCollectionViewController _sectionAtIndexPath:](self, "_sectionAtIndexPath:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "willDisplayItem:", v6);

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a4, "firstObject", a3, a5.x, a5.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_useItemIdentityWhenUpdating)
    {
      -[NSMutableDictionary objectForKey:](self->_itemsMap, "objectForKey:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    -[PKDynamicCollectionViewController _sectionAtIndexPath:](self, "_sectionAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "contextMenuConfigurationForItem:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_sectionIdentifierForIndex:(int64_t)a3
{
  void *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else if (-[NSArray count](self->_sectionIdentifiers, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_sectionForIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[NSDictionary objectForKey:](self->_sectionMap, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_sectionAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PKDynamicCollectionViewController _sectionIdentifierForIndex:](self, "_sectionIdentifierForIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController _sectionForIdentifier:](self, "_sectionForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_sectionAtIndexPath:(id)a3
{
  return -[PKDynamicCollectionViewController _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(a3, "section"));
}

- (void)_deselectCellsForce:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_deselectSelectedCellsOnViewWillAppear || v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v5, "indexPathsForSelectedItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), 1);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (id)_cellRegistrationForSection:(id)a3 itemIdentifier:(id)a4 item:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    v13 = v12;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_itemsMap, "objectForKey:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v9;
    v13 = v16;

  }
  __85__PKDynamicCollectionViewController__cellRegistrationForSection_itemIdentifier_item___block_invoke((uint64_t)v12, v8, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@"), objc_msgSend(v17, "cellClass"), objc_opt_class());
  -[NSMutableDictionary objectForKey:](self->_cellRegistrations, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_initWeak(&location, self);
    v20 = (void *)MEMORY[0x1E0DC35C8];
    v21 = objc_msgSend(v17, "cellClass");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __85__PKDynamicCollectionViewController__cellRegistrationForSection_itemIdentifier_item___block_invoke_2;
    v23[3] = &unk_1E3E639D8;
    objc_copyWeak(&v25, &location);
    v24 = &__block_literal_global_21;
    objc_msgSend(v20, "registrationWithCellClass:configurationHandler:", v21, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_cellRegistrations, "setObject:forKey:", v19, v18);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v19;
}

id __85__PKDynamicCollectionViewController__cellRegistrationForSection_itemIdentifier_item___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "cellRegistrationForItem:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKDynamicSectionController (%@) didn't implement required cellRegistration method or property"), objc_opt_class());
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "cellRegistration");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_7:

  return v7;
}

void __85__PKDynamicCollectionViewController__cellRegistrationForSection_itemIdentifier_item___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *WeakRetained;
  id *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 1028))
    {
      objc_msgSend(WeakRetained[125], "objectForKey:", v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v8;
    }
    v12 = v11;
    objc_msgSend(v10, "_sectionAtIndexPath:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurationHandler");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, void *))v15)[2](v15, v16, v7, v12);

  }
}

- (id)_supplementaryRegistrationForSection:(id)a3 sectionIdentifier:(id)a4 elementKind:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(v8, "supplementaryRegistrationClassForKind:sectionIdentifier:", v10, v9);
  else
    v11 = objc_opt_class();
  v12 = v11;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@"), v11, v10);
  -[NSMutableDictionary objectForKey:](self->_supplementaryViewRegistrations, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_initWeak(&location, self);
    v15 = (void *)MEMORY[0x1E0DC3640];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __104__PKDynamicCollectionViewController__supplementaryRegistrationForSection_sectionIdentifier_elementKind___block_invoke;
    v17[3] = &unk_1E3E63A00;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v15, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v12, v10, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_supplementaryViewRegistrations, "setObject:forKey:", v14, v13);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __104__PKDynamicCollectionViewController__supplementaryRegistrationForSection_sectionIdentifier_elementKind___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  a1 += 4;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained(a1);
  v10 = objc_msgSend(v8, "section");

  objc_msgSend(WeakRetained, "_sectionIdentifierForIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained(a1);
  objc_msgSend(v12, "_sectionForIdentifier:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "configureSupplementaryRegistration:elementKind:sectionIdentifier:", v14, v7, v11);

}

- (NSArray)sections
{
  return self->_sections;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (BOOL)deselectSelectedCellsOnViewWillAppear
{
  return self->_deselectSelectedCellsOnViewWillAppear;
}

- (void)setDeselectSelectedCellsOnViewWillAppear:(BOOL)a3
{
  self->_deselectSelectedCellsOnViewWillAppear = a3;
}

- (BOOL)retainCellSelectionCellOnReload
{
  return self->_retainCellSelectionCellOnReload;
}

- (void)setRetainCellSelectionCellOnReload:(BOOL)a3
{
  self->_retainCellSelectionCellOnReload = a3;
}

- (BOOL)useItemIdentityWhenUpdating
{
  return self->_useItemIdentityWhenUpdating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_cellRegistrations, 0);
  objc_storeStrong((id *)&self->_itemsPendingDeletion, 0);
  objc_storeStrong((id *)&self->_itemsMap, 0);
  objc_storeStrong((id *)&self->_supplementaryViewRegistrations, 0);
  objc_storeStrong((id *)&self->_sectionMap, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
