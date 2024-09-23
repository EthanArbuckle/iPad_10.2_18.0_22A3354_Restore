@implementation WKWallpaperRepresentingCollectionsManager

- (WKWallpaperRepresentingCollectionsManager)initWithDownloadManager:(id)a3
{
  id v5;
  WKWallpaperRepresentingCollectionsManager *v6;
  WKWallpaperRepresentingCollectionsManager *v7;
  uint64_t v8;
  NSMutableArray *wallpaperCollections;
  uint64_t v10;
  NSMapTable *wallpaperCollectionLookupTable;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WKWallpaperRepresentingCollectionsManager;
  v6 = -[WKWallpaperRepresentingCollectionsManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__downloadManager, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    wallpaperCollections = v7->__wallpaperCollections;
    v7->__wallpaperCollections = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    wallpaperCollectionLookupTable = v7->__wallpaperCollectionLookupTable;
    v7->__wallpaperCollectionLookupTable = (NSMapTable *)v10;

    -[WKWallpaperRepresentingCollectionsManager _loadCollections](v7, "_loadCollections");
  }

  return v7;
}

- (void)_loadCollections
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void (**v6)(_QWORD);
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WKLogForCategory(4uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    v10 = 2082;
    v11 = "-[WKWallpaperRepresentingCollectionsManager _loadCollections]";
    _os_log_impl(&dword_1B8C64000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}s start.", buf, 0x16u);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__WKWallpaperRepresentingCollectionsManager__loadCollections__block_invoke;
  aBlock[3] = &unk_1E6EF9B68;
  aBlock[4] = self;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections](self, "_loadSystemWallpaperCollections");
  v6[2](v6);

}

void __61__WKWallpaperRepresentingCollectionsManager__loadCollections__block_invoke()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WKLogForCategory(4uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138543618;
    v4 = v2;
    v5 = 2082;
    v6 = "-[WKWallpaperRepresentingCollectionsManager _loadCollections]_block_invoke";
    _os_log_impl(&dword_1B8C64000, v0, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}s complete.", (uint8_t *)&v3, 0x16u);

  }
}

- (void)_loadSystemWallpaperCollections
{
  NSObject *v2;
  NSObject *v3;
  objc_class *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  char *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  char *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  WKWallpaperRepresentingCollection *v26;
  void *v27;
  _BOOL4 v28;
  WKWallpaperRepresentingCollection *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  NSObject *v42;
  objc_class *v43;
  char *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  WKWallpaperRepresentingCollection *v76;
  void *v77;
  _BOOL4 v78;
  WKWallpaperRepresentingCollection *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *log;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  const char *v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  id v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  WKLogForCategory(4uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v114 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]";
    _os_log_impl(&dword_1B8C64000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: start.", buf, 0xCu);
  }

  v90 = (void *)MGCopyAnswer();
  WKLogForCategory(4uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v114 = v5;
    v115 = 2114;
    v116 = v90;
    _os_log_impl(&dword_1B8C64000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolving default wallpaper collections for device name '%{public}@'", buf, 0x16u);

  }
  WKWallpapersBaseURL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Collections"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v90, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Collections~%@.plist"), v8);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "URLByAppendingPathComponent:", v9);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v91, "URLByAppendingPathComponent:", CFSTR("Collections.plist"));
    v12 = objc_claimAutoreleasedReturnValue();

    v92 = (void *)v12;
  }
  WKLogForCategory(4uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (char *)(id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v114 = v15;
    v115 = 2114;
    v116 = v16;
    _os_log_impl(&dword_1B8C64000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolved to default wallpaper collections file at path '%{public}@'", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v92);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = 0;
  objc_msgSend(v17, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v91, 0, 0, &v109);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v109;

  if (v89)
  {
    WKLogForCategory(4uLL);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (char *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v114 = v19;
      v115 = 2114;
      v116 = v20;
      v117 = 2114;
      v118 = v89;
      _os_log_error_impl(&dword_1B8C64000, log, OS_LOG_TYPE_ERROR, "%{public}@: Unable to load contents of directory at path '%{public}@'. Error '%{public}@'.", buf, 0x20u);

    }
    goto LABEL_55;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  log = objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v21 = v88;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v106 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        objc_msgSend(v25, "path");
        v26 = (WKWallpaperRepresentingCollection *)objc_claimAutoreleasedReturnValue();
        -[WKWallpaperRepresentingCollection lowercaseString](v26, "lowercaseString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v27, "hasSuffix:", CFSTR("wallpapercollection")))
          goto LABEL_23;
        v28 = +[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:](WKWallpaperRepresentingCollection, "shouldLoadWallpaperCollectionAtURL:", v25);

        if (!v28)
          continue;
        v29 = [WKWallpaperRepresentingCollection alloc];
        -[WKWallpaperRepresentingCollectionsManager _downloadManager](self, "_downloadManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[WKWallpaperRepresentingCollection initWithURL:downloadManager:](v29, "initWithURL:downloadManager:", v25, v30);

        if (v26)
        {
          WKLogForCategory(4uLL);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            -[WKWallpaperRepresentingCollection identifier](v26, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "UUIDString");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[WKWallpaperRepresentingCollection displayName](v26, "displayName");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v114 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]";
            v115 = 2114;
            v116 = v33;
            v117 = 2114;
            v118 = v34;
            _os_log_impl(&dword_1B8C64000, v31, OS_LOG_TYPE_DEFAULT, "%s: Loaded wallpaper collection (identifier: '%{public}@', displayName: '%{public}@').", buf, 0x20u);

          }
          -[WKWallpaperRepresentingCollection identifier](v26, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "UUIDString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v26, v35);

LABEL_23:
        }

      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
    }
    while (v22);
  }

  WKAppleInternalWallpapersBaseURL();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "URLByAppendingPathComponent:", CFSTR("Collections"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v93, "sf_isInternalInstall"))
  {
    WKAppleInternalWallpapersBaseURL();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "path");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "fileExistsAtPath:", v39);

      if (!v40)
      {
        v89 = 0;
        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = 0;
      objc_msgSend(v41, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v86, 0, 0, &v104);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v104;

      if (v89)
      {
        WKLogForCategory(4uLL);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = (objc_class *)objc_opt_class();
          NSStringFromClass(v43);
          v44 = (char *)(id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "path");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v114 = v44;
          v115 = 2114;
          v116 = v45;
          v117 = 2114;
          v118 = v89;
          _os_log_error_impl(&dword_1B8C64000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Unable to load internal contents of directory at path '%{public}@'. Error '%{public}@'.", buf, 0x20u);

        }
LABEL_72:

        goto LABEL_34;
      }
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v42 = v93;
      v72 = -[NSObject countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
      if (!v72)
        goto LABEL_72;
      v73 = *(_QWORD *)v101;
LABEL_59:
      v74 = 0;
      while (1)
      {
        if (*(_QWORD *)v101 != v73)
          objc_enumerationMutation(v42);
        v75 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v74);
        objc_msgSend(v75, "path");
        v76 = (WKWallpaperRepresentingCollection *)objc_claimAutoreleasedReturnValue();
        -[WKWallpaperRepresentingCollection lowercaseString](v76, "lowercaseString");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v77, "hasSuffix:", CFSTR("wallpapercollection")))
          goto LABEL_68;
        v78 = +[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:](WKWallpaperRepresentingCollection, "shouldLoadWallpaperCollectionAtURL:", v75);

        if (v78)
          break;
LABEL_70:
        if (v72 == ++v74)
        {
          v72 = -[NSObject countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
          if (!v72)
            goto LABEL_72;
          goto LABEL_59;
        }
      }
      v79 = [WKWallpaperRepresentingCollection alloc];
      -[WKWallpaperRepresentingCollectionsManager _downloadManager](self, "_downloadManager");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = -[WKWallpaperRepresentingCollection initWithURL:downloadManager:](v79, "initWithURL:downloadManager:", v75, v80);

      if (v76)
      {
        WKLogForCategory(4uLL);
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          -[WKWallpaperRepresentingCollection identifier](v76, "identifier");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "UUIDString");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          -[WKWallpaperRepresentingCollection displayName](v76, "displayName");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v114 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]";
          v115 = 2114;
          v116 = v83;
          v117 = 2114;
          v118 = v84;
          _os_log_impl(&dword_1B8C64000, v81, OS_LOG_TYPE_DEFAULT, "%s: Loaded internal wallpaper collection (identifier: '%{public}@', displayName: '%{public}@').", buf, 0x20u);

        }
        -[WKWallpaperRepresentingCollection identifier](v76, "identifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "UUIDString");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v76, v85);

LABEL_68:
      }

      goto LABEL_70;
    }
  }
  v89 = 0;
LABEL_34:

LABEL_35:
  objc_opt_class();
  objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("order"));
  v46 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v47 = v46;
  else
    v47 = 0;
  v48 = v47;

  if (!v48)
  {
    v49 = (void *)MEMORY[0x1E0C99DA0];
    v50 = (void *)MEMORY[0x1E0CB3940];
    v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "path");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v54, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v55, "raise");
  }
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v56 = v48;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v97;
    do
    {
      for (j = 0; j != v57; ++j)
      {
        if (*(_QWORD *)v97 != v58)
          objc_enumerationMutation(v56);
        -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * j));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if (v60 && objc_msgSend(v60, "numberOfWallpapers") >= 1)
        {
          WKLogForCategory(4uLL);
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v61, "identifier");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "UUIDString");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "displayName");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v114 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]";
            v115 = 2114;
            v116 = v64;
            v117 = 2114;
            v118 = v65;
            _os_log_impl(&dword_1B8C64000, v62, OS_LOG_TYPE_DEFAULT, "%s: Adding wallpaper collection (identifier: '%{public}@', displayName: '%{public}@').", buf, 0x20u);

          }
          -[WKWallpaperRepresentingCollectionsManager _wallpaperCollections](self, "_wallpaperCollections");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "na_safeAddObject:", v61);

          -[WKWallpaperRepresentingCollectionsManager _wallpaperCollectionLookupTable](self, "_wallpaperCollectionLookupTable");
          v67 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "identifier");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKey:](v67, "setObject:forKey:", v61, v68);

        }
        else
        {
          WKLogForCategory(4uLL);
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v61, "identifier");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "UUIDString");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "displayName");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v114 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]";
            v115 = 2114;
            v116 = v70;
            v117 = 2114;
            v118 = v71;
            _os_log_impl(&dword_1B8C64000, v67, OS_LOG_TYPE_DEFAULT, "%s: Skipping empty wallpaper colleciton (identifier: '%{public}@', displayName: '%{public}@').", buf, 0x20u);

          }
        }

      }
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
    }
    while (v57);
  }

LABEL_55:
  __76__WKWallpaperRepresentingCollectionsManager__loadSystemWallpaperCollections__block_invoke();
}

void __76__WKWallpaperRepresentingCollectionsManager__loadSystemWallpaperCollections__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  WKLogForCategory(4uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446210;
    v2 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]_block_invoke";
    _os_log_impl(&dword_1B8C64000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

+ (WKWallpaperRepresentingCollectionsManager)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_23);
  return (WKWallpaperRepresentingCollectionsManager *)(id)defaultManager__defaultWallpaperCollectionsManager;
}

void __59__WKWallpaperRepresentingCollectionsManager_defaultManager__block_invoke()
{
  WKWallpaperRepresentingCollectionsManager *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [WKWallpaperRepresentingCollectionsManager alloc];
  +[WKWallpaperBundleDownloadManager defaultManager](WKWallpaperBundleDownloadManager, "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[WKWallpaperRepresentingCollectionsManager initWithDownloadManager:](v0, "initWithDownloadManager:", v3);
  v2 = (void *)defaultManager__defaultWallpaperCollectionsManager;
  defaultManager__defaultWallpaperCollectionsManager = v1;

}

- (int64_t)numberOfWallpaperCollections
{
  void *v2;
  int64_t v3;

  -[WKWallpaperRepresentingCollectionsManager _wallpaperCollections](self, "_wallpaperCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)wallpaperCollectionAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[WKWallpaperRepresentingCollectionsManager _wallpaperCollections](self, "_wallpaperCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wallpaperCollectionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WKWallpaperRepresentingCollectionsManager _wallpaperCollectionLookupTable](self, "_wallpaperCollectionLookupTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WKWallpaperBundleDownloadManager)_downloadManager
{
  return self->__downloadManager;
}

- (void)set_downloadManager:(id)a3
{
  objc_storeStrong((id *)&self->__downloadManager, a3);
}

- (NSMutableArray)_wallpaperCollections
{
  return self->__wallpaperCollections;
}

- (void)set_wallpaperCollections:(id)a3
{
  objc_storeStrong((id *)&self->__wallpaperCollections, a3);
}

- (NSMapTable)_wallpaperCollectionLookupTable
{
  return self->__wallpaperCollectionLookupTable;
}

- (void)set_wallpaperCollectionLookupTable:(id)a3
{
  objc_storeStrong((id *)&self->__wallpaperCollectionLookupTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__wallpaperCollectionLookupTable, 0);
  objc_storeStrong((id *)&self->__wallpaperCollections, 0);
  objc_storeStrong((id *)&self->__downloadManager, 0);
}

@end
