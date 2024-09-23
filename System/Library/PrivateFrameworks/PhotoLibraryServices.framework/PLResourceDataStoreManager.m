@implementation PLResourceDataStoreManager

+ (id)storesForLibraryID:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  if (!storesForLibraryID__defaultStoreClassIDs)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E375D7D0, &unk_1E375D7E8, &unk_1E375D800, &unk_1E375D818, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)storesForLibraryID__defaultStoreClassIDs;
    storesForLibraryID__defaultStoreClassIDs = v4;

  }
  objc_msgSend((id)s_dataStoresByClassIDByLibraryID, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
  v8 = objc_msgSend(v7, "count");
  if (v8 < objc_msgSend((id)storesForLibraryID__defaultStoreClassIDs, "count"))
  {
    if (!v7)
      v7 = (id)MEMORY[0x1E0C9AA60];
    v9 = (void *)objc_msgSend((id)storesForLibraryID__defaultStoreClassIDs, "mutableCopy");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v7;
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend((id)objc_opt_class(), "storeClassID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          PLDataStoreForClassIDAndLibraryID((unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "integerValue"), v3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v7, "arrayByAddingObject:", v20);
            v21 = objc_claimAutoreleasedReturnValue();

            v7 = (id)v21;
          }

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v17);
    }

  }
  return v7;
}

+ (id)storeForExternalResource:(id)a3 inLibraryWithID:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceDataStoreManager.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

  }
  objc_msgSend(a1, "storesForLibraryID:", v8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "canStoreExternalResource:", v7))
        {
          v10 = v13;
          goto LABEL_13;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  return v10;
}

+ (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceDataStoreManager.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v7, "assetID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "storesForLibraryID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "updateDerivativeResourcesForAsset:forLifecycleEvent:", v7, v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unionSet:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  return v8;
}

+ (id)storeExternalResources:(id)a3 forAsset:(id)a4 forLifecycleEvent:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t (*__ptr32 *v19)();
  id v20;
  void *v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  PLResourceDataStoreOptions *v26;
  PLResourceDataStoreOptions *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  PLResourceDataStoreOptions *v32;
  void *v33;
  int v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v54;
  void *v55;
  id *v56;
  void *context;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  PLResourceDataStoreOptions *v66;
  int v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  const __CFString *v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  _BYTE v87[128];
  uint64_t v88;

  v7 = *(_QWORD *)&a5;
  v88 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceDataStoreManager.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalResources"));

    if (v12)
      goto LABEL_3;
LABEL_48:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLResourceDataStoreManager.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_48;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "libraryID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  context = (void *)MEMORY[0x19AEC1554]();
  PLImageManagerGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = v17;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "[RM]: Storing external resources for asset: %@", buf, 0xCu);

  }
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v18 = v10;
  v19 = &off_199B99000;
  v62 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
  v63 = v15;
  v60 = v18;
  if (!v62)
  {

    goto LABEL_33;
  }
  v56 = a6;
  v20 = 0;
  v61 = *(_QWORD *)v75;
  v59 = *MEMORY[0x1E0D74600];
  v58 = *MEMORY[0x1E0CB2D50];
  v21 = v18;
  while (2)
  {
    v64 = v20;
    for (i = 0; i != v62; ++i)
    {
      if (*(_QWORD *)v75 != v61)
        objc_enumerationMutation(v21);
      v23 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
      objc_msgSend(a1, "storeForExternalResource:inLibraryWithID:", v23, v15);
      v24 = objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v41 = (void *)MEMORY[0x1E0CB35C8];
        v79 = v58;
        v80 = CFSTR("Failed to find a store for a resource.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "errorWithDomain:code:userInfo:", v59, 2, v42);
        v43 = objc_claimAutoreleasedReturnValue();

        v20 = (id)v43;
        goto LABEL_30;
      }
      v25 = (void *)v24;
      v26 = objc_alloc_init(PLResourceDataStoreOptions);
      v27 = v26;
      if ((_DWORD)v7 == 1)
      {
        v28 = 1;
      }
      else
      {
        if ((_DWORD)v7 != 2)
          goto LABEL_16;
        v28 = 0;
      }
      -[PLResourceDataStoreOptions setAssumeNoExistingResources:](v26, "setAssumeNoExistingResources:", v28);
LABEL_16:
      PLImageManagerGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v84 = v23;
        v85 = 2112;
        v86 = v25;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEBUG, "[RM]: Storing external resource: %@ in store: %@...", buf, 0x16u);
      }

      PLImageManagerGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v23, "fileURL");
        v31 = v21;
        v32 = v27;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v84 = v33;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEBUG, "[RM]:   resource url: %@", buf, 0xCu);

        v27 = v32;
        v21 = v31;
        v15 = v63;
      }

      v72 = 0;
      v73 = 0;
      v66 = v27;
      v34 = objc_msgSend(v25, "storeExternalResource:forAsset:options:error:resultingResource:", v23, v12, v27, &v73, &v72);
      v35 = v73;
      v36 = v72;
      v37 = v36;
      if (v34)
      {
        objc_msgSend(v36, "setAsset:", v12);
        objc_msgSend(v13, "addObject:", v37);
      }
      else
      {
        v38 = (void *)MEMORY[0x1E0CB35C8];
        v81 = v58;
        v82 = CFSTR("Failed while storing a resource.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v39 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", v59, 3, v39);
        v40 = objc_claimAutoreleasedReturnValue();

        v37 = (void *)v39;
        v21 = v60;
        v64 = (void *)v40;
        v15 = v63;
      }

      if (!v34)
      {
        v20 = v64;
        goto LABEL_30;
      }
    }
    v20 = v64;
    v62 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    if (v62)
      continue;
    break;
  }
LABEL_30:

  v19 = &off_199B99000;
  if (v20)
  {
    objc_autoreleasePoolPop(context);
    if (v56)
    {
      v20 = objc_retainAutorelease(v20);
      v44 = 0;
      *v56 = v20;
    }
    else
    {
      v44 = 0;
    }
    goto LABEL_45;
  }
LABEL_33:
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend(a1, "storesForLibraryID:", v15);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v69;
    v67 = *((_QWORD *)v19 + 189);
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v69 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        objc_msgSend(v50, "updateDerivativeResourcesForAsset:forLifecycleEvent:", v12, v7);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unionSet:", v51);
        if (objc_msgSend(v51, "count"))
        {
          PLImageManagerGetLog();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v67;
            v84 = v51;
            v85 = 2112;
            v86 = v50;
            _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_DEBUG, "[RM]: Produced derivative resources: %@ for store: %@", buf, 0x16u);
          }

        }
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    }
    while (v47);
  }

  objc_autoreleasePoolPop(context);
  v44 = v13;
  v20 = 0;
  v15 = v63;
  v21 = v60;
LABEL_45:

  return v44;
}

@end
