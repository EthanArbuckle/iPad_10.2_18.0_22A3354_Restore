@implementation PGHighlightItemList

- (PGHighlightItemList)initWithParentHighlightItem:(id)a3 childHighlightItems:(id)a4
{
  id v7;
  id v8;
  PGHighlightItemList *v9;
  PGHighlightItemList *v10;
  uint64_t v11;
  id modelObject;
  uint64_t v13;
  NSMutableOrderedSet *internalHighlightItems;
  uint64_t v15;
  NSMutableSet *internalAddedHighlightItems;
  uint64_t v17;
  NSMutableSet *internalRemovedHighlightItems;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PGHighlightItemList;
  v9 = -[PGHighlightItemList init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentHighlightItem, a3);
    objc_msgSend(v7, "modelObject");
    v11 = objc_claimAutoreleasedReturnValue();
    modelObject = v10->_modelObject;
    v10->_modelObject = (id)v11;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    internalHighlightItems = v10->_internalHighlightItems;
    v10->_internalHighlightItems = (NSMutableOrderedSet *)v13;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    internalAddedHighlightItems = v10->_internalAddedHighlightItems;
    v10->_internalAddedHighlightItems = (NSMutableSet *)v15;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    internalRemovedHighlightItems = v10->_internalRemovedHighlightItems;
    v10->_internalRemovedHighlightItems = (NSMutableSet *)v17;

    v10->_sharingComposition = objc_msgSend(v7, "sharingComposition");
    v10->_kind = objc_msgSend(v7, "kind");
    v10->_type = objc_msgSend(v7, "type");
    v10->_category = objc_msgSend(v7, "category");
    -[PGHighlightItemList _updateHighlightItemsOrdering](v10, "_updateHighlightItemsOrdering");
  }

  return v10;
}

- (id)initAsNewList
{
  PGHighlightItemList *v2;
  uint64_t v3;
  NSMutableOrderedSet *internalHighlightItems;
  uint64_t v5;
  NSMutableSet *internalAddedHighlightItems;
  uint64_t v7;
  NSMutableSet *internalRemovedHighlightItems;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PGHighlightItemList;
  v2 = -[PGHighlightItemList init](&v10, sel_init);
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

- (NSDate)startDate
{
  void *v3;
  NSDate *v4;

  if (-[PGHighlightItemList isCandidateForReuse](self, "isCandidateForReuse"))
  {
    -[PGHighlightItemList parentHighlightItem](self, "parentHighlightItem");
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

  if (-[PGHighlightItemList isCandidateForReuse](self, "isCandidateForReuse"))
  {
    -[PGHighlightItemList parentHighlightItem](self, "parentHighlightItem");
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

- (NSDate)localStartDate
{
  void *v3;
  NSDate *v4;

  if (-[PGHighlightItemList isCandidateForReuse](self, "isCandidateForReuse"))
  {
    -[PGHighlightItemList parentHighlightItem](self, "parentHighlightItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localStartDate");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_localStartDate;
  }
  return v4;
}

- (NSDate)localEndDate
{
  void *v3;
  NSDate *v4;

  if (-[PGHighlightItemList isCandidateForReuse](self, "isCandidateForReuse"))
  {
    -[PGHighlightItemList parentHighlightItem](self, "parentHighlightItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localEndDate");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_localEndDate;
  }
  return v4;
}

- (unsigned)sharingComposition
{
  void *v3;
  unsigned __int16 v4;

  if (!-[PGHighlightItemList isCandidateForReuse](self, "isCandidateForReuse"))
    return self->_sharingComposition;
  -[PGHighlightItemList parentHighlightItem](self, "parentHighlightItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sharingComposition");

  return v4;
}

- (NSDateComponents)localDateComponents
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;

  -[PGHighlightItemList startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGHighlightItemList endDate](self, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v3);
  objc_msgSend(v3, "dateByAddingTimeInterval:", v5 * 0.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGHighlightItemList localStartDate](self, "localStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:", v7);
    v10 = (uint64_t)v9;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsInTimeZone:fromDate:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v12;
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  -[PGHighlightItemList parentHighlightItem](self, "parentHighlightItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)numberOfAssetsInExtendedPrivate
{
  return -[PGHighlightItemList numberOfAssetsInExtendedForSharingFilter:](self, "numberOfAssetsInExtendedForSharingFilter:", 0);
}

- (unint64_t)numberOfAssetsInExtendedShared
{
  return -[PGHighlightItemList numberOfAssetsInExtendedForSharingFilter:](self, "numberOfAssetsInExtendedForSharingFilter:", 1);
}

- (unint64_t)numberOfAssetsInExtendedMixed
{
  return -[PGHighlightItemList numberOfAssetsInExtendedForSharingFilter:](self, "numberOfAssetsInExtendedForSharingFilter:", 2);
}

- (unint64_t)numberOfAssetsInExtendedForSharingFilter:(unsigned __int16)a3
{
  uint64_t v3;
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_internalHighlightItems;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "numberOfAssetsInExtendedForSharingFilter:", v3, (_QWORD)v11);
      }
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)sortedHighlightItemModelObjects
{
  void *v3;
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableOrderedSet count](self->_internalHighlightItems, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_internalHighlightItems;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "modelObject", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "modelObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unsigned)mixedSharingCompositionKeyAssetRelationship
{
  void *v3;
  unsigned __int16 v4;

  if (!-[PGHighlightItemList isCandidateForReuse](self, "isCandidateForReuse"))
    return self->_mixedSharingCompositionKeyAssetRelationship;
  -[PGHighlightItemList parentHighlightItem](self, "parentHighlightItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mixedSharingCompositionKeyAssetRelationship");

  return v4;
}

- (id)keyAssetForHighlightFilter:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = a3;
  v5 = -[PGHighlightItemList sharingComposition](self, "sharingComposition");
  v6 = -[PGHighlightItemList mixedSharingCompositionKeyAssetRelationship](self, "mixedSharingCompositionKeyAssetRelationship");
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PGHighlightItemList_keyAssetForHighlightFilter___block_invoke;
  v9[3] = &unk_1E842E208;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PGHighlightItemList_keyAssetForHighlightFilter___block_invoke_2;
  v8[3] = &unk_1E842E208;
  +[PGHighlightEnrichmentUtilities selectKeyAssetForSharingComposition:mixedSharingCompositionKeyAssetRelationship:givenHighlightFilter:privateHandler:sharedHandler:](PGHighlightEnrichmentUtilities, "selectKeyAssetForSharingComposition:mixedSharingCompositionKeyAssetRelationship:givenHighlightFilter:privateHandler:sharedHandler:", v5, v6, v3, v9, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)extendedCuratedAssets
{
  void *v3;
  NSArray *v4;

  if (-[PGHighlightItemList isCandidateForReuse](self, "isCandidateForReuse"))
  {
    -[PGHighlightItemList parentHighlightItem](self, "parentHighlightItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extendedCuratedAssets");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_extendedCuratedAssets;
  }
  return v4;
}

- (BOOL)isCandidateForReuse
{
  return !-[NSMutableOrderedSet count](self->_internalHighlightItems, "count") && self->_parentHighlightItem != 0;
}

- (BOOL)hasChanges
{
  return -[NSMutableSet count](self->_internalAddedHighlightItems, "count")
      || -[NSMutableSet count](self->_internalRemovedHighlightItems, "count") != 0;
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
  id v4;

  v4 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_internalHighlightItems, "containsObject:") & 1) == 0)
  {
    -[NSMutableOrderedSet addObject:](self->_internalHighlightItems, "addObject:", v4);
    if (-[NSMutableSet containsObject:](self->_internalRemovedHighlightItems, "containsObject:", v4))
      -[NSMutableSet removeObject:](self->_internalRemovedHighlightItems, "removeObject:", v4);
    else
      -[NSMutableSet addObject:](self->_internalAddedHighlightItems, "addObject:", v4);
    -[PGHighlightItemList _updateHighlightItemsOrdering](self, "_updateHighlightItemsOrdering");
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
    -[PGHighlightItemList _updateHighlightItemsOrdering](self, "_updateHighlightItemsOrdering");
  }

}

- (void)_updateHighlightItemsOrdering
{
  NSMutableOrderedSet *internalHighlightItems;
  void *v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSDate *v11;
  NSDate *startDate;
  void *v13;
  NSDate *v14;
  NSDate *endDate;
  void *v16;
  NSDate *v17;
  NSDate *localStartDate;
  void *v19;
  NSDate *v20;
  NSDate *localEndDate;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  internalHighlightItems = self->_internalHighlightItems;
  objc_msgSend((id)objc_opt_class(), "timeSortDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet sortUsingDescriptors:](internalHighlightItems, "sortUsingDescriptors:", v4);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_internalHighlightItems;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "kind", (_QWORD)v22) != 3)
        {
          -[NSMutableOrderedSet firstObject](self->_internalHighlightItems, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "startDate");
          v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
          startDate = self->_startDate;
          self->_startDate = v11;

          -[NSMutableOrderedSet lastObject](self->_internalHighlightItems, "lastObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "endDate");
          v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
          endDate = self->_endDate;
          self->_endDate = v14;

          -[NSMutableOrderedSet firstObject](self->_internalHighlightItems, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localStartDate");
          v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
          localStartDate = self->_localStartDate;
          self->_localStartDate = v17;

          -[NSMutableOrderedSet lastObject](self->_internalHighlightItems, "lastObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "localEndDate");
          v20 = (NSDate *)objc_claimAutoreleasedReturnValue();
          localEndDate = self->_localEndDate;
          self->_localEndDate = v20;

          goto LABEL_11;
        }
      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGHighlightItemList;
  -[PGHighlightItemList description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [(%@) - (%@)] (%ld) time periods"), v4, self->_localStartDate, self->_localEndDate, -[NSMutableOrderedSet count](self->_internalHighlightItems, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unsigned)visibilityStateForHighlightFilter:(unsigned __int16)a3
{
  if (a3 > 2u)
    return 0;
  else
    return *(&self->_visibilityStatePrivate + a3);
}

- (void)setVisibilityState:(unsigned __int16)a3 forSharingFilter:(unsigned __int16)a4
{
  if (a4 <= 2u)
    *(&self->_visibilityStatePrivate + a4) = a3;
}

- (id)childHighlightItemsForHighlightFilter:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[PGHighlightItemList sharingComposition](self, "sharingComposition");
  if (!+[PGHighlightEnrichmentUtilities canUseSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "canUseSharingComposition:forSharingFilter:", v5, v3))return MEMORY[0x1E0C9AA60];
  if ((_DWORD)v5 == 2)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PGHighlightItemList sortedChildHighlightItems](self, "sortedChildHighlightItems", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (+[PGHighlightEnrichmentUtilities canUseSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "canUseSharingComposition:forSharingFilter:", objc_msgSend(v12, "sharingComposition"), v3))
          {
            objc_msgSend(v6, "addObject:", v12);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[PGHighlightItemList sortedChildHighlightItems](self, "sortedChildHighlightItems");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSMutableOrderedSet)internalHighlightItems
{
  return self->_internalHighlightItems;
}

- (void)setInternalHighlightItems:(id)a3
{
  objc_storeStrong((id *)&self->_internalHighlightItems, a3);
}

- (NSMutableSet)internalAddedHighlightItems
{
  return self->_internalAddedHighlightItems;
}

- (NSMutableSet)internalRemovedHighlightItems
{
  return self->_internalRemovedHighlightItems;
}

- (PGHighlightItem)parentHighlightItem
{
  return self->_parentHighlightItem;
}

- (PHAsset)keyAssetPrivate
{
  return self->_keyAssetPrivate;
}

- (void)setKeyAssetPrivate:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetPrivate, a3);
}

- (PHAsset)keyAssetShared
{
  return self->_keyAssetShared;
}

- (void)setKeyAssetShared:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetShared, a3);
}

- (void)setMixedSharingCompositionKeyAssetRelationship:(unsigned __int16)a3
{
  self->_mixedSharingCompositionKeyAssetRelationship = a3;
}

- (void)setExtendedCuratedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_extendedCuratedAssets, a3);
}

- (id)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
  objc_storeStrong(&self->_modelObject, a3);
}

- (double)promotionScore
{
  return self->_promotionScore;
}

- (void)setPromotionScore:(double)a3
{
  self->_promotionScore = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)category
{
  return self->_category;
}

- (unsigned)visibilityStatePrivate
{
  return self->_visibilityStatePrivate;
}

- (void)setVisibilityStatePrivate:(unsigned __int16)a3
{
  self->_visibilityStatePrivate = a3;
}

- (unsigned)visibilityStateShared
{
  return self->_visibilityStateShared;
}

- (void)setVisibilityStateShared:(unsigned __int16)a3
{
  self->_visibilityStateShared = a3;
}

- (unsigned)visibilityStateMixed
{
  return self->_visibilityStateMixed;
}

- (void)setVisibilityStateMixed:(unsigned __int16)a3
{
  self->_visibilityStateMixed = a3;
}

- (unsigned)enrichmentState
{
  return self->_enrichmentState;
}

- (unsigned)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modelObject, 0);
  objc_storeStrong((id *)&self->_extendedCuratedAssets, 0);
  objc_storeStrong((id *)&self->_keyAssetShared, 0);
  objc_storeStrong((id *)&self->_keyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_parentHighlightItem, 0);
  objc_storeStrong((id *)&self->_internalRemovedHighlightItems, 0);
  objc_storeStrong((id *)&self->_internalAddedHighlightItems, 0);
  objc_storeStrong((id *)&self->_internalHighlightItems, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

uint64_t __50__PGHighlightItemList_keyAssetForHighlightFilter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyAssetPrivate");
}

uint64_t __50__PGHighlightItemList_keyAssetForHighlightFilter___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyAssetShared");
}

+ (id)timeSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)updateParentHighlightItemLists:(id)a3 withChildHighlightItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v10);
  }
  v29 = v8;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v16, "internalAddedHighlightItems");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeAllObjects");

        objc_msgSend(v16, "internalRemovedHighlightItems");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeAllObjects");

        v33 = v16;
        objc_msgSend(v16, "internalHighlightItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v19, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v21 = v19;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v35;
          do
          {
            for (k = 0; k != v23; ++k)
            {
              if (*(_QWORD *)v35 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * k);
              objc_msgSend(v26, "uuid");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKeyedSubscript:", v27);
              v28 = (id)objc_claimAutoreleasedReturnValue();

              if (!v28)
                v28 = v26;
              objc_msgSend(v20, "addObject:", v28);

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
          }
          while (v23);
        }

        objc_msgSend(v33, "setInternalHighlightItems:", v20);
        objc_msgSend(v33, "_updateHighlightItemsOrdering");

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v32);
  }

}

@end
