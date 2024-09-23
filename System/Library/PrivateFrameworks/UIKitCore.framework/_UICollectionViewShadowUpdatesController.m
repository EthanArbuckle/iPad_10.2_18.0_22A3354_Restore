@implementation _UICollectionViewShadowUpdatesController

- (NSMutableArray)_shadowUpdates
{
  return self->__shadowUpdates;
}

- (BOOL)shouldRebaseForUpdates
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  if (!self->_updateMap || !self->_initialSnapshot)
    return 0;
  -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasActiveDrop") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "hasActiveDrag");

    }
  }

  return v4;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (_UICollectionViewShadowUpdatesController)initWithCollectionView:(id)a3
{
  id v4;
  _UICollectionViewShadowUpdatesController *v5;
  _UICollectionViewShadowUpdatesController *v6;
  NSMutableArray *v7;
  NSMutableArray *shadowUpdates;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UICollectionViewShadowUpdatesController;
  v5 = -[_UICollectionViewShadowUpdatesController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    shadowUpdates = v6->__shadowUpdates;
    v6->__shadowUpdates = v7;

    objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("com.apple.UIKit.shadowReuseCellIdentifier"));
  }

  return v6;
}

- (id)indexPathAfterShadowUpdates:(id)a3 allowingAppendingInserts:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  if (-[NSMutableArray count](self->__shadowUpdates, "count"))
  {
    if (v4
      && (-[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "initialSnapshot"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "indexPathIsSectionAppendingInsert:", v6),
          v8,
          v7,
          v9))
    {
      -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finalSnapshot");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "indexPathForAppendingInsertInSection:", objc_msgSend(v6, "section"));
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finalIndexPathForInitialIndexPath:", v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v12 = v6;
  }

  return v12;
}

- (id)indexPathAfterShadowUpdates:(id)a3
{
  return -[_UICollectionViewShadowUpdatesController indexPathAfterShadowUpdates:allowingAppendingInserts:](self, "indexPathAfterShadowUpdates:allowingAppendingInserts:", a3, 0);
}

- (void)setUpdateMap:(id)a3
{
  objc_storeStrong((id *)&self->_updateMap, a3);
}

- (void)reset
{
  void *v3;

  -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[_UICollectionViewShadowUpdatesController setInitialSnapshot:](self, "setInitialSnapshot:", 0);
  -[_UICollectionViewShadowUpdatesController setUpdateMap:](self, "setUpdateMap:", 0);
}

- (void)setInitialSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_initialSnapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shadowUpdates, 0);
  objc_storeStrong((id *)&self->_updateMap, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (BOOL)rebaseForUpdates:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[_UICollectionViewShadowUpdatesController _rebasedUpdateMapForUpdates:](self, "_rebasedUpdateMapForUpdates:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = -[_UICollectionViewShadowUpdatesController _rebaseForUpdateMap:](self, "_rebaseForUpdateMap:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)_rebaseForUpdateMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167C258, "snapshotterForDataSourceBackedView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rebasedMapFromNewBaseMap:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllObjects");

    -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);

    -[_UICollectionViewShadowUpdatesController setInitialSnapshot:](self, "setInitialSnapshot:", v6);
    -[_UICollectionViewShadowUpdatesController _regenerateUpdateMap](self, "_regenerateUpdateMap");
  }

  return v8 != 0;
}

- (void)appendShadowUpdate:(id)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E167C258, "snapshotterForDataSourceBackedView:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewShadowUpdatesController setInitialSnapshot:](self, "setInitialSnapshot:", v8);

    }
    if (!v4[10])
    {
      -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "finalSnapshot");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 8;
      if (!v4[10])
        v11 = 9;
      v12 = (id)v4[v11];
      v13 = objc_msgSend(v10, "indexPathIsSectionAppendingInsert:", v12);

      if (v13)
        *((_BYTE *)v4 + 56) |= 1u;
    }
    -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15
      || (v22[0] = v15,
          v22[1] = v4,
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          -[_UICollectionViewShadowUpdatesController _coalesceUpdatesIfPossible:](self, "_coalesceUpdatesIfPossible:", v16), v17 = (_QWORD *)objc_claimAutoreleasedReturnValue(), v16, !v17))
    {
      -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
      v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v4);
LABEL_22:

      -[_UICollectionViewShadowUpdatesController _regenerateUpdateMap](self, "_regenerateUpdateMap");
      goto LABEL_23;
    }
    -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count") - 1;

    if (v17[10] == 3 && v17[2] == v17[4] && v17[1] == v17[3])
    {
      -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
      objc_msgSend(v20, "removeObjectAtIndex:", v19);
      goto LABEL_21;
    }
    if (v17[8])
    {
      -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = v17[9];
      -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
        goto LABEL_20;
    }
    objc_msgSend(v20, "replaceObjectAtIndex:withObject:", v19, v17);
LABEL_21:

    goto LABEL_22;
  }
LABEL_23:

}

- (id)computeRevertShadowUpdates
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[UICollectionViewUpdateItem revertedUpdate](*(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;

  -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finalSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfItemsInSection:", a4);
  }
  else
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_dataSourceActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "collectionView:numberOfItemsInSection:", v11, a4);

  }
  return v10;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;

  -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finalSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfSections");
  }
  else
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_dataSourceActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfSectionsInCollectionView:", v9);

  }
  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_dataSourceActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView:cellForItemAtIndexPath:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UICollectionViewShadowUpdatesController _shadowUpdateReuseIdentifierForItemItemAtIndexPath:](self, "_shadowUpdateReuseIdentifierForItemItemAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController _updateCellIfNeeded:atIndexPath:](self, "_updateCellIfNeeded:atIndexPath:", v11, v6);
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.UIKit.shadowReuseCellIdentifier")))
      objc_msgSend(v11, "_setHiddenForReordering:", 1);
  }

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  -[_UICollectionViewShadowUpdatesController _supplementaryIndexPathBeforeShadowUpdates:](self, "_supplementaryIndexPathBeforeShadowUpdates:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_dataSourceActual");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionView:viewForSupplementaryElementOfKind:atIndexPath:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_dataSourceActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "collectionView:canMoveItemAtIndexPath:", v6, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_dataSourceActual");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionView:moveItemAtIndexPath:toIndexPath:", v13, v9, v10);

  }
}

- (id)_expandCollapseAnimationContextForCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dataSourceActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_expandCollapseAnimationContextForCollectionView:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_dataSourceActual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexTitlesForCollectionView:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dataSourceActual");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionView:indexPathForIndexTitle:atIndex:", v10, v7, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)modelIdentifierForElementAtIndexPath:(id)a3 inView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_dataSourceActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modelIdentifierForElementAtIndexPath:inView:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)indexPathForElementWithModelIdentifier:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dataSourceActual");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForElementWithModelIdentifier:inView:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewShadowUpdatesController indexPathAfterShadowUpdates:](self, "indexPathAfterShadowUpdates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_dataSourceActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "_collectionView:canMoveItemAtIndexPath:", v8, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_dataSourceActual");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_collectionView:moveItemAtIndexPath:toIndexPath:", v13, v9, v10);

  }
}

- (BOOL)_collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_dataSourceActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_collectionView:canEditItemAtIndexPath:", v6, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_sectionIndexTitlesForCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dataSourceActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sectionIndexTitlesForCollectionView:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_collectionView:(id)a3 sectionIndexTitlesTrimmedToCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_dataSourceActual");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_collectionView:sectionIndexTitlesTrimmedToCount:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_collectionView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_dataSourceActual");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_collectionView:indexPathForSectionIndexTitle:atIndex:", v9, v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_collectionView:(id)a3 willPerformUpdates:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UICollectionViewUpdateItem *v17;
  uint64_t v18;
  UICollectionViewUpdateItem *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        objc_msgSend(v12, "indexPathBeforeUpdate", v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "indexPathAfterUpdate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = [UICollectionViewUpdateItem alloc];
        if (v12)
          v18 = v12[10];
        else
          v18 = 0;
        v19 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:](v17, "initWithInitialIndexPath:finalIndexPath:updateAction:", v14, v16, v18);
        objc_msgSend(v7, "addObject:", v19);

        ++v11;
      }
      while (v9 != v11);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v9 = v20;
    }
    while (v20);
  }

  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_dataSourceActual");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_collectionView:willPerformUpdates:", v23, v7);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "collectionView:shouldHighlightItemAtIndexPath:", v6, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:didHighlightItemAtIndexPath:", v9, v6);

  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:didUnhighlightItemAtIndexPath:", v9, v6);

  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "collectionView:shouldSelectItemAtIndexPath:", v6, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "collectionView:shouldDeselectItemAtIndexPath:", v6, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:didSelectItemAtIndexPath:", v9, v6);

  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:didDeselectItemAtIndexPath:", v9, v6);

  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionView:willDisplayCell:forItemAtIndexPath:", v12, v8, v9);

  }
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  -[_UICollectionViewShadowUpdatesController _supplementaryIndexPathBeforeShadowUpdates:](self, "_supplementaryIndexPathBeforeShadowUpdates:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_delegateActual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "collectionView:willDisplaySupplementaryView:forElementKind:atIndexPath:", v15, v10, v11, v12);

  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionView:didEndDisplayingCell:forItemAtIndexPath:", v12, v8, v9);

  }
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  -[_UICollectionViewShadowUpdatesController _supplementaryIndexPathBeforeShadowUpdates:](self, "_supplementaryIndexPathBeforeShadowUpdates:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_delegateActual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "collectionView:didEndDisplayingSupplementaryView:forElementOfKind:atIndexPath:", v15, v10, v11, v12);

  }
}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "collectionView:canEditItemAtIndexPath:", v6, v7);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)collectionView:(id)a3 shouldShowMenuForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "collectionView:shouldShowMenuForItemAtIndexPath:", v6, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v10 = a3;
  v11 = a6;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_delegateActual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "collectionView:canPerformAction:forItemAtIndexPath:withSender:", v10, a4, v12, v11);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)collectionView:(id)a3 performAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a6;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_delegateActual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView:performAction:forItemAtIndexPath:withSender:", v14, a4, v11, v10);

  }
}

- (id)collectionView:(id)a3 transitionLayoutForOldLayout:(id)a4 newLayout:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_delegateActual");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionView:transitionLayoutForOldLayout:newLayout:", v10, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_delegateActual");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collectionView:targetIndexPathForMoveOfItemFromOriginalIndexPath:atCurrentIndexPath:toProposedIndexPath:", v13, v12, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_delegateActual");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionView:targetIndexPathForMoveFromItemAtIndexPath:toProposedIndexPath:", v10, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_delegateActual");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionView:targetContentOffsetForProposedContentOffset:", v7, x, y);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "collectionView:canFocusItemAtIndexPath:", v6, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_delegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "collectionView:shouldUpdateFocusInContext:", v8, v5);

  return v9;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_delegateActual");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionView:didUpdateFocusInContext:withAnimationCoordinator:", v10, v8, v7);

}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "collectionView:selectionFollowsFocusForItemAtIndexPath:", v9, v5);

  }
  else
  {
    v10 = objc_msgSend(v6, "selectionFollowsFocus");
  }

  return v10;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_delegateActual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForPreferredFocusedViewInCollectionView:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewShadowUpdatesController indexPathAfterShadowUpdates:](self, "indexPathAfterShadowUpdates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_collectionView:canFocusItemAtIndexPath:", v6, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)indexPathForPreferredFocusedItemForCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_delegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForPreferredFocusedItemForCollectionView:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewShadowUpdatesController indexPathAfterShadowUpdates:](self, "indexPathAfterShadowUpdates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:didFocusItemAtIndexPath:", v9, v6);

  }
}

- (void)_collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_collectionView:didFocusItemAtIndexPath:", v9, v6);

  }
}

- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:didUnfocusItemAtIndexPath:", v9, v6);

  }
}

- (BOOL)collectionView:(id)a3 shouldUpdateFocusFromItemAtIndexPath:(id)a4 toView:(id)a5 heading:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v10 = a3;
  v11 = a5;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_delegateActual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "collectionView:shouldUpdateFocusFromItemAtIndexPath:toView:heading:", v10, v12, v11, a6);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_collectionView:(id)a3 horizontalIndexTitleBar:(id)a4 selectedEntry:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_delegateActual");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_collectionView:horizontalIndexTitleBar:selectedEntry:", v10, v9, v8);

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView:contextMenuConfigurationForItemsAtIndexPaths:point:", v9, v8, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView:contextMenuConfiguration:highlightPreviewForItemAtIndexPath:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView:contextMenuConfiguration:dismissalPreviewForItemAtIndexPath:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView:contextMenuConfigurationForItemAtIndexPath:point:", v9, v8, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_delegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView:previewForHighlightingContextMenuWithConfiguration:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_delegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView:previewForDismissingContextMenuWithConfiguration:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView:willPerformPreviewActionForMenuWithConfiguration:animator:", v9, v8, v7);

}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView:willDisplayContextMenuWithConfiguration:animator:", v9, v8, v7);

}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView:willEndContextMenuInteractionWithConfiguration:animator:", v9, v8, v7);

}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "collectionView:canPerformPrimaryActionForItemAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView:performPrimaryActionForItemAtIndexPath:", v8, v6);

  }
}

- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView:sceneActivationConfigurationForItemAtIndexPath:point:", v9, v8, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_collectionView:sceneActivationConfigurationForItemAtIndexPath:point:", v9, v8, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_indexPathOfReferenceItemForLayoutTransitionInCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_delegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_indexPathOfReferenceItemForLayoutTransitionInCollectionView:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGPoint)_collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_delegateActual");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_collectionView:targetContentOffsetForProposedContentOffset:", v7, x, y);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (BOOL)_collectionView:(id)a3 shouldApplyTransitionContentOffset:(CGPoint)a4 contentSize:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  char v13;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v10 = a3;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_delegateActual");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_collectionView:shouldApplyTransitionContentOffset:contentSize:", v10, x, y, width, height);

  return v13;
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  objc_msgSend(v9, "_delegateActual");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_collectionView:orthogonalScrollViewDidScroll:section:", v9, v8, a5);

}

- (id)_collectionView:(id)a3 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_collectionView:indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:", v8, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v10;
  }
  else
  {
    objc_msgSend(v7, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_collectionView:indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:", v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v10 && v11)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_delegateActual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_collectionView:targetIndexPathForMoveFromItemAtIndexPath:toProposedIndexPath:", v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)_collectionView:(id)a3 styleForContextMenuWithConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_delegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_collectionView:styleForContextMenuWithConfiguration:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_collectionView:(id)a3 accessoriesForContextMenuWithConfiguration:(id)a4 layoutAnchor:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  __int128 v10;
  void *v11;
  _OWORD v13[2];
  int64_t var4;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "_delegateActual");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&a5->var2;
  v13[0] = *(_OWORD *)&a5->var0;
  v13[1] = v10;
  var4 = a5->var4;
  objc_msgSend(v9, "_collectionView:accessoriesForContextMenuWithConfiguration:layoutAnchor:", v8, v7, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_dci_collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_dci_collectionView:contextMenuConfigurationForItemsAtIndexPaths:point:", v9, v8, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_dci_collectionView:(id)a3 contextMenuConfigurationForSelectedItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_dci_collectionView:contextMenuConfigurationForSelectedItemsAtIndexPaths:point:", v9, v8, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_dci_collectionView:(id)a3 contextMenuConfiguration:(id)a4 previewForHighlightingItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_dci_collectionView:contextMenuConfiguration:previewForHighlightingItemAtIndexPath:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_dci_collectionView:(id)a3 contextMenuConfiguration:(id)a4 previewForDismissingToItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_dci_collectionView:contextMenuConfiguration:previewForDismissingToItemAtIndexPath:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_prefetchDataSourceActual");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "collectionView:prefetchItemsAtIndexPaths:", v6, v8);

}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_prefetchDataSourceActual");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "collectionView:cancelPrefetchingForItemsAtIndexPaths:", v6, v8);

}

- (id)_collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_dragSourceDelegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_collectionView:itemsForBeginningDragSession:atIndexPath:", v11, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)_collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  y = a6.y;
  x = a6.x;
  v10 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_dragSourceDelegateActual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_collectionView:itemsForAddingToDragSession:atIndexPath:point:", v14, v10, v11, x, y);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (void)_collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dragSourceDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_collectionView:dragSessionWillBegin:", v7, v5);

}

- (void)_collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dragSourceDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_collectionView:dragSessionDidEnd:", v7, v5);

}

- (void)_collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dragDestinationDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_collectionView:performDropWithCoordinator:", v7, v5);

}

- (BOOL)collectionView:(id)a3 canHandleDropSesson:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dragDestinationDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "_collectionView:canHandleDropSesson:", v8, v5);

  return v9;
}

- (void)_collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dragDestinationDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_collectionView:dropSessionDidEnter:", v7, v5);

}

- (id)_collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dragDestinationDelegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_collectionView:dropSessionDidUpdate:withDestinationIndexPath:", v11, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dragDestinationDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_collectionView:dropSessionDidExit:", v7, v5);

}

- (void)_collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dragDestinationDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_collectionView:dropSessionDidEnd:", v7, v5);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  _BOOL4 v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGSize result;

  v7 = a4;
  v8 = a5;
  v9 = -[_UICollectionViewShadowUpdatesController _shouldPerformTranslationForDelegateBasedFlowLayoutSizing](self, "_shouldPerformTranslationForDelegateBasedFlowLayoutSizing");
  v10 = v8;
  v11 = v10;
  if (!v9)
    goto LABEL_3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_3;
  objc_msgSend(v7, "layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:", v10, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  v23 = *MEMORY[0x1E0C9D820];
  v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v24 != *MEMORY[0x1E0C9D820] || v21 != v22)
  {
    objc_msgSend(v11, "size");
    v16 = v26;
    v18 = v27;
    goto LABEL_4;
  }

  -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "initialSnapshot");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "globalIndexForIndexPath:", v10);

  if (v30 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v10;
LABEL_3:
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_delegateActual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView:layout:sizeForItemAtIndexPath:", v14, v7, v11);
    v16 = v15;
    v18 = v17;

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v7, "_fallbackItemSize");
  v16 = v31;
  v18 = v32;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "itemSize");
    if (v33 != v23 || v34 != v22)
    {
      v18 = v34;
      v16 = v33;
    }
  }
LABEL_5:

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  v7 = a4;
  v8 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v8;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_delegateActual");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionView:layout:insetForSectionAtIndex:", v16, v7, v13);
    v12 = v17;
    v11 = v18;
    v10 = v19;
    v9 = v20;

  }
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v24 = v9;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v7;
  int64_t v8;
  double v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  v7 = a4;
  v8 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  v9 = 0.0;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_delegateActual");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionView:layout:minimumLineSpacingForSectionAtIndex:", v13, v7, v10);
    v9 = v14;

  }
  return v9;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7;
  int64_t v8;
  double v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  v7 = a4;
  v8 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  v9 = 0.0;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_delegateActual");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionView:layout:minimumInteritemSpacingForSectionAtIndex:", v13, v7, v10);
    v9 = v14;

  }
  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  int64_t v8;
  double v9;
  double v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v7 = a4;
  v8 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v11 = v8;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_delegateActual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView:layout:referenceSizeForHeaderInSection:", v14, v7, v11);
    v9 = v15;
    v10 = v16;

  }
  v17 = v9;
  v18 = v10;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7;
  int64_t v8;
  double v9;
  double v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v7 = a4;
  v8 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v11 = v8;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_delegateActual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView:layout:referenceSizeForFooterInSection:", v14, v7, v11);
    v9 = v15;
    v10 = v16;

  }
  v17 = v9;
  v18 = v10;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)_collectionView:(id)a3 flowLayoutRowAlignmentOptionsForSection:(int64_t)a4
{
  int64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v7 = v5;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_collectionView:flowLayoutRowAlignmentOptionsForSection:", v10, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_collectionView:(id)a3 layout:(id)a4 flowLayoutRowAlignmentOptionsForSection:(int64_t)a5
{
  id v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v10 = v8;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_delegateActual");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_collectionView:layout:flowLayoutRowAlignmentOptionsForSection:", v13, v7, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_collectionView:(id)a3 layout:(id)a4 sizesForItemsInSection:(int64_t)a5
{
  id v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v10 = v8;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_delegateActual");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_collectionView:layout:sizesForItemsInSection:", v13, v7, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v16;
  BOOL v17;
  double v18;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;

  v7 = a4;
  v8 = a5;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_2:
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionView:tableLayout:heightForRowAtIndexPath:", v12, v7, v9);
    v14 = v13;

    goto LABEL_3;
  }
  objc_msgSend(v7, "rowHeight");
  v14 = v16;
  v17 = fabs(v16) < 2.22044605e-16;
  v18 = fabs(v16 + -1.79769313e308);
  if (v17 || v18 <= 2.22044605e-16)
  {
    -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "initialSnapshot");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "globalIndexForIndexPath:", v8);

    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "_defaultCellHeight");
      v14 = v23;
      goto LABEL_3;
    }
    v9 = v8;
    goto LABEL_2;
  }
LABEL_3:

  return v14;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 estimatedHeightForRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v8 = a3;
  v9 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_delegateActual");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "collectionView:tableLayout:estimatedHeightForRowAtIndexPath:", v8, v9, v10);
    v14 = v13;

  }
  else
  {
    v14 = -1.0;
  }

  return v14;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 estimatedHeightForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  int64_t v10;
  double v11;
  int64_t v12;
  void *v13;
  void *v14;
  double v15;

  v8 = a3;
  v9 = a4;
  v10 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  v11 = 0.0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v10;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_delegateActual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "collectionView:tableLayout:estimatedHeightForHeaderInSection:", v8, v9, v12);
    v11 = v15;

  }
  return v11;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 estimatedHeightForFooterInSection:(int64_t)a5
{
  id v8;
  id v9;
  int64_t v10;
  double v11;
  int64_t v12;
  void *v13;
  void *v14;
  double v15;

  v8 = a3;
  v9 = a4;
  v10 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  v11 = 0.0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v10;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_delegateActual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "collectionView:tableLayout:estimatedHeightForFooterInSection:", v8, v9, v12);
    v11 = v15;

  }
  return v11;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5
{
  id v7;
  double v8;
  double v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;

  v7 = a4;
  objc_msgSend(v7, "sectionHeaderHeight");
  v9 = v8;
  v10 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v10;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_delegateActual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView:tableLayout:heightForHeaderInSection:", v14, v7, v11);
    v9 = v15;

  }
  return v9;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForFooterInSection:(int64_t)a5
{
  id v7;
  double v8;
  double v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;

  v7 = a4;
  objc_msgSend(v7, "sectionFooterHeight");
  v9 = v8;
  v10 = -[_UICollectionViewShadowUpdatesController sectionIndexBeforeShadowUpdates:](self, "sectionIndexBeforeShadowUpdates:", a5);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v10;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_delegateActual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView:tableLayout:heightForFooterInSection:", v14, v7, v11);
    v9 = v15;

  }
  return v9;
}

- (double)collectionView:(id)a3 heightForHeaderViewInTableLayout:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_delegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView:heightForHeaderViewInTableLayout:", v8, v5);
  v10 = v9;

  return v10;
}

- (double)collectionView:(id)a3 heightForFooterViewInTableLayout:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_delegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView:heightForFooterViewInTableLayout:", v8, v5);
  v10 = v9;

  return v10;
}

- (void)collectionView:(id)a3 tableLayout:(id)a4 accessoryButtonTappedForRowWithIndexPath:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView:tableLayout:accessoryButtonTappedForRowWithIndexPath:", v10, v11, v7);

  }
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "collectionView:tableLayout:editingStyleForRowAtIndexPath:", v11, v7, v8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)collectionView:(id)a3 tableLayout:(id)a4 commitEditingStyle:(int64_t)a5 forRowAtIndexPath:(id)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionView:tableLayout:commitEditingStyle:forRowAtIndexPath:", v12, v13, a5, v9);

  }
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView:tableLayout:leadingSwipeActionsConfigurationForRowAtIndexPath:", v11, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView:tableLayout:trailingSwipeActionsConfigurationForRowAtIndexPath:", v11, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 tableLayout:(id)a4 shouldIndentWhileEditingRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "collectionView:tableLayout:shouldIndentWhileEditingRowAtIndexPath:", v11, v7, v8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)collectionView:(id)a3 tableLayout:(id)a4 willBeginEditingRowAtIndexPath:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView:tableLayout:willBeginEditingRowAtIndexPath:", v10, v11, v7);

  }
}

- (void)collectionView:(id)a3 tableLayout:(id)a4 didEndEditingRowAtIndexPath:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionView:tableLayout:didEndEditingRowAtIndexPath:", v10, v11, v7);

  }
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 indentationLevelForRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "collectionView:tableLayout:indentationLevelForRowAtIndexPath:", v11, v7, v8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 leadingSwipeActionsForRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView:tableLayout:leadingSwipeActionsForRowAtIndexPath:", v11, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsForRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collectionView:tableLayout:trailingSwipeActionsForRowAtIndexPath:", v11, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dragDelegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionView:itemsForBeginningDragSession:atIndexPath:", v11, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  y = a6.y;
  x = a6.x;
  v10 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_dragDelegateActual");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "collectionView:itemsForAddingToDragSession:atIndexPath:point:", v14, v10, v11, x, y);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView:dragPreviewParametersForItemAtIndexPath:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dragDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView:dragSessionWillBegin:", v7, v5);

}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dragDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView:dragSessionDidEnd:", v7, v5);

}

- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "collectionView:dragSessionAllowsMoveOperation:", v8, v5);

  return v9;
}

- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "collectionView:dragSessionIsRestrictedToDraggingApplication:", v8, v5);

  return v9;
}

- (BOOL)_collectionView:(id)a3 prefersFullSizePreviewsForDragSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "_collectionView:prefersFullSizePreviewsForDragSession:", v8, v5);

  return v9;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_dragDelegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "_collectionView:dataOwnerForDragSession:atIndexPath:", v11, v7, v8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_collectionView:(id)a3 dragSessionSupportsSystemDrag:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "_collectionView:dragSessionSupportsSystemDrag:", v8, v5);

  return v9;
}

- (id)_collectionView:(id)a3 dragSessionPropertiesForSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_collectionView:dragSessionPropertiesForSession:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dropDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView:performDropWithCoordinator:", v7, v5);

}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dropDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "collectionView:canHandleDropSession:", v8, v5);

  return v9;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dropDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView:dropSessionDidEnter:", v7, v5);

}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v9;
  if (v7 && !v9)
  {
    if (-[_UICollectionViewShadowUpdatesController _shadowUpdatesAreSimpleInsertWithOptionalMoveSequenceForIndexPath:](self, "_shadowUpdatesAreSimpleInsertWithOptionalMoveSequenceForIndexPath:", v7))
    {
      v10 = v7;
    }
    else
    {
      v10 = 0;
    }
  }
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_dropDelegateActual");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionView:dropSessionDidUpdate:withDestinationIndexPath:", v13, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dropDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView:dropSessionDidExit:", v7, v5);

}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dropDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView:dropSessionDidEnd:", v7, v5);

}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_dropDelegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView:dropPreviewParametersForItemAtIndexPath:", v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v7 = a4;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_dropDelegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "_collectionView:dataOwnerForDropSession:withDestinationIndexPath:", v11, v7, v8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_collectionView:(id)a3 liftingPreviewParametersForItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dragSourceDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_collectionView:liftingPreviewParametersForItemAtIndexPath:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_collectionView:(id)a3 dragDestinationTargetIndexPathForProposedIndexPath:(id)a4 currentIndexPath:(id)a5 dropSession:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a6;
  v10 = a5;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_dragDestinationDelegateActual");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_collectionView:dragDestinationTargetIndexPathForProposedIndexPath:currentIndexPath:dropSession:", v15, v11, v12, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)_collectionView:(id)a3 canHandleDropSesson:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dragDestinationDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "_collectionView:canHandleDropSesson:", v8, v5);

  return v9;
}

- (BOOL)_collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v7 = a5;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "_collectionView:shouldSpringLoadItemAtIndexPath:withContext:", v11, v8, v7);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v7 = a5;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "collectionView:shouldSpringLoadItemAtIndexPath:withContext:", v11, v8, v7);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldPerformTranslationForDelegateBasedFlowLayoutSizing
{
  return 1;
}

- (BOOL)_shadowUpdatesAreSimpleInsertWithOptionalMoveSequenceForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *shadowUpdates;
  _QWORD *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[NSMutableArray count](self->__shadowUpdates, "count");
  shadowUpdates = self->__shadowUpdates;
  if (v5 == 1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](shadowUpdates, "objectAtIndexedSubscript:", 0);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "updateAction"))
    {
      v8 = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[UICollectionViewUpdateItem _indexPath](v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqual:", v4);
LABEL_12:

    goto LABEL_13;
  }
  if (-[NSMutableArray count](shadowUpdates, "count") == 2)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->__shadowUpdates, "objectAtIndexedSubscript:", 0);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->__shadowUpdates, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "updateAction") || objc_msgSend(v9, "updateAction") != 3)
    {
      v8 = 0;
    }
    else
    {
      -[UICollectionViewUpdateItem _indexPath](v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexPathBeforeUpdate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqual:", v11))
      {
        objc_msgSend(v9, "indexPathAfterUpdate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v4, "isEqual:", v12);

      }
      else
      {
        v8 = 0;
      }

    }
    goto LABEL_12;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (id)_rebasedShadowUpdatesForUpdate:(id)a3 initialSnapshot:(id)a4 shadowUpdates:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  BOOL v21;
  UICollectionViewUpdateItem *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v35;
  id obj;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  _BYTE v46[128];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = v7;
  v47[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v8;
  +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v9;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v40)
  {
    v37 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      v13 = v11;
      do
      {
        if (*(_QWORD *)v42 != v37)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD **)(*((_QWORD *)&v41 + 1) + 8 * v12);
        objc_msgSend(v14, "indexPathBeforeUpdate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "finalIndexPathForInitialIndexPath:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "indexPathAfterUpdate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "finalIndexPathForInitialIndexPath:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "updateAction") != 3)
        {
          if (objc_msgSend(v14, "updateAction"))
            v21 = 0;
          else
            v21 = v18 == 0;
          if (v21)
          {
            objc_msgSend(v14, "indexPathAfterUpdate");
            v18 = objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_21;
        }
        if (!v16)
        {
          objc_msgSend(v14, "indexPathBeforeUpdate");
          v16 = objc_claimAutoreleasedReturnValue();
        }
        if (v16)
          v19 = v18 == 0;
        else
          v19 = 1;
        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewShadowUpdatesController.m"), 1303, CFSTR("Rebased moves cannot have either initial or final indexPaths == nil. updateItem(%@)"), v14);

LABEL_21:
          if (!(v16 | v18))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewShadowUpdatesController.m"), 1311, CFSTR("Rebased updateItem cannot have both an initial+final indexPath == nil. Faulty updateItem is (%@)"), v14);

            v16 = 0;
            v18 = 0;
          }
        }
        v22 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v16, v18, objc_msgSend(v14, "updateAction"));
        if (v14)
          v23 = (void *)v14[11];
        else
          v23 = 0;
        v24 = v23;
        -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v22, v24);

        if ((-[UICollectionViewUpdateItem isNOOP]((uint64_t)v22) & 1) == 0)
          objc_msgSend(v35, "addObject:", v22);
        objc_msgSend(v13, "updates");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "arrayByAddingObject:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v38, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "finalSnapshot");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v28, v29);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v11;
      }
      while (v40 != v12);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      v40 = v31;
    }
    while (v31);
  }

  return v35;
}

- (_UIDataSourceUpdateMap)updateMap
{
  _UIDataSourceUpdateMap *updateMap;
  void *v4;
  void *v5;
  _UIDataSourceUpdateMap *v6;
  _UIDataSourceUpdateMap *v7;

  updateMap = self->_updateMap;
  if (!updateMap)
  {
    -[_UICollectionViewShadowUpdatesController initialSnapshot](self, "initialSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v4, v5);
    v6 = (_UIDataSourceUpdateMap *)objc_claimAutoreleasedReturnValue();
    v7 = self->_updateMap;
    self->_updateMap = v6;

    updateMap = self->_updateMap;
  }
  return updateMap;
}

- (void)_regenerateUpdateMap
{
  id v3;

  -[_UICollectionViewShadowUpdatesController setUpdateMap:](self, "setUpdateMap:", 0);
  -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_performAppendingInsertsFixups");

}

- (_UIDataSourceSnapshotter)initialSnapshot
{
  _UIDataSourceSnapshotter *initialSnapshot;
  void *v4;
  _UIDataSourceSnapshotter *v5;
  _UIDataSourceSnapshotter *v6;

  initialSnapshot = self->_initialSnapshot;
  if (!initialSnapshot)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167C258, "snapshotterForDataSourceBackedView:", v4);
    v5 = (_UIDataSourceSnapshotter *)objc_claimAutoreleasedReturnValue();
    v6 = self->_initialSnapshot;
    self->_initialSnapshot = v5;

    initialSnapshot = self->_initialSnapshot;
  }
  return initialSnapshot;
}

- (id)_rebasedUpdateMapForUpdates:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v5 = a3;
  if (!self->_updateMap || !self->_initialSnapshot)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewShadowUpdatesController.m"), 1350, CFSTR("UICollectionView internal inconsistency: attempted to rebase shadow updates with a nil update map and/or initial snapshot. Collection view: %@"), v12);

  }
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167C258, "snapshotterForDataSourceBackedView:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewShadowUpdatesController initialSnapshot](self, "initialSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDataSourceUpdateMap validatedMapForInitialSnapshot:finalSnapshot:batchUpdateItems:](_UIDataSourceUpdateMap, "validatedMapForInitialSnapshot:finalSnapshot:batchUpdateItems:", v8, v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_coalesceUpdatesIfPossible:(id)a3
{
  id v3;
  uint64_t v4;
  UICollectionViewUpdateItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UICollectionViewUpdateItem *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = (UICollectionViewUpdateItem *)v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    v10 = v7;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v3);
      v11 = *(_QWORD **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
      if (!v11 || v11[10] != 3)
        break;
      objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9), "indexPathBeforeUpdate", (_QWORD)v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v6)
      {
        v14 = objc_msgSend(v12, "isEqual:", v10);

        if (!v14)
          break;
      }
      else
      {
        v6 = v12;
      }
      objc_msgSend(v11, "indexPathAfterUpdate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (UICollectionViewUpdateItem *)((char *)v9 + 1);
      v10 = v7;
      if (v5 == v9)
      {
        v5 = (UICollectionViewUpdateItem *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          goto LABEL_3;

        if (v6 && v7)
          v5 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v6, v7, 3);
        goto LABEL_19;
      }
    }
  }
  else
  {
    v6 = 0;
    v10 = 0;
  }

  v5 = 0;
  v7 = v10;
LABEL_19:

  return v5;
}

- (id)indexPathBeforeShadowUpdates:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (-[NSMutableArray count](self->__shadowUpdates, "count"))
  {
    -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "initialIndexPathForFinalIndexPath:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (id)indexPathsBeforeShadowUpdates:(id)a3
{
  id v4;
  id v5;
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
  v4 = a3;
  if (-[NSMutableArray count](self->__shadowUpdates, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
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
          -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (id)indexPathsAfterShadowUpdates:(id)a3
{
  id v4;
  id v5;
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
  v4 = a3;
  if (-[NSMutableArray count](self->__shadowUpdates, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
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
          -[_UICollectionViewShadowUpdatesController indexPathAfterShadowUpdates:](self, "indexPathAfterShadowUpdates:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (int64_t)sectionIndexBeforeShadowUpdates:(int64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->__shadowUpdates, "count"))
  {
    -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v5, "initialSectionIndexForFinalSectionIndex:", a3);

  }
  return a3;
}

- (int64_t)sectionIndexAfterShadowUpdates:(int64_t)a3
{
  return -[_UICollectionViewShadowUpdatesController sectionIndexAfterShadowUpdates:allowingAppendingInserts:](self, "sectionIndexAfterShadowUpdates:allowingAppendingInserts:", a3, 0);
}

- (int64_t)sectionIndexAfterShadowUpdates:(int64_t)a3 allowingAppendingInserts:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a4;
  if (-[NSMutableArray count](self->__shadowUpdates, "count"))
  {
    if (v4
      && (-[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "initialSnapshot"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "numberOfSections"),
          v8,
          v7,
          v9 == a3))
    {
      -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finalSnapshot");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = objc_msgSend(v11, "numberOfSections");

    }
    else
    {
      -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = objc_msgSend(v10, "finalSectionIndexForInitialSectionIndex:", a3);
    }

  }
  return a3;
}

- (id)_indexPathsBeforeShadowUpdates:(id)a3
{
  id v4;
  id v5;
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
        -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_supplementaryIndexPathBeforeShadowUpdates:(id)a3
{
  return a3;
}

- (id)_shadowUpdateReuseIdentifierForItemItemAtIndexPath:(id)a3
{
  return CFSTR("com.apple.UIKit.shadowReuseCellIdentifier");
}

- (id)_findShadowUpdateForIdentifier:(id)a3 inShadowUpdates:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__46;
  v17 = __Block_byref_object_dispose__46;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91___UICollectionViewShadowUpdatesController__findShadowUpdateForIdentifier_inShadowUpdates___block_invoke;
  v10[3] = &unk_1E16BAF48;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_findInsertShadowUpdateForFinalIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__46;
  v16 = __Block_byref_object_dispose__46;
  v17 = 0;
  -[_UICollectionViewShadowUpdatesController shadowUpdates](self, "shadowUpdates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85___UICollectionViewShadowUpdatesController__findInsertShadowUpdateForFinalIndexPath___block_invoke;
  v9[3] = &unk_1E16BE578;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_pruneAndRebaseShadowUpdatesForShadowInsertWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateMapByRevertingUpdateWithIdentifier:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  -[_UICollectionViewShadowUpdatesController _regenerateUpdateMap](self, "_regenerateUpdateMap");
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (void)set_shadowUpdates:(id)a3
{
  objc_storeStrong((id *)&self->__shadowUpdates, a3);
}

@end
