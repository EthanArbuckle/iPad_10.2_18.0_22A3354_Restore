@implementation PGCurationManager

- (id)curatedKeyAssetIdentifierForCollectionUUID:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curationContext:(id)a7
{
  return -[PGCurationManager _curatedKeyAssetIdentifierForCollectionUUID:curatedAssetCollection:options:criteria:curatedKeyAsset:curationContext:](self, "_curatedKeyAssetIdentifierForCollectionUUID:curatedAssetCollection:options:criteria:curatedKeyAsset:curationContext:", a3, a4, a5, a6, 0, a7);
}

- (id)curatedKeyAssetForCollectionUUID:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curationContext:(id)a7
{
  id v7;
  id v9;

  v9 = 0;
  v7 = -[PGCurationManager _curatedKeyAssetIdentifierForCollectionUUID:curatedAssetCollection:options:criteria:curatedKeyAsset:curationContext:](self, "_curatedKeyAssetIdentifierForCollectionUUID:curatedAssetCollection:options:criteria:curatedKeyAsset:curationContext:", a3, a4, a5, a6, &v9, a7);
  return v9;
}

- (id)_curatedKeyAssetIdentifierForCollectionUUID:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curatedKeyAsset:(id *)a7 curationContext:(id)a8
{
  id v14;
  id v15;
  PGKeyAssetCurationOptions *v16;
  id v17;
  id v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint32_t denom;
  uint32_t numer;
  NSObject *v41;
  NSObject *v42;
  const __CFString *v43;
  NSObject *v44;
  float v45;
  const __CFString *v46;
  void *v47;
  void *v49;
  void *context;
  id v51;
  os_signpost_id_t spid;
  uint64_t v53;
  id *v54;
  unint64_t v55;
  id v56;
  id v57;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  double v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = (PGKeyAssetCurationOptions *)a5;
  v17 = a6;
  v18 = a8;
  if (!v14)
  {
    v25 = 0;
    goto LABEL_37;
  }
  v57 = v18;
  -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_generate(v19);
  v21 = v19;
  v22 = v21;
  v55 = v20 - 1;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "CuratedKeyAsset", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v53 = mach_absolute_time();
  if (!v16)
    v16 = objc_alloc_init(PGKeyAssetCurationOptions);
  -[PGCurationCache curatedKeyAssetIdentifierForCollectionUUID:options:](self->_cache, "curatedKeyAssetIdentifierForCollectionUUID:options:", v14, v16);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v56 = v17;
  spid = v20;
  if (v23)
  {
    if (!a7)
    {
      v28 = 0;
      v25 = (void *)v23;
      goto LABEL_27;
    }
    v54 = a7;
    v25 = (void *)v23;
LABEL_10:
    v65[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationManager fetchAssetsSortedByDateWithLocalIdentifiers:](self, "fetchAssetsSortedByDateWithLocalIdentifiers:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "firstObject");
    v28 = (id)objc_claimAutoreleasedReturnValue();

LABEL_26:
    v28 = objc_retainAutorelease(v28);
    *v54 = v28;
    goto LABEL_27;
  }
  v54 = a7;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v15, "photoLibrary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "librarySpecificFetchOptions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addFetchPropertySets:", v31);

  objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 1);
  v32 = v17;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPersonsPrefetchMode:", 2);
  objc_msgSend(v33, "setFaceInformationPrefetchMode:", 2);
  objc_msgSend(v32, "scenesTrait");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "isActive"))
    v35 = 2;
  else
    v35 = 1;
  objc_msgSend(v33, "setScenesPrefetchMode:", v35);

  v51 = v15;
  v49 = v30;
  objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v15, v30, v33, v57);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)-[PGKeyAssetCurationOptions copy](v16, "copy");
  -[PGCurationManager bestAssetForAssetFeeder:options:criteria:](self, "bestAssetForAssetFeeder:options:criteria:", v36, v37, v32);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    if (objc_msgSend(v36, "numberOfItems")
      && !-[PGKeyAssetCurationOptions useContextualCurationOnly](v16, "useContextualCurationOnly"))
    {
      objc_msgSend(v36, "itemAtIndex:", 0);
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
  }
  objc_msgSend(v28, "localIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    -[PGCurationCache setCuratedKeyAsset:forCollectionUUID:options:](self->_cache, "setCuratedKeyAsset:forCollectionUUID:options:", v28, v14, v16);

  objc_autoreleasePoolPop(context);
  if (v54)
  {
    v15 = v51;
    if (!v25)
      goto LABEL_27;
    if (v28)
      goto LABEL_26;
    goto LABEL_10;
  }
  v15 = v51;
LABEL_27:
  v38 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v41 = v22;
  v42 = v41;
  if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    v43 = CFSTR("YES");
    if (!v24)
      v43 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v60 = (const char *)v43;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v42, OS_SIGNPOST_INTERVAL_END, spid, "CuratedKeyAsset", "KeyAsset Criteria Cached (%@)", buf, 0xCu);
  }

  v44 = v42;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    v45 = (float)((float)((float)(v38 - v53) * (float)numer) / (float)denom) / 1000000.0;
    v46 = CFSTR("YES");
    if (!v24)
      v46 = CFSTR("NO");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KeyAsset Criteria Cached (%@)"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v60 = "CuratedKeyAsset";
    v61 = 2112;
    v62 = v47;
    v63 = 2048;
    v64 = v45;
    _os_log_impl(&dword_1CA237000, v44, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  v17 = v56;
  v18 = v57;
LABEL_37:

  return v25;
}

- (PGCurationManager)initWithPhotoLibrary:(id)a3 cacheURL:(id)a4
{
  id v7;
  id v8;
  PGCurationManager *v9;
  PGCurationManager *v10;
  os_log_t v11;
  OS_os_log *curationLoggingConnection;
  PGCurationCriteriaFactory *v13;
  PGCurationCriteriaFactory *curationCriteriaFactory;
  PGCurationCache *v15;
  void *v16;
  uint64_t v17;
  PGCurationCache *cache;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PGCurationManager;
  v9 = -[PGCurationManager init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    v11 = os_log_create("com.apple.PhotosGraph", "curation");
    curationLoggingConnection = v10->_curationLoggingConnection;
    v10->_curationLoggingConnection = (OS_os_log *)v11;

    v13 = objc_alloc_init(PGCurationCriteriaFactory);
    curationCriteriaFactory = v10->_curationCriteriaFactory;
    v10->_curationCriteriaFactory = v13;

    v15 = [PGCurationCache alloc];
    +[CLSDBCache urlWithParentURL:](PGCurationCache, "urlWithParentURL:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CLSDBCache initWithURL:](v15, "initWithURL:", v16);
    cache = v10->_cache;
    v10->_cache = (PGCurationCache *)v17;

  }
  return v10;
}

- (PFSceneGeography)sceneGeography
{
  PGCurationManager *v2;
  PFSceneGeography *v3;
  PFSceneGeography *sceneGeography;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sceneGeography)
  {
    v3 = (PFSceneGeography *)objc_alloc_init(MEMORY[0x1E0D75248]);
    sceneGeography = v2->_sceneGeography;
    v2->_sceneGeography = v3;

  }
  objc_sync_exit(v2);

  return v2->_sceneGeography;
}

- (id)curatedKeyAssetForAssetCollection:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curationContext:(id)a7
{
  id v12;
  id v13;
  PGKeyAssetCurationOptions *v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint32_t denom;
  uint32_t numer;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint32_t v36;
  uint32_t v37;
  NSObject *v38;
  NSObject *v39;
  const __CFString *v40;
  NSObject *v41;
  float v42;
  const __CFString *v43;
  void *v44;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  double v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (PGKeyAssetCurationOptions *)a5;
  v15 = a6;
  v52 = a7;
  -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);
  v18 = v16;
  v19 = v18;
  v20 = v17 - 1;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CuratedKeyAsset", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v49 = mach_absolute_time();
  if (v13)
    v21 = v13;
  else
    v21 = v12;
  v51 = v21;
  if (!v14)
    v14 = objc_alloc_init(PGKeyAssetCurationOptions);
  v50 = v15;
  if (v15)
  {
    objc_msgSend(v12, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationManager curatedKeyAssetForCollectionUUID:curatedAssetCollection:options:criteria:curationContext:](self, "curatedKeyAssetForCollectionUUID:curatedAssetCollection:options:criteria:curationContext:", v22, v51, v14, v15, v52);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v27 = v19;
      v28 = v27;
      if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v28, OS_SIGNPOST_INTERVAL_END, v17, "CuratedKeyAsset", "Curated Key Asset. Updated asset collection to collection.", buf, 2u);
      }

      v29 = v28;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Curated Key Asset. Updated asset collection to collection."));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v55 = "CuratedKeyAsset";
        v56 = 2112;
        v57 = v30;
        v58 = 2048;
        v59 = (float)((float)((float)((float)(v24 - v49) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

      }
      goto LABEL_31;
    }
  }
  v48 = v13;
  -[PGCurationCache curatedKeyAssetIdentifierForMoment:options:](self->_cache, "curatedKeyAssetIdentifierForMoment:options:", v12, v14);
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[PGCurationManager fetchAssetWithLocalIdentifier:](self, "fetchAssetWithLocalIdentifier:", v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  -[PGCurationManager defaultAssetFetchOptions](self, "defaultAssetFetchOptions");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v51;
  objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPersonsPrefetchMode:", 2);
  objc_msgSend(v33, "setFaceInformationPrefetchMode:", 2);
  objc_msgSend(v33, "setScenesPrefetchMode:", 2);
  v46 = v32;
  v47 = (void *)v31;
  objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v32, v31, v33, v52);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationManager bestAssetForAssetFeeder:options:](self, "bestAssetForAssetFeeder:options:", v34, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    if (!objc_msgSend(v34, "numberOfItems"))
    {
      v23 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v34, "itemAtIndex:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_20;
  }
  -[PGCurationCache setCuratedKeyAsset:forMoment:options:](self->_cache, "setCuratedKeyAsset:forMoment:options:", v23, v12, v14);
LABEL_20:

LABEL_21:
  v35 = mach_absolute_time();
  v37 = info.numer;
  v36 = info.denom;
  v38 = v19;
  v39 = v38;
  if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    v40 = CFSTR("YES");
    if (!v29)
      v40 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v55 = (const char *)v40;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v39, OS_SIGNPOST_INTERVAL_END, v17, "CuratedKeyAsset", "Curated Key Asset (cached: %@)", buf, 0xCu);
  }

  v41 = v39;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = (float)((float)((float)(v35 - v49) * (float)v37) / (float)v36) / 1000000.0;
    v43 = CFSTR("YES");
    if (!v29)
      v43 = CFSTR("NO");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Curated Key Asset (cached: %@)"), v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v55 = "CuratedKeyAsset";
    v56 = 2112;
    v57 = v44;
    v58 = 2048;
    v59 = v42;
    _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  v13 = v48;
LABEL_31:

  return v23;
}

- (id)bestAssetsForAssetFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  PGCurator_PHAsset *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(PGCurator_PHAsset);
  -[PGCurator setLoggingConnection:](v11, "setLoggingConnection:", self->_curationLoggingConnection);
  -[PGCurator_PHAsset bestAssetsForFeeder:options:debugInfo:progressBlock:](v11, "bestAssetsForFeeder:options:debugInfo:progressBlock:", v10, v9, 0, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)curatedAssetsForAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  char v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  void *v22;
  double v23;
  char v24;
  id v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint32_t denom;
  uint32_t numer;
  NSObject *v31;
  NSObject *v32;
  double v33;
  char v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  int v39;
  double Current;
  char v41;
  void *v42;
  void *v44;
  void *v45;
  PGKeyAssetCurationOptions *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  os_signpost_id_t spid;
  NSObject *v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  mach_timebase_info info;
  os_activity_scope_state_s state;
  uint64_t v64;
  double *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint8_t buf[4];
  _BYTE v73[18];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v55 = a5;
  v54 = a6;
  v12 = _Block_copy(v54);
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v64 = 0;
  v65 = (double *)&v64;
  v66 = 0x2020000000;
  v67 = 0;
  if (!v12
    || (v13 = CFAbsoluteTimeGetCurrent(), v13 - v65[3] < 0.01)
    || (v65[3] = v13,
        LOBYTE(state.opaque[0]) = 0,
        (*((void (**)(void *, os_activity_scope_state_s *, double))v12 + 2))(v12, &state, 0.0),
        v14 = *((_BYTE *)v69 + 24) | LOBYTE(state.opaque[0]),
        (*((_BYTE *)v69 + 24) = v14) == 0))
  {
    v16 = _os_activity_create(&dword_1CA237000, "Curated Assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v53 = v16;
    os_activity_scope_enter(v16, &state);
    -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);
    v19 = v17;
    v20 = v19;
    spid = v18;
    v21 = v18 - 1;
    if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CuratedAssets", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v51 = mach_absolute_time();
    -[PGCurationCache curatedAssetIdentifiersForMoment:options:](self->_cache, "curatedAssetIdentifiersForMoment:options:", v10, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && (v23 = CFAbsoluteTimeGetCurrent(), v23 - v65[3] >= 0.01)
      && (v65[3] = v23,
          v61 = 0,
          (*((void (**)(void *, char *, double))v12 + 2))(v12, &v61, 0.5),
          v24 = *((_BYTE *)v69 + 24) | v61,
          (*((_BYTE *)v69 + 24) = v24) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v73 = 208;
        *(_WORD *)&v73[4] = 2080;
        *(_QWORD *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Curation/PGCurationManager.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v25 = 0;
    }
    else
    {
      if (v22)
      {
        -[PGCurationManager fetchAssetsSortedByDateWithLocalIdentifiers:](self, "fetchAssetsSortedByDateWithLocalIdentifiers:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "fetchedObjects");
        v25 = (id)objc_claimAutoreleasedReturnValue();

        -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v73 = v10;
          _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "Curated Assets: Cache Hit for assetCollection: %@", buf, 0xCu);
        }

      }
      else
      {
        -[PGCurationManager defaultAssetFetchOptions](self, "defaultAssetFetchOptions");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "includesAllFaces"))
          v36 = 2;
        else
          v36 = 0;
        objc_msgSend(v35, "setPersonsPrefetchMode:", v36);
        objc_msgSend(v35, "setFaceInformationPrefetchMode:", 2);
        objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v10, v49, v35, v55);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __91__PGCurationManager_curatedAssetsForAssetCollection_options_curationContext_progressBlock___block_invoke;
        v56[3] = &unk_1E8434F30;
        v37 = v12;
        v57 = v37;
        v58 = &v64;
        v59 = &v68;
        v60 = 0x3F847AE147AE147BLL;
        -[PGCurationManager bestAssetsForAssetFeeder:options:progressBlock:](self, "bestAssetsForAssetFeeder:options:progressBlock:", v50, v11, v56);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v38;
        if (*((_BYTE *)v69 + 24))
        {
          v39 = 1;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v73 = 221;
            *(_WORD *)&v73[4] = 2080;
            *(_QWORD *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Curation/PGCurationManager.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          if (!objc_msgSend(v38, "count"))
          {
            objc_msgSend(v50, "allItems");
            v47 = objc_claimAutoreleasedReturnValue();

            v25 = (id)v47;
          }
          v46 = objc_alloc_init(PGKeyAssetCurationOptions);
          -[PGCurationCache curatedKeyAssetIdentifierForMoment:options:](self->_cache, "curatedKeyAssetIdentifierForMoment:options:", v10);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGCurationManager fetchAssetWithLocalIdentifier:](self, "fetchAssetWithLocalIdentifier:");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12
            && (Current = CFAbsoluteTimeGetCurrent(), Current - v65[3] >= 0.01)
            && (v65[3] = Current,
                v61 = 0,
                (*((void (**)(id, char *, double))v37 + 2))(v37, &v61, 0.5),
                v41 = *((_BYTE *)v69 + 24) | v61,
                (*((_BYTE *)v69 + 24) = v41) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v73 = 234;
              *(_WORD *)&v73[4] = 2080;
              *(_QWORD *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Curation/PGCurationManager.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v39 = 1;
          }
          else
          {
            if (v48 && (objc_msgSend(v25, "containsObject:") & 1) == 0)
            {
              objc_msgSend(v25, "arrayByAddingObject:", v48);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend((id)objc_opt_class(), "defaultAssetSortDescriptors");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "sortedArrayUsingDescriptors:", v42);
              v25 = (id)objc_claimAutoreleasedReturnValue();

            }
            -[PGCurationCache setCuratedAssets:forMoment:options:](self->_cache, "setCuratedAssets:forMoment:options:", v25, v10, v11);
            v39 = 0;
          }

        }
        if (v39)
          goto LABEL_51;
      }
      v28 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v31 = v20;
      v32 = v31;
      if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v32, OS_SIGNPOST_INTERVAL_END, spid, "CuratedAssets", ", buf, 2u);
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v73 = "CuratedAssets";
        *(_WORD *)&v73[8] = 2048;
        *(double *)&v73[10] = (float)((float)((float)((float)(v28 - v51) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (!v12
        || (v33 = CFAbsoluteTimeGetCurrent(), v33 - v65[3] < 0.01)
        || (v65[3] = v33,
            v61 = 0,
            (*((void (**)(void *, char *, double))v12 + 2))(v12, &v61, 1.0),
            v34 = *((_BYTE *)v69 + 24) | v61,
            (*((_BYTE *)v69 + 24) = v34) == 0))
      {
        v25 = v25;
        v15 = v25;
LABEL_52:

        os_activity_scope_leave(&state);
        goto LABEL_53;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v73 = 252;
        *(_WORD *)&v73[4] = 2080;
        *(_QWORD *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Curation/PGCurationManager.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
LABEL_51:
    v15 = 0;
    goto LABEL_52;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v73 = 199;
    *(_WORD *)&v73[4] = 2080;
    *(_QWORD *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/PGCurationManager.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v15 = 0;
LABEL_53:
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);

  return v15;
}

- (id)dejunkAndDedupeAssetsInAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  os_activity_scope_state_s v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_1CA237000, "Dejunk and Dedup Assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v22.opaque[0] = 0;
  v22.opaque[1] = 0;
  os_activity_scope_enter(v14, &v22);
  -[PGCurationManager defaultAssetFetchOptions](self, "defaultAssetFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPersonsPrefetchMode:", 0);
  objc_msgSend(v16, "setFaceInformationPrefetchMode:", 2);
  objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v10, v15, v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_class();
  objc_msgSend(v17, "allItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dejunkAndDedupeItems:options:debugInfo:progressBlock:", v19, v11, 0, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&v22);
  return v20;
}

- (id)criteriaForKeyAssetCurationWithAssetCollection:(id)a3 graph:(id)a4 options:(id)a5 curationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  PGCurationCriteriaFactory *curationCriteriaFactory;
  void *v17;
  uint64_t v18;
  void *v19;
  PGCurationCriteriaFactory *v20;
  PGCurationCriteriaFactory *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "assetCollectionType") == 3)
  {
    objc_msgSend(v11, "momentNodeForMoment:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v11, "bestMeaningLabelForMeaningfulEvent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        curationCriteriaFactory = self->_curationCriteriaFactory;
        objc_msgSend(v14, "enrichableEvent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGCurationCriteriaFactory curationCriteriaWithCollection:meaningLabel:inGraph:client:](curationCriteriaFactory, "curationCriteriaWithCollection:meaningLabel:inGraph:client:", v17, v15, v11, 1);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v12, "allowContextualTrip") && objc_msgSend(v14, "isTrip"))
      {
        v20 = self->_curationCriteriaFactory;
        objc_msgSend(v14, "enrichableEvent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGCurationCriteriaFactory tripCurationCriteriaWithCollection:client:](v20, "tripCurationCriteriaWithCollection:client:", v17, 1);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = self->_curationCriteriaFactory;
        objc_msgSend(v14, "enrichableEvent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGCurationCriteriaFactory petCurationCriteriaWithCollection:client:curationContext:](v21, "petCurationCriteriaWithCollection:client:curationContext:", v17, 1, v13);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      v19 = (void *)v18;

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (double)contentScoreForAssetCollection:(id)a3 curationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v6 = a4;
  v7 = a3;
  -[PGCurationManager defaultAssetFetchOptions](self, "defaultAssetFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPersonsPrefetchMode:", 0);
  objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v7, v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGCurationManager contentScoreForAssetFeeder:](self, "contentScoreForAssetFeeder:", v10);
  v12 = v11;

  return v12;
}

- (BOOL)isAssetCollectionInteresting:(id)a3 curationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PGCurationManager defaultAssetFetchOptions](self, "defaultAssetFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFaceInformationPrefetchMode:", 2);
  objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v7, v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[PGCurationManager isAssetFeederInteresting:withAlternateJunking:smart:](self, "isAssetFeederInteresting:withAlternateJunking:smart:", v10, 0, 0);
  return (char)self;
}

- (id)curatedAssetsForAssetCollection:(id)a3 duration:(unint64_t)a4 referencePersonLocalIdentifiers:(id)a5 curationContext:(id)a6 progressBlock:(id)a7
{
  id v12;
  void (**v13)(void *, _BYTE *, double);
  double v14;
  char v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  double Current;
  char v24;
  void *v25;
  double v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (**v31)(void *, _BYTE *, double);
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v44;
  char v45;
  void *v46;
  uint64_t v47;
  uint32_t numer;
  uint32_t denom;
  NSObject *v50;
  NSObject *v51;
  double v52;
  char v53;
  void *v54;
  void *v55;
  int v56;
  void (**v57)(void *, _BYTE *, double);
  void *v58;
  uint64_t v59;
  unint64_t v60;
  os_signpost_id_t spid;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  void (**v74)(void *, _BYTE *, double);
  uint64_t *v75;
  uint64_t *v76;
  uint64_t v77;
  _QWORD v78[4];
  id v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t v82;
  _QWORD v83[4];
  id v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  mach_timebase_info info;
  uint64_t v90;
  double *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  char v97;
  uint8_t buf[4];
  _BYTE v99[18];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v66 = a5;
  v68 = a6;
  v12 = a7;
  v13 = (void (**)(void *, _BYTE *, double))_Block_copy(v12);
  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  v90 = 0;
  v91 = (double *)&v90;
  v92 = 0x2020000000;
  v93 = 0;
  v64 = v12;
  if (!v13
    || (v14 = CFAbsoluteTimeGetCurrent(), v14 - v91[3] < 0.01)
    || (v91[3] = v14,
        LOBYTE(info.numer) = 0,
        ((void (**)(void *, mach_timebase_info *, double))v13)[2](v13, &info, 0.0),
        v15 = *((_BYTE *)v95 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v95 + 24) = v15) == 0))
  {
    -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);
    v19 = v17;
    v20 = v19;
    v60 = v18 - 1;
    spid = v18;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CuratedAssetsForPeople", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v59 = mach_absolute_time();
    -[PGCurationManager defaultAssetFetchOptions](self, "defaultAssetFetchOptions");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPersonsPrefetchMode:", 2);
    objc_msgSend(v22, "setFaceInformationPrefetchMode:", 2);
    objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v67, v21, v22, v68);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)v21;
    if (v13)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v91[3] >= 0.01)
      {
        v91[3] = Current;
        v88 = 0;
        v13[2](v13, &v88, 0.5);
        v24 = *((_BYTE *)v95 + 24) | v88;
        *((_BYTE *)v95 + 24) = v24;
        if (v24)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v99 = 550;
            *(_WORD *)&v99[4] = 2080;
            *(_QWORD *)&v99[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Curation/PGCurationManager.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = 0;
          goto LABEL_48;
        }
      }
    }
    objc_msgSend(v65, "allItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v26 = CFAbsoluteTimeGetCurrent();
      if (v26 - v91[3] >= 0.01)
      {
        v91[3] = v26;
        v88 = 0;
        v13[2](v13, &v88, 0.5);
        v27 = *((_BYTE *)v95 + 24) | v88;
        *((_BYTE *)v95 + 24) = v27;
        if (v27)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v99 = 554;
            *(_WORD *)&v99[4] = 2080;
            *(_QWORD *)&v99[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Curation/PGCurationManager.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = 0;
          goto LABEL_47;
        }
      }
    }
    v28 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfItemsForDuration:withTotalNumberOfItems:", a4, objc_msgSend(v25, "count"));
    v29 = objc_msgSend((id)objc_opt_class(), "minimumNumberOfItemsForDuration:withMaximumNumberOfItems:", a4, v28);
    v30 = MEMORY[0x1E0C809B0];
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke;
    v83[3] = &unk_1E8434F30;
    v31 = v13;
    v84 = v31;
    v85 = &v90;
    v86 = &v94;
    v87 = 0x3F847AE147AE147BLL;
    -[PGCurationManager _bestAssetsInAssets:forReferencePersonLocalIdentifiers:minimumRatioOfReferencePersonsPerAsset:progressBlock:](self, "_bestAssetsInAssets:forReferencePersonLocalIdentifiers:minimumRatioOfReferencePersonsPerAsset:progressBlock:", v25, v66, v83, 0.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v95 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v99 = 563;
        *(_WORD *)&v99[4] = 2080;
        *(_QWORD *)&v99[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Curation/PGCurationManager.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v16 = 0;
      goto LABEL_46;
    }
    objc_msgSend((id)objc_opt_class(), "assetsBeautifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v30;
    v78[1] = 3221225472;
    v78[2] = __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke_211;
    v78[3] = &unk_1E8434F30;
    v57 = v31;
    v58 = v32;
    v79 = v57;
    v80 = &v90;
    v81 = &v94;
    v82 = 0x3F847AE147AE147BLL;
    objc_msgSend(v32, "performWithItems:maximumNumberOfItemsToChoose:progressBlock:", v62, v28, v78);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (*((_BYTE *)v95 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v99 = 571;
        *(_WORD *)&v99[4] = 2080;
        *(_QWORD *)&v99[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Curation/PGCurationManager.m";
        v35 = MEMORY[0x1E0C81028];
LABEL_29:
        _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (objc_msgSend(v33, "count") >= v29)
        goto LABEL_69;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v30;
      v73[1] = 3221225472;
      v73[2] = __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke_213;
      v73[3] = &unk_1E8434F30;
      v74 = v57;
      v75 = &v90;
      v76 = &v94;
      v77 = 0x3F847AE147AE147BLL;
      objc_msgSend(v58, "performWithItems:maximumNumberOfItemsToChoose:progressBlock:", v25, v29, v73);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      v56 = *((unsigned __int8 *)v95 + 24);
      if (*((_BYTE *)v95 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v99 = 582;
          *(_WORD *)&v99[4] = 2080;
          *(_QWORD *)&v99[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/PGCurationManager.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        v54 = v37;
        v55 = v34;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v39 = v37;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v69, v100, 16);
        if (v40)
        {
          v41 = *(_QWORD *)v70;
LABEL_36:
          v42 = 0;
          while (1)
          {
            if (*(_QWORD *)v70 != v41)
              objc_enumerationMutation(v39);
            objc_msgSend(v36, "addObject:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v42));
            if (objc_msgSend(v36, "count") >= v29)
              break;
            if (v40 == ++v42)
            {
              v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v69, v100, 16);
              if (v40)
                goto LABEL_36;
              break;
            }
          }
        }

        v38 = v54;
        objc_msgSend(v36, "allObjects");
        v34 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (!v56)
      {
LABEL_69:
        if (!v13
          || (v44 = CFAbsoluteTimeGetCurrent(), v44 - v91[3] < 0.01)
          || (v91[3] = v44,
              v88 = 0,
              v57[2](v57, &v88, 0.5),
              v45 = *((_BYTE *)v95 + 24) | v88,
              (*((_BYTE *)v95 + 24) = v45) == 0))
        {
          objc_msgSend(v34, "sortedArrayUsingComparator:", &__block_literal_global_37810);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = mach_absolute_time();
          numer = info.numer;
          denom = info.denom;
          v50 = v20;
          v51 = v50;
          if (v60 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v51, OS_SIGNPOST_INTERVAL_END, spid, "CuratedAssetsForPeople", ", buf, 2u);
          }

          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v99 = "CuratedAssetsForPeople";
            *(_WORD *)&v99[8] = 2048;
            *(double *)&v99[10] = (float)((float)((float)((float)(v47 - v59) * (float)numer) / (float)denom) / 1000000.0);
            _os_log_impl(&dword_1CA237000, v51, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }
          if (v13
            && (v52 = CFAbsoluteTimeGetCurrent(), v52 - v91[3] >= 0.01)
            && (v91[3] = v52,
                v88 = 0,
                v57[2](v57, &v88, 1.0),
                v53 = *((_BYTE *)v95 + 24) | v88,
                (*((_BYTE *)v95 + 24) = v53) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v99 = 604;
              *(_WORD *)&v99[4] = 2080;
              *(_QWORD *)&v99[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Curation/PGCurationManager.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v16 = 0;
            v34 = v46;
          }
          else
          {
            v34 = v46;
            v16 = v34;
          }
          goto LABEL_45;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v99 = 596;
          *(_WORD *)&v99[4] = 2080;
          *(_QWORD *)&v99[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/PGCurationManager.m";
          v35 = MEMORY[0x1E0C81028];
          goto LABEL_29;
        }
      }
    }
    v16 = 0;
LABEL_45:

LABEL_46:
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v99 = 540;
    *(_WORD *)&v99[4] = 2080;
    *(_QWORD *)&v99[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/PGCurationManager.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v16 = 0;
LABEL_49:
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v94, 8);

  return v16;
}

- (id)memoryCuratedAssetsForAssetCollection:(id)a3 duration:(unint64_t)a4 withContextualAssetLocalIdentifiers:(id)a5 minimumProportion:(double)a6 graph:(id)a7 curationContext:(id)a8 progressBlock:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  v20 = a3;
  -[PGCurationManager defaultAssetFetchOptions](self, "defaultAssetFetchOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v20, v21, v22, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "assetFetchResult");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationManager memoryCuratedAssetsForAssets:duration:withContextualAssetLocalIdentifiers:minimumProportion:graph:curationContext:progressBlock:](self, "memoryCuratedAssetsForAssets:duration:withContextualAssetLocalIdentifiers:minimumProportion:graph:curationContext:progressBlock:", v24, a4, v19, v18, v17, v16, a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)memoryCuratedAssetsForAssets:(id)a3 duration:(unint64_t)a4 withContextualAssetLocalIdentifiers:(id)a5 minimumProportion:(double)a6 graph:(id)a7 curationContext:(id)a8 progressBlock:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double Current;
  char v22;
  id v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  double v29;
  char v30;
  unint64_t v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  double v45;
  void *v46;
  int v47;
  void *v48;
  double v49;
  char v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  double v58;
  char v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  NSObject *v70;
  BOOL v71;
  double v72;
  char v73;
  void *v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint32_t numer;
  uint32_t denom;
  NSObject *v83;
  NSObject *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  os_signpost_id_t spid;
  void *v96;
  unint64_t v97;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id obj;
  id obja;
  void (**v109)(void *, mach_timebase_info *, double);
  void *v110;
  void *v111;
  uint64_t v112;
  id v113;
  id v114;
  void (**v115)(void *, mach_timebase_info *, double);
  void *i;
  void *v117;
  _QWORD v118[4];
  void (**v119)(void *, mach_timebase_info *, double);
  uint64_t *v120;
  uint64_t *v121;
  uint64_t v122;
  _QWORD v123[4];
  void (**v124)(void *, mach_timebase_info *, double);
  uint64_t *v125;
  uint64_t *v126;
  uint64_t v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _QWORD v140[4];
  void (**v141)(void *, mach_timebase_info *, double);
  uint64_t *v142;
  uint64_t *v143;
  uint64_t v144;
  char v145;
  mach_timebase_info info;
  uint64_t v147;
  double *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  char v154;
  uint8_t buf[4];
  _BYTE v156[18];
  void *v157;
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v106 = v16;
  v102 = v18;
  v103 = v19;
  v104 = v20;
  if (!objc_msgSend(v16, "count"))
  {
    v23 = 0;
    goto LABEL_111;
  }
  v151 = 0;
  v152 = &v151;
  v153 = 0x2020000000;
  v154 = 0;
  v147 = 0;
  v148 = (double *)&v147;
  v149 = 0x2020000000;
  v150 = 0;
  v115 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v20);
  if (v115)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v148[3] >= 0.01)
    {
      v148[3] = Current;
      LOBYTE(info.numer) = 0;
      v115[2](v115, &info, 0.0);
      v22 = *((_BYTE *)v152 + 24) | LOBYTE(info.numer);
      *((_BYTE *)v152 + 24) = v22;
      if (v22)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v156 = 627;
          *(_WORD *)&v156[4] = 2080;
          *(_QWORD *)&v156[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v23 = 0;
        goto LABEL_110;
      }
    }
  }
  -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_signpost_id_generate(v24);
  v26 = v24;
  v27 = v26;
  v94 = v25 - 1;
  spid = v25;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "CuratedAssets", ", buf, 2u);
  }
  v99 = v27;

  info = 0;
  mach_timebase_info(&info);
  v28 = mach_absolute_time();
  objc_msgSend(v16, "fetchedObjects");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    v29 = CFAbsoluteTimeGetCurrent();
    if (v29 - v148[3] >= 0.01)
    {
      v148[3] = v29;
      v145 = 0;
      v115[2](v115, (mach_timebase_info *)&v145, 0.5);
      v30 = *((_BYTE *)v152 + 24) | v145;
      *((_BYTE *)v152 + 24) = v30;
      if (v30)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v156 = 632;
          *(_WORD *)&v156[4] = 2080;
          *(_QWORD *)&v156[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v23 = 0;
        goto LABEL_109;
      }
    }
  }
  v92 = v28;
  v31 = +[PGCurationManager maximumNumberOfItemsForDuration:withTotalNumberOfItems:](PGCurationManager, "maximumNumberOfItemsForDuration:withTotalNumberOfItems:", a4, objc_msgSend(v101, "count"));
  v93 = +[PGCurationManager minimumNumberOfItemsForDuration:withMaximumNumberOfItems:](PGCurationManager, "minimumNumberOfItemsForDuration:withMaximumNumberOfItems:", a4, v31);
  v97 = v31;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v31);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCurationManager assetsBeautifier](PGCurationManager, "assetsBeautifier");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D717F8]), "initWithNumericValueKeypaths:", &unk_1E84EA090);
  objc_msgSend(v32, "setK:", v97);
  v140[0] = MEMORY[0x1E0C809B0];
  v140[1] = 3221225472;
  v140[2] = __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke;
  v140[3] = &unk_1E8434F30;
  v109 = v115;
  v141 = v109;
  v142 = &v147;
  v144 = 0x3F847AE147AE147BLL;
  v143 = &v151;
  v96 = v32;
  objc_msgSend(v32, "performWithDataset:progressBlock:", v101, v140);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v152 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v156 = 647;
      *(_WORD *)&v156[4] = 2080;
      *(_QWORD *)&v156[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Curation/PGCurationManager.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v23 = 0;
    goto LABEL_108;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  obj = v98;
  v113 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v160, 16);
  if (v113)
  {
    v112 = *(_QWORD *)v137;
    v33 = *MEMORY[0x1E0D77DF0];
    do
    {
      for (i = 0; i != v113; i = (char *)i + 1)
      {
        if (*(_QWORD *)v137 != v112)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)i);
        if (v115)
        {
          v35 = CFAbsoluteTimeGetCurrent();
          if (v35 - v148[3] >= 0.01)
          {
            v148[3] = v35;
            v145 = 0;
            v109[2](v109, (mach_timebase_info *)&v145, 0.5);
            v36 = *((_BYTE *)v152 + 24) | v145;
            *((_BYTE *)v152 + 24) = v36;
            if (v36)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v156 = 653;
                *(_WORD *)&v156[4] = 2080;
                *(_QWORD *)&v156[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Curation/PGCurationManager.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_54;
            }
          }
        }
        objc_msgSend(v34, "objects");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v37, "count"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v37, "count"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        v40 = v37;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v132, v159, 16);
        if (v41)
        {
          v42 = *(_QWORD *)v133;
          do
          {
            for (j = 0; j != v41; ++j)
            {
              if (*(_QWORD *)v133 != v42)
                objc_enumerationMutation(v40);
              v44 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * j);
              objc_msgSend(v44, "clsContentScore");
              if (v45 > v33)
              {
                objc_msgSend(v44, "localIdentifier");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v17, "containsObject:", v46);

                if (v47)
                  v48 = v38;
                else
                  v48 = v39;
                objc_msgSend(v48, "addObject:", v44);
              }
            }
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v132, v159, 16);
          }
          while (v41);
        }

        if (objc_msgSend(v38, "count"))
        {
          objc_msgSend(v110, "addObject:", v38);
          objc_msgSend(v111, "addObject:", v39);
        }

      }
      v113 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v160, 16);
    }
    while (v113);
  }

  if (v115)
  {
    v49 = CFAbsoluteTimeGetCurrent();
    if (v49 - v148[3] >= 0.01)
    {
      v148[3] = v49;
      v145 = 0;
      v109[2](v109, (mach_timebase_info *)&v145, 0.5);
      v50 = *((_BYTE *)v152 + 24) | v145;
      *((_BYTE *)v152 + 24) = v50;
      if (v50)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v156 = 684;
          *(_WORD *)&v156[4] = 2080;
          *(_QWORD *)&v156[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_54:
        v23 = 0;
        goto LABEL_107;
      }
    }
  }
  objc_msgSend(v111, "sortUsingComparator:", &__block_literal_global_223);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  obja = 0;
  v52 = 0;
  while (objc_msgSend(v100, "count", v52) < v93)
  {
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v114 = v110;
    v53 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v128, v158, 16);
    v54 = (unint64_t)obja;
    if (!v53)
      goto LABEL_72;
    v55 = *(_QWORD *)v129;
    v54 = (unint64_t)obja;
    while (2)
    {
      for (k = 0; k != v53; ++k)
      {
        if (*(_QWORD *)v129 != v55)
          objc_enumerationMutation(v114);
        v57 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * k);
        if (v115)
        {
          v58 = CFAbsoluteTimeGetCurrent();
          if (v58 - v148[3] >= 0.01)
          {
            v148[3] = v58;
            v145 = 0;
            v109[2](v109, (mach_timebase_info *)&v145, 0.5);
            v59 = *((_BYTE *)v152 + 24) | v145;
            *((_BYTE *)v152 + 24) = v59;
            if (v59)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v156 = 704;
                *(_WORD *)&v156[4] = 2080;
                *(_QWORD *)&v156[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Curation/PGCurationManager.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_104;
            }
          }
        }
        v123[0] = MEMORY[0x1E0C809B0];
        v123[1] = 3221225472;
        v123[2] = __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke_224;
        v123[3] = &unk_1E8434F30;
        v124 = v109;
        v125 = &v147;
        v127 = 0x3F847AE147AE147BLL;
        v126 = &v151;
        objc_msgSend(v105, "performWithItems:maximumNumberOfItemsToChoose:progressBlock:", v57, 1, v123);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if (*((_BYTE *)v152 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v156 = 710;
            *(_WORD *)&v156[4] = 2080;
            *(_QWORD *)&v156[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurationManager.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

LABEL_104:
          v23 = 0;
          goto LABEL_105;
        }
        objc_msgSend(v60, "firstObject");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          objc_msgSend(v100, "addObject:", v62);
          objc_msgSend(v57, "removeObject:", v62);
          ++v54;
        }
        else
        {
          objc_msgSend(v117, "addObject:", v57);
        }

        if (v54 >= v97 - v91)
          goto LABEL_72;
      }
      v53 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v128, v158, 16);
      if (v53)
        continue;
      break;
    }
LABEL_72:

    objc_msgSend(v114, "removeObjectsInArray:", v117);
    objc_msgSend(v117, "removeAllObjects");
    v63 = vcvtmd_u64_f64((double)v54 / a6 - (double)v54);
    if (v97 - v54 >= v63)
      v64 = v63;
    else
      v64 = v97 - v54;
    v65 = objc_msgSend(v111, "count");
    v52 = v91;
    while (v51 < v65 && v52 < v64)
    {
      objc_msgSend(v111, "objectAtIndexedSubscript:", v51);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = MEMORY[0x1E0C809B0];
      v118[1] = 3221225472;
      v118[2] = __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke_225;
      v118[3] = &unk_1E8434F30;
      v119 = v109;
      v120 = &v147;
      v122 = 0x3F847AE147AE147BLL;
      v121 = &v151;
      objc_msgSend(v105, "performWithItems:maximumNumberOfItemsToChoose:progressBlock:", v66, 1, v118);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "firstObject");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = *((unsigned __int8 *)v152 + 24);
      if (*((_BYTE *)v152 + 24))
      {
        v70 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v156 = 744;
          *(_WORD *)&v156[4] = 2080;
          *(_QWORD *)&v156[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager.m";
          _os_log_impl(&dword_1CA237000, v70, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        if (v68)
        {
          objc_msgSend(v100, "addObject:", v68);
          objc_msgSend(v66, "removeObject:", v68);
          ++v52;
        }
        else
        {
          objc_msgSend(v117, "addObject:", v66);
        }
        ++v51;
      }

      if (v69)
        goto LABEL_104;
    }
    if (v51 >= v65)
      v51 = 0;
    objc_msgSend(v111, "removeObjectsInArray:", v117);
    objc_msgSend(v117, "removeAllObjects");
    v71 = v54 == (_QWORD)obja;
    obja = (id)v54;
    if (v71)
    {
      obja = (id)v54;
      if (v52 == v91)
        break;
    }
  }
  if (v115
    && (v72 = CFAbsoluteTimeGetCurrent(), v72 - v148[3] >= 0.01)
    && (v148[3] = v72,
        v145 = 0,
        v109[2](v109, (mach_timebase_info *)&v145, 0.5),
        v73 = *((_BYTE *)v152 + 24) | v145,
        *((_BYTE *)v152 + 24) = v73,
        v74 = v117,
        v73))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v156 = 772;
      *(_WORD *)&v156[4] = 2080;
      *(_QWORD *)&v156[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Curation/PGCurationManager.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v23 = 0;
  }
  else
  {
    objc_msgSend(v105, "deduplicateItems:debugInfo:", v100, 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = v77;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v157, 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "sortedArrayUsingDescriptors:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v83 = v99;
    v84 = v83;
    if (v94 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v84, OS_SIGNPOST_INTERVAL_END, spid, "CuratedAssets", ", buf, 2u);
    }

    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v156 = "CuratedAssets";
      *(_WORD *)&v156[8] = 2048;
      *(double *)&v156[10] = (float)((float)((float)((float)(v80 - v92) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v84, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v85 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(v106, "photoLibrary");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "fetchPropertySets");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)objc_msgSend(v85, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v79, v86, 0, v87, 0, 0);

    if (v115
      && (v89 = CFAbsoluteTimeGetCurrent(), v89 - v148[3] >= 0.01)
      && (v148[3] = v89,
          v145 = 0,
          v109[2](v109, (mach_timebase_info *)&v145, 1.0),
          v90 = *((_BYTE *)v152 + 24) | v145,
          (*((_BYTE *)v152 + 24) = v90) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v156 = 779;
        *(_WORD *)&v156[4] = 2080;
        *(_QWORD *)&v156[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGCurationManager.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v23 = 0;
    }
    else
    {
      v23 = v88;
    }

LABEL_105:
    v74 = v117;
  }

LABEL_107:
LABEL_108:

LABEL_109:
LABEL_110:
  _Block_object_dispose(&v147, 8);
  _Block_object_dispose(&v151, 8);

LABEL_111:
  return v23;
}

- (unint64_t)optimalDurationForAssetCollection:(id)a3 duration:(unint64_t)a4 options:(id)a5 curationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  unint64_t v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v10, "assetCollectionType");
  if (v13 == 1)
    goto LABEL_12;
  v14 = v13;
  if (v13 == 2 && objc_msgSend(v10, "assetCollectionSubtype") != 200)
    goto LABEL_12;
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PHPhotosGraphOptionIsCompleteMoments"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && (objc_msgSend(v15, "BOOLValue") & 1) == 0)
    {

LABEL_12:
      v18 = 5;
      if (a4 != 3)
        v18 = a4;
      if (a4 == 2)
        a4 = 4;
      else
        a4 = v18;
      goto LABEL_17;
    }
  }
  else
  {
    v16 = 0;
  }
  if (v14 != 3 && (unint64_t)objc_msgSend(v10, "estimatedAssetCount") > 0x64)
  {

    goto LABEL_17;
  }
  v17 = -[PGCurationManager isAssetCollectionInteresting:curationContext:](self, "isAssetCollectionInteresting:curationContext:", v10, v12);

  if (!v17)
    goto LABEL_12;
LABEL_17:

  return a4;
}

- (void)invalidateCurationCacheForMomentUUIDs:(id)a3
{
  PGCurationCache *cache;
  id v4;

  cache = self->_cache;
  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PGCurationCache invalidateCacheForMomentUUIDs:](cache, "invalidateCacheForMomentUUIDs:", v4);

}

- (void)invalidateMemoryCaches
{
  -[CLSDBCache invalidateMemoryCaches](self->_cache, "invalidateMemoryCaches");
}

- (void)invalidateDiskCaches
{
  -[CLSDBCache invalidateDiskCaches](self->_cache, "invalidateDiskCaches");
}

- (BOOL)isAssetFeederInteresting:(id)a3 withAlternateJunking:(BOOL)a4 smart:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  void *v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  double v42;
  double v43;
  double v44;
  NSObject *v45;
  void *v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *context;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  unint64_t v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "assetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "numberOfItems"))
  {
    objc_msgSend(v7, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!a5)
    {
      v17 = +[PGUserDefaults minimumNumberOfCuratedAssetsForInterestingMoments](PGUserDefaults, "minimumNumberOfCuratedAssetsForInterestingMoments");
      if (v17)
        v18 = v17;
      else
        v18 = 4;
      v16 = objc_msgSend((id)objc_opt_class(), "areAssetsInteresting:minimumNumberOfCuratedAssets:duration:", v10, v18, 2);
      goto LABEL_13;
    }
    v11 = objc_msgSend(v9, "count");
    objc_msgSend(MEMORY[0x1E0D4B268], "maximumScoreForItems:", v10);
    v13 = v12;
    -[PGCurationManager contentScoreForAssetFeeder:](self, "contentScoreForAssetFeeder:", v7);
    v15 = v14;
    if (v14 < (*MEMORY[0x1E0D77DF0] + *MEMORY[0x1E0D77DE0]) * 0.5)
      goto LABEL_4;
    if (v13 > *MEMORY[0x1E0D77DD8] || (objc_msgSend(v7, "hasBestScoringAssets") & 1) != 0)
    {
LABEL_12:
      v16 = 1;
      goto LABEL_13;
    }
    if (v11 >= 5)
    {
      if (v11 > 0x40)
        goto LABEL_12;
      objc_msgSend(v8, "cls_universalEndDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cls_universalStartDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceDate:", v21);
      v23 = v22;

      if (v23 >= 60.0)
      {
        if (v11 > 6 || objc_msgSend(v7, "hasPeople"))
        {
          v53 = v11;
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", &__block_literal_global_234);
          objc_msgSend(v25, "setMaximumDistance:", 1800.0);
          objc_msgSend(v25, "setMinimumNumberOfObjects:", 1);
          v54 = v25;
          objc_msgSend(v25, "performWithDataset:progressBlock:", v10, 0);
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
          if (v57)
          {
            v56 = *(_QWORD *)v65;
            while (2)
            {
              for (i = 0; i != v57; ++i)
              {
                if (*(_QWORD *)v65 != v56)
                  objc_enumerationMutation(obj);
                v27 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                context = (void *)MEMORY[0x1CAA4EB2C]();
                objc_msgSend(v27, "objects");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "firstObject");
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v29, "creationDate");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "timeIntervalSince1970");
                v32 = v31;

                v58 = v29;
                objc_msgSend(v29, "creationDate");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "timeIntervalSince1970");
                v35 = v34;

                v62 = 0u;
                v63 = 0u;
                v60 = 0u;
                v61 = 0u;
                objc_msgSend(v27, "objects");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
                if (v37)
                {
                  v38 = v37;
                  v39 = *(_QWORD *)v61;
                  do
                  {
                    for (j = 0; j != v38; ++j)
                    {
                      if (*(_QWORD *)v61 != v39)
                        objc_enumerationMutation(v36);
                      objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "creationDate");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "timeIntervalSince1970");
                      v43 = v42;

                      if (v43 < v32)
                        v32 = v43;
                      if (v43 > v35)
                        v35 = v43;
                    }
                    v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
                  }
                  while (v38);
                }

                if (v35 - v32 >= 0.0)
                  v44 = v35 - v32;
                else
                  v44 = -(v35 - v32);

                objc_autoreleasePoolPop(context);
                if (v44 >= 60.0)
                {

                  if (v15 <= *MEMORY[0x1E0D77DE8])
                  {
                    v47 = 4;
                  }
                  else if (objc_msgSend(v7, "hasPeople"))
                  {
                    v47 = 2;
                  }
                  else
                  {
                    v47 = 4;
                  }
                  v46 = v54;
                  objc_msgSend((id)objc_opt_class(), "assetsBeautifier");
                  v45 = objc_claimAutoreleasedReturnValue();
                  v48 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfItemsForDuration:withTotalNumberOfItems:", 2, v53);
                  if (v48 >= v53)
                    v49 = v53;
                  else
                    v49 = v48;
                  -[NSObject performWithItems:maximumNumberOfItemsToChoose:progressBlock:](v45, "performWithItems:maximumNumberOfItemsToChoose:progressBlock:", v10, v49, 0);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v50, "count") >= v47
                    && (double)v49 * 0.3 <= (double)(unint64_t)objc_msgSend(v50, "count"))
                  {
                    v16 = 1;
                  }
                  else
                  {
                    -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
                    v51 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                    {
                      v52 = objc_msgSend(v50, "count");
                      *(_DWORD *)buf = 134218498;
                      v69 = v52;
                      v70 = 2048;
                      v71 = v49;
                      v72 = 2112;
                      v73 = v8;
                      _os_log_debug_impl(&dword_1CA237000, v51, OS_LOG_TYPE_DEBUG, "AssetCollection is not interesting: \"Not enough best assets from beautifier (%ld/%ld) for assetCollection %@\", buf, 0x20u);
                    }

                    v16 = 0;
                  }

                  goto LABEL_63;
                }
              }
              v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
              if (v57)
                continue;
              break;
            }
          }

          -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v69 = (uint64_t)v8;
            _os_log_debug_impl(&dword_1CA237000, v45, OS_LOG_TYPE_DEBUG, "AssetCollection is not interesting: \"%@ sub-segments are too short\", buf, 0xCu);
          }
          v16 = 0;
          v46 = v54;
LABEL_63:

          goto LABEL_13;
        }
      }
      else
      {
        -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v69 = (uint64_t)v8;
          _os_log_debug_impl(&dword_1CA237000, v24, OS_LOG_TYPE_DEBUG, "AssetCollection is not interesting: \"%@ is too short\", buf, 0xCu);
        }

      }
    }
LABEL_4:
    v16 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (double)contentScoreForAssetFeeder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v3, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentScoreForAssets:", v6);
  v8 = v7;

  objc_autoreleasePoolPop(v4);
  return v8;
}

- (id)bestAssetInAssets:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  PGCurationManager *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  PGCurationManager *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  PGCurationManager *v50;
  uint64_t v51;
  NSObject *v52;
  id v53;
  PGCurationManager *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  NSObject *v63;
  _BOOL4 v64;
  char v65;
  NSObject *v66;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  NSObject *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t v78[128];
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "referencePersonLocalIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "count") != 0;
  else
    v10 = 0;
  v11 = objc_msgSend(v7, "isForMemories");
  v12 = objc_msgSend(v7, "allowGuestAsset");
  v13 = (void *)MEMORY[0x1CAA4EB2C]();
  if (!v10 || !objc_msgSend(v7, "focusOnPeople"))
    goto LABEL_12;
  -[PGCurationManager bestAssetInAssets:forReferencePersonLocalIdentifiers:minimumNumberOfCommonPeople:forKeyAsset:forMemories:allowGuestAsset:](self, "bestAssetInAssets:forReferencePersonLocalIdentifiers:minimumNumberOfCommonPeople:forKeyAsset:forMemories:allowGuestAsset:", v6, v9, 1, 1, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (!v14)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Curated key asset: didn't find key asset with reference people and focus on people.", buf, 2u);
    }

LABEL_12:
    HIDWORD(v68) = v10;
    if (objc_msgSend(v7, "prefilterAssetsWithFaces"))
    {
      objc_msgSend((id)objc_opt_class(), "_filteredAssetsWithFaceFilter:forAssets:", 1, v6);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (double)(unint64_t)objc_msgSend(v17, "count");
      v19 = v18 / (double)(unint64_t)objc_msgSend(v6, "count");
      objc_msgSend(v7, "prefilterAssetsWithFacesThreshold");
      v21 = v20;
      -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (v19 >= v21)
      {
        if (v23)
        {
          v53 = v7;
          v54 = self;
          v55 = v9;
          v56 = objc_msgSend(v17, "count");
          v57 = objc_msgSend(v6, "count");
          *(_DWORD *)buf = 134218240;
          v80 = v56;
          v9 = v55;
          self = v54;
          v7 = v53;
          v81 = 2048;
          v82 = v57;
          _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "Curated key asset: prefiltered assets with faces %ld/%ld.", buf, 0x16u);
        }

        LODWORD(v68) = 1;
        if (v17)
        {
LABEL_19:
          v29 = v17;
          v71 = v9;
          v72 = v6;
          v69 = v7;
          v70 = v13;
          v73 = v29;
          if (objc_msgSend(v7, "useSummarizer"))
          {
            if (objc_msgSend(v7, "complete"))
              v30 = 4;
            else
              v30 = 2;
            objc_msgSend((id)objc_opt_class(), "summaryClusteringForDuration:", v30);
            v31 = objc_claimAutoreleasedReturnValue();
            -[NSObject performWithItems:identifiersOfEligibleItems:maximumNumberOfItemsToElect:progressBlock:](v31, "performWithItems:identifiersOfEligibleItems:maximumNumberOfItemsToElect:progressBlock:", v29, 0, 1, 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v29;
            if (objc_msgSend(v32, "count"))
            {
              objc_msgSend(v32, "firstObject");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "cluster");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objects");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

            }
            -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection", v68);
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              v37 = objc_msgSend(v33, "count");
              v38 = -[NSObject count](v29, "count");
              *(_DWORD *)buf = 134218240;
              v80 = v37;
              v81 = 2048;
              v82 = v38;
              _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "Curated key asset: summarizer elected %ld/%ld assets.", buf, 0x16u);
            }
            v39 = self;

          }
          else
          {
            -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
            v31 = objc_claimAutoreleasedReturnValue();
            v39 = self;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              v40 = -[NSObject count](v29, "count");
              *(_DWORD *)buf = 134217984;
              v80 = v40;
              _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "Curated key asset: not using summarizer. %ld assets remaining.", buf, 0xCu);
            }
            v33 = v29;
          }

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v43 = v33;
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
          if (v44)
          {
            v45 = v44;
            v46 = *(_QWORD *)v75;
            do
            {
              for (i = 0; i != v45; ++i)
              {
                if (*(_QWORD *)v75 != v46)
                  objc_enumerationMutation(v43);
                v48 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                if (objc_msgSend(v48, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", v11, v12, v68))v49 = v42;
                else
                  v49 = v41;
                objc_msgSend(v49, "addObject:", v48);
              }
              v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
            }
            while (v45);
          }

          v9 = v71;
          v50 = v39;
          v7 = v69;
          if (HIDWORD(v68))
          {
            -[PGCurationManager _bestAssetInSummarizedAssets:forReferencePersonLocalIdentifiers:](v50, "_bestAssetInSummarizedAssets:forReferencePersonLocalIdentifiers:", v41, v71);
            v51 = objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              v14 = (void *)v51;
              -[PGCurationManager curationLoggingConnection](v50, "curationLoggingConnection");
              v52 = objc_claimAutoreleasedReturnValue();
              v6 = v72;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA237000, v52, OS_LOG_TYPE_INFO, "Curated key asset: found key asset with reference people in non video assets.", buf, 2u);
              }

LABEL_69:
              v13 = v70;
              v15 = v73;
              goto LABEL_70;
            }
            -[PGCurationManager _bestAssetInSummarizedAssets:forReferencePersonLocalIdentifiers:](v50, "_bestAssetInSummarizedAssets:forReferencePersonLocalIdentifiers:", v42, v71);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGCurationManager curationLoggingConnection](v50, "curationLoggingConnection");
            v58 = objc_claimAutoreleasedReturnValue();
            v59 = os_log_type_enabled(v58, OS_LOG_TYPE_INFO);
            v6 = v72;
            if (v14)
            {
              if (v59)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA237000, v58, OS_LOG_TYPE_INFO, "Curated key asset: found key asset with reference people in video assets.", buf, 2u);
              }

              goto LABEL_69;
            }
            if (v59)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA237000, v58, OS_LOG_TYPE_INFO, "Curated key asset: didn't find common people. fallback to basic curation.", buf, 2u);
            }

          }
          objc_msgSend((id)objc_opt_class(), "assetsBeautifier");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "performWithItems:maximumNumberOfItemsToChoose:progressBlock:", v41, 1, 0);
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = -[NSObject count](v61, "count");
          -[PGCurationManager curationLoggingConnection](v50, "curationLoggingConnection");
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = os_log_type_enabled(v63, OS_LOG_TYPE_INFO);
          if (v62)
          {
            if (v64)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA237000, v63, OS_LOG_TYPE_INFO, "Curated key asset: found key asset in non video assets.", buf, 2u);
            }
          }
          else
          {
            if (v64)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA237000, v63, OS_LOG_TYPE_INFO, "Curated key asset: didn't find key asset w/o videos. Trying to find asset in video assets.", buf, 2u);
            }

            objc_msgSend(v60, "performWithItems:maximumNumberOfItemsToChoose:progressBlock:", v42, 1, 0);
            v63 = v61;
            v61 = objc_claimAutoreleasedReturnValue();
          }
          v6 = v72;

          -[NSObject firstObject](v61, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v65 = v68 ^ 1;
          if (v14)
            v65 = 1;
          if ((v65 & 1) == 0)
          {
            -[PGCurationManager curationLoggingConnection](v50, "curationLoggingConnection");
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA237000, v66, OS_LOG_TYPE_INFO, "Curated key asset: no key asset found when using pre-filtering. Trying again w/o prefiltering.", buf, 2u);
            }

            objc_msgSend(v69, "setPrefilterAssetsWithFaces:", 0);
            -[PGCurationManager bestAssetInAssets:options:](v50, "bestAssetInAssets:options:", v72, v69);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_69;
        }
LABEL_18:
        v17 = v6;
        goto LABEL_19;
      }
      if (v23)
      {
        v24 = v7;
        v25 = self;
        v26 = v9;
        v27 = objc_msgSend(v17, "count");
        v28 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 134218240;
        v80 = v27;
        v9 = v26;
        self = v25;
        v7 = v24;
        v81 = 2048;
        v82 = v28;
        _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "Curated key asset: not using prefiltered assets with faces (%ld/%ld).", buf, 0x16u);
      }

    }
    LODWORD(v68) = 0;
    goto LABEL_18;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Curated key asset: found key asset with reference people and focus on people.", buf, 2u);
  }
LABEL_70:

  objc_autoreleasePoolPop(v13);
  return v14;
}

- (id)bestAssetInAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4 minimumNumberOfCommonPeople:(unint64_t)a5 forKeyAsset:(BOOL)a6 forMemories:(BOOL)a7 allowGuestAsset:(BOOL)a8
{
  _BOOL8 v8;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  double v38;
  double v39;
  uint64_t j;
  void *v41;
  double v42;
  double v43;
  void *v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  uint64_t k;
  double v55;
  double v56;
  id v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  _BOOL4 v65;
  PGCurationManager *v66;
  unint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  void *v72;
  unint64_t v73;
  _BOOL4 v74;
  _BOOL4 v75;
  uint64_t v76;
  id obj;
  unint64_t obja;
  id v79;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[16];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v74 = a7;
  v75 = a8;
  v8 = a6;
  v98 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v80 = a4;
  if (!objc_msgSend(v12, "count"))
  {
    v13 = 0;
    goto LABEL_76;
  }
  v66 = self;
  v67 = a5;
  if (v8)
    v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  else
    v72 = 0;
  v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v81 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v68 = v12;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v92;
    v17 = -1.79769313e308;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v92 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
        v20 = v8;
        if (v8
          && (objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", v74, v75) & 1) == 0)
        {
          objc_msgSend(v72, "addObject:", v19);
        }
        v21 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v19, "clsPersonAndPetLocalIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setWithArray:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)objc_msgSend(v80, "mutableCopy");
        objc_msgSend(v24, "intersectSet:", v23);
        v25 = objc_msgSend(v24, "count");
        v26 = objc_msgSend(v80, "count") - v25;
        v27 = (double)v25 + (double)v26 * -0.25 + (double)(objc_msgSend(v23, "count") - v25) * -0.1;
        if (v27 >= v17)
        {
          if (v27 > v17)
          {
            objc_msgSend(v79, "removeAllObjects");
            objc_msgSend(v81, "removeAllObjects");
            v17 = v27;
          }
          objc_msgSend(v79, "addObject:", v19);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "addObject:", v28);

        }
        v8 = v20;
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
    }
    while (v15);
  }

  v29 = v79;
  if (objc_msgSend(v79, "count") == 1)
  {
    objc_msgSend(v81, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedIntegerValue");

    if (v31 >= v67)
    {
      objc_msgSend(v79, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v12 = v68;
    goto LABEL_75;
  }
  v65 = v8;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v32 = v79;
  v76 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  if (!v76)
  {
    v73 = 0;
    v35 = 0;
    goto LABEL_60;
  }
  v73 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = *(_QWORD *)v88;
  v37 = -1;
  v38 = -1.79769313e308;
  v39 = -1.79769313e308;
  v69 = *(_QWORD *)v88;
  v70 = v32;
  do
  {
    for (j = 0; j != v76; ++j)
    {
      if (*(_QWORD *)v88 != v36)
        objc_enumerationMutation(v32);
      v41 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
      objc_msgSend(v41, "clsContentScore");
      v43 = v42;
      objc_msgSend(v41, "clsFaceInformationSummary");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (!((v44 != 0) | v34 & 1))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Face information expected but not prefetched.", buf, 2u);
        }
        v34 = 1;
      }
      v45 = objc_msgSend(v44, "numberOfFacesIncludingPets");
      v46 = v45;
      if (v37 <= v45)
      {
        if (v37 != v45)
          goto LABEL_54;
        obja = v37;
        v47 = v34;
        v71 = v35;
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        objc_msgSend(v44, "faceInformationByPersonLocalIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "allValues");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v83;
          v53 = 0.0;
          do
          {
            for (k = 0; k != v51; ++k)
            {
              if (*(_QWORD *)v83 != v52)
                objc_enumerationMutation(v49);
              objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * k), "faceSize");
              v53 = v53 + v55;
            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
          }
          while (v51);
        }
        else
        {
          v53 = 0.0;
        }

        v56 = v53 / (double)v46;
        v36 = v69;
        if (v39 >= 0.3 || v56 <= v39)
        {
          v32 = v70;
          v35 = v71;
          if (v39 < 0.3)
            goto LABEL_53;
          if (v56 < 0.3 || v43 <= v38)
            goto LABEL_53;
        }
        else
        {
          v39 = v53 / (double)v46;
          v32 = v70;
          v35 = v71;
        }
      }
      else
      {
        v47 = v34;
        obja = v45;
      }
      v58 = v41;

      objc_msgSend(v81, "objectAtIndexedSubscript:", v33);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v59, "unsignedIntegerValue");

      v38 = v43;
      v35 = v58;
LABEL_53:
      v34 = v47;
      v37 = obja;
LABEL_54:
      ++v33;

    }
    v76 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  }
  while (v76);
LABEL_60:

  if (v73 >= v67)
  {
    v12 = v68;
    if (v65)
    {
      v29 = v79;
      if (objc_msgSend(v35, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", v74, v75)
        && objc_msgSend(v72, "count"))
      {
        -[PGCurationManager curationLoggingConnection](v66, "curationLoggingConnection");
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v60, OS_LOG_TYPE_DEFAULT, "Curated key asset: key Asset is video. Trying to find non video key asset.", buf, 2u);
        }
        -[PGCurationManager bestAssetInAssets:forReferencePersonLocalIdentifiers:minimumNumberOfCommonPeople:forKeyAsset:forMemories:allowGuestAsset:](v66, "bestAssetInAssets:forReferencePersonLocalIdentifiers:minimumNumberOfCommonPeople:forKeyAsset:forMemories:allowGuestAsset:", v72, v80, v67, 0, v74, v75);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v61;
        if (v61)
        {
          v63 = v61;

          v35 = v63;
        }
        else if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v60, OS_LOG_TYPE_DEFAULT, "Curated key asset: Didn't find any non video key asset.", buf, 2u);
        }

      }
    }
    else
    {
      v29 = v79;
    }
    v35 = v35;
    v13 = v35;
  }
  else
  {
    v13 = 0;
    v12 = v68;
    v29 = v79;
  }

LABEL_75:
LABEL_76:

  return v13;
}

- (id)bestAssetInAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4 requiredMinimumNumberOfReferencePersons:(unint64_t)a5 forMemories:(BOOL)a6 allowGuestAsset:(BOOL)a7 wantsGoodSquareCropScore:(BOOL)a8
{
  id v9;
  _BOOL4 v10;
  double v11;
  uint64_t i;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  double v18;
  _BOOL4 v19;
  BOOL v20;
  _BOOL4 v21;
  double v22;
  double v23;
  _BOOL4 v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  double v41;
  double v42;
  double v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  double v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  uint64_t j;
  void *v58;
  int v59;
  void *v60;
  double v61;
  double v62;
  float v63;
  double v64;
  id v65;
  void *v67;
  double v68;
  id v70;
  char v71;
  _BOOL4 v72;
  _BOOL4 v73;
  id obj;
  BOOL v75;
  id v76;
  void *v77;
  uint64_t v78;
  _BOOL4 v79;
  _BOOL4 v80;
  uint64_t v81;
  id v82;
  int v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  _QWORD v96[4];
  id v97;
  id v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  uint64_t v106;
  double *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  double *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v72 = a8;
  v79 = a6;
  v80 = a7;
  v128 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v70 = a4;
  v67 = v9;
  if (!objc_msgSend(v9, "count"))
  {
    v49 = 0;
    goto LABEL_55;
  }
  v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  obj = v9;
  v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v127, 16);
  if (v81)
  {
    v71 = 0;
    v10 = 0;
    v83 = 0;
    v78 = *(_QWORD *)v123;
    v68 = *MEMORY[0x1E0D77DF8];
    v11 = -1.79769313e308;
    do
    {
      for (i = 0; i != v81; ++i)
      {
        if (*(_QWORD *)v123 != v78)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", v79, v80);
        v15 = objc_msgSend(v82, "count");
        v16 = v15;
        if (!((v15 == 0 || (v14 & 1) == 0) | v83 & 1))
          goto LABEL_18;
        if (v72)
        {
          v17 = v15 != 0;
          objc_msgSend(v13, "clsSquareCropScore");
          v19 = v18 < v68;
          v20 = v18 < v68 && v17;
          if (!((v10 || !v20) | v83 & 1))
            goto LABEL_17;
          v21 = v16 != 0;
          objc_msgSend(v13, "cropScoreForTargetAspectRatio:forFaces:", 1, 0.75);
          v23 = v22;
          objc_msgSend(v13, "cropScoreForTargetAspectRatio:forFaces:", 1, 1.5);
          v24 = v23 < 0.475;
          if (v25 < 0.475)
            v24 = 1;
          v75 = v24;
          if (!(v71 & 1 | (!v24 || !v21) | (v10 | v83) & 1))
          {
            v71 = 0;
LABEL_17:
            v10 = 0;
LABEL_18:
            v83 = 0;
            continue;
          }
        }
        else
        {
          v19 = 0;
          v75 = 0;
        }
        objc_msgSend(v13, "curationModel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "faceModel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "qualityNode");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "operatingPoint");
        v30 = v29;

        objc_msgSend(v26, "faceSizeUpperLimit");
        v32 = v31;
        objc_msgSend(v26, "faceSizeLowerLimit");
        v34 = v33;
        v118 = 0;
        v119 = &v118;
        v120 = 0x2020000000;
        v121 = 0;
        v114 = 0;
        v115 = (double *)&v114;
        v116 = 0x2020000000;
        v117 = 0;
        v110 = 0;
        v111 = (double *)&v110;
        v112 = 0x2020000000;
        v113 = 0;
        objc_msgSend(v13, "clsFaceInformationSummary");
        v73 = v19;
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "faceInformationByPersonLocalIdentifier");
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = MEMORY[0x1E0C809B0];
        v37 = (void *)v35;
        v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v106 = 0;
        v107 = (double *)&v106;
        v108 = 0x2020000000;
        v109 = 0x7FEFFFFFFFFFFFFFLL;
        v96[0] = v36;
        v96[1] = 3221225472;
        v96[2] = __167__PGCurationManager_bestAssetInAssets_forReferencePersonLocalIdentifiers_requiredMinimumNumberOfReferencePersons_forMemories_allowGuestAsset_wantsGoodSquareCropScore___block_invoke;
        v96[3] = &unk_1E842DF80;
        v39 = v70;
        v103 = v30;
        v104 = v32;
        v105 = v34;
        v97 = v39;
        v99 = &v106;
        v100 = &v118;
        v101 = &v114;
        v102 = &v110;
        v40 = v38;
        v98 = v40;
        objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v96);
        v41 = v107[3];
        v42 = v41 * 0.5;
        if (v41 * 0.5 >= v34)
          v42 = v34;
        v88[0] = v36;
        if (v41 >= 1.79769313e308)
          v43 = 0.0;
        else
          v43 = v42;
        v88[1] = 3221225472;
        v88[2] = __167__PGCurationManager_bestAssetInAssets_forReferencePersonLocalIdentifiers_requiredMinimumNumberOfReferencePersons_forMemories_allowGuestAsset_wantsGoodSquareCropScore___block_invoke_2;
        v88[3] = &unk_1E842DFA8;
        v44 = v37;
        v92 = v30;
        v93 = v32;
        v94 = v34;
        v95 = v43;
        v89 = v44;
        v90 = &v114;
        v91 = &v110;
        objc_msgSend(v40, "enumerateObjectsUsingBlock:", v88);
        v45 = objc_msgSend(v39, "count");
        v46 = v119[3];
        v47 = v115[3] + (double)(v45 - v46) * -0.25;
        v115[3] = v47;
        if (v46 >= a5)
        {
          if (((v14 | ~(_BYTE)v83) & ((v73 | ~v10) & (v75 | ~v71)) & 1) == 0)
            v11 = -1.79769313e308;
          if (v47 >= v11)
          {
            if (v47 > v11)
            {
              objc_msgSend(v82, "removeAllObjects");
              objc_msgSend(v76, "removeAllObjects");
              v71 = v75;
              v10 = v73;
              v83 = v14;
              v11 = v47;
            }
            objc_msgSend(v82, "addObject:", v13);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v111[3]);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "addObject:", v48);

          }
        }

        _Block_object_dispose(&v106, 8);
        _Block_object_dispose(&v110, 8);
        _Block_object_dispose(&v114, 8);
        _Block_object_dispose(&v118, 8);

      }
      v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v127, 16);
    }
    while (v81);
  }

  if ((unint64_t)objc_msgSend(v82, "count") <= 1)
  {
    objc_msgSend(v82, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v50 = v82;
  v49 = 0;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v84, v126, 16);
  if (!v51)
    goto LABEL_53;
  v52 = 0;
  v53 = 0;
  v54 = *(_QWORD *)v85;
  v55 = -1.79769313e308;
  v56 = -1.79769313e308;
  do
  {
    for (j = 0; j != v51; ++j)
    {
      if (*(_QWORD *)v85 != v54)
        objc_enumerationMutation(v50);
      v58 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
      v59 = objc_msgSend(v58, "isFavorite");
      objc_msgSend(v76, "objectAtIndexedSubscript:", v53 + j);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "doubleValue");
      v62 = v61;

      objc_msgSend(v58, "overallAestheticScore");
      v64 = v63;
      if (((v52 ^ v59) & 1) != 0)
      {
        if (v59)
          goto LABEL_50;
      }
      else if (v62 > v55 || v62 == v55 && v56 < v64)
      {
LABEL_50:
        v65 = v58;

        v49 = v65;
        v52 = v59;
        v55 = v62;
        v56 = v64;
        continue;
      }
    }
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v84, v126, 16);
    v53 += j;
  }
  while (v51);
LABEL_53:

LABEL_54:
LABEL_55:

  return v49;
}

- (id)_bestAssetsInAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4 minimumRatioOfReferencePersonsPerAsset:(double)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  double v11;
  double Current;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  uint64_t i;
  void *v22;
  double v23;
  void *v24;
  unint64_t v25;
  double v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v35;
  id obj;
  void *v37;
  uint64_t v38;
  void (**v39)(void *, _BYTE *, double);
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = 0.0;
  v39 = (void (**)(void *, _BYTE *, double))_Block_copy(a6);
  if (v39)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v48 = 0;
      v39[2](v39, &v48, 0.0);
      if (v48)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v52 = 1981;
          v53 = 2080;
          v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curati"
                "on/PGCurationManager.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v13 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_46;
      }
      v11 = Current;
    }
  }
  v37 = (void *)objc_opt_new();
  v14 = objc_msgSend(v10, "count");
  v15 = objc_msgSend(v9, "count");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v35 = v9;
  obj = v9;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v16)
  {
    v17 = v16;
    v18 = vcvtpd_u64_f64((double)v14 * 0.4);
    if (v18 <= 2)
      v18 = 2;
    v38 = *(_QWORD *)v45;
    v19 = 0.0 / (double)v15;
    v20 = (double)v18;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v45 != v38)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (v39)
        {
          v23 = CFAbsoluteTimeGetCurrent();
          if (v23 - v11 >= 0.01)
          {
            v48 = 0;
            v39[2](v39, &v48, v19);
            if (v48)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v52 = 1992;
                v53 = 2080;
                v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Curation/PGCurationManager.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              v13 = (id)MEMORY[0x1E0C9AA60];
              v9 = v35;
              v33 = v37;
              goto LABEL_45;
            }
            v11 = v23;
          }
        }
        objc_msgSend(v22, "clsPersonAndPetLocalIdentifiers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");
        if ((double)v25 * a5 <= v20)
          v26 = v20;
        else
          v26 = (double)v25 * a5;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v27 = v24;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v28)
        {
          v29 = v28;
          v30 = 0;
          v31 = *(_QWORD *)v41;
          while (2)
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v41 != v31)
                objc_enumerationMutation(v27);
              if (objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j)))
              {
                if (++v30 >= (unint64_t)v26)
                {

                  objc_msgSend(v37, "addObject:", v22);
                  goto LABEL_33;
                }
              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
            if (v29)
              continue;
            break;
          }
        }

LABEL_33:
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v17)
        continue;
      break;
    }
  }

  v33 = v37;
  if (v39 && CFAbsoluteTimeGetCurrent() - v11 >= 0.01 && (v48 = 0, v39[2](v39, &v48, 1.0), v48))
  {
    v9 = v35;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v52 = 2016;
      v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/P"
            "GCurationManager.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v13 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v13 = v37;
    v9 = v35;
  }
LABEL_45:

LABEL_46:
  return v13;
}

- (id)_bestAssetInSummarizedAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  id v31;
  void *v32;
  char v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "clsPersonAndPetLocalIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v11, "intersectSet:", v10);
  if ((objc_msgSend(v6, "isSubsetOfSet:", v10) & 1) == 0)
  {
    v32 = v10;
    v12 = objc_msgSend(v11, "count");
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (!v14)
    {

      v29 = 0;
      goto LABEL_17;
    }
    v15 = v14;
    v34 = v7;
    v31 = v5;
    v33 = 0;
    v16 = *(_QWORD *)v36;
    v17 = 0.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        v19 = v11;
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v6, "mutableCopy", v31);

        v21 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v20, "clsPersonAndPetLocalIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setWithArray:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "intersectSet:", v23);

        v24 = objc_msgSend(v11, "count");
        if (v24 > v12)
        {
          v25 = (double)v24;
          objc_msgSend(v20, "clsContentScore");
          v27 = v25 + v26 * 0.9;
          if (v27 > v17)
          {
            v28 = v20;

            v33 = 1;
            v34 = v28;
            v17 = v27;
          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v15);

    if ((v33 & 1) == 0)
    {
      v29 = 0;
      v5 = v31;
      v10 = v32;
      v7 = v34;
      goto LABEL_17;
    }
    v5 = v31;
    v10 = v32;
    v7 = v34;
  }
  v7 = v7;
  v29 = v7;
LABEL_17:

  return v29;
}

- (id)bestAssetForAssetFeeder:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(v6, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationManager bestAssetInAssets:options:](self, "bestAssetInAssets:options:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)bestAssetForAssetFeeder:(id)a3 options:(id)a4 criteria:(id)a5
{
  id v7;
  PGKeyAssetCurationOptions *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  double v40;
  NSObject *v42;
  uint64_t v43;
  const char *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v60;
  PGKeyAssetCurationOptions *v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  id v66;
  _QWORD aBlock[5];
  _QWORD v68[4];
  id v69;
  _BYTE *v70;
  _QWORD *v71;
  _QWORD v72[6];
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[4];
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  _BYTE buf[24];
  uint64_t v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v61 = (PGKeyAssetCurationOptions *)a4;
  v66 = a5;
  v57 = v7;
  objc_msgSend(v7, "allItems");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v60, "count");
  if (v58)
  {
    v8 = v61;
    if (!v61)
      v8 = objc_alloc_init(PGKeyAssetCurationOptions);
    v61 = v8;
    objc_msgSend(v66, "peopleTrait");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v55, "count"))
    {
      -[PGKeyAssetCurationOptions setFocusOnPeople:](v61, "setFocusOnPeople:", 1);
      -[PGKeyAssetCurationOptions setReferencePersonLocalIdentifiers:](v61, "setReferencePersonLocalIdentifiers:", v55);
    }
    v10 = -[PGKeyAssetCurationOptions isForMemories](v61, "isForMemories", v55);
    v11 = -[PGKeyAssetCurationOptions allowGuestAsset](v61, "allowGuestAsset");
    if (!v66)
    {
      v25 = 0;
      v16 = -1;
      v17 = -1;
      if (!v61)
        goto LABEL_54;
      goto LABEL_55;
    }
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    obj = v60;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    if (v13)
    {
      v14 = 0;
      v15 = *(_QWORD *)v77;
      v16 = -1;
      v17 = -1;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v77 != v15)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1CAA4EB2C]();
          *(_QWORD *)buf = 0;
          v21 = objc_msgSend(v66, "isPassingForAsset:score:", v19, buf);
          if (*(double *)buf > 0.0)
            v22 = v21;
          else
            v22 = 0;
          if (v22 == 1)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)buf);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setObject:forKey:", v23, v19);

            objc_msgSend(v63, "addObject:", v19);
            v16 = v14 + i;
            if (v17 == -1)
              v17 = v14 + i;
            if ((objc_msgSend(v19, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", v10, v12) & 1) == 0)
              objc_msgSend(v62, "addObject:", v19);
          }
          objc_autoreleasePoolPop(v20);
        }
        v14 += v13;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
      }
      while (v13);
    }
    else
    {
      v16 = -1;
      v17 = -1;
    }

    if (objc_msgSend(v62, "count"))
    {
      v26 = v62;

      v27 = v26;
    }
    else
    {
      v27 = v63;
    }
    v28 = v27;
    v29 = objc_msgSend(v27, "count");
    -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
    if (v29)
    {
      if (v31)
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v58;
        _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_INFO, "Curated key asset with criteria: matching assets with criteria %ld/%ld.", buf, 0x16u);
      }

      objc_msgSend((id)objc_opt_class(), "_filteredAssetsWithFaceFilter:forAssets:", objc_msgSend(v66, "faceFilter"), v28);
      v30 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v30, "count"))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v85 = 0;
        v75[0] = 0;
        v75[1] = v75;
        v75[2] = 0x2020000000;
        v75[3] = 0;
        v32 = (void *)MEMORY[0x1E0D4B128];
        v33 = MEMORY[0x1E0C809B0];
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke;
        v73[3] = &unk_1E842DFF0;
        v34 = v64;
        v74 = v34;
        v72[0] = v33;
        v72[1] = 3221225472;
        v72[2] = __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_2;
        v72[3] = &unk_1E842E018;
        v72[4] = buf;
        v72[5] = v75;
        objc_msgSend(v32, "calculateStandardDeviationForItems:valueBlock:result:", v30, v73, v72);
        v35 = (void *)MEMORY[0x1E0CB3880];
        v68[0] = v33;
        v68[1] = 3221225472;
        v68[2] = __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_3;
        v68[3] = &unk_1E842E040;
        v69 = v34;
        v70 = buf;
        v71 = v75;
        objc_msgSend(v35, "predicateWithBlock:", v68);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject filteredArrayUsingPredicate:](v30, "filteredArrayUsingPredicate:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = objc_msgSend(v37, "count");
        v39 = objc_msgSend(obj, "count");
        objc_msgSend(v66, "minimumAssetsRatio");
        if ((double)v38 / (double)v39 >= v40 && v38 >= 2)
        {
          v25 = v37;
          -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v47 = -[NSObject count](v25, "count");
            *(_DWORD *)v80 = 134218240;
            v81 = v47;
            v82 = 2048;
            v83 = v58;
            v44 = "Curated key asset with criteria: using strongly filtered assets %ld/%ld";
            goto LABEL_51;
          }
        }
        else if (-[PGKeyAssetCurationOptions useContextualCurationOnly](v61, "useContextualCurationOnly"))
        {
          v25 = v37;
          -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = -[NSObject count](v25, "count");
            *(_DWORD *)v80 = 134218240;
            v81 = v43;
            v82 = 2048;
            v83 = v58;
            v44 = "Curated key asset with criteria: using weakly filtered assets %ld/%ld";
LABEL_51:
            _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, v44, v80, 0x16u);
          }
        }
        else
        {
          v25 = v30;
          -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v48 = -[NSObject count](v25, "count");
            *(_DWORD *)v80 = 134218240;
            v81 = v48;
            v82 = 2048;
            v83 = v58;
            v44 = "Curated key asset with criteria: using matching assets (with faces) %ld/%ld";
            goto LABEL_51;
          }
        }

        _Block_object_dispose(v75, 8);
        _Block_object_dispose(buf, 8);
LABEL_53:

        if (!v61)
LABEL_54:
          v61 = objc_alloc_init(PGKeyAssetCurationOptions);
LABEL_55:
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_252;
        aBlock[3] = &__block_descriptor_40_e8_B16__0Q8l;
        aBlock[4] = v58;
        v49 = _Block_copy(aBlock);
        if (v25)
        {
          -[PGCurationManager _contextualBestAssetInAssets:](self, "_contextualBestAssetInAssets:", v25);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            goto LABEL_68;
        }
        if (-[PGKeyAssetCurationOptions useContextualCurationOnly](v61, "useContextualCurationOnly"))
        {
          v24 = 0;
LABEL_68:

          goto LABEL_69;
        }
        -[PGKeyAssetCurationOptions setPrefilterAssetsWithFaces:](v61, "setPrefilterAssetsWithFaces:", 1);
        -[PGCurationManager _extendedAssetsForCurationForAssets:matchingAssetsRange:](self, "_extendedAssetsForCurationForAssets:matchingAssetsRange:", v60, v17, v16 - v17);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "count");
        if (v51)
        {
          -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v51;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v58;
            _os_log_impl(&dword_1CA237000, v52, OS_LOG_TYPE_INFO, "Curated key asset with criteria: using extended assets for curation %ld/%ld", buf, 0x16u);
          }

          -[PGKeyAssetCurationOptions setUseSummarizer:](v61, "setUseSummarizer:", (*((uint64_t (**)(void *, uint64_t))v49 + 2))(v49, v51));
          -[PGCurationManager bestAssetInAssets:options:](self, "bestAssetInAssets:options:", v50, v61);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            goto LABEL_67;
          -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA237000, v53, OS_LOG_TYPE_ERROR, "Curated key asset with criteria: didn't find key asset in extended assets. Fallback to default.", buf, 2u);
          }

        }
        -[PGKeyAssetCurationOptions setUseSummarizer:](v61, "setUseSummarizer:", (*((uint64_t (**)(void *, uint64_t))v49 + 2))(v49, v58));
        -[PGCurationManager bestAssetInAssets:options:](self, "bestAssetInAssets:options:", v60, v61);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_67:

        goto LABEL_68;
      }
      -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = -[NSObject count](v30, "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v58;
        _os_log_impl(&dword_1CA237000, v45, OS_LOG_TYPE_INFO, "Curated key asset with criteria: not enough matching assets (with faces) %ld/%ld. Fallback to normal curation", buf, 0x16u);
      }

    }
    else if (v31)
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = 0;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v58;
      _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_INFO, "Curated key asset with criteria: not enough matching assets %ld/%ld. Fallback to normal curation", buf, 0x16u);
    }
    v25 = 0;
    goto LABEL_53;
  }
  v24 = 0;
LABEL_69:

  return v24;
}

- (id)_contextualBestAssetInAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v4 = 0;
      v8 = *(_QWORD *)v19;
      v9 = -1.79769313e308;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "clsContentScore", (_QWORD)v18);
          v13 = v12;
          objc_msgSend(v11, "clsAestheticScore");
          if (v14 < 0.0)
            v14 = 0.0;
          v15 = (v13 + v14) * 0.5;
          if (v15 > v9)
          {
            v16 = v11;

            v9 = v15;
            v4 = v16;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (id)_extendedAssetsForCurationForAssets:(id)a3 matchingAssetsRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  int v19;
  NSUInteger v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  length = a4.length;
  location = a4.location;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  if (location == -1)
    goto LABEL_17;
  v9 = v8;
  if (length >= 4)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v7, 0);
    -[NSObject subarrayWithRange:](v10, "subarrayWithRange:", location, length);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v19 = 134218240;
      v20 = length;
      v21 = 2048;
      v22 = v9;
      v13 = "Curated key asset with criteria: found assets range matching scenes %ld/%ld";
LABEL_14:
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v19, 0x16u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (!length)
  {
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  v14 = (double)v8 * 0.5;
  v15 = v14 - (double)location;
  v16 = (double)(location + length) - v14;
  if (v15 <= v16)
    v17 = v8 - location;
  else
    v17 = location + length;
  if (v17 < 4)
  {
    -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v19 = 134218240;
      v20 = v17;
      v21 = 2048;
      v22 = v9;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Curated key asset with criteria: cannot use extended assets %ld/%ld", (uint8_t *)&v19, 0x16u);
    }
    v11 = 0;
    goto LABEL_16;
  }
  if (v15 > v16)
    location = 0;
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v7, 0);
  -[NSObject subarrayWithRange:](v10, "subarrayWithRange:", location, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v19 = 134218240;
    v20 = v17;
    v21 = 2048;
    v22 = v9;
    v13 = "Curated key asset with criteria: found extended assets for curation %ld/%ld";
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
LABEL_18:

  return v11;
}

- (id)fetchAssetsSortedByDateWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PGCurationManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "defaultAssetSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v7);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchAssetWithLocalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a3;
  -[PGCurationManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFetchLimit:", 1);
  v7 = (void *)MEMORY[0x1E0CD1390];
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAssetsWithLocalIdentifiers:options:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)defaultAssetFetchOptions
{
  void *v2;
  void *v3;
  void *v4;

  -[PGCurationManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchPropertySets:", v4);

  objc_msgSend(v3, "setWantsIncrementalChangeDetails:", 0);
  return v3;
}

- (id)defaultAssetFetchOptionsForMemories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[PGCurationManager defaultAssetFetchOptions](self, "defaultAssetFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("isFavorite"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v5);

  objc_msgSend(v2, "setFetchLimit:", 5000);
  return v2;
}

- (id)defaultAssetFetchOptionsForMemoriesWithoutPrefetch
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[PGCurationManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchPropertySets:", v4);

  objc_msgSend(v3, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v3, "setIncludeGuestAssets:", 1);
  return v3;
}

- (OS_os_log)curationLoggingConnection
{
  return self->_curationLoggingConnection;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PGCurationCriteriaFactory)curationCriteriaFactory
{
  return self->_curationCriteriaFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneGeography, 0);
  objc_storeStrong((id *)&self->_curationCriteriaFactory, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_curationLoggingConnection, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

double __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

uint64_t __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_2(uint64_t result, double a2, double a3)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  return result;
}

BOOL __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;

  if (!a2)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5 >= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
             + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) * 0.5;
}

BOOL __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_252(uint64_t a1, unint64_t a2)
{
  return (double)a2 / (double)*(unint64_t *)(a1 + 32) >= 0.5 || a2 > 0x1D;
}

void __167__PGCurationManager_bestAssetInAssets_forReferencePersonLocalIdentifiers_requiredMinimumNumberOfReferencePersons_forMemories_allowGuestAsset_wantsGoodSquareCropScore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v14))
  {
    v6 = 1.0;
    if ((objc_msgSend(v5, "faceIsGood") & 1) == 0)
    {
      if (objc_msgSend(v5, "faceIsOk"))
        v6 = 0.5;
      else
        v6 = 0.25;
    }
    objc_msgSend(v5, "faceSize");
    v8 = v7;
    objc_msgSend(v5, "faceQuality");
    if (v9 == -1.0)
      v9 = *(double *)(a1 + 80);
    if (v8 <= *(double *)(a1 + 88))
      v10 = v8;
    else
      v10 = *(double *)(a1 + 96);
    v11 = v9 * v10;
    if (v8 >= *(double *)(a1 + 96))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(double *)(v12 + 24);
      if (v13 >= v8)
        v13 = v8;
      *(double *)(v12 + 24) = v13;
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v6
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v11
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                            + 24);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
  }

}

void __167__PGCurationManager_bestAssetInAssets_forReferencePersonLocalIdentifiers_requiredMinimumNumberOfReferencePersons_forMemories_allowGuestAsset_wantsGoodSquareCropScore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  BOOL v10;
  _BOOL4 v11;
  double v12;
  double v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "faceSize");
  v4 = v3;
  objc_msgSend(v14, "faceQuality");
  if (v5 == -1.0)
    v5 = *(double *)(a1 + 56);
  v6 = v4;
  if (v4 > *(double *)(a1 + 64))
    v6 = *(double *)(a1 + 72);
  v7 = v5 * v6;
  v8 = objc_msgSend(v14, "isKnownPerson");
  v9 = *(double *)(a1 + 80);
  v10 = v4 < v9;
  v11 = v4 >= v9;
  v12 = -0.05;
  if (!v10)
    v12 = -0.25;
  v13 = 0.25;
  if (v8)
  {
    v13 = 0.5;
    v12 = dbl_1CA8EDA10[v11];
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7 * v13
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);

}

double __73__PGCurationManager_isAssetFeederInteresting_withAlternateJunking_smart___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "cls_universalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cls_universalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  return v8;
}

void __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke_224(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke_225(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke_221(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "count");
  v6 = objc_msgSend(v4, "count");

  if (v5 > v6)
    return -1;
  else
    return v6 > v5;
}

void __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke_211(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke_213(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke_214(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __91__PGCurationManager_curatedAssetsForAssetCollection_options_curationContext_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

+ (id)assetPropertySetsForCuration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[17];

  v11[16] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD1A80];
  v11[0] = *MEMORY[0x1E0CD1960];
  v11[1] = v2;
  v3 = *MEMORY[0x1E0CD1A60];
  v11[2] = *MEMORY[0x1E0CD1A50];
  v11[3] = v3;
  v4 = *MEMORY[0x1E0CD1A40];
  v11[4] = *MEMORY[0x1E0CD19F0];
  v11[5] = v4;
  v5 = *MEMORY[0x1E0CD1938];
  v11[6] = *MEMORY[0x1E0CD1978];
  v11[7] = v5;
  v6 = *MEMORY[0x1E0CD19E0];
  v11[8] = *MEMORY[0x1E0CD19A0];
  v11[9] = v6;
  v7 = *MEMORY[0x1E0CD19D0];
  v11[10] = *MEMORY[0x1E0CD1A18];
  v11[11] = v7;
  v8 = *MEMORY[0x1E0CD1A70];
  v11[12] = *MEMORY[0x1E0CD19D8];
  v11[13] = v8;
  v9 = *MEMORY[0x1E0CD19B0];
  v11[14] = *MEMORY[0x1E0CD1998];
  v11[15] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultAssetSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dejunkAndDedupeItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(void *, _BYTE *, double);
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double Current;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  char v31;
  void *v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(void *, _BYTE *, double))_Block_copy(a6);
  v14 = 0.0;
  if (!v13 || (v15 = CFAbsoluteTimeGetCurrent(), v15 < 0.01))
  {
LABEL_8:
    if (v12)
    {
      objc_msgSend(v12, "setAgent:", CFSTR("Dejunk and Dedupe"));
      objc_msgSend(v12, "setStage:", CFSTR("Initial"));
      objc_msgSend(MEMORY[0x1E0D716A0], "clusterWithObjects:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setClusters:withReason:", v18, CFSTR("DejunkAndDeduper"));

    }
    objc_msgSend(a1, "assetsBeautifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v14 >= 0.01)
      {
        v31 = 0;
        v13[2](v13, &v31, 0.5);
        if (v31)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v34 = 292;
            v35 = 2080;
            v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cura"
                  "tion/PGCurationManager.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = 0;
          goto LABEL_34;
        }
        v14 = Current;
      }
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dedupingDuration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dedupingDuration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

    }
    else
    {
      v24 = 60.0;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dedupingSimilarity"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dedupingSimilarity"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "integerValue");

    }
    else
    {
      v27 = 2;
    }
    objc_msgSend(v19, "deduplicateItems:withDuration:andSimilarity:debugInfo:", v10, v27, v12, v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
    {
      if (!v13)
        goto LABEL_32;
    }
    else
    {
      v29 = v10;

      v28 = v29;
      if (!v13)
        goto LABEL_32;
    }
    if (CFAbsoluteTimeGetCurrent() - v14 >= 0.01)
    {
      v31 = 0;
      v13[2](v13, &v31, 1.0);
      if (v31)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v34 = 315;
          v35 = 2080;
          v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curati"
                "on/PGCurationManager.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v16 = 0;
        goto LABEL_33;
      }
    }
LABEL_32:
    v16 = v28;
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
  v31 = 0;
  v13[2](v13, &v31, 0.0);
  if (!v31)
  {
    v14 = v15;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v34 = 280;
    v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGC"
          "urationManager.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v16 = 0;
LABEL_35:

  return v16;
}

+ (id)sceneInfoWithAsset:(id)a3 curationSession:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v16[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareAssets:", v8);

  objc_msgSend(v7, "clsSceneClassifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v11 = (void *)MEMORY[0x1E0D77E18];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__PGCurationManager_sceneInfoWithAsset_curationSession___block_invoke;
  v14[3] = &unk_1E842EF28;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v11, "enumerateSignalsFromAsset:fullHierarchyName:usingBlock:", v7, 0, v14);

  return v12;
}

+ (id)representativeAssetsForAssets:(id)a3 progressBlock:(id)a4
{
  id v6;
  void *v7;
  double v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  double Current;
  char v30;
  unint64_t v31;
  void *v32;
  double v33;
  char v34;
  void *v36;
  void *v37;
  void *context;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  double *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  int v66;
  __int16 v67;
  const char *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v6 = a4;
  v7 = _Block_copy(v6);
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v55 = 0;
  v56 = (double *)&v55;
  v57 = 0x2020000000;
  v58 = 0;
  v39 = v6;
  if (v7
    && (v8 = CFAbsoluteTimeGetCurrent(), v8 - v56[3] >= 0.01)
    && (v56[3] = v8,
        v54 = 0,
        (*((void (**)(void *, char *, double))v7 + 2))(v7, &v54, 0.0),
        v9 = *((_BYTE *)v60 + 24) | v54,
        (*((_BYTE *)v60 + 24) = v9) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v66 = 336;
      v67 = 2080;
      v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/P"
            "GCurationManager.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    context = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(a1, "summaryClusteringForDuration:", 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __65__PGCurationManager_representativeAssetsForAssets_progressBlock___block_invoke;
    v49[3] = &unk_1E8434F30;
    v12 = v7;
    v50 = v12;
    v51 = &v55;
    v52 = &v59;
    v53 = 0x3F847AE147AE147BLL;
    v37 = v11;
    objc_msgSend(v11, "densityClustersWithItems:progressBlock:", v40, v49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (*((_BYTE *)v60 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v66 = 345;
        v67 = 2080;
        v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation"
              "/PGCurationManager.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      if ((unint64_t)objc_msgSend(v13, "count") < 0x101)
      {
        v17 = v14;
      }
      else
      {
        v15 = objc_alloc_init(MEMORY[0x1E0D71AA8]);
        objc_msgSend(v15, "setNumberOfClusters:", 256);
        v36 = v15;
        objc_msgSend(v15, "performWithDataset:progressBlock:", v14, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v18 = v16;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v64, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v46 != v20)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "objects");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "firstObject");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v23);

            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v64, 16);
          }
          while (v19);
        }

      }
      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v14 = v17;
      v25 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v63, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v42;
        while (2)
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v42 != v26)
              objc_enumerationMutation(v14);
            v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
            if (v7)
            {
              Current = CFAbsoluteTimeGetCurrent();
              if (Current - v56[3] >= 0.01)
              {
                v56[3] = Current;
                v54 = 0;
                (*((void (**)(id, char *, double))v12 + 2))(v12, &v54, 0.8);
                v30 = *((_BYTE *)v60 + 24) | v54;
                *((_BYTE *)v60 + 24) = v30;
                if (v30)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    v66 = 363;
                    v67 = 2080;
                    v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Curation/PGCurationManager.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  goto LABEL_41;
                }
              }
            }
            v31 = objc_msgSend(v28, "count");
            if (v31)
            {
              objc_msgSend(v28, "objectAtIndexedSubscript:", v31 >> 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addObject:", v32);

            }
          }
          v25 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v63, 16);
          if (v25)
            continue;
          break;
        }
      }

      if (v7
        && (v33 = CFAbsoluteTimeGetCurrent(), v33 - v56[3] >= 0.01)
        && (v56[3] = v33,
            v54 = 0,
            (*((void (**)(id, char *, double))v12 + 2))(v12, &v54, 1.0),
            v34 = *((_BYTE *)v60 + 24) | v54,
            (*((_BYTE *)v60 + 24) = v34) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v66 = 373;
          v67 = 2080;
          v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curati"
                "on/PGCurationManager.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_41:
        v10 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v10 = v24;
      }

    }
    objc_autoreleasePoolPop(context);
  }
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

  return v10;
}

+ (id)representativeAssetsForAssetCollection:(id)a3 curationContext:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  char v22;
  NSObject *v23;
  void *v24;
  double v25;
  char v26;
  id v27;
  void *v28;
  double Current;
  char v30;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _QWORD v46[2];
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _Block_copy(v10);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x2020000000;
  v41 = 0;
  if (!v11
    || (v12 = CFAbsoluteTimeGetCurrent(), v12 - v39[3] < 0.01)
    || (v39[3] = v12,
        v37 = 0,
        (*((void (**)(void *, char *, double))v11 + 2))(v11, &v37, 0.0),
        v13 = *((_BYTE *)v43 + 24) | v37,
        (*((_BYTE *)v43 + 24) = v13) == 0))
  {
    objc_msgSend(v8, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "librarySpecificFetchOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *MEMORY[0x1E0CD1A40];
    v46[0] = *MEMORY[0x1E0CD19C0];
    v46[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFetchPropertySets:", v18);

    objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPersonsPrefetchMode:", 0);
    objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v8, v16, v19, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "numberOfItems"))
    {
      if (!v11
        || (v21 = CFAbsoluteTimeGetCurrent(), v21 - v39[3] < 0.01)
        || (v39[3] = v21,
            v37 = 0,
            (*((void (**)(void *, char *, double))v11 + 2))(v11, &v37, 0.5),
            v22 = *((_BYTE *)v43 + 24) | v37,
            (*((_BYTE *)v43 + 24) = v22) == 0))
      {
        objc_msgSend(v20, "allItems");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v24, "count") > 0x200)
        {
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __90__PGCurationManager_representativeAssetsForAssetCollection_curationContext_progressBlock___block_invoke;
          v32[3] = &unk_1E8434F30;
          v27 = v11;
          v33 = v27;
          v34 = &v38;
          v35 = &v42;
          v36 = 0x3F847AE147AE147BLL;
          objc_msgSend(a1, "representativeAssetsForAssets:progressBlock:", v24, v32);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11
            && (Current = CFAbsoluteTimeGetCurrent(), Current - v39[3] >= 0.01)
            && (v39[3] = Current,
                v37 = 0,
                (*((void (**)(id, char *, double))v27 + 2))(v27, &v37, 1.0),
                v30 = *((_BYTE *)v43 + 24) | v37,
                (*((_BYTE *)v43 + 24) = v30) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v48 = 408;
              v49 = 2080;
              v50 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cu"
                    "ration/PGCurationManager.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v14 = (id)MEMORY[0x1E0C9AA60];
          }
          else
          {
            v14 = v28;
          }

        }
        else
        {
          v14 = v24;
        }

        goto LABEL_31;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_21:
        v14 = (id)MEMORY[0x1E0C9AA60];
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 67109378;
      v48 = 397;
      v49 = 2080;
      v50 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/P"
            "GCurationManager.m";
      v23 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!v11)
        goto LABEL_21;
      v25 = CFAbsoluteTimeGetCurrent();
      if (v25 - v39[3] < 0.01)
        goto LABEL_21;
      v39[3] = v25;
      v37 = 0;
      (*((void (**)(void *, char *, double))v11 + 2))(v11, &v37, 1.0);
      v26 = *((_BYTE *)v43 + 24) | v37;
      *((_BYTE *)v43 + 24) = v26;
      if (!v26 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_21;
      *(_DWORD *)buf = 67109378;
      v48 = 393;
      v49 = 2080;
      v50 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/P"
            "GCurationManager.m";
      v23 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v48 = 383;
    v49 = 2080;
    v50 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGC"
          "urationManager.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v14 = (id)MEMORY[0x1E0C9AA60];
LABEL_32:
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v14;
}

+ (id)representativeAssetsForAssets:(id)a3 extendedCuratedAssets:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v9, "count") > 0x200)
  {
    objc_msgSend(a1, "representativeAssetsForAssets:progressBlock:", v8, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v9;
  }
  v12 = v11;

  return v12;
}

+ (id)dedupedAssetsWithAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "assetsBeautifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deduplicateItems:debugInfo:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (double)contentScoreForAssets:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    v9 = *MEMORY[0x1E0D77DD8];
    v10 = *MEMORY[0x1E0D77DE0];
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v15, "clsContentScore", (_QWORD)v25);
        v17 = v16;
        if (v16 >= v9 && objc_msgSend(v15, "clsIsUtility"))
          v17 = v10;
        v13 = v13 + v17;
        v18 = v12 + 1.0;
        if (v17 >= v10)
          v18 = v12;
        if (v17 <= v10)
          v12 = v18;
        else
          v11 = v11 + 1.0;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }
  else
  {
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
  }
  v19 = (double)v4;

  v20 = (v11 * v11 - v12 * v12) * 0.25 / (v19 * v19);
  v21 = log2((double)v4);
  v22 = pow(fabs(v20), 1.0 / v21);
  if (v20 < 0.0)
    v23 = -v22;
  else
    v23 = v22;

  return (v13 / v19 + (v23 + 1.0) * 0.5) * 0.5;
}

+ (BOOL)areAssetsInteresting:(id)a3 minimumNumberOfCuratedAssets:(unint64_t)a4 duration:(unint64_t)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_msgSend(v8, "count");
  objc_msgSend(a1, "assetsBeautifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "maximumNumberOfItemsForDuration:withTotalNumberOfItems:", a5, v9);
  if (v11 >= v9)
    v12 = v9;
  else
    v12 = v11;
  objc_msgSend(v10, "performWithItems:maximumNumberOfItemsToChoose:progressBlock:", v8, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") >= a4 && (double)v12 * 0.3 <= (double)(unint64_t)objc_msgSend(v13, "count"))
  {
    v14 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v16 = 134218240;
      v17 = objc_msgSend(v13, "count");
      v18 = 2048;
      v19 = v12;
      _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "AssetCollection is not interesting: \"Not enough best assets from beautifier (%lu/%lu) for assets\", (uint8_t *)&v16, 0x16u);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)summaryClusteringForDuration:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint8_t v28[16];

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setOptimalDayDistributionThreshold:", 30.0);
  objc_msgSend(v4, "setTimeSpanDensityAverageNumberOfObjects:", 300);
  objc_msgSend(v4, "setEnableDensityClusteringLocationsDistance:", 1);
  objc_msgSend(v4, "setDensityClusteringLocationsDistanceUnit:", 2000);
  switch(a3)
  {
    case 1uLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 10800.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 7);
      objc_msgSend(v4, "setConciseDensityClusteringMaximumDistance:", 1800.0);
      v12 = v4;
      v13 = 3;
      goto LABEL_26;
    case 2uLL:
    case 0x14uLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 10800.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 7);
      objc_msgSend(v4, "setConciseDensityClusteringMaximumDistance:", 1800.0);
      v5 = v4;
      v6 = 3;
      goto LABEL_4;
    case 3uLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 10800.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 7);
      objc_msgSend(v4, "setConciseDensityClusteringMaximumDistance:", 1800.0);
      objc_msgSend(v4, "setConciseDensityClusteringMinimumNumberOfObjects:", 3);
      objc_msgSend(v4, "setEnableMultipassDensityClustering:", 0);
      v14 = v4;
      v15 = 3;
      goto LABEL_17;
    case 4uLL:
    case 0xBuLL:
    case 0x15uLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 10800.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 1);
      objc_msgSend(v4, "setConciseDensityClusteringMaximumDistance:", 1800.0);
      v5 = v4;
      v6 = 1;
LABEL_4:
      objc_msgSend(v5, "setConciseDensityClusteringMinimumNumberOfObjects:", v6);
      objc_msgSend(v4, "setEnableMultipassDensityClustering:", 0);
      objc_msgSend(v4, "setAdaptiveElectionMinimumNumberOfItemsByCluster:", 1);
      objc_msgSend(v4, "setEnableAdaptiveElectionSmoother:", 1);
      objc_msgSend(v4, "setEnableAdaptiveElectionSmootherAutomaticLimit:", 1);
      v7 = v4;
      v8 = 7;
      goto LABEL_18;
    case 5uLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 10800.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 1);
      objc_msgSend(v4, "setConciseDensityClusteringMaximumDistance:", 1800.0);
      v16 = v4;
      v17 = 1;
      goto LABEL_16;
    case 6uLL:
    case 0xAuLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 1800.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 1);
      v9 = v4;
      goto LABEL_7;
    case 7uLL:
      v18 = 1800.0;
      goto LABEL_24;
    case 8uLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 10800.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 1);
      v19 = 1800.0;
      v20 = v4;
      goto LABEL_25;
    case 9uLL:
    case 0x10uLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 10800.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 1);
      v9 = v4;
LABEL_7:
      objc_msgSend(v9, "setConciseDensityClusteringMaximumDistance:", 1800.0);
      objc_msgSend(v4, "setConciseDensityClusteringMinimumNumberOfObjects:", 1);
      objc_msgSend(v4, "setEnableMultipassDensityClustering:", 0);
      objc_msgSend(v4, "setAdaptiveElectionMinimumNumberOfItemsByCluster:", 1);
      objc_msgSend(v4, "setEnableAdaptiveElectionSmoother:", 0);
      v10 = v4;
      v11 = 0;
      goto LABEL_28;
    case 0xCuLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 10800.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 1);
      v21 = 1800.0;
      v22 = v4;
      goto LABEL_32;
    case 0xDuLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 3600.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 1);
      objc_msgSend(v4, "setConciseDensityClusteringMaximumDistance:", 900.0);
      objc_msgSend(v4, "setConciseDensityClusteringMinimumNumberOfObjects:", 1);
      objc_msgSend(v4, "setEnableMultipassDensityClustering:", 0);
      objc_msgSend(v4, "setAdaptiveElectionMinimumNumberOfItemsByCluster:", 1);
      objc_msgSend(v4, "setAdaptiveElectionMaximumNumberOfItemsByCluster:", 1);
      goto LABEL_27;
    case 0xEuLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 10800.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 5);
      objc_msgSend(v4, "setConciseDensityClusteringMaximumDistance:", 1800.0);
      v16 = v4;
      v17 = 3;
LABEL_16:
      objc_msgSend(v16, "setConciseDensityClusteringMinimumNumberOfObjects:", v17);
      objc_msgSend(v4, "setEnableMultipassDensityClustering:", 0);
      v14 = v4;
      v15 = 1;
LABEL_17:
      objc_msgSend(v14, "setAdaptiveElectionMinimumNumberOfItemsByCluster:", v15);
      objc_msgSend(v4, "setEnableAdaptiveElectionSmoother:", 1);
      objc_msgSend(v4, "setEnableAdaptiveElectionSmootherAutomaticLimit:", 1);
      v7 = v4;
      v8 = 4;
LABEL_18:
      objc_msgSend(v7, "setAdaptiveElectionSmootherMinimumLimit:", v8);
      v23 = v4;
      v24 = 20;
      goto LABEL_29;
    case 0xFuLL:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 10800.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 1);
      objc_msgSend(v4, "setConciseDensityClusteringMaximumDistance:", 1800.0);
      objc_msgSend(v4, "setConciseDensityClusteringMinimumNumberOfObjects:", 1);
      objc_msgSend(v4, "setEnableMultipassDensityClustering:", 0);
      objc_msgSend(v4, "setAdaptiveElectionMinimumNumberOfItemsByCluster:", 1);
      objc_msgSend(v4, "setEnableAdaptiveElectionSmoother:", 1);
      objc_msgSend(v4, "setEnableAdaptiveElectionSmootherAutomaticLimit:", 1);
      objc_msgSend(v4, "setAdaptiveElectionSmootherMinimumLimit:", 1);
      v23 = v4;
      v24 = 2;
      goto LABEL_29;
    case 0x16uLL:
      objc_msgSend(v4, "setEnableDensityClusteringLocationsDistance:", 0);
      v18 = 86400.0;
LABEL_24:
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", v18);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 1);
      v20 = v4;
      v19 = v18;
LABEL_25:
      objc_msgSend(v20, "setConciseDensityClusteringMaximumDistance:", v19);
      v12 = v4;
      v13 = 1;
LABEL_26:
      objc_msgSend(v12, "setConciseDensityClusteringMinimumNumberOfObjects:", v13);
      objc_msgSend(v4, "setEnableMultipassDensityClustering:", 0);
      objc_msgSend(v4, "setAdaptiveElectionMinimumNumberOfItemsByCluster:", 1);
LABEL_27:
      objc_msgSend(v4, "setEnableAdaptiveElectionSmoother:", 1);
      v10 = v4;
      v11 = 1;
LABEL_28:
      objc_msgSend(v10, "setEnableAdaptiveElectionSmootherAutomaticLimit:", v11);
      objc_msgSend(v4, "setAdaptiveElectionSmootherMinimumLimit:", 1);
      v23 = v4;
      v24 = 1;
      goto LABEL_29;
    case 0x17uLL:
      objc_msgSend(v4, "setEnableDensityClusteringLocationsDistance:", 0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMaximumDistance:", 86400.0);
      objc_msgSend(v4, "setDiffuseDensityClusteringMinimumNumberOfObjects:", 1);
      v22 = v4;
      v21 = 86400.0;
LABEL_32:
      objc_msgSend(v22, "setConciseDensityClusteringMaximumDistance:", v21);
      objc_msgSend(v4, "setConciseDensityClusteringMinimumNumberOfObjects:", 1);
      objc_msgSend(v4, "setEnableMultipassDensityClustering:", 0);
      objc_msgSend(v4, "setAdaptiveElectionMinimumNumberOfItemsByCluster:", 1);
      objc_msgSend(v4, "setEnableAdaptiveElectionSmoother:", 1);
      objc_msgSend(v4, "setEnableAdaptiveElectionSmootherAutomaticLimit:", 1);
      objc_msgSend(v4, "setAdaptiveElectionSmootherMinimumLimit:", 1);
      v23 = v4;
      v24 = 3;
LABEL_29:
      objc_msgSend(v23, "setAdaptiveElectionSmootherMaximumLimit:", v24);
      break;
    default:
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "loggingConnection");
      v26 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v28 = 0;
        _os_log_error_impl(&dword_1CA237000, v26, OS_LOG_TYPE_ERROR, "Unsupported PGDuration", v28, 2u);
      }

      break;
  }
  return v4;
}

+ (id)assetsBeautifier
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D4B110], "beautifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnableStatisticalSampling:", 1);
  objc_msgSend(v2, "setEnableNetworkAccess:", 0);
  objc_msgSend(v2, "setEnableIntermediateNaturalClustering:", 1);
  objc_msgSend(v2, "setEnableFinalNaturalClustering:", 1);
  objc_msgSend(v2, "setEnableFinalTimeClustering:", 1);
  objc_msgSend(v2, "setUsesKMeans:", 1);
  return v2;
}

+ (unint64_t)maximumNumberOfItemsForDuration:(unint64_t)a3 withTotalNumberOfItems:(unint64_t)a4
{
  return objc_msgSend(a1, "maximumNumberOfItemsForDuration:withTotalNumberOfItems:spanningNumberOfDays:", a3, a4, 0.0);
}

+ (unint64_t)maximumNumberOfItemsForDuration:(unint64_t)a3 withTotalNumberOfItems:(unint64_t)a4 spanningNumberOfDays:(double)a5
{
  double v6;
  long double v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  BOOL v14;
  void *v15;
  NSObject *v16;
  double v17;
  double v18;
  long double v19;
  uint8_t v20[16];

  if (a3 == 1)
  {
    v8 = 9;
  }
  else if (a3 == 2)
  {
LABEL_3:
    v6 = (double)a4;
    v7 = 0.8;
LABEL_4:
    v8 = (unint64_t)pow(v6, v7);
    v9 = v8 >= 0x50;
    v10 = 80;
LABEL_5:
    if (v9)
      v8 = v10;
    v11 = v8 > 6;
    v12 = 6;
LABEL_9:
    if (!v11)
      v8 = v12;
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x14)
  {
    v8 = a4;
    if (a4 >= 0x15)
      v8 = (unint64_t)fmin((pow((double)a4 / 20.0, 0.148) + -1.0) * 135.135135 + 20.0, 80.0);
  }
  else
  {
    v8 = a4;
    switch(a3)
    {
      case 3uLL:
      case 5uLL:
        v8 = (unint64_t)pow((double)a4, 0.827129859);
        if (v8 >= 0xC0)
          v8 = 192;
        v11 = v8 > 0xC;
        v12 = 12;
        goto LABEL_9;
      case 4uLL:
        goto LABEL_3;
      case 6uLL:
      case 0x10uLL:
        break;
      case 7uLL:
        v14 = a4 >= 0x50;
        v8 = 80;
        goto LABEL_30;
      case 8uLL:
      case 0xFuLL:
        v14 = a4 >= 4;
        v8 = 4;
        goto LABEL_30;
      case 9uLL:
      case 0xAuLL:
        v14 = a4 >= 0x100;
        v8 = 256;
        goto LABEL_30;
      case 0xBuLL:
        v6 = (double)a4;
        v7 = 0.915306674;
        goto LABEL_4;
      case 0xCuLL:
      case 0xDuLL:
        v14 = a4 >= 7;
        v8 = 7;
LABEL_30:
        if (!v14)
          v8 = a4;
        break;
      case 0xEuLL:
        if (a5 >= 15.0)
          v17 = 80.0;
        else
          v17 = a5 * 60.0 / 15.0 + 20.0;
        v18 = log((v17 + -20.0) / 60.0 * -0.233333333 + 0.333333333);
        v19 = log(v17 / ((v17 + -20.0) / 60.0 * -0.233333333 + 0.333333333));
        v8 = (unint64_t)pow((double)a4, v18 / v19 + 1.0);
        v10 = (unint64_t)v17;
        v9 = v8 >= (unint64_t)v17;
        goto LABEL_5;
      default:
        +[PGLogging sharedLogging](PGLogging, "sharedLogging", a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "loggingConnection");
        v16 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v20 = 0;
          _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "Unsupported PGDuration", v20, 2u);
        }

        v8 = 0;
        break;
    }
  }
  if (v8 >= a4)
    return a4;
  else
    return v8;
}

+ (unint64_t)minimumNumberOfItemsForDuration:(unint64_t)a3 withMaximumNumberOfItems:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;

  v4 = vcvtad_u64_f64((double)a4 * 0.3);
  v5 = 4;
  if (a4 < 4)
    v5 = a4;
  if (v4 >= 4)
    return v4;
  else
    return v5;
}

+ (id)_filteredAssetsWithFaceFilter:(unint64_t)a3 forAssets:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[3];
  char v12;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    if (objc_msgSend(v5, "count"))
    {
      v11[0] = 0;
      v11[1] = v11;
      v11[2] = 0x2020000000;
      v12 = 0;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __61__PGCurationManager__filteredAssetsWithFaceFilter_forAssets___block_invoke;
      v10[3] = &unk_1E842DF58;
      v10[4] = v11;
      v10[5] = a3;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v11, 8);
    }
    else
    {
      v8 = (id)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

+ (id)filteredAssetsFromAssets:(id)a3 withContextualAssetLocalIdentifiers:(id)a4 approximateTimeDistance:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v27;
  id v28;
  void *v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id obj;
  uint64_t v55;
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
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", &__block_literal_global_242);
  objc_msgSend(v10, "setMaximumDistance:", a5);
  objc_msgSend(v10, "setMinimumNumberOfObjects:", 2);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier IN %@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mutableCopy");

  v52 = (id)v13;
  objc_msgSend(v10, "performWithDataset:progressBlock:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "count"))
    goto LABEL_45;
  v48 = v10;
  v49 = v9;
  objc_msgSend(a1, "defaultAssetSortDescriptors");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v8;
  objc_msgSend(v8, "sortedArrayUsingDescriptors:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v51 = v14;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (!v15)
    goto LABEL_26;
  v16 = v15;
  v55 = *(_QWORD *)v65;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v65 != v55)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      objc_msgSend(v18, "objects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      if (!v20)
      {
        v23 = 0;
        v22 = 0;
        goto LABEL_23;
      }
      v21 = v20;
      v22 = 0;
      v23 = 0;
      v24 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v61 != v24)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "cls_universalDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23 || objc_msgSend(v23, "compare:", v26) == 1)
          {
            v27 = v26;

            v23 = v27;
          }
          if (!v22 || objc_msgSend(v22, "compare:", v26) == -1)
          {
            v28 = v26;

            v22 = v28;
          }

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v21);

      if (v23)
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v23, v22);
        objc_msgSend(v53, "addObject:", v19);
LABEL_23:

      }
    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  }
  while (v16);
LABEL_26:

  v29 = v53;
  v10 = v48;
  v9 = v49;
  v14 = v51;
  if (objc_msgSend(v53, "count"))
  {
    objc_msgSend(v53, "sortUsingSelector:", sel_startDate);
    v30 = objc_msgSend(v53, "count");
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v31 = v50;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v32)
    {
      v33 = v32;
      v34 = 0;
      v35 = *(_QWORD *)v57;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v57 != v35)
            objc_enumerationMutation(v31);
          v37 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v36);
          objc_msgSend(v37, "cls_universalDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectAtIndexedSubscript:", v34);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "containsDate:", v38);

          if ((v40 & 1) != 0)
          {
            objc_msgSend(v52, "addObject:", v37);
          }
          else
          {
            if (v34 >= v30)
            {
LABEL_42:

              v10 = v48;
              v9 = v49;
              v14 = v51;
              v29 = v53;
              goto LABEL_43;
            }
            while (1)
            {
              objc_msgSend(v53, "objectAtIndexedSubscript:", v34);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "endDate");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "compare:", v38);

              if (v43 != -1)
                break;
              if (v30 == ++v34)
                goto LABEL_42;
            }
          }

          ++v36;
          v14 = v51;
          v29 = v53;
        }
        while (v36 != v33);
        v44 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        v33 = v44;
        v10 = v48;
        v9 = v49;
      }
      while (v44);
    }
LABEL_43:

  }
  v8 = v47;
LABEL_45:

  return v52;
}

void __106__PGCurationManager_filteredAssetsFromAssets_withContextualAssetLocalIdentifiers_approximateTimeDistance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a2, "cls_universalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cls_universalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
}

uint64_t __61__PGCurationManager__filteredAssetsWithFaceFilter_forAssets___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v10[16];

  objc_msgSend(a2, "clsFaceInformationSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (!*(_BYTE *)(v4 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Face information expected but not prefetched.", v10, 2u);
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      }
      *(_BYTE *)(v4 + 24) = 1;
    }
  }
  v5 = objc_msgSend(v3, "numberOfFaces");
  v6 = v5 != 0;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 == 2)
    v6 = v5 == 0;
  if (v7)
    v8 = v6;
  else
    v8 = 1;

  return v8;
}

void __90__PGCurationManager_representativeAssetsForAssetCollection_curationContext_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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

void __65__PGCurationManager_representativeAssetsForAssets_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __56__PGCurationManager_sceneInfoWithAsset_curationSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%llu)"), a3, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

- (id)curatedAssetsForPersonLocalIdentifier:(id)a3 progressBlock:(id)a4
{
  id v5;
  double v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double Current;
  char v21;
  NSObject *v22;
  uint64_t v23;
  double v24;
  char v25;
  uint64_t i;
  void *v27;
  void *v28;
  double v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  unint64_t v56;
  double v57;
  char v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  BOOL v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  double v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  double v82;
  BOOL v83;
  double v84;
  char v85;
  void *v86;
  double v87;
  BOOL v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  double v95;
  BOOL v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  double v102;
  BOOL v103;
  double v104;
  char v105;
  unint64_t v106;
  double v107;
  char v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  NSObject *v115;
  double v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  uint64_t j;
  void *v122;
  double v123;
  char v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  id v130;
  void *v131;
  double v132;
  double v133;
  void *v134;
  void *v135;
  double v136;
  BOOL v137;
  double v138;
  char v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t k;
  void *v143;
  double v144;
  void *v145;
  void *v146;
  id v147;
  double v148;
  unint64_t v149;
  double v150;
  char v151;
  NSObject *v152;
  id v153;
  uint64_t v154;
  NSObject *v155;
  id v156;
  NSObject *v157;
  id v158;
  NSObject *v159;
  id v160;
  double v161;
  char v162;
  NSObject *v163;
  id v164;
  void *v165;
  void (**v166)(void *, _BYTE *, double);
  NSObject *v167;
  id v168;
  int v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t m;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t n;
  uint64_t v182;
  double v183;
  char v184;
  NSObject *v185;
  id v186;
  void *v187;
  void *v188;
  id v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t ii;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  double v200;
  double v201;
  void *v202;
  void *v203;
  double v204;
  double v205;
  void *v206;
  id v207;
  double v208;
  char v209;
  NSObject *v210;
  id v211;
  void *v212;
  void *v213;
  double v214;
  char v215;
  NSObject *v216;
  id v217;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  id v225;
  id v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  id v232;
  void *v233;
  void *v234;
  void *v235;
  unint64_t v236;
  uint64_t v237;
  void *v238;
  void *v239;
  id obj;
  id obja;
  void *v242;
  void *v243;
  void *v244;
  uint64_t v245;
  void *v246;
  uint64_t v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  NSObject *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v257;
  void *v258;
  id v259;
  void *v260;
  void *v261;
  void (**v262)(void *, _BYTE *, double);
  void *v263;
  uint64_t v264;
  void *v265;
  void *v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  _QWORD v283[4];
  id v284;
  uint64_t *v285;
  uint64_t *v286;
  uint64_t v287;
  _OWORD v288[4];
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  char v313;
  os_activity_scope_state_s state;
  uint64_t v315;
  double *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t *v320;
  uint64_t v321;
  char v322;
  void *v323;
  _BYTE v324[128];
  _BYTE v325[128];
  _BYTE v326[128];
  void *v327;
  _BYTE v328[128];
  char v329[128];
  _BYTE v330[128];
  _BYTE v331[128];
  uint64_t v332;
  _BYTE v333[128];
  _BYTE v334[128];
  _BYTE v335[128];
  _BYTE v336[128];
  _QWORD v337[2];
  _QWORD v338[3];
  _QWORD v339[3];
  uint64_t v340;
  id v341;
  uint8_t buf[4];
  _BYTE v343[14];
  uint64_t v344;

  v344 = *MEMORY[0x1E0C80C00];
  v259 = a3;
  v5 = a4;
  v319 = 0;
  v320 = &v319;
  v321 = 0x2020000000;
  v322 = 0;
  v315 = 0;
  v316 = (double *)&v315;
  v317 = 0x2020000000;
  v318 = 0;
  v262 = (void (**)(void *, _BYTE *, double))_Block_copy(v5);
  v254 = v5;
  if (!v262
    || (v6 = CFAbsoluteTimeGetCurrent(), v6 - v316[3] < 0.01)
    || (v316[3] = v6,
        LOBYTE(state.opaque[0]) = 0,
        ((void (**)(void *, os_activity_scope_state_s *, double))v262)[2](v262, &state, 0.0),
        v7 = *((_BYTE *)v320 + 24) | LOBYTE(state.opaque[0]),
        (*((_BYTE *)v320 + 24) = v7) == 0))
  {
    v9 = _os_activity_create(&dword_1CA237000, "Curated Assets for people", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[1] = 0;
    state.opaque[0] = 0;
    os_activity_scope_enter(v9, &state);
    -[PGCurationManager photoLibrary](self, "photoLibrary");
    v252 = v9;
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v258, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIncludedDetectionTypes:", &unk_1E84EA0F0);
    v255 = v10;
    v11 = (void *)MEMORY[0x1E0CD16C0];
    v341 = v259;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v341, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchPersonsWithLocalIdentifiers:options:", v12, v255);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v260 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v260)
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_266:

      os_activity_scope_leave(&state);
      goto LABEL_267;
    }
    objc_msgSend(v258, "librarySpecificFetchOptions");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    v340 = *MEMORY[0x1E0CD1960];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v340, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v261, "setFetchPropertySets:", v14);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("highlightBeingExtendedAssets != nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v261, "setInternalPredicate:", v15);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v339[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v339[1] = v17;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("filename"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v339[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v339, 3);
    v251 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v261, "setInternalSortDescriptors:", v251);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForPerson:options:", v260, v261);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fetchedObjects");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    v243 = v19;
    if (v262)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v316[3] >= 0.01)
      {
        v316[3] = Current;
        v313 = 0;
        v262[2](v262, &v313, 0.5);
        v21 = *((_BYTE *)v320 + 24) | v313;
        *((_BYTE *)v320 + 24) = v21;
        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v343 = 67;
            *(_WORD *)&v343[4] = 2080;
            *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurationManager+People.m";
            v22 = MEMORY[0x1E0C81028];
LABEL_19:
            _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_20;
          }
          goto LABEL_20;
        }
      }
    }
    v23 = objc_msgSend(v263, "count");
    if (!v23)
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_265;
    }
    if (v262)
    {
      v24 = CFAbsoluteTimeGetCurrent();
      if (v24 - v316[3] >= 0.01)
      {
        v316[3] = v24;
        v313 = 0;
        v262[2](v262, &v313, 0.5);
        v25 = *((_BYTE *)v320 + 24) | v313;
        *((_BYTE *)v320 + 24) = v25;
        if (v25)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v343 = 75;
            *(_WORD *)&v343[4] = 2080;
            *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurationManager+People.m";
            v22 = MEMORY[0x1E0C81028];
            goto LABEL_19;
          }
LABEL_20:
          v8 = 0;
LABEL_265:

          goto LABEL_266;
        }
      }
    }
    v236 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfItemsForDuration:withTotalNumberOfItems:", 4, v23);
    v225 = (id)objc_msgSend((id)objc_opt_class(), "minimumNumberOfItemsForDuration:withMaximumNumberOfItems:", 4, v236);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v23; ++i)
    {
      v27 = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(v263, "objectAtIndexedSubscript:", i);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "isFavorite"))
        objc_msgSend(v266, "addObject:", v28);

      objc_autoreleasePoolPop(v27);
    }
    if (v262)
    {
      v29 = CFAbsoluteTimeGetCurrent();
      if (v29 - v316[3] >= 0.01)
      {
        v316[3] = v29;
        v313 = 0;
        v262[2](v262, &v313, 0.5);
        v30 = *((_BYTE *)v320 + 24) | v313;
        *((_BYTE *)v320 + 24) = v30;
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v343 = 92;
            *(_WORD *)&v343[4] = 2080;
            *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurationManager+People.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v8 = 0;
          goto LABEL_264;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v338[0] = v31;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v338[1] = v32;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("estimatedAssetCount"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v338[2] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v338, 3);
    v239 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", v258, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setSortDescriptors:", v239);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("estimatedAssetCount >= 10"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPredicate:", v35);
    v238 = v34;

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAssets:withType:options:", v263, 3, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "fetchedObjects");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v262)
    {
      v38 = CFAbsoluteTimeGetCurrent();
      if (v38 - v316[3] >= 0.01)
      {
        v316[3] = v38;
        v313 = 0;
        v262[2](v262, &v313, 0.5);
        v39 = *((_BYTE *)v320 + 24) | v313;
        *((_BYTE *)v320 + 24) = v39;
        if (v39)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v343 = 105;
            *(_WORD *)&v343[4] = 2080;
            *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurationManager+People.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v8 = 0;
          goto LABEL_263;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", v258, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setSortDescriptors:", v239);
    v231 = v40;
    v41 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(v263, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v337[0] = v42;
    objc_msgSend(v263, "lastObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v337[1] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v337, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "fetchAssetCollectionsContainingAssets:withType:options:", v44, 3, v231);
    v230 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v230, "firstObject");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v230, "lastObject");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v37, "count");
    if (!v45)
      goto LABEL_45;
    objc_msgSend(v37, "firstObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v235, "localIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "isEqualToString:", v48);

    if (v49)
    {
      v50 = v45 - 1;
      if (v45 == 1)
      {
        v232 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_50;
      }
      v51 = 1;
    }
    else
    {
      v51 = 0;
      v50 = v45;
    }
    objc_msgSend(v37, "lastObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "localIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v234, "localIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqualToString:", v54);

    v56 = v50 - v55;
    if (v45 == v56)
    {
LABEL_45:
      v232 = v37;
LABEL_51:
      if (v262)
      {
        v57 = CFAbsoluteTimeGetCurrent();
        if (v57 - v316[3] >= 0.01)
        {
          v316[3] = v57;
          v313 = 0;
          v262[2](v262, &v313, 0.5);
          v58 = *((_BYTE *)v320 + 24) | v313;
          *((_BYTE *)v320 + 24) = v58;
          if (v58)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 131;
              *(_WORD *)&v343[4] = 2080;
              *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v8 = 0;
            goto LABEL_262;
          }
        }
      }
      -[PGCurationManager _filteredAssetsForAssets:inMoments:keepFavorites:](self, "_filteredAssetsForAssets:inMoments:keepFavorites:", v263, v232, 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v228 = (void *)objc_msgSend(v59, "mutableCopy");

      objc_msgSend(v235, "cls_universalEndDate");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "timeIntervalSinceReferenceDate");
      v62 = v61;

      objc_msgSend(v234, "cls_universalStartDate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "timeIntervalSinceReferenceDate");
      v65 = v64;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      v264 = objc_msgSend(v266, "count");
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v266, "firstObject");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      if (v233
        && (objc_msgSend(v233, "creationDate"),
            v66 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v66, "timeIntervalSinceReferenceDate"),
            v68 = v67 > v62,
            v66,
            !v68))
      {
        objc_msgSend(v253, "addObject:", v233);
        v312 = 0u;
        v311 = 0u;
        v310 = 0u;
        v309 = 0u;
        v69 = v266;
        v77 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v309, v336, 16);
        if (v77)
        {
          v78 = *(_QWORD *)v310;
LABEL_70:
          v79 = 0;
          while (1)
          {
            if (*(_QWORD *)v310 != v78)
              objc_enumerationMutation(v69);
            v80 = *(void **)(*((_QWORD *)&v309 + 1) + 8 * v79);
            objc_msgSend(v80, "creationDate");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "timeIntervalSinceReferenceDate");
            v83 = v82 > v62;

            if (v83)
              break;
            objc_msgSend(v250, "addObject:", v80);
            if (v77 == ++v79)
            {
              v77 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v309, v336, 16);
              if (v77)
                goto LABEL_70;
              break;
            }
          }
        }
      }
      else
      {
        v307 = 0u;
        v308 = 0u;
        v305 = 0u;
        v306 = 0u;
        v69 = v263;
        v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v305, v335, 16);
        if (v70)
        {
          v71 = *(_QWORD *)v306;
LABEL_61:
          v72 = 0;
          while (1)
          {
            if (*(_QWORD *)v306 != v71)
              objc_enumerationMutation(v69);
            v73 = *(void **)(*((_QWORD *)&v305 + 1) + 8 * v72);
            objc_msgSend(v73, "creationDate");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "timeIntervalSinceReferenceDate");
            v76 = v75 > v62;

            if (v76)
              break;
            objc_msgSend(v253, "addObject:", v73);
            if (v70 == ++v72)
            {
              v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v305, v335, 16);
              if (v70)
                goto LABEL_61;
              break;
            }
          }
        }
      }

      if (v262)
      {
        v84 = CFAbsoluteTimeGetCurrent();
        if (v84 - v316[3] >= 0.01)
        {
          v316[3] = v84;
          v313 = 0;
          v262[2](v262, &v313, 0.5);
          v85 = *((_BYTE *)v320 + 24) | v313;
          *((_BYTE *)v320 + 24) = v85;
          if (v85)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 170;
              *(_WORD *)&v343[4] = 2080;
              *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v8 = 0;
            goto LABEL_261;
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v266, "lastObject");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      if (v229
        && (objc_msgSend(v229, "creationDate"),
            v86 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v86, "timeIntervalSinceReferenceDate"),
            v88 = v87 < v65,
            v86,
            !v88))
      {
        objc_msgSend(v244, "addObject:", v229);
        v303 = 0u;
        v304 = 0u;
        v301 = 0u;
        v302 = 0u;
        objc_msgSend(v266, "reverseObjectEnumerator");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v301, v334, 16);
        if (v97)
        {
          v98 = *(_QWORD *)v302;
LABEL_95:
          v99 = 0;
          while (1)
          {
            if (*(_QWORD *)v302 != v98)
              objc_enumerationMutation(v89);
            v100 = *(void **)(*((_QWORD *)&v301 + 1) + 8 * v99);
            objc_msgSend(v100, "creationDate");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "timeIntervalSinceReferenceDate");
            v103 = v102 < v62;

            if (v103)
              break;
            objc_msgSend(v250, "addObject:", v100);
            if (v97 == ++v99)
            {
              v97 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v301, v334, 16);
              if (v97)
                goto LABEL_95;
              break;
            }
          }
        }
      }
      else
      {
        v299 = 0u;
        v300 = 0u;
        v297 = 0u;
        v298 = 0u;
        objc_msgSend(v263, "reverseObjectEnumerator");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v297, v333, 16);
        if (v90)
        {
          v91 = *(_QWORD *)v298;
LABEL_86:
          v92 = 0;
          while (1)
          {
            if (*(_QWORD *)v298 != v91)
              objc_enumerationMutation(v89);
            v93 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * v92);
            objc_msgSend(v93, "creationDate");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "timeIntervalSinceReferenceDate");
            v96 = v95 < v65;

            if (v96)
              break;
            objc_msgSend(v244, "addObject:", v93);
            if (v90 == ++v92)
            {
              v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v297, v333, 16);
              if (v90)
                goto LABEL_86;
              break;
            }
          }
        }
      }

      if (objc_msgSend(v250, "count"))
        objc_msgSend(v228, "removeObjectsInArray:", v250);
      if (v262)
      {
        v104 = CFAbsoluteTimeGetCurrent();
        if (v104 - v316[3] >= 0.01)
        {
          v316[3] = v104;
          v313 = 0;
          v262[2](v262, &v313, 0.5);
          v105 = *((_BYTE *)v320 + 24) | v313;
          *((_BYTE *)v320 + 24) = v105;
          if (v105)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 203;
              *(_WORD *)&v343[4] = 2080;
              *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v8 = 0;
            goto LABEL_260;
          }
        }
      }
      if (v236 <= 1)
        v106 = 0;
      else
        v106 = v236 - 2;
      -[PGCurationManager _timeBasedAssetClustersForAssets:maximumClusterCount:](self, "_timeBasedAssetClustersForAssets:maximumClusterCount:", v228, v106);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      if (v262)
      {
        v107 = CFAbsoluteTimeGetCurrent();
        if (v107 - v316[3] >= 0.01)
        {
          v316[3] = v107;
          v313 = 0;
          v262[2](v262, &v313, 0.5);
          v108 = *((_BYTE *)v320 + 24) | v313;
          *((_BYTE *)v320 + 24) = v108;
          if (v108)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 207;
              *(_WORD *)&v343[4] = 2080;
              *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v8 = 0;
            goto LABEL_259;
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", v258, 0);
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      v332 = *MEMORY[0x1E0CD1B60];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v332, 1);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "setFetchPropertySets:", v109);

      objc_msgSend(v227, "setIncludedDetectionTypes:", &unk_1E84EA108);
      v110 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v260, "objectID");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("personForFace"), v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "setInternalPredicate:", v112);

      objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v263, v227);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGCurationManager _firstBestFacedAssetInAssetCluster:facesByAssetIdentifiers:](self, "_firstBestFacedAssetInAssetCluster:facesByAssetIdentifiers:", v253, v113);
      v114 = objc_claimAutoreleasedReturnValue();
      v223 = (void *)v114;
      if (v114)
      {
        objc_msgSend(v242, "addObject:", v114);
      }
      else
      {
        -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
        v115 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v343 = v253;
          _os_log_impl(&dword_1CA237000, v115, OS_LOG_TYPE_INFO, "nil asset from first asset cluster: %@", buf, 0xCu);
        }

      }
      if (v262)
      {
        v116 = CFAbsoluteTimeGetCurrent();
        if (v116 - v316[3] >= 0.01)
        {
          v316[3] = v116;
          v313 = 0;
          v262[2](v262, &v313, 0.5);
          v117 = *((_BYTE *)v320 + 24) | v313;
          *((_BYTE *)v320 + 24) = v117;
          if (v117)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 230;
              *(_WORD *)&v343[4] = 2080;
              *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
LABEL_179:
            v8 = 0;
LABEL_258:

LABEL_259:
LABEL_260:

LABEL_261:
LABEL_262:

            v37 = v232;
LABEL_263:

LABEL_264:
            goto LABEL_265;
          }
        }
      }
      v295 = 0u;
      v296 = 0u;
      v293 = 0u;
      v294 = 0u;
      obj = v224;
      v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v293, v331, 16);
      if (v118)
      {
        v119 = 0;
        v245 = *(_QWORD *)v294;
        v120 = *MEMORY[0x1E0D77DF0];
        do
        {
          v247 = v118;
          for (j = 0; j != v247; ++j)
          {
            if (*(_QWORD *)v294 != v245)
              objc_enumerationMutation(obj);
            v122 = *(void **)(*((_QWORD *)&v293 + 1) + 8 * j);
            if (v262)
            {
              v123 = CFAbsoluteTimeGetCurrent();
              if (v123 - v316[3] >= 0.01)
              {
                v316[3] = v123;
                v313 = 0;
                v262[2](v262, &v313, 0.5);
                v124 = *((_BYTE *)v320 + 24) | v313;
                *((_BYTE *)v320 + 24) = v124;
                if (v124)
                {
                  v155 = MEMORY[0x1E0C81028];
                  v156 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v343 = 237;
                    *(_WORD *)&v343[4] = 2080;
                    *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Curation/PGCurationManager+People.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  goto LABEL_178;
                }
              }
            }
            if (v119 >= v264)
            {
LABEL_144:
              if (v262)
              {
                v138 = CFAbsoluteTimeGetCurrent();
                if (v138 - v316[3] >= 0.01)
                {
                  v316[3] = v138;
                  v313 = 0;
                  v262[2](v262, &v313, 0.5);
                  v139 = *((_BYTE *)v320 + 24) | v313;
                  *((_BYTE *)v320 + 24) = v139;
                  if (v139)
                  {
                    v157 = MEMORY[0x1E0C81028];
                    v158 = MEMORY[0x1E0C81028];
                    if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v343 = 264;
                      *(_WORD *)&v343[4] = 2080;
                      *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Curation/PGCurationManager+People.m";
                      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }
LABEL_178:

                    goto LABEL_179;
                  }
                }
              }
              v291 = 0u;
              v292 = 0u;
              v289 = 0u;
              v290 = 0u;
              v130 = v122;
              v140 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v289, v330, 16);
              if (v140)
              {
                v141 = *(_QWORD *)v290;
                while (2)
                {
                  for (k = 0; k != v140; ++k)
                  {
                    if (*(_QWORD *)v290 != v141)
                      objc_enumerationMutation(v130);
                    v143 = *(void **)(*((_QWORD *)&v289 + 1) + 8 * k);
                    objc_msgSend(v143, "curationScore");
                    if (v144 != v120)
                    {
                      objc_msgSend(v143, "localIdentifier");
                      v145 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v113, "objectForKeyedSubscript:", v145);
                      v146 = (void *)objc_claimAutoreleasedReturnValue();
                      memset(v288, 0, sizeof(v288));
                      v147 = v146;
                      if (objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", v288, v329, 16))
                      {
                        objc_msgSend(**((id **)&v288[0] + 1), "size");
                        if (v148 >= 0.1 && v148 <= 0.7)
                        {
                          objc_msgSend(v242, "addObject:", v143);

                          goto LABEL_161;
                        }
                      }

                    }
                  }
                  v140 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v289, v330, 16);
                  if (v140)
                    continue;
                  break;
                }
              }
            }
            else
            {
              objc_msgSend(v122, "firstObject");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v125, "creationDate");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v126, "timeIntervalSinceReferenceDate");
              v128 = v127;

              v129 = 0;
              while (1)
              {
                objc_msgSend(v266, "objectAtIndexedSubscript:", v119);
                v130 = (id)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v130, "creationDate");
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "timeIntervalSinceReferenceDate");
                v133 = v132;

                if (v133 >= v128)
                  break;
                ++v119;
                v129 = v130;
                if (v264 == v119)
                {
                  v119 = v264;
LABEL_143:

                  goto LABEL_144;
                }
              }
              if (!v130)
                goto LABEL_143;
              objc_msgSend(v122, "lastObject");
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v134, "creationDate");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "timeIntervalSinceReferenceDate");
              v137 = v133 > v136;

              if (v137)
                goto LABEL_143;
              objc_msgSend(v242, "addObject:", v130);
            }
LABEL_161:

          }
          v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v293, v331, 16);
        }
        while (v118);
      }

      v149 = 0x1E0CB3000;
      if (v262)
      {
        v150 = CFAbsoluteTimeGetCurrent();
        if (v150 - v316[3] >= 0.01)
        {
          v316[3] = v150;
          v313 = 0;
          v262[2](v262, &v313, 0.5);
          v151 = *((_BYTE *)v320 + 24) | v313;
          *((_BYTE *)v320 + 24) = v151;
          if (v151)
          {
            v152 = MEMORY[0x1E0C81028];
            v153 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 300;
              *(_WORD *)&v343[4] = 2080;
              *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_179;
          }
        }
      }
      -[PGCurationManager _firstBestFacedAssetInAssetCluster:facesByAssetIdentifiers:](self, "_firstBestFacedAssetInAssetCluster:facesByAssetIdentifiers:", v244, v113);
      v154 = objc_claimAutoreleasedReturnValue();
      if (v154)
      {
        objc_msgSend(v242, "addObject:", v154);
      }
      else
      {
        -[PGCurationManager curationLoggingConnection](self, "curationLoggingConnection");
        v159 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v343 = v244;
          _os_log_impl(&dword_1CA237000, v159, OS_LOG_TYPE_INFO, "nil asset from last asset cluster: %@", buf, 0xCu);
        }

      }
      v222 = (void *)v154;
      v160 = v242;
      if (v262
        && (v161 = CFAbsoluteTimeGetCurrent(), v161 - v316[3] >= 0.01)
        && (v316[3] = v161,
            v313 = 0,
            v262[2](v262, &v313, 0.5),
            v162 = *((_BYTE *)v320 + 24) | v313,
            (*((_BYTE *)v320 + 24) = v162) != 0))
      {
        v163 = MEMORY[0x1E0C81028];
        v164 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v343 = 314;
          *(_WORD *)&v343[4] = 2080;
          *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager+People.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

      }
      else
      {
        if (objc_msgSend(v160, "count") < (unint64_t)v225)
        {
          v248 = v160;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v236);
          v265 = (void *)objc_claimAutoreleasedReturnValue();
          v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D717F8]), "initWithNumericValueKeypaths:", &unk_1E84EA120);
          objc_msgSend(v165, "setK:", v236);
          v283[0] = MEMORY[0x1E0C809B0];
          v283[1] = 3221225472;
          v283[2] = __81__PGCurationManager_People__curatedAssetsForPersonLocalIdentifier_progressBlock___block_invoke;
          v283[3] = &unk_1E8434F30;
          v166 = v262;
          v284 = v166;
          v285 = &v315;
          v287 = 0x3F847AE147AE147BLL;
          v286 = &v319;
          objc_msgSend(v165, "performWithDataset:progressBlock:", v263, v283);
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          v219 = v165;
          if (*((_BYTE *)v320 + 24))
          {
            v167 = MEMORY[0x1E0C81028];
            v168 = MEMORY[0x1E0C81028];
            v169 = 1;
            if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 327;
              *(_WORD *)&v343[4] = 2080;
              *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1CA237000, v167, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
          else
          {
            v281 = 0u;
            v282 = 0u;
            v279 = 0u;
            v280 = 0u;
            v170 = v220;
            v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v279, v328, 16);
            if (v171)
            {
              v172 = *(_QWORD *)v280;
              do
              {
                for (m = 0; m != v171; ++m)
                {
                  if (*(_QWORD *)v280 != v172)
                    objc_enumerationMutation(v170);
                  objc_msgSend(*(id *)(*((_QWORD *)&v279 + 1) + 8 * m), "objects");
                  v174 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v174, "firstObject");
                  v175 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v265, "addObject:", v175);

                }
                v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v279, v328, 16);
              }
              while (v171);
            }

            objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            v327 = v176;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v327, 1);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v265, "sortUsingDescriptors:", v177);

            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v160);
            v167 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSObject count](v167, "count"));
            v246 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v257 = (void *)objc_claimAutoreleasedReturnValue();
            v277 = 0u;
            v278 = 0u;
            v275 = 0u;
            v276 = 0u;
            v178 = v265;
            v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v275, v326, 16);
            if (v179)
            {
              v180 = *(_QWORD *)v276;
              do
              {
                for (n = 0; n != v179; ++n)
                {
                  if (*(_QWORD *)v276 != v180)
                    objc_enumerationMutation(v178);
                  v182 = *(_QWORD *)(*((_QWORD *)&v275 + 1) + 8 * n);
                  if ((-[NSObject containsObject:](v167, "containsObject:", v182) & 1) == 0)
                    objc_msgSend(v257, "addObject:", v182);
                }
                v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v275, v326, 16);
              }
              while (v179);
            }

            if (v262
              && (v183 = CFAbsoluteTimeGetCurrent(), v183 - v316[3] >= 0.01)
              && (v316[3] = v183,
                  v313 = 0,
                  v166[2](v166, &v313, 0.5),
                  v184 = *((_BYTE *)v320 + 24) | v313,
                  (*((_BYTE *)v320 + 24) = v184) != 0))
            {
              v185 = MEMORY[0x1E0C81028];
              v186 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v185, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v343 = 349;
                *(_WORD *)&v343[4] = 2080;
                *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Curation/PGCurationManager+People.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              v169 = 1;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v178);
              v188 = (void *)objc_claimAutoreleasedReturnValue();
              v273 = 0u;
              v274 = 0u;
              v271 = 0u;
              v272 = 0u;
              v189 = v248;
              v190 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v271, v325, 16);
              if (v190)
              {
                v191 = *(_QWORD *)v272;
                do
                {
                  for (ii = 0; ii != v190; ++ii)
                  {
                    if (*(_QWORD *)v272 != v191)
                      objc_enumerationMutation(v189);
                    v193 = *(_QWORD *)(*((_QWORD *)&v271 + 1) + 8 * ii);
                    if ((objc_msgSend(v188, "containsObject:", v193) & 1) == 0)
                      objc_msgSend(v187, "addObject:", v193);
                  }
                  v190 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v271, v325, 16);
                }
                while (v190);
              }

              v269 = 0u;
              v270 = 0u;
              v267 = 0u;
              v268 = 0u;
              v226 = v187;
              v194 = v257;
              obja = (id)objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v267, v324, 16);
              if (obja)
              {
                v237 = *(_QWORD *)v268;
LABEL_226:
                v195 = 0;
                while (1)
                {
                  if (*(_QWORD *)v268 != v237)
                    objc_enumerationMutation(v226);
                  v196 = *(void **)(*((_QWORD *)&v267 + 1) + 8 * (_QWORD)v195);
                  if (!objc_msgSend(v194, "count"))
                    break;
                  v197 = objc_msgSend(v194, "indexOfObject:inSortedRange:options:usingComparator:", v196, 0, objc_msgSend(v194, "count"), 1024, &__block_literal_global_40493);
                  objc_msgSend(v196, "creationDate");
                  v249 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v197)
                  {
                    v198 = v197 - 1;
                    if (v197 != objc_msgSend(v257, "count"))
                    {
                      objc_msgSend(v257, "objectAtIndexedSubscript:", v197 - 1);
                      v221 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v221, "creationDate");
                      v199 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v249, "timeIntervalSinceDate:", v199);
                      v201 = v200;

                      objc_msgSend(v257, "objectAtIndexedSubscript:", v197);
                      v202 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v202, "creationDate");
                      v203 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v203, "timeIntervalSinceDate:", v249);
                      v205 = v204;

                      if (v201 >= v205)
                        v198 = v197;

                    }
                  }
                  else
                  {
                    v198 = 0;
                  }
                  objc_msgSend(v257, "objectAtIndexedSubscript:", v198);
                  v206 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v257, "removeObjectAtIndex:", v198);
                  objc_msgSend(v246, "addObject:", v206);

                  v195 = (char *)v195 + 1;
                  v194 = v257;
                  if (obja == v195)
                  {
                    obja = (id)objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v267, v324, 16);
                    if (obja)
                      goto LABEL_226;
                    break;
                  }
                }
              }

              objc_msgSend(v178, "removeObjectsInArray:", v246);
              objc_msgSend(v178, "addObjectsFromArray:", v226);
              v248 = (void *)objc_msgSend(v178, "mutableCopy");

              v169 = 0;
            }

          }
          if (v169)
          {
            v8 = 0;
            v207 = v248;
LABEL_257:

            goto LABEL_258;
          }
          v149 = 0x1E0CB3000uLL;
          v160 = v248;
        }
        if (!v262
          || (v208 = CFAbsoluteTimeGetCurrent(), v208 - v316[3] < 0.01)
          || (v316[3] = v208,
              v313 = 0,
              v262[2](v262, &v313, 0.5),
              v209 = *((_BYTE *)v320 + 24) | v313,
              (*((_BYTE *)v320 + 24) = v209) == 0))
        {
          objc_msgSend(*(id *)(v149 + 2344), "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          v323 = v212;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v323, 1);
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "sortUsingDescriptors:", v213);

          if (v262
            && (v214 = CFAbsoluteTimeGetCurrent(), v214 - v316[3] >= 0.01)
            && (v316[3] = v214,
                v313 = 0,
                v262[2](v262, &v313, 1.0),
                v215 = *((_BYTE *)v320 + 24) | v313,
                (*((_BYTE *)v320 + 24) = v215) != 0))
          {
            v216 = MEMORY[0x1E0C81028];
            v217 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 410;
              *(_WORD *)&v343[4] = 2080;
              *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            v8 = 0;
            v207 = v160;
          }
          else
          {
            v207 = v160;
            v8 = v207;
          }
          goto LABEL_257;
        }
        v210 = MEMORY[0x1E0C81028];
        v211 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v210, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v343 = 403;
          *(_WORD *)&v343[4] = 2080;
          *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager+People.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

      }
      v8 = 0;
      v207 = v160;
      goto LABEL_257;
    }
    v232 = (id)MEMORY[0x1E0C9AA60];
    if (v56 && v56 + v51 <= v45)
    {
      objc_msgSend(v37, "subarrayWithRange:", v51);
      v232 = (id)objc_claimAutoreleasedReturnValue();

      v37 = v232;
    }
LABEL_50:

    goto LABEL_51;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v343 = 37;
    *(_WORD *)&v343[4] = 2080;
    *(_QWORD *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Curation/PGCurationManager+People.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v8 = 0;
LABEL_267:
  _Block_object_dispose(&v315, 8);
  _Block_object_dispose(&v319, 8);

  return v8;
}

- (id)_timeBasedAssetClustersForAssets:(id)a3 maximumClusterCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  BOOL v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v50;
  id v51;
  void *context;
  void *v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationManager _libraryDateInterval](self, "_libraryDateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v42 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_49;
  }
  objc_msgSend(v7, "addObject:", v9);
  v50 = v9;
  v51 = v6;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);
  if (objc_msgSend(v7, "count") >= a4)
    goto LABEL_40;
  v10 = 0;
  v53 = v7;
  v54 = a4;
  do
  {
    if (v10 == objc_msgSend(v7, "count"))
      break;
    context = (void *)MEMORY[0x1CAA4EB2C]();
    v11 = objc_msgSend(v7, "count");
    if (v11 < 1)
    {
      v10 = 0;
      goto LABEL_39;
    }
    v12 = v11;
    v10 = 0;
    while (1)
    {
      v13 = v12 - 1;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12 - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "duration");
      v18 = v17;
      objc_msgSend(v8, "objectForKeyedSubscript:", v14);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v62, "count") >= 2 && v18 >= 21600.0)
        break;
      ++v10;
LABEL_34:

      v41 = v12 <= 1;
      v12 = v13;
      if (v41)
        goto LABEL_39;
    }
    v61 = v12;
    v59 = v12 - 1;
    v19 = v18 * 0.5;
    v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v15, v19);
    objc_msgSend(v15, "dateByAddingTimeInterval:", v19 + 2.22044605e-16);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v16;
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v55, v16);
    v58 = v15;
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v22 = v21;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v23 = v62;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    v25 = (void *)v20;
    v60 = v10;
    if (!v24)
    {

      v13 = v59;
      if (v19 >= 1.0)
        goto LABEL_30;
LABEL_26:
      v31 = 1;
      goto LABEL_28;
    }
    v26 = v24;
    v27 = 0;
    v28 = v19 + v22;
    v29 = *(_QWORD *)v68;
    while (2)
    {
      v30 = 0;
      v31 = v27 + v26;
      do
      {
        if (*(_QWORD *)v68 != v29)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v30), "creationDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "timeIntervalSinceReferenceDate");
        v34 = v33;

        if (v34 > v28)
        {
          v31 = v27 + v30;
          v20 = (uint64_t)v25;
          goto LABEL_20;
        }
        ++v30;
      }
      while (v26 != v30);
      v20 = (uint64_t)v25;
      v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      v27 = v31;
      if (v26)
        continue;
      break;
    }
LABEL_20:

    if (v19 >= 1.0)
    {
      v7 = v53;
      v13 = v59;
      if (!v31)
        goto LABEL_30;
    }
    else
    {
      v7 = v53;
      v13 = v59;
      if (!v31)
        goto LABEL_26;
      if (v31 == objc_msgSend(v23, "count") && !--v31)
      {
LABEL_30:
        objc_msgSend(v7, "setObject:atIndexedSubscript:", v20, v13);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, v20);
        v36 = (void *)v56;
        v16 = v57;
        v37 = v7;
        v25 = (void *)v20;
        goto LABEL_32;
      }
    }
LABEL_28:
    v35 = objc_msgSend(v23, "count");
    v36 = (void *)v56;
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v56, v13);
    if (v31 == v35)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, v56);
      v16 = v57;
      v37 = v7;
    }
    else
    {
      v37 = v7;
      objc_msgSend(v7, "insertObject:atIndex:", v25, v61);
      objc_msgSend(v23, "subarrayWithRange:", 0, v31);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v38, v56);

      objc_msgSend(v23, "subarrayWithRange:", v31, objc_msgSend(v23, "count") - v31);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v39, v25);

      v16 = v57;
    }
LABEL_32:
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v14);
    v7 = v37;
    v40 = objc_msgSend(v37, "count");

    a4 = v54;
    if (v40 < v54)
    {
      v15 = v58;
      v10 = v60;
      v12 = v61;
      goto LABEL_34;
    }

    v10 = v60;
LABEL_39:
    objc_autoreleasePoolPop(context);
  }
  while (objc_msgSend(v7, "count") < a4);
LABEL_40:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v43 = v7;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v64 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v48);

      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v45);
  }

  v9 = v50;
  v6 = v51;
LABEL_49:

  return v42;
}

- (id)_firstBestFacedAssetInAssetCluster:(id)a3 facesByAssetIdentifiers:(id)a4
{
  id v5;
  id v6;
  id v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  _OWORD v27[4];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "curationScore");
    if (v8 == *MEMORY[0x1E0D77DF0])
      v9 = 0;
    else
      v9 = v7;
    v10 = v9;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = v5;
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v10 = 0;
      v13 = *(_QWORD *)v29;
      v14 = *MEMORY[0x1E0D77DF0];
      v15 = 0.0;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v7);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v17, "curationScore");
          if (v18 != v14)
          {
            objc_msgSend(v17, "localIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            memset(v27, 0, sizeof(v27));
            if (objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v27, v32, 16))
            {
              objc_msgSend(**((id **)&v27[0] + 1), "size");
              if (v21 >= 0.1 && v21 <= 0.7)
              {
                v25 = v17;

                v10 = v25;
                goto LABEL_26;
              }
            }
            else
            {
              v21 = 0.0;
            }
            v22 = 0.4 - v21;
            if (v22 < 0.0)
              v22 = -v22;
            v23 = 1.0 - v22;
            if (1.0 - v22 > v15)
            {
              v24 = v17;

              v10 = v24;
              v15 = v23;
            }

          }
        }
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }
    else
    {
      v10 = 0;
    }
  }
LABEL_26:

  return v10;
}

- (id)_libraryDateInterval
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  -[PGCurationManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0CD1A40];
  v21[0] = *MEMORY[0x1E0CD19C0];
  v21[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchPropertySets:", v5);

  objc_msgSend(v3, "setFetchLimit:", 1);
  objc_msgSend(v3, "setIncludeAssetSourceTypes:", 5);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v7);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v11);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "creationDate");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = 0;
  if (v14 && v15)
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v14, v15);

  return v17;
}

- (id)_filteredAssetsForAssets:(id)a3 inMoments:(id)a4 keepFavorites:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  objc_msgSend(v10, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = v15;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v36;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v21);
        if (v5)
        {
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v21), "isFavorite") & 1) != 0)
            goto LABEL_21;
          if (v19 >= v9)
            goto LABEL_22;
        }
        objc_msgSend(v22, "creationDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceReferenceDate");
        v25 = v24;

        if (v25 < v13)
          goto LABEL_22;
        if (v25 > v16)
        {
          if (++v19 >= v9)
          {
LABEL_15:
            if (!v5)
              goto LABEL_24;
            goto LABEL_22;
          }
          while (1)
          {
            v26 = v10;
            objc_msgSend(v8, "objectAtIndexedSubscript:", v19);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "startDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "timeIntervalSinceReferenceDate");
            v13 = v28;

            objc_msgSend(v10, "endDate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "timeIntervalSinceReferenceDate");
            v16 = v30;

            if (v16 >= v25)
              break;
            if (v9 == ++v19)
            {
              v19 = v9;
              goto LABEL_15;
            }
          }
        }
        if (v25 >= v13 && v25 <= v16)
LABEL_21:
          objc_msgSend(v33, "addObject:", v22);
LABEL_22:
        ++v21;
      }
      while (v21 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v18);
  }
LABEL_24:

  return v33;
}

void __81__PGCurationManager_People__curatedAssetsForPersonLocalIdentifier_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __81__PGCurationManager_People__curatedAssetsForPersonLocalIdentifier_progressBlock___block_invoke_205(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)filterAssets:(id)a3 withLocations:(id)a4 maximumDistance:(double)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  double v20;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v13, "location", v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v15 = v8;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v25;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v25 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(v14, "distanceFromLocation:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
                if (v20 < a5)
                {
                  objc_msgSend(v22, "addObject:", v13);
                  goto LABEL_17;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v17)
                continue;
              break;
            }
          }
LABEL_17:

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }

  return v22;
}

+ (id)filterAssets:(id)a3 withLocation:(id)a4 maximumDistance:(double)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "filterAssets:withLocations:maximumDistance:", v10, v11, a5, v14, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forCityNodes:(id)a5 withMaximumDistance:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a5;
  v11 = a3;
  objc_msgSend(a4, "addressNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addressNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "collectionByIntersecting:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionBySubtracting:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "locations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_filterAssets:withPositiveLocations:negativeLocations:maximumDistance:", v11, v16, v17, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forAreaNodes:(id)a5 withMaximumDistance:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a5;
  v11 = a3;
  objc_msgSend(a4, "addressNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addressNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "collectionByIntersecting:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionBySubtracting:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "locations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_filterAssets:withPositiveLocations:negativeLocations:maximumDistance:", v11, v16, v17, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forStateNodes:(id)a5 withMaximumDistance:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a5;
  v11 = a3;
  objc_msgSend(a4, "addressNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addressNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "collectionByIntersecting:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionBySubtracting:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "locations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_filterAssets:withPositiveLocations:negativeLocations:maximumDistance:", v11, v16, v17, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forLocationNodes:(id)a5 withMaximumDistance:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a5;
  v11 = a3;
  objc_msgSend(a4, "addressNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addressNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "collectionByIntersecting:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionBySubtracting:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "locations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_filterAssets:withPositiveLocations:negativeLocations:maximumDistance:", v11, v16, v17, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_filterAssets:(id)a3 withPositiveLocations:(id)a4 negativeLocations:(id)a5 maximumDistance:(double)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t j;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t k;
  double v30;
  id v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v34 = a4;
  v10 = a5;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v15, "location");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v17 = v34;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v40;
            v21 = 1.79769313e308;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v40 != v20)
                  objc_enumerationMutation(v17);
                objc_msgSend(v16, "distanceFromLocation:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
                if (v23 < v21)
                  v21 = v23;
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            }
            while (v19);
          }
          else
          {
            v21 = 1.79769313e308;
          }

          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v24 = v10;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v36;
            v28 = 1.79769313e308;
            do
            {
              for (k = 0; k != v26; ++k)
              {
                if (*(_QWORD *)v36 != v27)
                  objc_enumerationMutation(v24);
                objc_msgSend(v16, "distanceFromLocation:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k));
                if (v30 < v28)
                  v28 = v30;
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
            }
            while (v26);
          }
          else
          {
            v28 = 1.79769313e308;
          }

          if (v21 < a6 && v21 <= v28)
            objc_msgSend(v32, "addObject:", v15);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v12);
  }

  return v32;
}

@end
