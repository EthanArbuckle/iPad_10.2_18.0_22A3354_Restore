@implementation PGPublicEventContextualRule

- (PGPublicEventContextualRule)initWithGraph:(id)a3 photoLibrary:(id)a4 loggingConnection:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGPublicEventContextualRule *v12;
  PGPublicEventContextualRule *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGPublicEventContextualRule;
  v12 = -[PGPublicEventContextualRule init](&v15, sel_init);
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PGGraphPublicEventNodeCollection *v14;
  PGGraphPublicEventNodeCollection *publicEventNodes;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PGGraphMomentNodeCollection *v25;
  PGGraphMomentNodeCollection *momentNodesMatchingPublicEvents;
  NSObject *loggingConnection;
  PGGraphPublicEventNodeCollection *v28;
  void *v30;
  int v31;
  int v32;
  uint8_t buf[4];
  PGPublicEventContextualRule *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  PGGraphPublicEventNodeCollection *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "localToday");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMonthDayNodeCollection monthDayNodesForLocalDate:inGraph:](PGGraphMonthDayNodeCollection, "monthDayNodesForLocalDate:inGraph:", v4, self->_graph);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "momentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "publicEventNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v8, "isEmpty");
  v9 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v4, "dateByAddingTimeInterval:", -172800.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v4);

  +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", v11, self->_graph);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publicEventNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v13, "isEmpty");
  objc_msgSend(v8, "collectionByFormingUnionWith:", v13);
  v14 = (PGGraphPublicEventNodeCollection *)objc_claimAutoreleasedReturnValue();
  publicEventNodes = self->_publicEventNodes;
  self->_publicEventNodes = v14;

  v16 = -[MAElementCollection count](self->_publicEventNodes, "count");
  if (v16)
  {
    -[PGGraphPublicEventNodeCollection categoryNodes](self->_publicEventNodes, "categoryNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "labels");
    v30 = v4;
    v18 = v8;
    v19 = v12;
    v20 = v11;
    v21 = v7;
    v22 = v5;
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphPublicEventNodeCollection publicEventNodesWithCategories:inGraph:](PGGraphPublicEventNodeCollection, "publicEventNodesWithCategories:inGraph:", v23, self->_graph);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "momentNodes");
    v25 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
    momentNodesMatchingPublicEvents = self->_momentNodesMatchingPublicEvents;
    self->_momentNodesMatchingPublicEvents = v25;

    v5 = v22;
    v7 = v21;
    v11 = v20;
    v12 = v19;
    v8 = v18;
    v4 = v30;
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v28 = self->_publicEventNodes;
    *(_DWORD *)buf = 138413314;
    v34 = self;
    v35 = 1024;
    v36 = v16 != 0;
    v37 = 2112;
    v38 = v28;
    v39 = 1024;
    v40 = v31 ^ 1;
    v41 = 1024;
    v42 = v32 ^ 1;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "%@: canProvideContextualKeyAssets: %d\n\tMatched public events: %@\n\tRecently at public event: %d\n\tMatched on this day public event: %d", buf, 0x28u);
  }

  return v16 != 0;
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
  PGGraphPublicEventNodeCollection *publicEventNodes;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  PGPublicEventContextualRule *v28;
  id v29;
  __int16 v30;
  uint8_t buf[4];
  PGGraphPublicEventNodeCollection *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v12 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v18
    && -[MAElementCollection count](self->_publicEventNodes, "count")
    && -[MAElementCollection count](self->_momentNodesMatchingPublicEvents, "count"))
  {
    -[PGPublicEventContextualRule highlightNodesMatchingYearHighlight:sharingFilter:withOptions:](self, "highlightNodesMatchingYearHighlight:sharingFilter:withOptions:", v14, v12, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      publicEventNodes = self->_publicEventNodes;
      v22 = loggingConnection;
      *(_DWORD *)buf = 138412802;
      v32 = publicEventNodes;
      v33 = 2048;
      v34 = objc_msgSend(v19, "count");
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "Public event nodes %@ matched %tu highlight nodes for year %@", buf, 0x20u);

    }
    +[PGContextualRuleUtils onThisDayLocalDateForYearHighlight:withOptions:](PGContextualRuleUtils, "onThisDayLocalDateForYearHighlight:withOptions:", v14, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __141__PGPublicEventContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke;
    v25[3] = &unk_1E842D6D8;
    v26 = v23;
    v30 = v12;
    v27 = v14;
    v28 = self;
    v29 = v18;
    v24 = v23;
    objc_msgSend(v19, "enumerateNodesUsingBlock:", v25);

  }
}

- (id)highlightNodesMatchingYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  +[PGContextualRuleUtils onThisDayLocalDateForYearHighlight:withOptions:](PGContextualRuleUtils, "onThisDayLocalDateForYearHighlight:withOptions:", a3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -1209600.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", 1209600.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
  -[PGGraphMomentNodeCollection subsetForLocalDateInterval:](self->_momentNodesMatchingPublicEvents, "subsetForLocalDateInterval:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "highlightNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGHighlightEnrichmentUtilities filteredHighlightNodesWithHighlightNodes:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredHighlightNodesWithHighlightNodes:forSharingFilter:", v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_momentNodesMatchingPublicEvents, 0);
  objc_storeStrong((id *)&self->_publicEventNodes, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __141__PGPublicEventContextualRule_enumerateContextualKeyAssetsForYearHighlight_sharingFilter_withOptions_modelReader_curationContext_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "localStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v5 = fabs(v4);

  if (v5 / 86400.0 <= 0.0)
    v6 = 1.0;
  else
    v6 = 1.0 / (v5 / 86400.0);
  +[PGContextualRuleUtils returnContextualKeyAssetForHighlightNode:yearHighlight:sharingFilter:score:inPhotoLibrary:loggingConnection:usingBlock:](PGContextualRuleUtils, "returnContextualKeyAssetForHighlightNode:yearHighlight:sharingFilter:score:inPhotoLibrary:loggingConnection:usingBlock:", v7, *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40), *(_QWORD *)(a1 + 56), v6);

}

@end
