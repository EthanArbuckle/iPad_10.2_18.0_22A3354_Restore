@implementation PGRelationshipMomentFrequencyAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipMomentFrequencyAnalyzer");
}

- (PGRelationshipMomentFrequencyAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipMomentFrequencyAnalyzer *v5;
  PGRelationshipMomentFrequencyAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipMomentFrequencyAnalyzer;
  v5 = -[PGRelationshipMomentFrequencyAnalyzer init](&v8, sel_init);
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
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double Current;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  unint64_t v41;
  double v42;
  double v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void (**v54)(void *, _BYTE *, double);
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
  char v67;
  _BYTE v68[128];
  _BYTE v69[128];
  void *v70;
  void *v71;
  uint8_t v72[128];
  uint8_t buf[4];
  int v74;
  __int16 v75;
  const char *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(a3);
  v5 = 0.0;
  if (!v4 || (v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "momentNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "personNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:amongPersonNodes:](PGPeopleInferencesConveniences, "countedPersonNodesFromMomentNodes:amongPersonNodes:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "count"))
    {
      if (v4)
      {
        if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
        {
          v67 = 0;
          v4[2](v4, &v67, 1.0);
          if (v67)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v74 = 47;
              v75 = 2080;
              v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_67;
    }
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v53 = v11;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v64 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "countForObject:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i)));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      }
      while (v14);
    }

    if (v4)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v5 >= 0.01)
      {
        v67 = 0;
        v4[2](v4, &v67, 0.25);
        if (v67)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v74 = 56;
            v75 = 2080;
            v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v11 = v53;
          goto LABEL_67;
        }
        v5 = Current;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB35D0];
    v71 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "expressionForFunction:arguments:", CFSTR("average:"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "expressionValueWithObject:context:", 0, 0);
    v54 = v4;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    v26 = (void *)MEMORY[0x1E0CB35D0];
    v70 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "expressionForFunction:arguments:", CFSTR("stddev:"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "expressionValueWithObject:context:", 0, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;

    v4 = v54;
    if (v54)
    {
      v32 = CFAbsoluteTimeGetCurrent();
      if (v32 - v5 >= 0.01)
      {
        v67 = 0;
        v54[2](v54, &v67, 0.5);
        if (v67)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v74 = 62;
            v75 = 2080;
            v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v11 = v53;
          goto LABEL_66;
        }
        v5 = v32;
      }
    }
    v52 = v19;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v34 = v12;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v60 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
          objc_msgSend(v39, "localIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v34, "countForObject:", v39);
          objc_msgSend(MEMORY[0x1E0D4B128], "cumulativeNormalDistributionForX:mu:sigma:", (double)v41, v25, v31);
          if (v42 >= 0.6)
            objc_msgSend(v33, "addObject:", v40);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      }
      while (v36);
    }

    v4 = v54;
    if (v54)
    {
      v43 = CFAbsoluteTimeGetCurrent();
      v19 = v52;
      if (v43 - v5 >= 0.01)
      {
        v67 = 0;
        v54[2](v54, &v67, 0.75);
        if (v67)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v74 = 77;
            v75 = 2080;
            v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v11 = v53;
LABEL_65:

LABEL_66:
LABEL_67:

          goto LABEL_68;
        }
        v5 = v43;
      }
    }
    else
    {
      v19 = v52;
    }
    v44 = objc_msgSend(v33, "count");
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v45 = v33;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v56;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v56 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(WeakRetained, "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (v50)
            objc_msgSend(v50, "registerTopPersonAmongTopPeople:", v44);

        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      }
      while (v47);
    }

    v11 = v53;
    v4 = v54;
    if (v54)
    {
      if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
      {
        v67 = 0;
        v54[2](v54, &v67, 1.0);
        if (v67)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v74 = 89;
            v75 = 2080;
            v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_65;
  }
  v67 = 0;
  v4[2](v4, &v67, 0.0);
  if (!v67)
  {
    v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v74 = 38;
    v75 = 2080;
    v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/People"
          " Inferences/Relationship/Relationship Analyzers/PGRelationshipMomentFrequencyAnalyzer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_68:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

@end
