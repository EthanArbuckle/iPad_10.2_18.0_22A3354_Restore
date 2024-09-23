@implementation NSDiffableDataSourceSectionSnapshot

- (void)appendItems:(NSArray *)items intoParentItem:(id)parentItem
{
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _NSDiffableDataSourceSectionSnapshotState *v20;
  _NSDiffableDataSourceSectionSnapshotState *state;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSArray *v33;

  v33 = items;
  v7 = parentItem;
  if (-[NSArray count](v33, "count"))
  {
    if (v7)
    {
      -[NSDiffableDataSourceSectionSnapshot childrenOfParent:](self, "childrenOfParent:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "lastObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDiffableDataSourceSectionSnapshot insertItems:afterItem:](self, "insertItems:afterItem:", v33, v9);
      }
      else
      {
        v10 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v7);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 97, CFSTR("Parent item identifier does not exist in section snapshot: %@"), v7);

        }
        -[_NSDiffableDataSourceSectionSnapshotState snapshotterMutableCopy](self->_state, "snapshotterMutableCopy");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "appendChildItemsWithCount:toParentIndex:", -[NSArray count](v33, "count"), v10);
        v13 = v12;
        -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");

        v16 = objc_msgSend(v15, "count");
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "insertObjects:atIndexes:", v33, v17);

        v18 = objc_msgSend(v15, "count") - v16;
        if (v18 != -[NSArray count](v33, "count"))
        {
          -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v19, v33);

        }
        v20 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:]([_NSDiffableDataSourceSectionSnapshotState alloc], "initWithSnapshotter:identifiers:", v9, v15);
        state = self->_state;
        self->_state = v20;

      }
      -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v23 != v25)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");
        -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");
        -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 117, CFSTR("NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@"), v28, v30, v31);

      }
    }
    else
    {
      -[NSDiffableDataSourceSectionSnapshot appendItems:](self, "appendItems:", v33);
    }
  }

}

- (NSDiffableDataSourceSectionSnapshot)initWithState:(id)a3
{
  id v5;
  NSDiffableDataSourceSectionSnapshot *v6;
  NSDiffableDataSourceSectionSnapshot *v7;
  NSMutableArray *v8;
  NSMutableArray *expandedItemsUpdates;
  NSMutableArray *v10;
  NSMutableArray *collapsedItemsUpdates;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSDiffableDataSourceSectionSnapshot;
  v6 = -[NSDiffableDataSourceSectionSnapshot init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_state, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    expandedItemsUpdates = v7->_expandedItemsUpdates;
    v7->_expandedItemsUpdates = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    collapsedItemsUpdates = v7->_collapsedItemsUpdates;
    v7->_collapsedItemsUpdates = v10;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithState:", self->_state);
}

- (NSDiffableDataSourceSectionSnapshot)init
{
  _NSDiffableDataSourceSectionSnapshotState *v3;
  NSDiffableDataSourceSectionSnapshot *v4;

  v3 = objc_alloc_init(_NSDiffableDataSourceSectionSnapshotState);
  v4 = -[NSDiffableDataSourceSectionSnapshot initWithState:](self, "initWithState:", v3);

  return v4;
}

- (NSArray)visibleItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)_prepareForApplyToDataSource
{
  -[_NSDiffableDataSourceSectionSnapshotState willBecomeWiredToDataSource](self->_state, "willBecomeWiredToDataSource");
}

- (void)appendItems:(NSArray *)items
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _NSDiffableDataSourceSectionSnapshotState *v11;
  _NSDiffableDataSourceSectionSnapshotState *state;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSArray *v23;

  v23 = items;
  if (-[NSArray count](v23, "count"))
  {
    -[_NSDiffableDataSourceSectionSnapshotState snapshotterMutableCopy](self->_state, "snapshotterMutableCopy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendChildItemsWithCount:", -[NSArray count](v23, "count"));
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v8 = objc_msgSend(v7, "count");
    objc_msgSend(v7, "addObjectsFromArray:", v23);
    v9 = objc_msgSend(v7, "count") - v8;
    if (v9 != -[NSArray count](v23, "count"))
    {
      -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v10, v23);

    }
    v11 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:]([_NSDiffableDataSourceSectionSnapshotState alloc], "initWithSnapshotter:identifiers:", v5, v7);
    state = self->_state;
    self->_state = v11;

    -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v14 != v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 76, CFSTR("NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@"), v19, v21, v22);

    }
  }

}

- (NSArray)items
{
  void *v2;
  void *v3;

  -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)containsItem:(id)item
{
  return -[_NSDiffableDataSourceSectionSnapshotState containsIdentifier:](self->_state, "containsIdentifier:", item);
}

- (NSInteger)levelOfItem:(id)item
{
  id v5;
  int64_t v6;
  void *v7;
  NSInteger v8;
  void *v10;

  v5 = item;
  v6 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 323, CFSTR("Item identifier does not exist in section snapshot: %@"), v5);

  }
  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "levelForIndex:", v6);

  return v8;
}

- (id)parentOfChildItem:(id)childItem
{
  id v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = childItem;
  v6 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 451, CFSTR("Child item identifier does not exist in section snapshot: %@"), v5);

  }
  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "parentForChildAtIndex:", v6);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)isExpanded:(id)item
{
  id v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v10;

  v5 = item;
  v6 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 308, CFSTR("Item identifier does not exist in section snapshot: %@"), v5);

  }
  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexIsExpanded:", v6);

  return v8;
}

- (id)childrenOfParent:(id)a3 recursive:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v4 = a4;
  v7 = a3;
  v8 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 340, CFSTR("Parent item identifier does not exist in section snapshot: %@"), v7);

  }
  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "childrenForParentAtIndex:recursive:", v8, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectsAtIndexes:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)childrenOfParent:(id)a3
{
  return -[NSDiffableDataSourceSectionSnapshot childrenOfParent:recursive:](self, "childrenOfParent:recursive:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapsedItemsUpdates, 0);
  objc_storeStrong((id *)&self->_expandedItemsUpdates, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

- (void)deleteItems:(NSArray *)items
{
  -[NSDiffableDataSourceSectionSnapshot deleteItems:orphanDisposition:](self, "deleteItems:orphanDisposition:", items, 0);
}

- (void)setChildrenWithSnapshot:(id)a3 forParent:(id)a4
{
  -[NSDiffableDataSourceSectionSnapshot replaceChildrenOfParentItem:withSnapshot:](self, "replaceChildrenOfParentItem:withSnapshot:", a4, a3);
}

- (void)expandItems:(NSArray *)items
{
  void *v4;
  void *v5;
  _NSDiffableDataSourceSectionSnapshotState *v6;
  void *v7;
  _NSDiffableDataSourceSectionSnapshotState *v8;
  _NSDiffableDataSourceSectionSnapshotState *state;
  NSArray *v10;

  v10 = items;
  if (-[NSArray count](v10, "count"))
  {
    -[NSMutableArray addObjectsFromArray:](self->_expandedItemsUpdates, "addObjectsFromArray:", v10);
    -[NSDiffableDataSourceSectionSnapshot _indexesOfItems:ignoringItemsNotFound:](self, "_indexesOfItems:ignoringItemsNotFound:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NSDiffableDataSourceSectionSnapshotState snapshotterMutableCopy](self->_state, "snapshotterMutableCopy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expandIndexes:", v4);
    v6 = [_NSDiffableDataSourceSectionSnapshotState alloc];
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:](v6, "initWithSnapshotter:identifiers:", v5, v7);
    state = self->_state;
    self->_state = v8;

  }
}

- (id)_indexesOfItems:(id)a3 ignoringItemsNotFound:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  int64_t v14;
  void *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v13);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!a4)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 572, CFSTR("Failed to find index of item %@"), v13);

          }
        }
        else
        {
          objc_msgSend(v7, "addIndex:", v14);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)replaceChildrenOfParentItem:(id)parentItem withSnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot
{
  NSDiffableDataSourceSectionSnapshot *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _NSDiffableDataSourceSectionSnapshotState *v19;
  _NSDiffableDataSourceSectionSnapshotState *state;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = parentItem;
  v7 = snapshot;
  if (v24)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentItem != nil"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot != nil"));

LABEL_3:
  -[_NSDiffableDataSourceSectionSnapshotState snapshotterMutableCopy](self->_state, "snapshotterMutableCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v24);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 266, CFSTR("Parent item identifier does not exist in section snapshot: %@"), v24);

  }
  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "childrenForParentAtIndex:recursive:", v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v10, "removeObjectsAtIndexes:", v13);
  -[NSDiffableDataSourceSectionSnapshot items](v7, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11 + 1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDiffableDataSourceSectionSnapshot items](v7, "items");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertObjects:atIndexes:", v17, v16);

  }
  -[NSDiffableDataSourceSectionSnapshot snapshotter](v7, "snapshotter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceChildItemsFromSnapshotter:forParentIndex:", v18, v11);

  v19 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:]([_NSDiffableDataSourceSectionSnapshotState alloc], "initWithSnapshotter:identifiers:", v8, v10);
  state = self->_state;
  self->_state = v19;

}

- (id)snapshotter
{
  return -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
}

- (void)deleteItems:(id)a3 orphanDisposition:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _NSDiffableDataSourceSectionSnapshotState *v13;
  _NSDiffableDataSourceSectionSnapshotState *state;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v16 = a3;
  if (objc_msgSend(v16, "count"))
  {
    if ((unint64_t)a4 >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 200, CFSTR("Invalid _NSDiffableDataSourceSectionSnapshotOrphanDisposition: %ld"), a4);

    }
    -[_NSDiffableDataSourceSectionSnapshotState snapshotterMutableCopy](self->_state, "snapshotterMutableCopy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    -[NSDiffableDataSourceSectionSnapshot _indexesOfItems:](self, "_indexesOfItems:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    v12 = objc_msgSend(v7, "isFlat");
    if (!a4 && (v12 & 1) == 0)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __69__NSDiffableDataSourceSectionSnapshot_deleteItems_orphanDisposition___block_invoke;
      v17[3] = &unk_1E16B2978;
      v18 = v7;
      v19 = v11;
      objc_msgSend(v10, "enumerateIndexesUsingBlock:", v17);

    }
    objc_msgSend(v7, "deleteIndexes:orphanDisposition:", v11, a4 != 0);
    objc_msgSend(v9, "removeObjectsAtIndexes:", v11);
    v13 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:]([_NSDiffableDataSourceSectionSnapshotState alloc], "initWithSnapshotter:identifiers:", v7, v9);
    state = self->_state;
    self->_state = v13;

  }
}

- (NSDiffableDataSourceSectionSnapshot)initWithSnapshot:(id)a3
{
  void *v4;
  NSDiffableDataSourceSectionSnapshot *v5;

  objc_msgSend(a3, "_state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDiffableDataSourceSectionSnapshot initWithState:](self, "initWithState:", v4);

  return v5;
}

- (void)insertItems:(NSArray *)items beforeItem:(id)beforeIdentifier
{
  id v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _NSDiffableDataSourceSectionSnapshotState *v17;
  _NSDiffableDataSourceSectionSnapshotState *state;
  void *v19;
  void *v20;
  NSArray *v21;

  v21 = items;
  v7 = beforeIdentifier;
  if (-[NSArray count](v21, "count"))
  {
    v8 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v7);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 131, CFSTR("Item identifier to insert before does not exist in section snapshot: %@"), v7);

    }
    v9 = -[NSArray count](v21, "count");
    -[_NSDiffableDataSourceSectionSnapshotState snapshotterMutableCopy](self->_state, "snapshotterMutableCopy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertCount:beforeIndex:", v9, v8);
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "count");
    objc_msgSend(v12, "insertObjects:atIndexes:", v21, v13);
    if (objc_msgSend(v12, "count") - v14 != v9)
    {
      -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v15, v21);

    }
    v16 = objc_msgSend(v10, "count");
    if (v16 != objc_msgSend(v12, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 148, CFSTR("NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@"), objc_msgSend(v10, "count"), objc_msgSend(v12, "count"), v12);

    }
    v17 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:]([_NSDiffableDataSourceSectionSnapshotState alloc], "initWithSnapshotter:identifiers:", v10, v12);
    state = self->_state;
    self->_state = v17;

  }
}

- (void)insertItems:(NSArray *)items afterItem:(id)afterIdentifier
{
  -[NSDiffableDataSourceSectionSnapshot insertItems:afterItem:insertionMode:](self, "insertItems:afterItem:insertionMode:", items, afterIdentifier, 0);
}

- (void)insertItems:(id)a3 afterItem:(id)a4 insertionMode:(int64_t)a5
{
  id v9;
  _BOOL8 v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _NSDiffableDataSourceSectionSnapshotState *v21;
  _NSDiffableDataSourceSectionSnapshotState *state;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v9 = a4;
  if (objc_msgSend(v26, "count"))
  {
    if ((unint64_t)a5 >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 163, CFSTR("Invalid _NSDiffableDataSourceSectionSnapshotInsertionMode: %ld"), a5);

    }
    v10 = a5 != 0;
    v11 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v9);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 167, CFSTR("Item identifier to insert after does not exist in section snapshot: %@"), v9);

    }
    v12 = objc_msgSend(v26, "count");
    -[_NSDiffableDataSourceSectionSnapshotState snapshotterMutableCopy](self->_state, "snapshotterMutableCopy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "insertCount:afterIndex:insertionMode:", v12, v11, v10);
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v14, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "count");
    objc_msgSend(v16, "insertObjects:atIndexes:", v26, v17);
    if (objc_msgSend(v16, "count") - v18 != v12)
    {
      -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v19, v26);

    }
    v20 = objc_msgSend(v13, "count");
    if (v20 != objc_msgSend(v16, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 184, CFSTR("NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@"), objc_msgSend(v13, "count"), objc_msgSend(v16, "count"), v16);

    }
    v21 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:]([_NSDiffableDataSourceSectionSnapshotState alloc], "initWithSnapshotter:identifiers:", v13, v16);
    state = self->_state;
    self->_state = v21;

  }
}

void __69__NSDiffableDataSourceSectionSnapshot_deleteItems_orphanDisposition___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "childrenForParentAtIndex:recursive:", a2, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addIndexes:", v3);

}

- (void)deleteAllItems
{
  _NSDiffableDataSourceSectionSnapshotState *v3;
  _NSDiffableDataSourceSectionSnapshotState *state;

  v3 = objc_alloc_init(_NSDiffableDataSourceSectionSnapshotState);
  state = self->_state;
  self->_state = v3;

}

- (void)collapseItems:(NSArray *)items
{
  void *v4;
  void *v5;
  _NSDiffableDataSourceSectionSnapshotState *v6;
  void *v7;
  _NSDiffableDataSourceSectionSnapshotState *v8;
  _NSDiffableDataSourceSectionSnapshotState *state;
  NSArray *v10;

  v10 = items;
  if (-[NSArray count](v10, "count"))
  {
    -[NSMutableArray addObjectsFromArray:](self->_collapsedItemsUpdates, "addObjectsFromArray:", v10);
    -[NSDiffableDataSourceSectionSnapshot _indexesOfItems:ignoringItemsNotFound:](self, "_indexesOfItems:ignoringItemsNotFound:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NSDiffableDataSourceSectionSnapshotState snapshotterMutableCopy](self->_state, "snapshotterMutableCopy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collapseIndexes:", v4);
    v6 = [_NSDiffableDataSourceSectionSnapshotState alloc];
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:](v6, "initWithSnapshotter:identifiers:", v5, v7);
    state = self->_state;
    self->_state = v8;

  }
}

- (NSInteger)indexOfItem:(id)item
{
  return -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", item);
}

- (BOOL)isVisible:(id)item
{
  id v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v10;

  v5 = item;
  v6 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 315, CFSTR("Item identifier does not exist in section snapshot: %@"), v5);

  }
  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexIsVisible:", v6);

  return v8;
}

- (NSDiffableDataSourceSectionSnapshot)snapshotOfParentItem:(id)parentItem
{
  return (NSDiffableDataSourceSectionSnapshot *)-[NSDiffableDataSourceSectionSnapshot childSnapshotOfParent:includingParent:](self, "childSnapshotOfParent:includingParent:", parentItem, 0);
}

- (NSDiffableDataSourceSectionSnapshot)snapshotOfParentItem:(id)parentItem includingParentItem:(BOOL)includingParentItem
{
  _BOOL8 v4;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _NSDiffableDataSourceSectionSnapshotState *v18;
  NSDiffableDataSourceSectionSnapshot *v19;
  void *v21;
  void *v22;

  v4 = includingParentItem;
  v7 = parentItem;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 359, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item != nil"));

  }
  v8 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 361, CFSTR("Parent item identifier does not exist in section snapshot: %@"), v7);

  }
  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshotterRepresentingSubtreeForIndex:includingParent:", v8, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_allIndexes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v12 = (void *)MEMORY[0x1E0C99E40];
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_allIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectsAtIndexes:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "orderedSetWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_snapshotterByShiftingIndexesByCount:", -objc_msgSend(v11, "firstIndex"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:]([_NSDiffableDataSourceSectionSnapshotState alloc], "initWithSnapshotter:identifiers:", v17, v16);
    v19 = -[NSDiffableDataSourceSectionSnapshot initWithState:]([NSDiffableDataSourceSectionSnapshot alloc], "initWithState:", v18);

  }
  else
  {
    v19 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
  }

  return v19;
}

- (void)insertSnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot beforeItem:(id)item
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _NSDiffableDataSourceSectionSnapshotState *v21;
  _NSDiffableDataSourceSectionSnapshotState *state;
  void *v23;
  void *v24;
  NSDiffableDataSourceSectionSnapshot *v25;

  v25 = snapshot;
  v7 = item;
  -[NSDiffableDataSourceSectionSnapshot items](v25, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v7);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 391, CFSTR("Item identifier to insert before does not exist in section snapshot: %@"), v7);

    }
    -[_NSDiffableDataSourceSectionSnapshotState snapshotterMutableCopy](self->_state, "snapshotterMutableCopy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDiffableDataSourceSectionSnapshot _state](v25, "_state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "snapshotterMutableCopy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "insertSubtreeFromSnapshotter:beforeIndex:", v14, v11);
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "count");
    objc_msgSend(v16, "insertObjects:atIndexes:", v8, v17);
    if (objc_msgSend(v16, "count") - v18 != v10)
    {
      -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v19, v8);

    }
    v20 = objc_msgSend(v12, "count");
    if (v20 != objc_msgSend(v16, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 408, CFSTR("NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@"), objc_msgSend(v12, "count"), objc_msgSend(v16, "count"), v16);

    }
    v21 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:]([_NSDiffableDataSourceSectionSnapshotState alloc], "initWithSnapshotter:identifiers:", v12, v16);
    state = self->_state;
    self->_state = v21;

  }
}

- (id)insertSnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot afterItem:(id)item
{
  NSDiffableDataSourceSectionSnapshot *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _NSDiffableDataSourceSectionSnapshotState *v26;
  _NSDiffableDataSourceSectionSnapshotState *state;
  void *v29;
  void *v30;
  void *v31;
  SEL v32;
  void *v33;

  v7 = snapshot;
  v8 = item;
  -[NSDiffableDataSourceSectionSnapshot items](v7, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    v12 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v8);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 421, CFSTR("Item identifier to insert after does not exist in section snapshot: %@"), v8);

    }
    v32 = a2;
    -[_NSDiffableDataSourceSectionSnapshotState snapshotterMutableCopy](self->_state, "snapshotterMutableCopy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDiffableDataSourceSectionSnapshot _state](v7, "_state");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "snapshotterMutableCopy");
    v15 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v15;
    v16 = objc_msgSend(v13, "insertSubtreeFromSnapshotter:afterIndex:", v15, v12);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v32, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 426, CFSTR("NSDiffableDataSourceSectionSnapshot internal inconsistency: failed to insert subtree from snapshotter (%@) into snapshotter (%@) at insertion index %ld"), v33, v13, v12);

    }
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == objc_msgSend(v17, "count"))
    {
      v18 = 0;
    }
    else
    {
      if (v16 - v12 != 1)
        v12 = v16;
      -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v16, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "count");
    objc_msgSend(v21, "insertObjects:atIndexes:", v9, v22);
    if (objc_msgSend(v21, "count") - v23 != v11)
    {
      -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v24, v9);

    }
    v25 = objc_msgSend(v13, "count");
    if (v25 != objc_msgSend(v21, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v32, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 441, CFSTR("NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@"), objc_msgSend(v13, "count"), objc_msgSend(v21, "count"), v21);

    }
    v26 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:]([_NSDiffableDataSourceSectionSnapshotState alloc], "initWithSnapshotter:identifiers:", v13, v21);
    state = self->_state;
    self->_state = v26;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSArray)expandedItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expandedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSArray)rootItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSString)visualDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  const __CFString *v16;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    do
    {
      v10 = objc_msgSend(v8, "levelForIndex:", v9);
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&stru_1E16EDF20, "stringByPaddingToLength:withString:startingAtIndex:", 2 * v10, CFSTR(" "), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v8, "indexIsExpanded:", v9);
      v14 = CFSTR("-");
      if (v13)
        v14 = CFSTR("+");
      v15 = v14;
      if (objc_msgSend(v8, "indexIsVisible:", v9))
        v16 = CFSTR("*");
      else
        v16 = CFSTR(" ");
      objc_msgSend(v6, "appendFormat:", CFSTR("%@%@%@%@\n"), v12, v15, v16, v11);

      ++v9;
    }
    while (v9 < objc_msgSend(v7, "count"));
  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return (NSString *)v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\n%@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NSDiffableDataSourceSectionSnapshot *v4;
  BOOL v5;

  v4 = (NSDiffableDataSourceSectionSnapshot *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_NSDiffableDataSourceSectionSnapshotState isEqual:](self->_state, "isEqual:", v4->_state);
  }

  return v5;
}

- (NSArray)expandedItemsUpdates
{
  return (NSArray *)self->_expandedItemsUpdates;
}

- (NSArray)collapsedItemsUpdates
{
  return (NSArray *)self->_collapsedItemsUpdates;
}

- (void)_replaceItem:(id)a3 withItem:(id)a4
{
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  _NSDiffableDataSourceSectionSnapshotState *v11;
  void *v12;
  _NSDiffableDataSourceSectionSnapshotState *v13;
  _NSDiffableDataSourceSectionSnapshotState *state;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v17);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 540, CFSTR("Item identifier does not exist in section snapshot: %@"), v17);

  }
  if (-[_NSDiffableDataSourceSectionSnapshotState containsIdentifier:](self->_state, "containsIdentifier:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 542, CFSTR("Item identifier already exists in section snapshot: %@"), v7);

  }
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v9, v7);
  v11 = [_NSDiffableDataSourceSectionSnapshotState alloc];
  -[_NSDiffableDataSourceSectionSnapshotState snapshotterMutableCopy](self->_state, "snapshotterMutableCopy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_NSDiffableDataSourceSectionSnapshotState initWithSnapshotter:identifiers:](v11, "initWithSnapshotter:identifiers:", v12, v10);
  state = self->_state;
  self->_state = v13;

}

- (id)_indexesOfChildrenForParent:(id)a3 recursive:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v12;

  v4 = a4;
  v7 = a3;
  v8 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 552, CFSTR("Parent item identifier does not exist in section snapshot: %@"), v7);

  }
  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "childrenForParentAtIndex:recursive:", v8, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_indexesOfItems:(id)a3
{
  return -[NSDiffableDataSourceSectionSnapshot _indexesOfItems:ignoringItemsNotFound:](self, "_indexesOfItems:ignoringItemsNotFound:", a3, 0);
}

- (NSArray)_rootItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectsAtIndexes:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v7;
}

- (NSOrderedSet)_itemsOrderedSet
{
  return -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
}

- (NSOrderedSet)_visibleItemsOrderedSet
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFlat");

  if (v4)
  {
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99E40];
    -[NSDiffableDataSourceSectionSnapshot visibleItems](self, "visibleItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "orderedSetWithArray:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSOrderedSet *)v5;
}

- (_NSDiffableDataSourceSectionSnapshotState)_state
{
  return self->_state;
}

- (BOOL)_itemHasChildren:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 614, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item != nil"));

  }
  v6 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 616, CFSTR("Item identifier does not exist in section snapshot: %@"), v5);

  }
  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasChildrenForParentAtIndex:", v6);

  return v8;
}

- (NSIndexSet)_visibleIndexes
{
  void *v2;
  void *v3;

  -[_NSDiffableDataSourceSectionSnapshotState snapshotter](self->_state, "snapshotter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v3;
}

- (id)_itemBeforeItem:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 627, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item != nil"));

  }
  v6 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v5) - 1;
  if (v6 > 0x7FFFFFFFFFFFFFFDLL)
  {
    v8 = 0;
  }
  else
  {
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_itemAfterItem:(id)a3
{
  id v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceSectionSnapshot.m"), 641, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item != nil"));

  }
  v6 = -[_NSDiffableDataSourceSectionSnapshotState indexOfIdentifier:](self->_state, "indexOfIdentifier:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (v7 = v6 + 1,
        -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7 >= v9))
  {
    v11 = 0;
  }
  else
  {
    -[_NSDiffableDataSourceSectionSnapshotState identifiers](self->_state, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

@end
