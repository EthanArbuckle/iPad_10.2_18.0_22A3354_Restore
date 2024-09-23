@implementation PGYearEnrichmentRule

- (PGYearEnrichmentRule)initWithModelReader:(id)a3 loggingConnection:(id)a4
{
  id v7;
  id v8;
  PGYearEnrichmentRule *v9;
  PGYearEnrichmentRule *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGYearEnrichmentRule;
  v9 = -[PGYearEnrichmentRule init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelReader, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
  }

  return v10;
}

- (double)promotionScoreForHighlightItemList:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
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
  objc_msgSend(a3, "sortedChildHighlightItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "promotionScore");
        if (v7 < v9)
          v7 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (id)keyAssetForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *loggingConnection;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PGHighlightItemModelReader contextualKeyAssetForHighlightItem:sharingFilter:](self->_modelReader, "contextualKeyAssetForHighlightItem:sharingFilter:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "Unexpected nil contextual key asset for highlight item list %@, will fallback to promotion score.", buf, 0xCu);
    }
    objc_msgSend(v6, "childHighlightItemsForHighlightFilter:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v22;
      v14 = -1.79769313e308;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v16, "promotionScore");
          if (v17 > v14)
          {
            v18 = v17;
            v19 = v16;

            v12 = v19;
            v14 = v18;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v12, "keyAssetForHighlightFilter:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)enumerateChildVisibilityStateForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 withGraph:(id)a5 neighborScoreComputer:(id)a6 usingBlock:(id)a7
{
  uint64_t v8;
  id v10;
  void (**v11)(id, _QWORD, uint64_t);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
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

  v8 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, _QWORD, uint64_t))a7;
  v27 = v10;
  objc_msgSend(v10, "childHighlightItemsForHighlightFilter:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[PGYearEnrichmentRule modelReader](self, "modelReader");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "visibilityStateForHighlightItem:sharingFilter:", v17, v8);

        v11[2](v11, v17, v19);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v14);
  }
  objc_msgSend(v27, "sortedChildHighlightItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayByExcludingObjectsInArray:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v22);
        v11[2](v11, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), 0);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v24);
  }

}

- (PGHighlightItemModelReader)modelReader
{
  return self->_modelReader;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_modelReader, 0);
}

@end
