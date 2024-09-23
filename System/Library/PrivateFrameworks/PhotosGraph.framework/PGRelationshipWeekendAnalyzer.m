@implementation PGRelationshipWeekendAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipDayOfWeekAnalyzer");
}

- (PGRelationshipWeekendAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipWeekendAnalyzer *v5;
  PGRelationshipWeekendAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipWeekendAnalyzer;
  v5 = -[PGRelationshipWeekendAnalyzer init](&v8, sel_init);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  double Current;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  uint8_t v37[128];
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(a3);
  v5 = 0.0;
  if (!v4 || (v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(WeakRetained, "graph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyNodeForLabel:domain:properties:", CFSTR("Weekend"), 400, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (v4)
      {
        if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
        {
          v36 = 0;
          v4[2](v4, &v36, 1.0);
          if (v36)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v39 = 41;
              v40 = 2080;
              v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipWeekendAnalyzer.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_42;
    }
    v10 = objc_msgSend(v9, "edgesCount");
    objc_msgSend(v9, "collection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "momentNodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "personNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:amongPersonNodes:](PGPeopleInferencesConveniences, "countedPersonNodesFromMomentNodes:amongPersonNodes:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "count");
    if (v15)
    {
      v16 = v15;
      v30 = v12;
      v31 = v9;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v29 = v14;
      v17 = v14;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 1.0 / (double)v16;
        v21 = *(_QWORD *)v33;
        v22 = 0.0;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v17);
            v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v24, "localIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
              objc_msgSend(v26, "registerNumberOfWeekendMoments:amongWeekends:", objc_msgSend(v17, "countForObject:", v24), v10);
            if (v4)
            {
              Current = CFAbsoluteTimeGetCurrent();
              if (Current - v5 >= 0.01)
              {
                v36 = 0;
                v4[2](v4, &v36, v22);
                if (v36)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    v39 = 68;
                    v40 = 2080;
                    v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipWeekendAnalyzer.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  v12 = v30;
                  v9 = v31;
                  v14 = v29;
                  goto LABEL_41;
                }
                v5 = Current;
              }
            }
            v22 = v20 + v22;

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v19)
            continue;
          break;
        }
      }

      v12 = v30;
      v9 = v31;
      v14 = v29;
      if (!v4)
        goto LABEL_41;
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01)
        goto LABEL_41;
      v36 = 0;
      v4[2](v4, &v36, 1.0);
      if (!v36 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_41;
      *(_DWORD *)buf = 67109378;
      v39 = 72;
      v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/Relationship Analyzers/PGRelationshipWeekendAnalyzer.m";
      v28 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!v4)
        goto LABEL_41;
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01)
        goto LABEL_41;
      v36 = 0;
      v4[2](v4, &v36, 1.0);
      if (!v36 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_41;
      *(_DWORD *)buf = 67109378;
      v39 = 53;
      v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/Relationship Analyzers/PGRelationshipWeekendAnalyzer.m";
      v28 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
  v36 = 0;
  v4[2](v4, &v36, 0.0);
  if (!v36)
  {
    v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v39 = 35;
    v40 = 2080;
    v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipWeekendAnalyzer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_43:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

@end
