@implementation PGDayGroupAbstractEnrichmentProfile

- (PGDayGroupAbstractEnrichmentProfile)initWithCurationManager:(id)a3 loggingConnection:(id)a4
{
  id v7;
  id v8;
  PGDayGroupAbstractEnrichmentProfile *v9;
  PGDayGroupAbstractEnrichmentProfile *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *mutableDebugInfos;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGDayGroupAbstractEnrichmentProfile;
  v9 = -[PGDayGroupAbstractEnrichmentProfile init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_curationManager, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableDebugInfos = v10->_mutableDebugInfos;
    v10->_mutableDebugInfos = v11;

  }
  return v10;
}

- (NSString)identifier
{
  id v2;

  PGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unsigned)enrichmentStateWithHighlightInfo:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 v7;
  uint64_t i;
  unsigned int v9;
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
  objc_msgSend(a3, "childHighlights", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "enrichmentState");
        if (v7 >= v9)
          v7 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 4;
  }

  return v7;
}

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  PGAbstractMethodException(self, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (BOOL)canUseLocationInformationWithHighlightInfo:(id)a3 graph:(id)a4
{
  return +[PGHighlightEnrichmentUtilities canUseLocationInformationWithHighlightInfo:graph:](PGHighlightEnrichmentUtilities, "canUseLocationInformationWithHighlightInfo:graph:", a3, a4);
}

- (id)highlightInfoWithHighlight:(id)a3 graph:(id)a4 highlightTailorContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  PGHighlightTailorHighlightInfo *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PGHighlightTailorHighlightInfo initWithHighlight:graph:highlightTailorContext:]([PGHighlightTailorHighlightInfo alloc], "initWithHighlight:graph:highlightTailorContext:", v9, v8, v7);

  return v10;
}

- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  PGAbstractMethodException(self, a2);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v15);
}

- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  id v6;
  id v7;

  v6 = a3;
  PGAbstractMethodException(self, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)keyAssetCurationCriteriaWithHighlightInfo:(id)a3 graph:(id)a4
{
  return 0;
}

- (id)momentTitleByMomentUUIDWithHighlightInfo:(id)a3
{
  return 0;
}

- (id)momentProcessedLocationByMomentUUIDWithHighlightInfo:(id)a3 graph:(id)a4
{
  return 0;
}

- (double)promotionScoreWithHighlightInfo:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  PGAbstractMethodException(self, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)keyAssetWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 graph:(id)a5 progressBlock:(id)a6
{
  return +[PGHighlightEnrichmentUtilities keyAssetForDayGroupHighlightWithHighlightInfo:sharingFilter:curationManager:progressBlock:](PGHighlightEnrichmentUtilities, "keyAssetForDayGroupHighlightWithHighlightInfo:sharingFilter:curationManager:progressBlock:", a3, a4, self->_curationManager, a6);
}

- (id)extendedCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(void *, _BYTE *, double);
  double v10;
  double Current;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  v10 = 0.0;
  if (v9)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v27 = 0;
      v9[2](v9, &v27, 0.0);
      if (v27)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v31 = 113;
          v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich"
                "/Enrichment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v12 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_16;
      }
      v10 = Current;
    }
  }
  -[PGDayGroupAbstractEnrichmentProfile _childHighlightsToFetchCurationForHighlightInfo:sharingFilter:](self, "_childHighlightsToFetchCurationForHighlightInfo:sharingFilter:", v8, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationManager photoLibrary](self->_curationManager, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setIncludeGuestAssets:", 1);
  +[PGHighlightEnrichmentUtilities assetPropertySetsForEnrichment](PGHighlightEnrichmentUtilities, "assetPropertySetsForEnrichment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFetchPropertySets:", v16);

  v17 = (void *)MEMORY[0x1E0CB3528];
  +[PGHighlightEnrichmentUtilities internalPredicateForFetchingAssetsForSharingFilter:](PGHighlightEnrichmentUtilities, "internalPredicateForFetchingAssetsForSharingFilter:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("highlightBeingExtendedAssets"), v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInternalPredicate:", v21);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInternalSortDescriptors:", v24);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && CFAbsoluteTimeGetCurrent() - v10 >= 0.01 && (v27 = 0, v9[2](v9, &v27, 1.0), v27))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v31 = 131;
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/Enr"
            "ichment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v25, "fetchedObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:
  return v12;
}

- (id)summaryCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6;
  void (**v8)(void *, _BYTE *, double);
  double v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double Current;
  char v28;
  void *v29;
  PGCurator_PHAsset *v30;
  void *v31;
  void (**v32)(void *, _BYTE *, double);
  void *v33;
  NSObject *v34;
  double v35;
  char v36;
  id v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  char v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  _BYTE v59[128];
  _QWORD v60[2];
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  uint64_t v65;

  v6 = a4;
  v65 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v38 = a5;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(v38);
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = (double *)&v51;
  v53 = 0x2020000000;
  v54 = 0;
  if (!v8
    || (v9 = CFAbsoluteTimeGetCurrent(), v9 - v52[3] < 0.01)
    || (v52[3] = v9, v50 = 0, v8[2](v8, &v50, 0.0), v10 = *((_BYTE *)v56 + 24) | v50, (*((_BYTE *)v56 + 24) = v10) == 0))
  {
    -[PGDayGroupAbstractEnrichmentProfile _childHighlightsToFetchCurationForHighlightInfo:sharingFilter:](self, "_childHighlightsToFetchCurationForHighlightInfo:sharingFilter:", v40, v6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationManager photoLibrary](self->_curationManager, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setIncludeGuestAssets:", 1);
    +[PGHighlightEnrichmentUtilities assetPropertySetsForEnrichment](PGHighlightEnrichmentUtilities, "assetPropertySetsForEnrichment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFetchPropertySets:", v14);

    v15 = (void *)MEMORY[0x1E0CB3528];
    +[PGHighlightEnrichmentUtilities internalPredicateForFetchingAssetsForSharingFilter:](PGHighlightEnrichmentUtilities, "internalPredicateForFetchingAssetsForSharingFilter:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("highlightBeingSummaryAssets"), v39);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInternalPredicate:", v19);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v20, "count"));
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v22 = v20;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v47 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v26);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
      }
      while (v23);
    }

    if (v8)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v52[3] >= 0.01)
      {
        v52[3] = Current;
        v50 = 0;
        v8[2](v8, &v50, 0.5);
        v28 = *((_BYTE *)v56 + 24) | v50;
        *((_BYTE *)v56 + 24) = v28;
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v62 = 156;
            v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enri"
                  "ch/Enrichment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v11 = (id)MEMORY[0x1E0C9AA60];
          goto LABEL_32;
        }
      }
    }
    -[PGDayGroupAbstractEnrichmentProfile curationOptionsWithHighlightInfo:sharingFilter:](self, "curationOptionsWithHighlightInfo:sharingFilter:", v40, v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setUuidsOfEligibleAssets:", v21);
    objc_msgSend(v29, "setDuration:", 21);
    v30 = objc_alloc_init(PGCurator_PHAsset);
    -[PGCurator setLoggingConnection:](v30, "setLoggingConnection:", self->_loggingConnection);
    objc_msgSend(v40, "feeder");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __100__PGDayGroupAbstractEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke;
    v41[3] = &unk_1E8434F30;
    v32 = v8;
    v42 = v32;
    v43 = &v51;
    v44 = &v55;
    v45 = 0x3F847AE147AE147BLL;
    -[PGCurator_PHAsset bestAssetsForFeeder:options:debugInfo:progressBlock:](v30, "bestAssetsForFeeder:options:debugInfo:progressBlock:", v31, v29, 0, v41);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v56 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v62 = 168;
        v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/E"
              "nrichment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
        v34 = MEMORY[0x1E0C81028];
LABEL_23:
        _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v8
        || (v35 = CFAbsoluteTimeGetCurrent(), v35 - v52[3] < 0.01)
        || (v52[3] = v35,
            v50 = 0,
            v32[2](v32, &v50, 1.0),
            v36 = *((_BYTE *)v56 + 24) | v50,
            (*((_BYTE *)v56 + 24) = v36) == 0))
      {
        v11 = v33;
        goto LABEL_31;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v62 = 170;
        v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/E"
              "nrichment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
        v34 = MEMORY[0x1E0C81028];
        goto LABEL_23;
      }
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v62 = 138;
    v63 = 2080;
    v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/Enric"
          "hment Profile/DayGroup/PGDayGroupAbstractEnrichmentProfile.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v11 = (id)MEMORY[0x1E0C9AA60];
LABEL_33:
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return v11;
}

- (id)_childHighlightsToFetchCurationForHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = v5;
  objc_msgSend(v5, "childHighlights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (+[PGHighlightEnrichmentUtilities canUseSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "canUseSharingComposition:forSharingFilter:", objc_msgSend(v13, "sharingComposition"), v4))
        {
          objc_msgSend(v13, "promotionScore");
          v15 = fabs(v14 + -0.2);
          if ((v15 <= 2.22044605e-16) | v10 & 1)
          {
            if (((v15 <= 2.22044605e-16) & v10) != 0)
            {
              v10 = 1;
              continue;
            }
          }
          else
          {
            objc_msgSend(v6, "removeAllObjects");
            v10 = 1;
          }
          objc_msgSend(v13, "objectID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  return v6;
}

- (PGCurationManager)curationManager
{
  return self->_curationManager;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (BOOL)collectsDebugInfo
{
  return self->_collectsDebugInfo;
}

- (void)setCollectsDebugInfo:(BOOL)a3
{
  self->_collectsDebugInfo = a3;
}

- (PGDejunkerDeduperOptions)extendedCurationOptions
{
  return self->_extendedCurationOptions;
}

- (void)setExtendedCurationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_extendedCurationOptions, a3);
}

- (NSMutableDictionary)mutableDebugInfos
{
  return self->_mutableDebugInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDebugInfos, 0);
  objc_storeStrong((id *)&self->_extendedCurationOptions, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
}

void __100__PGDayGroupAbstractEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

@end
