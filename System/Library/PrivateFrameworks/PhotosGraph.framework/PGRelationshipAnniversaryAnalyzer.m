@implementation PGRelationshipAnniversaryAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipAnniversaryAnalyzer");
}

- (PGRelationshipAnniversaryAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipAnniversaryAnalyzer *v5;
  PGRelationshipAnniversaryAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipAnniversaryAnalyzer;
  v5 = -[PGRelationshipAnniversaryAnalyzer init](&v8, sel_init);
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
  unint64_t v10;
  double v11;
  id v12;
  id v13;
  double Current;
  char v15;
  char v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *p_buf;
  uint64_t *v21;
  uint64_t *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _DWORD v33[2];
  __int16 v34;
  const char *v35;
  uint64_t buf;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _Block_copy(v4);
  v28 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x2020000000;
  if (v5
    && (v6 = CFAbsoluteTimeGetCurrent(), v6 - v26[3] >= 0.01)
    && (v26[3] = v6,
        LOBYTE(v33[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v5 + 2))(v5, v33, 0.0),
        v7 = *((_BYTE *)v30 + 24) | LOBYTE(v33[0]),
        (*((_BYTE *)v30 + 24) = v7) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0x2104000202;
      LOWORD(v37) = 2080;
      *(_QWORD *)((char *)&v37 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/People Inferences/Relationship/Relationship Analyzers/PGRela"
                                      "tionshipAnniversaryAnalyzer.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(WeakRetained, "personNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    buf = 0;
    *(_QWORD *)&v37 = &buf;
    *((_QWORD *)&v37 + 1) = 0x2020000000;
    v38 = 0;
    v11 = 1.0 / (double)v10;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__PGRelationshipAnniversaryAnalyzer_runAnalysisWithProgressBlock___block_invoke;
    v17[3] = &unk_1E8428A50;
    v12 = WeakRetained;
    v18 = v12;
    p_buf = &buf;
    v23 = v11;
    v13 = v5;
    v19 = v13;
    v21 = &v25;
    v24 = 0x3F847AE147AE147BLL;
    v22 = &v29;
    objc_msgSend(v9, "enumerateNodesUsingBlock:", v17);
    if (v5)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v26[3] >= 0.01)
      {
        v26[3] = Current;
        v16 = 0;
        (*((void (**)(id, char *, double))v13 + 2))(v13, &v16, 1.0);
        v15 = *((_BYTE *)v30 + 24) | v16;
        *((_BYTE *)v30 + 24) = v15;
        if (v15)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v33[0] = 67109378;
            v33[1] = 54;
            v34 = 2080;
            v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/Relationship Analyzers/PGRelationshipAnniversaryAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v33, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

void __66__PGRelationshipAnniversaryAnalyzer_runAnalysisWithProgressBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double Current;
  uint64_t v11;

  v5 = a2;
  objc_msgSend(v5, "anniversaryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v9, "registerAnniversaryDate");

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(a1 + 72)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);
  if (*(_QWORD *)(a1 + 40))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (Current - *(double *)(v11 + 24) >= *(double *)(a1 + 80))
    {
      *(double *)(v11 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                               + 24));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        *a3 = 1;
    }
  }

}

@end
