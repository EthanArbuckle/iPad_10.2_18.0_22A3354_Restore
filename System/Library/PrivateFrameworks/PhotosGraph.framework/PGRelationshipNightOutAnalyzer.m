@implementation PGRelationshipNightOutAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipNightOutAnalyzer");
}

- (PGRelationshipNightOutAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipNightOutAnalyzer *v5;
  PGRelationshipNightOutAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipNightOutAnalyzer;
  v5 = -[PGRelationshipNightOutAnalyzer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_processor, v4);

  return v6;
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  void (**v4)(void *, _BYTE *, double);
  double v5;
  double v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  PGGraphMomentNodeCollection *v11;
  void *v12;
  PGGraphMomentNodeCollection *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  double Current;
  NSObject *v29;
  void *v30;
  PGGraphMomentNodeCollection *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  uint8_t v38[128];
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(a3);
  v5 = 0.0;
  if (!v4 || (v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(WeakRetained, "graph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "momentNodesWithMeaning:", 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "count");
    v11 = [PGGraphMomentNodeCollection alloc];
    objc_msgSend(WeakRetained, "graph");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAElementCollection initWithSet:graph:](v11, "initWithSet:graph:", v9, v12);

    objc_msgSend(WeakRetained, "personNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:amongPersonNodes:](PGPeopleInferencesConveniences, "countedPersonNodesFromMomentNodes:amongPersonNodes:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "count");
    if (v16)
    {
      v17 = v16;
      v31 = v13;
      v32 = v9;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v30 = v15;
      v18 = v15;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 1.0 / (double)v17;
        v22 = *(_QWORD *)v34;
        v23 = 0.0;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v18);
            v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v25, "localIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
              objc_msgSend(v27, "registerNumberOfNightsOut:amongNightsOut:", objc_msgSend(v18, "countForObject:", v25), v10);
            if (v4)
            {
              Current = CFAbsoluteTimeGetCurrent();
              if (Current - v5 >= 0.01)
              {
                v37 = 0;
                v4[2](v4, &v37, v23);
                if (v37)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    v40 = 60;
                    v41 = 2080;
                    v42 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipNightOutAnalyzer.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  v13 = v31;
                  v9 = v32;
                  v15 = v30;
                  goto LABEL_35;
                }
                v5 = Current;
              }
            }
            v23 = v21 + v23;

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          if (v20)
            continue;
          break;
        }
      }

      v13 = v31;
      v9 = v32;
      v15 = v30;
      if (!v4)
        goto LABEL_35;
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01)
        goto LABEL_35;
      v37 = 0;
      v4[2](v4, &v37, 1.0);
      if (!v37 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_35;
      *(_DWORD *)buf = 67109378;
      v40 = 64;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/Relationship Analyzers/PGRelationshipNightOutAnalyzer.m";
      v29 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!v4)
        goto LABEL_35;
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01)
        goto LABEL_35;
      v37 = 0;
      v4[2](v4, &v37, 1.0);
      if (!v37 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_35;
      *(_DWORD *)buf = 67109378;
      v40 = 45;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/Relationship Analyzers/PGRelationshipNightOutAnalyzer.m";
      v29 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
LABEL_35:

    goto LABEL_36;
  }
  v37 = 0;
  v4[2](v4, &v37, 0.0);
  if (!v37)
  {
    v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v40 = 34;
    v41 = 2080;
    v42 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipNightOutAnalyzer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_36:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

@end
