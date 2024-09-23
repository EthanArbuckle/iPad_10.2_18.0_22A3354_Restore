@implementation PGRelationshipWorkAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipNightOutAnalyzer");
}

- (PGRelationshipWorkAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipWorkAnalyzer *v5;
  PGRelationshipWorkAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipWorkAnalyzer;
  v5 = -[PGRelationshipWorkAnalyzer init](&v8, sel_init);
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
  NSObject *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
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
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  uint8_t v37[128];
  uint8_t buf[4];
  _BYTE v39[14];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(a3);
  v5 = 0.0;
  if (!v4 || (v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(WeakRetained, "momentNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleInferencesConveniences momentNodesAtWorkInMomentNodes:](PGPeopleInferencesConveniences, "momentNodesAtWorkInMomentNodes:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v9;
    v10 = objc_msgSend(v9, "count");
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v39 = v10;
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "[PGRelationshipWorkAnalyzer] Number of moments at work: %lu", buf, 0xCu);
    }

    if (!v10)
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
              *(_DWORD *)v39 = 43;
              *(_WORD *)&v39[4] = 2080;
              *(_QWORD *)&v39[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationsh"
                                   "ipWorkAnalyzer.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_48;
    }
    objc_msgSend(WeakRetained, "personNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:amongPersonNodes:](PGPeopleInferencesConveniences, "countedPersonNodesFromMomentNodes:amongPersonNodes:", v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "count");
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v39 = v15;
      _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGRelationshipWorkAnalyzer] Number of people at work: %lu", buf, 0xCu);
    }

    if (v15)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v30 = v14;
      v18 = v14;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 1.0 / (double)v15;
        v22 = *(_QWORD *)v33;
        v23 = 0.0;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(v18);
            v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            if ((unint64_t)(objc_msgSend(v25, "ageCategory", v30) - 1) >= 2)
            {
              objc_msgSend(v25, "localIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
                objc_msgSend(v27, "registerNumberOfMomentsAtWork:amongMomentsAtWork:", objc_msgSend(v18, "countForObject:", v25), v10);
              if (v4)
              {
                Current = CFAbsoluteTimeGetCurrent();
                if (Current - v5 >= 0.01)
                {
                  v36 = 0;
                  v4[2](v4, &v36, v23);
                  if (v36)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v39 = 72;
                      *(_WORD *)&v39[4] = 2080;
                      *(_QWORD *)&v39[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Graph/People Inferences/Relationship/Relationship Analyz"
                                           "ers/PGRelationshipWorkAnalyzer.m";
                      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }

                    v14 = v30;
                    goto LABEL_47;
                  }
                  v5 = Current;
                }
              }
              v23 = v21 + v23;

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v20)
            continue;
          break;
        }
      }

      v14 = v30;
      if (!v4)
        goto LABEL_47;
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01)
        goto LABEL_47;
      v36 = 0;
      v4[2](v4, &v36, 1.0);
      if (!v36 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_47;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v39 = 76;
      *(_WORD *)&v39[4] = 2080;
      *(_QWORD *)&v39[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipWorkAnalyzer.m";
      v29 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!v4)
        goto LABEL_47;
      if (CFAbsoluteTimeGetCurrent() - v5 < 0.01)
        goto LABEL_47;
      v36 = 0;
      v4[2](v4, &v36, 1.0);
      if (!v36 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_47;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v39 = 52;
      *(_WORD *)&v39[4] = 2080;
      *(_QWORD *)&v39[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipWorkAnalyzer.m";
      v29 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
LABEL_47:

LABEL_48:
    goto LABEL_49;
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
    *(_DWORD *)v39 = 34;
    *(_WORD *)&v39[4] = 2080;
    *(_QWORD *)&v39[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipWorkAnalyzer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_49:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

@end
