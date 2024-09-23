@implementation WKWallpaperRepresentingCollection

- (WKWallpaperRepresentingCollection)initWithWallpaperCollectionIdentifier:(id)a3 displayName:(id)a4 previewWallpaperRepresenting:(id)a5 wallpapersShareBaseAppearance:(BOOL)a6 hiddenFromPicker:(BOOL)a7 disableRotation:(BOOL)a8 wallpaperRepresentingCollection:(id)a9 downloadManager:(id)a10
{
  id v17;
  id v18;
  id v19;
  WKWallpaperRepresentingCollection *v20;
  uint64_t v21;
  NSMutableArray *wallpaperBundles;
  uint64_t v23;
  NSMapTable *wallpaperLookupTable;
  uint64_t v25;
  NSUUID *identifier;
  uint64_t v27;
  NSString *displayName;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v17 = a3;
  v18 = a4;
  v31 = a5;
  v19 = a9;
  v30 = a10;
  v35.receiver = self;
  v35.super_class = (Class)WKWallpaperRepresentingCollection;
  v20 = -[WKWallpaperRepresentingCollection init](&v35, sel_init);
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    wallpaperBundles = v20->__wallpaperBundles;
    v20->__wallpaperBundles = (NSMutableArray *)v21;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v23 = objc_claimAutoreleasedReturnValue();
    wallpaperLookupTable = v20->__wallpaperLookupTable;
    v20->__wallpaperLookupTable = (NSMapTable *)v23;

    v20->_wallpapersShareBaseAppearance = a6;
    v20->_hiddenFromPicker = a7;
    v20->_disableRotation = a8;
    objc_storeStrong((id *)&v20->_wallpaperCollectionIdentifier, a3);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);
    identifier = v20->_identifier;
    v20->_identifier = (NSUUID *)v25;

    objc_storeStrong((id *)&v20->_previewWallpaperRepresenting, a5);
    v27 = objc_msgSend(v18, "copy");
    displayName = v20->_displayName;
    v20->_displayName = (NSString *)v27;

    objc_storeStrong((id *)&v20->_downloadManager, a10);
    objc_initWeak(&location, v20);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __227__WKWallpaperRepresentingCollection_initWithWallpaperCollectionIdentifier_displayName_previewWallpaperRepresenting_wallpapersShareBaseAppearance_hiddenFromPicker_disableRotation_wallpaperRepresentingCollection_downloadManager___block_invoke;
    v32[3] = &unk_1E6EF9940;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v19, "na_each:", v32);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v20;
}

void __227__WKWallpaperRepresentingCollection_initWithWallpaperCollectionIdentifier_displayName_previewWallpaperRepresenting_wallpapersShareBaseAppearance_hiddenFromPicker_disableRotation_wallpaperRepresentingCollection_downloadManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v14 = v3;
  v5 = v14;
  if (objc_msgSend(v14, "isOffloaded"))
  {
    objc_msgSend(WeakRetained, "downloadManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifierString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localWallpaperRepresentingWithIdentifier:wallpaperName:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = v9;
    else
      v10 = v14;
    v5 = v10;

  }
  objc_msgSend(WeakRetained, "_wallpaperBundles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v5);

  objc_msgSend(WeakRetained, "_wallpaperLookupTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifierString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v5, v13);

}

- (WKWallpaperRepresentingCollection)initWithURL:(id)a3 downloadManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  WKWallpaperRepresentingCollection *v52;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  unsigned int v59;
  void *v60;
  unsigned int v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_loadCollectionMetadataWithURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (!v11)
    objc_msgSend((id)objc_opt_class(), "_raiseInvalidMetadataExceptionForMetadataKeypath:collectionURL:", CFSTR("identifier"), v6);
  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v6);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v14;
  objc_msgSend(v65, "localizedStringForKey:value:table:", v14, 0, 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_loadWallpaperRepresentingContentFromURL:collectionMetadata:", v6, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("wallpapersShareBaseAppearance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v63 = v17;

  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hiddenFromPicker"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  v62 = v20;
  v67 = v15;
  if (objc_msgSend(v20, "BOOLValue"))
  {
    WKLogForCategory(4uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v71 = "-[WKWallpaperRepresentingCollection initWithURL:downloadManager:]";
      v72 = 2114;
      v73 = v11;
      _os_log_impl(&dword_1B8C64000, v21, OS_LOG_TYPE_DEFAULT, "%s: Hiding Wallpaper '%{public}@': Explicitly hidden", buf, 0x16u);
    }
    v61 = 1;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("supportedDeviceClasses"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v21 = v23;

    v24 = (void *)MGCopyAnswer();
    if (v21 && (-[NSObject na_safeContainsObject:](v21, "na_safeContainsObject:", v24) & 1) == 0)
    {
      WKLogForCategory(4uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v71 = "-[WKWallpaperRepresentingCollection initWithURL:downloadManager:]";
        v72 = 2114;
        v73 = v11;
        v74 = 2114;
        v75 = v24;
        _os_log_impl(&dword_1B8C64000, v25, OS_LOG_TYPE_DEFAULT, "%s: Hiding Wallpaper '%{public}@': Device class '%{public}@' not in supported list", buf, 0x20u);
      }

      v61 = 1;
    }
    else
    {
      v61 = 0;
    }
    v15 = v67;

  }
  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("disableRotation"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  v60 = v28;
  v59 = objc_msgSend(v28, "BOOLValue");
  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("previewWallpaperMatchesDeviceTraits"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = v29;
  else
    v30 = 0;
  v31 = v30;

  if (!objc_msgSend(v31, "BOOLValue"))
    goto LABEL_61;
  v58 = v11;
  v56 = v7;
  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("previewWallpaperDeviceTraitsLookup"));
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
    v34 = v33;
  }
  else
  {
    v34 = 0;
  }

  if (!v34)
    objc_msgSend((id)objc_opt_class(), "_raiseInvalidMetadataExceptionForMetadataKeypath:collectionURL:", CFSTR("previewWallpaperDeviceTraitsLookup"), v6);
  v57 = v6;
  -[WKWallpaperRepresentingCollection deviceColor](self, "deviceColor");
  v35 = objc_claimAutoreleasedReturnValue();
  -[WKWallpaperRepresentingCollection deviceEnclosureColor](self, "deviceEnclosureColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v55 = (void *)v35;
  objc_msgSend(v34, "objectForKeyedSubscript:", v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (objc_opt_isKindOfClass() & 1) != 0 ? v37 : 0;
  v39 = v38;

  objc_opt_class();
  objc_msgSend(v39, "objectForKeyedSubscript:", v36);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (objc_opt_isKindOfClass() & 1) != 0 ? v40 : 0;
  v42 = v41;

  if (v42)
  {
    objc_opt_class();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("wallpaperIdentifier"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v44 = v43;
    else
      v44 = 0;
    v45 = v44;

    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __65__WKWallpaperRepresentingCollection_initWithURL_downloadManager___block_invoke;
    v68[3] = &unk_1E6EF9968;
    v46 = v45;
    v69 = v46;
    objc_msgSend(v67, "na_firstObjectPassingTest:", v68);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      WKLogForCategory(4uLL);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v47, "identifierString");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v71 = "-[WKWallpaperRepresentingCollection initWithURL:downloadManager:]";
        v72 = 2114;
        v73 = v54;
        v74 = 2114;
        v75 = v58;
        _os_log_impl(&dword_1B8C64000, v48, OS_LOG_TYPE_DEFAULT, "%s: Using Preview Wallpaper Representing '%{public}@' for collection identifier '%{public}@' based on device traits.", buf, 0x20u);

      }
    }

  }
  else
  {
    v47 = 0;
  }

  v7 = v56;
  v6 = v57;
  v11 = v58;
  v15 = v67;
  if (!v47)
  {
LABEL_61:
    WKLogForCategory(4uLL);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "firstObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "identifierString");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v71 = "-[WKWallpaperRepresentingCollection initWithURL:downloadManager:]";
      v72 = 2114;
      v73 = v11;
      v74 = 2114;
      v75 = v51;
      _os_log_impl(&dword_1B8C64000, v49, OS_LOG_TYPE_DEFAULT, "%s: Preview Wallpaper Representing for collection identifier '%{public}@' not set, defaulting to first wallpaper '%{public}@'.", buf, 0x20u);

      v15 = v67;
    }

    objc_msgSend(v15, "firstObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52 = -[WKWallpaperRepresentingCollection initWithWallpaperCollectionIdentifier:displayName:previewWallpaperRepresenting:wallpapersShareBaseAppearance:hiddenFromPicker:disableRotation:wallpaperRepresentingCollection:downloadManager:](self, "initWithWallpaperCollectionIdentifier:displayName:previewWallpaperRepresenting:wallpapersShareBaseAppearance:hiddenFromPicker:disableRotation:wallpaperRepresentingCollection:downloadManager:", v11, v64, v47, objc_msgSend(v63, "BOOLValue"), v61, v59, v15, v7);

  return v52;
}

uint64_t __65__WKWallpaperRepresentingCollection_initWithURL_downloadManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifierString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (BOOL)shouldLoadWallpaperCollectionAtURL:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  char v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  WKLogForCategory(4uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "+[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:]";
    _os_log_impl(&dword_1B8C64000, v4, OS_LOG_TYPE_DEFAULT, "%s: start.", buf, 0xCu);
  }

  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v15);
  if (v15)
    v8 = v7;
  else
    v8 = 0;

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("WallpaperCollection.plist"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v11, 0);

    if ((v12 & 1) == 0)
    {
      WKLogForCategory(4uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[NSObject path](v9, "path");
        objc_claimAutoreleasedReturnValue();
        +[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:].cold.1();
      }

    }
  }
  else
  {
    WKLogForCategory(4uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      objc_claimAutoreleasedReturnValue();
      +[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:].cold.2();
    }
    v12 = 0;
  }

  __72__WKWallpaperRepresentingCollection_shouldLoadWallpaperCollectionAtURL___block_invoke();
  return v12;
}

void __72__WKWallpaperRepresentingCollection_shouldLoadWallpaperCollectionAtURL___block_invoke()
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
    v1 = 136315138;
    v2 = "+[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:]_block_invoke";
    _os_log_impl(&dword_1B8C64000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

- (int64_t)numberOfWallpapers
{
  void *v2;
  int64_t v3;

  -[WKWallpaperRepresentingCollection _wallpaperBundles](self, "_wallpaperBundles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)supportsDownloading
{
  void *v2;
  BOOL v3;

  -[WKWallpaperRepresentingCollection downloadManager](self, "downloadManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)wallpaperBundleAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[WKWallpaperRepresentingCollection _wallpaperBundles](self, "_wallpaperBundles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)containsWallpaperRepresentingWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WKWallpaperRepresentingCollection _wallpaperLookupTable](self, "_wallpaperLookupTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)wallpaperRepresentingWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WKWallpaperRepresentingCollection _wallpaperLookupTable](self, "_wallpaperLookupTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)downloadWallpaperRepresentingWithIdentifier:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WKWallpaperRepresentingCollection wallpaperRepresentingWithIdentifier:](self, "wallpaperRepresentingWithIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[WKWallpaperRepresentingCollection downloadManager](self, "downloadManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __101__WKWallpaperRepresentingCollection_downloadWallpaperRepresentingWithIdentifier_progress_completion___block_invoke;
  v15[3] = &unk_1E6EF9990;
  objc_copyWeak(&v18, &location);
  v13 = v11;
  v16 = v13;
  v14 = v10;
  v17 = v14;
  objc_msgSend(v12, "downloadWallpaperRepresentingIfNeeded:progress:withCompletion:", v13, v9, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __101__WKWallpaperRepresentingCollection_downloadWallpaperRepresentingWithIdentifier_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (v13)
  {
    objc_msgSend(WeakRetained, "_wallpaperBundles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", *(_QWORD *)(a1 + 32));

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "_wallpaperBundles");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v9, v13);

      objc_msgSend(v7, "_wallpaperLookupTable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifierString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, v12);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)cancelDownloadForWallpaperRepresentingWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[WKWallpaperRepresentingCollection wallpaperRepresentingWithIdentifier:](self, "wallpaperRepresentingWithIdentifier:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WKWallpaperRepresentingCollection downloadManager](self, "downloadManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelDownloadForWallpaperRepresenting:withCompletion:", v8, v6);

}

- (id)deviceColor
{
  return (id)MGCopyAnswer();
}

- (id)deviceEnclosureColor
{
  return (id)MGCopyAnswer();
}

+ (id)_loadCollectionMetadataWithURL:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_class *v41;
  void *v42;
  char *v43;
  id v44;
  char v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  WKLogForCategory(4uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v47 = "+[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:]";
    _os_log_impl(&dword_1B8C64000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: start.", buf, 0xCu);
  }

  v45 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v45);
  if (v45)
    v8 = v7;
  else
    v8 = 0;

  v9 = (_QWORD *)MEMORY[0x1E0C99778];
  if ((v8 & 1) == 0)
  {
    WKLogForCategory(4uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      objc_claimAutoreleasedReturnValue();
      +[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:].cold.2();
    }

    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: Wallpaper collection does not exist at URL '%@'."), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", *v9, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "raise");
  }
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("WallpaperCollection.plist"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v20, 0);

  if ((v21 & 1) == 0)
  {
    WKLogForCategory(4uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "path");
      objc_claimAutoreleasedReturnValue();
      +[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:].cold.1();
    }

    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: Wallpaper collection does not contain a metadata file at path '%@'."), v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "exceptionWithName:reason:userInfo:", *v9, v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "raise");
  }
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v18, &v44);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v44;
  if (v31)
  {
    WKLogForCategory(4uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v43 = (char *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v43;
      v48 = 2114;
      v49 = v42;
      v50 = 2114;
      v51 = v31;
      _os_log_error_impl(&dword_1B8C64000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error in loading Wallpaper Collection metadata file '%{public}@', error '%{public}@'", buf, 0x20u);

    }
    v33 = (void *)MEMORY[0x1E0C99DA0];
    v34 = (void *)MEMORY[0x1E0CB3940];
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("%@: Encountered error in loading metadata file (path: '%@') (error: '%@')."), v36, v37, v31);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "exceptionWithName:reason:userInfo:", *v9, v38, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "raise");
  }

  __68__WKWallpaperRepresentingCollection__loadCollectionMetadataWithURL___block_invoke();
  return v30;
}

void __68__WKWallpaperRepresentingCollection__loadCollectionMetadataWithURL___block_invoke()
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
    v2 = "+[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:]_block_invoke";
    _os_log_impl(&dword_1B8C64000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

+ (id)_loadWallpaperRepresentingContentFromURL:(id)a3 collectionMetadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  id v46;
  unsigned __int8 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("order"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
    objc_msgSend(a1, "_raiseInvalidMetadataExceptionForMetadataKeypath:collectionURL:", CFSTR("order"), v6);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Wallpapers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v12;
  objc_msgSend(v12, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v14, &v47);
  v16 = v47;

  if (v15 && v16)
  {
    v38 = v7;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v17, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v40, 0, 0, &v46);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v46;

    if (v19)
    {
      WKLogForCategory(4uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[WKWallpaperRepresentingCollection _loadWallpaperRepresentingContentFromURL:collectionMetadata:].cold.1(v6, (uint64_t)v19, v20);

      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = *MEMORY[0x1E0C99778];
      v23 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass((Class)a1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: Encountered error in loading contents of directory for system wallpape collection (path: '%@') (error: '%@')."), v24, v25, v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v26, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "raise");
    }
    v39 = v6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v18;
    objc_msgSend(v18, "na_filter:", &__block_literal_global_55);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __97__WKWallpaperRepresentingCollection__loadWallpaperRepresentingContentFromURL_collectionMetadata___block_invoke_2;
    v45[3] = &unk_1E6EF99F8;
    v45[4] = v28;
    objc_msgSend(v29, "na_each:", v45);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v30 = v10;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v42;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v42 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(v28, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v34));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "na_safeAddObject:", v35);

          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v32);
    }

    v7 = v38;
    v6 = v39;
  }
  else
  {
    WKLogForCategory(4uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      +[WKWallpaperRepresentingCollection _loadWallpaperRepresentingContentFromURL:collectionMetadata:].cold.2(v6, v19);
  }

  return v11;
}

BOOL __97__WKWallpaperRepresentingCollection__loadWallpaperRepresentingContentFromURL_collectionMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:](WKWallpaperBundle, "shouldLoadWallpaperBundleAtURL:", a2);
}

void __97__WKWallpaperRepresentingCollection__loadWallpaperRepresentingContentFromURL_collectionMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  WKWallpaperBundle *v6;

  v3 = a2;
  v6 = -[WKWallpaperBundle initWithURL:]([WKWallpaperBundle alloc], "initWithURL:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WKWallpaperBundle identifier](v6, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, v5);

}

+ (void)_raiseInvalidMetadataExceptionForMetadataKeypath:(id)a3 collectionURL:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a4;
  v10 = a3;
  NSStringFromClass((Class)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: (path: '%@') metadata does not contain valid value for keypath: '%@'"), v11, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "raise");
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)wallpapersShareBaseAppearance
{
  return self->_wallpapersShareBaseAppearance;
}

- (BOOL)hiddenFromPicker
{
  return self->_hiddenFromPicker;
}

- (BOOL)disableRotation
{
  return self->_disableRotation;
}

- (WKWallpaperRepresenting)previewWallpaperRepresenting
{
  return self->_previewWallpaperRepresenting;
}

- (NSString)wallpaperCollectionIdentifier
{
  return self->_wallpaperCollectionIdentifier;
}

- (void)setWallpaperCollectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperCollectionIdentifier, a3);
}

- (WKWallpaperBundleDownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
  objc_storeStrong((id *)&self->_downloadManager, a3);
}

- (NSMutableArray)_wallpaperBundles
{
  return self->__wallpaperBundles;
}

- (void)set_wallpaperBundles:(id)a3
{
  objc_storeStrong((id *)&self->__wallpaperBundles, a3);
}

- (NSMapTable)_wallpaperLookupTable
{
  return self->__wallpaperLookupTable;
}

- (void)set_wallpaperLookupTable:(id)a3
{
  objc_storeStrong((id *)&self->__wallpaperLookupTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__wallpaperLookupTable, 0);
  objc_storeStrong((id *)&self->__wallpaperBundles, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_wallpaperCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->_previewWallpaperRepresenting, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)shouldLoadWallpaperCollectionAtURL:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_4_0();
  *v1 = 136315394;
  OUTLINED_FUNCTION_1_0(v2, (uint64_t)v1, (uint64_t)"+[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:]");
  OUTLINED_FUNCTION_0_0(&dword_1B8C64000, v3, v4, "%s: Wallpaper Collection metadata file does not exist at URL '%{public}@'", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)shouldLoadWallpaperCollectionAtURL:.cold.2()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_4_0();
  *v1 = 136315394;
  OUTLINED_FUNCTION_1_0(v2, (uint64_t)v1, (uint64_t)"+[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:]");
  OUTLINED_FUNCTION_0_0(&dword_1B8C64000, v3, v4, "%s: No wallpaper collection found at path '%{public}@'.", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_loadCollectionMetadataWithURL:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_4_0();
  *v1 = 136446466;
  OUTLINED_FUNCTION_1_0(v2, (uint64_t)v1, (uint64_t)"+[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:]");
  OUTLINED_FUNCTION_0_0(&dword_1B8C64000, v3, v4, "%{public}s: Wallpaper Collection metadata file does not exist at URL '%{public}@'", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_loadCollectionMetadataWithURL:.cold.2()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_4_0();
  *v1 = 136446466;
  OUTLINED_FUNCTION_1_0(v2, (uint64_t)v1, (uint64_t)"+[WKWallpaperRepresentingCollection _loadCollectionMetadataWithURL:]");
  OUTLINED_FUNCTION_0_0(&dword_1B8C64000, v3, v4, "%{public}s: No wallpaper collection found at URL '%{public}@.", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_loadWallpaperRepresentingContentFromURL:(NSObject *)a3 collectionMetadata:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  __int16 v6;
  int v7[5];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136446722;
  OUTLINED_FUNCTION_1();
  v8 = v6;
  v9 = a2;
  _os_log_error_impl(&dword_1B8C64000, a3, OS_LOG_TYPE_ERROR, "%{public}s: Encountered error in retrieving contents of collection at path '%{public}@', error '%{public}@'", (uint8_t *)v7, 0x20u);

}

+ (void)_loadWallpaperRepresentingContentFromURL:(void *)a1 collectionMetadata:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136446466;
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1B8C64000, a2, OS_LOG_TYPE_FAULT, "%{public}s: No 'Wallpapers' directory found in wallpaper collection at path '%{public}@'.", (uint8_t *)v4, 0x16u);

}

@end
