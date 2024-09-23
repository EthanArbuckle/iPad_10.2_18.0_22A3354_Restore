@implementation _UITableViewShadowUpdatesController

- (_UITableViewShadowUpdatesController)initWithTableView:(id)a3
{
  id v4;
  _UITableViewShadowUpdatesController *v5;
  _UITableViewShadowUpdatesController *v6;
  uint64_t v7;
  NSMutableArray *shadowUpdates;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UITableViewShadowUpdatesController;
  v5 = -[_UITableViewShadowUpdatesController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tableView, v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    shadowUpdates = v6->_shadowUpdates;
    v6->_shadowUpdates = (NSMutableArray *)v7;

  }
  return v6;
}

- (BOOL)hasShadowUpdates
{
  return -[NSMutableArray count](self->_shadowUpdates, "count") != 0;
}

- (NSMutableArray)shadowUpdates
{
  return self->_shadowUpdates;
}

- (id)shadowUpdateWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_UITableViewShadowUpdatesController shadowUpdates](self, "shadowUpdates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        if (v9)
          v10 = (void *)v9[11];
        else
          v10 = 0;
        v11 = v10;
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_15;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v6 = (_QWORD *)v13;
    }
    while (v13);
  }
LABEL_15:

  return v6;
}

- (_UIDataSourceSnapshotter)dataSourceBeforeShadowUpdates
{
  void *v3;

  if (-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    -[_UITableViewShadowUpdatesController initialSnapshot](self, "initialSnapshot");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (_UIDataSourceSnapshotter *)v3;
}

- (_UIDataSourceSnapshotter)dataSourceAfterShadowUpdates
{
  void *v3;
  void *v4;

  if (-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finalSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (_UIDataSourceSnapshotter *)v4;
}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_shadowUpdates, "removeAllObjects");
  -[_UITableViewShadowUpdatesController setInitialSnapshot:](self, "setInitialSnapshot:", 0);
  -[_UITableViewShadowUpdatesController setUpdateMap:](self, "setUpdateMap:", 0);
}

- (_UIDataSourceUpdateMap)updateMap
{
  _UIDataSourceUpdateMap *updateMap;

  updateMap = self->_updateMap;
  if (!updateMap)
  {
    -[_UITableViewShadowUpdatesController regenerateUpdateMap](self, "regenerateUpdateMap");
    updateMap = self->_updateMap;
  }
  return updateMap;
}

- (void)regenerateUpdateMap
{
  uint64_t v4;
  id v5;
  void *v6;
  _UIDataSourceUpdateMap *v7;
  _UIDataSourceUpdateMap *updateMap;
  void *v9;
  id v10;

  -[_UITableViewShadowUpdatesController initialSnapshot](self, "initialSnapshot");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITableViewShadowUpdatesController shadowUpdates](self, "shadowUpdates");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = (void *)v4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewShadowUpdatesController.m"), 93, CFSTR("UITableView internal inconsistency: initialSnapshot should not be nil when creating the update map"));

    v5 = 0;
  }
  +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v5, v6);
  v7 = (_UIDataSourceUpdateMap *)objc_claimAutoreleasedReturnValue();
  updateMap = self->_updateMap;
  self->_updateMap = v7;

  -[_UIDataSourceUpdateMap _performAppendingInsertsFixups](self->_updateMap, "_performAppendingInsertsFixups");
}

- (void)appendShadowUpdate:(id)a3
{
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  _BYTE *v16;

  v5 = a3;
  v16 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewShadowUpdatesController.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shadowUpdate != nil"));

    v5 = 0;
  }
  -[UICollectionViewUpdateItem _indexPath](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewShadowUpdatesController.m"), 101, CFSTR("UITableView internal inconsistency: attempted to append shadow update without an index path"));

  }
  if (!-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    -[_UITableViewShadowUpdatesController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167C258, "snapshotterForDataSourceBackedView:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITableViewShadowUpdatesController setInitialSnapshot:](self, "setInitialSnapshot:", v8);

  }
  v9 = v16;
  if (!v16 || !*((_QWORD *)v16 + 10))
  {
    -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finalSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewUpdateItem _indexPath](v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "indexPathIsSectionAppendingInsert:", v12);

    v9 = v16;
    if (v16 && v13)
      v16[56] |= 1u;
  }
  -[NSMutableArray addObject:](self->_shadowUpdates, "addObject:", v9);
  -[_UITableViewShadowUpdatesController regenerateUpdateMap](self, "regenerateUpdateMap");

}

- (void)removeShadowUpdate:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableArray *shadowUpdates;
  void *v9;
  id v10;

  v4 = a3;
  -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = (void *)v4[11];
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v5, "updateMapByRevertingUpdateWithIdentifier:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray removeAllObjects](self->_shadowUpdates, "removeAllObjects");
  shadowUpdates = self->_shadowUpdates;
  objc_msgSend(v10, "updates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](shadowUpdates, "addObjectsFromArray:", v9);

  -[_UITableViewShadowUpdatesController regenerateUpdateMap](self, "regenerateUpdateMap");
}

- (void)rebaseExistingShadowUpdatesForUpdates:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *shadowUpdates;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[_UITableViewShadowUpdatesController shadowUpdates](self, "shadowUpdates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[_UITableViewShadowUpdatesController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E167C258, "snapshotterForDataSourceBackedView:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "count") == 1)
      {
        objc_msgSend(v4, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "initialSnapshot");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[_UITableViewShadowUpdatesController initialSnapshot](self, "initialSnapshot");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIDataSourceUpdateMap mapForInitialSnapshot:finalSnapshot:batchUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:finalSnapshot:batchUpdateItems:", v9, v8, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rebasedMapFromNewBaseMap:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableArray removeAllObjects](self->_shadowUpdates, "removeAllObjects");
      shadowUpdates = self->_shadowUpdates;
      objc_msgSend(v15, "updates");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](shadowUpdates, "addObjectsFromArray:", v17);

      -[_UITableViewShadowUpdatesController setInitialSnapshot:](self, "setInitialSnapshot:", v8);
      -[_UITableViewShadowUpdatesController regenerateUpdateMap](self, "regenerateUpdateMap");

    }
  }

}

- (id)_rebasedShadowUpdatesForUpdate:(id)a3 initialSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  UICollectionViewUpdateItem *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _UITableViewShadowUpdatesController *v31;
  id v33;
  id obj;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _BYTE v44[128];
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = v6;
  v45[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v7;
  +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v31 = self;
  -[_UITableViewShadowUpdatesController shadowUpdates](self, "shadowUpdates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v38)
  {
    v35 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      v11 = v9;
      do
      {
        if (*(_QWORD *)v40 != v35)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD **)(*((_QWORD *)&v39 + 1) + 8 * v10);
        objc_msgSend(v12, "indexPathBeforeUpdate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "finalIndexPathForInitialIndexPath:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "indexPathAfterUpdate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "finalIndexPathForInitialIndexPath:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "updateAction") != 3)
        {
          if (objc_msgSend(v12, "updateAction"))
            v19 = 0;
          else
            v19 = v16 == 0;
          if (v19)
          {
            objc_msgSend(v12, "indexPathAfterUpdate");
            v16 = objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_21;
        }
        if (!v14)
        {
          objc_msgSend(v12, "indexPathBeforeUpdate");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        if (v14)
          v17 = v16 == 0;
        else
          v17 = 1;
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v31, CFSTR("_UITableViewShadowUpdatesController.m"), 166, CFSTR("Rebased moves cannot have either initial or final indexPaths == nil. updateItem(%@)"), v12);

LABEL_21:
          if (!(v14 | v16))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v31, CFSTR("_UITableViewShadowUpdatesController.m"), 174, CFSTR("Rebased updateItem cannot have both an initial+final indexPath == nil. Faulty updateItem is (%@)"), v12);

            v14 = 0;
            v16 = 0;
          }
        }
        v20 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:]([UICollectionViewUpdateItem alloc], "initWithInitialIndexPath:finalIndexPath:updateAction:", v14, v16, objc_msgSend(v12, "updateAction"));
        if (v12)
          v21 = (void *)v12[11];
        else
          v21 = 0;
        v22 = v21;
        -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v20, v22);

        if ((-[UICollectionViewUpdateItem isNOOP]((uint64_t)v20) & 1) == 0)
          objc_msgSend(v33, "addObject:", v20);
        objc_msgSend(v11, "updates");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "arrayByAddingObject:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v36, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "finalSnapshot");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v26, v27);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v9;
      }
      while (v38 != v10);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      v38 = v29;
    }
    while (v29);
  }

  return v33;
}

- (int64_t)sectionBeforeShadowUpdates:(int64_t)a3
{
  void *v5;

  if (-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v5, "initialSectionIndexForFinalSectionIndex:", a3);

  }
  return a3;
}

- (int64_t)sectionAfterShadowUpdates:(int64_t)a3
{
  void *v5;

  if (-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v5, "finalSectionIndexForInitialSectionIndex:", a3);

  }
  return a3;
}

- (id)sectionsBeforeShadowUpdates:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = -[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates");
  if (v4 && v5)
  {
    -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67___UITableViewShadowUpdatesController_sectionsBeforeShadowUpdates___block_invoke;
    v13[3] = &unk_1E16B2978;
    v14 = v6;
    v8 = v7;
    v15 = v8;
    v9 = v6;
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v13);
    v10 = v15;
    v11 = v8;

  }
  else
  {
    v11 = v4;
  }

  return v11;
}

- (id)sectionsAfterShadowUpdates:(id)a3
{
  return -[_UITableViewShadowUpdatesController sectionsAfterShadowUpdates:allowAppendingInsert:](self, "sectionsAfterShadowUpdates:allowAppendingInsert:", a3, 0);
}

- (id)sectionsAfterShadowUpdates:(id)a3 allowAppendingInsert:(BOOL)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates");
  if (v6 && v7)
  {
    -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87___UITableViewShadowUpdatesController_sectionsAfterShadowUpdates_allowAppendingInsert___block_invoke;
    v15[3] = &unk_1E16E4408;
    v16 = v8;
    v18 = a4;
    v10 = v9;
    v17 = v10;
    v11 = v8;
    objc_msgSend(v6, "enumerateIndexesUsingBlock:", v15);
    v12 = v17;
    v13 = v10;

  }
  else
  {
    v13 = v6;
  }

  return v13;
}

- (id)indexPathBeforeShadowUpdates:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
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

- (id)indexPathAfterShadowUpdates:(id)a3
{
  return -[_UITableViewShadowUpdatesController indexPathAfterShadowUpdates:allowAppendingInsert:](self, "indexPathAfterShadowUpdates:allowAppendingInsert:", a3, 0);
}

- (id)indexPathAfterShadowUpdates:(id)a3 allowAppendingInsert:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a4;
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITableViewShadowUpdatesController indexPathsAfterShadowUpdates:allowAppendingInsert:](self, "indexPathsAfterShadowUpdates:allowAppendingInsert:", v8, v4, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)indexPathsBeforeShadowUpdates:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates");
  if (v4 && v5)
  {
    -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "initialIndexPathForFinalIndexPath:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (id)indexPathsAfterShadowUpdates:(id)a3
{
  return -[_UITableViewShadowUpdatesController indexPathsAfterShadowUpdates:allowAppendingInsert:](self, "indexPathsAfterShadowUpdates:allowAppendingInsert:", a3, 0);
}

- (id)indexPathsAfterShadowUpdates:(id)a3 allowAppendingInsert:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates");
  if (!v6 || !v7)
  {
    v23 = v6;
    goto LABEL_18;
  }
  -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v22 = v6;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v8, "finalIndexPathForInitialIndexPath:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v4 && !v14)
      {
        -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "initialSnapshot");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "indexPathIsSectionAppendingInsert:", v13);

        if (!v18)
          continue;
        -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "finalSnapshot");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "indexPathForAppendingInsertInSection:", objc_msgSend(v13, "section"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v15)
      {
        objc_msgSend(v23, "addObject:", v15);

      }
    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v10);
LABEL_16:

  v6 = v22;
LABEL_18:

  return v23;
}

- (id)indexPathBeforeShadowUpdates:(id)a3 startingBeforeUpdate:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v9 = (void *)v7[11];
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v8, "initialIndexPathForIndexPath:beforeUpdateWithIdentifier:", v6, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v6;
  }

  return v11;
}

- (id)indexPathAfterShadowUpdates:(id)a3 startingAtUpdate:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    -[_UITableViewShadowUpdatesController updateMap](self, "updateMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v9 = (void *)v7[11];
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v8, "finalIndexPathForIndexPath:startingAtUpdateWithIdentifier:", v6, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v6;
  }

  return v11;
}

- (void)setShadowUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_shadowUpdates, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (_UIDataSourceSnapshotter)initialSnapshot
{
  return self->_initialSnapshot;
}

- (void)setInitialSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_initialSnapshot, a3);
}

- (void)setUpdateMap:(id)a3
{
  objc_storeStrong((id *)&self->_updateMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateMap, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_shadowUpdates, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  v4 = a3;
  if (-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    -[_UITableViewShadowUpdatesController dataSourceAfterShadowUpdates](self, "dataSourceAfterShadowUpdates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfSections");
  }
  else
  {
    objc_msgSend(v4, "_dataSourceActual");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfSectionsInTableView:", v4);
  }
  v7 = v6;

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v6 = a3;
  if (-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    -[_UITableViewShadowUpdatesController dataSourceAfterShadowUpdates](self, "dataSourceAfterShadowUpdates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfItemsInSection:", a4);
  }
  else
  {
    objc_msgSend(v6, "_dataSourceActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "tableView:numberOfRowsInSection:", v6, a4);
  }
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "_dataSourceActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tableView:cellForRowAtIndexPath:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "_cellForShadowRowAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_dataSourceActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:titleForHeaderInSection:", v6, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_dataSourceActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:titleForFooterInSection:", v6, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_dataSourceActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tableView:canEditRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_dataSourceActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tableView:canMoveRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "_dataSourceActual");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIndexTitlesForTableView:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_tableView:(id)a3 sectionIndexTitlesTrimmedToCount:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(v5, "_dataSourceActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_tableView:sectionIndexTitlesTrimmedToCount:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_dataSourceActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "tableView:sectionForSectionIndexTitle:atIndex:", v9, v8, a5);

  return -[_UITableViewShadowUpdatesController sectionAfterShadowUpdates:](self, "sectionAfterShadowUpdates:", v11);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v10, "_dataSourceActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tableView:commitEditingStyle:forRowAtIndexPath:", v10, a4, v8);

  }
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10)
  {
    objc_msgSend(v12, "_dataSourceActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView:moveRowAtIndexPath:toIndexPath:", v12, v9, v10);

  }
}

- (id)tableView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "_dataSourceActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableView:indexPathForSectionIndexTitle:atIndex:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITableViewShadowUpdatesController indexPathAfterShadowUpdates:](self, "indexPathAfterShadowUpdates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)tableView:(id)a3 detailTextForHeaderInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_dataSourceActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:detailTextForHeaderInSection:", v6, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)modelIdentifierForElementAtIndexPath:(id)a3 inView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UITableViewShadowUpdatesController tableView](self, "tableView");
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
  -[_UITableViewShadowUpdatesController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dataSourceActual");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForElementWithModelIdentifier:inView:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITableViewShadowUpdatesController indexPathAfterShadowUpdates:](self, "indexPathAfterShadowUpdates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v6 = a3;
  v7 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "_delegateActual");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tableView:heightForRowAtIndexPath:", v6, v8);
    v11 = v10;

  }
  else
  {
    objc_msgSend(v6, "_heightForShadowRowAtIndexPath:", v7);
    v11 = v12;
  }

  return v11;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:estimatedHeightForRowAtIndexPath:", v6, v7);
    v10 = v9;

  }
  else
  {
    v10 = -1.0;
  }

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v11, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:willDisplayCell:forRowAtIndexPath:", v11, v8, v9);

  }
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a5);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v9;
    objc_msgSend(v12, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView:willDisplayHeaderView:forSection:", v12, v8, v10);

  }
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a5);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v9;
    objc_msgSend(v12, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView:willDisplayFooterView:forSection:", v12, v8, v10);

  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v11, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:didEndDisplayingCell:forRowAtIndexPath:", v11, v8, v9);

  }
}

- (void)tableView:(id)a3 didEndDisplayingHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a5);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v9;
    objc_msgSend(v12, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView:didEndDisplayingHeaderView:forSection:", v12, v8, v10);

  }
}

- (void)tableView:(id)a3 didEndDisplayingFooterView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a5);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v9;
    objc_msgSend(v12, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView:didEndDisplayingFooterView:forSection:", v12, v8, v10);

  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  double v8;
  int64_t v9;
  void *v10;
  double v11;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:heightForHeaderInSection:", v6, v9);
    v8 = v11;

  }
  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  double v8;
  int64_t v9;
  void *v10;
  double v11;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:heightForFooterInSection:", v6, v9);
    v8 = v11;

  }
  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  double v8;
  int64_t v9;
  void *v10;
  double v11;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:estimatedHeightForHeaderInSection:", v6, v9);
    v8 = v11;

  }
  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  double v8;
  int64_t v9;
  void *v10;
  double v11;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:estimatedHeightForFooterInSection:", v6, v9);
    v8 = v11;

  }
  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:viewForHeaderInSection:", v6, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:viewForFooterInSection:", v6, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (int64_t)tableView:(id)a3 accessoryTypeForRowWithIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tableView:accessoryTypeForRowWithIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:accessoryButtonTappedForRowWithIndexPath:", v8, v6);

  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tableView:shouldHighlightRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:didHighlightRowAtIndexPath:", v8, v6);

  }
}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:didUnhighlightRowAtIndexPath:", v8, v6);

  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:willSelectRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:willDeselectRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:didSelectRowAtIndexPath:", v8, v6);

  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:didDeselectRowAtIndexPath:", v8, v6);

  }
}

- (BOOL)tableView:(id)a3 canPerformPrimaryActionForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tableView:canPerformPrimaryActionForRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 performPrimaryActionForRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:performPrimaryActionForRowAtIndexPath:", v8, v6);

  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tableView:editingStyleForRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:titleForDeleteConfirmationButtonForRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 editActionsForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:editActionsForRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tableView:shouldIndentWhileEditingRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:willBeginEditingRowAtIndexPath:", v8, v6);

  }
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:didEndEditingRowAtIndexPath:", v8, v6);

  }
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v12)
  {
    objc_msgSend(v8, "_delegateActual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:", v8, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITableViewShadowUpdatesController indexPathAfterShadowUpdates:](self, "indexPathAfterShadowUpdates:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v9;
    v18 = v17;

  }
  else
  {
    v18 = v9;
  }

  return v18;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tableView:indentationLevelForRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tableView:shouldShowMenuForRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;

  v10 = a3;
  v11 = a6;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v10, "_delegateActual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "tableView:canPerformAction:forRowAtIndexPath:withSender:", v10, a4, v12, v11);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a6;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v13, "_delegateActual");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tableView:performAction:forRowAtIndexPath:withSender:", v13, a4, v11, v10);

  }
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tableView:canFocusRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSObject *v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "previouslyFocusedIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nextFocusedIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "previouslyFocusedIndexPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12 || v9)
  {
    objc_msgSend(v6, "nextFocusedIndexPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14 || v11)
      goto LABEL_11;
  }
  else
  {

  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v20, OS_LOG_TYPE_FAULT, "Support for shadow updates on tvOS with the focus system is not implemented yet.", buf, 2u);
    }

  }
  else
  {
    v15 = tableView_shouldUpdateFocusInContext____s_category;
    if (!tableView_shouldUpdateFocusInContext____s_category)
    {
      v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&tableView_shouldUpdateFocusInContext____s_category);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Support for shadow updates on tvOS with the focus system is not implemented yet.", v21, 2u);
    }
  }
LABEL_11:
  objc_msgSend(v7, "_delegateActual");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "tableView:shouldUpdateFocusInContext:", v7, v6);

  return v18;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint8_t v22[16];
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "previouslyFocusedIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "nextFocusedIndexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "previouslyFocusedIndexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || v12)
  {
    objc_msgSend(v8, "nextFocusedIndexPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17 || v14)
      goto LABEL_11;
  }
  else
  {

  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "Support for shadow updates on tvOS with the focus system is not implemented yet.", buf, 2u);
    }

  }
  else
  {
    v18 = tableView_didUpdateFocusInContext_withAnimationCoordinator____s_category;
    if (!tableView_didUpdateFocusInContext_withAnimationCoordinator____s_category)
    {
      v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&tableView_didUpdateFocusInContext_withAnimationCoordinator____s_category);
    }
    v19 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Support for shadow updates on tvOS with the focus system is not implemented yet.", v22, 2u);
    }
  }
LABEL_11:
  objc_msgSend(v10, "_delegateActual");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "tableView:didUpdateFocusInContext:withAnimationCoordinator:", v10, v8, v9);

}

- (BOOL)tableView:(id)a3 selectionFollowsFocusForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tableView:selectionFollowsFocusForRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = objc_msgSend(v6, "selectionFollowsFocus");
  }

  return v9;
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "_delegateActual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForPreferredFocusedViewInTableView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITableViewShadowUpdatesController indexPathAfterShadowUpdates:](self, "indexPathAfterShadowUpdates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  char v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "tableView:wantsHeaderForSection:", v6, v9);

  }
  return v8;
}

- (double)tableViewSpacingForExtraSeparators:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  objc_msgSend(v3, "_delegateActual");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableViewSpacingForExtraSeparators:", v3);
  v6 = v5;

  return v6;
}

- (CGPoint)tableView:(id)a3 newContentOffsetAfterUpdate:(CGPoint)a4 context:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "_delegateActual");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableView:newContentOffsetAfterUpdate:context:", v9, v8, x, y);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)tableView:(id)a3 didUpdateTextFieldForRowAtIndexPath:(id)a4 withValue:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v11, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:didUpdateTextFieldForRowAtIndexPath:withValue:", v11, v9, v8);

  }
}

- (double)marginForTableView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  objc_msgSend(v3, "_delegateActual");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marginForTableView:", v3);
  v6 = v5;

  return v6;
}

- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 4;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "tableView:titleAlignmentForHeaderInSection:", v6, v9);

  }
  return v8;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 4;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "tableView:titleAlignmentForFooterInSection:", v6, v9);

  }
  return v8;
}

- (BOOL)tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;

  v8 = a3;
  v9 = a5;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "tableView:shouldSpringLoadRowAtIndexPath:withContext:", v8, v10, v9);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;

  v8 = a3;
  v9 = a5;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_tableView:shouldSpringLoadRowAtIndexPath:withContext:", v8, v10, v9);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)tableView:(id)a3 maxTitleWidthForHeaderInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  double v8;
  int64_t v9;
  void *v10;
  double v11;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:maxTitleWidthForHeaderInSection:", v6, v9);
    v8 = v11;

  }
  return v8;
}

- (double)tableView:(id)a3 maxTitleWidthForFooterInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  double v8;
  int64_t v9;
  void *v10;
  double v11;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  v8 = 0.0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tableView:maxTitleWidthForFooterInSection:", v6, v9);
    v8 = v11;

  }
  return v8;
}

- (CGRect)tableView:(id)a3 frameForSectionIndexGivenProposedFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(v8, "_delegateActual");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tableView:frameForSectionIndexGivenProposedFrame:", v8, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)tableViewDidFinishReload:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "_delegateActual");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableViewDidFinishReload:", v3);

}

- (double)heightForHeaderInTableView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  objc_msgSend(v3, "_delegateActual");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightForHeaderInTableView:", v3);
  v6 = v5;

  return v6;
}

- (double)heightForFooterInTableView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  objc_msgSend(v3, "_delegateActual");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightForFooterInTableView:", v3);
  v6 = v5;

  return v6;
}

- (id)viewForHeaderInTableView:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "_delegateActual");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForHeaderInTableView:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)viewForFooterInTableView:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "_delegateActual");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForFooterInTableView:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)tableView:(id)a3 calloutTargetRectForCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v8 = a3;
  v9 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView:calloutTargetRectForCell:forRowAtIndexPath:", v8, v9, v10);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

  }
  else
  {
    v13 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:leadingSwipeActionsConfigurationForRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 leadingSwipeActionsForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:leadingSwipeActionsForRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 trailingSwipeActionsForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:trailingSwipeActionsForRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 willBeginReorderingRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:willBeginReorderingRowAtIndexPath:", v8, v6);

  }
}

- (void)tableView:(id)a3 didEndReorderingRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:didEndReorderingRowAtIndexPath:", v8, v6);

  }
}

- (void)tableView:(id)a3 didCancelReorderingRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:didCancelReorderingRowAtIndexPath:", v8, v6);

  }
}

- (id)tableView:(id)a3 backgroundColorForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:backgroundColorForDeleteConfirmationButtonForRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 backgroundColorForSwipeAccessoryButtonForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:backgroundColorForSwipeAccessoryButtonForRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForSwipeAccessoryButtonForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:titleForSwipeAccessoryButtonForRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 swipeAccessoryButtonPushedForRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:swipeAccessoryButtonPushedForRowAtIndexPath:", v8, v6);

  }
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  char v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "tableView:shouldDrawTopSeparatorForSection:", v6, v9);

  }
  return v8;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  char v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "tableView:shouldDrawBottomSeparatorForSection:", v6, v9);

  }
  return v8;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthTopSeparatorForSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  char v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "tableView:shouldHaveFullLengthTopSeparatorForSection:", v6, v9);

  }
  return v8;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  char v8;
  int64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[_UITableViewShadowUpdatesController sectionBeforeShadowUpdates:](self, "sectionBeforeShadowUpdates:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v6, "_delegateActual");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "tableView:shouldHaveFullLengthBottomSeparatorForSection:", v6, v9);

  }
  return v8;
}

- (void)tableView:(id)a3 willBeginSwipingRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:willBeginSwipingRowAtIndexPath:", v8, v6);

  }
}

- (void)tableView:(id)a3 didEndSwipingRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:didEndSwipingRowAtIndexPath:", v8, v6);

  }
}

- (BOOL)_tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_delegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_tableView:canFocusRowAtIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didFocusRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:didFocusRowAtIndexPath:", v8, v6);

  }
}

- (void)tableView:(id)a3 didUnfocusRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "_delegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:didUnfocusRowAtIndexPath:", v8, v6);

  }
}

- (BOOL)tableView:(id)a3 shouldUpdateFocusFromRowAtIndexPath:(id)a4 toView:(id)a5 heading:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;

  v10 = a3;
  v11 = a5;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v10, "_delegateActual");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "tableView:shouldUpdateFocusFromRowAtIndexPath:toView:heading:", v10, v12, v11, a6);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)indexPathForPreferredFocusedItemForTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "_delegateActual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForPreferredFocusedItemForTableView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITableViewShadowUpdatesController indexPathAfterShadowUpdates:](self, "indexPathAfterShadowUpdates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "_delegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView:contextMenuConfigurationForRowAtIndexPath:point:", v9, v10, x, y);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_delegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:previewForHighlightingContextMenuWithConfiguration:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_delegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:previewForDismissingContextMenuWithConfiguration:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)tableView:(id)a3 willCommitMenuWithAnimator:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_delegateActual");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:willCommitMenuWithAnimator:", v6, v5);

}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
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
  objc_msgSend(v10, "tableView:willPerformPreviewActionForMenuWithConfiguration:animator:", v9, v8, v7);

}

- (void)tableView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
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
  objc_msgSend(v10, "tableView:willDisplayContextMenuWithConfiguration:animator:", v9, v8, v7);

}

- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
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
  objc_msgSend(v10, "tableView:willEndContextMenuInteractionWithConfiguration:animator:", v9, v8, v7);

}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathsBeforeShadowUpdates:](self, "indexPathsBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v8, "_prefetchDataSourceActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:prefetchRowsAtIndexPaths:", v8, v6);

  }
}

- (void)tableView:(id)a3 cancelPrefetchingForRowsAtIndexPaths:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UITableViewShadowUpdatesController indexPathsBeforeShadowUpdates:](self, "indexPathsBeforeShadowUpdates:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v8, "_prefetchDataSourceActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:cancelPrefetchingForRowsAtIndexPaths:", v8, v6);

  }
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "_dragDelegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView:itemsForBeginningDragSession:atIndexPath:", v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  y = a6.y;
  x = a6.x;
  v11 = a3;
  v12 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v11, "_dragDelegateActual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tableView:itemsForAddingToDragSession:atIndexPath:point:", v11, v12, v13, x, y);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_dragDelegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:dragPreviewParametersForRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:dragSessionWillBegin:", v6, v5);

}

- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:dragSessionDidEnd:", v6, v5);

}

- (BOOL)tableView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "tableView:dragSessionAllowsMoveOperation:", v6, v5);

  return v8;
}

- (BOOL)tableView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "tableView:dragSessionIsRestrictedToDraggingApplication:", v6, v5);

  return v8;
}

- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;

  v8 = a3;
  v9 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "_dragDelegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_tableView:dataOwnerForDragSession:atIndexPath:", v8, v9, v10);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_tableView:(id)a3 dragSessionSupportsSystemDrag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_tableView:dragSessionSupportsSystemDrag:", v6, v5);

  return v8;
}

- (id)_tableView:(id)a3 dragSessionPropertiesForSession:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_tableView:dragSessionPropertiesForSession:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v9 = a4;
  v6 = a3;
  if (-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __101___UITableViewShadowUpdatesController_UITableViewDropDelegate__tableView_performDropWithCoordinator___block_invoke;
    v11[3] = &unk_1E16BDC20;
    v11[4] = self;
    objc_msgSend(v9, "_translateDestinationIndexPath:", v11);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __101___UITableViewShadowUpdatesController_UITableViewDropDelegate__tableView_performDropWithCoordinator___block_invoke_2;
    v10[3] = &unk_1E16BDC20;
    v10[4] = self;
    objc_msgSend(v9, "_translateSourceIndexPathsOfDropItems:", v10);
  }
  objc_msgSend(v6, "_dropDelegateActual");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView:performDropWithCoordinator:", v6, v9);

}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dropDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "tableView:canHandleDropSession:", v6, v5);

  return v8;
}

- (void)tableView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dropDelegateActual");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:dropSessionDidEnter:", v6, v5);

}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dropDelegateActual");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableView:dropSessionDidUpdate:withDestinationIndexPath:", v9, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)tableView:(id)a3 dropSessionDidExit:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dropDelegateActual");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:dropSessionDidExit:", v6, v5);

}

- (void)tableView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dropDelegateActual");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:dropSessionDidEnd:", v6, v5);

}

- (id)tableView:(id)a3 dropPreviewParametersForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_dropDelegateActual");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:dropPreviewParametersForRowAtIndexPath:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;

  v8 = a4;
  v9 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dropDelegateActual");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_tableView:dataOwnerForDropSession:withDestinationIndexPath:", v9, v8, v10);

  return v12;
}

- (id)_tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "_dragSourceDelegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_tableView:itemsForBeginningDragSession:atIndexPath:", v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)_tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  y = a6.y;
  x = a6.x;
  v11 = a3;
  v12 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v11, "_dragSourceDelegateActual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_tableView:itemsForAddingToDragSession:atIndexPath:point:", v11, v12, v13, x, y);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (void)_tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragSourceDelegateActual");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_tableView:dragSessionWillBegin:", v6, v5);

}

- (void)_tableView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragSourceDelegateActual");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_tableView:dragSessionDidEnd:", v6, v5);

}

- (int64_t)__tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;

  v8 = a3;
  v9 = a4;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "_dragSourceDelegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "__tableView:dataOwnerForDragSession:atIndexPath:", v8, v9, v10);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v9 = a4;
  v6 = a3;
  if (-[_UITableViewShadowUpdatesController hasShadowUpdates](self, "hasShadowUpdates"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __113___UITableViewShadowUpdatesController_UITableViewDragDestinationDelegate___tableView_performDropWithCoordinator___block_invoke;
    v11[3] = &unk_1E16BDC20;
    v11[4] = self;
    objc_msgSend(v9, "_translateDestinationIndexPath:", v11);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __113___UITableViewShadowUpdatesController_UITableViewDragDestinationDelegate___tableView_performDropWithCoordinator___block_invoke_2;
    v10[3] = &unk_1E16BDC20;
    v10[4] = self;
    objc_msgSend(v9, "_translateSourceIndexPathsOfDropItems:", v10);
  }
  objc_msgSend(v6, "_dragDestinationDelegateActual");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_tableView:performDropWithCoordinator:", v6, v9);

}

- (BOOL)_tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragDestinationDelegateActual");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_tableView:canHandleDropSession:", v6, v5);

  return v8;
}

- (void)_tableView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragDestinationDelegateActual");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_tableView:dropSessionDidEnter:", v6, v5);

}

- (id)_tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dragDestinationDelegateActual");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_tableView:dropSessionDidUpdate:withDestinationIndexPath:", v9, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_tableView:(id)a3 dropSessionDidExit:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragDestinationDelegateActual");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_tableView:dropSessionDidExit:", v6, v5);

}

- (void)_tableView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_dragDestinationDelegateActual");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_tableView:dropSessionDidEnd:", v6, v5);

}

- (id)_tableView:(id)a3 targetIndexPathForProposedIndexPath:(id)a4 currentIndexPath:(id)a5 dropSession:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_dragDestinationDelegateActual");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_tableView:targetIndexPathForProposedIndexPath:currentIndexPath:dropSession:", v10, v13, v14, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)__tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;

  v8 = a4;
  v9 = a3;
  -[_UITableViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dragDestinationDelegateActual");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "__tableView:dataOwnerForDropSession:withDestinationIndexPath:", v9, v8, v10);

  return v12;
}

@end
