@implementation PGRelationshipHomeAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipHomeAnalyzer");
}

- (PGRelationshipHomeAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipHomeAnalyzer *v5;
  PGRelationshipHomeAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipHomeAnalyzer;
  v5 = -[PGRelationshipHomeAnalyzer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_processor, v4);

  return v6;
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  void (**v4)(void *, _BYTE *, double);
  double v5;
  double Current;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  uint8_t v29[128];
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(a3);
  v5 = 0.0;
  if (v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v28 = 0;
      v4[2](v4, &v28, 0.0);
      if (v28)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v31 = 34;
          v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "People Inferences/Relationship/Relationship Analyzers/PGRelationshipHomeAnalyzer.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_24;
      }
      v5 = Current;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  objc_msgSend(WeakRetained, "momentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGPeopleInferencesConveniences momentNodesAtHomeInMomentNodes:](PGPeopleInferencesConveniences, "momentNodesAtHomeInMomentNodes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(WeakRetained, "personNodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v9;
    +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:amongPersonNodes:](PGPeopleInferencesConveniences, "countedPersonNodesFromMomentNodes:amongPersonNodes:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v20 = objc_msgSend(v14, "countForObject:", v19);
          objc_msgSend(v19, "localIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v22, "registerNumberOfMomentsAtHome:amongMomentsAtHome:", v20, v11);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v16);
    }

    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
      {
        v28 = 0;
        v4[2](v4, &v28, 1.0);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v31 = 56;
            v32 = 2080;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipHomeAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    v9 = v23;
  }

LABEL_24:
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

@end
