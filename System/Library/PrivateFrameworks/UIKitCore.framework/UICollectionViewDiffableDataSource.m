@implementation UICollectionViewDiffableDataSource

- (NSIndexPath)indexPathForItemIdentifier:(id)identifier
{
  return (NSIndexPath *)-[__UIDiffableDataSource indexPathForItemIdentifier:](self->_impl, "indexPathForItemIdentifier:", identifier);
}

- (id)sectionIdentifierForIndex:(NSInteger)index
{
  return -[__UIDiffableDataSource sectionIdentifierForIndex:](self->_impl, "sectionIdentifierForIndex:", index);
}

- (id)itemIdentifierForIndexPath:(NSIndexPath *)indexPath
{
  return -[__UIDiffableDataSource itemIdentifierForIndexPath:](self->_impl, "itemIdentifierForIndexPath:", indexPath);
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)off_1E1679A30);
  -[__UIDiffableDataSource snapshot](self->_impl, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithImpl:", v4);

  return (NSDiffableDataSourceSnapshot *)v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  __UIDiffableDataSource *impl;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v13;

  if (-[__UIDiffableDataSource numberOfSections](self->_impl, "numberOfSections", a3) <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSource.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section < _impl.numberOfSections"));

  }
  impl = self->_impl;
  -[__UIDiffableDataSource state](impl, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[__UIDiffableDataSource numberOfItemsInSection:](impl, "numberOfItemsInSection:", v10);

  return v11;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return -[__UIDiffableDataSource numberOfSections](self->_impl, "numberOfSections", a3);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSource.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  -[__UIDiffableDataSource _cellForItemAtIndexPath:collectionView:](self->_impl, "_cellForItemAtIndexPath:collectionView:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot completion:(void *)completion
{
  __UIDiffableDataSource *impl;
  void *v6;
  id v7;

  impl = self->_impl;
  v6 = completion;
  -[NSDiffableDataSourceSnapshot impl](snapshot, "impl");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSource reloadFromSnapshot:completion:](impl, "reloadFromSnapshot:completion:", v7, v6);

}

- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences completion:(void *)completion
{
  _BOOL8 v5;
  __UIDiffableDataSource *impl;
  void *v8;
  id v9;

  v5 = animatingDifferences;
  impl = self->_impl;
  v8 = completion;
  -[NSDiffableDataSourceSnapshot impl](snapshot, "impl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:animatingDifferences:completion:](impl, "applyDifferencesFromSnapshot:animatingDifferences:completion:", v9, v5, v8);

}

- (void)setSupplementaryViewProvider:(UICollectionViewDiffableDataSourceSupplementaryViewProvider)supplementaryViewProvider
{
  -[__UIDiffableDataSource setSupplementaryViewProvider:](self->_impl, "setSupplementaryViewProvider:", supplementaryViewProvider);
}

- (UICollectionViewDiffableDataSourceReorderingHandlers)reorderingHandlers
{
  return -[__UIDiffableDataSource reorderingHandlers](self->_impl, "reorderingHandlers");
}

- (BOOL)_subclassOverridesMethodWithSelector:(SEL)a3
{
  objc_class *v4;
  objc_class *v5;
  IMP MethodImplementation;
  IMP v7;
  BOOL v8;

  v4 = (objc_class *)objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v4, a3);
  v7 = class_getMethodImplementation(v5, a3);
  if (MethodImplementation)
    v8 = v7 == 0;
  else
    v8 = 1;
  return !v8 && MethodImplementation != v7;
}

- (id)_diffableDataSourceImpl
{
  return self->_impl;
}

- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences
{
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:](self, "applySnapshot:animatingDifferences:completion:", snapshot, animatingDifferences, 0);
}

void __65__UICollectionViewDiffableDataSource__setDidReorderItemsHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(v6, "isReorderingTransaction"))
  {
    objc_msgSend(WeakRetained, "_didReorderItemsHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reorderedItemIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v4)[2](v4, v6, v5);

  }
}

- (UICollectionViewDiffableDataSource)initWithCollectionView:(UICollectionView *)collectionView cellProvider:(UICollectionViewDiffableDataSourceCellProvider)cellProvider
{
  UICollectionView *v6;
  UICollectionViewDiffableDataSourceCellProvider v7;
  UICollectionViewDiffableDataSource *v8;
  __UIDiffableDataSource *v9;
  __UIDiffableDataSource *impl;
  objc_super v12;

  v6 = collectionView;
  v7 = cellProvider;
  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewDiffableDataSource;
  v8 = -[UICollectionViewDiffableDataSource init](&v12, sel_init);
  if (v8)
  {
    v9 = -[__UIDiffableDataSource initWithCollectionView:cellProvider:]([__UIDiffableDataSource alloc], "initWithCollectionView:cellProvider:", v6, v7);
    impl = v8->_impl;
    v8->_impl = v9;

    -[UICollectionView setDataSource:](v6, "setDataSource:", v8);
  }

  return v8;
}

- (NSInteger)indexForSectionIdentifier:(id)identifier
{
  return -[__UIDiffableDataSource indexForSectionIdentifier:](self->_impl, "indexForSectionIdentifier:", identifier);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSource.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  -[__UIDiffableDataSource supplementaryViewProvider](self->_impl, "supplementaryViewProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSource.m"), 152, CFSTR("CollectionView %@ requested a supplementary view, but a supplementaryViewProvider was not specified on the diffable data source. Please configure the diffable data source accordingly and add the supplementary provider"), v9);

  }
  -[__UIDiffableDataSource supplementaryViewProvider](self->_impl, "supplementaryViewProvider");
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id, id))v13)[2](v13, v9, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)applySnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot toSection:(id)sectionIdentifier animatingDifferences:(BOOL)animatingDifferences
{
  -[__UIDiffableDataSource _applyDifferencesFromSnapshot:toSection:animatingDifferences:completion:](self->_impl, "_applyDifferencesFromSnapshot:toSection:animatingDifferences:completion:", snapshot, sectionIdentifier, animatingDifferences, 0);
}

- (void)_performBatchApplyUsingReloadData:(id)a3
{
  -[__UIDiffableDataSource _performBatchApplyUsingReloadData:](self->_impl, "_performBatchApplyUsingReloadData:", a3);
}

- (void)setSectionSnapshotHandlers:(UICollectionViewDiffableDataSourceSectionSnapshotHandlers *)sectionSnapshotHandlers
{
  -[__UIDiffableDataSource setSectionSnapshotHandlers:](self->_impl, "setSectionSnapshotHandlers:", sectionSnapshotHandlers);
}

- (void)_setCanReorderItemHandler:(id)a3
{
  -[__UIDiffableDataSource setCanReorderItemHandler:](self->_impl, "setCanReorderItemHandler:", a3);
}

- (void)_setDidReorderItemsHandler:(id)a3
{
  id v4;
  void *v5;
  id didReorderItemsHandler;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  v5 = _Block_copy(v4);
  didReorderItemsHandler = self->_didReorderItemsHandler;
  self->_didReorderItemsHandler = v5;

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__UICollectionViewDiffableDataSource__setDidReorderItemsHandler___block_invoke;
  v7[3] = &unk_1E16B9520;
  objc_copyWeak(&v8, &location);
  -[__UIDiffableDataSource setDidApplySnapshotHandler:](self->_impl, "setDidApplySnapshotHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (NSString)description
{
  return -[__UIDiffableDataSource description](self->_impl, "description");
}

- (UICollectionViewDiffableDataSourceSupplementaryViewProvider)supplementaryViewProvider
{
  return -[__UIDiffableDataSource supplementaryViewProvider](self->_impl, "supplementaryViewProvider");
}

- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot
{
  -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:completion:](self, "applySnapshotUsingReloadData:completion:", snapshot, 0);
}

- (void)applySnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot toSection:(id)sectionIdentifier animatingDifferences:(BOOL)animatingDifferences completion:(void *)completion
{
  -[__UIDiffableDataSource _applyDifferencesFromSnapshot:toSection:animatingDifferences:completion:](self->_impl, "_applyDifferencesFromSnapshot:toSection:animatingDifferences:completion:", snapshot, sectionIdentifier, animatingDifferences, completion);
}

- (NSDiffableDataSourceSectionSnapshot)snapshotForSection:(id)section
{
  return (NSDiffableDataSourceSectionSnapshot *)-[__UIDiffableDataSource snapshotForSection:](self->_impl, "snapshotForSection:", section);
}

- (void)setReorderingHandlers:(UICollectionViewDiffableDataSourceReorderingHandlers *)reorderingHandlers
{
  -[__UIDiffableDataSource setReorderingHandlers:](self->_impl, "setReorderingHandlers:", reorderingHandlers);
}

- (UICollectionViewDiffableDataSourceSectionSnapshotHandlers)sectionSnapshotHandlers
{
  return -[__UIDiffableDataSource sectionSnapshotHandlers](self->_impl, "sectionSnapshotHandlers");
}

- (id)_expandCollapseAnimationContextForCollectionView:(id)a3
{
  return -[__UIDiffableDataSource expandCollapseAnimationContext](self->_impl, "expandCollapseAnimationContext", a3);
}

- (UICollectionViewDiffableDataSource)initWithViewUpdatesSink:(id)a3
{
  id v4;
  UICollectionViewDiffableDataSource *v5;
  __UIDiffableDataSource *v6;
  __UIDiffableDataSource *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewDiffableDataSource;
  v5 = -[UICollectionViewDiffableDataSource init](&v9, sel_init);
  if (v5)
  {
    v6 = -[__UIDiffableDataSource initWithViewUpdatesSink:]([__UIDiffableDataSource alloc], "initWithViewUpdatesSink:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

  }
  return v5;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return -[__UIDiffableDataSource canMoveItemAtIndexPath:](self->_impl, "canMoveItemAtIndexPath:", a4);
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  -[__UIDiffableDataSource _commitReorderingForItemAtIndexPath:toDestinationIndexPath:](self->_impl, "_commitReorderingForItemAtIndexPath:toDestinationIndexPath:", a4, a5);
}

- (void)_registerItemRenderers:(id)a3 rendererIdentifierProvider:(id)a4
{
  -[__UIDiffableDataSource _registerItemRenderers:rendererIdentifierProvider:](self->_impl, "_registerItemRenderers:rendererIdentifierProvider:", a3, a4);
}

- (id)collectionView
{
  return -[__UIDiffableDataSource _collectionView](self->_impl, "_collectionView");
}

- (id)_associatedSectionControllerForItemIdentifier:(id)a3
{
  return -[__UIDiffableDataSource associatedSectionControllerForItemIdentifier:](self->_impl, "associatedSectionControllerForItemIdentifier:", a3);
}

- (id)_associatedSectionControllerForSectionIdentifier:(id)a3
{
  return -[__UIDiffableDataSource associatedSectionControllerForSectionIdentifier:](self->_impl, "associatedSectionControllerForSectionIdentifier:", a3);
}

- (void)_applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6
{
  -[__UIDiffableDataSource _applyDifferencesFromSnapshot:toSection:animatingDifferences:completion:](self->_impl, "_applyDifferencesFromSnapshot:toSection:animatingDifferences:completion:", a3, a4, a5, a6);
}

- (id)_snapshotForSection:(id)a3
{
  return -[__UIDiffableDataSource _snapshotForSection:](self->_impl, "_snapshotForSection:", a3);
}

- (BOOL)_isDiffableDataSource
{
  return 1;
}

- (UICollectionViewDiffableDataSource)initWithCollectionView:(id)a3 itemRenderers:(id)a4 rendererIdentifierProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  UICollectionViewDiffableDataSource *v11;
  __UIDiffableDataSource *v12;
  __UIDiffableDataSource *impl;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewDiffableDataSource;
  v11 = -[UICollectionViewDiffableDataSource init](&v15, sel_init);
  if (v11)
  {
    v12 = -[__UIDiffableDataSource initWithCollectionView:itemRenderers:rendererIdentifierProvider:]([__UIDiffableDataSource alloc], "initWithCollectionView:itemRenderers:rendererIdentifierProvider:", v8, v9, v10);
    impl = v11->_impl;
    v11->_impl = v12;

    objc_msgSend(v8, "setDataSource:", v11);
  }

  return v11;
}

- (UICollectionViewDiffableDataSource)initWithCollectionView:(id)a3 sectionControllers:(id)a4 rendererIdentifierProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  UICollectionViewDiffableDataSource *v11;
  __UIDiffableDataSource *v12;
  __UIDiffableDataSource *impl;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)UICollectionViewDiffableDataSource;
  v11 = -[UICollectionViewDiffableDataSource init](&v24, sel_init);
  if (v11)
  {
    v12 = -[__UIDiffableDataSource initWithCollectionView:sectionControllers:rendererIdentifierProvider:]([__UIDiffableDataSource alloc], "initWithCollectionView:sectionControllers:rendererIdentifierProvider:", v8, v9, v10);
    impl = v11->_impl;
    v11->_impl = v12;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18++), "setDataSource:", v11->_impl, (_QWORD)v20);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v16);
    }

    objc_msgSend(v8, "setDataSource:", v11);
  }

  return v11;
}

- (UICollectionViewDiffableDataSource)initWithCollectionView:(id)a3 itemRenderer:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  UICollectionViewDiffableDataSource *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UICollectionViewDiffableDataSource initWithCollectionView:itemRenderers:rendererIdentifierProvider:](self, "initWithCollectionView:itemRenderers:rendererIdentifierProvider:", v8, v9, &__block_literal_global_102, v12, v13);
  return v10;
}

const __CFString *__74__UICollectionViewDiffableDataSource_initWithCollectionView_itemRenderer___block_invoke()
{
  return CFSTR("default");
}

- (id)_canReorderItemHandler
{
  return -[__UIDiffableDataSource canReorderItemHandler](self->_impl, "canReorderItemHandler");
}

- (id)_didReorderItemsHandler
{
  return self->_didReorderItemsHandler;
}

- (__UIDiffableDataSource)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
  objc_storeStrong((id *)&self->_impl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong(&self->_didReorderItemsHandler, 0);
}

- (void)validateIdentifiers
{
  void *v2;
  void *v3;
  id v4;

  -[__UIDiffableDataSource state](self->_impl, "state");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "validateIdentifiers");
  }
  else
  {
    objc_msgSend(v4, "sections");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceValidateIdentifiers();

    objc_msgSend(v4, "identifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceValidateIdentifiers();

  }
}

@end
