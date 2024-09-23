@implementation PGHolidayContextualRule

- (PGHolidayContextualRule)initWithGraph:(id)a3 photoLibrary:(id)a4 loggingConnection:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGHolidayContextualRule *v12;
  PGHolidayContextualRule *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGHolidayContextualRule;
  v12 = -[PGHolidayContextualRule init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_graph, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_loggingConnection, a5);
  }

  return v13;
}

- (BOOL)canProvideContextualKeyAssetsWithOptions:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PGGraph *graph;
  void *v14;
  PGGraphHolidayNode *v15;
  PGGraphHolidayNode *holidayNode;
  PGGraphHolidayNode *v17;
  void *v18;
  PGGraphMomentNodeCollection *v19;
  PGGraphMomentNodeCollection *momentNodesForHoliday;
  unint64_t v21;
  NSObject *loggingConnection;
  PGGraphHolidayNode *v23;
  int v25;
  PGHolidayContextualRule *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  PGGraphHolidayNode *v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D4B180];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithLocale:", v7);

  objc_msgSend(v5, "localToday");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "eventRulesForLocalDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    graph = self->_graph;
    v33 = CFSTR("name");
    v34[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAGraph anyNodeForLabel:domain:properties:](graph, "anyNodeForLabel:domain:properties:", CFSTR("Holiday"), 401, v14);
    v15 = (PGGraphHolidayNode *)objc_claimAutoreleasedReturnValue();
    holidayNode = self->_holidayNode;
    self->_holidayNode = v15;

    v17 = self->_holidayNode;
    if (v17)
    {
      -[PGGraphHolidayNode collection](v17, "collection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "celebratingMomentNodes");
      v19 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
      momentNodesForHoliday = self->_momentNodesForHoliday;
      self->_momentNodesForHoliday = v19;

    }
  }
  else
  {
    v12 = 0;
  }
  v21 = -[MAElementCollection count](self->_momentNodesForHoliday, "count");
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->_holidayNode;
    v25 = 138413058;
    v26 = self;
    v27 = 1024;
    v28 = v21 != 0;
    v29 = 2112;
    v30 = v12;
    v31 = 2112;
    v32 = v23;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "%@: canProvideContextualKeyAssets: %d\n\tEvent rule: %@\n\tHoliday node %@", (uint8_t *)&v25, 0x26u);
  }

  return v21 != 0;
}

- (void)enumerateContextualKeyAssetsForYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5 modelReader:(id)a6 curationContext:(id)a7 usingBlock:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *loggingConnection;
  PGGraphHolidayNode *holidayNode;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  PGHolidayContextualRule *v25;
  id v26;
  __int16 v27;
  uint8_t buf[4];
  PGGraphHolidayNode *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v12 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v18 && self->_holidayNode && -[MAElementCollection count](self->_momentNodesForHoliday, "count"))
  {
    -[PGHolidayContextualRule highlightNodesMatchingYearHighlight:sharingFilter:withOptions:](self, "highlightNodesMatchingYearHighlight:sharingFilter:withOptions:", v14, v12, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      holidayNode = self->_holidayNode;
      v22 = loggingConnection;
      *(_DWORD *)buf = 138412802;
      v29 = holidayNode;
      v30 = 2048;
      v31 = objc_msgSend(v19, "count");
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "Holiday node %@ matched %tu highlight nodes for year %@", buf, 0x20u);

    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __137__PGHolidayContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke;
    v23[3] = &unk_1E842BCE8;
    v27 = v12;
    v24 = v14;
    v25 = self;
    v26 = v18;
    objc_msgSend(v19, "enumerateNodesUsingBlock:", v23);

  }
}

- (id)highlightNodesMatchingYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PGGraphHighlightNodeCollection *v14;
  NSObject *loggingConnection;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v5 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "localStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localEndDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8 && v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
    -[PGGraphMomentNodeCollection subsetForLocalDateInterval:](self->_momentNodesForHoliday, "subsetForLocalDateInterval:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "highlightNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGHighlightEnrichmentUtilities filteredHighlightNodesWithHighlightNodes:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredHighlightNodesWithHighlightNodes:forSharingFilter:", v13, v5);
    v14 = (PGGraphHighlightNodeCollection *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      v17 = 138412802;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v10;
      _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "Could not match holiday to yearHighlight %@: invalid localStartDate %@, localEndDate %@", (uint8_t *)&v17, 0x20u);
    }
    v14 = -[MAElementCollection initWithGraph:]([PGGraphHighlightNodeCollection alloc], "initWithGraph:", self->_graph);
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesForHoliday, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_holidayNode, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

uint64_t __137__PGHolidayContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PGContextualRuleUtils returnContextualKeyAssetForHighlightNode:yearHighlight:sharingFilter:score:inPhotoLibrary:loggingConnection:usingBlock:](PGContextualRuleUtils, "returnContextualKeyAssetForHighlightNode:yearHighlight:sharingFilter:score:inPhotoLibrary:loggingConnection:usingBlock:", a2, *(_QWORD *)(a1 + 32), *(unsigned __int16 *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(a1 + 48), 0.0);
}

@end
