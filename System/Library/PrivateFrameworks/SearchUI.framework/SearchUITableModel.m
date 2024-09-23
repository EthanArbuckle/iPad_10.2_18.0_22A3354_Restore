@implementation SearchUITableModel

- (unint64_t)queryId
{
  return self->_queryId;
}

+ (id)tableModelWithSections:(id)a3 expandedSections:(id)a4 expandedCollectionCardSections:(id)a5
{
  id v7;
  id v8;
  id v9;
  SearchUIDataSourceSnapshotBuilder *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  SearchUITableModel *v18;
  void *v19;
  void *v20;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = -[SearchUIDataSourceSnapshotBuilder initWithExpandedSections:expandedCollectionSections:]([SearchUIDataSourceSnapshotBuilder alloc], "initWithExpandedSections:expandedCollectionSections:", v9, v8);

  objc_msgSend(v7, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "results");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "queryId");
  if (!v14)
  {
    objc_msgSend(v7, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "results");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v17, "queryId");

  }
  v18 = -[SearchUITableModel initWithQueryId:]([SearchUITableModel alloc], "initWithQueryId:", v14);
  -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromResultSections:queryId:](v10, "buildRowModelsFromResultSections:queryId:", v7, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  -[SearchUITableModel setTableRowModel:](v18, "setTableRowModel:", v20);

  -[SearchUITableModel setSections:](v18, "setSections:", v7);
  return v18;
}

- (void)setTableRowModel:(id)a3
{
  objc_storeStrong((id *)&self->_tableRowModel, a3);
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (SearchUITableModel)initWithQueryId:(unint64_t)a3
{
  SearchUITableModel *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUITableModel;
  result = -[SearchUITableModel init](&v5, sel_init);
  if (result)
    result->_queryId = a3;
  return result;
}

- (void)enumerateRowModels:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void (**v19)(id, void *);

  v19 = (void (**)(id, void *))a3;
  -[SearchUITableModel tableRowModel](self, "tableRowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[SearchUITableModel tableRowModel](self, "tableRowModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        v10 = 0;
        do
        {
          -[SearchUITableModel tableRowModel](self, "tableRowModel");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v19[2](v19, v13);

          ++v10;
          -[SearchUITableModel tableRowModel](self, "tableRowModel");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

        }
        while (v10 < v16);
      }
      ++v6;
      -[SearchUITableModel tableRowModel](self, "tableRowModel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v6 < v18);
  }

}

- (NSArray)tableRowModel
{
  return self->_tableRowModel;
}

- (NSArray)sections
{
  return self->_sections;
}

+ (BOOL)shouldDisplayChevronForRowModel:(id)a3 previousRowModel:(id)a4 nextRowModel:(id)a5 nextCardsEnabled:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;

  v6 = a6;
  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "nextCard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextCard");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "nextCard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((TLKSnippetModernizationEnabled() & 1) == 0)
  {
    if (v6 && v12 && v12 != v13 && v12 != v14 || (objc_msgSend(v9, "isQuerySuggestion") & 1) != 0)
    {
      v15 = 1;
      goto LABEL_9;
    }
    if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
    {
      objc_msgSend(v9, "identifyingResult");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "type") == 7;

      goto LABEL_9;
    }
  }
  v15 = 0;
LABEL_9:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableRowModel, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

+ (BOOL)resultHasHorizontallyGroupedCardSections:(id)a3
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

+ (id)tableModelWithCardSections:(id)a3 isInline:(BOOL)a4 queryId:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "tableModelWithCardSections:result:isInline:queryId:shouldCombine:", a3, 0, a4, a5, 0);
}

+ (id)tableModelWithCardSections:(id)a3 result:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 shouldCombine:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v9;
  id v11;
  id v12;
  SearchUITableModel *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v7 = a7;
  v9 = a5;
  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a3;
  v13 = -[SearchUITableModel initWithQueryId:]([SearchUITableModel alloc], "initWithQueryId:", a6);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "buildRowModelsFromCardSections:result:isInline:queryId:", v12, v11, v9, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v14, "buildCombinedRowModelsFromRowModels:result:", v15, v11);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  v17 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUITableModel setTableRowModel:](v13, "setTableRowModel:", v20);

  return v13;
}

+ (id)tableModelWithResult:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "tableModelWithResults:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)tableModelWithResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setResults:", v4);

  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tableModelWithSections:expandedSections:expandedCollectionCardSections:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)updatedTableModelWithExpandedSections:(id)a3 expandedCollectionCardSections:(id)a4 hiddenSections:(id)a5 atSectionIndex:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[SearchUITableModel sections](self, "sections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (v12)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIsInitiallyHidden:", 1);

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a6, objc_msgSend(v12, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectAtIndex:", a6);
    objc_msgSend(v14, "insertObjects:atIndexes:", v12, v16);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = v12;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21++), "setIsInitiallyHidden:", 0, (_QWORD)v24);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v19);
    }

  }
  objc_msgSend((id)objc_opt_class(), "tableModelWithSections:expandedSections:expandedCollectionCardSections:", v14, v10, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)updatedTableModelByDeletingSectionIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SearchUITableModel sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectAtIndex:", a3);
  objc_msgSend((id)objc_opt_class(), "tableModelWithSections:expandedSections:expandedCollectionCardSections:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)numberOfSections
{
  void *v2;
  unint64_t v3;

  -[SearchUITableModel tableRowModel](self, "tableRowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)replaceResult:(id)a3 withResult:(id)a4 completion:(id)a5
{
  id v8;
  SearchUIDataSourceSnapshotBuilder *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SearchUIDataSourceSnapshotBuilder *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t i;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  id v37;
  void *v38;
  SearchUIDataSourceSnapshotBuilder *v39;
  id v40;
  void (**v41)(id, uint64_t, void *);
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v8 = a3;
  v40 = a4;
  v41 = (void (**)(id, uint64_t, void *))a5;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  v48 = (id)objc_opt_new();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __58__SearchUITableModel_replaceResult_withResult_completion___block_invoke;
  v42[3] = &unk_1EA1F6390;
  v42[4] = &v43;
  -[SearchUITableModel enumerateRowModels:](self, "enumerateRowModels:", v42);
  v9 = [SearchUIDataSourceSnapshotBuilder alloc];
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_msgSend((id)v44[5], "copy");
  v13 = (void *)objc_opt_new();
  v14 = -[SearchUIDataSourceSnapshotBuilder initWithExpandedSections:expandedCollectionSections:rowModelIdentifiers:sectionModelIdentifiers:](v9, "initWithExpandedSections:expandedCollectionSections:rowModelIdentifiers:sectionModelIdentifiers:", v10, v11, v12, v13);

  -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromResult:](v14, "buildRowModelsFromResult:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v14;
  -[SearchUIDataSourceSnapshotBuilder buildRowModelsFromResult:](v14, "buildRowModelsFromResult:", v40);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUITableModel indexPathForRowModel:](self, "indexPathForRowModel:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_msgSend(v18, "section");
    v38 = v18;
    v20 = objc_msgSend(v18, "row");
    -[SearchUITableModel tableRowModel](self, "tableRowModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v20, objc_msgSend(v15, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObjectsAtIndexes:", v23);

    -[SearchUITableModel tableRowModel](self, "tableRowModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v20, objc_msgSend(v16, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "insertObjects:atIndexes:", v16, v26);

    v27 = (void *)objc_opt_new();
    v28 = (void *)objc_opt_new();
    v37 = v8;
    v29 = (void *)objc_opt_new();
    for (i = 0; ; ++i)
    {
      v31 = objc_msgSend(v16, "count", v37);
      v32 = objc_msgSend(v15, "count");
      v33 = v31 <= v32 ? v32 : v31;
      if (i >= v33)
        break;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v20 + i, v19);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (i >= objc_msgSend(v16, "count") || (v35 = objc_msgSend(v15, "count"), v36 = v27, i >= v35))
      {
        if (i >= objc_msgSend(v16, "count"))
          v36 = v28;
        else
          v36 = v29;
      }
      objc_msgSend(v36, "addObject:", v34);

    }
    if (objc_msgSend(v27, "count"))
      v41[2](v41, 1, v27);
    if (objc_msgSend(v28, "count"))
      v41[2](v41, 2, v28);
    if (objc_msgSend(v29, "count"))
      v41[2](v41, 0, v29);

    v8 = v37;
    v18 = v38;
  }

  _Block_object_dispose(&v43, 8);
}

void __58__SearchUITableModel_replaceResult_withResult_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "itemIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)removeRowModel:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[SearchUITableModel indexPathForRowModel:](self, "indexPathForRowModel:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = objc_msgSend(v4, "section");
  -[SearchUITableModel tableRowModel](self, "tableRowModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= objc_msgSend(v7, "count"))
  {

    goto LABEL_6;
  }
  v8 = objc_msgSend(v5, "row");
  -[SearchUITableModel tableRowModel](self, "tableRowModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v8 >= v11)
  {
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  -[SearchUITableModel tableRowModel](self, "tableRowModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectAtIndex:", objc_msgSend(v5, "row"));

  v14 = v5;
LABEL_7:

  return v14;
}

+ (id)rowModelForCardSection:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "buildRowModelFromCardSection:result:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)numberOfRowsForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[SearchUITableModel tableRowModel](self, "tableRowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (BOOL)indexPathExists:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "row") < 0 || objc_msgSend(v5, "section") < 0)
  {
    v11 = 0;
  }
  else
  {
    v6 = objc_msgSend(v5, "section");
    -[SearchUITableModel tableRowModel](self, "tableRowModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 >= objc_msgSend(v7, "count"))
    {
      v11 = 0;
    }
    else
    {
      v8 = objc_msgSend(v5, "row");
      -[SearchUITableModel tableRowModel](self, "tableRowModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v8 < objc_msgSend(v10, "count");

    }
  }

  return v11;
}

- (id)rowModelForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[SearchUITableModel indexPathExists:](self, "indexPathExists:", v4))
  {
    -[SearchUITableModel tableRowModel](self, "tableRowModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)resultForIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[SearchUITableModel rowModelForIndexPath:](self, "rowModelForIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifyingResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sectionForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[SearchUITableModel sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[SearchUITableModel sections](self, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (unint64_t)indexOfSection:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[SearchUITableModel sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)cardSectionForIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[SearchUITableModel rowModelForIndexPath:](self, "rowModelForIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldDisplayChevronForIndexPath:(id)a3 nextCardsEnabled:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  -[SearchUITableModel rowModelForIndexPath:](self, "rowModelForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v6, "row") - 1, objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUITableModel rowModelForIndexPath:](self, "rowModelForIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB36B0];
  v11 = objc_msgSend(v6, "row") + 1;
  v12 = objc_msgSend(v6, "section");

  objc_msgSend(v10, "indexPathForRow:inSection:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUITableModel rowModelForIndexPath:](self, "rowModelForIndexPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend((id)objc_opt_class(), "shouldDisplayChevronForRowModel:previousRowModel:nextRowModel:nextCardsEnabled:", v7, v9, v14, v4);
  return v4;
}

- (BOOL)shouldLeaveSpaceForChevronForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[SearchUITableModel rowModelForIndexPath:](self, "rowModelForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v4, "row") + 1, objc_msgSend(v4, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SearchUITableModel shouldDisplayChevronForIndexPath:nextCardsEnabled:](self, "shouldDisplayChevronForIndexPath:nextCardsEnabled:", v8, 1);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int)separatorStyleForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  -[SearchUITableModel rowModelForIndexPath:](self, "rowModelForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = objc_msgSend(v4, "row") + 1;
  v8 = objc_msgSend(v4, "section");

  objc_msgSend(v6, "indexPathForRow:inSection:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUITableModel rowModelForIndexPath:](self, "rowModelForIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v5, "separatorStyle");
  if (!v11)
  {
    if (objc_msgSend(v10, "prefersNoSeparatorAbove"))
      v11 = 1;
    else
      v11 = 3;
  }
  if (v11 == 3 && v10)
  {
    if (objc_msgSend(v10, "hasLeadingImage"))
      v11 = 3;
    else
      v11 = 2;
  }

  return v11;
}

- (BOOL)rowWillFillBackgroundWithContentAtIndexPath:(id)a3
{
  void *v3;
  char v4;

  -[SearchUITableModel rowModelForIndexPath:](self, "rowModelForIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fillsBackgroundWithContent");

  return v4;
}

- (id)indexPathForRowModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[SearchUITableModel tableRowModel](self, "tableRowModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v40;
      v33 = v5;
      v29 = *(_QWORD *)v40;
      do
      {
        v10 = 0;
        v11 = v8;
        v28 = v8 + v7;
        do
        {
          if (*(_QWORD *)v40 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v14)
          {
            v15 = v14;
            v16 = 0;
            v17 = *(_QWORD *)v36;
            v30 = v7;
            v34 = v11;
            while (2)
            {
              v18 = 0;
              v31 = v16 + v15;
              v32 = v16;
              do
              {
                if (*(_QWORD *)v36 != v17)
                  objc_enumerationMutation(v13);
                v19 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * v18);
                if (v19 == v4)
                  goto LABEL_26;
                objc_msgSend(v4, "identifyingResult");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "identifyingResult");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20 == v21)
                {
                  objc_msgSend(v4, "identifyingResult");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v22)
                  {

LABEL_26:
                    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v32 + v18, v34);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();

                    v5 = v33;
                    goto LABEL_27;
                  }
                }
                objc_msgSend(v4, "cardSection");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "cardSection");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23 == v24)
                {
                  objc_msgSend(v4, "cardSection");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v25)
                    goto LABEL_26;
                }
                else
                {

                }
                ++v18;
              }
              while (v15 != v18);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              v7 = v30;
              v16 = v31;
              v5 = v33;
              v11 = v34;
              v9 = v29;
              if (v15)
                continue;
              break;
            }
          }

          ++v11;
          ++v10;
        }
        while (v10 != v7);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        v26 = 0;
        v8 = v28;
      }
      while (v7);
    }
    else
    {
      v26 = 0;
    }
LABEL_27:

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)indexPathForResultInFirstTwoSections:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_22;
  -[SearchUITableModel tableRowModel](self, "tableRowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = 2;
  if (v6 < 2)
    v7 = v6;
  if (v7)
  {
    v8 = 0;
    do
    {
      -[SearchUITableModel tableRowModel](self, "tableRowModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
      {
        v12 = 0;
        do
        {
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          -[SearchUITableModel tableRowModel](self, "tableRowModel", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "results");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v30;
            while (2)
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v30 != v19)
                  objc_enumerationMutation(v16);
                if (*(id *)(*((_QWORD *)&v29 + 1) + 8 * v20) == v4)
                {
                  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v12, v8);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_24;
                }
                ++v20;
              }
              while (v18 != v20);
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
              if (v18)
                continue;
              break;
            }
          }

          ++v12;
          -[SearchUITableModel tableRowModel](self, "tableRowModel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

        }
        while (v12 < v23);
      }
      ++v8;
      -[SearchUITableModel tableRowModel](self, "tableRowModel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      v26 = 0;
      if (v25 >= 2)
        v27 = 2;
      else
        v27 = v25;
    }
    while (v8 < v27);
  }
  else
  {
LABEL_22:
    v26 = 0;
  }
LABEL_24:

  return v26;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_opt_new();
  v8.receiver = self;
  v8.super_class = (Class)SearchUITableModel;
  -[SearchUITableModel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[SearchUITableModel tableRowModel](self, "tableRowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n %@"), v6);

  return v3;
}

@end
