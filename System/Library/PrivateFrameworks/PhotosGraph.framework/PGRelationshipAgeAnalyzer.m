@implementation PGRelationshipAgeAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipAgeAnalyzer");
}

- (PGRelationshipAgeAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipAgeAnalyzer *v5;
  PGRelationshipAgeAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipAgeAnalyzer;
  v5 = -[PGRelationshipAgeAnalyzer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_processor, v4);

  return v6;
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  id v20;
  id v21;
  double Current;
  char v23;
  double v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *p_buf;
  uint64_t *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _DWORD v49[2];
  __int16 v50;
  const char *v51;
  uint64_t buf;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  objc_msgSend(WeakRetained, "graph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _Block_copy(v4);
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = (double *)&v41;
  v43 = 0x2020000000;
  v44 = 0;
  if (v7
    && (v8 = CFAbsoluteTimeGetCurrent(), v8 - v42[3] >= 0.01)
    && (v42[3] = v8,
        LOBYTE(v49[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v7 + 2))(v7, v49, 0.0),
        v9 = *((_BYTE *)v46 + 24) | LOBYTE(v49[0]),
        (*((_BYTE *)v46 + 24) = v9) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0x2704000202;
      LOWORD(v53) = 2080;
      *(_QWORD *)((char *)&v53 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/People Inferences/Relationship/Relationship Analyzers/PGRela"
                                      "tionshipAgeAnalyzer.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    objc_msgSend(v6, "meNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "ageCategory");
    else
      v12 = 0;
    v28 = v11;
    objc_msgSend(WeakRetained, "relationshipAnalyzerPropertiesByPersonLocalIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 && v12)
    {
      buf = 0;
      *(_QWORD *)&v53 = &buf;
      *((_QWORD *)&v53 + 1) = 0x2020000000;
      v54 = 0;
      objc_msgSend(WeakRetained, "relationshipAnalyzerPropertiesByPersonLocalIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v6;
      +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForArrayOfLocalIdentifiers:inGraph:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "personNodeByLocalIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 1.0 / (double)v14;
      v19 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __58__PGRelationshipAgeAnalyzer_runAnalysisWithProgressBlock___block_invoke;
      v32[3] = &unk_1E842BDA8;
      v20 = v7;
      v34 = v20;
      v35 = &v41;
      v38 = 0x3F847AE147AE147BLL;
      p_buf = &buf;
      v37 = &v45;
      v39 = v18;
      v21 = v17;
      v33 = v21;
      v40 = v12;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v32);
      if ((unint64_t)(v12 - 3) <= 2)
      {
        v30[0] = v19;
        v30[1] = 3221225472;
        v30[2] = __58__PGRelationshipAgeAnalyzer_runAnalysisWithProgressBlock___block_invoke_2;
        v30[3] = &unk_1E842BDD0;
        v31 = v15;
        +[PGImportantEntitiesChildrenProcessor processUserChildrenInGraph:progressBlock:withProcessInferredChildNodeClosure:](PGImportantEntitiesChildrenProcessor, "processUserChildrenInGraph:progressBlock:withProcessInferredChildNodeClosure:", v16, v4, v30);

      }
      v6 = v16;
      if (v7)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v42[3] >= 0.01)
        {
          v42[3] = Current;
          v29 = 0;
          (*((void (**)(id, char *, double))v20 + 2))(v20, &v29, 1.0);
          v23 = *((_BYTE *)v46 + 24) | v29;
          *((_BYTE *)v46 + 24) = v23;
          if (v23)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v49[0] = 67109378;
              v49[1] = 108;
              v50 = 2080;
              v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipAgeAnalyzer.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v49, 0x12u);
            }
          }
        }
      }

      _Block_object_dispose(&buf, 8);
      v11 = v28;
    }
    else if (v7)
    {
      v24 = CFAbsoluteTimeGetCurrent();
      if (v24 - v42[3] >= 0.01)
      {
        v42[3] = v24;
        LOBYTE(v49[0]) = 0;
        (*((void (**)(void *, _DWORD *, double))v7 + 2))(v7, v49, 1.0);
        v25 = *((_BYTE *)v46 + 24) | LOBYTE(v49[0]);
        *((_BYTE *)v46 + 24) = v25;
        if (v25)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            buf = 0x2F04000202;
            LOWORD(v53) = 2080;
            *(_QWORD *)((char *)&v53 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Graph/People Inferences/Relationship/Relationship Anal"
                                            "yzers/PGRelationshipAgeAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          }
        }
      }
    }

  }
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

void __58__PGRelationshipAgeAnalyzer_runAnalysisWithProgressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  double Current;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  BOOL v16;

  v7 = a2;
  v8 = a3;
  if (*(_QWORD *)(a1 + 40)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8),
        Current - *(double *)(v10 + 24) >= *(double *)(a1 + 72))
    && (*(double *)(v10 + 24) = Current,
        (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 80)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ageCategory");
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)(a1 + 88);
      if (v12 != v14)
        objc_msgSend(v8, "penalizePersonAgeCategoryDifferentThanMeNode");
      if (v13 > 2)
      {
        v15 = 0;
        if (v13 == 4 && v14 != 4)
          v15 = *(_QWORD *)(a1 + 88) != 5;
      }
      else
      {
        objc_msgSend(v8, "penalizePersonScoresForChild");
        v15 = 0;
      }
      v16 = v13 != v14 && v13 == 5;
      if (v16 || v15)
        objc_msgSend(v8, "registerPersonOldEnoughToBeMeNodeParentOrMyGrandparent");
    }

  }
}

void __58__PGRelationshipAgeAnalyzer_runAnalysisWithProgressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "registerPersonAsMeNodeChild");

    }
    v3 = v6;
  }

}

@end
