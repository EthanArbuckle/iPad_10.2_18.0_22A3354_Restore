@implementation PXSearchResultsAssetCurator

+ (void)performCurationForAssetResults:(id)a3 sceneIdentifiers:(id)a4 searchQuery:(id)a5 sceneTaxonomyProvider:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  os_signpost_id_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  os_signpost_id_t v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  os_signpost_id_t v35;
  void *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  os_signpost_id_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  NSObject *v58;
  os_signpost_id_t v59;
  os_signpost_id_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void (**v70)(id, void *, void *);
  void *v71;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _BYTE *v81;
  uint8_t v82[4];
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  id v87;
  uint8_t v88[128];
  _BYTE buf[24];
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v68 = a4;
  v13 = a5;
  v67 = a6;
  v70 = (void (**)(id, void *, void *))a7;
  v73 = v12;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultsAssetCurator.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetResults"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchResultsAssetCurator.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchQuery"));

LABEL_3:
  PLPhotosSearchGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = objc_msgSend(v12, "count");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "Photos Search Results Asset Curator: Begin curation process for results with count: %lu for query: %@", buf, 0x16u);
  }

  objc_msgSend(v13, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "disableTopAssetCuration");

  if (v17)
    objc_msgSend(v15, "setCuratedAssetLimit:", 0);
  if (objc_msgSend(v15, "curatedAssetLimit"))
  {
    PLPhotosSearchGetLog();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_make_with_pointer(v18, a1);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PXSearchResultsAssetCurator - TotalCurationTimeDuration", " enableTelemetry=YES ", buf, 2u);
      }
    }

    v21 = objc_msgSend(v15, "curatedAssetLimit");
    objc_msgSend(v13, "priorityAssetUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchResultsAssetCurator _sampledAssetUUIDsFromAssetResults:curatedAssetLimit:priorityAssetUUID:maxNumberToSample:rangeToSample:](PXSearchResultsAssetCurator, "_sampledAssetUUIDsFromAssetResults:curatedAssetLimit:priorityAssetUUID:maxNumberToSample:rangeToSample:", v12, v21, v22, 160, 20);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXSearchResultsAssetCurator fetchAssetsForAssetUUIDs:](PXSearchResultsAssetCurator, "fetchAssetsForAssetUUIDs:", v71);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotosSearchGetLog();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = os_signpost_id_make_with_pointer(v23, a1);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v25 = v24;
      if (os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PXSearchResultsAssetCurator - FaultInAssets", " enableTelemetry=YES ", buf, 2u);
      }
    }

    v26 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v66, "fetchedObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "arrayWithArray:", v27);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    PLPhotosSearchGetLog();
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v29 = os_signpost_id_make_with_pointer(v28, a1);
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v30 = v29;
      if (os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v28, OS_SIGNPOST_INTERVAL_END, v30, "PXSearchResultsAssetCurator - FaultInAssets", " enableTelemetry=YES ", buf, 2u);
      }
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v90 = __Block_byref_object_copy__295646;
    v91 = __Block_byref_object_dispose__295647;
    v92 = (id)MEMORY[0x1E0C9AA60];
    v31 = objc_msgSend(v69, "count");
    if (v31 <= objc_msgSend(v15, "curatedAssetLimit"))
    {
      PLPhotosSearchGetLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v82 = 138412290;
        v83 = (uint64_t)v13;
        _os_log_impl(&dword_1A6789000, v41, OS_LOG_TYPE_DEFAULT, "Photos Search Results Asset Curator: Not enough assets to perform curation for query: %@, returning all asset results", v82, 0xCu);
      }

      v42 = *(_QWORD *)&buf[8];
      v43 = v69;
      v36 = *(void **)(v42 + 40);
      *(_QWORD *)(v42 + 40) = v43;
    }
    else
    {
      PLPhotosSearchGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v82 = 134218242;
        v83 = objc_msgSend(v69, "count");
        v84 = 2112;
        v85 = (uint64_t)v13;
        _os_log_impl(&dword_1A6789000, v32, OS_LOG_TYPE_DEFAULT, "Photos Search Results Asset Curator: Curating sampled assets with count %lu for query: %@", v82, 0x16u);
      }

      if ((unint64_t)objc_msgSend(v68, "count") > 5)
      {
        v36 = 0;
      }
      else
      {
        PLPhotosSearchGetLog();
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = os_signpost_id_make_with_pointer(v33, a1);
        if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v35 = v34;
          if (os_signpost_enabled(v33))
          {
            *(_WORD *)v82 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v35, "PXSearchResultsAssetCurator - FetchSceneClassifications", " enableTelemetry=YES ", v82, 2u);
          }
        }

        objc_msgSend(MEMORY[0x1E0CD1750], "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:", v69);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        PLPhotosSearchGetLog();
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = os_signpost_id_make_with_pointer(v37, a1);
        if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v39 = v38;
          if (os_signpost_enabled(v37))
          {
            *(_WORD *)v82 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v37, OS_SIGNPOST_INTERVAL_END, v39, "PXSearchResultsAssetCurator - FetchSceneClassifications", " enableTelemetry=YES ", v82, 2u);
          }
        }

      }
      PLPhotosSearchGetLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = objc_msgSend(v36, "count");
        *(_DWORD *)v82 = 134218242;
        v83 = v46;
        v84 = 2112;
        v85 = (uint64_t)v13;
        _os_log_impl(&dword_1A6789000, v45, OS_LOG_TYPE_DEFAULT, "Photos Search Results Asset Curator: Fetched scene classification objects with count %lu for query: %@", v82, 0x16u);
      }

      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __124__PXSearchResultsAssetCurator_performCurationForAssetResults_sceneIdentifiers_searchQuery_sceneTaxonomyProvider_completion___block_invoke_140;
      v78[3] = &unk_1E5147828;
      v81 = buf;
      v79 = v13;
      v80 = v15;
      +[PXSearchResultsAssetCurator _curationObjectsFromAssets:scenesMap:sceneIdentifiers:sceneTaxonomyProvider:completion:](PXSearchResultsAssetCurator, "_curationObjectsFromAssets:scenesMap:sceneIdentifiers:sceneTaxonomyProvider:completion:", v69, v36, v68, v67, v78);

    }
    +[PXSearchResultsAssetCurator _fetchResultForCuratedAssets:](PXSearchResultsAssetCurator, "_fetchResultForCuratedAssets:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v73, "count"));
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v49 = v73;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
    if (v50)
    {
      v51 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v75 != v51)
            objc_enumerationMutation(v49);
          v53 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(v53, "assetUUID");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v53, v54);

        }
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
      }
      while (v50);
    }

    objc_msgSend(v47, "fetchedObjects");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v48;
    PXMap();
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    PLPhotosSearchGetLog();
    v58 = (id)objc_claimAutoreleasedReturnValue();
    v59 = os_signpost_id_make_with_pointer(v58, a1);
    if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v60 = v59;
      if (os_signpost_enabled(v58))
      {
        *(_WORD *)v82 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v58, OS_SIGNPOST_INTERVAL_END, v60, "PXSearchResultsAssetCurator - TotalCurationTimeDuration", " enableTelemetry=YES ", v82, 2u);
      }
    }

    PLPhotosSearchGetLog();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = objc_msgSend(v47, "count");
      v63 = objc_msgSend(v57, "count");
      *(_DWORD *)v82 = 134218498;
      v83 = v62;
      v84 = 2048;
      v85 = v63;
      v86 = 2112;
      v87 = v13;
      _os_log_impl(&dword_1A6789000, v61, OS_LOG_TYPE_DEFAULT, "Photos Search Results Asset Curator: returning %lu curated assets and %lu total assets for query: %@", v82, 0x20u);
    }

    v70[2](v70, v57, v47);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (objc_msgSend(v15, "wantsCuratedAssetsFetchResult"))
    {
      PXMap();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSearchResultsAssetCurator fetchAssetsForAssetUUIDs:](PXSearchResultsAssetCurator, "fetchAssetsForAssetUUIDs:", v40);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v71 = 0;
    }
    PLPhotosSearchGetLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v44, OS_LOG_TYPE_DEFAULT, "Photos Search Results Asset Curator: no curation requested for asset results, returning full asset result collection", buf, 2u);
    }

    v70[2](v70, v12, v71);
  }

}

+ (id)_sampledAssetUUIDsFromAssetResults:(id)a3 curatedAssetLimit:(unint64_t)a4 priorityAssetUUID:(id)a5 maxNumberToSample:(unint64_t)a6 rangeToSample:(unint64_t)a7
{
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  os_signpost_id_t v30;
  os_signpost_id_t v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  uint8_t v38[16];
  uint8_t buf[16];

  v12 = a3;
  v13 = a5;
  PLPhotosSearchGetLog();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_make_with_pointer(v14, a1);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PXSearchResultsAssetCurator - SampleAssets", " enableTelemetry=YES ", buf, 2u);
    }
  }

  PXMap();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  v19 = (void *)objc_opt_new();
  if (v18 <= a6)
  {
    v28 = objc_msgSend(v17, "mutableCopy");

    v19 = (void *)v28;
  }
  else
  {
    if (v18 >= a4)
      v20 = a4;
    else
      v20 = v18;
    v21 = v18 / v20;
    if (v18 / v20 >= a7)
      v22 = a7;
    else
      v22 = v18 / v20;
    v37 = v20;
    v34 = a1;
    v35 = v13;
    v36 = v12;
    v23 = 0;
    v24 = 0;
    v25 = v22;
    do
    {
      v26 = v23;
      if (v23 < v23 + v22)
      {
        do
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", v26, v34, v35, v36);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v27);

          ++v26;
        }
        while (v26 != v25);
      }
      v23 += v21;
      if (v23 >= v18)
        break;
      ++v24;
      v25 += v21;
    }
    while (v24 < v37);
    v13 = v35;
    v12 = v36;
    a1 = v34;
  }
  if (v13
    && (objc_msgSend(v19, "containsObject:", v13) & 1) == 0
    && objc_msgSend(v17, "containsObject:", v13))
  {
    objc_msgSend(v19, "addObject:", v13);
  }
  PLPhotosSearchGetLog();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v30 = os_signpost_id_make_with_pointer(v29, a1);
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v31 = v30;
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)v38 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v29, OS_SIGNPOST_INTERVAL_END, v31, "PXSearchResultsAssetCurator - SampleAssets", " enableTelemetry=YES ", v38, 2u);
    }
  }

  v32 = (void *)objc_msgSend(v19, "copy");
  return v32;
}

+ (id)_sortedCuratedAssetsFromCurationObjects:(id)a3 priorityAssetUUID:(id)a4 curatedAssetLimit:(unint64_t)a5 shouldPrioritizeDominantObjectResults:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  os_signpost_id_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  os_signpost_id_t v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  os_signpost_id_t v66;
  os_signpost_id_t v67;
  void *v69;
  void *v70;
  void *v71;
  id ptr;
  void *v73;
  void *v74;
  void *v75;
  unint64_t v76;
  id v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  char v81;
  void *v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[8];
  _BYTE v93[128];
  _BYTE v94[128];
  _QWORD v95[3];

  v6 = a6;
  v95[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v83 = a4;
  if (v6)
  {
    +[PXSearchResultsAssetCurator _momentUUIDsByAssetUUIDsFromAssetCurationObjects:](PXSearchResultsAssetCurator, "_momentUUIDsByAssetUUIDsFromAssetCurationObjects:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") >= a5)
    {
      v12 = objc_msgSend(v11, "count");
      if (v12 == objc_msgSend(v10, "count"))
      {
        PLPhotosSearchGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Photos Search Results Asset Curator: Begin dominancy curation process", buf, 2u);
        }

        PLPhotosSearchGetLog();
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = os_signpost_id_make_with_pointer(v14, a1);
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v16 = v15;
          if (os_signpost_enabled(v14))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PXSearchResultsAssetCurator - CurateDominantAssets", " enableTelemetry=YES ", buf, 2u);
          }
        }

        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dominantSceneScore"), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v95[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sortedArrayUsingDescriptors:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v75 = (void *)v19;
        +[PXSearchResultsAssetCurator _assetsCuratedForDominancyFromCuratedObjects:momentUUIDsByAssetUUIDs:curatedAssetLimit:](PXSearchResultsAssetCurator, "_assetsCuratedForDominancyFromCuratedObjects:momentUUIDsByAssetUUIDs:curatedAssetLimit:", v19, v11, a5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "mutableCopy");

        if (v83)
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K MATCHES %@"), CFSTR("asset.uuid"), v83);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "filteredArrayUsingPredicate:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "asset");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K MATCHES %@"), CFSTR("uuid"), v83);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "filteredArrayUsingPredicate:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25 && !v28)
          {
            objc_msgSend(v21, "removeLastObject");
            objc_msgSend(v21, "addObject:", v25);
          }

        }
        PLPhotosSearchGetLog();
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v30 = os_signpost_id_make_with_pointer(v29, a1);
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v31 = v30;
          if (os_signpost_enabled(v29))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v29, OS_SIGNPOST_INTERVAL_END, v31, "PXSearchResultsAssetCurator - CurateDominantAssets", " enableTelemetry=YES ", buf, 2u);
          }
        }

        v32 = (void *)objc_msgSend(v21, "copy");
        goto LABEL_60;
      }
    }
  }
  else
  {
    v11 = 0;
  }
  PLPhotosSearchGetLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_DEFAULT, "Photos Search Results Asset Curator: Begin curation process", buf, 2u);
  }
  v73 = v11;

  PLPhotosSearchGetLog();
  v34 = (id)objc_claimAutoreleasedReturnValue();
  ptr = a1;
  v35 = os_signpost_id_make_with_pointer(v34, a1);
  if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v36 = v35;
    if (os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v36, "PXSearchResultsAssetCurator - CurateAssets", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v17 = (void *)objc_opt_new();
  v37 = objc_msgSend(v10, "count");
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.curationScore"), 0);
  v39 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.overallAestheticScore"), 0);
  v40 = objc_claimAutoreleasedReturnValue();
  v71 = (void *)v39;
  objc_msgSend(v38, "addObject:", v39);
  v70 = (void *)v40;
  objc_msgSend(v38, "addObject:", v40);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.uuid"), 0);
  v75 = v38;
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObject:");
  if (a5)
  {
    v41 = 0;
    v81 = 0;
    v42 = 0;
    v80 = v37 / a5;
    v79 = v37 % a5;
    v76 = a5;
    v77 = v10;
    v74 = v17;
    do
    {
      if (v41 >= v79)
        v43 = v80;
      else
        v43 = v80 + 1;
      objc_msgSend(v10, "subarrayWithRange:", v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      v82 = v44;
      if (v83 && (v81 & 1) == 0)
      {
        v78 = v43;
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v46 = v44;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v89;
          while (2)
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v89 != v49)
                objc_enumerationMutation(v46);
              v51 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
              objc_msgSend(v51, "asset");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "uuid");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "isEqualToString:", v83);

              if ((v54 & 1) != 0)
              {
                objc_msgSend(v51, "asset");
                v56 = (id)objc_claimAutoreleasedReturnValue();
                v17 = v74;
                objc_msgSend(v74, "addObject:", v56);
                v81 = 1;
                a5 = v76;
                v10 = v77;
                v43 = v78;
                goto LABEL_53;
              }
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
            if (v48)
              continue;
            break;
          }
        }

        a5 = v76;
        v10 = v77;
        v17 = v74;
        v43 = v78;
        v45 = v82;
      }
      objc_msgSend(v45, "sortedArrayUsingDescriptors:", v75);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v56 = v55;
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
      if (v57)
      {
        v58 = v57;
        v59 = v43;
        v60 = *(_QWORD *)v85;
        while (2)
        {
          for (j = 0; j != v58; ++j)
          {
            if (*(_QWORD *)v85 != v60)
              objc_enumerationMutation(v56);
            v62 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
            objc_msgSend(v62, "asset");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v63, "pixelWidth") && objc_msgSend(v63, "pixelHeight"))
            {
              objc_msgSend(v62, "asset");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v64);

              goto LABEL_51;
            }

          }
          v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
          if (v58)
            continue;
          break;
        }
LABEL_51:
        v46 = v56;
        v43 = v59;
        a5 = v76;
        v10 = v77;
LABEL_53:
        v45 = v82;
      }
      else
      {
        v46 = v56;
      }

      v42 += v43;
      ++v41;
    }
    while (v41 != a5);
  }
  PLPhotosSearchGetLog();
  v65 = (id)objc_claimAutoreleasedReturnValue();
  v66 = os_signpost_id_make_with_pointer(v65, ptr);
  if (v66 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    v67 = v66;
    if (os_signpost_enabled(v65))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v65, OS_SIGNPOST_INTERVAL_END, v67, "PXSearchResultsAssetCurator - CurateAssets", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v32 = (void *)objc_msgSend(v17, "copy");
  v11 = v73;
  v21 = v71;
LABEL_60:

  return v32;
}

+ (id)_assetsCuratedForDominancyFromCuratedObjects:(id)a3 momentUUIDsByAssetUUIDs:(id)a4 curatedAssetLimit:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", a5);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", a5);
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v14, "count");

  if (objc_msgSend(v9, "count") < a5)
  {
    v15 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "asset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "containsObject:", v19) & 1) == 0 && (objc_msgSend(v10, "containsObject:", v18) & 1) == 0)
      {
        objc_msgSend(v9, "addObject:", v17);
        objc_msgSend(v10, "addObject:", v18);
        objc_msgSend(v11, "addObject:", v19);
      }
      if (++v15 == objc_msgSend(v7, "count") || v23 == objc_msgSend(v11, "count"))
      {
        objc_msgSend(v11, "removeAllObjects");
        v15 = 0;
      }

    }
    while (objc_msgSend(v9, "count") < a5);
  }
  PLPhotosSearchGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = v23;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "Photos Search Results Asset Curator: Curated top assets for dominancy, with %lu unique moment IDs available", buf, 0xCu);
  }

  v21 = (void *)objc_msgSend(v9, "copy");
  return v21;
}

+ (void)_curationObjectsFromAssets:(id)a3 scenesMap:(id)a4 sceneIdentifiers:(id)a5 sceneTaxonomyProvider:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  PXSearchResultsAssetCurationObject *v23;
  float v24;
  void *v25;
  void (**v26)(id, void *, _QWORD);
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v28 = a4;
  v12 = a5;
  v13 = a6;
  v26 = (void (**)(id, void *, _QWORD))a7;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v11;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v20, "localIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = -[PXSearchResultsAssetCurationObject initWithAsset:sceneClassifications:searchQuerySceneIdentifiers:sceneTaxonomyProvider:]([PXSearchResultsAssetCurationObject alloc], "initWithAsset:sceneClassifications:searchQuerySceneIdentifiers:sceneTaxonomyProvider:", v20, v22, v12, v13);
        objc_msgSend(v14, "addObject:", v23);
        -[PXSearchResultsAssetCurationObject dominantSceneScore](v23, "dominantSceneScore");
        if (v24 > 0.0)
          ++v17;

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  v25 = (void *)objc_msgSend(v14, "copy");
  v26[2](v26, v25, v17);

}

+ (id)_momentUUIDsByAssetUUIDsFromAssetCurationObjects:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a3;
  PLPhotosSearchGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, a1);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXSearchResultsAssetCurator - FetchMomentUUIDs", " enableTelemetry=YES ", buf, 2u);
    }
  }

  PXMap();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1570], "px_searchAssetFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentUUIDByAssetUUIDForAssets:options:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotosSearchGetLog();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, a1);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_END, v13, "PXSearchResultsAssetCurator - FetchMomentUUIDs", " enableTelemetry=YES ", v15, 2u);
    }
  }

  return v10;
}

+ (id)fetchAssetsForAssetUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  os_signpost_id_t v31;
  os_signpost_id_t v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  NSObject *v40;
  uint8_t buf[16];
  void *v42;
  _BYTE v43[128];
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotosSearchGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, a1);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXSearchResultsAssetCurator - FetchAssets", " enableTelemetry=YES ", buf, 2u);
    }
  }

  objc_msgSend(MEMORY[0x1E0CD1570], "px_searchAssetFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CD1A50];
  v44[0] = *MEMORY[0x1E0CD1A50];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPropertySets:", v10);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInternalPredicate:", v11);

  +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "disableTopAssetCuration");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __56__PXSearchResultsAssetCurator_fetchAssetsForAssetUUIDs___block_invoke;
    v39[3] = &unk_1E51478D8;
    v16 = v15;
    v40 = v16;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v39);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v34 = v4;
    v18 = v4;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v18);
          -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v22));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v20);
    }

    v24 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0CD1B90];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v24, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v17, v25, v26, v27, 0, 1);

    v4 = v34;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v30);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotosSearchGetLog();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v31 = os_signpost_id_make_with_pointer(v16, a1);
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v32 = v31;
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_END, v32, "PXSearchResultsAssetCurator - FetchAssets", " enableTelemetry=YES ", buf, 2u);
      }
    }
    v14 = v16;
  }

  return v28;
}

+ (id)_fetchResultForCuratedAssets:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1570], "px_searchAssetFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __60__PXSearchResultsAssetCurator__fetchResultForCuratedAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

void __56__PXSearchResultsAssetCurator_fetchAssetsForAssetUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "objectID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
}

uint64_t __80__PXSearchResultsAssetCurator__momentUUIDsByAssetUUIDsFromAssetCurationObjects___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asset");
}

uint64_t __134__PXSearchResultsAssetCurator__sampledAssetUUIDsFromAssetResults_curatedAssetLimit_priorityAssetUUID_maxNumberToSample_rangeToSample___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetUUID");
}

void __124__PXSearchResultsAssetCurator_performCurationForAssetResults_sceneIdentifiers_searchQuery_sceneTaxonomyProvider_completion___block_invoke_140(uint64_t a1, void *a2, uint64_t a3)
{
  _BOOL8 v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3 != 0;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "priorityAssetUUID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[PXSearchResultsAssetCurator _sortedCuratedAssetsFromCurationObjects:priorityAssetUUID:curatedAssetLimit:shouldPrioritizeDominantObjectResults:](PXSearchResultsAssetCurator, "_sortedCuratedAssetsFromCurationObjects:priorityAssetUUID:curatedAssetLimit:shouldPrioritizeDominantObjectResults:", v6, v10, objc_msgSend(*(id *)(a1 + 40), "curatedAssetLimit"), v4);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

id __124__PXSearchResultsAssetCurator_performCurationForAssetResults_sceneIdentifiers_searchQuery_sceneTaxonomyProvider_completion___block_invoke_143(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __124__PXSearchResultsAssetCurator_performCurationForAssetResults_sceneIdentifiers_searchQuery_sceneTaxonomyProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetUUID");
}

@end
