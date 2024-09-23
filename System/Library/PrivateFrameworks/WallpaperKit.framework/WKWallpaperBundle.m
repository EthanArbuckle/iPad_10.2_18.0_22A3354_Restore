@implementation WKWallpaperBundle

- (WKWallpaperBundle)initWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  WKWallpaperBundle *v11;
  WKWallpaperBundle *v12;
  WKWallpaperBundle *v13;
  uint64_t v14;
  NSURL *bundleURL;
  uint64_t v16;
  NSMutableDictionary *wallpaperAssetLookup;
  objc_super v19;
  unsigned __int8 v20;

  v4 = a3;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v20);
  v8 = v20;

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    WKLogForCategory(3uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WKWallpaperBundle initWithURL:].cold.1((uint64_t)self, (uint64_t)v4, v10);

    v11 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)WKWallpaperBundle;
    v12 = -[WKWallpaperBundle init](&v19, sel_init);
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v4, "copy");
      bundleURL = v13->_bundleURL;
      v13->_bundleURL = (NSURL *)v14;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = objc_claimAutoreleasedReturnValue();
      wallpaperAssetLookup = v13->__wallpaperAssetLookup;
      v13->__wallpaperAssetLookup = (NSMutableDictionary *)v16;

      -[WKWallpaperBundle _loadBundle](v13, "_loadBundle");
    }
    self = v13;
    v11 = self;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WKWallpaperBundle bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithURL:", v5);

  return v6;
}

- (void)_loadBundle
{
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v4 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_0(&dword_1B8C64000, a2, v7, "%{public}@: Wallpaper bundle does not exist at URL '%{public}@'", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

- (void)_processAssetDictionary:(id)a3 forLocation:(id)a4
{
  id v6;
  __int128 v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  objc_class *v33;
  id v34;
  void *v35;
  __int128 v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  uint64_t v52;
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v37 = a4;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v39 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v44;
    *(_QWORD *)&v7 = 138543874;
    v36 = v7;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v44 != v38)
          objc_enumerationMutation(v6);
        v9 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_opt_class();
        objc_msgSend(v6, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = v10;
          else
            v11 = 0;
          v12 = v11;
        }
        else
        {
          v12 = 0;
        }

        objc_opt_class();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("type"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;
        }
        else
        {
          v15 = 0;
        }

        if (!v15)
        {
          v55[0] = CFSTR("assets");
          v55[1] = v9;
          v55[2] = CFSTR("type");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("."));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v17);

        }
        switch(WKWallpaperTypeFromString(v15))
        {
          case 0:
            -[WKWallpaperBundle _stillWallpaperWithMetadataDictionary:wallpaperAppearance:](self, "_stillWallpaperWithMetadataDictionary:wallpaperAppearance:", v12, v9);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_37;
          case 1:
            -[WKWallpaperBundle _liveWallpaperWithMetadataDictionary:wallpaperAppearance:](self, "_liveWallpaperWithMetadataDictionary:wallpaperAppearance:", v12, v9);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_37;
          case 2:
            objc_opt_class();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("representedType"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v20 = v19;
              else
                v20 = 0;
              v21 = v20;
            }
            else
            {
              v21 = 0;
            }

            if (!v21)
            {
              v54[0] = CFSTR("assets");
              v54[1] = v9;
              v54[2] = CFSTR("representedType");
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "componentsJoinedByString:", CFSTR("."));
              v41 = v15;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v29);

              v15 = v41;
            }
            -[WKWallpaperBundle _thumbnailWallpaperWithMetadataDictionary:representedType:wallpaperAppearance:](self, "_thumbnailWallpaperWithMetadataDictionary:representedType:wallpaperAppearance:", v12, WKWallpaperTypeFromString(v21), v9);
            v30 = objc_claimAutoreleasedReturnValue();
            goto LABEL_47;
          case 3:
            objc_opt_class();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("representedType"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v23 = v22;
              else
                v23 = 0;
              v21 = v23;
            }
            else
            {
              v21 = 0;
            }

            if (!v21)
            {
              v53[0] = CFSTR("assets");
              v53[1] = v9;
              v53[2] = CFSTR("representedType");
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
              v42 = v15;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "componentsJoinedByString:", CFSTR("."));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v32);

              v15 = v42;
            }
            -[WKWallpaperBundle _layeredThumbnailWallpaperWithMetadataDictionary:representedType:wallpaperAppearance:](self, "_layeredThumbnailWallpaperWithMetadataDictionary:representedType:wallpaperAppearance:", v12, WKWallpaperTypeFromString(v21), v9);
            v30 = objc_claimAutoreleasedReturnValue();
LABEL_47:
            v24 = v30;

            if (!v24)
              goto LABEL_48;
            goto LABEL_38;
          case 4:
            -[WKWallpaperBundle _layeredStillWallpaperWithMetadataDictionary:wallpaperAppearance:](self, "_layeredStillWallpaperWithMetadataDictionary:wallpaperAppearance:", v12, v9);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_37;
          case 5:
            -[WKWallpaperBundle _layeredStripeWallpaperWithMetadataDictionary:wallpaperAppearance:](self, "_layeredStripeWallpaperWithMetadataDictionary:wallpaperAppearance:", v12, v9);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_37;
          case 6:
            -[WKWallpaperBundle _bokehWallpaperWithMetadataDictionary:wallpaperAppearance:](self, "_bokehWallpaperWithMetadataDictionary:wallpaperAppearance:", v12, v9);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_37;
          case 7:
            -[WKWallpaperBundle _layeredAnimationWallpaperWithMetadataDictionary:wallpaperAppearance:](self, "_layeredAnimationWallpaperWithMetadataDictionary:wallpaperAppearance:", v12, v9);
            v18 = objc_claimAutoreleasedReturnValue();
LABEL_37:
            v24 = v18;
            if (!v18)
              goto LABEL_48;
LABEL_38:
            -[WKWallpaperBundle _wallpaperAssetLookup](self, "_wallpaperAssetLookup", v36);
            v40 = v15;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "na_objectForKey:withDefaultValue:", v37, &__block_literal_global);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "na_safeSetObject:forKey:", v24, v9);
            -[WKWallpaperBundle _wallpaperAssetLookup](self, "_wallpaperAssetLookup");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "na_safeSetObject:forKey:", v26, v37);

            v15 = v40;
            break;
          default:
LABEL_48:
            WKLogForCategory(3uLL);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v33 = (objc_class *)objc_opt_class();
              NSStringFromClass(v33);
              v34 = v15;
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v36;
              v48 = v35;
              v49 = 2114;
              v50 = v37;
              v51 = 2114;
              v52 = v9;
              _os_log_error_impl(&dword_1B8C64000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Could not process wallpaper for location '%{public}@' and appearance '%{public}@'.", buf, 0x20u);

              v15 = v34;
            }
            break;
        }

      }
      v39 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v39);
  }

}

uint64_t __57__WKWallpaperBundle__processAssetDictionary_forLocation___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
}

+ (BOOL)shouldLoadWallpaperBundleAtURL:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  NSObject *v16;
  __CFString *v17;
  __CFString *v18;
  NSObject *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  __CFString *v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _BOOL4 v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  id v51;
  unsigned __int8 v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  NSObject *v58;
  __int16 v59;
  const __CFString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString pathExtension](v3, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("wallpaper"));

  if ((v7 & 1) != 0)
  {
    v52 = 0;
    -[__CFString path](v3, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v8, &v52);
    v10 = v52;

    if (!v9 || !v10)
    {
      WKLogForCategory(3uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:].cold.3();
      LOBYTE(v20) = 0;
      goto LABEL_28;
    }
    -[__CFString URLByAppendingPathComponent:](v3, "URLByAppendingPathComponent:", CFSTR("Wallpaper.plist"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[__CFString path](v3, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "fileExistsAtPath:", v12);

    if ((v13 & 1) == 0)
    {
      WKLogForCategory(3uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:].cold.2();
      LOBYTE(v20) = 0;
      goto LABEL_27;
    }
    -[NSObject path](v11, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsString:", CPSharedResourcesDirectory());

    if (v15)
    {
      WKLogForCategory(3uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (__CFString *)CPSharedResourcesDirectory();
        *(_DWORD *)buf = 136315394;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        v55 = 2114;
        v56 = v17;
        v18 = v17;
LABEL_20:
        _os_log_impl(&dword_1B8C64000, v16, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper is in '%{public}@', should load.", buf, 0x16u);

        goto LABEL_21;
      }
      goto LABEL_21;
    }
    -[NSObject path](v11, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "containsString:", v22);

    if (v23)
    {
      WKLogForCategory(3uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        NSTemporaryDirectory();
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        v55 = 2114;
        v56 = v18;
        goto LABEL_20;
      }
LABEL_21:
      LOBYTE(v20) = 1;
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
    v51 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v11, &v51);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v51;
    if (v16)
    {
      WKLogForCategory(3uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        +[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:].cold.1();
LABEL_25:
      LOBYTE(v20) = 0;
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "wk_wallpaperKitUserDefaults");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "wk_ignoreLogicalScreenClassForWallpaperBundle");

    if ((v28 & 1) == 0)
    {
      objc_opt_class();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("logicalScreenClass"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v29;
      else
        v30 = 0;
      v25 = v30;

      WKLogForCategory(3uLL);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if (!v25)
      {
        if (v32)
        {
          *(_DWORD *)buf = 136315650;
          v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
          v55 = 2114;
          v56 = CFSTR("logicalScreenClass");
          v57 = 2114;
          v58 = v11;
          _os_log_impl(&dword_1B8C64000, v31, OS_LOG_TYPE_DEFAULT, "%s: No entry found for '%{public}@' key in 'Wallpaper.plist' at URL '%{public}@'.", buf, 0x20u);
        }
        LOBYTE(v20) = 0;
        v25 = v31;
        goto LABEL_26;
      }
      if (v32)
      {
        -[__CFString path](v3, "path");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        v55 = 2114;
        v56 = v33;
        v57 = 2114;
        v58 = v25;
        _os_log_impl(&dword_1B8C64000, v31, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper '%{public}@' logical screen class is '%{public}@'.", buf, 0x20u);

      }
      WKLogicalScreenClassString();
      v34 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isEqualToString:](v34, "isEqualToString:", v25) & 1) == 0
        && (-[NSObject isEqualToString:](v25, "isEqualToString:", CFSTR("any")) & 1) == 0)
      {
        WKLogForCategory(3uLL);
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
          v55 = 2114;
          v56 = (const __CFString *)v25;
          v57 = 2114;
          v58 = v34;
          v59 = 2114;
          v60 = CFSTR("any");
          _os_log_impl(&dword_1B8C64000, v49, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper Bundle logical screen class '%{public}@' does not match the current device logical screen class '%{public}@' or '%{public}@'.", buf, 0x2Au);
        }

        goto LABEL_25;
      }

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "wk_wallpaperKitUserDefaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "wk_ignoreProductTypesForWallpaperBundle");

    if (v36)
    {
      WKLogForCategory(3uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        _os_log_impl(&dword_1B8C64000, v25, OS_LOG_TYPE_DEFAULT, "%s: Device is configured to load wallpapers for all product types.", buf, 0xCu);
      }
      LOBYTE(v20) = 1;
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sf_productType");
    v25 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("unsupportedProductTypes"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v38;
    else
      v39 = 0;
    v40 = v39;

    if (-[NSObject count](v40, "count"))
    {
      WKLogForCategory(3uLL);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        v55 = 2114;
        v56 = CFSTR("unsupportedProductTypes");
        v57 = 2114;
        v58 = v40;
        v59 = 2114;
        v60 = (const __CFString *)v25;
        _os_log_impl(&dword_1B8C64000, v41, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper bundle has '%{public}@' entry with values '%{public}@', checking if it contains '%{public}@'.", buf, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v40);
      v42 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject containsObject:](v42, "containsObject:", v25))
      {
        WKLogForCategory(3uLL);
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
          v55 = 2114;
          v56 = (const __CFString *)v25;
          _os_log_impl(&dword_1B8C64000, v43, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper bundle is not supported for product type %{public}@.", buf, 0x16u);
        }
        LOBYTE(v20) = 0;
LABEL_72:

        goto LABEL_26;
      }

    }
    v50 = v40;
    objc_opt_class();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("productTypes"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v45 = v44;
    else
      v45 = 0;
    v42 = v45;

    v46 = -[NSObject count](v42, "count");
    WKLogForCategory(3uLL);
    v43 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    if (v46)
    {
      if (v47)
      {
        *(_DWORD *)buf = 136315906;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        v55 = 2114;
        v56 = CFSTR("productTypes");
        v57 = 2114;
        v58 = v42;
        v59 = 2114;
        v60 = (const __CFString *)v25;
        _os_log_impl(&dword_1B8C64000, v43, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper bundle has '%{public}@' entry with values '%{public}@', checking if it contains '%{public}@'.", buf, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v42);
      v43 = objc_claimAutoreleasedReturnValue();
      v20 = -[NSObject containsObject:](v43, "containsObject:", v25);
      if (v20)
      {
        WKLogForCategory(3uLL);
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
          v55 = 2114;
          v56 = (const __CFString *)v25;
          _os_log_impl(&dword_1B8C64000, v48, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper bundle is supported for product type %{public}@.", buf, 0x16u);
        }

      }
    }
    else
    {
      if (v47)
      {
        *(_DWORD *)buf = 136315394;
        v54 = "+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:]";
        v55 = 2114;
        v56 = v3;
        _os_log_impl(&dword_1B8C64000, v43, OS_LOG_TYPE_DEFAULT, "%s: Wallpaper bundle at URL '%{public}@' should be loaded", buf, 0x16u);
      }
      LOBYTE(v20) = 1;
    }
    v40 = v50;
    goto LABEL_72;
  }
  WKLogForCategory(3uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    +[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:].cold.4();

  LOBYTE(v20) = 0;
LABEL_29:

  return v20;
}

- (UIImage)thumbnailImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[WKWallpaperBundle _thumbnailImage](self, "_thumbnailImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WKWallpaperBundle thumbnailImageURL](self, "thumbnailImageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0DC3870];
      -[WKWallpaperBundle thumbnailImageURL](self, "thumbnailImageURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageWithContentsOfFile:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKWallpaperBundle set_thumbnailImage:](self, "set_thumbnailImage:", v8);
    }
    else
    {
      -[WKWallpaperBundle thumbnailRepresentableForLocation:andAppearance:](self, "thumbnailRepresentableForLocation:andAppearance:", CFSTR("WKWallpaperLocationCoverSheet"), CFSTR("default"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKWallpaperBundle thumbnailRepresentableForLocation:andAppearance:](self, "thumbnailRepresentableForLocation:andAppearance:", CFSTR("WKWallpaperLocationCoverSheet"), CFSTR("dark"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v6, "thumbnailImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "thumbnailImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "wk_splitThumbnailWithLightAppearanceImage:darkAppearanceImage:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKWallpaperBundle set_thumbnailImage:](self, "set_thumbnailImage:", v11);

    }
  }
  return -[WKWallpaperBundle _thumbnailImage](self, "_thumbnailImage");
}

- (unint64_t)wallpaperBackingTypeForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[WKWallpaperBundle _wallpaperAssetLookup](self, "_wallpaperAssetLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("default"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "backingType");
  return v8;
}

- (id)thumbnailRepresentableForLocation:(id)a3
{
  return -[WKWallpaperBundle thumbnailRepresentableForLocation:andAppearance:](self, "thumbnailRepresentableForLocation:andAppearance:", a3, CFSTR("default"));
}

- (id)thumbnailRepresentableForLocation:(id)a3 andAppearance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[WKWallpaperBundle _wallpaperAssetLookup](self, "_wallpaperAssetLookup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF1D8AE0))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)fileBasedWallpaperForLocation:(id)a3
{
  return -[WKWallpaperBundle fileBasedWallpaperForLocation:andAppearance:](self, "fileBasedWallpaperForLocation:andAppearance:", a3, CFSTR("default"));
}

- (id)fileBasedWallpaperForLocation:(id)a3 andAppearance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[WKWallpaperBundle _wallpaperAssetLookup](self, "_wallpaperAssetLookup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF1D9840))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)valueBasedWallpaperForLocation:(id)a3
{
  return -[WKWallpaperBundle valueBasedWallpaperForLocation:andAppearance:](self, "valueBasedWallpaperForLocation:andAppearance:", a3, CFSTR("default"));
}

- (id)valueBasedWallpaperForLocation:(id)a3 andAppearance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[WKWallpaperBundle _wallpaperAssetLookup](self, "_wallpaperAssetLookup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF1D9618))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (NSString)identifierString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WKWallpaperBundle identifier](self, "identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)supportsCopying
{
  return !-[WKWallpaperBundle isOffloaded](self, "isOffloaded");
}

- (id)copyWallpaperRepresentingToDestinationDirectoryURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  __CFString *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[WKWallpaperBundle supportsCopying](self, "supportsCopying"))
  {
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v11, v9, a4);

    if (!v12)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CB2AD8];
    v35 = *MEMORY[0x1E0CB2AD8];
    v15 = *MEMORY[0x1E0CB2AE0];
    v36 = *MEMORY[0x1E0CB2AE0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "setAttributes:ofItemAtPath:error:", v16, v17, a4);

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, 0, 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v31;
        while (2)
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v31 != v24)
              objc_enumerationMutation(v21);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v25), "setResourceValue:forKey:error:", v15, v14, a4, (_QWORD)v30))
            {

              v26 = 0;
              goto LABEL_16;
            }
            ++v25;
          }
          while (v23 != v25);
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v23)
            continue;
          break;
        }
      }

      v26 = v9;
LABEL_16:

    }
    else
    {
LABEL_14:
      v26 = 0;
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = WKWallpaperKitErrorDomain;
    v37 = *MEMORY[0x1E0CB2D60];
    v38[0] = CFSTR("Unsupported copy action for wallpaper (supportsCopying == NO).");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, -10003, v8);
    v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

- (void)_raiseInvalidMetadataExceptionForMetadataKeypath:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKWallpaperBundle bundleURL](self, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: (path: '%@') metadata does not contain valid value for keypath: '%@'"), v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "raise");
}

- (id)_processCommonWallpaperMetadataWithDictionary:(id)a3 wallpaperAppearance:(id)a4
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  if (!v10)
  {
    v46[0] = CFSTR("assets");
    v46[1] = v7;
    v46[2] = CFSTR("identifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v12);

  }
  v41 = v10;
  v40 = objc_msgSend(v10, "integerValue");
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  if (!v15)
  {
    v45[0] = CFSTR("assets");
    v45[1] = v7;
    v45[2] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v17);

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("thumbnailImageFileName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;
  }
  else
  {
    v20 = 0;
  }

  if (!v20)
  {
    v44[0] = CFSTR("assets");
    v44[1] = v7;
    v44[2] = CFSTR("thumbnailImageFileName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR("."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v22);

  }
  v23 = v7;
  -[WKWallpaperBundle bundleURL](self, "bundleURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "URLByAppendingPathComponent:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "path");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "fileExistsAtPath:", v27);

  if ((v28 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v31 = (void *)MEMORY[0x1E0CB3940];
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%@: Thumbnail image does not exist at path '%@'"), v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "exceptionWithName:reason:userInfo:", v30, v35, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "raise");
  }
  v42[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v37;
  v43[1] = v15;
  v42[1] = CFSTR("name");
  v42[2] = CFSTR("thumbnailImageFileURL");
  v43[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)_processCommonFileBackedWallpaperMetadataWithDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[WKWallpaperBundle _processCommonWallpaperMetadataWithDictionary:wallpaperAppearance:](self, "_processCommonWallpaperMetadataWithDictionary:wallpaperAppearance:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fullSizeImageFileName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  if (!v13)
  {
    v30[0] = CFSTR("assets");
    v30[1] = v6;
    v30[2] = CFSTR("fullSizeImageFileName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v15);

  }
  -[WKWallpaperBundle bundleURL](self, "bundleURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "fileExistsAtPath:", v19);

  if ((v20 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = (void *)MEMORY[0x1E0CB3940];
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: Full size image does not exist at path '%@'"), v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "raise");
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("fullSizeImageFileURL"));

  return v9;
}

- (id)_thumbnailWallpaperWithMetadataDictionary:(id)a3 representedType:(unint64_t)a4 wallpaperAppearance:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  WKThumbnailWallpaper *v16;

  -[WKWallpaperBundle _processCommonWallpaperMetadataWithDictionary:wallpaperAppearance:](self, "_processCommonWallpaperMetadataWithDictionary:wallpaperAppearance:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("thumbnailImageFileURL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  v16 = -[WKThumbnailWallpaper initWithIdentifier:name:type:representedType:backingType:thumbnailImageURL:]([WKThumbnailWallpaper alloc], "initWithIdentifier:name:type:representedType:backingType:thumbnailImageURL:", objc_msgSend(v9, "unsignedIntegerValue"), v12, 2, a4, 0, v15);
  return v16;
}

- (id)_stillWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  WKStillWallpaper *v17;

  -[WKWallpaperBundle _processCommonFileBackedWallpaperMetadataWithDictionary:wallpaperAppearance:](self, "_processCommonFileBackedWallpaperMetadataWithDictionary:wallpaperAppearance:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullSizeImageFileURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnailImageFileURL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }

  v17 = -[WKStillWallpaper initWithIdentifier:name:type:thumbnailImageURL:fullsizeImageURL:]([WKStillWallpaper alloc], "initWithIdentifier:name:type:thumbnailImageURL:fullsizeImageURL:", objc_msgSend(v7, "unsignedIntegerValue"), v10, 0, v16, v13);
  return v17;
}

- (id)_liveWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  WKWallpaperBundle *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char isKindOfClass;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  WKLiveWallpaper *v46;
  uint64_t v47;
  double v48;
  double v49;
  WKLiveWallpaper *v50;
  void *v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[3];
  _QWORD v57[4];

  v57[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v55 = a4;
  -[WKWallpaperBundle _processCommonFileBackedWallpaperMetadataWithDictionary:wallpaperAppearance:](self, "_processCommonFileBackedWallpaperMetadataWithDictionary:wallpaperAppearance:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v54 = v9;
  }
  else
  {
    v54 = 0;
  }

  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v53 = v11;
  }
  else
  {
    v53 = 0;
  }

  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fullSizeImageFileURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("thumbnailImageFileURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("videoFileName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  if (!v20)
  {
    v57[0] = CFSTR("assets");
    v57[1] = v55;
    v57[2] = CFSTR("videoFileName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR("."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v22);

  }
  -[WKWallpaperBundle bundleURL](self, "bundleURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URLByAppendingPathComponent:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "path");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "fileExistsAtPath:", v26);

  if ((v27 & 1) == 0)
  {
    v52 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v29 = (void *)MEMORY[0x1E0CB3940];
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v32 = v7;
    v33 = v6;
    v34 = self;
    v35 = v17;
    v36 = v14;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: Video asset does not exist at path '%@'"), v31, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "exceptionWithName:reason:userInfo:", v28, v38, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v36;
    v17 = v35;
    self = v34;
    v6 = v33;
    v7 = v32;

    objc_msgSend(v39, "raise");
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stillTimeInVideo"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v42 = v40;
    if ((isKindOfClass & 1) == 0)
    {
      v56[0] = CFSTR("assets");
      v56[1] = v55;
      v56[2] = CFSTR("stillTimeInVideo");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("."));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v44);

      v42 = v40;
    }
  }
  else
  {
    v42 = &unk_1E6F0DB48;
  }
  v45 = v42;

  v46 = [WKLiveWallpaper alloc];
  v47 = objc_msgSend(v54, "unsignedIntegerValue");
  objc_msgSend(v45, "doubleValue");
  v49 = v48;

  v50 = -[WKLiveWallpaper initWithIdentifier:name:type:thumbnailImageURL:fullsizeImageURL:videoAssetURL:stillTimeInVideo:](v46, "initWithIdentifier:name:type:thumbnailImageURL:fullsizeImageURL:videoAssetURL:stillTimeInVideo:", v47, v53, 1, v17, v14, v24, v49);
  return v50;
}

- (id)_layeredThumbnailWallpaperWithMetadataDictionary:(id)a3 representedType:(unint64_t)a4 wallpaperAppearance:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  uint64_t v46;
  void *v47;
  objc_class *v48;
  void *v49;
  unint64_t v50;
  WKWallpaperBundle *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  uint64_t v65;
  void *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  WKLayeredThumbnailWallpaper *v72;
  id v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  _QWORD v82[3];
  _QWORD v83[4];

  v83[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  if (!v11)
  {
    v83[0] = CFSTR("assets");
    v83[1] = v8;
    v83[2] = CFSTR("identifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v13);

  }
  v80 = objc_msgSend(v11, "integerValue");
  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }

  if (!v16)
  {
    v82[0] = CFSTR("assets");
    v82[1] = v8;
    v82[2] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR("."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v18);

  }
  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("backgroundThumbnailImageFileName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;
  }
  else
  {
    v21 = 0;
  }

  v22 = 0x1E0CB3000uLL;
  v78 = v21;
  v79 = v16;
  if (v21)
  {
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLByAppendingPathComponent:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "fileExistsAtPath:", v26);

    if ((v27 & 1) == 0)
    {
      v28 = (void *)MEMORY[0x1E0C99DA0];
      v29 = *MEMORY[0x1E0C99778];
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "path");
      v33 = v24;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: Background thumbnail asset does not exist at path '%@'"), v32, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v35, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v33;
      v22 = 0x1E0CB3000;

      objc_msgSend(v36, "raise");
    }
  }
  else
  {
    v24 = 0;
  }
  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("foregroundThumbnailImageFileName"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v38 = v37;
    else
      v38 = 0;
    v39 = v38;
  }
  else
  {
    v39 = 0;
  }

  v76 = v7;
  v77 = v24;
  v75 = v8;
  if (v39)
  {
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "URLByAppendingPathComponent:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v22 + 1568), "defaultManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "path");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "fileExistsAtPath:", v43);

    if ((v44 & 1) == 0)
    {
      v45 = (void *)MEMORY[0x1E0C99DA0];
      v46 = *MEMORY[0x1E0C99778];
      v47 = (void *)MEMORY[0x1E0CB3940];
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "path");
      v50 = v22;
      v51 = self;
      v52 = v11;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("%@: Foreground thumbnail asset does not exist at path '%@'"), v49, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "exceptionWithName:reason:userInfo:", v46, v54, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v52;
      self = v51;
      v22 = v50;

      v8 = v75;
      v7 = v76;
      objc_msgSend(v55, "raise");

    }
  }
  else
  {
    v41 = 0;
  }
  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("floatingThumbnailImageFileName"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v57 = v56;
    else
      v57 = 0;
    v58 = v57;
  }
  else
  {
    v58 = 0;
  }

  if (v58)
  {
    v74 = v11;
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "URLByAppendingPathComponent:", v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v22 + 1568), "defaultManager");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "path");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "fileExistsAtPath:", v62);

    if ((v63 & 1) == 0)
    {
      v64 = (void *)MEMORY[0x1E0C99DA0];
      v65 = *MEMORY[0x1E0C99778];
      v66 = (void *)MEMORY[0x1E0CB3940];
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "path");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringWithFormat:", CFSTR("%@: Floating thumbnail asset does not exist at path '%@'"), v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "exceptionWithName:reason:userInfo:", v65, v70, 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v71, "raise");
    }
    v8 = v75;
    v7 = v76;
    v11 = v74;
  }
  else
  {
    v60 = 0;
  }
  v72 = -[WKLayeredThumbnailWallpaper initWithIdentifier:name:type:representedType:backgroundThumbnailImageURL:foregroundThumbnailImageURL:floatingThumbnailImageURL:]([WKLayeredThumbnailWallpaper alloc], "initWithIdentifier:name:type:representedType:backgroundThumbnailImageURL:foregroundThumbnailImageURL:floatingThumbnailImageURL:", v80, v79, 3, a4, v77, v41, v60);

  return v72;
}

- (id)_layeredStillWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  uint64_t v47;
  void *v48;
  objc_class *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  uint64_t v65;
  void *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  char v79;
  void *v80;
  uint64_t v81;
  void *v82;
  objc_class *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  uint64_t v100;
  void *v101;
  objc_class *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  char v115;
  void *v116;
  uint64_t v117;
  void *v118;
  objc_class *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  WKLayeredStillWallpaper *v124;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  WKWallpaperBundle *v137;
  void *v138;
  _QWORD v139[3];
  _QWORD v140[5];

  v140[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  if (!v10)
  {
    v140[0] = CFSTR("assets");
    v140[1] = v7;
    v140[2] = CFSTR("identifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v12);

  }
  v135 = v10;
  v133 = objc_msgSend(v10, "integerValue");
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  if (!v15)
  {
    v139[0] = CFSTR("assets");
    v139[1] = v7;
    v139[2] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v17);

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backgroundThumbnailImageFileName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;
  }
  else
  {
    v20 = 0;
  }

  v21 = 0x1E0CB3000uLL;
  v132 = v20;
  if (v20)
  {
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLByAppendingPathComponent:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "fileExistsAtPath:", v25);

    if ((v26 & 1) == 0)
    {
      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = *MEMORY[0x1E0C99778];
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = v15;
      v32 = v7;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "path");
      v34 = v23;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%@: Background thumbnail asset does not exist at path '%@'"), v33, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "exceptionWithName:reason:userInfo:", v28, v36, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v34;
      v21 = 0x1E0CB3000;

      v7 = v32;
      v15 = v31;
      objc_msgSend(v37, "raise");

    }
  }
  else
  {
    v23 = 0;
  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("foregroundThumbnailImageFileName"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v38;
    else
      v39 = 0;
    v40 = v39;
  }
  else
  {
    v40 = 0;
  }

  v130 = v40;
  v131 = v23;
  v137 = self;
  if (v40)
  {
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "URLByAppendingPathComponent:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v21 + 1568), "defaultManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "path");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "fileExistsAtPath:", v44);

    if ((v45 & 1) == 0)
    {
      v46 = (void *)MEMORY[0x1E0C99DA0];
      v47 = *MEMORY[0x1E0C99778];
      v48 = (void *)MEMORY[0x1E0CB3940];
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = v15;
      v51 = v7;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "path");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", CFSTR("%@: Foreground thumbnail asset does not exist at path '%@'"), v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "exceptionWithName:reason:userInfo:", v47, v54, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v51;
      v15 = v50;
      self = v137;
      objc_msgSend(v55, "raise");

    }
  }
  else
  {
    v42 = 0;
  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("floatingThumbnailImageFileName"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v57 = v56;
    else
      v57 = 0;
    v58 = v57;
  }
  else
  {
    v58 = 0;
  }
  v129 = v42;

  v136 = v7;
  v134 = v15;
  v128 = v58;
  if (v58)
  {
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "URLByAppendingPathComponent:", v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v21 + 1568), "defaultManager");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "path");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "fileExistsAtPath:", v62);

    if ((v63 & 1) == 0)
    {
      v64 = (void *)MEMORY[0x1E0C99DA0];
      v65 = *MEMORY[0x1E0C99778];
      v66 = (void *)MEMORY[0x1E0CB3940];
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "path");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringWithFormat:", CFSTR("%@: Floating thumbnail asset does not exist at path '%@'"), v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "exceptionWithName:reason:userInfo:", v65, v70, 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0x1E0CB3000;
      objc_msgSend(v71, "raise");

    }
  }
  else
  {
    v60 = 0;
  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backgroundFullSizeImageFileName"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v73 = v72;
    else
      v73 = 0;
    v74 = v73;
  }
  else
  {
    v74 = 0;
  }

  if (v74)
  {
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "URLByAppendingPathComponent:", v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v21 + 1568), "defaultManager");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "path");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v77, "fileExistsAtPath:", v78);

    if ((v79 & 1) == 0)
    {
      v80 = (void *)MEMORY[0x1E0C99DA0];
      v81 = *MEMORY[0x1E0C99778];
      v82 = (void *)MEMORY[0x1E0CB3940];
      v83 = (objc_class *)objc_opt_class();
      NSStringFromClass(v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "path");
      v85 = v60;
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "stringWithFormat:", CFSTR("%@: Background full size asset does not exist at path '%@'"), v84, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "exceptionWithName:reason:userInfo:", v81, v87, 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      v60 = v85;
      self = v137;
      objc_msgSend(v88, "raise");

    }
  }
  else
  {
    v76 = 0;
  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("foregroundFullSizeImageFileName"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v90 = v89;
    else
      v90 = 0;
    v91 = v90;
  }
  else
  {
    v91 = 0;
  }

  v138 = v6;
  v92 = v76;
  v127 = v91;
  if (v91)
  {
    v93 = v60;
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "URLByAppendingPathComponent:", v91);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "path");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v96, "fileExistsAtPath:", v97);

    if ((v98 & 1) == 0)
    {
      v99 = (void *)MEMORY[0x1E0C99DA0];
      v100 = *MEMORY[0x1E0C99778];
      v101 = (void *)MEMORY[0x1E0CB3940];
      v102 = (objc_class *)objc_opt_class();
      NSStringFromClass(v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "path");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "stringWithFormat:", CFSTR("%@: Foreground full size asset does not exist at path '%@'"), v103, v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "exceptionWithName:reason:userInfo:", v100, v105, 0);
      v106 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v138;
      objc_msgSend(v106, "raise");

    }
    v60 = v93;
  }
  else
  {
    v95 = 0;
  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("floatingFullSizeImageFileName"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v108 = v107;
    else
      v108 = 0;
    v109 = v108;
  }
  else
  {
    v109 = 0;
  }

  if (v109)
  {
    v126 = v74;
    v110 = v60;
    -[WKWallpaperBundle bundleURL](v137, "bundleURL");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "URLByAppendingPathComponent:", v109);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "path");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend(v113, "fileExistsAtPath:", v114);

    if ((v115 & 1) == 0)
    {
      v116 = (void *)MEMORY[0x1E0C99DA0];
      v117 = *MEMORY[0x1E0C99778];
      v118 = (void *)MEMORY[0x1E0CB3940];
      v119 = (objc_class *)objc_opt_class();
      NSStringFromClass(v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "path");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "stringWithFormat:", CFSTR("%@: Floating full size asset does not exist at path '%@'"), v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "exceptionWithName:reason:userInfo:", v117, v122, 0);
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v123, "raise");
    }
    v60 = v110;
    v74 = v126;
  }
  else
  {
    v112 = 0;
  }
  v124 = -[WKLayeredStillWallpaper initWithIdentifier:name:backgroundThumbnailImageURL:foregroundThumbnailImageURL:floatingThumbnailImageURL:backgroundFullSizeImageURL:foregroundFullSizeImageURL:floatingFullSizeImageURL:]([WKLayeredStillWallpaper alloc], "initWithIdentifier:name:backgroundThumbnailImageURL:foregroundThumbnailImageURL:floatingThumbnailImageURL:backgroundFullSizeImageURL:foregroundFullSizeImageURL:floatingFullSizeImageURL:", v133, v134, v131, v129, v60, v92, v95, v112);

  return v124;
}

- (id)_layeredStripeWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  WKLayeredStripeWallpaper *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  WKLayeredStripeWallpaper *v47;
  uint64_t v49;
  void *v50;
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[5];

  v55[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  if (!v10)
  {
    v55[0] = CFSTR("assets");
    v55[1] = v7;
    v55[2] = CFSTR("identifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v12);

  }
  v49 = objc_msgSend(v10, "integerValue");
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  if (!v15)
  {
    v54[0] = CFSTR("assets");
    v54[1] = v7;
    v54[2] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v17);

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;
  }
  else
  {
    v20 = 0;
  }
  v50 = v10;

  if (!v20)
  {
    v53[0] = CFSTR("assets");
    v53[1] = v7;
    v53[2] = CFSTR("backgroundColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR("."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v22);

  }
  v23 = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "wk_colorWithHexString:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stripeAngleDegrees"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;
  }
  else
  {
    v27 = 0;
  }

  if (!v27)
  {
    v52[0] = CFSTR("assets");
    v52[1] = v23;
    v52[2] = CFSTR("stripeAngleDegrees");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "componentsJoinedByString:", CFSTR("."));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v29);

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stripeHeightFactor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;
    v32 = v31;
  }
  else
  {
    v32 = 0;
  }

  if (!v32)
  {
    v51[0] = CFSTR("assets");
    v51[1] = v23;
    v51[2] = CFSTR("stripeHeightFactor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "componentsJoinedByString:", CFSTR("."));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v34);

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstStripeVerticalOffsetScaleFactor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v35;
    else
      v36 = 0;
    v37 = v36;
  }
  else
  {
    v37 = 0;
  }

  if (v37)
  {
    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstStripeVerticalOffsetScaleFactor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v39 = v38;
      else
        v39 = 0;
      v40 = v39;
    }
    else
    {
      v40 = 0;
    }

  }
  else
  {
    v40 = &unk_1E6F0DB60;
  }
  v41 = [WKLayeredStripeWallpaper alloc];
  objc_msgSend(v27, "doubleValue");
  v43 = v42;
  objc_msgSend(v32, "doubleValue");
  v45 = v44;
  objc_msgSend(v40, "doubleValue");
  v47 = -[WKLayeredStripeWallpaper initWithIdentifier:name:backgroundColor:stripeAngleDegrees:stripeHeightFactor:firstStripeOffsetScaleFactor:](v41, "initWithIdentifier:name:backgroundColor:stripeAngleDegrees:stripeHeightFactor:firstStripeOffsetScaleFactor:", v49, v15, v24, v43, v45, v46);

  return v47;
}

- (id)_bokehWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  WKWallpaperBundle *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  WKBokehWallpaper *v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  WKBokehWallpaper *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[5];

  v71[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  if (!v10)
  {
    v71[0] = CFSTR("assets");
    v71[1] = v7;
    v71[2] = CFSTR("identifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v12);

  }
  v63 = v10;
  v61 = objc_msgSend(v10, "integerValue");
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  v62 = v15;
  if (!v15)
  {
    v70[0] = CFSTR("assets");
    v70[1] = v7;
    v70[2] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v17);

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backgroundColors"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;
  }
  else
  {
    v20 = 0;
  }

  if (!v20)
  {
    v69[0] = CFSTR("assets");
    v69[1] = v7;
    v69[2] = CFSTR("backgroundColors");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR("."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v22);

  }
  v60 = v20;
  objc_msgSend(v20, "na_map:", &__block_literal_global_199);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bubbleColors"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
    v25 = v24;
  }
  else
  {
    v25 = 0;
  }

  if (!v25)
  {
    v68[0] = CFSTR("assets");
    v68[1] = v7;
    v68[2] = CFSTR("bubbleColors");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsJoinedByString:", CFSTR("."));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v27);

  }
  v57 = v25;
  objc_msgSend(v25, "na_map:", &__block_literal_global_200);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bubbleCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v30 = v29;
  }
  else
  {
    v30 = 0;
  }

  if (!v30)
  {
    v67[0] = CFSTR("assets");
    v67[1] = v7;
    v67[2] = CFSTR("bubbleCount");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "componentsJoinedByString:", CFSTR("."));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v32);

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bubbleScale"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
    v35 = v34;
  }
  else
  {
    v35 = 0;
  }

  if (!v35)
  {
    v66[0] = CFSTR("assets");
    v66[1] = v7;
    v66[2] = CFSTR("bubbleScale");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "componentsJoinedByString:", CFSTR("."));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v37);

  }
  v38 = self;
  v39 = v7;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("parallaxMultiplier"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v41 = v40;
    else
      v41 = 0;
    v42 = v41;
  }
  else
  {
    v42 = 0;
  }

  if (!v42)
  {
    v65[0] = CFSTR("assets");
    v65[1] = v7;
    v65[2] = CFSTR("parallaxMultiplier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "componentsJoinedByString:", CFSTR("."));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](v38, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v44);

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("thumbnailSeed"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v46 = v45;
    else
      v46 = 0;
    v47 = v46;
  }
  else
  {
    v47 = 0;
  }

  if (!v47)
  {
    v64[0] = CFSTR("assets");
    v64[1] = v39;
    v64[2] = CFSTR("thumbnailSeed");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "componentsJoinedByString:", CFSTR("."));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](v38, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v49);

  }
  v50 = [WKBokehWallpaper alloc];
  v51 = objc_msgSend(v30, "integerValue");
  objc_msgSend(v35, "doubleValue");
  v53 = v52;
  objc_msgSend(v42, "doubleValue");
  v55 = -[WKBokehWallpaper initWithIdentifier:name:backgroundColors:bubbleColors:bubbleCount:bubbleScale:parallaxMultiplier:thumbnailSeed:](v50, "initWithIdentifier:name:backgroundColors:bubbleColors:bubbleCount:bubbleScale:parallaxMultiplier:thumbnailSeed:", v61, v62, v59, v58, v51, objc_msgSend(v47, "integerValue"), v53, v54);

  return v55;
}

id __79__WKWallpaperBundle__bokehWallpaperWithMetadataDictionary_wallpaperAppearance___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(MEMORY[0x1E0DC3658], "wk_colorWithHexString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __79__WKWallpaperBundle__bokehWallpaperWithMetadataDictionary_wallpaperAppearance___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(MEMORY[0x1E0DC3658], "wk_colorWithHexString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_layeredAnimationWallpaperWithMetadataDictionary:(id)a3 wallpaperAppearance:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  uint64_t v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  uint64_t v58;
  void *v59;
  objc_class *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  WKLayeredAnimationWallpaper *v66;
  void *v68;
  id v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  _QWORD v76[3];
  _QWORD v77[4];

  v77[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v75 = a4;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  if (!v9)
  {
    v77[0] = CFSTR("assets");
    v77[1] = v75;
    v77[2] = CFSTR("identifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v11);

  }
  v72 = objc_msgSend(v9, "integerValue");
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  if (!v14)
  {
    v76[0] = CFSTR("assets");
    v76[1] = v75;
    v76[2] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR("."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWallpaperBundle _raiseInvalidMetadataExceptionForMetadataKeypath:](self, "_raiseInvalidMetadataExceptionForMetadataKeypath:", v16);

  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backgroundAnimationFileName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;
  }
  else
  {
    v19 = 0;
  }

  v73 = v19;
  v74 = v14;
  if (v19)
  {
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLByAppendingPathComponent:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "fileExistsAtPath:", v23);

    if ((v24 & 1) == 0)
    {
      v25 = (void *)MEMORY[0x1E0C99DA0];
      v26 = *MEMORY[0x1E0C99778];
      v27 = (void *)MEMORY[0x1E0CB3940];
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: Background animation asset does not exist at path '%@'"), v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, v31, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "raise");
    }
  }
  else
  {
    v21 = 0;
  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("foregroundAnimationFileName"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
    v35 = v34;
  }
  else
  {
    v35 = 0;
  }

  if (v35)
  {
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "URLByAppendingPathComponent:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "path");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "fileExistsAtPath:", v39);

    if ((v40 & 1) == 0)
    {
      v68 = (void *)MEMORY[0x1E0C99DA0];
      v41 = *MEMORY[0x1E0C99778];
      v42 = (void *)MEMORY[0x1E0CB3940];
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v70 = v21;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "path");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", CFSTR("%@: Foreground animation asset does not exist at path '%@'"), v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "exceptionWithName:reason:userInfo:", v41, v46, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v70;
      objc_msgSend(v47, "raise");

    }
  }
  else
  {
    v37 = 0;
  }
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("floatingAnimationFileNameKey"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v49 = v48;
    else
      v49 = 0;
    v50 = v49;
  }
  else
  {
    v50 = 0;
  }

  if (v50)
  {
    v69 = v35;
    v71 = v6;
    v51 = v21;
    -[WKWallpaperBundle bundleURL](self, "bundleURL");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "URLByAppendingPathComponent:", v50);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "path");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "fileExistsAtPath:", v55);

    if ((v56 & 1) == 0)
    {
      v57 = (void *)MEMORY[0x1E0C99DA0];
      v58 = *MEMORY[0x1E0C99778];
      v59 = (void *)MEMORY[0x1E0CB3940];
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "path");
      v62 = v9;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stringWithFormat:", CFSTR("%@: Floating animation asset does not exist at path '%@'"), v61, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "exceptionWithName:reason:userInfo:", v58, v64, 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v62;
      objc_msgSend(v65, "raise");

    }
    v21 = v51;
    v35 = v69;
    v6 = v71;
  }
  else
  {
    v53 = 0;
  }
  v66 = -[WKLayeredAnimationWallpaper initWithIdentifier:name:backgroundAnimationFileURL:foregroundAnimationFileURL:floatingAnimationFileURL:]([WKLayeredAnimationWallpaper alloc], "initWithIdentifier:name:backgroundAnimationFileURL:foregroundAnimationFileURL:floatingAnimationFileURL:", v72, v74, v21, v37, v53);

  return v66;
}

id __32__WKWallpaperBundle_na_identity__block_invoke()
{
  if (WKWallpaperMetadataOptionPreferredProminentColorKey_block_invoke_na_once_token_21 != -1)
    dispatch_once(&WKWallpaperMetadataOptionPreferredProminentColorKey_block_invoke_na_once_token_21, &__block_literal_global_212);
  return (id)WKWallpaperMetadataOptionPreferredProminentColorKey_block_invoke_na_once_object_21;
}

void __32__WKWallpaperBundle_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __32__WKWallpaperBundle_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WKWallpaperMetadataOptionPreferredProminentColorKey_block_invoke_na_once_object_21;
  WKWallpaperMetadataOptionPreferredProminentColorKey_block_invoke_na_once_object_21 = v0;

}

id __32__WKWallpaperBundle_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendIntegerCharacteristic:", &__block_literal_global_217);
  v2 = (id)objc_msgSend(v0, "appendIntegerCharacteristic:", &__block_literal_global_218);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_220);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_221);
  v5 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_222);
  v6 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_223);
  v7 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_224);
  v8 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_225);
  v9 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_226);
  v10 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_227);
  v11 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_228);
  v12 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_229);
  v13 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_230);
  objc_msgSend(v0, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "version");
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "family");
}

id __32__WKWallpaperBundle_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "_wallpaperAssetLookup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleURL");
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "thumbnailImageURL");
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isAppearanceAware"));
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "hasDistinctWallpapersForLocations"));
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "disableParallax"));
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isOffloaded"));
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "disableModifyingLegibilityBlur"));
}

uint64_t __32__WKWallpaperBundle_na_identity__block_invoke_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustmentTraits");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

+ (id)_createWallpaperBundleInDirectory:(id)a3 version:(int64_t)a4 identifier:(int64_t)a5 name:(id)a6 family:(id)a7 disableParallax:(BOOL)a8 isOffloaded:(BOOL)a9 logicalScreenClass:(id)a10 thumbnailImageURL:(id)a11 adjustmentTraits:(id)a12 preferredProminentColors:(id)a13 assetMapping:(id)a14
{
  id v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  WKWallpaperBundle *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t j;
  void *v59;
  void *v60;
  NSObject *v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  void *v67;
  void (**v68)(void);
  _BOOL4 v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  id v91;
  id v92;
  _QWORD aBlock[5];
  char v94;
  id v95;
  _BYTE v96[128];
  _BYTE v97[128];
  char v98[32];
  uint64_t v99;

  v69 = a8;
  v99 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v75 = a6;
  v76 = a7;
  v74 = a10;
  v80 = a11;
  v73 = a12;
  v77 = a13;
  v18 = a14;
  if ((objc_msgSend(v18, "na_allSatisfy:", &__block_literal_global_232) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v72 = objc_claimAutoreleasedReturnValue();
    -[NSObject UUIDString](v72, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingPathExtension:", CFSTR("wallpaper"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v78, "URLByAppendingPathComponent:isDirectory:", v71, 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0;
    v21 = objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v79, 1, 0, &v95);
    v22 = v95;

    if ((v21 & 1) == 0)
    {
      WKLogForCategory(3uLL);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:].cold.5();

      v36 = 0;
      goto LABEL_54;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __206__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_assetMapping___block_invoke_236;
    aBlock[3] = &unk_1E6EF9408;
    v94 = 0;
    aBlock[4] = v79;
    v68 = (void (**)(void))_Block_copy(aBlock);
    if (v80)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "URLByAppendingPathComponent:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v22;
      v26 = objc_msgSend(v23, "copyItemAtURL:toURL:error:", v80, v25, &v92);
      v27 = v92;

      if ((v26 & 1) == 0)
      {
        WKLogForCategory(3uLL);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:].cold.4();
        v36 = 0;
        goto LABEL_53;
      }
      v22 = v27;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v29, CFSTR("version"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v30, CFSTR("identifier"));

    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v75, CFSTR("name"));
    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v76, CFSTR("family"));
    v31 = objc_msgSend(v18, "count");
    if (v31 < 2)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("WKWallpaperLocationLockAndHomeScreen"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("WKWallpaperLocationLockAndHomeScreen"));
      else
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("WKWallpaperLocationCoverSheet"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKey:", CFSTR("dark"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("WKWallpaperLocationCoverSheet"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKey:", CFSTR("dark"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v39 = v33;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39 != 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v40, CFSTR("appearanceAware"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v69);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v41, CFSTR("disableParallax"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a9);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v42, CFSTR("offloaded"));

    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v74, CFSTR("logicalScreenClass"));
    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v77, CFSTR("preferredProminentColor"));
    objc_msgSend(v80, "lastPathComponent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v43, CFSTR("thumbnailImageFileName"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 < 2)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("WKWallpaperLocationLockAndHomeScreen"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v46)
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("WKWallpaperLocationCoverSheet"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v46, "na_dictionaryByMappingValues:", &__block_literal_global_242);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v47, CFSTR("lockAndHome"));
    }
    else
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("WKWallpaperLocationCoverSheet"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "na_dictionaryByMappingValues:", &__block_literal_global_239);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v45, CFSTR("lock"));

      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("WKWallpaperLocationHomeScreen"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "na_dictionaryByMappingValues:", &__block_literal_global_241);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v47, CFSTR("home"));
    }

    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v70, CFSTR("assets"));
    objc_msgSend(v73, "propertyListRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject na_safeSetObject:forKey:](v28, "na_safeSetObject:forKey:", v48, CFSTR("adjustments"));

    objc_msgSend(v79, "URLByAppendingPathComponent:", CFSTR("Wallpaper.plist"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v28, 100, 0, &v91);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v91;

    if (v27)
    {
      WKLogForCategory(3uLL);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:].cold.3();
    }
    else
    {
      v90 = 0;
      v50 = objc_msgSend(v66, "writeToURL:options:error:", v67, 1, &v90);
      v27 = v90;
      if ((v50 & 1) != 0)
      {
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v49 = v18;
        v51 = -[NSObject countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
        if (v51)
        {
          v52 = *(_QWORD *)v87;
          v63 = *(_QWORD *)v87;
          v64 = v51;
          do
          {
            for (i = 0; i != v64; ++i)
            {
              if (*(_QWORD *)v87 != v52)
                objc_enumerationMutation(v49);
              -[NSObject objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i), v63);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = 0u;
              v85 = 0u;
              v82 = 0u;
              v83 = 0u;
              v54 = v53;
              v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
              if (v55)
              {
                v56 = *(_QWORD *)v83;
                v57 = v27;
                while (2)
                {
                  for (j = 0; j != v55; ++j)
                  {
                    if (*(_QWORD *)v83 != v56)
                      objc_enumerationMutation(v54);
                    objc_msgSend(v54, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j));
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    v81 = v57;
                    objc_msgSend(v59, "copyWallpaperContentsToDestinationDirectoryURL:error:", v79, &v81);
                    v27 = v81;

                    if (v27)
                    {
                      WKLogForCategory(3uLL);
                      v61 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                        +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:].cold.1();

                      goto LABEL_51;
                    }

                    v57 = 0;
                  }
                  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
                  v57 = 0;
                  v27 = 0;
                  if (v55)
                    continue;
                  break;
                }
              }

              v52 = v63;
            }
            v64 = -[NSObject countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
          }
          while (v64);
        }

        v36 = -[WKWallpaperBundle initWithURL:]([WKWallpaperBundle alloc], "initWithURL:", v79);
        goto LABEL_52;
      }
      WKLogForCategory(3uLL);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v67, "path");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:].cold.2(v60, (uint64_t)v27, (uint64_t)v98, v49);
      }
    }
LABEL_51:

    v36 = 0;
LABEL_52:

LABEL_53:
    v68[2]();

    v22 = v27;
LABEL_54:

    v35 = v72;
    goto LABEL_55;
  }
  WKLogForCategory(3uLL);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    +[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:].cold.6(v34);
    v36 = 0;
    v35 = v34;
  }
  else
  {
    v36 = 0;
  }
LABEL_55:

  return v36;
}

uint64_t __206__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_assetMapping___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "na_allSatisfy:", &__block_literal_global_234);
}

uint64_t __206__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_assetMapping___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  int v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "supportsCopying");
  v5 = v4 & objc_msgSend(v3, "supportsSerialization");
  if ((v5 & 1) == 0)
  {
    WKLogForCategory(3uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __206__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_assetMapping___block_invoke_2_cold_1();

  }
  return v5;
}

void __206__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_assetMapping___block_invoke_236(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  if (*(_BYTE *)(a1 + 40))
  {
    WKLogForCategory(3uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __206__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_assetMapping___block_invoke_236_cold_1(a1, v2, v3);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  }
}

uint64_t __206__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_assetMapping___block_invoke_237(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "propertyListRepresentation");
}

uint64_t __206__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_assetMapping___block_invoke_2_240(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "propertyListRepresentation");
}

uint64_t __206__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_assetMapping___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "propertyListRepresentation");
}

- (NADescriptionBuilder)wk_descriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__WKWallpaperBundle_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6EF94B0;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return (NADescriptionBuilder *)v5;
}

void __42__WKWallpaperBundle_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "descriptionBuilderBlock");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 32));

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[WKWallpaperBundle wk_descriptionBuilder](self, "wk_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)descriptionBuilderBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__WKWallpaperBundle_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6EF94D8;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __44__WKWallpaperBundle_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[3];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "identifierString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("identifierString"));

  v6 = (id)objc_msgSend(v3, "appendInteger:withName:", objc_msgSend(WeakRetained, "version"), CFSTR("version"));
  objc_msgSend(WeakRetained, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("name"));

  objc_msgSend(WeakRetained, "family");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend(WeakRetained, "family");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v10, CFSTR("family"));

  }
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(WeakRetained, "isAppearanceAware"), CFSTR("isAppearanceAware"));
  v12 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(WeakRetained, "hasDistinctWallpapersForLocations"), CFSTR("hasDistinctWallpapersForLocations"));
  v13 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(WeakRetained, "disableParallax"), CFSTR("disableParallax"));
  v14 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(WeakRetained, "isOffloaded"), CFSTR("isOffloaded"));
  objc_msgSend(WeakRetained, "adjustmentTraits");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v3;
  v16 = (id)objc_msgSend(v3, "appendObject:withName:", v15, CFSTR("adjustmentTraits"));

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(WeakRetained, "_wallpaperAssetLookup");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v43;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v43 != v33)
          objc_enumerationMutation(obj);
        v35 = v17;
        v18 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v17);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(WeakRetained, "_wallpaperAssetLookup");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = v20;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v39;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v39 != v23)
                objc_enumerationMutation(v36);
              v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v24);
              objc_msgSend(WeakRetained, "_wallpaperAssetLookup");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKeyedSubscript:", v18);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKeyedSubscript:", v25);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v46[0] = CFSTR("_wallpaperAssetLookup");
              v46[1] = v18;
              v46[2] = v25;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "componentsJoinedByString:", CFSTR("."));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (id)objc_msgSend(v37, "appendObject:withName:", v28, v30);

              ++v24;
            }
            while (v22 != v24);
            v22 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v22);
        }

        v17 = v35 + 1;
      }
      while (v35 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v34);
  }

}

- (NSNumber)contentVersion
{
  return self->_contentVersion;
}

- (NSURL)thumbnailImageURL
{
  return self->_thumbnailImageURL;
}

- (BOOL)isAppearanceAware
{
  return self->_appearanceAware;
}

- (BOOL)hasDistinctWallpapersForLocations
{
  return self->_distinctWallpapersForLocations;
}

- (BOOL)disableParallax
{
  return self->_disableParallax;
}

- (BOOL)isOffloaded
{
  return self->_offloaded;
}

- (NSString)logicalScreenClass
{
  return self->_logicalScreenClass;
}

- (BOOL)disableModifyingLegibilityBlur
{
  return self->_disableModifyingLegibilityBlur;
}

- (WKWallpaperAdjustmentTraits)adjustmentTraits
{
  return self->_adjustmentTraits;
}

- (int64_t)version
{
  return self->_version;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)family
{
  return self->_family;
}

- (NSDictionary)preferredProminentColors
{
  return self->_preferredProminentColors;
}

- (NSMutableDictionary)_wallpaperAssetLookup
{
  return self->__wallpaperAssetLookup;
}

- (void)set_wallpaperAssetLookup:(id)a3
{
  objc_storeStrong((id *)&self->__wallpaperAssetLookup, a3);
}

- (UIImage)_thumbnailImage
{
  return self->__thumbnailImage;
}

- (void)set_thumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->__thumbnailImage, a3);
}

- (BOOL)_hasCalculatedSupportsSerialization
{
  return self->__hasCalculatedSupportsSerialization;
}

- (void)set_hasCalculatedSupportsSerialization:(BOOL)a3
{
  self->__hasCalculatedSupportsSerialization = a3;
}

- (BOOL)_supportsSerialization
{
  return self->__supportsSerialization;
}

- (void)set_supportsSerialization:(BOOL)a3
{
  self->__supportsSerialization = a3;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->__thumbnailImage, 0);
  objc_storeStrong((id *)&self->__wallpaperAssetLookup, 0);
  objc_storeStrong((id *)&self->_preferredProminentColors, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_adjustmentTraits, 0);
  objc_storeStrong((id *)&self->_logicalScreenClass, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
}

- (void)initWithURL:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v4 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B8C64000, a3, v6, "%{public}@: Wallpaper bundle does not exist at URL '%{public}@', returning nil.", v7);

  OUTLINED_FUNCTION_2();
}

+ (void)shouldLoadWallpaperBundleAtURL:.cold.1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1B8C64000, v0, (uint64_t)v0, "%s: Could not decode 'Wallpaper.plist' at URL '%{public}@', error '%{public}@'.", (uint8_t *)v1);
}

+ (void)shouldLoadWallpaperBundleAtURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B8C64000, v0, v1, "%s: No 'Wallpaper.plist' file found at URL '%{public}@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)shouldLoadWallpaperBundleAtURL:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B8C64000, v0, v1, "%s: No wallpaper bundle found at URL '%{public}@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)shouldLoadWallpaperBundleAtURL:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B8C64000, v0, v1, "%s: URL does not have valid path extension ('.wallpaper') '%{public}@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)_createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B8C64000, v0, v1, "%s: Failed to copy wallpaper resources, error '%{public}@'.", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)_createWallpaperBundleInDirectory:(uint64_t)a3 version:(NSObject *)a4 identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:.cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 136315650;
  *(_QWORD *)(a3 + 4) = "+[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disablePara"
                        "llax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:]";
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a1;
  *(_WORD *)(a3 + 22) = 2114;
  *(_QWORD *)(a3 + 24) = a2;
  OUTLINED_FUNCTION_5(&dword_1B8C64000, a4, a3, "%s: Could not write out wallpaper metadata to path '%{public}@'.  Error: '%{public}@'.", (uint8_t *)a3);

}

+ (void)_createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:.cold.3()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1B8C64000, v0, (uint64_t)v0, "%s: Could not serialized wallpaper metadata '%{public}@'.  Error: '%{public}@'.", (uint8_t *)v1);
}

+ (void)_createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B8C64000, v0, v1, "%s: Failed to copy bundle thumbnail image, error '%{public}@'.", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)_createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B8C64000, v0, v1, "%s: Failed to create wallpaper bundle directory, error '%{public}@'.", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)_createWallpaperBundleInDirectory:(os_log_t)log version:identifier:name:family:disableParallax:isOffloaded:logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:.cold.6(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "+[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:"
       "logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:]";
  _os_log_error_impl(&dword_1B8C64000, log, OS_LOG_TYPE_ERROR, "%s: Cannot create wallpaper bundle because one or more assets do not support copying or serialization.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __206__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_assetMapping___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B8C64000, v0, v1, "%s: Cannot create wallpaper bundle because wallpaper %{public}@ either cannot copy or cannot serialize.", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

void __206__WKWallpaperBundle__createWallpaperBundleInDirectory_version_identifier_name_family_disableParallax_isOffloaded_logicalScreenClass_thumbnailImageURL_adjustmentTraits_preferredProminentColors_assetMapping___block_invoke_236_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315394;
  v5 = "+[WKWallpaperBundle _createWallpaperBundleInDirectory:version:identifier:name:family:disableParallax:isOffloaded:"
       "logicalScreenClass:thumbnailImageURL:adjustmentTraits:preferredProminentColors:assetMapping:]_block_invoke";
  v6 = 2114;
  v7 = v3;
  OUTLINED_FUNCTION_0(&dword_1B8C64000, a2, a3, "%s: Performing cleanup of '%{public}@'.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

@end
