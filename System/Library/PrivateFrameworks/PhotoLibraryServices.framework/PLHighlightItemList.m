@implementation PLHighlightItemList

- (PLHighlightItemList)initWithParentHighlightItem:(id)a3 childHighlightItems:(id)a4
{
  id v7;
  id v8;
  PLHighlightItemList *v9;
  PLHighlightItemList *v10;
  uint64_t v11;
  NSMutableOrderedSet *internalHighlightItems;
  uint64_t v13;
  NSMutableSet *internalAddedHighlightItems;
  uint64_t v15;
  NSMutableSet *internalRemovedHighlightItems;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PLHighlightItemList;
  v9 = -[PLHighlightItemList init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentHighlightItem, a3);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    internalHighlightItems = v10->_internalHighlightItems;
    v10->_internalHighlightItems = (NSMutableOrderedSet *)v11;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    internalAddedHighlightItems = v10->_internalAddedHighlightItems;
    v10->_internalAddedHighlightItems = (NSMutableSet *)v13;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    internalRemovedHighlightItems = v10->_internalRemovedHighlightItems;
    v10->_internalRemovedHighlightItems = (NSMutableSet *)v15;

    -[PLHighlightItemList _updateHighlightItemsOrdering](v10, "_updateHighlightItemsOrdering");
  }

  return v10;
}

- (id)initAsNewList
{
  PLHighlightItemList *v2;
  uint64_t v3;
  NSMutableOrderedSet *internalHighlightItems;
  uint64_t v5;
  NSMutableSet *internalAddedHighlightItems;
  uint64_t v7;
  NSMutableSet *internalRemovedHighlightItems;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLHighlightItemList;
  v2 = -[PLHighlightItemList init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v3 = objc_claimAutoreleasedReturnValue();
    internalHighlightItems = v2->_internalHighlightItems;
    v2->_internalHighlightItems = (NSMutableOrderedSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    internalAddedHighlightItems = v2->_internalAddedHighlightItems;
    v2->_internalAddedHighlightItems = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    internalRemovedHighlightItems = v2->_internalRemovedHighlightItems;
    v2->_internalRemovedHighlightItems = (NSMutableSet *)v7;

  }
  return v2;
}

- (NSDate)groupingStartDate
{
  void *v3;
  NSDate *v4;

  if (-[PLHighlightItemList isCandidateForReuse](self, "isCandidateForReuse"))
  {
    -[PLHighlightItemList parentHighlightItem](self, "parentHighlightItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_groupingStartDate;
  }
  return v4;
}

- (NSDate)groupingEndDate
{
  void *v3;
  NSDate *v4;

  if (-[PLHighlightItemList isCandidateForReuse](self, "isCandidateForReuse"))
  {
    -[PLHighlightItemList parentHighlightItem](self, "parentHighlightItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_groupingEndDate;
  }
  return v4;
}

- (NSDate)startDate
{
  void *v3;
  NSDate *v4;

  if (-[PLHighlightItemList isCandidateForReuse](self, "isCandidateForReuse"))
  {
    -[PLHighlightItemList parentHighlightItem](self, "parentHighlightItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_startDate;
  }
  return v4;
}

- (NSDate)endDate
{
  void *v3;
  NSDate *v4;

  if (-[PLHighlightItemList isCandidateForReuse](self, "isCandidateForReuse"))
  {
    -[PLHighlightItemList parentHighlightItem](self, "parentHighlightItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_endDate;
  }
  return v4;
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  -[PLHighlightItemList parentHighlightItem](self, "parentHighlightItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSManagedObjectID)objectID
{
  void *v2;
  void *v3;

  -[PLHighlightItemList parentHighlightItem](self, "parentHighlightItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSManagedObjectID *)v3;
}

- (BOOL)isCandidateForReuse
{
  return !-[NSMutableOrderedSet count](self->_internalHighlightItems, "count") && self->_parentHighlightItem != 0;
}

- (BOOL)hasChanges
{
  int v3;
  void *v5;
  void *v6;

  if (-[NSMutableSet count](self->_internalAddedHighlightItems, "count")
    || -[NSMutableSet count](self->_internalRemovedHighlightItems, "count"))
  {
    LOBYTE(v3) = 1;
  }
  else if (self->_parentHighlightItem && -[NSMutableOrderedSet count](self->_internalHighlightItems, "count"))
  {
    -[PLHighlightItem startDate](self->_parentHighlightItem, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToDate:", self->_startDate))
    {
      -[PLHighlightItem endDate](self->_parentHighlightItem, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "isEqualToDate:", self->_endDate) ^ 1;

    }
    else
    {
      LOBYTE(v3) = 1;
    }

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isNewList
{
  return self->_parentHighlightItem == 0;
}

- (NSArray)sortedChildHighlightItems
{
  void *v2;
  void *v3;

  -[NSMutableOrderedSet array](self->_internalHighlightItems, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSSet)addedHighlightItems
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_internalAddedHighlightItems, "copy");
}

- (NSSet)removedHighlightItems
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_internalRemovedHighlightItems, "copy");
}

- (void)addHighlightItem:(id)a3
{
  void *v4;
  NSMutableOrderedSet *internalHighlightItems;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_internalHighlightItems, "containsObject:") & 1) == 0)
  {
    -[NSMutableOrderedSet addObject:](self->_internalHighlightItems, "addObject:", v8);
    if (-[NSMutableSet containsObject:](self->_internalRemovedHighlightItems, "containsObject:", v8))
      -[NSMutableSet removeObject:](self->_internalRemovedHighlightItems, "removeObject:", v8);
    else
      -[NSMutableSet addObject:](self->_internalAddedHighlightItems, "addObject:", v8);
    objc_msgSend((id)objc_opt_class(), "timeSortDescriptors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    internalHighlightItems = self->_internalHighlightItems;
    v6 = -[NSMutableOrderedSet count](internalHighlightItems, "count");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__PLHighlightItemList_addHighlightItem___block_invoke;
    v9[3] = &unk_1E366C6C0;
    v10 = v4;
    v7 = v4;
    -[NSMutableOrderedSet indexOfObject:inSortedRange:options:usingComparator:](internalHighlightItems, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, v6, 1024, v9);
    -[PLHighlightItemList _updateStartEndDates](self, "_updateStartEndDates");

  }
}

- (void)removeHighlightItem:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_internalHighlightItems, "containsObject:"))
  {
    -[NSMutableOrderedSet removeObject:](self->_internalHighlightItems, "removeObject:", v4);
    if (-[NSMutableSet containsObject:](self->_internalAddedHighlightItems, "containsObject:", v4))
      -[NSMutableSet removeObject:](self->_internalAddedHighlightItems, "removeObject:", v4);
    else
      -[NSMutableSet addObject:](self->_internalRemovedHighlightItems, "addObject:", v4);
    -[PLHighlightItemList _updateStartEndDates](self, "_updateStartEndDates");
  }

}

- (void)_updateHighlightItemsOrdering
{
  NSMutableOrderedSet *internalHighlightItems;
  void *v4;

  internalHighlightItems = self->_internalHighlightItems;
  objc_msgSend((id)objc_opt_class(), "timeSortDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet sortUsingDescriptors:](internalHighlightItems, "sortUsingDescriptors:", v4);

  -[PLHighlightItemList _updateStartEndDates](self, "_updateStartEndDates");
}

- (void)_updateStartEndDates
{
  uint64_t v2;
  uint64_t v3;
  NSDate *v4;
  NSDate *v5;
  uint64_t v6;
  NSDate *v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSDate *startDate;
  NSDate *v20;
  NSDate *endDate;
  NSDate *v22;
  NSDate *groupingStartDate;
  NSDate *v24;
  NSDate *groupingEndDate;
  PLHighlightItemList *v26;
  NSMutableOrderedSet *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v26 = self;
  obj = self->_internalHighlightItems;
  v2 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      v10 = v5;
      v11 = (void *)v6;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        if (objc_msgSend(v12, "kind", v26) != 3)
        {
          objc_msgSend(v12, "startDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "earlierDate:", v7);
          v14 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "endDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "laterDate:", v4);
          v16 = objc_claimAutoreleasedReturnValue();

          v4 = (NSDate *)v16;
          v7 = (NSDate *)v14;
        }
        objc_msgSend(v12, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "earlierDate:", v10);
        v5 = (NSDate *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "laterDate:", v11);
        v6 = objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
        v11 = (void *)v6;
      }
      while (v3 != v9);
      v3 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }

  startDate = v26->_startDate;
  v26->_startDate = v7;
  v20 = v7;

  endDate = v26->_endDate;
  v26->_endDate = v4;
  v22 = v4;

  groupingStartDate = v26->_groupingStartDate;
  v26->_groupingStartDate = v5;
  v24 = v5;

  groupingEndDate = v26->_groupingEndDate;
  v26->_groupingEndDate = (NSDate *)v6;

}

- (NSString)description
{
  void *v3;
  void *v4;
  NSDate *startDate;
  NSDate *endDate;
  uint64_t v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PLHighlightItemList;
  -[PLHighlightItemList description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  endDate = self->_endDate;
  v7 = -[NSMutableOrderedSet count](self->_internalHighlightItems, "count");
  v8 = -[PLHighlightItemList isNewList](self, "isNewList");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [(%@) - (%@)] (%ld) time periods, isNew: %@"), v4, startDate, endDate, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)mergeWithHighlightItemList:(id)a3
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "internalHighlightItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[PLHighlightItemList addHighlightItem:](self, "addHighlightItem:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[PLHighlightItemList _updateHighlightItemsOrdering](self, "_updateHighlightItemsOrdering");
}

- (void)reset
{
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *internalHighlightItems;
  NSMutableSet *v5;
  NSMutableSet *internalAddedHighlightItems;
  NSMutableSet *v7;
  NSMutableSet *internalRemovedHighlightItems;
  NSDate *startDate;
  NSDate *endDate;
  NSDate *groupingStartDate;
  NSDate *groupingEndDate;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  internalHighlightItems = self->_internalHighlightItems;
  self->_internalHighlightItems = v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  internalAddedHighlightItems = self->_internalAddedHighlightItems;
  self->_internalAddedHighlightItems = v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  internalRemovedHighlightItems = self->_internalRemovedHighlightItems;
  self->_internalRemovedHighlightItems = v7;

  startDate = self->_startDate;
  self->_startDate = 0;

  endDate = self->_endDate;
  self->_endDate = 0;

  groupingStartDate = self->_groupingStartDate;
  self->_groupingStartDate = 0;

  groupingEndDate = self->_groupingEndDate;
  self->_groupingEndDate = 0;

}

- (NSMutableOrderedSet)internalHighlightItems
{
  return self->_internalHighlightItems;
}

- (NSMutableSet)internalAddedHighlightItems
{
  return self->_internalAddedHighlightItems;
}

- (NSMutableSet)internalRemovedHighlightItems
{
  return self->_internalRemovedHighlightItems;
}

- (PLHighlightItem)parentHighlightItem
{
  return self->_parentHighlightItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentHighlightItem, 0);
  objc_storeStrong((id *)&self->_internalRemovedHighlightItems, 0);
  objc_storeStrong((id *)&self->_internalAddedHighlightItems, 0);
  objc_storeStrong((id *)&self->_internalHighlightItems, 0);
  objc_storeStrong((id *)&self->_groupingEndDate, 0);
  objc_storeStrong((id *)&self->_groupingStartDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

uint64_t __40__PLHighlightItemList_addHighlightItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "compareObject:toObject:", v5, v6, (_QWORD)v15);
        if (v12)
        {
          v13 = v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)timeSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
