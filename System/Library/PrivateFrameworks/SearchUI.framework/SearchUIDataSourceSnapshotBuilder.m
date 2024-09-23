@implementation SearchUIDataSourceSnapshotBuilder

- (SearchUIDataSourceSnapshotBuilder)initWithExpandedSections:(id)a3 expandedCollectionSections:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SearchUIDataSourceSnapshotBuilder *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = -[SearchUIDataSourceSnapshotBuilder initWithExpandedSections:expandedCollectionSections:rowModelIdentifiers:sectionModelIdentifiers:](self, "initWithExpandedSections:expandedCollectionSections:rowModelIdentifiers:sectionModelIdentifiers:", v7, v6, v8, v9);

  return v10;
}

- (SearchUIDataSourceSnapshotBuilder)initWithExpandedSections:(id)a3 expandedCollectionSections:(id)a4 rowModelIdentifiers:(id)a5 sectionModelIdentifiers:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SearchUIDataSourceSnapshotBuilder *v15;
  SearchUIDataSourceSnapshotBuilder *v16;
  uint64_t v17;
  NSMutableSet *rowModelIdentifiers;
  uint64_t v19;
  NSMutableSet *sectionModelIdentifiers;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SearchUIDataSourceSnapshotBuilder;
  v15 = -[SearchUIDataSourceSnapshotBuilder init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_expandedSections, a3);
    objc_storeStrong((id *)&v16->_expandedCollectionSections, a4);
    v17 = objc_msgSend(v13, "mutableCopy");
    rowModelIdentifiers = v16->_rowModelIdentifiers;
    v16->_rowModelIdentifiers = (NSMutableSet *)v17;

    v19 = objc_msgSend(v14, "mutableCopy");
    sectionModelIdentifiers = v16->_sectionModelIdentifiers;
    v16->_sectionModelIdentifiers = (NSMutableSet *)v19;

  }
  return v16;
}

- (id)buildRowModelsFromResultSections:(id)a3 queryId:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  __objc2_class **v28;
  SearchUIMultiResultRowModel *v29;
  void *v30;
  SearchUIMultiResultRowModel *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  SearchUIScreenTimeResultsRowModel *v43;
  uint64_t v44;
  void *v45;
  id obj;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  SearchUIDataSourceSnapshotBuilder *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v49 = (void *)objc_opt_new();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v5;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v50)
  {
    v48 = *(_QWORD *)v62;
    v53 = self;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v62 != v48)
          objc_enumerationMutation(obj);
        v51 = v6;
        v7 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v6);
        v54 = (void *)objc_opt_new();
        objc_msgSend(v7, "results");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9)
        {
          v10 = 0;
          do
          {
            objc_msgSend(v7, "results");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "count") - v10;

            if (objc_msgSend(v7, "maxInitiallyVisibleResults"))
            {
              -[SearchUIDataSourceSnapshotBuilder expandedSections](self, "expandedSections");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v13, "containsObject:", v7) & 1) == 0)
              {
                v14 = objc_msgSend(v7, "maxInitiallyVisibleResults");
                if (v12 >= (unint64_t)(v14 - v10))
                  v12 = v14 - v10;
              }

            }
            if (v12 < 1)
              break;
            objc_msgSend(v7, "results");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndexedSubscript:", v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = (void *)objc_opt_new();
            -[SearchUIDataSourceSnapshotBuilder resultsForMultiResultRowInSection:startingAtIndex:](self, "resultsForMultiResultRowInSection:startingAtIndex:", v7, v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = v18;
              v20 = objc_msgSend(v18, "count");
              if (v20 >= v12)
                v21 = v12;
              else
                v21 = v20;
              objc_msgSend(v19, "subarrayWithRange:", 0, v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (-[SearchUIDataSourceSnapshotBuilder resultHasHorizontallyGroupedCardSections:](self, "resultHasHorizontallyGroupedCardSections:", v16))
              {
                objc_msgSend(v22, "firstObject");
                v55 = v10;
                v23 = objc_claimAutoreleasedReturnValue();
                +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v24, "firstObject");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                LOBYTE(v23) = objc_opt_isKindOfClass();

                -[SearchUIDataSourceSnapshotBuilder generateItemIdentifier:cardSection:](self, "generateItemIdentifier:cardSection:", v16, 0);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = (v23 & 1) == 0;
                v10 = v55;
                v28 = off_1EA1F4D40;
                if (v27)
                  v28 = off_1EA1F4D08;
                v29 = (SearchUIMultiResultRowModel *)objc_msgSend(objc_alloc(*v28), "initWithResults:itemIdentifier:builder:", v22, v26, self);

              }
              else
              {
                v31 = [SearchUIMultiResultRowModel alloc];
                -[SearchUIDataSourceSnapshotBuilder generateComposedItemIdentifierForResults:](self, "generateComposedItemIdentifierForResults:", v22);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = -[SearchUIMultiResultRowModel initWithResults:itemIdentifier:](v31, "initWithResults:itemIdentifier:", v22, v24);
              }

              objc_msgSend(v17, "addObject:", v29);
              v56 = v10 + objc_msgSend(v22, "count") - 1;
            }
            else
            {
              if (+[SearchUIUtilities resultBlockedForScreenTime:](SearchUIUtilities, "resultBlockedForScreenTime:", v16)&& !objc_msgSend(v16, "isLocalApplicationResult"))
              {
                -[SearchUIDataSourceSnapshotBuilder generateItemIdentifier:cardSection:](self, "generateItemIdentifier:cardSection:", v16, 0);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = -[SearchUIScreenTimeResultsRowModel initWithSection:result:itemIdentifier:]([SearchUIScreenTimeResultsRowModel alloc], "initWithSection:result:itemIdentifier:", v7, v16, v42);
                objc_msgSend(v54, "addObject:", v43);

                break;
              }
              v56 = v10;
              +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v16);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromCardSections:result:isInline:queryId:](self, "buildRowModelsFromCardSections:result:isInline:queryId:", v22, v16, 1, a4);
              v29 = (SearchUIMultiResultRowModel *)objc_claimAutoreleasedReturnValue();
              -[SearchUIDataSourceSnapshotBuilder buildCombinedRowModelsFromRowModels:result:](self, "buildCombinedRowModelsFromRowModels:result:", v29, v16);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObjectsFromArray:", v30);

            }
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v32 = v17;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v58;
              do
              {
                v36 = 0;
                do
                {
                  if (*(_QWORD *)v58 != v35)
                    objc_enumerationMutation(v32);
                  v37 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v36);
                  objc_msgSend(v16, "sectionBundleIdentifier");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v38, "isEqual:", CFSTR("com.apple.spotlight.tophits")))
                  {
                    objc_msgSend(v37, "setIsTopHit:", 1);
                  }
                  else
                  {
                    objc_msgSend(v7, "bundleIdentifier");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "setIsTopHit:", objc_msgSend(v39, "isEqual:", CFSTR("com.apple.spotlight.tophits")));

                  }
                  ++v36;
                }
                while (v34 != v36);
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
              }
              while (v34);
            }

            objc_msgSend(v54, "addObjectsFromArray:", v32);
            v10 = v56 + 1;
            objc_msgSend(v7, "results");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "count");

            self = v53;
          }
          while (v56 + 1 < v41);
        }
        objc_msgSend(v49, "addObject:", v54);

        v6 = v51 + 1;
      }
      while (v51 + 1 != v50);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      v50 = v44;
    }
    while (v44);
  }

  v45 = (void *)objc_msgSend(v49, "copy");
  return v45;
}

- (id)resultsForMultiResultRowInSection:(id)a3 startingAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  unint64_t v17;

  v6 = a3;
  objc_msgSend(v6, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SearchUIDataSourceSnapshotBuilder resultHasHorizontallyGroupedCardSections:](self, "resultHasHorizontallyGroupedCardSections:", v8);

  objc_msgSend(v6, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 <= a4)
  {
    v12 = 0;
  }
  else
  {
    v12 = 0;
    while (1)
    {
      objc_msgSend(v6, "results");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = -[SearchUIDataSourceSnapshotBuilder resultHasHorizontallyGroupedCardSections:](self, "resultHasHorizontallyGroupedCardSections:", v14);
      if (!objc_msgSend(v14, "renderHorizontallyWithOtherResultsInCategory") || ((v9 ^ v15) & 1) != 0)
        break;
      if (!v12)
        v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "addObject:", v14);

      ++a4;
      objc_msgSend(v6, "results");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (a4 >= v17)
        goto LABEL_11;
    }

  }
LABEL_11:

  return v12;
}

- (BOOL)resultHasHorizontallyGroupedCardSections:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = objc_msgSend(v3, "renderHorizontallyWithOtherResultsInCategory");
  else
    v5 = 0;

  return v5;
}

- (id)generateComposedItemIdentifierForResults:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = CFSTR("c");
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        -[SearchUIDataSourceSnapshotBuilder generateItemIdentifier:cardSection:](self, "generateItemIdentifier:cardSection:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIDataSourceSnapshotBuilder rowModelIdentifiers](self, "rowModelIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObject:", v11);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v8;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v8 = CFSTR("c");
  }
  -[SearchUIDataSourceSnapshotBuilder rowModelIdentifiers](self, "rowModelIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDataSourceSnapshotBuilder generateIterativeIdentifierForBaseIdentifier:withUnavailableIdentifiers:](self, "generateIterativeIdentifierForBaseIdentifier:withUnavailableIdentifiers:", v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSMutableSet)rowModelIdentifiers
{
  return self->_rowModelIdentifiers;
}

- (id)generateItemIdentifier:(id)a3 cardSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "requestedTopic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v7, "cardSectionId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v6, "identifier");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v14;

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDataSourceSnapshotBuilder rowModelIdentifiers](self, "rowModelIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDataSourceSnapshotBuilder generateIterativeIdentifierForBaseIdentifier:withUnavailableIdentifiers:](self, "generateIterativeIdentifierForBaseIdentifier:withUnavailableIdentifiers:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)generateIterativeIdentifierForBaseIdentifier:(id)a3 withUnavailableIdentifiers:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = 0;
  v9 = v7;
  if (!v7)
    goto LABEL_3;
  while ((objc_msgSend(v6, "containsObject:", v9) & 1) != 0)
  {
    do
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld"), v7, v8);
      v10 = objc_claimAutoreleasedReturnValue();

      ++v8;
      v9 = (void *)v10;
    }
    while (!v10);
  }
  objc_msgSend(v6, "addObject:", v9);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionModelIdentifiers, 0);
  objc_storeStrong((id *)&self->_rowModelIdentifiers, 0);
  objc_storeStrong((id *)&self->_expandedCollectionSections, 0);
  objc_storeStrong((id *)&self->_expandedSections, 0);
}

- (id)buildSnapshotFromTableModel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = a3;
  objc_msgSend(v22, "tableRowModel");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v25;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v25 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
              -[SearchUIDataSourceSnapshotBuilder rowModelIdentifiers](self, "rowModelIdentifiers");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "itemIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v16);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v5);
  }

  objc_msgSend(v22, "tableRowModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDataSourceSnapshotBuilder buildSectionsFromRowModels:fromSections:](self, "buildSectionsFromRowModels:fromSections:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIDataSourceSnapshotBuilder buildSnapshotForSectionModels:](self, "buildSnapshotForSectionModels:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)buildSnapshotForSectionModels:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  unint64_t v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _QWORD v74[4];

  v74[2] = *MEMORY[0x1E0C80C00];
  v43 = a3;
  +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v3;
  +[SearchUIScreenTimeManager sharedInstance](SearchUIScreenTimeManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "arrayByAddingObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v7;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v44)
  {
    v42 = *(_QWORD *)v66;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v66 != v42)
          objc_enumerationMutation(obj);
        v45 = v8;
        v9 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v47 = v43;
        v11 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v62 != v13)
                objc_enumerationMutation(v47);
              v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
              v57 = 0u;
              v58 = 0u;
              v59 = 0u;
              v60 = 0u;
              objc_msgSend(v15, "rowModels");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v58;
                do
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v58 != v19)
                      objc_enumerationMutation(v16);
                    objc_msgSend(v9, "itemsToBatchPreFetchForRowModel:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v21, "count"))
                      objc_msgSend(v10, "addObjectsFromArray:", v21);

                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
                }
                while (v18);
              }

            }
            v12 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
          }
          while (v12);
        }

        if (objc_msgSend(v10, "count"))
        {
          objc_msgSend(v9, "cacheToPrewarm");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "allObjects");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "getObjectsForKeys:completionHandler:", v23, &__block_literal_global_39);

        }
        v8 = v45 + 1;
      }
      while (v45 + 1 != v44);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v44);
  }

  v46 = (void *)objc_opt_new();
  v24 = (void *)objc_opt_new();
  v25 = (void *)objc_opt_new();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v48 = v43;
  v26 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v54 != v28)
          objc_enumerationMutation(v48);
        v30 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
        objc_msgSend(v24, "addObject:", v30);
        objc_msgSend(v30, "prepareForSnapshot");
        v31 = (void *)objc_opt_new();
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(v30, "rowModels");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v50;
          do
          {
            for (m = 0; m != v34; ++m)
            {
              if (*(_QWORD *)v50 != v35)
                objc_enumerationMutation(v32);
              objc_msgSend(v31, "addObject:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * m));
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
          }
          while (v34);
        }

        objc_msgSend(v25, "addObject:", v31);
      }
      v27 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
    }
    while (v27);
  }

  objc_msgSend(v46, "appendSectionsWithIdentifiers:", v24);
  if (objc_msgSend(v24, "count"))
  {
    v37 = 0;
    do
    {
      objc_msgSend(v25, "objectAtIndexedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v38, v39);

      ++v37;
    }
    while (v37 < objc_msgSend(v24, "count"));
  }

  return v46;
}

- (id)buildSectionsFromRowModels:(id)a3 fromSections:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIDataSourceSnapshotBuilder buildSectionsFromRowModels:fromSection:](self, "buildSectionsFromRowModels:fromSection:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v12);

      ++v9;
    }
    while (v9 < objc_msgSend(v6, "count"));
  }
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

- (id)buildSectionsFromRowModels:(id)a3 fromSection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SearchUILeadingTrailingSectionModel *v24;
  id v25;
  SearchUIHorizontallyScrollingCardSectionRowModel *v26;
  void *v27;
  void *v28;
  SearchUILeadingTrailingSectionModel *v29;
  void *v30;
  SearchUILeadingTrailingSectionModel *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  SearchUILeadingTrailingSectionModel *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  SearchUILeadingTrailingSectionModel *v44;
  int v45;
  void *v46;
  void *v47;
  char isKindOfClass;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  SearchUILeadingTrailingSectionModel *v61;
  void *v62;
  void *v63;
  void *v64;
  SearchUILeadingTrailingSectionModel *v65;
  void *v66;
  uint64_t v67;
  id v68;
  id v70;
  void (**v71)(_QWORD);
  id v72;
  id v73;
  void (**v74)(void);
  SearchUIDataSourceSnapshotBuilder *v75;
  uint64_t v76;
  id obj;
  void (**v78)(void *, SearchUILeadingTrailingSectionModel *);
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  id v88;
  id v89;
  _QWORD v90[4];
  id v91;
  id v92;
  SearchUIDataSourceSnapshotBuilder *v93;
  void (**v94)(void);
  _QWORD aBlock[5];
  id v96;
  id v97;
  void *v98;
  uint64_t v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke;
  aBlock[3] = &unk_1EA1F8868;
  aBlock[4] = self;
  v9 = v7;
  v96 = v9;
  v10 = _Block_copy(aBlock);
  v11 = (void *)objc_opt_new();
  v90[0] = v8;
  v90[1] = 3221225472;
  v90[2] = __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke_2;
  v90[3] = &unk_1EA1F8890;
  v72 = (id)objc_opt_new();
  v91 = v72;
  v12 = v11;
  v92 = v12;
  v93 = self;
  v74 = v10;
  v94 = v74;
  v87[0] = v8;
  v87[1] = 3221225472;
  v87[2] = __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke_3;
  v87[3] = &unk_1EA1F88B8;
  v71 = _Block_copy(v90);
  v89 = v71;
  v70 = v12;
  v88 = v70;
  v78 = (void (**)(void *, SearchUILeadingTrailingSectionModel *))_Block_copy(v87);
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v6;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
  if (v80)
  {
    v13 = *(_QWORD *)v84;
    v75 = self;
    v76 = *(_QWORD *)v84;
    v73 = v9;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v84 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v14);
        objc_msgSend(v15, "cardSection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "queryId");
        objc_msgSend(v15, "identifyingResult");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v16;
          objc_msgSend(v19, "cardSections");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromCardSections:result:isInline:queryId:](self, "buildRowModelsFromCardSections:result:isInline:queryId:", v20, v18, 1, v17);
          v79 = objc_claimAutoreleasedReturnValue();

          -[SearchUIDataSourceSnapshotBuilder buildUISectionFromResultSection:collectionSection:](self, "buildUISectionFromResultSection:collectionSection:", v9, v19);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "cardSections");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v18;
          if (objc_msgSend(v21, "count") == 2)
          {
            objc_msgSend(v19, "cardSections");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad"))
              {

                goto LABEL_26;
              }
              v45 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");

              self = v75;
              if (v45)
              {
LABEL_26:
                v35 = (void *)objc_opt_new();
                objc_msgSend(v19, "cardSections");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                objc_msgSend(v19, "cardSections");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
                v50 = objc_claimAutoreleasedReturnValue();
                v51 = (void *)v50;
                if ((isKindOfClass & 1) != 0)
                {

                  objc_msgSend(v51, "cardSections");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = (void *)objc_msgSend(v52, "copy");
                  v54 = 0x1E0C99000;
                }
                else
                {
                  v99 = v50;
                  v54 = 0x1E0C99000uLL;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = v51;
                  v51 = v49;
                }
                objc_msgSend(v35, "setLeadingCardSections:", v53);

                objc_msgSend(v19, "cardSections");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "objectAtIndexedSubscript:", 1);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v98 = v63;
                objc_msgSend(*(id *)(v54 + 3360), "arrayWithObjects:count:", &v98, 1);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "setTrailingCardSections:", v64);

                v38 = -[SearchUILeadingTrailingSectionModel initWithCardSection:rowModels:result:queryId:section:]([SearchUILeadingTrailingSectionModel alloc], "initWithCardSection:rowModels:result:queryId:section:", v35, obj, v81, v17, v82);
                v78[2](v78, v38);
                v9 = v73;
                self = v75;
                v13 = v76;
                v36 = (void *)v79;
LABEL_33:

                v18 = v81;
                goto LABEL_34;
              }
LABEL_18:
              objc_msgSend(v19, "collectionStyle");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v32;
              if (v32)
                v34 = v32;
              else
                v34 = (id)objc_opt_new();
              v35 = v34;
              v36 = (void *)v79;

              -[SearchUIDataSourceSnapshotBuilder expandedCollectionSections](self, "expandedCollectionSections");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "searchUISectionModelForCardRowModels:section:expandedCollectionSections:", v79, v82, v37);
              v38 = (SearchUILeadingTrailingSectionModel *)objc_claimAutoreleasedReturnValue();

              if (v38)
                v78[2](v78, v38);
              goto LABEL_33;
            }

            self = v75;
          }

          goto LABEL_18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[SearchUIDataSourceSnapshotBuilder generateItemIdentifier:cardSection:](self, "generateItemIdentifier:cardSection:", v18, v16);
          v24 = (SearchUILeadingTrailingSectionModel *)objc_claimAutoreleasedReturnValue();
          v25 = v16;
          v26 = -[SearchUIHorizontallyScrollingCardSectionRowModel initWithResult:cardSection:queryId:itemIdentifier:builder:]([SearchUIHorizontallyScrollingCardSectionRowModel alloc], "initWithResult:cardSection:queryId:itemIdentifier:builder:", v18, v25, v17, v24, self);

          -[SearchUIDataSourceSnapshotBuilder buildUISectionFromResultSection:collectionSection:](self, "buildUISectionFromResultSection:collectionSection:", v9, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIHorizontallyScrollingCardSectionRowModel cardSectionRowModels](v26, "cardSectionRowModels");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[SearchUISectionModel sectionModelWithScrollingRowModels:numberOfRows:section:](SearchUISectionModel, "sectionModelWithScrollingRowModels:numberOfRows:section:", v28, -[SearchUIHorizontallyScrollingCardSectionRowModel numberOfRows](v26, "numberOfRows"), v27);
          v29 = (SearchUILeadingTrailingSectionModel *)objc_claimAutoreleasedReturnValue();
          v78[2](v78, v29);

          v13 = v76;
LABEL_15:

          goto LABEL_34;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "cardSectionRowModels");
          v24 = (SearchUILeadingTrailingSectionModel *)objc_claimAutoreleasedReturnValue();
          v74[2]();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[SearchUISectionModel sectionModelWithGridRowModels:numberOfColumns:gridStyle:section:expandedCollectionSections:](SearchUISectionModel, "sectionModelWithGridRowModels:numberOfColumns:gridStyle:section:expandedCollectionSections:", v24, 0, 0, v30, 0);
          v31 = (SearchUILeadingTrailingSectionModel *)objc_claimAutoreleasedReturnValue();
          v78[2](v78, v31);

          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v39 = v15;
          objc_msgSend(v39, "cardSectionRowModels");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v39, "numberOfRows");
          v74[2]();
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          v43 = v41;
          v13 = v76;
          +[SearchUISectionModel sectionModelWithScrollingRowModels:numberOfRows:section:](SearchUISectionModel, "sectionModelWithScrollingRowModels:numberOfRows:section:", v40, v43, v42);
          v44 = (SearchUILeadingTrailingSectionModel *)objc_claimAutoreleasedReturnValue();
          v78[2](v78, v44);

LABEL_30:
          goto LABEL_34;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v40 = (void *)objc_opt_new();
          v55 = (void *)MEMORY[0x1E0D8C660];
          v56 = v15;
          objc_msgSend(v16, "sectionTitle");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "textWithString:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setTitle:", v58);

          v97 = v56;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIDataSourceSnapshotBuilder buildUISectionFromResultSection:collectionSection:](self, "buildUISectionFromResultSection:collectionSection:", v9, v40);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          +[SearchUISectionModel sectionModelWithScrollingRowModels:numberOfRows:section:](SearchUISectionModel, "sectionModelWithScrollingRowModels:numberOfRows:section:", v59, 1, v60);
          v61 = (SearchUILeadingTrailingSectionModel *)objc_claimAutoreleasedReturnValue();
          v78[2](v78, v61);

          v13 = v76;
          goto LABEL_30;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v65 = [SearchUILeadingTrailingSectionModel alloc];
          v74[2]();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[SearchUILeadingTrailingSectionModel initWithCardSection:rowModels:result:queryId:section:](v65, "initWithCardSection:rowModels:result:queryId:section:", v16, MEMORY[0x1E0C9AA60], v18, v17, v66);

          v78[2](v78, v24);
          goto LABEL_15;
        }
        objc_msgSend(v72, "addObject:", v15);
LABEL_34:

        ++v14;
      }
      while (v80 != v14);
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
      v80 = v67;
    }
    while (v67);
  }

  v71[2](v71);
  v68 = v70;

  return v68;
}

uint64_t __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    v4 = *(void **)(a1 + 40);
    v3 = *(void **)(a1 + 48);
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "buildSectionFromRowModels:section:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fm_safeAddObject:", v7);

    return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  }
  return result;
}

uint64_t __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "buildUISectionFromResultSection:collectionSection:", *(_QWORD *)(a1 + 40), 0);
}

- (id)buildUISectionFromResultSection:(id)a3 collectionSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[SearchUIDataSourceSnapshotBuilder generateSectionIdentifier:collectionSection:](self, "generateSectionIdentifier:collectionSection:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUISection sectionWithResultSection:collectionCardSection:sectionIdentifier:](SearchUISection, "sectionWithResultSection:collectionCardSection:sectionIdentifier:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)generateSectionIdentifier:(id)a3 collectionSection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "cardSectionId");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("unknown");
    if (v10)
      v12 = (__CFString *)v10;
    v9 = v12;

  }
  -[SearchUIDataSourceSnapshotBuilder sectionModelIdentifiers](self, "sectionModelIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDataSourceSnapshotBuilder generateIterativeIdentifierForBaseIdentifier:withUnavailableIdentifiers:](self, "generateIterativeIdentifierForBaseIdentifier:withUnavailableIdentifiers:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSMutableSet)sectionModelIdentifiers
{
  return self->_sectionModelIdentifiers;
}

- (id)buildSectionFromRowModels:(id)a3 section:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[SearchUIDataSourceSnapshotBuilder expandedCollectionSections](self, "expandedCollectionSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUISectionModel sectionModelWithRows:drawPlattersIfNecessary:section:expandedCollectionSections:](SearchUISectionModel, "sectionModelWithRows:drawPlattersIfNecessary:section:expandedCollectionSections:", v6, 1, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSSet)expandedCollectionSections
{
  return self->_expandedCollectionSections;
}

- (SearchUIDataSourceSnapshotBuilder)init
{
  void *v3;
  void *v4;
  SearchUIDataSourceSnapshotBuilder *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[SearchUIDataSourceSnapshotBuilder initWithExpandedSections:expandedCollectionSections:](self, "initWithExpandedSections:expandedCollectionSections:", v3, v4);

  return v5;
}

- (SearchUIDataSourceSnapshotBuilder)initWithSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SearchUIDataSourceSnapshotBuilder *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v4, "itemIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11), "itemIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v9);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v4, "sectionIdentifiers", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v17), "section");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sectionIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v15);
  }

  v20 = (void *)objc_opt_new();
  v21 = (void *)objc_opt_new();
  v22 = (void *)objc_msgSend(v5, "copy");
  v23 = (void *)objc_msgSend(v6, "copy");
  v24 = -[SearchUIDataSourceSnapshotBuilder initWithExpandedSections:expandedCollectionSections:rowModelIdentifiers:sectionModelIdentifiers:](self, "initWithExpandedSections:expandedCollectionSections:rowModelIdentifiers:sectionModelIdentifiers:", v20, v21, v22, v23);

  return v24;
}

- (id)buildSnapshotFromResultSections:(id)a3 queryId:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[SearchUIDataSourceSnapshotBuilder buildSectionsFromResultSections:queryId:](self, "buildSectionsFromResultSections:queryId:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDataSourceSnapshotBuilder buildSnapshotForSectionModels:](self, "buildSnapshotForSectionModels:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)buildSectionsFromResultSections:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromResultSections:queryId:](self, "buildRowModelsFromResultSections:queryId:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDataSourceSnapshotBuilder buildSectionsFromRowModels:fromSections:](self, "buildSectionsFromRowModels:fromSections:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __76__SearchUIDataSourceSnapshotBuilder_buildSectionsFromRowModels_fromSection___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (id)buildRowModelsFromSectionModels:(id)a3
{
  id v3;
  void *v4;
  id v5;
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
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "rowModels", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)buildRowModelsFromResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromCardSections:result:isInline:queryId:](self, "buildRowModelsFromCardSections:result:isInline:queryId:", v5, v4, objc_msgSend(v5, "count") != 0, objc_msgSend(v4, "queryId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)buildRowModelFromCardSection:(id)a3 result:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v13 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromCardSections:result:isInline:queryId:](self, "buildRowModelsFromCardSections:result:isInline:queryId:", v9, v7, 0, objc_msgSend(v7, "queryId", v13, v14));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)buildRowModelsFromCardSections:(id)a3 result:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6
{
  id v8;
  id v9;
  void *v10;
  SearchUIDetailedRowModel *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __objc2_class **v15;
  uint64_t v16;
  void *v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  SearchUIGridRowModel *v21;
  void *v22;
  SearchUIGridRowModel *v23;
  SearchUIImageGridRowModel *v24;
  SearchUIWatchListCardRowModel *v25;
  void *v26;
  SearchUIWatchListCardRowModel *v27;
  __objc2_class *v28;
  id v29;
  id v30;
  void (**v31)(_QWORD, id, id);
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  uint64_t v48;
  SearchUIDataSourceSnapshotBuilder *v49;
  void (**v50)(_QWORD, id, id);
  SearchUIArchivedRowModel *v51;
  void *v52;
  SearchUIArchivedRowModel *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  SearchUIDetailedRowModel *v58;
  id v59;
  SearchUIImageGridRowModel *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  SearchUICombinedCardSectionRowModel *v65;
  void *v66;
  SearchUICombinedCardSectionRowModel *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  SearchUIRFCardSectionRowModelProvider *v72;
  char v73;
  void *v74;
  void *v75;
  void (**v76)(_QWORD, id, id);
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  void *v83;
  id obj;
  id v85;
  id v86;
  _QWORD v88[5];
  id v89;
  id v90;
  unint64_t v91;
  BOOL v92;
  _QWORD aBlock[5];
  id v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  uint64_t v101;

  v82 = a5;
  v101 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v85 = (id)objc_opt_new();
  -[SearchUIDataSourceSnapshotBuilder gridLayoutsForCardSections:](self, "gridLayoutsForCardSections:", v8);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDataSourceSnapshotBuilder asyncRowManagersForCardSections:](self, "asyncRowManagersForCardSections:", v8);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[SearchUIRFCardSectionRowModelProvider initWithCardSections:]([SearchUIRFCardSectionRowModelProvider alloc], "initWithCardSections:", v8);
  if (!v8 && v9)
  {
    -[SearchUIDataSourceSnapshotBuilder generateItemIdentifier:cardSection:](self, "generateItemIdentifier:cardSection:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SearchUIDetailedRowModel initWithResult:cardSection:isInline:queryId:itemIdentifier:]([SearchUIDetailedRowModel alloc], "initWithResult:cardSection:isInline:queryId:itemIdentifier:", v9, 0, 0, objc_msgSend(v9, "queryId"), v10);
    objc_msgSend(v85, "addObject:", v11);

  }
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v97;
    v15 = off_1EA1F5000;
    v86 = v9;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v97 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v16);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __92__SearchUIDataSourceSnapshotBuilder_buildRowModelsFromCardSections_result_isInline_queryId___block_invoke;
        aBlock[3] = &unk_1EA1F88E0;
        aBlock[4] = self;
        v18 = v9;
        v94 = v18;
        v95 = v17;
        v19 = (void (**)(_QWORD))_Block_copy(aBlock);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v83, "objectForKey:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = [SearchUIGridRowModel alloc];
          v19[2](v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[SearchUIGridRowModel initWithResult:cardSection:gridLayoutManager:queryId:itemIdentifier:](v21, "initWithResult:cardSection:gridLayoutManager:queryId:itemIdentifier:", v18, v17, v20, a6, v22);

          if (!-[SearchUIGridRowModel shouldHide](v23, "shouldHide"))
            objc_msgSend(v85, "addObject:", v23);

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v81, "objectForKey:", v17);
          v24 = (SearchUIImageGridRowModel *)objc_claimAutoreleasedReturnValue();
          v25 = [SearchUIWatchListCardRowModel alloc];
          v19[2](v19);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[SearchUIWatchListCardRowModel initWithResult:cardSection:asyncRowManager:queryId:itemIdentifier:](v25, "initWithResult:cardSection:asyncRowManager:queryId:itemIdentifier:", v18, v17, v24, a6, v26);

          v9 = v86;
          objc_msgSend(v85, "addObject:", v27);

          goto LABEL_53;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = SearchUICommandRowModel;
          goto LABEL_51;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v78 = MEMORY[0x1DF0A856C]();
          v88[0] = MEMORY[0x1E0C809B0];
          v88[1] = 3221225472;
          v88[2] = __92__SearchUIDataSourceSnapshotBuilder_buildRowModelsFromCardSections_result_isInline_queryId___block_invoke_2;
          v88[3] = &unk_1EA1F8908;
          v88[4] = self;
          v29 = v18;
          v92 = v82;
          v89 = v29;
          v91 = a6;
          v30 = v85;
          v90 = v30;
          v31 = (void (**)(_QWORD, id, id))_Block_copy(v88);
          v32 = v17;
          objc_opt_class();
          v80 = v29;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v33 = v29;
          else
            v33 = 0;
          v79 = v33;
          v34 = (void *)objc_opt_new();
          if (_os_feature_enabled_impl())
          {
            +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 15);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v35);

          }
          if (_os_feature_enabled_impl())
          {
            +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 25);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v36);

          }
          if (_os_feature_enabled_impl())
          {
            +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 12);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v37);

          }
          if (_os_feature_enabled_impl())
          {
            +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 17);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v38);

          }
          v77 = v34;
          if ((objc_msgSend(v32, "isTopHit", v72) & 1) != 0)
            goto LABEL_46;
          objc_msgSend(v80, "applicationBundleIdentifier");
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = (void *)v39;
          if (v39)
            v41 = (const __CFString *)v39;
          else
            v41 = &stru_1EA1FB118;
          if ((objc_msgSend(v34, "containsObject:", v41) & 1) == 0)
          {
            v76 = v31;
            objc_msgSend(v80, "resultBundleId");
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = (void *)v42;
            if (v42)
              v44 = (const __CFString *)v42;
            else
              v44 = &stru_1EA1FB118;
            if ((objc_msgSend(v34, "containsObject:", v44) & 1) == 0)
            {
              objc_msgSend(v32, "attributeSet");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "bundleID");
              v45 = objc_claimAutoreleasedReturnValue();
              v74 = (void *)v45;
              if (v45)
                v46 = (const __CFString *)v45;
              else
                v46 = &stru_1EA1FB118;
              if ((objc_msgSend(v34, "containsObject:", v46) & 1) != 0)
              {

                goto LABEL_44;
              }
              v73 = _os_feature_enabled_impl();

              v31 = v76;
              if ((v73 & 1) == 0)
              {
                v76[2](v76, v79, v32);
                v54 = (void *)v78;
                goto LABEL_59;
              }
LABEL_46:
              v47 = v30;
              v48 = v14;
              v49 = self;
              v50 = v31;
              v51 = [SearchUIArchivedRowModel alloc];
              v19[2](v19);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = -[SearchUIArchivedRowModel initWithResult:cardSection:isInline:queryId:itemIdentifier:](v51, "initWithResult:cardSection:isInline:queryId:itemIdentifier:", v80, v32, v82, a6, v52);

              if (-[SearchUIArchivedRowModel hasView](v53, "hasView"))
              {
                objc_msgSend(v47, "addObject:", v53);
                v54 = (void *)v78;
                v31 = v50;
              }
              else
              {
                v31 = v50;
                v50[2](v50, v79, v32);
                v54 = (void *)v78;
              }

              self = v49;
              v14 = v48;
LABEL_59:
              objc_msgSend(v79, "clearBackendData");

              objc_autoreleasePoolPop(v54);
LABEL_13:
              v9 = v86;
LABEL_54:
              v15 = off_1EA1F5000;
              goto LABEL_55;
            }
LABEL_44:

            v31 = v76;
          }

          goto LABEL_46;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v28 = SearchUIDetailedRowModel;
          goto LABEL_51;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v58 = [SearchUIDetailedRowModel alloc];
          v19[2](v19);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = -[SearchUIDetailedRowModel initWithResult:suggestion:queryId:itemIdentifier:](v58, "initWithResult:suggestion:queryId:itemIdentifier:", v18, v17, a6, v56);
          goto LABEL_52;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v59 = v17;
          v60 = [SearchUIImageGridRowModel alloc];
          v19[2](v19);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[SearchUIImageGridRowModel initWithResult:cardSection:isInline:queryId:itemIdentifier:builder:](v60, "initWithResult:cardSection:isInline:queryId:itemIdentifier:builder:", v18, v59, v82, a6, v61, self);

          objc_msgSend(v85, "addObject:", v24);
          goto LABEL_53;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v62 = v17;
          objc_msgSend(v62, "cardSections");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromCardSections:result:isInline:queryId:](self, "buildRowModelsFromCardSections:result:isInline:queryId:", v63, v18, 1, a6);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          v65 = [SearchUICombinedCardSectionRowModel alloc];
          v19[2](v19);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = -[SearchUICombinedCardSectionRowModel initWithResult:cardSectionRowModels:cardSection:dataSourceIdentifier:](v65, "initWithResult:cardSectionRowModels:cardSection:dataSourceIdentifier:", v18, v64, v62, v66);

          v9 = v86;
          objc_msgSend(v85, "addObject:", v67);

          v15 = off_1EA1F5000;
        }
        else
        {
          if (!-[__objc2_class supportsConfigurationForCardSection:](v15[73], "supportsConfigurationForCardSection:", v17))
          {
            v28 = SearchUICardSectionRowModel;
LABEL_51:
            v55 = [v28 alloc];
            v19[2](v19);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v55, "initWithResult:cardSection:isInline:queryId:itemIdentifier:", v18, v17, v82, a6, v56);
LABEL_52:
            v24 = (SearchUIImageGridRowModel *)v57;

            objc_msgSend(v85, "addObject:", v24);
LABEL_53:

            goto LABEL_54;
          }
          if ((-[__objc2_class shouldHideViewForCardSection:](v15[73], "shouldHideViewForCardSection:", v17) & 1) == 0)
          {
            v19[2](v19);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[SearchUIRFCardSectionRowModelProvider rowModelFor:result:isInline:queryId:itemIdentifier:](v72, "rowModelFor:result:isInline:queryId:itemIdentifier:", v17, v18, v82, a6, v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = off_1EA1F5000;
            objc_msgSend(v85, "addObject:", v69);

          }
        }
LABEL_55:

        ++v16;
      }
      while (v13 != v16);
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
      v13 = v70;
    }
    while (v70);
  }

  return v85;
}

uint64_t __92__SearchUIDataSourceSnapshotBuilder_buildRowModelsFromCardSections_result_isInline_queryId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "generateItemIdentifier:cardSection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __92__SearchUIDataSourceSnapshotBuilder_buildRowModelsFromCardSections_result_isInline_queryId___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "backendData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CA6070]);

  objc_msgSend(v6, "fallbackCardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v6, "fallbackCardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildRowModelsFromCardSections:result:isInline:queryId:", v11, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA9CB0], "resultBuilderWithResult:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v10, "buildResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "buildRowModelsFromResult:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v12;
  objc_msgSend(v12, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);

}

- (id)buildCombinedRowModelsFromRowModels:(id)a3 result:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  SearchUICombinedCardSectionRowModel *v25;
  void *v26;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = a3;
  v29 = a4;
  v30 = (id)objc_opt_new();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_22;
  v6 = 0;
  do
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "punchouts");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextCard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "command");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v7;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);
    ++v6;
    v34 = v8;
    while (v6 < objc_msgSend(v5, "count"))
    {
      v11 = v5;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cardSection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      objc_msgSend(v12, "punchouts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nextCard");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cardSection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "command");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        LODWORD(v8) = objc_msgSend(v16, "isEqual:", v8);
        v19 = 0;
        if (v10)
          goto LABEL_7;
      }
      else
      {
        v19 = objc_msgSend(v33, "isEqualToArray:", v15);
        if (v10)
        {
LABEL_7:
          v20 = objc_msgSend(v10, "isEqual:", v18);
          goto LABEL_10;
        }
      }
      v20 = 0;
LABEL_10:
      if (((isKindOfClass | v8 | v19) & 1) != 0 || v20)
      {
        objc_msgSend(v12, "cardSection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v23 = objc_opt_isKindOfClass();

        v8 = v34;
        if ((v23 & 1) != 0)
        {
          v21 = 0;
        }
        else
        {
          objc_msgSend(v32, "addObject:", v12);
          ++v6;
          v21 = 1;
        }
        v5 = v11;
      }
      else
      {
        v21 = 0;
        v5 = v11;
        v8 = v34;
      }

      if ((v21 & 1) == 0)
        break;
    }
    if ((unint64_t)objc_msgSend(v32, "count") < 2)
    {
      v26 = v31;
      objc_msgSend(v30, "addObject:", v31);
    }
    else
    {
      -[SearchUIDataSourceSnapshotBuilder generateItemIdentifier:cardSection:](self, "generateItemIdentifier:cardSection:", v29, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[SearchUICombinedCardSectionRowModel initWithResult:cardSectionRowModels:dataSourceIdentifier:]([SearchUICombinedCardSectionRowModel alloc], "initWithResult:cardSectionRowModels:dataSourceIdentifier:", v29, v32, v24);
      objc_msgSend(v30, "addObject:", v25);

      v26 = v31;
    }

  }
  while (v6 < objc_msgSend(v5, "count"));
LABEL_22:

  return v30;
}

- (id)asyncRowManagersForCardSections:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  SearchUIWatchListCardsManager *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SearchUIUtilities pointerKeyMapTable](SearchUIUtilities, "pointerKeyMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "watchListItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "watchListIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "length");

          if (v14)
          {
            objc_msgSend(v11, "watchListItem");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "watchListIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
            {
              v18 = (void *)objc_opt_new();
              objc_msgSend(v11, "watchListItem");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "watchListIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v20);

            }
            objc_msgSend(v11, "watchListItem");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "watchListIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v11);

          }
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v7);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v5, "allKeys");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(v37);
        v28 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v5, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[SearchUIWatchListCardsManager initWithWatchListIdentifier:]([SearchUIWatchListCardsManager alloc], "initWithWatchListIdentifier:", v28);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v31 = v29;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v40;
          do
          {
            for (k = 0; k != v33; ++k)
            {
              if (*(_QWORD *)v40 != v34)
                objc_enumerationMutation(v31);
              objc_msgSend(v4, "setObject:forKey:", v30, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k));
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          }
          while (v33);
        }

      }
      v25 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v25);
  }

  return v4;
}

- (id)gridLayoutsForCardSections:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  SearchUIGridLayoutManager *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SearchUIUtilities pointerKeyMapTable](SearchUIUtilities, "pointerKeyMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "tableIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_opt_new();
        if (v5 + 1 < (unint64_t)objc_msgSend(v3, "count"))
        {
          while (1)
          {
            objc_msgSend(v3, "objectAtIndexedSubscript:", v5 + 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            objc_msgSend(v3, "objectAtIndexedSubscript:", v5 + 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "tableIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v8, "isEqualToString:", v12);

            if (!v13)
              goto LABEL_11;
            objc_msgSend(v3, "objectAtIndexedSubscript:", v5 + 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v14);

            v15 = objc_msgSend(v3, "count");
            v16 = v5 + 1;
            v17 = v5 + 2;
            ++v5;
            if (v17 >= v15)
              goto LABEL_12;
          }

        }
LABEL_11:
        v16 = v5;
LABEL_12:
        v18 = -[SearchUIGridLayoutManager initWithHeaderSection:dataSections:]([SearchUIGridLayoutManager alloc], "initWithHeaderSection:dataSections:", v25, v9);
        objc_msgSend(v4, "setObject:forKey:", v18, v25);
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v19 = v9;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v27;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v27 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(v4, "setObject:forKey:", v18, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v23++));
            }
            while (v21 != v23);
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v21);
        }

      }
      else
      {
        v16 = v5;
      }
      v5 = v16 + 1;
    }
    while (v16 + 1 < (unint64_t)objc_msgSend(v3, "count"));
  }

  return v4;
}

- (NSSet)expandedSections
{
  return self->_expandedSections;
}

- (void)setExpandedSections:(id)a3
{
  objc_storeStrong((id *)&self->_expandedSections, a3);
}

- (void)setExpandedCollectionSections:(id)a3
{
  objc_storeStrong((id *)&self->_expandedCollectionSections, a3);
}

- (void)setRowModelIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_rowModelIdentifiers, a3);
}

- (void)setSectionModelIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sectionModelIdentifiers, a3);
}

@end
