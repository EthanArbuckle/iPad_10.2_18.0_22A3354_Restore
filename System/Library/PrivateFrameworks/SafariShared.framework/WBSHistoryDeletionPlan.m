@implementation WBSHistoryDeletionPlan

- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 triggeringItems:(id)a4 excludingItems:(id)a5 visits:(id)a6 reason:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WBSHistoryDeletionPlan *v17;
  WBSHistoryDeletionPlan *v18;
  uint64_t v19;
  NSSet *triggeringItems;
  uint64_t v21;
  NSSet *triggeringVisits;
  uint64_t v23;
  NSSet *excludedItems;
  uint64_t v25;
  NSSet *excludedVisits;
  uint64_t v27;
  NSMutableSet *discoveredItemsToDelete;
  WBSHistoryDeletionPlan *v29;
  objc_super v31;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v31.receiver = self;
  v31.super_class = (Class)WBSHistoryDeletionPlan;
  v17 = -[WBSHistoryDeletionPlan init](&v31, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_store, a3);
    v19 = objc_msgSend(v14, "copy");
    triggeringItems = v18->_triggeringItems;
    v18->_triggeringItems = (NSSet *)v19;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    triggeringVisits = v18->_triggeringVisits;
    v18->_triggeringVisits = (NSSet *)v21;

    v23 = objc_msgSend(v15, "copy");
    excludedItems = v18->_excludedItems;
    v18->_excludedItems = (NSSet *)v23;

    v25 = objc_msgSend(v16, "copy");
    excludedVisits = v18->_excludedVisits;
    v18->_excludedVisits = (NSSet *)v25;

    if (a7 == 1)
    {
      v27 = objc_msgSend(v14, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    discoveredItemsToDelete = v18->_discoveredItemsToDelete;
    v18->_discoveredItemsToDelete = (NSMutableSet *)v27;

    v29 = v18;
  }

  return v18;
}

- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 triggeringVisits:(id)a4 excludingItems:(id)a5 visits:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WBSHistoryDeletionPlan *v15;
  WBSHistoryDeletionPlan *v16;
  uint64_t v17;
  NSSet *triggeringItems;
  uint64_t v19;
  NSSet *triggeringVisits;
  uint64_t v21;
  NSSet *excludedItems;
  uint64_t v23;
  NSSet *excludedVisits;
  uint64_t v25;
  NSMutableSet *discoveredItemsToDelete;
  WBSHistoryDeletionPlan *v27;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)WBSHistoryDeletionPlan;
  v15 = -[WBSHistoryDeletionPlan init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_store, a3);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    triggeringItems = v16->_triggeringItems;
    v16->_triggeringItems = (NSSet *)v17;

    v19 = objc_msgSend(v12, "copy");
    triggeringVisits = v16->_triggeringVisits;
    v16->_triggeringVisits = (NSSet *)v19;

    v21 = objc_msgSend(v13, "copy");
    excludedItems = v16->_excludedItems;
    v16->_excludedItems = (NSSet *)v21;

    v23 = objc_msgSend(v14, "copy");
    excludedVisits = v16->_excludedVisits;
    v16->_excludedVisits = (NSSet *)v23;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v25 = objc_claimAutoreleasedReturnValue();
    discoveredItemsToDelete = v16->_discoveredItemsToDelete;
    v16->_discoveredItemsToDelete = (NSMutableSet *)v25;

    v27 = v16;
  }

  return v16;
}

- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 discoveredItemsToDelete:(id)a4
{
  id v7;
  id v8;
  WBSHistoryDeletionPlan *v9;
  WBSHistoryDeletionPlan *v10;
  uint64_t v11;
  NSSet *triggeringItems;
  uint64_t v13;
  NSSet *triggeringVisits;
  uint64_t v15;
  NSSet *excludedItems;
  uint64_t v17;
  NSSet *excludedVisits;
  uint64_t v19;
  NSMutableSet *discoveredItemsToDelete;
  uint64_t v21;
  NSMapTable *updatedLastVisitsByItem;
  WBSHistoryDeletionPlan *v23;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSHistoryDeletionPlan;
  v9 = -[WBSHistoryDeletionPlan init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    triggeringItems = v10->_triggeringItems;
    v10->_triggeringItems = (NSSet *)v11;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    triggeringVisits = v10->_triggeringVisits;
    v10->_triggeringVisits = (NSSet *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    excludedItems = v10->_excludedItems;
    v10->_excludedItems = (NSSet *)v15;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    excludedVisits = v10->_excludedVisits;
    v10->_excludedVisits = (NSSet *)v17;

    v19 = objc_msgSend(v8, "mutableCopy");
    discoveredItemsToDelete = v10->_discoveredItemsToDelete;
    v10->_discoveredItemsToDelete = (NSMutableSet *)v19;

    v10->_wasPrepared = 1;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    updatedLastVisitsByItem = v10->_updatedLastVisitsByItem;
    v10->_updatedLastVisitsByItem = (NSMapTable *)v21;

    v23 = v10;
  }

  return v10;
}

- (WBSHistoryDeletionPlan)initWithSQLiteStore:(id)a3 triggeringVisits:(id)a4 updatedLastVisitsByItem:(id)a5
{
  id v9;
  id v10;
  id v11;
  WBSHistoryDeletionPlan *v12;
  WBSHistoryDeletionPlan *v13;
  uint64_t v14;
  NSSet *triggeringItems;
  uint64_t v16;
  NSSet *triggeringVisits;
  uint64_t v18;
  NSSet *excludedItems;
  uint64_t v20;
  NSSet *excludedVisits;
  uint64_t v22;
  NSMutableSet *discoveredItemsToDelete;
  uint64_t v24;
  NSMapTable *updatedLastVisitsByItem;
  WBSHistoryDeletionPlan *v26;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)WBSHistoryDeletionPlan;
  v12 = -[WBSHistoryDeletionPlan init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    triggeringItems = v13->_triggeringItems;
    v13->_triggeringItems = (NSSet *)v14;

    v16 = objc_msgSend(v10, "copy");
    triggeringVisits = v13->_triggeringVisits;
    v13->_triggeringVisits = (NSSet *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    excludedItems = v13->_excludedItems;
    v13->_excludedItems = (NSSet *)v18;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    excludedVisits = v13->_excludedVisits;
    v13->_excludedVisits = (NSSet *)v20;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    discoveredItemsToDelete = v13->_discoveredItemsToDelete;
    v13->_discoveredItemsToDelete = (NSMutableSet *)v22;

    v13->_wasPrepared = 1;
    v24 = objc_msgSend(v11, "copy");
    updatedLastVisitsByItem = v13->_updatedLastVisitsByItem;
    v13->_updatedLastVisitsByItem = (NSMapTable *)v24;

    v26 = v13;
  }

  return v13;
}

- (NSSet)allItemsToDelete
{
  void *v3;

  v3 = (void *)-[NSSet mutableCopy](self->_triggeringItems, "mutableCopy");
  objc_msgSend(v3, "unionSet:", self->_discoveredItemsToDelete);
  objc_msgSend(v3, "minusSet:", self->_excludedItems);
  return (NSSet *)v3;
}

- (NSSet)allVisitsToDeleteExcludingVisitsFromItemsBeingDeleted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSSet setByAddingObjectsFromSet:](self->_triggeringVisits, "setByAddingObjectsFromSet:", self->_discoveredVisitsToDelete);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "minusSet:", self->_excludedVisits);
  v5 = (void *)MEMORY[0x1E0CB3880];
  -[WBSHistoryDeletionPlan allItemsToDelete](self, "allItemsToDelete");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("NOT (item IN %@)"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredSetUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v8;
}

- (NSMapTable)allVisitsToDeleteByItemExcludingItemsBeingDeleted
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[WBSHistoryDeletionPlan allVisitsToDeleteExcludingVisitsFromItemsBeingDeleted](self, "allVisitsToDeleteExcludingVisitsFromItemsBeingDeleted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "item", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v3, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "addObject:", v8);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKey:", v12, v9);

          }
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return (NSMapTable *)v3;
}

- (NSSet)triggeringItems
{
  return self->_triggeringItems;
}

- (NSSet)triggeringVisits
{
  return self->_triggeringVisits;
}

- (NSSet)discoveredItemsToDelete
{
  return &self->_discoveredItemsToDelete->super;
}

- (NSSet)discoveredVisitsToDelete
{
  return self->_discoveredVisitsToDelete;
}

- (NSMapTable)updatedLastVisitsByItem
{
  return self->_updatedLastVisitsByItem;
}

- (BOOL)wasPrepared
{
  return self->_wasPrepared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedLastVisitsByItem, 0);
  objc_storeStrong((id *)&self->_discoveredVisitsToDelete, 0);
  objc_storeStrong((id *)&self->_triggeringVisits, 0);
  objc_storeStrong((id *)&self->_triggeringItems, 0);
  objc_storeStrong((id *)&self->_discoveredItemsToDelete, 0);
  objc_storeStrong((id *)&self->_excludedVisits, 0);
  objc_storeStrong((id *)&self->_excludedItems, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
