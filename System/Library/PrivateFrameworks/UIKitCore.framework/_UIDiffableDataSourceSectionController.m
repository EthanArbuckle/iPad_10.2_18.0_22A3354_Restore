@implementation _UIDiffableDataSourceSectionController

- (id)_extantMutableSnapshotForSection:(id)a3
{
  return -[NSMapTable objectForKey:](self->_snapshotsMap, "objectForKey:", a3);
}

- (void)_updateSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v7;
  NSMapTable *snapshotsMap;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSourceSectionController.m"), 468, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  snapshotsMap = self->_snapshotsMap;
  if (v10)
    -[NSMapTable setObject:forKey:](snapshotsMap, "setObject:forKey:", v10, v7);
  else
    -[NSMapTable removeObjectForKey:](snapshotsMap, "removeObjectForKey:", v7);

}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UIDiffableDataSourceSectionController _snapshotForSectionContainingItem:](self, "_snapshotForSectionContainingItem:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDiffableDataSourceSectionController _configureCell:forItem:inSnapshot:](self, "_configureCell:forItem:inSnapshot:", v7, v6, v8);

}

- (id)snapshotForSection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSDiffableDataSourceSectionSnapshot *v6;
  NSDiffableDataSourceSectionSnapshot *v7;

  -[_UIDiffableDataSourceSectionController _extantMutableSnapshotForSection:](self, "_extantMutableSnapshotForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
  v7 = v6;

  return v7;
}

- (NSSet)associatedSectionIdentifiers
{
  return self->_associatedSectionIdentifiers;
}

- (id)dataSource
{
  return objc_loadWeakRetained((id *)&self->_dataSource);
}

- (id)_sectionIdentifierForItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  if (a3)
  {
    v5 = a3;
    -[_UIDiffableDataSourceSectionController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSourceSectionController.m"), 369, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource"));

    }
    objc_msgSend(v6, "snapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionIdentifierForSectionContainingItemIdentifier:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_snapshotForSectionContainingItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSDiffableDataSourceSectionSnapshot *v10;

  v4 = a3;
  -[_UIDiffableDataSourceSectionController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v5, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionIdentifierForSectionContainingItemIdentifier:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

LABEL_6:
    v10 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
    goto LABEL_7;
  }
  v9 = (void *)v8;
  -[_UIDiffableDataSourceSectionController snapshotForSection:](self, "snapshotForSection:", v8);
  v10 = (NSDiffableDataSourceSectionSnapshot *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_6;
LABEL_7:

  return v10;
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6
{
  -[_UIDiffableDataSourceSectionController _applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:](self, "_applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:", a3, a4, a5, 0, 0, 0, a6);
}

- (_UIDiffableDataSourceSectionController)initWithDiffableDataSourceImpl:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _UIDiffableDataSourceSectionController *v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIDiffableDataSourceSectionController initWithItemRenderers:associatedSectionIdentifiers:snapshotsMap:dataSource:](self, "initWithItemRenderers:associatedSectionIdentifiers:snapshotsMap:dataSource:", MEMORY[0x1E0C9AA60], v6, 0, v5);

  return v7;
}

- (_UIDiffableDataSourceSectionController)initWithDiffableDataSource:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _UIDiffableDataSourceSectionController *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_diffableDataSourceImpl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_UIDiffableDataSourceSectionController initWithItemRenderers:associatedSectionIdentifiers:snapshotsMap:dataSource:](self, "initWithItemRenderers:associatedSectionIdentifiers:snapshotsMap:dataSource:", MEMORY[0x1E0C9AA60], v6, 0, v7);
  return v8;
}

- (_UIDiffableDataSourceSectionController)initWithItemRenderers:(id)a3 associatedSectionIdentifiers:(id)a4 snapshotsMap:(id)a5 dataSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _UIDiffableDataSourceSectionController *v15;
  _UIDiffableDataSourceSectionController *v16;
  NSSet *v17;
  NSSet *associatedSectionIdentifiers;
  NSMapTable *v19;
  NSMapTable *snapshotsMap;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_UIDiffableDataSourceSectionController;
  v15 = -[_UIDiffableDataSourceSectionController init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_itemRenderers, a3);
    if (v12)
    {
      v17 = (NSSet *)v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    associatedSectionIdentifiers = v16->_associatedSectionIdentifiers;
    v16->_associatedSectionIdentifiers = v17;

    if (v13)
    {
      v19 = (NSMapTable *)v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v19 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    }
    snapshotsMap = v16->_snapshotsMap;
    v16->_snapshotsMap = v19;

    objc_storeWeak((id *)&v16->_dataSource, v14);
  }
  if (v14)
  {
    -[_UIDiffableDataSourceSectionController _configureForDataSource:](v16, "_configureForDataSource:", v14);
  }
  else if (objc_msgSend(v11, "count"))
  {
    -[_UIDiffableDataSourceSectionController _configureForItemRenderersIfNeeded:](v16, "_configureForItemRenderersIfNeeded:", v11);
  }

  return v16;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)_snapshotsMap
{
  return self->_snapshotsMap;
}

- (void)setHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5
{
  -[_UIDiffableDataSourceSectionController _applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:](self, "_applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:", a3, a4, a5, 0, 0, 0, 0);
}

- (_UIDiffableDataSourceSectionController)initWithItemRenderers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _UIDiffableDataSourceSectionController *v7;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIDiffableDataSourceSectionController initWithItemRenderers:associatedSectionIdentifiers:snapshotsMap:dataSource:](self, "initWithItemRenderers:associatedSectionIdentifiers:snapshotsMap:dataSource:", v5, v6, 0, 0);

  return v7;
}

- (_UIDiffableDataSourceSectionController)initWithItemRenderers:(id)a3 associatedSectionIdentifiers:(id)a4
{
  return -[_UIDiffableDataSourceSectionController initWithItemRenderers:associatedSectionIdentifiers:snapshotsMap:dataSource:](self, "initWithItemRenderers:associatedSectionIdentifiers:snapshotsMap:dataSource:", a3, a4, 0, 0);
}

- (id)snapshotForItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSDiffableDataSourceSectionSnapshot *v6;
  NSDiffableDataSourceSectionSnapshot *v7;

  -[_UIDiffableDataSourceSectionController _extantMutableSnapshotForItem:](self, "_extantMutableSnapshotForItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
  v7 = v6;

  return v7;
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 customAnimationsProvider:(id)a5
{
  -[_UIDiffableDataSourceSectionController _applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:](self, "_applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:", a3, a4, 1, 0, a5, 0, 0);
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 viewPropertyAnimator:(id)a5 customAnimationsProvider:(id)a6
{
  -[_UIDiffableDataSourceSectionController _applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:](self, "_applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:", a3, a4, 1, a5, a6, 0, 0);
}

- (void)_applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 viewPropertyAnimator:(id)a6 animationsProvider:(id)a7 isOnDiffableApplyQueue:(BOOL)a8 completion:(id)a9
{
  _BOOL8 v9;
  _BOOL4 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _UIDiffableDataSourceExpandCollapseAnimationContext *v26;
  void *v27;
  _UIDiffableDataSourceExpandCollapseAnimationContext *v28;
  id v29;
  id v30;
  void *v31;
  _UIDiffableDataSourceSectionController *v32;
  _UIDiffableDataSourceExpandCollapseAnimationContext *v33;
  uint64_t v34;
  NSOrderedSet *initialIdentifiers;
  void *v36;
  uint64_t v37;
  NSOrderedSet *finalIdentifiers;
  uint64_t v39;
  NSOrderedSet *initialVisibleIdentifiers;
  uint64_t v41;
  NSOrderedSet *finalVisibleIdentifiers;
  uint64_t v43;
  NSArray *identifiersOfExpandedItems;
  uint64_t v45;
  NSArray *identifiersOfCollapsedItems;
  void *v47;
  _UIDiffableDataSourceExpandCollapseAnimationContext *expandCollapseAnimationContext;
  _BOOL8 v49;
  void *v50;
  id v51;
  UIViewPropertyAnimator *v52;
  UIViewPropertyAnimator *v53;
  uint64_t v54;
  id v55;
  void *v56;
  _UIDiffableDataSourceExpandCollapseAnimationContext *v57;
  _UIDiffableDataSourceExpandCollapseAnimationContext *v58;
  void *v59;
  void *v60;
  void *v61;
  _UIDiffableDataSourceExpandCollapseAnimationContext *v62;
  _UIDiffableDataSourceExpandCollapseAnimationContext *v63;
  void *v64;
  __UIDiffableDataSource *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id obj;
  id v71;
  id v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[5];
  id v77;
  objc_super v78;

  v9 = a8;
  v12 = a5;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  objc_msgSend(v16, "_prepareForApplyToDataSource");
  if (!v12)
  {
    -[_UIDiffableDataSourceSectionController _updatePreparedCellsForExpansionStateWithSnapshot:](self, "_updatePreparedCellsForExpansionStateWithSnapshot:", v16);
    v47 = (void *)objc_msgSend(v16, "copy");
    -[_UIDiffableDataSourceSectionController __applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:](self, "__applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:", v47, v17, 0, 0, 0, v9, v20);

    goto LABEL_23;
  }
  v73 = v20;
  v21 = _Block_copy(v19);
  if (-[_UIDiffableDataSourceSectionController _snapshotHasExpandOrCollapseUpdates:](self, "_snapshotHasExpandOrCollapseUpdates:", v16))
  {
    v71 = v18;
    -[_UIDiffableDataSourceSectionController dataSource](self, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "snapshot");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "indexOfSectionIdentifier:", v17);

    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_16:

      v18 = v71;
      goto LABEL_17;
    }
    -[_UIDiffableDataSourceSectionController snapshotForSection:](self, "snapshotForSection:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[_UIDiffableDataSourceSectionController _shouldPerformCustomCollapseExpandAnimationsForInitialSnapshot:finalSnapshot:](self, "_shouldPerformCustomCollapseExpandAnimationsForInitialSnapshot:finalSnapshot:", v25, v16))
    {
LABEL_15:

      goto LABEL_16;
    }
    v65 = (__UIDiffableDataSource *)v24;
    v26 = [_UIDiffableDataSourceExpandCollapseAnimationContext alloc];
    v27 = v22;
    v28 = v26;
    v66 = v27;
    objc_msgSend(v27, "snapshot");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v64;
    obj = v25;
    v67 = v25;
    v30 = v16;
    v68 = v29;
    if (!v28)
    {
      v33 = 0;
      v31 = v67;
      v36 = v30;
LABEL_14:
      v22 = v66;

      expandCollapseAnimationContext = self->_expandCollapseAnimationContext;
      self->_expandCollapseAnimationContext = v33;

      v25 = obj;
      goto LABEL_15;
    }
    v69 = v30;
    if (!v29)
    {
      v58 = v28;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithSectionIndex_snapshotBeforeApplication_initialSectionSnapshot_finalSectionSnapshot_, v58, CFSTR("UIDiffableDataSourceSectionController.m"), 651, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialSnapshot != nil"));

      v28 = v58;
      v30 = v69;
    }
    v31 = v67;
    if (v67)
    {
      if (v30)
        goto LABEL_10;
    }
    else
    {
      v62 = v28;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithSectionIndex_snapshotBeforeApplication_initialSectionSnapshot_finalSectionSnapshot_, v62, CFSTR("UIDiffableDataSourceSectionController.m"), 652, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialSectionSnapshot != nil"));

      v28 = v62;
      if (v69)
        goto LABEL_10;
    }
    v63 = v28;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithSectionIndex_snapshotBeforeApplication_initialSectionSnapshot_finalSectionSnapshot_, v63, CFSTR("UIDiffableDataSourceSectionController.m"), 653, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalSectionSnapshot != nil"));

    v28 = v63;
LABEL_10:
    v78.receiver = v28;
    v78.super_class = (Class)_UIDiffableDataSourceExpandCollapseAnimationContext;
    v32 = -[_UIDiffableDataSourceSectionController init](&v78, sel_init);
    v33 = (_UIDiffableDataSourceExpandCollapseAnimationContext *)v32;
    if (v32)
    {
      v32->_dataSource = v65;
      objc_storeStrong((id *)&v32->_snapshotsMap, v64);
      objc_storeStrong((id *)&v33->_initialSectionSnapshot, obj);
      objc_storeStrong((id *)&v33->_finalSectionSnapshot, a3);
      objc_msgSend(v67, "_itemsOrderedSet");
      v34 = objc_claimAutoreleasedReturnValue();
      initialIdentifiers = v33->_initialIdentifiers;
      v33->_initialIdentifiers = (NSOrderedSet *)v34;

      v36 = v69;
      objc_msgSend(v69, "_itemsOrderedSet");
      v37 = objc_claimAutoreleasedReturnValue();
      finalIdentifiers = v33->_finalIdentifiers;
      v33->_finalIdentifiers = (NSOrderedSet *)v37;

      objc_msgSend(v67, "_visibleItemsOrderedSet");
      v39 = objc_claimAutoreleasedReturnValue();
      initialVisibleIdentifiers = v33->_initialVisibleIdentifiers;
      v33->_initialVisibleIdentifiers = (NSOrderedSet *)v39;

      objc_msgSend(v69, "_visibleItemsOrderedSet");
      v41 = objc_claimAutoreleasedReturnValue();
      finalVisibleIdentifiers = v33->_finalVisibleIdentifiers;
      v33->_finalVisibleIdentifiers = (NSOrderedSet *)v41;

      objc_msgSend(v69, "expandedItemsUpdates");
      v43 = objc_claimAutoreleasedReturnValue();
      identifiersOfExpandedItems = v33->_identifiersOfExpandedItems;
      v33->_identifiersOfExpandedItems = (NSArray *)v43;

      objc_msgSend(v69, "collapsedItemsUpdates");
      v45 = objc_claimAutoreleasedReturnValue();
      identifiersOfCollapsedItems = v33->_identifiersOfCollapsedItems;
      v33->_identifiersOfCollapsedItems = (NSArray *)v45;

    }
    else
    {
      v36 = v69;
    }
    goto LABEL_14;
  }
LABEL_17:
  v72 = v19;
  v49 = v9;
  if (v18)
  {
    v50 = v21;
    v51 = v18;
    v52 = (UIViewPropertyAnimator *)v18;
  }
  else
  {
    v51 = 0;
    v50 = v21;
    v52 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]([UIViewPropertyAnimator alloc], "initWithDuration:curve:animations:", 0, &__block_literal_global_254, 0.25);
  }
  v53 = v52;
  v54 = MEMORY[0x1E0C809B0];
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __162___UIDiffableDataSourceSectionController__applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke_2;
  v76[3] = &unk_1E16B1B50;
  v76[4] = self;
  v55 = v16;
  v77 = v55;
  -[UIViewPropertyAnimator addAnimations:](v53, "addAnimations:", v76);
  v20 = v73;
  if (v73)
  {
    v74[0] = v54;
    v74[1] = 3221225472;
    v74[2] = __162___UIDiffableDataSourceSectionController__applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke_3;
    v74[3] = &unk_1E16BDBD8;
    v75 = v73;
    -[UIViewPropertyAnimator addCompletion:](v53, "addCompletion:", v74);

  }
  v56 = (void *)objc_msgSend(v55, "copy");
  -[_UIDiffableDataSourceSectionController __applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:](self, "__applySnapshot:toSection:animatingDifferences:viewPropertyAnimator:animationsProvider:isOnDiffableApplyQueue:completion:", v56, v17, 1, v53, v50, v49, 0);

  v57 = self->_expandCollapseAnimationContext;
  self->_expandCollapseAnimationContext = 0;

  v19 = v72;
  v18 = v51;
LABEL_23:

}

- (id)_expandCollapseAnimationContextForCollectionView:(id)a3
{
  return self->_expandCollapseAnimationContext;
}

- (void)__applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 viewPropertyAnimator:(id)a6 animationsProvider:(id)a7 isOnDiffableApplyQueue:(BOOL)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id WeakRetained;
  id v21;
  void *v22;
  NSSet *v23;
  NSSet *associatedSectionIdentifiers;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _UIDiffableDataSourceExpandCollapseAnimationContext *expandCollapseAnimationContext;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  _QWORD v41[4];
  id v42;
  _UIDiffableDataSourceSectionController *v43;
  id v44;
  id v45;
  id v46;
  BOOL v47;
  BOOL v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (!WeakRetained)
    goto LABEL_12;
  if (v16)
  {
    if (!v17)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSourceSectionController.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section"));

    if (!v17)
    {
LABEL_4:
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSourceSectionController.m"), 165, CFSTR("An non-nil animator is required to use a custom animations provider"));

      }
    }
  }
  v39 = a5;
  v21 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v21, "addAssociatedSectionControllerIfNeeded:", self);

  -[_UIDiffableDataSourceSectionController associatedSectionIdentifiers](self, "associatedSectionIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setByAddingObject:", v16);
  v23 = (NSSet *)objc_claimAutoreleasedReturnValue();
  associatedSectionIdentifiers = self->_associatedSectionIdentifiers;
  self->_associatedSectionIdentifiers = v23;

  v38 = (void *)objc_msgSend(v15, "copy");
  -[NSMapTable setObject:forKey:](self->_snapshotsMap, "setObject:forKey:");
  v25 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v25, "snapshot");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v18;
  if (objc_msgSend(v26, "indexOfSectionIdentifier:", v16) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = v19;
    v49[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendSectionsWithIdentifiers:", v29);
  }
  else
  {
    objc_msgSend(v26, "itemIdentifiersInSectionWithIdentifier:", v16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "count"))
      objc_msgSend(v26, "deleteItemsWithIdentifiers:", v29);
    v28 = v19;
  }

  objc_msgSend(v15, "visibleItems");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v30, v16);

  expandCollapseAnimationContext = self->_expandCollapseAnimationContext;
  v32 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v32, "setExpandCollapseAnimationContext:", expandCollapseAnimationContext);

  v33 = objc_loadWeakRetained((id *)&self->_dataSource);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __163___UIDiffableDataSourceSectionController___applySnapshot_toSection_animatingDifferences_viewPropertyAnimator_animationsProvider_isOnDiffableApplyQueue_completion___block_invoke;
  v41[3] = &unk_1E16C8DD8;
  v47 = a8;
  v42 = v17;
  v43 = self;
  v44 = v26;
  v45 = v27;
  v48 = v39;
  v46 = v28;
  v34 = v26;
  objc_msgSend(v33, "_performApplyWithoutRebasingSectionSnapshots:", v41);

  v35 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v35, "setExpandCollapseAnimationContext:", 0);

  v19 = v28;
  v18 = v27;

LABEL_12:
}

- (void)_updatePreparedCellsForExpansionStateWithSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIDiffableDataSourceSectionController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isSuppressingViewUpdates") & 1) == 0)
  {
    objc_msgSend(v6, "_collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v15 = v7;
      objc_msgSend(v7, "preparedCells");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v13, "_itemIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
                -[_UIDiffableDataSourceSectionController _configureCell:forItem:inSnapshot:](self, "_configureCell:forItem:inSnapshot:", v13, v14, v4);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

      v7 = v15;
    }

  }
}

- (BOOL)_snapshotHasExpandOrCollapseUpdates:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "expandedItemsUpdates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(v3, "collapsedItemsUpdates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v5 > 0 || v7 > 0;
}

- (BOOL)_shouldPerformCustomCollapseExpandAnimationsForInitialSnapshot:(id)a3 finalSnapshot:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v6, "collapsedItemsUpdates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
      if (objc_msgSend(v5, "containsItem:", v12))
      {
        if ((objc_msgSend(v5, "isExpanded:", v12) & 1) != 0)
          goto LABEL_20;
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "expandedItemsUpdates", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
LABEL_12:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v14)
        objc_enumerationMutation(v7);
      v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15);
      if (objc_msgSend(v5, "containsItem:", v16))
      {
        if (!objc_msgSend(v5, "isExpanded:", v16))
          break;
      }
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v13)
          goto LABEL_12;
        goto LABEL_21;
      }
    }
LABEL_20:
    LOBYTE(v13) = 1;
  }
LABEL_21:

  return v13;
}

- (id)_collectionView
{
  void *v2;
  void *v3;

  -[_UIDiffableDataSourceSectionController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_UIDiffableDataSourceSectionControllerDelegate)delegate
{
  return (_UIDiffableDataSourceSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDataSource:(id)a3
{
  __UIDiffableDataSource **p_dataSource;
  id v5;

  p_dataSource = &self->_dataSource;
  v5 = a3;
  objc_storeWeak((id *)p_dataSource, v5);
  -[_UIDiffableDataSourceSectionController _configureForDataSource:](self, "_configureForDataSource:", v5);

}

- (void)_configureCell:(id)a3 forItem:(id)a4 inSnapshot:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BYTE *v22;
  _QWORD v23[4];
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    objc_msgSend(v11, "_setItemIdentifier:", v9);
    if (objc_msgSend(v10, "containsItem:", v9))
    {
      v12 = objc_msgSend(v10, "levelForItem:", v9);
      objc_msgSend(v11, "_layoutAttributes");
      v13 = (id *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewLayoutAttributes _existingListAttributes](v13);
      v14 = (_BYTE *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = v12 <= 1 ? 1 : v12;
        v16 = v15 - 1;
        if ((v14[8] & 1) != 0)
          v12 = v16;
      }
      objc_msgSend(v11, "_setDefaultIndentationLevel:", v12);
      objc_msgSend(v11, "_setExpanded:", objc_msgSend(v10, "isExpanded:", v9));
      objc_msgSend(v10, "parentOfChildItem:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[_UIDiffableDataSourceSectionController dataSource](self, "dataSource");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "indexPathForItemIdentifier:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v18, "_collectionView");
          v22 = v14;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "cellForItemAtIndexPath:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v22;
        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }
      objc_msgSend(v11, "_setParentFocusItem:", v21);

    }
    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __76___UIDiffableDataSourceSectionController__configureCell_forItem_inSnapshot___block_invoke;
    v23[3] = &unk_1E16C8E00;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v11, "_setDisclosureActionHandler:", v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
}

- (void)_configureForItemRenderersIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v12 = v4;
    objc_msgSend(v4, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v5 = (void *)v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v6 = v12;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v18;
        v9 = MEMORY[0x1E0C809B0];
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v18 != v8)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
            objc_initWeak(&location, self);
            v14[0] = v9;
            v14[1] = 3221225472;
            v14[2] = __77___UIDiffableDataSourceSectionController__configureForItemRenderersIfNeeded___block_invoke;
            v14[3] = &unk_1E16C8E28;
            objc_copyWeak(&v15, &location);
            objc_msgSend(v11, "setWillUpdateCellHandler:", v14);
            objc_destroyWeak(&v15);
            objc_destroyWeak(&location);
            ++v10;
          }
          while (v7 != v10);
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v7);
      }

      v5 = (void *)v13;
    }

    v4 = v12;
  }

}

- (BOOL)_performDisclosureAction:(unint64_t)a3 forItem:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!a3
    || (-[_UIDiffableDataSourceSectionController _sectionIdentifierForItem:](self, "_sectionIdentifierForItem:", v6),
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v12 = 0;
    goto LABEL_10;
  }
  v8 = (void *)v7;
  -[_UIDiffableDataSourceSectionController snapshotForSection:](self, "snapshotForSection:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "containsItem:", v6))
    goto LABEL_7;
  v10 = objc_msgSend(v9, "isExpanded:", v6);
  v11 = 2;
  if (!v10)
    v11 = 3;
  if (v11 == a3)
    goto LABEL_7;
  if (v10)
  {
    if (-[_UIDiffableDataSourceSectionController _queryClientShouldCollapseItem:](self, "_queryClientShouldCollapseItem:", v6))
    {
      -[_UIDiffableDataSourceSectionController _queryClientWillCollapseItem:](self, "_queryClientWillCollapseItem:", v6);
      -[_UIDiffableDataSourceSectionController snapshotForSection:](self, "snapshotForSection:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "collapseItems:", v15);
LABEL_20:

      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      v12 = 1;
      objc_msgSend(WeakRetained, "applySnapshot:toSection:animatingDifferences:completion:", v14, v8, 1, 0);

      v9 = v14;
      goto LABEL_8;
    }
  }
  else if (-[_UIDiffableDataSourceSectionController _queryClientShouldExpandItem:](self, "_queryClientShouldExpandItem:", v6))
  {
    -[_UIDiffableDataSourceSectionController _queryClientWillExpandItem:](self, "_queryClientWillExpandItem:", v6);
    -[_UIDiffableDataSourceSectionController snapshotForSection:](self, "snapshotForSection:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_UIDiffableDataSourceSectionController _queryClientShouldQueryForSnapshotForExpandingParentItem:](self, "_queryClientShouldQueryForSnapshotForExpandingParentItem:", v6))
    {
      objc_msgSend(v14, "childSnapshotOfParent:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDiffableDataSourceSectionController _queryClientSnapshotForExpandingParentItemForItem:currentSectionSnapshot:](self, "_queryClientSnapshotForExpandingParentItemForItem:currentSectionSnapshot:", v6, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v14, "setChildrenWithSnapshot:forParent:", v17, v6);

    }
    v19 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "expandItems:", v15);
    goto LABEL_20;
  }
LABEL_7:
  v12 = 0;
LABEL_8:

LABEL_10:
  return v12;
}

- (id)_extantMutableSnapshotForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UIDiffableDataSourceSectionController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    objc_msgSend(v5, "sectionIdentifierForSectionContainingItemIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[_UIDiffableDataSourceSectionController _extantMutableSnapshotForSection:](self, "_extantMutableSnapshotForSection:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (BOOL)_queryClientShouldExpandItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  char v9;
  void *v10;

  v4 = a3;
  -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shouldExpandItemHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shouldExpandItemHandler");
    v8 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = ((uint64_t (**)(_QWORD, id))v8)[2](v8, v4);

  }
  else
  {
    -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v9 = 1;
      goto LABEL_6;
    }
    -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "sectionController:shouldExpandItem:", self, v4);
  }

LABEL_6:
  return v9;
}

- (void)_queryClientWillExpandItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willExpandItemHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willExpandItemHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v10);

  }
  -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionController:willExpandItem:", self, v10);

  }
}

- (BOOL)_queryClientShouldCollapseItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __UIDiffableDataSource **p_dataSource;
  uint64_t i;
  uint64_t v23;
  void *v24;
  id WeakRetained;
  void *v26;
  int v27;
  BOOL v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shouldCollapseItemHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shouldCollapseItemHandler");
    v8 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = ((uint64_t (**)(_QWORD, id))v8)[2](v8, v4);

    if ((v9 & 1) == 0)
    {
LABEL_21:
      v28 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "sectionController:shouldCollapseItem:", self, v4);

      if (!v12)
        goto LABEL_21;
    }
  }
  -[_UIDiffableDataSourceSectionController _collectionView](self, "_collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && objc_msgSend(v13, "_isReordering"))
  {
    -[_UIDiffableDataSourceSectionController snapshotForItem:](self, "snapshotForItem:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "childSnapshotOfParent:includingParent:", v4, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v14, "_reorderedItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v18)
      {
        v19 = v18;
        v30 = v15;
        v31 = v14;
        v20 = *(_QWORD *)v33;
        p_dataSource = &self->_dataSource;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "originalIndexPath", v30, v31);
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = (void *)v23;
              WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
              objc_msgSend(WeakRetained, "itemIdentifierForIndexPath:", v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26 && (objc_msgSend(v16, "containsItem:", v26) & 1) != 0)
              {

                v27 = 0;
                goto LABEL_25;
              }

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v19)
            continue;
          break;
        }
        v27 = 1;
LABEL_25:
        v15 = v30;
        v14 = v31;
      }
      else
      {
        v27 = 1;
      }

    }
    else
    {
      v27 = 1;
    }

  }
  else
  {
    v27 = 1;
  }

  v28 = v27 != 0;
LABEL_30:

  return v28;
}

- (void)_queryClientWillCollapseItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willCollapseItemHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willCollapseItemHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v10);

  }
  -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionController:willCollapseItem:", self, v10);

  }
}

- (BOOL)_queryClientShouldQueryForSnapshotForExpandingParentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childSnapshotForExpandingParentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 1;
  }
  else
  {
    -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "sectionController:shouldQueryForSnapshotForExpandingParentItem:", self, v4);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_queryClientSnapshotForExpandingParentItemForItem:(id)a3 currentSectionSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "childSnapshotForExpandingParentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "childSnapshotForExpandingParentHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v11)[2](v11, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    goto LABEL_6;
  }
  -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v7;
  if (v13)
  {
    -[_UIDiffableDataSourceSectionController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionController:snapshotForExpandingParentItem:currentSectionSnapshot:", self, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
    goto LABEL_5;
  }
LABEL_6:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  NSSet *associatedSectionIdentifiers;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_itemRenderers, 1);
  associatedSectionIdentifiers = self->_associatedSectionIdentifiers;
  v7 = (void *)-[NSMapTable mutableCopy](self->_snapshotsMap, "mutableCopy");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v9 = (void *)objc_msgSend(v4, "initWithItemRenderers:associatedSectionIdentifiers:snapshotsMap:dataSource:", v5, associatedSectionIdentifiers, v7, WeakRetained);

  -[_UIDiffableDataSourceSectionController handlers](self, "handlers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHandlers:", v10);

  return v9;
}

- (NSArray)itemRenderers
{
  return self->_itemRenderers;
}

- (_UIDiffableDataSourceSectionControllerHandlers)handlers
{
  return self->_handlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_itemRenderers, 0);
  objc_storeStrong((id *)&self->_expandCollapseAnimationContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_associatedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_snapshotsMap, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
