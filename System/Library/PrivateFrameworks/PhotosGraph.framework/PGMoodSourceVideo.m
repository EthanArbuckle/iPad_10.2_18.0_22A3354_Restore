@implementation PGMoodSourceVideo

+ (id)_plistName
{
  return CFSTR("MoodSourceVideo");
}

- (double)weight
{
  return 0.5;
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t j;
  void *v17;
  double v18;
  double v19;
  const __CFString *v20;
  void *v21;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  const __CFString *v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  -[PGMoodSourceVideo _assetsByMomentIDs](self, "_assetsByMomentIDs");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (!v4)
  {
LABEL_31:

    goto LABEL_32;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v31 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (!v11)
      {

LABEL_22:
        v20 = 0;
        goto LABEL_23;
      }
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v27;
      v15 = 0.0;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          if (objc_msgSend(v17, "isVideo"))
          {
            ++v13;
            objc_msgSend(v17, "clsActivityScore");
            v15 = v15 + v18;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v12);

      if (!v13)
        goto LABEL_22;
      v19 = v15 / (double)v13;
      v20 = CFSTR("Extreme");
      if (v19 < 0.800000012)
      {
        v20 = CFSTR("Fast");
        if (v19 < 0.600000024)
        {
          v20 = CFSTR("Medium");
          if (v19 < 0.400000006)
            v20 = CFSTR("Slowly");
        }
      }
LABEL_23:
      if (v6)
      {
        if (v6 != v20)
          goto LABEL_31;
      }
      else
      {
        v6 = v20;
      }
    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  }
  while (v5);

  if (!v6)
  {
LABEL_32:
    v21 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_33;
  }
  v34 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v21;
}

- (id)_assetsByMomentIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  double v33;
  double v34;
  NSObject *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  void *v56;
  uint8_t buf[4];
  void *v58;
  _QWORD v59[5];

  v59[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMoodSource photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMoodSource assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMoodSource options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prefetchedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CD19F0];
    v59[0] = *MEMORY[0x1E0CD1A50];
    v59[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFetchPropertySets:", v10);

    +[PGCurationManager defaultAssetSortDescriptors](PGCurationManager, "defaultAssetSortDescriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v11);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0D77E08]);
    -[PGMoodSource photoLibrary](self, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithPhotoLibrary:", v14);

    objc_msgSend(MEMORY[0x1E0CD1390], "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v12, 9, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMoodSource options](self, "options");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPrefetchedAssets:", v7);

  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setSortDescriptors:](v17, "setSortDescriptors:", v19);

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAssets:withType:options:", v7, 3, v17);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "fetchedObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectEnumerator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "nextObject");
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSObject endDate](v22, "endDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    v25 = v24;

    if (v22)
    {
      v46 = v17;
      v47 = v7;
      v48 = v5;
      v49 = v4;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v26 = v7;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v52 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v31, "creationDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "timeIntervalSinceReferenceDate");
            v34 = v33;

            if (v34 > v25)
            {
              objc_msgSend(v21, "nextObject");
              v35 = objc_claimAutoreleasedReturnValue();

              -[NSObject endDate](v35, "endDate");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "timeIntervalSinceReferenceDate");
              v25 = v37;

              if (!v35)
              {
                +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "loggingConnection");
                v44 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v58 = v31;
                  _os_log_error_impl(&dword_1CA237000, v44, OS_LOG_TYPE_ERROR, "Error: No Moments contain Asset \"%@\", buf, 0xCu);
                }

                v22 = 0;
                goto LABEL_27;
              }
              v22 = v35;
            }
            -[NSObject uuid](v22, "uuid");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "objectForKeyedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v39)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, v38);
            }
            objc_msgSend(v39, "addObject:", v31);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
          if (v28)
            continue;
          break;
        }
      }
LABEL_27:

      v41 = v3;
      v5 = v48;
      v4 = v49;
      v17 = v46;
      v7 = v47;
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "loggingConnection");
      v22 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v7;
        _os_log_error_impl(&dword_1CA237000, v22, OS_LOG_TYPE_ERROR, "Error: No moments contain assets: %@", buf, 0xCu);
      }
      v41 = (id)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v5;
      _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Error: No assets in assetCollection: %@", buf, 0xCu);
    }
    v41 = (id)MEMORY[0x1E0C9AA70];
  }

  return v41;
}

@end
