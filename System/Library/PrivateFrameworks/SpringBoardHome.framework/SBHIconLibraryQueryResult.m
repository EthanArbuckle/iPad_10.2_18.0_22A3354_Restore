@implementation SBHIconLibraryQueryResult

+ (id)nullQueryResults
{
  if (nullQueryResults_onceToken != -1)
    dispatch_once(&nullQueryResults_onceToken, &__block_literal_global_58);
  return (id)nullQueryResults_nullQueryResults;
}

void __45__SBHIconLibraryQueryResult_nullQueryResults__block_invoke()
{
  SBHIconLibraryQueryResult *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  SBHIconLibraryQuery *v4;

  v0 = [SBHIconLibraryQueryResult alloc];
  v4 = -[SBHIconLibraryQuery initWithSearchString:]([SBHIconLibraryQuery alloc], "initWithSearchString:", 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[SBHIconLibraryQueryResult initWithQuery:icons:sortComparator:](v0, "initWithQuery:icons:sortComparator:", v4, v1, 0);
  v3 = (void *)nullQueryResults_nullQueryResults;
  nullQueryResults_nullQueryResults = v2;

}

- (SBHIconLibraryQueryResult)initWithQuery:(id)a3 icons:(id)a4 snapshot:(id)a5 collationStrategy:(id)a6 iconForitemIdentifier:(id)a7 sortMethodology:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SBHIconLibraryQueryResult *v20;
  SBHIconLibraryQueryResult *v21;
  uint64_t v22;
  NSSet *icons;
  uint64_t v24;
  NSDiffableDataSourceSnapshot *snapshot;
  uint64_t v26;
  NSDictionary *iconForItemIdentifier;
  uint64_t v28;
  objc_super v30;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v30.receiver = self;
  v30.super_class = (Class)SBHIconLibraryQueryResult;
  v20 = -[SBHIconLibraryQueryResult init](&v30, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_query, a3);
    v22 = objc_msgSend(v16, "copy");
    icons = v21->_icons;
    v21->_icons = (NSSet *)v22;

    v24 = objc_msgSend(v17, "copy");
    snapshot = v21->_snapshot;
    v21->_snapshot = (NSDiffableDataSourceSnapshot *)v24;

    objc_storeStrong((id *)&v21->_collationStrategy, a6);
    v26 = objc_msgSend(v19, "copy");
    iconForItemIdentifier = v21->_iconForItemIdentifier;
    v21->_iconForItemIdentifier = (NSDictionary *)v26;

    v21->_sortMethodology = a8;
    v28 = _gQueryResultIdx++;
    v21->_totalNumberOfItems = 0x7FFFFFFFFFFFFFFFLL;
    v21->_queryResultIdx = v28;
  }

  return v21;
}

- (SBHIconLibraryQueryResult)initWithQuery:(id)a3 icons:(id)a4 sortComparator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  SBHIconLibraryQueryResult *v14;
  id v16;
  id v17;
  uint64_t v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v18 = 1;
  v16 = 0;
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "_hydrateSnapshot:fromIcons:query:outCollationStrategy:outIconForItemIdentifier:outSortMethodology:sortComparator:", v11, v9, v10, &v17, &v16, &v18, v8);

  v12 = v17;
  v13 = v16;
  v14 = -[SBHIconLibraryQueryResult initWithQuery:icons:snapshot:collationStrategy:iconForitemIdentifier:sortMethodology:](self, "initWithQuery:icons:snapshot:collationStrategy:iconForitemIdentifier:sortMethodology:", v10, v9, v11, v12, v13, v18);

  return v14;
}

- (BOOL)isEqualToQueryResult:(id)a3
{
  SBHIconLibraryQueryResult *v4;
  SBHIconLibraryQueryResult *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  BOOL v19;

  v4 = (SBHIconLibraryQueryResult *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if (self == v4)
  {
    v19 = 1;
    goto LABEL_10;
  }
  -[SBHIconLibraryQueryResult snapshot](v4, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryQueryResult snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = BSEqualObjects();

  if (!v8)
    goto LABEL_8;
  -[SBHIconLibraryQueryResult query](v5, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryQueryResult query](self, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = BSEqualObjects();

  if (!v11)
    goto LABEL_8;
  -[SBHIconLibraryQueryResult icons](v5, "icons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryQueryResult icons](self, "icons");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = BSEqualObjects();

  if (!v14)
    goto LABEL_8;
  -[SBHIconLibraryQueryResult collationStrategy](v5, "collationStrategy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryQueryResult collationStrategy](self, "collationStrategy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = BSEqualObjects();

  if (v17)
  {
    v18 = -[SBHIconLibraryQueryResult sortMethodology](v5, "sortMethodology");
    v19 = v18 == -[SBHIconLibraryQueryResult sortMethodology](self, "sortMethodology");
  }
  else
  {
LABEL_8:
    v19 = 0;
  }
LABEL_10:

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconLibraryQueryResult *v4;
  BOOL v5;

  v4 = (SBHIconLibraryQueryResult *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[SBHIconLibraryQueryResult isEqualToQueryResult:](self, "isEqualToQueryResult:", v4);
  }

  return v5;
}

- (BOOL)isNullQueryResult
{
  void *v3;

  +[SBHIconLibraryQueryResult nullQueryResults](SBHIconLibraryQueryResult, "nullQueryResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SBHIconLibraryQueryResult isEqual:](self, "isEqual:", v3);

  return (char)self;
}

+ (void)_hydrateSnapshot:(id)a3 fromIcons:(id)a4 query:(id)a5 outCollationStrategy:(id *)a6 outIconForItemIdentifier:(id *)a7 outSortMethodology:(unint64_t *)a8 sortComparator:(id)a9
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t j;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void (**v41)(_QWORD);
  void *v42;
  unint64_t v43;
  void *v44;
  void (**v45)(_QWORD);
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v53;
  id v54;
  id v55;
  id obj;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  BOOL v63;
  _QWORD aBlock[4];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  BOOL v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v11 = a4;
  v54 = a5;
  v55 = a9;
  objc_msgSend(v54, "searchString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v12, "length");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v11;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  if (v15)
  {
    v16 = v15;
    LOBYTE(v17) = 0;
    v18 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v72 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v20, "sbh_iconLibraryItemIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bs_setSafeObject:forKey:", v20, v21);

        if ((v17 & 1) != 0)
        {
          v17 = 1;
        }
        else
        {
          v22 = v20;
          if (objc_msgSend(v22, "isBookmarkIcon"))
          {
            objc_msgSend(v22, "webClip");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v23, "isAppClip");

          }
          else
          {
            v17 = 0;
          }

        }
        v24 = (void *)MEMORY[0x1E0CF9688];
        objc_msgSend(v20, "applicationBundleID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "applicationWithBundleIdentifier:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v26, "isHidden") & 1) == 0)
          objc_msgSend(v14, "addObject:", v20);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  if (v47)
  {
    v75 = SBHLibrarySectionIdentifierNone;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
  }
  else
  {
    if (objc_msgSend(v14, "count"))
    {
      BSDispatchQueueAssertNotMain();
      if (v17)
        +[SBHLocalizedIndexedCollationStrategy dimSumCollationStrategy](SBHLocalizedIndexedCollationStrategy, "dimSumCollationStrategy");
      else
        +[SBHLocalizedIndexedCollationStrategy defaultCollationStrategy](SBHLocalizedIndexedCollationStrategy, "defaultCollationStrategy");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    objc_msgSend(v28, "sectionTitles");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = v27;
  v29 = objc_msgSend(v27, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3868], "pointerArrayWithOptions:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setCount:", v29);
  if (v47)
  {
    objc_msgSend(v30, "addObject:", SBHLibrarySectionIdentifierNone);
    v32 = v53;
  }
  else
  {
    v32 = v53;
    if (v29)
    {
      for (j = 0; j != v29; ++j)
      {
        SBHLibrarySectionIdentifierForSectionWithIndex(v28, j);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v34);

      }
    }
  }
  v35 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __142__SBHIconLibraryQueryResult__hydrateSnapshot_fromIcons_query_outCollationStrategy_outIconForItemIdentifier_outSortMethodology_sortComparator___block_invoke;
  aBlock[3] = &unk_1E8D8BED8;
  v36 = v14;
  v65 = v36;
  v70 = v47 == 0;
  v37 = v28;
  v66 = v37;
  v38 = v30;
  v67 = v38;
  v39 = v49;
  v68 = v39;
  v40 = v31;
  v69 = v40;
  v41 = (void (**)(_QWORD))_Block_copy(aBlock);
  v42 = v41;
  if (v37)
    dispatch_sync(MEMORY[0x1E0C80D38], v41);
  else
    v41[2](v41);
  if (a8)
  {
    v43 = v37 != 0;
    if (v55)
      v43 = 2;
    *a8 = v43;
  }
  if (v32)
  {
    objc_msgSend(v40, "allObjects");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "appendSectionsWithIdentifiers:", v44);
    v57[0] = v35;
    v57[1] = 3221225472;
    v57[2] = __142__SBHIconLibraryQueryResult__hydrateSnapshot_fromIcons_query_outCollationStrategy_outIconForItemIdentifier_outSortMethodology_sortComparator___block_invoke_2;
    v57[3] = &unk_1E8D8BF00;
    v58 = v39;
    v63 = v47 == 0;
    v59 = v37;
    v62 = v55;
    v60 = v54;
    v61 = v32;
    v45 = (void (**)(_QWORD))_Block_copy(v57);
    v46 = v45;
    if (v37)
      dispatch_sync(MEMORY[0x1E0C80D38], v45);
    else
      v45[2](v45);

  }
  if (a6)
    *a6 = objc_retainAutorelease(v37);
  if (a7)
    *a7 = objc_retainAutorelease(v13);

}

void __142__SBHIconLibraryQueryResult__hydrateSnapshot_fromIcons_query_outCollationStrategy_outIconForItemIdentifier_outSortMethodology_sortComparator___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (*(_BYTE *)(a1 + 72))
          v8 = objc_msgSend(*(id *)(a1 + 40), "sectionForObject:collationStringSelector:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), sel__sbhIconLibraryCollationString, (_QWORD)v11);
        else
          v8 = 0;
        objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v8, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v10, v9);
          objc_msgSend(*(id *)(a1 + 64), "replacePointerAtIndex:withPointer:", v8, v9);
        }
        objc_msgSend(v10, "addObject:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __142__SBHIconLibraryQueryResult__hydrateSnapshot_fromIcons_query_outCollationStrategy_outIconForItemIdentifier_outSortMethodology_sortComparator___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  char *v14;
  id obj;
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
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      v14 = sel__sbhIconLibraryCollationString;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7, v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_BYTE *)(a1 + 72))
        {
          v9 = *(void **)(a1 + 40);
          if (v9)
          {
            objc_msgSend(v9, "sortedArrayFromArray:collationStringSelector:", v8, v14);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            goto LABEL_14;
          }
          v12 = 0;
LABEL_12:
          v11 = 0;
          goto LABEL_13;
        }
        v12 = *(_QWORD *)(a1 + 64);
        if (v12)
          goto LABEL_12;
        objc_msgSend(*(id *)(a1 + 48), "comparator");
        v12 = objc_claimAutoreleasedReturnValue();
        v11 = 1;
        v1 = (void *)v12;
LABEL_13:
        objc_msgSend(v8, "sortedArrayUsingComparator:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
        objc_msgSend(v10, "bs_mapNoNulls:", &__block_literal_global_110);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        objc_msgSend(*(id *)(a1 + 56), "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v13, v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  SBHIconLibraryQueryResult *v4;
  void *v5;
  void *v6;
  void *v7;
  SBHLocalizedIndexedCollationStrategy *collationStrategy;
  void *v9;
  SBHIconLibraryQueryResult *v10;

  v4 = +[SBHIconLibraryQueryResult allocWithZone:](SBHIconLibraryQueryResult, "allocWithZone:", a3);
  v5 = (void *)-[SBHIconLibraryQuery copy](self->_query, "copy");
  v6 = (void *)-[NSSet copy](self->_icons, "copy");
  v7 = (void *)-[NSDiffableDataSourceSnapshot copy](self->_snapshot, "copy");
  collationStrategy = self->_collationStrategy;
  v9 = (void *)-[NSDictionary copy](self->_iconForItemIdentifier, "copy");
  v10 = -[SBHIconLibraryQueryResult initWithQuery:icons:snapshot:collationStrategy:iconForitemIdentifier:sortMethodology:](v4, "initWithQuery:icons:snapshot:collationStrategy:iconForitemIdentifier:sortMethodology:", v5, v6, v7, collationStrategy, v9, self->_sortMethodology);

  return v10;
}

- (NSArray)sectionIdentifiers
{
  return -[NSDiffableDataSourceSnapshot sectionIdentifiers](self->_snapshot, "sectionIdentifiers");
}

- (unint64_t)totalNumberOfItems
{
  unint64_t totalNumberOfItems;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  totalNumberOfItems = self->_totalNumberOfItems;
  if (totalNumberOfItems == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSDiffableDataSourceSnapshot sectionIdentifiers](self->_snapshot, "sectionIdentifiers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      totalNumberOfItems = 0;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          totalNumberOfItems += -[NSDiffableDataSourceSnapshot numberOfItemsInSection:](self->_snapshot, "numberOfItemsInSection:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
    else
    {
      totalNumberOfItems = 0;
    }

    self->_totalNumberOfItems = totalNumberOfItems;
  }
  return totalNumberOfItems;
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  return -[NSDiffableDataSourceSnapshot indexOfSectionIdentifier:](self->_snapshot, "indexOfSectionIdentifier:", a3);
}

- (id)itemIdentifierForIcon:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "isLeafIcon"))
  {
    objc_msgSend(v3, "sbh_iconLibraryItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)sectionIdentifierForIcon:(id)a3
{
  id v4;
  SBHIconLibraryQuery *query;
  SBHLocalizedIndexedCollationStrategy *v6;
  SBHIconLibraryQuery *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  query = self->_query;
  v6 = self->_collationStrategy;
  v7 = query;
  -[SBHIconLibraryQuery searchString](v7, "searchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = (id)SBHLibrarySectionIdentifierNone;
  }
  else
  {
    -[SBHLocalizedIndexedCollationStrategy sectionTitles](v6, "sectionTitles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBHLocalizedIndexedCollationStrategy sectionForObject:collationStringSelector:](v6, "sectionForObject:collationStringSelector:", v4, sel__sbhIconLibraryCollationString);
    if (v12 >= objc_msgSend(v11, "count"))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v11, "objectAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconLibraryQuery searchString](v7, "searchString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v15)
      {
        v16 = (id)SBHLibrarySectionIdentifierNone;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("section-(%lu)-%@-indexable"), v12, v13);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v16;

    }
  }

  return v10;
}

- (id)iconForItemIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_iconForItemIdentifier, "objectForKeyedSubscript:", a3);
}

- (id)titleForSectionIdentifier:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", SBHLibrarySectionIdentifierNone) & 1) != 0)
  {
    v5 = &stru_1E8D8E958;
  }
  else
  {
    -[SBHLocalizedIndexedCollationStrategy sectionTitles](self->_collationStrategy, "sectionTitles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = objc_msgSend(v7, "rangeOfString:options:range:", CFSTR(")"), 0, 9, objc_msgSend(v7, "length") - 9);
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "substringWithRange:", 9, v8 + v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "integerValue");

    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSArray)sectionIndexTitles
{
  return -[SBHLocalizedIndexedCollationStrategy sectionIndexTitles](self->_collationStrategy, "sectionIndexTitles");
}

- (int64_t)indexOfSectionForSectionIndexTitleAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;

  SBHLibrarySectionIdentifierForSectionWithIndex(self->_collationStrategy, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryQueryResult snapshot](self, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "containsObject:", v5))
  {
    v8 = v5;
  }
  else
  {
    -[SBHIconLibraryQueryResult _firstExtantSectionWithCollationIndexGreaterThan:](self, "_firstExtantSectionWithCollationIndexGreaterThan:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v7, "indexOfObject:", v8);
  else
    v10 = objc_msgSend(v7, "count") - 1;

  return v10;
}

- (id)_firstExtantSectionWithCollationIndexGreaterThan:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  -[SBHIconLibraryQueryResult snapshot](self, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHLocalizedIndexedCollationStrategy sectionIndexTitles](self->_collationStrategy, "sectionIndexTitles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = a3 + 1;
  if (v9 >= v8)
  {
LABEL_4:
    v10 = 0;
  }
  else
  {
    while (1)
    {
      SBHLibrarySectionIdentifierForSectionWithIndex(self->_collationStrategy, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "containsObject:", v10) & 1) != 0)
        break;

      if (v8 == ++v9)
        goto LABEL_4;
    }
  }

  return v10;
}

- (id)indexPathForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  -[SBHIconLibraryQueryResult sectionIdentifierForIcon:](self, "sectionIdentifierForIcon:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBHIconLibraryQueryResult itemIdentifierForIcon:](self, "itemIdentifierForIcon:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBHIconLibraryQueryResult indexOfSectionIdentifier:](self, "indexOfSectionIdentifier:", v5);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      v9 = v7;
      -[SBHIconLibraryQueryResult snapshot](self, "snapshot");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemIdentifiersInSectionWithIdentifier:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "indexOfObject:", v6);

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v12, v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sectionIdentifierAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SBHIconLibraryQueryResult sectionIdentifiers](self, "sectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)iconAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SBHIconLibraryQueryResult sectionIdentifierAtIndex:](self, "sectionIdentifierAtIndex:", objc_msgSend(v4, "indexAtPosition:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBHIconLibraryQueryResult snapshot](self, "snapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemIdentifiersInSectionWithIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (v8 = objc_msgSend(v4, "indexAtPosition:", 1), v8 == 0x7FFFFFFFFFFFFFFFLL)
      || (v9 = v8, v8 >= objc_msgSend(v7, "count")))
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconLibraryQueryResult iconForItemIdentifier:](self, "iconForItemIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)titleForSectionAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[SBHIconLibraryQueryResult sectionIdentifiers](self, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconLibraryQueryResult titleForSectionIdentifier:](self, "titleForSectionIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)iconsForSectionAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[SBHIconLibraryQueryResult sectionIdentifierAtIndex:](self, "sectionIdentifierAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryQueryResult snapshot](self, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifiersInSectionWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__SBHIconLibraryQueryResult_iconsForSectionAtIndex___block_invoke;
  v9[3] = &unk_1E8D890F8;
  v9[4] = self;
  objc_msgSend(v6, "bs_mapNoNulls:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __52__SBHIconLibraryQueryResult_iconsForSectionAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "iconForItemIdentifier:", a2);
}

- (SBHIconLibraryQuery)query
{
  return self->_query;
}

- (NSSet)icons
{
  return self->_icons;
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)sortMethodology
{
  return self->_sortMethodology;
}

- (SBHLocalizedIndexedCollationStrategy)collationStrategy
{
  return self->_collationStrategy;
}

- (void)setCollationStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_collationStrategy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collationStrategy, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_iconForItemIdentifier, 0);
}

@end
