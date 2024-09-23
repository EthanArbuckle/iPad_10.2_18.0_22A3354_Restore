@implementation PGRevGeocodeProcessor

- (PGRevGeocodeProcessor)initWithPhotoLibrary:(id)a3 homeLocations:(id)a4 loggingConnection:(id)a5 locationCache:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PGRevGeocodeProcessor *v14;
  PGRevGeocodeProcessor *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PGRevGeocodeProcessor;
  v14 = -[PGRevGeocodeProcessor init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_photoLibrary, v10);
    objc_storeStrong((id *)&v15->_homeLocations, a4);
    objc_storeStrong((id *)&v15->_loggingConnection, a5);
    objc_storeStrong((id *)&v15->_locationCache, a6);
  }

  return v15;
}

- (BOOL)revGeocodeAssets:(id)a3 progressBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PGAssetCluster *v23;
  void *v24;
  PGAssetCluster *v25;
  BOOL v26;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v12, "locationDataProperties");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "coordinate");
        v15 = v14;
        v17 = v16;

        if ((objc_msgSend(MEMORY[0x1E0D71860], "canUseCoordinate:", v15, v17) & 1) != 0)
        {
          v18 = objc_alloc(MEMORY[0x1E0C9E368]);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUIDString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v18, "initWithCenter:radius:identifier:", v20, v15, v17, 20.0);

          objc_msgSend(v12, "coarseLocationProperties");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "gpsHorizontalAccuracy");
          objc_msgSend(v21, "setClsHorizontalAccuracy:");

          v23 = [PGAssetCluster alloc];
          v35 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[PGAssetCluster initWithAssets:region:](v23, "initWithAssets:region:", v24, v21);

          objc_msgSend(v30, "addObject:", v25);
        }
        else
        {
          objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }

  -[PGRevGeocodeProcessor _setRevGeoLocationData:onAssets:](self, "_setRevGeoLocationData:onAssets:", 0, v6);
  v26 = -[PGRevGeocodeProcessor _revGeocodeAssetClusters:progressBlock:](self, "_revGeocodeAssetClusters:progressBlock:", v30, v29);

  return v26;
}

- (BOOL)revGeocodeMoments:(id)a3 progressBlock:(id)a4
{
  void (**v5)(void *, mach_timebase_info *, double);
  double Current;
  char v7;
  BOOL v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  char v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  double v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint32_t denom;
  uint32_t numer;
  NSObject *v38;
  NSObject *v39;
  unint64_t numberOfMomentsRevGeocoded;
  NSObject *v41;
  void *v42;
  double v43;
  char v44;
  uint64_t v46;
  os_signpost_id_t spid;
  unint64_t v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  id v54;
  _QWORD v56[4];
  void (**v57)(void *, mach_timebase_info *, double);
  uint64_t *v58;
  uint64_t *v59;
  double v60;
  double v61;
  uint64_t v62;
  id v63;
  char v64;
  mach_timebase_info info;
  uint64_t v66;
  double *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  uint8_t buf[4];
  _BYTE v75[18];
  __int16 v76;
  double v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v50 = a4;
  v5 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v50);
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  v66 = 0;
  v67 = (double *)&v66;
  v68 = 0x2020000000;
  v69 = 0;
  if (v5)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v67[3] >= 0.01)
    {
      v67[3] = Current;
      LOBYTE(info.numer) = 0;
      v5[2](v5, &info, 0.0);
      v7 = *((_BYTE *)v71 + 24) | LOBYTE(info.numer);
      *((_BYTE *)v71 + 24) = v7;
      if (v7)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v75 = 144;
          *(_WORD *)&v75[4] = 2080;
          *(_QWORD *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Data Model Enrichment/PGRevGeocodeProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v8 = 0;
        goto LABEL_59;
      }
    }
  }
  v53 = objc_msgSend(v54, "count");
  if (!v53)
  {
    v8 = 1;
    goto LABEL_59;
  }
  -[PGRevGeocodeProcessor loggingConnection](self, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  spid = v10;
  v48 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ReverseGeocodeMoments", ", buf, 2u);
  }
  v49 = v12;

  info = 0;
  mach_timebase_info(&info);
  v13 = mach_absolute_time();
  -[PGRevGeocodeProcessor _resetMetrics](self, "_resetMetrics");
  v46 = v13;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v51 = 0;
  v52 = v53 - 1;
  v17 = 0.0;
  v18 = 1.0 / (double)v53;
  do
  {
    v19 = (void *)MEMORY[0x1CAA4EB2C]();
    if (!v5
      || (v20 = CFAbsoluteTimeGetCurrent(), v20 - v67[3] < 0.01)
      || (v67[3] = v20,
          v64 = 0,
          v5[2](v5, (mach_timebase_info *)&v64, v17),
          v21 = *((_BYTE *)v71 + 24) | v64,
          (*((_BYTE *)v71 + 24) = v21) == 0))
    {
      objc_msgSend(v54, "objectAtIndexedSubscript:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      -[PGRevGeocodeProcessor _clusterAssetsInMoment:assetsWithInvalidLocationInMoment:](self, "_clusterAssetsInMoment:assetsWithInvalidLocationInMoment:", v23, &v63);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v63;
      objc_msgSend(v14, "addObjectsFromArray:", v24);
      if (v25)
        objc_msgSend(v15, "addObjectsFromArray:", v25);
      if (v5)
      {
        v26 = CFAbsoluteTimeGetCurrent();
        if (v26 - v67[3] >= 0.01)
        {
          v67[3] = v26;
          v64 = 0;
          v5[2](v5, (mach_timebase_info *)&v64, v17 + v18 * 0.5);
          v27 = *((_BYTE *)v71 + 24) | v64;
          *((_BYTE *)v71 + 24) = v27;
          if (v27)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v75 = 182;
              *(_WORD *)&v75[4] = 2080;
              *(_QWORD *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Data Model Enrichment/PGRevGeocodeProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
LABEL_40:
            v22 = 1;
            goto LABEL_41;
          }
        }
      }
      v28 = objc_msgSend(v15, "count");
      if (v28 && (v28 > 0x3E7 || v52 == v16))
      {
        v29 = -[PGRevGeocodeProcessor _setRevGeoLocationData:onAssets:](self, "_setRevGeoLocationData:onAssets:", 0, v15);
        objc_msgSend(v15, "removeAllObjects");
        if (!v29)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "loggingConnection");
          v34 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA237000, v34, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: stopping reverse geocoding early", buf, 2u);
          }

          goto LABEL_40;
        }
      }
      if ((unint64_t)objc_msgSend(v14, "count") > 0x3E7 || v52 == v16)
      {
        v56[0] = MEMORY[0x1E0C809B0];
        v30 = 0.7 / (double)v53 * (double)(unint64_t)(v16 - v51 + 1);
        v56[1] = 3221225472;
        v56[2] = __57__PGRevGeocodeProcessor_revGeocodeMoments_progressBlock___block_invoke;
        v56[3] = &unk_1E84311C8;
        v60 = v17;
        v61 = v30;
        v57 = v5;
        v58 = &v66;
        v62 = 0x3F847AE147AE147BLL;
        v59 = &v70;
        if (!-[PGRevGeocodeProcessor _revGeocodeAssetClusters:progressBlock:](self, "_revGeocodeAssetClusters:progressBlock:", v14, v56))
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "loggingConnection");
          v32 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA237000, v32, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: stopping reverse geocoding early", buf, 2u);
          }

          goto LABEL_40;
        }
        objc_msgSend(v14, "removeAllObjects");

        v51 = v16 + 1;
        v17 = v17 + v30;
      }
      v22 = 0;
      v17 = v18 + v17;
LABEL_41:

      goto LABEL_42;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v75 = 169;
      *(_WORD *)&v75[4] = 2080;
      *(_QWORD *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/Data Model Enrichment/PGRevGeocodeProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v22 = 1;
LABEL_42:
    objc_autoreleasePoolPop(v19);
    if (v22)
      goto LABEL_56;
    ++v16;
  }
  while (v53 != v16);
  v35 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v38 = v49;
  v39 = v38;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    numberOfMomentsRevGeocoded = self->_numberOfMomentsRevGeocoded;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v75 = numberOfMomentsRevGeocoded;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v39, OS_SIGNPOST_INTERVAL_END, spid, "ReverseGeocodeMoments", "[REVGEO] Reverse geocode %lu moments", buf, 0xCu);
  }

  v41 = v39;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[REVGEO] Reverse geocode %lu moments"), self->_numberOfMomentsRevGeocoded);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)v75 = "ReverseGeocodeMoments";
    *(_WORD *)&v75[8] = 2112;
    *(_QWORD *)&v75[10] = v42;
    v76 = 2048;
    v77 = (float)((float)((float)((float)(v35 - v46) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  if (v5)
  {
    v43 = CFAbsoluteTimeGetCurrent();
    if (v43 - v67[3] >= 0.01)
    {
      v67[3] = v43;
      v64 = 0;
      v5[2](v5, (mach_timebase_info *)&v64, 1.0);
      v44 = *((_BYTE *)v71 + 24) | v64;
      *((_BYTE *)v71 + 24) = v44;
      if (v44)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v75 = 226;
          *(_WORD *)&v75[4] = 2080;
          *(_QWORD *)&v75[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Data Model Enrichment/PGRevGeocodeProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_56:
        v8 = 0;
        goto LABEL_58;
      }
    }
  }
  v8 = 1;
LABEL_58:

LABEL_59:
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);

  return v8;
}

- (BOOL)_setRevGeoLocationData:(id)a3 onAssets:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  char v32;
  id v33;
  BOOL v34;
  void *v35;
  NSObject *v36;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  unint64_t v46;
  unint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D4B1D0], "sharedLocationShifter");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v12, "photosOneUpProperties");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "shiftedLocationIsValid");

        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);
        }
        else
        {
          objc_msgSend(v12, "location");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v16;
          if (v16
            && (objc_msgSend(v16, "coordinate"),
                v18 = v17,
                v20 = v19,
                (objc_msgSend(MEMORY[0x1E0D71860], "canUseCoordinate:") & 1) != 0)
            && (objc_msgSend(MEMORY[0x1E0D4B1D0], "isLocationShiftRequiredForCoordinate:", v18, v20) & 1) != 0)
          {
            objc_msgSend(v40, "shiftedCoordinateForOriginalCoordinate:", v18, v20);
            v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v21, v22);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v23 = objc_claimAutoreleasedReturnValue();
          }
          v24 = (void *)v23;
          objc_msgSend(v6, "addObject:", v23);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v9);
  }

  v25 = objc_msgSend(v7, "count");
  if (v25)
  {
    v26 = v25;
    v27 = 0;
    v28 = MEMORY[0x1E0C809B0];
    while (1)
    {
      v29 = v27 + 1000;
      v30 = v27 + 1000 >= v26 ? v26 : v27 + 1000;
      -[PGRevGeocodeProcessor photoLibrary](self, "photoLibrary");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v28;
      v42[1] = 3221225472;
      v42[2] = __57__PGRevGeocodeProcessor__setRevGeoLocationData_onAssets___block_invoke;
      v42[3] = &unk_1E84311F0;
      v46 = v27;
      v47 = v30;
      v43 = v7;
      v44 = v6;
      v45 = v39;
      v41 = 0;
      v32 = objc_msgSend(v31, "performChangesAndWait:error:", v42, &v41);
      v33 = v41;

      if ((v32 & 1) == 0)
        break;

      v27 = v29;
      if (v29 >= v26)
        goto LABEL_23;
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "loggingConnection");
    v36 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v33;
      _os_log_error_impl(&dword_1CA237000, v36, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: Error saving reverse geocoding data to database: %@", buf, 0xCu);
    }

    v34 = 0;
  }
  else
  {
LABEL_23:
    v34 = 1;
  }

  return v34;
}

- (BOOL)_revGeocodeAssetClusters:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  double Current;
  char v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _Block_copy(v7);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = (double *)&v36;
  v38 = 0x2020000000;
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "region");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    }
    while (v11);
  }

  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __64__PGRevGeocodeProcessor__revGeocodeAssetClusters_progressBlock___block_invoke;
  v27[3] = &unk_1E8434F30;
  v16 = v8;
  v28 = v16;
  v29 = &v36;
  v30 = &v40;
  v31 = 0x3F847AE147AE147BLL;
  if (-[PGRevGeocodeProcessor _populateCacheWithRegions:withProgressBlock:](self, "_populateCacheWithRegions:withProgressBlock:", v9, v27))
  {
    if (!v16
      || (Current = CFAbsoluteTimeGetCurrent(), Current - v37[3] < 0.01)
      || (v37[3] = Current,
          v26 = 0,
          (*((void (**)(id, char *, double))v16 + 2))(v16, &v26, 0.5),
          v18 = *((_BYTE *)v41 + 24) | v26,
          (*((_BYTE *)v41 + 24) = v18) == 0))
    {
      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = __64__PGRevGeocodeProcessor__revGeocodeAssetClusters_progressBlock___block_invoke_189;
      v21[3] = &unk_1E8434F30;
      v22 = v16;
      v23 = &v36;
      v24 = &v40;
      v25 = 0x3F847AE147AE147BLL;
      -[PGRevGeocodeProcessor _updateGeoInfoForAssetClusters:progressBlock:](self, "_updateGeoInfoForAssetClusters:progressBlock:", v10, v21);

      v19 = 1;
      goto LABEL_16;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v45 = 315;
      v46 = 2080;
      v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data"
            " Model Enrichment/PGRevGeocodeProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  v19 = 0;
LABEL_16:

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v19;
}

- (void)_updateGeoInfoForAssetClusters:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void (**v10)(void *, _BYTE *, double);
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  double Current;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    v9 = v8;
    v25 = v7;
    v10 = (void (**)(void *, _BYTE *, double))_Block_copy(v7);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 1.0 / (double)v9;
      v15 = *(_QWORD *)v29;
      v16 = 0.0;
      v17 = 0.0;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v11);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1CAA4EB2C]();
          if (v10)
          {
            Current = CFAbsoluteTimeGetCurrent();
            if (Current - v16 >= 0.01)
            {
              v27 = 0;
              v10[2](v10, &v27, v17);
              if (v27)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v33 = 339;
                  v34 = 2080;
                  v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Graph/Data Model Enrichment/PGRevGeocodeProcessor.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                objc_autoreleasePoolPop(v20);

                v7 = v25;
                v6 = v26;
                goto LABEL_23;
              }
              v16 = Current;
            }
          }
          objc_msgSend(v19, "region");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGRevGeocodeProcessor _revGeoLocationDataForRegion:](self, "_revGeoLocationDataForRegion:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "assets");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGRevGeocodeProcessor _setRevGeoLocationData:onAssets:](self, "_setRevGeoLocationData:onAssets:", v23, v24);

          v17 = v14 + v17;
          objc_autoreleasePoolPop(v20);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v16 = 0.0;
    }

    v7 = v25;
    v6 = v26;
    if (v10)
    {
      if (CFAbsoluteTimeGetCurrent() - v16 >= 0.01)
      {
        v27 = 0;
        v10[2](v10, &v27, 1.0);
        if (v27)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v33 = 347;
            v34 = 2080;
            v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGRevGeocodeProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_23:

  }
}

- (BOOL)_populateCacheWithRegions:(id)a3 withProgressBlock:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D4B1C8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithLocationCache:", self->_locationCache);
  v10 = objc_alloc(MEMORY[0x1E0D4B248]);
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithQueryPerformers:", v11);

  -[PGRevGeocodeProcessor loggingConnection](self, "loggingConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLoggingConnection:", v13);

  v19 = 0;
  v14 = objc_msgSend(v12, "createCacheForRegions:progressBlock:error:", v8, v7, &v19);

  v15 = v19;
  if ((v14 & 1) == 0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: Could not create cache for regions with error (%@)", buf, 0xCu);
    }

  }
  return v14;
}

- (id)_revGeoLocationDataForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  NSObject *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CLSLocationCache placemarksForLocation:](self->_locationCache, "placemarksForLocation:", v4);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "revGeoLocationData", (_QWORD)v17);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v14 = (void *)v10;
          objc_msgSend(MEMORY[0x1E0D71AA0], "infoFromPlistData:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setIsHome:", -[PGRevGeocodeProcessor _regionIsHome:](self, "_regionIsHome:", v4));
          objc_msgSend(v15, "plistData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v5;
          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v7)
        continue;
      break;
    }
  }

  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138478083;
    v22 = v4;
    v23 = 2113;
    v24 = v5;
    _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: placemarks for region (%{private}@) did not contain rev geo data: (%{private}@)", buf, 0x16u);
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)_regionIsHome:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "radius");
  v6 = v5;
  objc_msgSend(v4, "center");
  v24 = v7;
  v25 = v8;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PGRevGeocodeProcessor homeLocations](self, "homeLocations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v10)
  {
    v11 = v6 + 100.0;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "coordinate", 0, 0);
        v18 = v14;
        v19 = v15;
        CLLocationCoordinate2DGetDistanceFrom();
        if (v16 <= v11)
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16, v18, v19);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)_clusterAssetsInMoment:(id)a3 assetsWithInvalidLocationInMoment:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void *)objc_opt_class();
  -[PGRevGeocodeProcessor photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseGeoFetchOptionsForPhotoLibrary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGRevGeocodeProcessor _clusterAssets:assetsWithInvalidLocationInMoment:](self, "_clusterAssets:assetsWithInvalidLocationInMoment:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_clusterAssets:(id)a3 assetsWithInvalidLocationInMoment:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  double v31;
  PGAssetCluster *v32;
  void *v33;
  PGAssetCluster *v34;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1E0D71860];
        objc_msgSend(v12, "locationCoordinate");
        if (objc_msgSend(v13, "canUseCoordinate:"))
          v14 = v7;
        else
          v14 = v6;
        objc_msgSend(v14, "addObject:", v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v9);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v6);
  if (objc_msgSend(v7, "count"))
  {
    v38 = v6;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", &__block_literal_global_51800);
    objc_msgSend(v15, "setMaximumDistance:", 20.0);
    objc_msgSend(v15, "setMinimumNumberOfObjects:", 1);
    v36 = v15;
    v37 = v7;
    objc_msgSend(v15, "performWithDataset:progressBlock:", v7, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v40 = v16;
    v17 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v48;
      v20 = *MEMORY[0x1E0C9E490];
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v48 != v19)
            objc_enumerationMutation(v40);
          v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          objc_msgSend(v22, "meanRegion:", 20.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            objc_msgSend(v22, "objects");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
            v26 = v20;
            if (v25)
            {
              v27 = v25;
              v28 = *(_QWORD *)v44;
              v26 = v20;
              do
              {
                for (k = 0; k != v27; ++k)
                {
                  if (*(_QWORD *)v44 != v28)
                    objc_enumerationMutation(v24);
                  objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * k), "coarseLocationProperties");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "gpsHorizontalAccuracy");
                  v26 = fmax(v26, v31);

                }
                v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
              }
              while (v27);
            }

            objc_msgSend(v23, "setClsHorizontalAccuracy:", v26);
            v32 = [PGAssetCluster alloc];
            objc_msgSend(v22, "objects");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[PGAssetCluster initWithAssets:region:](v32, "initWithAssets:region:", v33, v23);

            objc_msgSend(v41, "addObject:", v34);
          }

        }
        v18 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v18);
    }

    -[PGRevGeocodeProcessor _processMetricsOfAssetClustersInMoment:](self, "_processMetricsOfAssetClustersInMoment:", v41);
    v7 = v37;
    v6 = v38;
  }
  else
  {
    v41 = (id)MEMORY[0x1E0C9AA60];
  }

  return v41;
}

- (void)_processMetricsOfAssetClustersInMoment:(id)a3
{
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  uint64_t v19;
  double *p_numberOfAssetClustersWithin50mOfCenter;
  uint64x2_t v21;
  uint64_t v22;
  unint64_t numberOfMomentsRevGeocoded;
  unint64_t v24;
  uint64x2_t v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = a3;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v5, "assets");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");

        objc_msgSend(v5, "region");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        v34 = 0;
        objc_msgSend(v8, "center");
        v33 = v9;
        v34 = v10;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v5, "assets");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v30;
          v15 = 0.0;
LABEL_8:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "location");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "coordinate");

            CLLocationCoordinate2DGetDistanceFrom();
            if (v15 < v18)
              v15 = v18;
            if (v15 >= 100.0)
              break;
            if (v13 == ++v16)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
              if (v13)
                goto LABEL_8;
              break;
            }
          }

          v19 = 104;
          if (v15 < 100.0)
            v19 = 96;
          p_numberOfAssetClustersWithin50mOfCenter = (double *)((char *)self + v19);
          if (v15 < 50.0)
            p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin50mOfCenter;
          if (v15 < 20.0)
            p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin20mOfCenter;
          if (v15 < 10.0)
            p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin10mOfCenter;
        }
        else
        {

          p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin10mOfCenter;
        }
        *p_numberOfAssetClustersWithin50mOfCenter = *p_numberOfAssetClustersWithin50mOfCenter + 1.0;
        v21.i64[0] = v7;
        v21.i64[1] = v7 * v7;
        *(float64x2_t *)&self->_sumNumberOfAssetsPerCluster = vaddq_f64(*(float64x2_t *)&self->_sumNumberOfAssetsPerCluster, vcvtq_f64_u64(v21));

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v28);
  }
  v22 = objc_msgSend(obj, "count");
  numberOfMomentsRevGeocoded = self->_numberOfMomentsRevGeocoded;
  v24 = self->_numberOfAssetClustersRevGeocoded + v22;
  v25.i64[0] = v22;
  v25.i64[1] = v22 * v22;
  *(float64x2_t *)&self->_sumNumberOfAssetClustersPerMoment = vaddq_f64(*(float64x2_t *)&self->_sumNumberOfAssetClustersPerMoment, vcvtq_f64_u64(v25));
  self->_numberOfMomentsRevGeocoded = numberOfMomentsRevGeocoded + 1;
  self->_numberOfAssetClustersRevGeocoded = v24;

}

- (void)_resetMetrics
{
  self->_numberOfAssetClustersRevGeocoded = 0;
  *(_OWORD *)&self->_numberOfAssetClusters100mPlusFromCenter = 0u;
  *(_OWORD *)&self->_numberOfAssetClustersWithin50mOfCenter = 0u;
  *(_OWORD *)&self->_numberOfAssetClustersWithin10mOfCenter = 0u;
  *(_OWORD *)&self->_sumNumberOfAssetsPerCluster = 0u;
  *(_OWORD *)&self->_sumNumberOfAssetClustersPerMoment = 0u;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_photoLibrary, a3);
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setLoggingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_loggingConnection, a3);
}

- (NSArray)homeLocations
{
  return self->_homeLocations;
}

- (void)setHomeLocations:(id)a3
{
  objc_storeStrong((id *)&self->_homeLocations, a3);
}

- (double)sumNumberOfAssetClustersPerMoment
{
  return self->_sumNumberOfAssetClustersPerMoment;
}

- (double)sumSquareNumberOfAssetClustersPerMoment
{
  return self->_sumSquareNumberOfAssetClustersPerMoment;
}

- (double)sumNumberOfAssetsPerCluster
{
  return self->_sumNumberOfAssetsPerCluster;
}

- (double)sumSquareNumberOfAssetsPerCluster
{
  return self->_sumSquareNumberOfAssetsPerCluster;
}

- (double)numberOfAssetClustersWithin10mOfCenter
{
  return self->_numberOfAssetClustersWithin10mOfCenter;
}

- (double)numberOfAssetClustersWithin20mOfCenter
{
  return self->_numberOfAssetClustersWithin20mOfCenter;
}

- (double)numberOfAssetClustersWithin50mOfCenter
{
  return self->_numberOfAssetClustersWithin50mOfCenter;
}

- (double)numberOfAssetClustersWithin100mOfCenter
{
  return self->_numberOfAssetClustersWithin100mOfCenter;
}

- (double)numberOfAssetClusters100mPlusFromCenter
{
  return self->_numberOfAssetClusters100mPlusFromCenter;
}

- (unint64_t)numberOfMomentsRevGeocoded
{
  return self->_numberOfMomentsRevGeocoded;
}

- (unint64_t)numberOfAssetClustersRevGeocoded
{
  return self->_numberOfAssetClustersRevGeocoded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeLocations, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_locationCache, 0);
}

double __74__PGRevGeocodeProcessor__clusterAssets_assetsWithInvalidLocationInMoment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "coarseLocationProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gpsHorizontalAccuracy");
  v8 = v7;

  objc_msgSend(v5, "coarseLocationProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gpsHorizontalAccuracy");
  v11 = v10;

  LODWORD(v9) = objc_msgSend(MEMORY[0x1E0D71860], "horizontalAccuracyIsCoarse:", v8);
  v12 = 21.0;
  if ((_DWORD)v9 == objc_msgSend(MEMORY[0x1E0D71860], "horizontalAccuracyIsCoarse:", v11))
  {
    objc_msgSend(v4, "locationCoordinate");
    objc_msgSend(v5, "locationCoordinate");
    CLLocationCoordinate2DGetDistanceFrom();
    v12 = v13;
  }

  return v12;
}

void __64__PGRevGeocodeProcessor__revGeocodeAssetClusters_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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

void __64__PGRevGeocodeProcessor__revGeocodeAssetClusters_progressBlock___block_invoke_189(uint64_t a1, _BYTE *a2, double a3)
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

void __57__PGRevGeocodeProcessor__setRevGeoLocationData_onAssets___block_invoke(uint64_t a1)
{
  unint64_t i;
  void *v3;
  void *v4;
  void *v5;

  for (i = *(_QWORD *)(a1 + 56); i < *(_QWORD *)(a1 + 64); ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "setShiftedLocation:", v4);
    objc_msgSend(v5, "setReverseLocationData:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v5, "setReverseLocationDataIsValid:", 1);

  }
}

void __57__PGRevGeocodeProcessor_revGeocodeMoments_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double Current;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(a1 + 56);
    v7 = *(double *)(a1 + 64);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + a3 * v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

+ (id)momentsRequiringRevGeocodingWithUUIDs:(id)a3 inPhotoLibrary:(id)a4 defaultToAllAssets:(BOOL)a5 loggingConnection:(id)a6
{
  _BOOL4 v7;
  id v9;
  NSObject *v10;
  id v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint32_t denom;
  uint32_t numer;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v34;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  double v41;
  void *v42;
  _QWORD v43[3];

  v7 = a5;
  v43[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = a4;
  v12 = os_signpost_id_generate(v10);
  v13 = v10;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MomentsRequiringRevGeocoding", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v15 = mach_absolute_time();
  objc_msgSend(v11, "librarySpecificFetchOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(assets, $asset, ($asset.additionalAttributes.reverseLocationDataIsValid == NO) OR ($asset.additionalAttributes.reverseLocationData == nil AND $asset.locationData != nil)) .@count != 0"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v34 = v15;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3528];
    v43[0] = v17;
    v43[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v21;
  }
  else
  {
    if (!v7)
    {
      v24 = 0;
      goto LABEL_14;
    }
    v34 = v15;
  }
  objc_msgSend(v16, "setInternalPredicate:", v17);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSortDescriptors:", v23);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v28 = v14;
  v29 = v28;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    v30 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 134217984;
    v37 = (const char *)v30;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v29, OS_SIGNPOST_INTERVAL_END, v12, "MomentsRequiringRevGeocoding", "[REVGEO] Fetch %lu moments requiring reverse geocoding", buf, 0xCu);
  }

  v31 = v29;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[REVGEO] Fetch %lu moments requiring reverse geocoding"), objc_msgSend(v24, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v37 = "MomentsRequiringRevGeocoding";
    v38 = 2112;
    v39 = v32;
    v40 = 2048;
    v41 = (float)((float)((float)((float)(v25 - v34) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
LABEL_14:

  return v24;
}

+ (id)reverseGeoFetchOptionsForPhotoLibrary:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CD19E8];
  v7[0] = *MEMORY[0x1E0CD1958];
  v7[1] = v4;
  v7[2] = *MEMORY[0x1E0CD1A30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFetchPropertySets:", v5);

  objc_msgSend(v3, "setIncludeGuestAssets:", 1);
  return v3;
}

@end
