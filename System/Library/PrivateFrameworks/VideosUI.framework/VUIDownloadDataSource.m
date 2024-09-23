@implementation VUIDownloadDataSource

void __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ "), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)setDownloadDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_downloadDelegate, a3);
}

void __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  _QWORD block[2];
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[2];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    v8 = *MEMORY[0x1E0DAF990];
    v9 = *MEMORY[0x1E0DAF9D0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
        v42[0] = v8;
        v42[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "vui_valuesForProperties:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectForKey:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v14);

        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v6);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = *(id *)(a1 + 32);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    v19 = *MEMORY[0x1E0DB1CB8];
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v20), "mediaItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "mediaItemMetadataForProperty:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v22, "longLongValue"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v23);

        }
        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v17);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v29 = __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke_3;
  v30 = &unk_1E9F99420;
  v24 = *(id *)(a1 + 40);
  v31 = v3;
  v32 = v24;
  v25 = (void *)MEMORY[0x1E0CB3978];
  v26 = v3;
  if (objc_msgSend(v25, "isMainThread"))
    v29((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_getActivelyDownloadingAdamIDsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD v7[2];
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke;
  v9 = &unk_1E9F9A060;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  v6 = v7;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v8((uint64_t)v6);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "sDownloadManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E9FA00E8;
  v8 = v4;
  v9 = *(id *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v5, "getDownloadsUsingBlock:", v7);

}

- (SSDownloadManager)sDownloadManager
{
  return self->_sDownloadManager;
}

- (void)_loadDownloadedEntities
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  VUISidebandMediaItem *v14;
  void *v15;
  VUISidebandMediaItem *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  VUIMPMediaItem *v52;
  void *v53;
  void *v54;
  void *v55;
  VUIMPMediaItem *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id obj;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  void *v88;
  _BYTE v89[128];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[4];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sidebandMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1EA0B9C58, &unk_1EA0B9C70, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videosWithDownloadStates:entitlementTypes:useMainThreadContext:", v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v85 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        if ((objc_msgSend(v11, "markedAsDeleted") & 1) == 0)
        {
          objc_msgSend(v11, "entitlementType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "integerValue");

          if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            objc_msgSend(v11, "adamID");
            v14 = (VUISidebandMediaItem *)objc_claimAutoreleasedReturnValue();
            if (-[VUISidebandMediaItem length](v14, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[VUISidebandMediaItem longLongValue](v14, "longLongValue"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
                objc_msgSend(v68, "addObject:", v15);

            }
          }
          else
          {
            v16 = [VUISidebandMediaItem alloc];
            +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "sidebandMediaLibrary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            VUIMediaEntityFetchRequestAllPropertiesSet();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[VUISidebandMediaItem initWithMediaLibrary:videoManagedObject:requestedProperties:](v16, "initWithMediaLibrary:videoManagedObject:requestedProperties:", v18, v11, v19);

            if (v14)
              objc_msgSend(v75, "addObject:", v14);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
    }
    while (v8);
  }
  v60 = v6;

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v20 = (void *)MEMORY[0x1E0CC2438];
  objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "vui_moviesQueryWithMediaLibrary:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v22;
  v23 = (void *)MEMORY[0x1E0CC2438];
  objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "vui_movieRentalsQueryWithMediaLibrary:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v25;
  v26 = (void *)MEMORY[0x1E0CC2438];
  objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "vui_episodesQueryWithMediaLibrary:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v92[2] = v28;
  v29 = (void *)MEMORY[0x1E0CC2438];
  objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "vui_homeVideosQueryWithMediaLibrary:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v92[3] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v32;
  v67 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
  if (v67)
  {
    v65 = *MEMORY[0x1E0CC1E80];
    v66 = *(_QWORD *)v81;
    v63 = *MEMORY[0x1E0CC1FA0];
    v64 = *MEMORY[0x1E0CC1EB0];
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v81 != v66)
          objc_enumerationMutation(obj);
        v74 = v33;
        v34 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v33);
        objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAB0], v65);
        v35 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAA0], v64);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0CC23B8];
        v72 = (void *)v36;
        v73 = (void *)v35;
        v91[0] = v35;
        v91[1] = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "predicateMatchingPredicates:", v38);
        v39 = objc_claimAutoreleasedReturnValue();

        v40 = (void *)MEMORY[0x1E0CC23C8];
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v68);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "predicateWithProperty:values:", v63, v41);
        v42 = objc_claimAutoreleasedReturnValue();

        v43 = (void *)MEMORY[0x1E0CC23C0];
        v70 = (void *)v42;
        v71 = (void *)v39;
        v90[0] = v39;
        v90[1] = v42;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "predicateMatchingPredicates:", v44);
        v45 = objc_claimAutoreleasedReturnValue();

        v69 = (void *)v45;
        objc_msgSend(v34, "addFilterPredicate:", v45);
        objc_msgSend(v34, "setIgnoreSystemFilterPredicates:", 1);
        objc_msgSend(v34, "items");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v77;
          do
          {
            for (j = 0; j != v48; ++j)
            {
              if (*(_QWORD *)v77 != v49)
                objc_enumerationMutation(v46);
              v51 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
              v52 = [VUIMPMediaItem alloc];
              +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "deviceMediaLibrary");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              VUIMediaEntityFetchRequestAllPropertiesSet();
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = -[VUIMPMediaItem initWithMediaLibrary:mediaItem:requestedProperties:](v52, "initWithMediaLibrary:mediaItem:requestedProperties:", v54, v51, v55);

              if (v56)
                objc_msgSend(v75, "addObject:", v56);

            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
          }
          while (v48);
        }

        v33 = v74 + 1;
      }
      while (v74 + 1 != v67);
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
    }
    while (v67);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "sortUsingDescriptors:", v58);

  +[VUIMediaLibraryUtilities groupingForMediaEntities:groupingKeyPath:groupingSortComparator:performDefaultSort:sortIndexPropertyKey:](VUIMediaLibraryUtilities, "groupingForMediaEntities:groupingKeyPath:groupingSortComparator:performDefaultSort:sortIndexPropertyKey:", v75, CFSTR("showTitle"), 0, 1, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadDataSource _downloadedMediaEntitiesDidUpdate:grouping:](self, "_downloadedMediaEntitiesDidUpdate:grouping:", v75, v59);

}

- (void)_downloadedMediaEntitiesDidUpdate:(id)a3 grouping:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[VUIDownloadDataSource setHasFetchedAllDownloadedEntities:](self, "setHasFetchedAllDownloadedEntities:", 1);
  -[VUIDownloadDataSource _deDupedMediaEntities:](self, "_deDupedMediaEntities:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIDownloadDataSource setLocalMediaItems:](self, "setLocalMediaItems:", v8);
  -[VUIDownloadDataSource _createGroupingByShowIdentifierWithLatestMediaEntityGroups:](self, "_createGroupingByShowIdentifierWithLatestMediaEntityGroups:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIDownloadDataSource setGroupingByShowIdentifier:](self, "setGroupingByShowIdentifier:", v9);
  -[VUIDownloadDataSource _coalesceActiveDownloadEntitiesAndDownloadedEntities](self, "_coalesceActiveDownloadEntitiesAndDownloadedEntities");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[VUIDownloadDataSource _downloadsDidChange:](self, "_downloadsDidChange:", v11);
  -[VUIDownloadDataSource setDownloadEntities:](self, "setDownloadEntities:", v11);
  -[VUIDownloadDataSource _notifyDelegatesDownloadsFetchCompletedWithChanges:](self, "_notifyDelegatesDownloadsFetchCompletedWithChanges:", v10);

}

- (void)setLocalMediaItems:(id)a3
{
  objc_storeStrong((id *)&self->_localMediaItems, a3);
}

- (void)setHasFetchedAllDownloadedEntities:(BOOL)a3
{
  self->_hasFetchedAllDownloadedEntities = a3;
}

- (void)setGroupingByShowIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupingByShowIdentifier, a3);
}

- (void)setDownloadEntities:(id)a3
{
  NSArray *v4;
  NSArray *v5;

  -[VUIDownloadDataSource _sortDownloadEntities:](self, "_sortDownloadEntities:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (self->_downloadEntities != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&self->_downloadEntities, v4);
    v4 = v5;
  }

}

- (void)_notifyDelegatesDownloadsFetchCompletedWithChanges:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  _QWORD v14[2];
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id location;

  v3 = a3;
  -[VUIDownloadDataSource downloadEntities](self, "downloadEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = -[VUIDownloadDataSource performingRentalExpirationFetch](self, "performingRentalExpirationFetch");
  v8 = -[VUIDownloadDataSource hasFetchedAllDownloadEntities](self, "hasFetchedAllDownloadEntities");
  v9 = -[VUIDownloadDataSource hasFetchedAllDownloadedEntities](self, "hasFetchedAllDownloadedEntities");
  if (!-[VUILibraryDataSource hasCompletedInitialFetch](self, "hasCompletedInitialFetch") && v8 && v9 && !v7)
  {
    -[VUILibraryDataSource setHasCompletedInitialFetch:](self, "setHasCompletedInitialFetch:", 1);
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v20 = __76__VUIDownloadDataSource__notifyDelegatesDownloadsFetchCompletedWithChanges___block_invoke;
    v21 = &unk_1E9F9A938;
    v10 = &v23;
    objc_copyWeak(&v23, &location);
    v22 = v6;
    v11 = v19;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v20((uint64_t)v11);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v11);

    v13 = v22;
LABEL_17:

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
    goto LABEL_18;
  }
  if (-[VUILibraryDataSource hasCompletedInitialFetch](self, "hasCompletedInitialFetch") && (v3 || v7))
  {
    if (v7)
      -[VUIDownloadDataSource setPerformingRentalExpirationFetch:](self, "setPerformingRentalExpirationFetch:", 0);
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v15 = __76__VUIDownloadDataSource__notifyDelegatesDownloadsFetchCompletedWithChanges___block_invoke_2;
    v16 = &unk_1E9F9A938;
    v10 = &v18;
    objc_copyWeak(&v18, &location);
    v17 = v6;
    v12 = v14;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v15((uint64_t)v12);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v12);

    v13 = v17;
    goto LABEL_17;
  }
LABEL_18:

}

- (BOOL)performingRentalExpirationFetch
{
  return self->_performingRentalExpirationFetch;
}

- (BOOL)hasFetchedAllDownloadedEntities
{
  return self->_hasFetchedAllDownloadedEntities;
}

- (BOOL)hasFetchedAllDownloadEntities
{
  return self->_hasFetchedAllDownloadEntities;
}

- (BOOL)_downloadsDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;

  v4 = a3;
  -[VUIDownloadDataSource downloadEntities](self, "downloadEntities");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[VUIDownloadDataSource downloadEntities](self, "downloadEntities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToArray:", v4) ^ 1;

  }
  return v7;
}

- (NSArray)downloadEntities
{
  return self->_downloadEntities;
}

- (id)_deDupedMediaEntities:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "isFamilySharingContent"))
        {
          objc_msgSend(v11, "storeID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v18, "isFamilySharingContent", (_QWORD)v21))
          {
            objc_msgSend(v4, "addObject:", v18);
          }
          else
          {
            objc_msgSend(v18, "storeID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19 || (objc_msgSend(v5, "containsObject:", v19) & 1) == 0)
              objc_msgSend(v4, "addObject:", v18);

          }
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  return v4;
}

- (id)_createGroupingByShowIdentifierWithLatestMediaEntityGroups:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
          objc_msgSend(v10, "mediaEntities");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v14, v15);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_sortDownloadEntities:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "punctuationCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:", CFSTR("TV.Library.Sorting.Prefix.Articles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("|"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  v10 = &unk_1EA0BBA30;
  if (v9)
    v10 = v8;
  v11 = (void *)MEMORY[0x1E0C99DE8];
  v12 = v10;
  objc_msgSend(v11, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke;
  v26[3] = &unk_1E9FA0048;
  v15 = v13;
  v27 = v15;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v26);

  aBlock[0] = v14;
  aBlock[1] = 3221225472;
  aBlock[2] = __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke_2;
  aBlock[3] = &unk_1E9FA0070;
  v24 = v5;
  v25 = v15;
  v16 = v15;
  v17 = v5;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke_3;
  v21[3] = &unk_1E9FA0098;
  v22 = _Block_copy(aBlock);
  v18 = v22;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_coalesceActiveDownloadEntitiesAndDownloadedEntities
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  VUIDownloadEntity *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[VUIDownloadDataSource localMediaItems](self, "localMediaItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadDataSource _createDownloadEntitiesFromLatestDownloads:](self, "_createDownloadEntitiesFromLatestDownloads:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[VUIDownloadDataSource activelyDownloadingMediaItems](self, "activelyDownloadingMediaItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v12)
        {
          -[VUIDownloadDataSource _upsertEpisodesDownloadingForShowWithMediaEntity:](self, "_upsertEpisodesDownloadingForShowWithMediaEntity:", v10);
        }
        else
        {
          -[VUIDownloadDataSource _getDownloadEntityInDownloadEntities:containingMediaEntity:](self, "_getDownloadEntityInDownloadEntities:containingMediaEntity:", v4, v10);
          v13 = (VUIDownloadEntity *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v13 = -[VUIDownloadEntity initWithMediaEntity:withDownloadType:]([VUIDownloadEntity alloc], "initWithMediaEntity:withDownloadType:", v10, 0);
            objc_msgSend(v20, "addObject:", v13);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  -[VUIDownloadDataSource episodesDownloadingForShow](self, "episodesDownloadingForShow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadDataSource _upsertDownloadEntities:withEpisodesDownloadingForShow:](self, "_upsertDownloadEntities:withEpisodesDownloadingForShow:", v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addObjectsFromArray:", v20);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortUsingDescriptors:", v17);

  v18 = (void *)objc_msgSend(v15, "copy");
  return v18;
}

- (NSArray)localMediaItems
{
  return self->_localMediaItems;
}

- (VUIDownloadDataSource)initWithMediaLibrary:(id)a3 fetchRequest:(id)a4
{
  id v7;
  id v8;
  VUIDownloadDataSource *v9;
  VUIDownloadDataSource *v10;
  uint64_t v11;
  NSMutableDictionary *episodesDownloadingForShow;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  SSDownloadManager *sDownloadManager;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  objc_super v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
  v31.receiver = self;
  v31.super_class = (Class)VUIDownloadDataSource;
  v9 = -[VUIMediaEntitiesDataSource initWithFetchRequest:](&v31, sel_initWithFetchRequest_, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibrary, a3);
    v10->_hasFetchedAllDownloadEntities = 0;
    v10->_hasFetchedAllDownloadedEntities = 0;
    v11 = objc_opt_new();
    episodesDownloadingForShow = v10->_episodesDownloadingForShow;
    v10->_episodesDownloadingForShow = (NSMutableDictionary *)v11;

    +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addDelegate:", v10);

    v14 = objc_alloc_init(MEMORY[0x1E0DAF4E0]);
    v15 = *MEMORY[0x1E0DAF868];
    v33[0] = *MEMORY[0x1E0DAF828];
    v33[1] = v15;
    v30 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDownloadKinds:", v16);

    objc_msgSend(v14, "setShouldFilterExternalOriginatedDownloads:", 0);
    v17 = *MEMORY[0x1E0DAF9D0];
    v32[0] = *MEMORY[0x1E0DAF990];
    v32[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPrefetchedDownloadProperties:", v18);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF4C8]), "initWithManagerOptions:", v14);
    objc_msgSend(v19, "addObserver:", v10);
    sDownloadManager = v10->_sDownloadManager;
    v10->_sDownloadManager = (SSDownloadManager *)v19;
    v29 = v19;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v10, sel__rentalsDidExpire_, CFSTR("VUIRentalExpirationMonitorRentalDidExpireNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "deviceMediaLibrary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v10, sel__handleMediaLibraryContentsDidChangeNotification_, CFSTR("VUIMediaLibraryContentsDidChangeNotification"), v24);

    v7 = v30;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sidebandMediaLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v10, sel__handleMediaLibraryContentsDidChangeNotification_, CFSTR("VUIMediaLibraryContentsDidChangeNotification"), v27);

    -[VUIDownloadDataSource _loadDownloadedEntities](v10, "_loadDownloadedEntities");
    -[VUIDownloadDataSource _loadActiveDownloads](v10, "_loadActiveDownloads");

  }
  return v10;
}

- (NSMutableDictionary)episodesDownloadingForShow
{
  return self->_episodesDownloadingForShow;
}

- (NSArray)activelyDownloadingMediaItems
{
  return self->_activelyDownloadingMediaItems;
}

- (id)_upsertDownloadEntities:(id)a3 withEpisodesDownloadingForShow:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  void *v20;
  VUIDownloadEntity *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t i;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[6];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v29 = a4;
  objc_msgSend(v29, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v26, "mutableCopy");
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v5;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v51 != v28)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        v44 = 0;
        v45 = &v44;
        v46 = 0x3032000000;
        v47 = __Block_byref_object_copy__18;
        v48 = __Block_byref_object_dispose__18;
        v49 = 0;
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __80__VUIDownloadDataSource__upsertDownloadEntities_withEpisodesDownloadingForShow___block_invoke;
        v43[3] = &unk_1E9FA0150;
        v43[4] = v6;
        v43[5] = &v44;
        objc_msgSend(v31, "enumerateObjectsUsingBlock:", v43);
        if (v45[5])
        {
          objc_msgSend(v29, "objectForKey:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend((id)v45[5], "mediaEntities");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "arrayWithArray:", v9);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v34 = v7;
          v10 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v40 != v11)
                  objc_enumerationMutation(v34);
                v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                objc_msgSend(v13, "identifier");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = 0u;
                v38 = 0u;
                v35 = 0u;
                v36 = 0u;
                objc_msgSend((id)v45[5], "mediaEntities");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v54, 16);
                if (v16)
                {
                  v17 = *(_QWORD *)v36;
                  while (2)
                  {
                    for (k = 0; k != v16; ++k)
                    {
                      if (*(_QWORD *)v36 != v17)
                        objc_enumerationMutation(v15);
                      objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "identifier");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v19 && (objc_msgSend(v14, "isEqual:", v19) & 1) != 0)
                      {

                        goto LABEL_23;
                      }

                    }
                    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v54, 16);
                    if (v16)
                      continue;
                    break;
                  }
                }

                objc_msgSend(v33, "addObject:", v13);
LABEL_23:

              }
              v10 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
            }
            while (v10);
          }

          objc_msgSend((id)v45[5], "setDownloadType:", 2);
          v20 = (void *)v45[5];
          v21 = (VUIDownloadEntity *)objc_msgSend(v33, "copy");
          objc_msgSend(v20, "setMediaEntities:", v21);
        }
        else
        {
          objc_msgSend(v29, "objectForKey:", v6);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x1E0C99D20];
          v34 = v22;
          objc_msgSend(v22, "allObjects");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "arrayWithArray:", v24);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = -[VUIDownloadEntity initWithMediaEntities:withDownloadType:]([VUIDownloadEntity alloc], "initWithMediaEntities:withDownloadType:", v33, 2);
          objc_msgSend(v31, "addObject:", v21);
        }

        _Block_object_dispose(&v44, 8);
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v30);
  }

  return v31;
}

- (void)_loadActiveDownloads
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__VUIDownloadDataSource__loadActiveDownloads__block_invoke;
  v3[3] = &unk_1E9FA00C0;
  objc_copyWeak(&v4, &location);
  -[VUIDownloadDataSource _getActivelyDownloadingAdamIDsWithCompletion:](self, "_getActivelyDownloadingAdamIDsWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)_createDownloadEntitiesFromLatestDownloads:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _UNKNOWN **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _UNKNOWN **v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  int v36;
  VUIDownloadEntity *v37;
  void *v38;
  VUIDownloadEntity *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  id obj;
  void *v53;
  VUIDownloadDataSource *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  VUIDownloadEntity *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = (id)objc_opt_new();
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v54 = self;
  -[VUIDownloadDataSource groupingByShowIdentifier](self, "groupingByShowIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v5, "initWithDictionary:", v6);

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v4;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
  if (v57)
  {
    v56 = *(_QWORD *)v76;
    v7 = &off_1E9F96000;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v76 != v56)
          objc_enumerationMutation(obj);
        v58 = v8;
        v9 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v8);
        objc_msgSend(v9, "showTitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7[442], "episode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == v12)
        {
          objc_msgSend(v53, "objectForKey:", v10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            -[VUIDownloadDataSource downloadEntities](v54, "downloadEntities");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
            if (v61)
            {
              v51 = v10;
              v62 = 0;
              v59 = v26;
              v60 = *(_QWORD *)v72;
              do
              {
                for (i = 0; i != v61; ++i)
                {
                  if (*(_QWORD *)v72 != v60)
                    objc_enumerationMutation(v59);
                  v28 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                  v67 = 0u;
                  v68 = 0u;
                  v69 = 0u;
                  v70 = 0u;
                  objc_msgSend(v28, "mediaEntities", v51);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
                  if (v30)
                  {
                    v31 = v30;
                    v32 = *(_QWORD *)v68;
                    while (2)
                    {
                      for (j = 0; j != v31; ++j)
                      {
                        if (*(_QWORD *)v68 != v32)
                          objc_enumerationMutation(v29);
                        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "identifier");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "identifier");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        v36 = objc_msgSend(v34, "isEqual:", v35);

                        if (v36)
                        {
                          v37 = v28;

                          v62 = v37;
                          goto LABEL_29;
                        }
                      }
                      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
                      if (v31)
                        continue;
                      break;
                    }
                  }
LABEL_29:

                }
                v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
              }
              while (v61);

              v38 = v53;
              v7 = &off_1E9F96000;
              v10 = v51;
              v39 = v62;
              if (!v62)
              {
LABEL_48:
                objc_msgSend(v38, "objectForKey:", v10);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = -[VUIDownloadEntity initWithMediaEntities:withDownloadType:]([VUIDownloadEntity alloc], "initWithMediaEntities:withDownloadType:", v49, 1);

              }
              objc_msgSend(v55, "addObject:", v39);
              objc_msgSend(v38, "removeObjectForKey:", v10);
              goto LABEL_50;
            }

            v38 = v53;
            goto LABEL_48;
          }
        }
        else
        {

        }
        objc_msgSend(v9, "type");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7[442], "movie");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v13;
        if (v13 == (void *)v14)
          goto LABEL_34;
        v16 = (void *)v14;
        v17 = v10;
        objc_msgSend(v9, "type");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7[442], "movieRental");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v18 == v19)
        {

          v15 = v16;
          v10 = v17;
LABEL_34:

LABEL_35:
          v40 = v10;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          -[VUIDownloadDataSource downloadEntities](v54, "downloadEntities");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v64;
LABEL_37:
            v45 = 0;
            while (1)
            {
              if (*(_QWORD *)v64 != v44)
                objc_enumerationMutation(v41);
              v46 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v45);
              objc_msgSend(v46, "mediaEntities");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "firstObject");
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (v48 == v9)
                break;
              if (v43 == ++v45)
              {
                v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
                if (v43)
                  goto LABEL_37;
                goto LABEL_43;
              }
            }
            v39 = v46;

            if (v39)
              goto LABEL_46;
          }
          else
          {
LABEL_43:

          }
          v39 = -[VUIDownloadEntity initWithMediaEntity:withDownloadType:]([VUIDownloadEntity alloc], "initWithMediaEntity:withDownloadType:", v9, 0);
LABEL_46:
          objc_msgSend(v55, "addObject:", v39);
          v7 = &off_1E9F96000;
          v10 = v40;
LABEL_50:

          goto LABEL_51;
        }
        v21 = v7;
        objc_msgSend(v9, "type");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7[442], "homeVideo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = v22 == v23;
        v7 = v21;
        v10 = v17;
        if (v24)
          goto LABEL_35;
LABEL_51:

        v8 = v58 + 1;
      }
      while (v58 + 1 != v57);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
    }
    while (v57);
  }

  return v55;
}

- (NSMutableDictionary)groupingByShowIdentifier
{
  return self->_groupingByShowIdentifier;
}

void __76__VUIDownloadDataSource__notifyDelegatesDownloadsFetchCompletedWithChanges___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "downloadDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "downloadManager:downloadedFetchDidFinishWithEntities:", WeakRetained, *(_QWORD *)(a1 + 32));

}

void __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __45__VUIDownloadDataSource__loadActiveDownloads__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = v3;
  objc_msgSend(WeakRetained, "setActivelyDownloadingAdamIds:", v6);
  objc_msgSend(WeakRetained, "_mediaEntitiesForAdamIDs:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_downloadingMediaEntitiesDidUpdate:", v5);
}

- (void)setHasFetchedAllDownloadEntities:(BOOL)a3
{
  self->_hasFetchedAllDownloadEntities = a3;
}

- (void)setEpisodesDownloadingForShow:(id)a3
{
  objc_storeStrong((id *)&self->_episodesDownloadingForShow, a3);
}

- (void)setActivelyDownloadingMediaItems:(id)a3
{
  objc_storeStrong((id *)&self->_activelyDownloadingMediaItems, a3);
}

- (void)setActivelyDownloadingAdamIds:(id)a3
{
  objc_storeStrong((id *)&self->_activelyDownloadingAdamIds, a3);
}

- (void)loadDownloadData
{
  void *v3;
  void *v4;

  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDelegate:", self);

  -[VUIDownloadDataSource setHasFetchedAllDownloadEntities:](self, "setHasFetchedAllDownloadEntities:", 0);
  -[VUIDownloadDataSource setHasFetchedAllDownloadedEntities:](self, "setHasFetchedAllDownloadedEntities:", 0);
  v4 = (void *)objc_opt_new();
  -[VUIDownloadDataSource setEpisodesDownloadingForShow:](self, "setEpisodesDownloadingForShow:", v4);

  -[VUIDownloadDataSource _loadDownloadedEntities](self, "_loadDownloadedEntities");
  -[VUIDownloadDataSource _loadActiveDownloads](self, "_loadActiveDownloads");
}

- (VUIDownloadDataSourceDelegate)downloadDelegate
{
  return (VUIDownloadDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_downloadDelegate);
}

- (id)_mediaEntitiesForAdamIDs:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unint64_t v14;
  VUISidebandMediaItem *v16;
  void *v17;
  void *v18;
  void *v19;
  VUISidebandMediaItem *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  VUIMPMediaItem *v34;
  void *v35;
  void *v36;
  void *v37;
  VUIMPMediaItem *v38;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v3, "count"))
  {
    v43 = v3;
    objc_msgSend(v3, "valueForKeyPath:", CFSTR("stringValue"));
    v4 = objc_claimAutoreleasedReturnValue();
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sidebandMediaLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v4;
    objc_msgSend(v6, "videosForAdamIDs:useMainThreadContext:", v4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v51 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v12, "entitlementType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "integerValue");

          if (v14 <= 4 && ((1 << v14) & 0x13) != 0)
          {
            v16 = [VUISidebandMediaItem alloc];
            +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "sidebandMediaLibrary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            VUIMediaEntityFetchRequestAllPropertiesSet();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[VUISidebandMediaItem initWithMediaLibrary:videoManagedObject:requestedProperties:](v16, "initWithMediaLibrary:videoManagedObject:requestedProperties:", v18, v12, v19);

            if (v20)
              objc_msgSend(v45, "addObject:", v20);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v9);
    }

    v21 = (void *)MEMORY[0x1E0CC23C8];
    v22 = *MEMORY[0x1E0CC1FA0];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v43);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "predicateWithProperty:values:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc(MEMORY[0x1E0CC2438]);
    v41 = (void *)v24;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithFilterPredicates:", v26);

    objc_msgSend(v27, "setIgnoreSystemFilterPredicates:", 1);
    v40 = v27;
    objc_msgSend(v27, "items");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v47 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
          v34 = [VUIMPMediaItem alloc];
          +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "deviceMediaLibrary");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          VUIMediaEntityFetchRequestAllPropertiesSet();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[VUIMPMediaItem initWithMediaLibrary:mediaItem:requestedProperties:](v34, "initWithMediaLibrary:mediaItem:requestedProperties:", v36, v33, v37);

          if (v38)
            objc_msgSend(v45, "addObject:", v38);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v30);
    }

    v3 = v43;
  }

  return v45;
}

- (void)_downloadingMediaEntitiesDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  v4 = a3;
  -[VUIDownloadDataSource episodesDownloadingForShow](self, "episodesDownloadingForShow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[VUIDownloadDataSource setHasFetchedAllDownloadEntities:](self, "setHasFetchedAllDownloadEntities:", 1);
  -[VUIDownloadDataSource _deDupedMediaEntities:](self, "_deDupedMediaEntities:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIDownloadDataSource setActivelyDownloadingMediaItems:](self, "setActivelyDownloadingMediaItems:", v6);
  -[VUIDownloadDataSource _coalesceActiveDownloadEntitiesAndDownloadedEntities](self, "_coalesceActiveDownloadEntitiesAndDownloadedEntities");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[VUIDownloadDataSource _downloadsDidChange:](self, "_downloadsDidChange:", v8);
  -[VUIDownloadDataSource setDownloadEntities:](self, "setDownloadEntities:", v8);
  -[VUIDownloadDataSource _notifyDelegatesDownloadsFetchCompletedWithChanges:](self, "_notifyDelegatesDownloadsFetchCompletedWithChanges:", v7);

}

- (void)startFetch
{
  -[VUIDownloadDataSource _loadDownloadedEntities](self, "_loadDownloadedEntities");
  -[VUIDownloadDataSource _loadActiveDownloads](self, "_loadActiveDownloads");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[VUIDownloadDataSource libraryContentsChangeDebounceTimer](self, "libraryContentsChangeDebounceTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[VUIDownloadDataSource sDownloadManager](self, "sDownloadManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeDelegate:", self);

  v7.receiver = self;
  v7.super_class = (Class)VUIDownloadDataSource;
  -[VUIDownloadDataSource dealloc](&v7, sel_dealloc);
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __65__VUIDownloadDataSource_downloadManager_downloadStatesDidChange___block_invoke;
  v12 = &unk_1E9F99C98;
  objc_copyWeak(&v13, &location);
  v8 = &v9;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v9, v10))
    v11((uint64_t)v8);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __65__VUIDownloadDataSource_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDownloadingStateDidChange");

}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __59__VUIDownloadDataSource_downloadManagerDownloadsDidChange___block_invoke;
  v9 = &unk_1E9F99C98;
  objc_copyWeak(&v10, &location);
  v5 = &v6;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v6, v7))
    v8((uint64_t)v5);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __59__VUIDownloadDataSource_downloadManagerDownloadsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDownloadingStateDidChange");

}

id __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "stringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v3, "rangeOfString:options:", v9, 9, (_QWORD)v14) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v9, "length"));
          v10 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v10;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;

  v5 = a3;
  objc_msgSend(a2, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", 0)) ^ 1;

  }
  else
  {
    v11 = 1;
  }
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", 0)) ^ 1;

  }
  else
  {
    v13 = 1;
  }
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", 0)) ^ 1;

  }
  else
  {
    v15 = 1;
  }
  if (objc_msgSend(v9, "length")
    && (objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", 0)) ^ 1,
        v16,
        (v11 | v17) != 1))
  {
    v18 = -1;
  }
  else if ((v15 | v13) == 1)
  {
    v18 = objc_msgSend(v8, "compare:options:", v9, 129);
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  -[VUIDownloadDataSource libraryContentsChangeDebounceTimer](self, "libraryContentsChangeDebounceTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0C99E88];
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __74__VUIDownloadDataSource__handleMediaLibraryContentsDidChangeNotification___block_invoke;
    v11 = &unk_1E9F9C288;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v8, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadDataSource setLibraryContentsChangeDebounceTimer:](self, "setLibraryContentsChangeDebounceTimer:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __74__VUIDownloadDataSource__handleMediaLibraryContentsDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setLibraryContentsChangeDebounceTimer:", 0);
    objc_msgSend(v2, "_loadDownloadedEntities");
    objc_msgSend(v2, "_loadActiveDownloads");
    WeakRetained = v2;
  }

}

- (void)_rentalsDidExpire:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __43__VUIDownloadDataSource__rentalsDidExpire___block_invoke;
  v9 = &unk_1E9F99C98;
  objc_copyWeak(&v10, &location);
  v5 = &v6;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v6, v7))
    v8((uint64_t)v5);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __43__VUIDownloadDataSource__rentalsDidExpire___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPerformingRentalExpirationFetch:", 1);
  objc_msgSend(WeakRetained, "_loadDownloadedEntities");
  objc_msgSend(WeakRetained, "_loadActiveDownloads");

}

- (void)_handleDownloadingStateDidChange
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__VUIDownloadDataSource__handleDownloadingStateDidChange__block_invoke;
  v3[3] = &unk_1E9FA00C0;
  objc_copyWeak(&v4, &location);
  -[VUIDownloadDataSource _getActivelyDownloadingAdamIDsWithCompletion:](self, "_getActivelyDownloadingAdamIDsWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __57__VUIDownloadDataSource__handleDownloadingStateDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = v3;
  objc_msgSend(WeakRetained, "activelyDownloadingAdamIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0DC6998]);
  objc_msgSend(v6, "changeSetFromObjects:toObjects:identifierBlock:isEqualBlock:", v5, v9, &__block_literal_global_97, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setActivelyDownloadingAdamIds:", v9);
  if (objc_msgSend(v7, "hasChanges"))
  {
    objc_msgSend(WeakRetained, "_mediaEntitiesForAdamIDs:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_downloadingMediaEntitiesDidUpdate:", v8);
    objc_msgSend(WeakRetained, "_loadDownloadedEntities");

  }
}

id __57__VUIDownloadDataSource__handleDownloadingStateDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

- (id)_getDownloadEntityInDownloadEntities:(id)a3 containingMediaEntity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "showIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v5;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v21 = v6;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "mediaEntities");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v15, "showIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v7);

          if ((v17 & 1) != 0)
            goto LABEL_13;
        }
        else
        {
          objc_msgSend(v15, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", v8);

          if (v19)
          {
LABEL_13:
            v10 = v13;

            goto LABEL_14;
          }
        }

      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
LABEL_14:
    v6 = v21;
  }

  return v10;
}

- (void)_upsertEpisodesDownloadingForShowWithMediaEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "showIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VUIDownloadDataSource episodesDownloadingForShow](self, "episodesDownloadingForShow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[VUIDownloadDataSource episodesDownloadingForShow](self, "episodesDownloadingForShow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!-[VUIDownloadDataSource _doesEpisodeSet:containMediaEntity:](self, "_doesEpisodeSet:containMediaEntity:", v9, v4))objc_msgSend(v9, "addObject:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadDataSource episodesDownloadingForShow](self, "episodesDownloadingForShow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v9, v5);

    }
  }
  else
  {
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[VUIDownloadDataSource _upsertEpisodesDownloadingForShowWithMediaEntity:].cold.1((uint64_t)v4, v10);

  }
}

void __80__VUIDownloadDataSource__upsertDownloadEntities_withEpisodesDownloadingForShow___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v12 = v7;
  objc_msgSend(v7, "mediaEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "showIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqual:", v11);

  if ((_DWORD)v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __76__VUIDownloadDataSource__notifyDelegatesDownloadsFetchCompletedWithChanges___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "downloadDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "downloadManager:downloadsDidChange:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (BOOL)_doesEpisodeSet:(id)a3 containMediaEntity:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "identifier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && objc_msgSend(v6, "isEqual:", v11))
        {

          LOBYTE(v8) = 1;
          goto LABEL_12;
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  return v8;
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setSDownloadManager:(id)a3
{
  objc_storeStrong((id *)&self->_sDownloadManager, a3);
}

- (void)setPerformingRentalExpirationFetch:(BOOL)a3
{
  self->_performingRentalExpirationFetch = a3;
}

- (NSArray)activelyDownloadingAdamIds
{
  return self->_activelyDownloadingAdamIds;
}

- (NSTimer)libraryContentsChangeDebounceTimer
{
  return self->_libraryContentsChangeDebounceTimer;
}

- (void)setLibraryContentsChangeDebounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_libraryContentsChangeDebounceTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryContentsChangeDebounceTimer, 0);
  objc_storeStrong((id *)&self->_groupingByShowIdentifier, 0);
  objc_storeStrong((id *)&self->_episodesDownloadingForShow, 0);
  objc_storeStrong((id *)&self->_activelyDownloadingMediaItems, 0);
  objc_storeStrong((id *)&self->_activelyDownloadingAdamIds, 0);
  objc_storeStrong((id *)&self->_localMediaItems, 0);
  objc_storeStrong((id *)&self->_sDownloadManager, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_downloadEntities, 0);
  objc_destroyWeak((id *)&self->_downloadDelegate);
}

- (void)_upsertEpisodesDownloadingForShowWithMediaEntity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "DownloadDataSource:: upsertEpisodes currentIdentifier is nil for mediaEntity %@", (uint8_t *)&v2, 0xCu);
}

@end
