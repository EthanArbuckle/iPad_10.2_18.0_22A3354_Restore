@implementation _UICollectionViewDragSourceControllerDragState

- (id)draggingDataSourceIndexPaths
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "dataSourceIndexPathsOfDraggingItems");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)dragFromDataSourceIndexPath
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "dataSourceIndexPathsOfDraggingItems");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)dataSourceIndexPathForDragItem:(void *)a3 forCollectionView:
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (a1)
  {
    objc_msgSend(a2, "_privateLocalContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "collectionView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v5)
      {
        objc_msgSend(v6, "indexPath");
        a1 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a1 = 0;
      }

    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (void)rebaseForUpdates:(void *)a1
{
  void (**v3)(id, _QWORD);
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _UICollectionViewSourcePrivateLocalObject *v23;
  void *v24;
  _UICollectionViewSourcePrivateLocalObject *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(a1, "dataSourceIndexPathsOfDraggingItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v5);
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v7);
    }

    objc_msgSend(a1, "dataSourceIndexPathsOfDraggingItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

    objc_msgSend(a1, "dataSourceIndexPathsOfDraggingItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v4;
    objc_msgSend(v4, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v13);

    objc_msgSend(a1, "dragItemsWithRebasableIndexPaths");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "compact");

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(a1, "dragItemsWithRebasableIndexPaths");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v19, "_privateLocalContext");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v20, "indexPath");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(id, void *))v3)[2](v3, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = [_UICollectionViewSourcePrivateLocalObject alloc];
            objc_msgSend(v20, "collectionView");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[_UICollectionViewSourcePrivateLocalObject initWithIndexPath:collectionView:](v23, "initWithIndexPath:collectionView:", v22, v24);
            objc_msgSend(v19, "_setPrivateLocalContext:", v25);

          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v16);
    }

  }
}

- (_UICollectionViewDragSourceControllerDragState)init
{
  _UICollectionViewDragSourceControllerDragState *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *dataSourceIndexPathsOfDraggingItems;
  uint64_t v5;
  NSPointerArray *dragItemsWithRebasableIndexPaths;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewDragSourceControllerDragState;
  v2 = -[_UICollectionViewDragSourceControllerDragState init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    dataSourceIndexPathsOfDraggingItems = v2->_dataSourceIndexPathsOfDraggingItems;
    v2->_dataSourceIndexPathsOfDraggingItems = v3;

    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v5 = objc_claimAutoreleasedReturnValue();
    dragItemsWithRebasableIndexPaths = v2->_dragItemsWithRebasableIndexPaths;
    v2->_dragItemsWithRebasableIndexPaths = (NSPointerArray *)v5;

  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragSourceControllerDragState dragFromDataSourceIndexPath](self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UICVIndexPathDescription(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragSourceControllerDragState dataSourceIndexPathsOfDraggingItems](self, "dataSourceIndexPathsOfDraggingItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UICVIndexPathsDescription(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p dragFrom=%@ draggingItems=%@>"), v5, self, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSMutableOrderedSet)dataSourceIndexPathsOfDraggingItems
{
  return self->_dataSourceIndexPathsOfDraggingItems;
}

- (void)setDataSourceIndexPathsOfDraggingItems:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceIndexPathsOfDraggingItems, a3);
}

- (NSPointerArray)dragItemsWithRebasableIndexPaths
{
  return self->_dragItemsWithRebasableIndexPaths;
}

- (void)setDragItemsWithRebasableIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_dragItemsWithRebasableIndexPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItemsWithRebasableIndexPaths, 0);
  objc_storeStrong((id *)&self->_dataSourceIndexPathsOfDraggingItems, 0);
}

@end
