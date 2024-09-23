@implementation PLPhotosStateLog

- (PLPhotosStateLog)initWithPhotoLibrary:(id)a3
{
  id v5;
  PLPhotosStateLog *v6;
  PLPhotosStateLog *v7;
  dispatch_group_t v8;
  OS_dispatch_group *group;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLPhotosStateLog;
  v6 = -[PLPhotosStateLog init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = dispatch_group_create();
    group = v7->_group;
    v7->_group = (OS_dispatch_group *)v8;

  }
  return v7;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)logMoments
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id obj;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  _BYTE v99[128];
  _QWORD v100[3];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  verificationFailures = 0;
  -[PLPhotosStateLog photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  logString(CFSTR("========== Moment Library =========="), v4, v5, v6, v7, v8, v9, v10, v82);
  v98 = 0;
  +[PLMoment allMomentsInManagedObjectContext:error:](PLMoment, "allMomentsInManagedObjectContext:error:", v3, &v98);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v98;
  v86 = v11;
  v87 = v3;
  v85 = v12;
  if (v11)
  {
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    obj = v11;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v89 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v95 != v89)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          if (v22)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "representativeDate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "representativeDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v25, "compare:", v26);

            if (v27 == -1)
            {
              ++verificationFailures;
              logString(CFSTR("VERIFICATION FAILURE **************************************** MIS-ORDERED MOMENT ****************************************"), v28, v29, v30, v31, v32, v33, v34, v83);
            }
          }
          v35 = v24;

          v22 = v35;
          objc_msgSend(v22, "uuid");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "pl_shortDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "representativeDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "title");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "cachedPhotosCount");
          objc_msgSend(v22, "cachedVideosCount");
          objc_msgSend(v22, "cachedCount");

          logStringWithIndent(1, CFSTR("<%@> %@, %@, %@. (%d P + %d V = %d)"), v40, v41, v42, v43, v44, v45, (uint64_t)v36);
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
      }
      while (v21);

      v3 = v87;
    }

  }
  else
  {
    logString(CFSTR("Failed to fetch all moments %@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);
  }
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Asset"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForAssetsIncludedInMoments"), 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v48;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("visibilityState"), 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v49;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v100[2] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "andPredicateWithSubpredicates:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setPredicate:", v52);

  objc_msgSend(v3, "executeFetchRequest:error:", v46, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v53, "count"))
  {
    ++verificationFailures;
    logString(CFSTR("VERIFICATION FAILURE **************************************** Orphaned Assets ****************************************"), v54, v55, v56, v57, v58, v59, v60, (uint64_t)CFSTR("moment"));
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v61 = v53;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v63; ++j)
        {
          if (*(_QWORD *)v91 != v64)
            objc_enumerationMutation(v61);
          v66 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
          objc_msgSend(v66, "shortObjectIDURI");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "uuid");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "dateCreated");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          logStringWithIndent(1, CFSTR("%@ %@, %@"), v69, v70, v71, v72, v73, v74, (uint64_t)v67);

        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
      }
      while (v63);
    }

    v3 = v87;
  }

  logString(CFSTR("Found %d VERIFICATION FAILURE(s)"), v75, v76, v77, v78, v79, v80, v81, verificationFailures);
}

- (void)logAlbum:(id)a3 index:(unint64_t)a4 indent:(unint64_t)a5 completeMetadata:(BOOL)a6 printAssets:(BOOL)a7
{
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v34;
  _BOOL4 v35;
  id v36;

  v34 = a6;
  v35 = a7;
  v9 = a3;
  v36 = v9;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = &stru_1E36789C0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu: "), a4);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = v36;
  }
  if ((int)objc_msgSend(v9, "pendingItemsCount") < 1)
  {
    v11 = &stru_1E36789C0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pending=%d"), objc_msgSend(v36, "pendingItemsCount"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v36, "shortObjectIDURI");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v36, "_kindDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "kind");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "uuid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  logStringWithIndent(a5, CFSTR("%@%@ \"%@\" (\"%@\") %@ %@ (%@) UUID=%@ %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v10);

  if (v34)
  {
    objc_msgSend(v36, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    logStringWithIndent(a5, CFSTR("%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v23);

  }
  if (v35)
  {
    objc_msgSend(v36, "assets");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotosStateLog _logAssets:forAlbum:indent:](self, "_logAssets:forAlbum:indent:", v31, v36, a5);

  }
}

- (void)logAlbumLists
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id obj;
  _QWORD v44[6];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  logTitleWithIndent(0, CFSTR("Album Lists"), v2, v3, v4, v5, v6, v7, v38);
  v9 = objc_alloc(MEMORY[0x1E0C97B48]);
  +[PLManagedAlbumList entityName](PLManagedAlbumList, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithEntityName:", v10);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v13);

  -[PLPhotosStateLog photoLibrary](self, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v15, "executeFetchRequest:error:", v11, &v49);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v49;

  if (v16)
  {
    v40 = v17;
    v41 = v12;
    v42 = v11;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v16;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v46 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v28, "shortObjectIDURI");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "_typeDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          logStringWithIndent(0, CFSTR("%@ (%@) \"%@\"), v31, v32, v33, v34, v35, v36, (uint64_t)v29);

          objc_msgSend(v28, "albums");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __33__PLPhotosStateLog_logAlbumLists__block_invoke;
          v44[3] = &unk_1E366FD20;
          v44[4] = self;
          v44[5] = 0;
          objc_msgSend(v37, "enumerateObjectsUsingBlock:", v44);

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v25);
    }

    v12 = v41;
    v11 = v42;
    v17 = v40;
  }
  else
  {
    logStringWithIndent(0, CFSTR("Failed to fetch album lists: %@"), v18, v19, v20, v21, v22, v23, (uint64_t)v17);
  }

}

- (void)logAllAlbums
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  logTitleWithIndent(0, CFSTR("All Albums"), v2, v3, v4, v5, v6, v7, v30);
  -[PLPhotosStateLog photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C97B48];
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("kind"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSortDescriptors:", v15);

  v35 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v13, &v35);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v35;
  v24 = v17;
  if (v16)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v25 = v16;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v32;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v32 != v28)
            objc_enumerationMutation(v25);
          -[PLPhotosStateLog logAlbum:index:indent:completeMetadata:printAssets:](self, "logAlbum:index:indent:completeMetadata:printAssets:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v29++), 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0);
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v27);
    }

  }
  else
  {
    logStringWithIndent(0, CFSTR("Failed to get albums: %@"), v18, v19, v20, v21, v22, v23, (uint64_t)v17);
  }

}

- (void)logAssetCounts
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = 0;
  v35 = 0;
  -[PLPhotosStateLog photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getPhotoCount:videoCount:", &v35, &v34);

  logString(CFSTR(" ===== %u photos %u videos ====="), v4, v5, v6, v7, v8, v9, v10, v35);
  -[PLPhotosStateLog photoLibrary](self, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchRequestWithEntityName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v15, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(complete != 0) AND (kind == %d)"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v16);

  objc_msgSend(v12, "executeFetchRequest:error:", v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  logString(CFSTR(" ===== IMAGES ====="), v18, v19, v20, v21, v22, v23, v24, 0);
  -[PLPhotosStateLog _logAssets:forAlbum:indent:](self, "_logAssets:forAlbum:indent:", v17, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(complete != 0) AND (kind == %d)"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v25);

  objc_msgSend(v12, "executeFetchRequest:error:", v15, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  logString(CFSTR(" ===== VIDEOS ====="), v27, v28, v29, v30, v31, v32, v33, 1);
  -[PLPhotosStateLog _logAssets:forAlbum:indent:](self, "_logAssets:forAlbum:indent:", v26, 0, 0);

}

- (void)_logAssets:(id)a3 forAlbum:(id)a4 indent:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  PLPhotosStateLog *v18;
  unint64_t v19;
  BOOL v20;

  v14 = a3;
  v8 = a4;
  if (v14)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v9, "setDateFormat:", CFSTR("yMMMdd-HH:mm:ss.SS"));
    objc_msgSend(v8, "customKeyAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v11 = objc_msgSend(v8, "kindValue") == 1505;
    else
      v11 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__PLPhotosStateLog__logAssets_forAlbum_indent___block_invoke;
    v15[3] = &unk_1E366FD48;
    v16 = v10;
    v17 = v9;
    v20 = v11;
    v18 = self;
    v19 = a5;
    v12 = v9;
    v13 = v10;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

  }
}

- (void)logDescription:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  logTitleWithIndent(0, CFSTR("%@"), (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)a3);
}

- (BOOL)compressFileFromPath:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  FILE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  FILE *v43;
  FILE *v44;
  FILE *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  id v66;
  char v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v67 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v6, &v67))
  {
    if (!v67)
    {
      objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("gz"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "fileExistsAtPath:", v23))
      {
        v60 = 0;
        v24 = objc_msgSend(v8, "removeItemAtPath:error:", v23, &v60);
        v25 = v60;
        v26 = v25;
        if ((v24 & 1) == 0)
        {
          objc_msgSend(v25, "localizedDescription");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          logString(CFSTR("[PLLogging] Error deleting file %@: %@"), v27, v28, v29, v30, v31, v32, v33, (uint64_t)v23);

        }
      }
      v34 = objc_retainAutorelease(v6);
      v35 = fopen((const char *)objc_msgSend(v34, "fileSystemRepresentation"), "r");
      if (v35)
      {
        v43 = v35;
        v7 = objc_retainAutorelease(v23);
        v44 = fopen((const char *)objc_msgSend(v7, "fileSystemRepresentation"), "w");
        if (v44)
        {
          v45 = v44;
          v46 = CPFileCompressionZDeflate();
          fclose(v43);
          fclose(v45);
          if (!v46)
          {
            v18 = 1;
            goto LABEL_30;
          }
        }
        else
        {
          fclose(0);
        }
      }
      logString(CFSTR("[PLLogging] Failed to compress %@"), v36, v37, v38, v39, v40, v41, v42, (uint64_t)v34);
      v18 = 0;
      v7 = v23;
      goto LABEL_30;
    }
    v66 = 0;
    objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v6, &v66);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v66;
    v65 = 0;
    v11 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v65);
    v12 = v65;
    v13 = v12;
    if (v11)
    {
      v59 = v12;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v14 = v9;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      if (v15)
      {
        v16 = v15;
        v56 = v10;
        v57 = v9;
        v58 = v8;
        v17 = *(_QWORD *)v62;
        v18 = 1;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v62 != v17)
              objc_enumerationMutation(v14);
            v20 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
            objc_msgSend(v6, "stringByAppendingPathComponent:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "stringByAppendingPathComponent:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v18
               && -[PLPhotosStateLog compressFileFromPath:toPath:](self, "compressFileFromPath:toPath:", v21, v22);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
        }
        while (v16);
        v9 = v57;
        v8 = v58;
        v10 = v56;
      }
      else
      {
        v18 = 1;
      }
      v13 = v59;
    }
    else
    {
      objc_msgSend(v12, "localizedDescription");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      logString(CFSTR("[PLLogging] Error creating directory %@: %@"), v47, v48, v49, v50, v51, v52, v53, (uint64_t)v7);
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
LABEL_30:

  return v18;
}

- (BOOL)copyFilesMatching:(id)a3 andExcluding:(id)a4 fromPath:(id)a5 toPath:(id)a6 usingCompression:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  BOOL v60;
  void *v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v7 = a7;
  v70 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v13;
  v16 = v14;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v68 = 0;
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "contentsOfDirectoryAtPath:error:", v13, &v68);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v68;
  v57 = v11;
  if (v12)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(SELF like %@) AND (NOT (SELF like %@))"), v11, v12);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF like %@"), v11, v50);
  v55 = v17;
  v56 = v12;
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "filteredArrayUsingPredicate:", v53);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v60 = v18 == 0;
  v66 = 0u;
  v67 = 0u;
  obj = v18;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v65 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v15, "stringByAppendingString:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByAppendingString:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v60 = -[PLPhotosStateLog compressFileFromPath:toPath:](self, "compressFileFromPath:toPath:", v24, v25);
        }
        else
        {
          v26 = v7;
          v27 = v15;
          v28 = v61;
          if (objc_msgSend(v61, "fileExistsAtPath:", v25))
          {
            v63 = 0;
            v29 = objc_msgSend(v61, "removeItemAtPath:error:", v25, &v63);
            v30 = v63;
            v31 = v30;
            if ((v29 & 1) == 0)
            {
              objc_msgSend(v30, "localizedDescription");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              logString(CFSTR("[PLLogging] Error deleting file %@: %@"), v32, v33, v34, v35, v36, v37, v38, (uint64_t)v25);

            }
            v28 = v61;
          }
          v62 = 0;
          v39 = objc_msgSend(v28, "copyItemAtPath:toPath:error:", v24, v25, &v62);
          v40 = v62;
          v41 = v40;
          if ((v39 & 1) != 0)
          {
            v60 = 1;
          }
          else
          {
            objc_msgSend(v40, "localizedDescription");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            logString(CFSTR("[PLLogging] Error copying file %@ to %@: %@"), v42, v43, v44, v45, v46, v47, v48, (uint64_t)v24);

          }
          v15 = v27;
          v7 = v26;
        }

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v20);
  }

  return v60;
}

- (void)createSnapshot
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_queue_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  -[PLPhotosStateLog photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoDirectoryWithType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("/var/mobile"), "stringByAppendingPathComponent:", CFSTR("Library/Logs/CrashReporter/DiagnosticLogs/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v6, "setDateFormat:", CFSTR("YYYY_MM_dd_HH_mm_ssZZZ"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PhotosSnapshot_%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", CFSTR("/"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = dispatch_queue_create("com.apple.photostate.PLPhotosStateLoggingQueue", MEMORY[0x1E0C80D50]);
  v16 = v4;
  v17 = v5;
  v13 = v5;
  v14 = v4;
  v15 = v11;
  pl_dispatch_async();

}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

void __34__PLPhotosStateLog_createSnapshot__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v15 = 0;
  v4 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v15);
  v5 = v15;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "copyFilesMatching:andExcluding:fromPath:toPath:usingCompression:", CFSTR("*.sqlite*"), CFSTR("*aside*"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 1);
    objc_msgSend(*(id *)(a1 + 40), "copyFilesMatching:andExcluding:fromPath:toPath:usingCompression:", CFSTR("com.apple.*"), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), 1);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "localizedDescription");
    v14 = objc_claimAutoreleasedReturnValue();
    logString(CFSTR("[PLLogging] Error creating directory %@: %@"), v7, v8, v9, v10, v11, v12, v13, v6);

    v5 = (id)v14;
  }

}

void __47__PLPhotosStateLog__logAssets_forAlbum_indent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  void *v44;
  id v45;

  v45 = a2;
  if (*(id *)(a1 + 32) == v45)
    v5 = CFSTR(" (*)");
  else
    v5 = &stru_1E36789C0;
  v43 = v5;
  objc_msgSend(v45, "legacyFaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v45, "legacyFaces");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR(" %lu legacyFaces"), objc_msgSend(v8, "count"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E36789C0;
  }

  objc_msgSend(v45, "locationData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR(" GPS");
  if (!v10)
    v11 = &stru_1E36789C0;
  v12 = v11;

  v40 = *(_QWORD *)(a1 + 56) + 1;
  objc_msgSend(v45, "shortObjectIDURI");
  v42 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "uuid");
  v41 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "effectiveThumbnailIndex");
  objc_msgSend(v45, "shortenedFilePath");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 40);
  objc_msgSend(v45, "dateCreated");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "sortToken");
  objc_msgSend(v45, "cloudPlaceholderKind");
  if (*(_BYTE *)(a1 + 64))
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v45, "cloudBatchPublishDate");
    v39 = a1;
    v23 = a3;
    v24 = v9;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("cloud batch=%@"), v25);
    v26 = v43;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v41;
    v27 = (void *)v42;
    v37 = v23;
    a1 = v39;
    logStringWithIndent(v40, CFSTR("%2zu: %@ UUID=%@ THUMB=%d \"%@\" %@ sort=%f placeholder=%d %@%@%@%@"), v29, v30, v31, v32, v33, v34, v37);

    v9 = v24;
  }
  else
  {
    v26 = v43;
    v28 = (void *)v41;
    v27 = (void *)v42;
    logStringWithIndent(v40, CFSTR("%2zu: %@ UUID=%@ THUMB=%d \"%@\" %@ sort=%f placeholder=%d %@%@%@%@"), v16, v17, v18, v19, v20, v21, a3);
  }

  objc_msgSend(*(id *)(a1 + 48), "photoLibrary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "managedObjectContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "refreshObject:mergeChanges:", v45, objc_msgSend(v45, "hasChanges"));

}

uint64_t __33__PLPhotosStateLog_logAlbumLists__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAlbum:index:indent:completeMetadata:printAssets:", a2, a3, *(_QWORD *)(a1 + 40) + 1, 0, 0);
}

@end
