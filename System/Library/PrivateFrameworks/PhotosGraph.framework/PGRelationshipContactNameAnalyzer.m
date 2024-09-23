@implementation PGRelationshipContactNameAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipContactNameAnalyzer");
}

- (PGRelationshipContactNameAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipContactNameAnalyzer *v5;
  PGRelationshipContactNameAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipContactNameAnalyzer;
  v5 = -[PGRelationshipContactNameAnalyzer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_processor, v4);

  return v6;
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  id v4;
  void *v5;
  double v6;
  char v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  double Current;
  char v21;
  char v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *p_buf;
  uint64_t *v30;
  uint64_t *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _DWORD v42[2];
  __int16 v43;
  const char *v44;
  uint64_t buf;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _Block_copy(v4);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x2020000000;
  v37 = 0;
  if (v5
    && (v6 = CFAbsoluteTimeGetCurrent(), v6 - v35[3] >= 0.01)
    && (v35[3] = v6,
        LOBYTE(v42[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v5 + 2))(v5, v42, 0.0),
        v7 = *((_BYTE *)v39 + 24) | LOBYTE(v42[0]),
        (*((_BYTE *)v39 + 24) = v7) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0x2604000202;
      LOWORD(v46) = 2080;
      *(_QWORD *)((char *)&v46 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/People Inferences/Relationship/Relationship Analyzers/PGRela"
                                      "tionshipContactNameAnalyzer.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(WeakRetained, "graph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inferredUserLocales");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "serviceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mePerson");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "personNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    buf = 0;
    *(_QWORD *)&v46 = &buf;
    *((_QWORD *)&v46 + 1) = 0x2020000000;
    v47 = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __66__PGRelationshipContactNameAnalyzer_runAnalysisWithProgressBlock___block_invoke;
    v23[3] = &unk_1E84347E0;
    p_buf = &buf;
    v32 = 1.0 / (double)v14;
    v15 = v5;
    v28 = v15;
    v30 = &v34;
    v33 = 0x3F847AE147AE147BLL;
    v31 = &v38;
    v16 = v11;
    v24 = v16;
    v17 = v10;
    v25 = v17;
    v18 = WeakRetained;
    v26 = v18;
    v19 = v12;
    v27 = v19;
    objc_msgSend(v13, "enumerateNodesUsingBlock:", v23);
    if (v5)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v35[3] >= 0.01)
      {
        v35[3] = Current;
        v22 = 0;
        (*((void (**)(id, char *, double))v15 + 2))(v15, &v22, 1.0);
        v21 = *((_BYTE *)v39 + 24) | v22;
        *((_BYTE *)v39 + 24) = v21;
        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v42[0] = 67109378;
            v42[1] = 105;
            v43 = 2080;
            v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipContactNameAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v42, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

void __66__PGRelationshipContactNameAnalyzer_runAnalysisWithProgressBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  double Current;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(a1 + 96)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24);
  if (*(_QWORD *)(a1 + 64)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
        Current - *(double *)(v7 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v7 + 24) = Current,
        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v5, "contactIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length")
        && (objc_msgSend(*(id *)(a1 + 32), "personForIdentifier:", v9),
            (v10 = (id)objc_claimAutoreleasedReturnValue()) != 0)
        || (v10 = objc_alloc_init(MEMORY[0x1E0D4B218]), objc_msgSend(v10, "setFullName:", v8), v10))
      {
        if ((unint64_t)(objc_msgSend(*(id *)(a1 + 32), "relationshipHintForPerson:usingLocales:", v10, *(_QWORD *)(a1 + 40))- 8) <= 2)
        {
          v11 = *(void **)(a1 + 48);
          objc_msgSend(v5, "localIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v13, "registerParentContactName");

        }
        if (*(_QWORD *)(a1 + 56) && objc_msgSend(v10, "hasSameFamilyNameAsPerson:"))
        {
          v14 = *(void **)(a1 + 48);
          objc_msgSend(v5, "localIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v16, "registerSameFamilyNameAsMePerson");

        }
      }

    }
  }

}

@end
