@implementation PNDetailsViewSampler

+ (id)fetchMovieAssetsForPerson:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint32_t denom;
  uint32_t numer;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint32_t v45;
  uint32_t v46;
  NSObject *v47;
  NSObject *v48;
  os_signpost_id_t spid;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  mach_timebase_info v58;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  double v63;
  uint64_t v64;
  _QWORD v65[5];

  v65[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v57 = a1;
  objc_msgSend(a1, "_logger");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  info = 0;
  mach_timebase_info(&info);
  v10 = v8;
  v11 = v10;
  v53 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "fetchMovieAssetsForPerson", ", buf, 2u);
  }
  spid = v9;

  v51 = mach_absolute_time();
  v55 = v6;
  objc_msgSend(v6, "fetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v13, "setSortDescriptors:", 0);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v14;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v15;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInternalSortDescriptors:", v17);

  objc_msgSend(v13, "setFetchLimit:", 0);
  +[PNPersonCurationWrapper fetchCuratedAssetsForPerson:options:useSummary:](PNPersonCurationWrapper, "fetchCuratedAssetsForPerson:options:useSummary:", v7, v13, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v12;
  v19 = objc_msgSend(v57, "_maximumNumberOfClustersForCuratedAssetCount:fetchLimit:", objc_msgSend(v18, "count"), objc_msgSend(v12, "fetchLimit"));
  objc_msgSend(v18, "fetchedObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v19;
  objc_msgSend(v57, "_timeBasedAssetClustersForAssets:maximumClusterCount:photoLibrary:", v20, v19, v21);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDE3570];
  objc_msgSend(v7, "photoLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fetchOptionsWithPhotoLibrary:orObject:", v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = *MEMORY[0x24BDE37C8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFetchPropertySets:", v25);

  objc_msgSend(v24, "setIncludedDetectionTypes:", &unk_25149A7F0);
  v26 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v7, "objectID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("personForFace"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setInternalPredicate:", v28);

  v29 = v11;
  v30 = os_signpost_id_generate(v29);
  v58 = 0;
  mach_timebase_info(&v58);
  v31 = v29;
  v32 = v31;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "fetchFacesGroupedByAsset", ", buf, 2u);
  }

  v33 = mach_absolute_time();
  objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v18, v24);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = mach_absolute_time();
  numer = v58.numer;
  denom = v58.denom;
  v38 = v32;
  v39 = v38;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v39, OS_SIGNPOST_INTERVAL_END, v30, "fetchFacesGroupedByAsset", ", buf, 2u);
  }

  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v61 = "fetchFacesGroupedByAsset";
    v62 = 2048;
    v63 = (float)((float)((float)((float)(v35 - v33) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v39, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  objc_msgSend(v57, "_assetObjectIDsFromClusters:facesByAssetIdentifiers:includeExtraAssets:", v56, v34, v52 - objc_msgSend(v56, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x24BDE3488];
  objc_msgSend(v55, "fetchOptions");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "fetchAssetsWithObjectIDs:options:", v40, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = mach_absolute_time();
  v46 = info.numer;
  v45 = info.denom;
  v47 = v39;
  v48 = v47;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v48, OS_SIGNPOST_INTERVAL_END, spid, "fetchMovieAssetsForPerson", ", buf, 2u);
  }

  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v61 = "fetchMovieAssetsForPerson";
    v62 = 2048;
    v63 = (float)((float)((float)((float)(v44 - v51) * (float)v46) / (float)v45) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v43;
}

+ (id)fetchMovieAssetsForSocialGroup:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint32_t denom;
  uint32_t numer;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint32_t v51;
  uint32_t v52;
  NSObject *v53;
  NSObject *v54;
  os_signpost_id_t spid;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  mach_timebase_info v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  double v77;
  _BYTE v78[128];
  uint64_t v79;
  _QWORD v80[5];

  v80[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v67 = a1;
  objc_msgSend(a1, "_logger");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  info = 0;
  mach_timebase_info(&info);
  v10 = v8;
  v11 = v10;
  v62 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "fetchMovieAssetsForSocialGroup", ", buf, 2u);
  }
  spid = v9;
  v58 = v11;

  v57 = mach_absolute_time();
  objc_msgSend(v7, "fetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v13, "setSortDescriptors:", 0);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v14;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v15;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInternalSortDescriptors:", v17);

  objc_msgSend(v13, "setFetchLimit:", 0);
  v63 = v13;
  +[PNPersonCurationWrapper fetchCuratedAssetsForSocialGroup:options:useSummary:includeOthersInSocialGroupAssets:](PNPersonCurationWrapper, "fetchCuratedAssetsForSocialGroup:options:useSummary:includeOthersInSocialGroupAssets:", v6, v13, 1, objc_msgSend(v7, "includeOthersInSocialGroupAssets"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v67, "_maximumNumberOfClustersForCuratedAssetCount:fetchLimit:", objc_msgSend(v18, "count"), objc_msgSend(v12, "fetchLimit"));
  v66 = v18;
  objc_msgSend(v18, "fetchedObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v19;
  objc_msgSend(v67, "_timeBasedAssetClustersForAssets:maximumClusterCount:photoLibrary:", v20, v19, v21);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "photoLibrary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "librarySpecificFetchOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = *MEMORY[0x24BDE37C8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v79, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFetchPropertySets:", v24);

  objc_msgSend(v23, "setIncludedDetectionTypes:", &unk_25149A808);
  v60 = v23;
  objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsInSocialGroup:option:", v6, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v25, "count"));
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v27 = v25;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v70 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "objectID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v32);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    }
    while (v29);
  }
  v64 = v7;

  v33 = (void *)MEMORY[0x24BDE3570];
  v65 = v6;
  objc_msgSend(v6, "photoLibrary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "fetchOptionsWithPhotoLibrary:orObject:", v34, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "setIncludedDetectionTypes:", &unk_25149A820);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("personForFace"), v26);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setInternalPredicate:", v36);

  v37 = v58;
  v38 = os_signpost_id_generate(v37);
  v68 = 0;
  mach_timebase_info(&v68);
  v39 = v37;
  v40 = v39;
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v38, "fetchFacesGroupedByAsset", ", buf, 2u);
  }

  v41 = mach_absolute_time();
  objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v66, v35);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = mach_absolute_time();
  numer = v68.numer;
  denom = v68.denom;
  v46 = v40;
  v47 = v46;
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v47, OS_SIGNPOST_INTERVAL_END, v38, "fetchFacesGroupedByAsset", ", buf, 2u);
  }

  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v75 = "fetchFacesGroupedByAsset";
    v76 = 2048;
    v77 = (float)((float)((float)((float)(v43 - v41) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  objc_msgSend(v67, "_assetObjectIDsFromClusters:facesByAssetIdentifiers:includeExtraAssets:", v61, v42, v59 - objc_msgSend(v61, "count"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithObjectIDs:options:", v48, v12);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = mach_absolute_time();
  v52 = info.numer;
  v51 = info.denom;
  v53 = v47;
  v54 = v53;
  if (v62 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v54, OS_SIGNPOST_INTERVAL_END, spid, "fetchMovieAssetsForSocialGroup", ", buf, 2u);
  }

  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v75 = "fetchMovieAssetsForSocialGroup";
    v76 = 2048;
    v77 = (float)((float)((float)((float)(v50 - v57) * (float)v52) / (float)v51) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v54, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v49;
}

+ (id)_timeBasedAssetClustersForAssets:(id)a3 maximumClusterCount:(unint64_t)a4 photoLibrary:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  BOOL v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  uint64_t v61;
  uint32_t numer;
  uint32_t denom;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  os_signpost_id_t spid;
  void *v70;
  unint64_t v71;
  void *v72;
  NSObject *v73;
  id v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *context;
  void *v79;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v98;
  __int16 v99;
  double v100;
  _BYTE v101[128];
  _BYTE v102[128];
  id v103;
  _QWORD v104[4];

  v104[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_msgSend(a1, "_logger");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  info = 0;
  mach_timebase_info(&info);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "timeBasedAssetClustersForAssets", ", buf, 2u);
  }

  v76 = mach_absolute_time();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "creationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "creationDate");
  v18 = objc_claimAutoreleasedReturnValue();

  v77 = (void *)v18;
  if (!v16 || !v18)
  {
    v104[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v104, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_61;
  }
  v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v16, v18);
  if (!v19)
  {
    v103 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v103, 1);
    v67 = objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v54 = (void *)v67;
    goto LABEL_60;
  }
  v71 = v10 - 1;
  v72 = v16;
  spid = v10;
  v73 = v12;
  v74 = v8;
  v20 = v13;
  objc_msgSend(v13, "addObject:", v19);
  v75 = v7;
  v70 = (void *)v19;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, v19);
  v79 = v13;
  if (objc_msgSend(v13, "count") >= a4)
    goto LABEL_45;
  v21 = 0;
  do
  {
    if (v21 == objc_msgSend(v20, "count"))
      break;
    context = (void *)MEMORY[0x249506444]();
    v22 = objc_msgSend(v20, "count");
    if (v22 < 1)
    {
      v21 = 0;
      goto LABEL_44;
    }
    v23 = v22;
    v21 = 0;
    while (1)
    {
      v24 = v23 - 1;
      objc_msgSend(v20, "objectAtIndexedSubscript:", v23 - 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "startDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "endDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "duration");
      v29 = v28;
      objc_msgSend(v14, "objectForKeyedSubscript:", v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v30, "count") >= 2 && v29 >= 21600.0)
        break;
      ++v21;
LABEL_39:

      v53 = v23 <= 1;
      v23 = v24;
      if (v53)
        goto LABEL_44;
    }
    v84 = v21;
    v31 = v29 * 0.5;
    v86 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v26, v31);
    objc_msgSend(v26, "dateByAddingTimeInterval:", v31 + 2.22044605e-16);
    v32 = objc_claimAutoreleasedReturnValue();
    v82 = v27;
    v87 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v32, v27);
    v83 = v26;
    objc_msgSend(v26, "timeIntervalSinceReferenceDate");
    v34 = v33;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v81 = v30;
    v35 = v30;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
    v85 = (void *)v32;
    if (!v36)
    {
      v46 = v20;

      v24 = v23 - 1;
      if (v31 >= 1.0)
        goto LABEL_35;
LABEL_31:
      v42 = 1;
      goto LABEL_33;
    }
    v37 = v36;
    v38 = 0;
    v39 = v31 + v34;
    v40 = *(_QWORD *)v93;
    while (2)
    {
      v41 = 0;
      v42 = v38 + v37;
      do
      {
        if (*(_QWORD *)v93 != v40)
          objc_enumerationMutation(v35);
        objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * v41), "creationDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "timeIntervalSinceReferenceDate");
        v45 = v44;

        if (v45 > v39)
        {
          v42 = v38 + v41;
          goto LABEL_25;
        }
        ++v41;
      }
      while (v37 != v41);
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
      v38 = v42;
      if (v37)
        continue;
      break;
    }
LABEL_25:

    if (v31 >= 1.0)
    {
      v46 = v79;
      v24 = v23 - 1;
      if (!v42)
        goto LABEL_35;
    }
    else
    {
      v46 = v79;
      v24 = v23 - 1;
      if (!v42)
        goto LABEL_31;
      if (v42 == objc_msgSend(v35, "count") && !--v42)
      {
LABEL_35:
        v20 = v46;
        v49 = (void *)v87;
        objc_msgSend(v46, "setObject:atIndexedSubscript:", v87, v24);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v35, v87);
        v48 = (void *)v86;
        goto LABEL_37;
      }
    }
LABEL_33:
    v47 = objc_msgSend(v35, "count");
    v48 = (void *)v86;
    objc_msgSend(v46, "setObject:atIndexedSubscript:", v86, v24);
    if (v42 == v47)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v35, v86);
      v20 = v46;
      v49 = (void *)v87;
    }
    else
    {
      objc_msgSend(v46, "insertObject:atIndex:", v87, v23);
      objc_msgSend(v35, "subarrayWithRange:", 0, v42);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v50, v86);

      objc_msgSend(v35, "subarrayWithRange:", v42, objc_msgSend(v35, "count") - v42);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)v87;
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v51, v87);

      v20 = v46;
    }
LABEL_37:
    objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v25);
    v52 = objc_msgSend(v20, "count");

    if (v52 < a4)
    {
      v27 = v82;
      v26 = v83;
      v30 = v81;
      v21 = v84;
      goto LABEL_39;
    }

    v21 = v84;
LABEL_44:
    objc_autoreleasePoolPop(context);
  }
  while (objc_msgSend(v20, "count") < a4);
LABEL_45:
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v55 = v20;
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
  v8 = v74;
  v7 = v75;
  v16 = v72;
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v89 != v58)
          objc_enumerationMutation(v55);
        objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v60);

      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
    }
    while (v57);
  }

  v61 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v12 = v73;
  v64 = v73;
  v65 = v64;
  if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v65, OS_SIGNPOST_INTERVAL_END, spid, "timeBasedAssetClustersForAssets", ", buf, 2u);
  }

  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v98 = "timeBasedAssetClustersForAssets";
    v99 = 2048;
    v100 = (float)((float)((float)((float)(v61 - v76) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v65, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v13 = v79;
  v66 = v70;
LABEL_60:

LABEL_61:
  return v54;
}

+ (unint64_t)_maximumNumberOfClustersForCuratedAssetCount:(unint64_t)a3 fetchLimit:(unint64_t)a4
{
  unint64_t v6;
  unint64_t v7;

  v6 = (unint64_t)pow((double)a3, 0.8);
  if (v6 >= 0x50)
    v6 = 80;
  if (v6 <= 6)
    v6 = 6;
  if (v6 >= a3)
    v6 = a3;
  if (v6 >= a4)
    v7 = a4;
  else
    v7 = v6;
  if (a4)
    return v7;
  else
    return v6;
}

+ (id)_assetObjectIDsFromClusters:(id)a3 facesByAssetIdentifiers:(id)a4 includeExtraAssets:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint32_t denom;
  uint32_t numer;
  NSObject *v27;
  NSObject *v28;
  uint64_t v30;
  NSObject *v31;
  id obj;
  id v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  double v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v33 = a4;
  objc_msgSend(a1, "_logger");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  info = 0;
  mach_timebase_info(&info);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "assetObjectIDsFromClusters", ", buf, 2u);
  }
  v31 = v12;

  v30 = mach_absolute_time();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v8;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __95__PNDetailsViewSampler__assetObjectIDsFromClusters_facesByAssetIdentifiers_includeExtraAssets___block_invoke;
        v34[3] = &unk_2514804A8;
        v35 = v33;
        objc_msgSend(v18, "sortedArrayUsingComparator:", v34);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v21);

        if (a5 && (unint64_t)objc_msgSend(v19, "count") >= 2)
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v23);

          --a5;
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v15);
  }

  v24 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v27 = v31;
  v28 = v27;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v28, OS_SIGNPOST_INTERVAL_END, v10, "assetObjectIDsFromClusters", ", buf, 2u);
  }

  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "assetObjectIDsFromClusters";
    v43 = 2048;
    v44 = (float)((float)((float)((float)(v24 - v30) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v13;
}

+ (id)_logger
{
  if (_logger_onceToken_3215 != -1)
    dispatch_once(&_logger_onceToken_3215, &__block_literal_global_3216);
  return (id)_logger__log_3217;
}

void __31__PNDetailsViewSampler__logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE72308], "DetailsViewSampler");
  v1 = (void *)_logger__log_3217;
  _logger__log_3217 = (uint64_t)v0;

}

uint64_t __95__PNDetailsViewSampler__assetObjectIDsFromClusters_facesByAssetIdentifiers_includeExtraAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t j;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "isFavorite");
  if (v7 == objc_msgSend(v6, "isFavorite"))
  {
    objc_msgSend(v5, "localIdentifier");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "size");
          v16 = v15 <= 0.7 && v15 >= 0.1;
          v12 += v16;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(v6, "localIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v33;
      v23 = (void *)v31;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "size");
          v26 = v25 <= 0.7 && v25 >= 0.1;
          v21 += v26;
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v20);
    }
    else
    {
      v21 = 0;
      v23 = (void *)v31;
    }

    if (v12 == v21)
    {
      objc_msgSend(v5, "curationScore");
      v28 = v27;
      objc_msgSend(v6, "curationScore");
      if (v28 == v29)
        v8 = objc_msgSend(v23, "compare:", v17);
      else
        v8 = v28 < v29;
    }
    else
    {
      v8 = v12 > v21;
    }

  }
  else if (v7)
  {
    v8 = -1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
