@implementation BKFontCache

+ (id)sharedInstance
{
  if (qword_20F4D8 != -1)
    dispatch_once(&qword_20F4D8, &stru_1BED90);
  return (id)qword_20F4D0;
}

- (BKFontCache)init
{
  BKFontCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableOrderedSet *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKFontCache;
  v2 = -[BKFontCache init](&v11, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    -[BKFontCache setFontsByFileName:](v2, "setFontsByFileName:", v3);

    v4 = objc_opt_new(NSMutableDictionary);
    -[BKFontCache setFontLookupByFileName:](v2, "setFontLookupByFileName:", v4);

    v5 = objc_opt_new(NSMutableDictionary);
    -[BKFontCache setPresetsByFileName:](v2, "setPresetsByFileName:", v5);

    v6 = objc_opt_new(NSMutableDictionary);
    -[BKFontCache setFontFaceLookupByFileName:](v2, "setFontFaceLookupByFileName:", v6);

    v7 = objc_opt_new(NSMutableOrderedSet);
    -[BKFontCache setFileNames:](v2, "setFileNames:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[BKFontCache setDisableAutoFontDownload:](v2, "setDisableAutoFontDownload:", objc_msgSend(v8, "BOOLForKey:", CFSTR("REI.DisableAutoFontDownload")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "_didReceiveMemoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, 0);

  }
  return v2;
}

- (id)fontsForLanguage:(id)a3
{
  return -[BKFontCache fontsForLanguage:completion:](self, "fontsForLanguage:completion:", a3, 0);
}

- (id)fontsForLanguage:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  unsigned int v25;
  BKFont *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BKFont *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  NSObject *v44;
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  BOOL v50;
  NSMutableArray *v51;
  BKFontCache *v52;
  id obj;
  _QWORD block[4];
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  BKFont *v59;
  BKFontCache *v60;
  NSObject *v61;
  char v62;
  BOOL v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  id v71;
  _BYTE v72[128];

  v49 = a3;
  v46 = a4;
  v6 = _AEBookPluginsFontCacheLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v49;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Prewarming AEBookPlugin for language %@", buf, 0xCu);
  }

  v52 = self;
  objc_sync_enter(v52);
  if (objc_msgSend(v49, "length"))
  {
    v48 = objc_claimAutoreleasedReturnValue(-[BKFontCache _presetsFileNameForLanguage:](v52, "_presetsFileNameForLanguage:", v49));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache fontsByFileName](v52, "fontsByFileName"));
    v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v48));

    if (!objc_msgSend(v47, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache _presetsForFileName:](v52, "_presetsForFileName:", v48));
      v10 = objc_opt_new(NSMutableDictionary);
      v51 = objc_opt_new(NSMutableArray);
      v11 = dispatch_group_create();
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKReachability sharedReachabilityForInternetConnection](BKReachability, "sharedReachabilityForInternetConnection"));
      v50 = objc_msgSend(v12, "currentReachabilityStatus") == 1;

      v66 = 0u;
      v67 = 0u;
      v65 = 0u;
      v64 = 0u;
      obj = v9;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v65 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
            dispatch_group_enter(v11);
            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("fontFamily")));
            v18 = (void *)v17;
            v19 = &stru_1C3088;
            if (v17)
              v19 = (__CFString *)v17;
            v20 = v19;

            v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v20));
            v22 = v21 == 0;

            if (v22)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("system")));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("isPreinstalled")));
              v25 = objc_msgSend(v24, "BOOLValue");

              v26 = objc_opt_new(BKFont);
              if (-[__CFString length](v20, "length"))
              {
                if ((objc_msgSend(v23, "isEqualToString:", CFSTR("serif")) & 1) != 0)
                {
                  v27 = 4;
                }
                else
                {
                  v28 = objc_msgSend(v23, "isEqualToString:", CFSTR("default"));
                  v29 = 2;
                  if (!v25)
                    v29 = 0;
                  if (v28)
                    v27 = 3;
                  else
                    v27 = v29;
                }
              }
              else
              {
                v27 = 1;
              }
              -[BKFont setKind:](v26, "setKind:", v27);
              -[BKFont setSystemName:](v26, "setSystemName:", v23);
              -[BKFont setFamilyName:](v26, "setFamilyName:", v20);
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("displayName")));
              -[BKFont setDisplayName:](v26, "setDisplayName:", v30);

              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("postscriptName")));
              -[BKFont setPostscriptName:](v26, "setPostscriptName:", v31);

              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("postscriptBoldName")));
              -[BKFont setPostscriptBoldName:](v26, "setPostscriptBoldName:", v32);

              -[NSMutableArray addObject:](v51, "addObject:", v26);
              -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v26, v20);
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("shouldAutoDownload")));
              LOBYTE(v32) = objc_msgSend(v33, "BOOLValue");

              v58[0] = _NSConcreteStackBlock;
              v58[1] = 3221225472;
              v58[2] = sub_18FCC;
              v58[3] = &unk_1BEDB8;
              v34 = v26;
              v62 = (char)v32;
              v63 = v50;
              v59 = v34;
              v60 = v52;
              v61 = v11;
              -[BKFont checkStateSynchronously:completion:](v34, "checkStateSynchronously:completion:", 0, v58);

            }
            else
            {
              dispatch_group_leave(v11);
            }

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        }
        while (v13);
      }

      v35 = -[NSMutableArray copy](v51, "copy");
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache fontsByFileName](v52, "fontsByFileName"));
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, v48);

      v37 = -[NSMutableDictionary copy](v10, "copy");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache fontLookupByFileName](v52, "fontLookupByFileName"));
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, v48);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache fileNames](v52, "fileNames"));
      objc_msgSend(v39, "addObject:", v48);

      v40 = _AEBookPluginsFontCacheLog();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = objc_msgSend(v35, "count");
        *(_DWORD *)buf = 134218242;
        v69 = v42;
        v70 = 2114;
        v71 = v49;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "Cached %lu fonts for language: %{public}@", buf, 0x16u);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_190C4;
      block[3] = &unk_1BEDE0;
      v57 = v46;
      v47 = v35;
      v55 = v47;
      v56 = v49;
      dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, block);

    }
  }
  else
  {
    v43 = _AEBookPluginsFontCacheLog();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    v48 = v44;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v44, OS_LOG_TYPE_ERROR, "Nil language parameter, returning 0 fonts", buf, 2u);
    }
    v47 = &__NSArray0__struct;
  }

  objc_sync_exit(v52);
  return v47;
}

- (id)fontFromFamilyName:(id)a3 language:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  BKFontCache *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  int v18;
  NSObject *v19;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (-[NSObject length](v7, "length"))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[BKFontCache _presetsFileNameForLanguage:](v8, "_presetsFileNameForLanguage:", v7));
    if (-[NSObject length](v9, "length"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache fontLookupByFileName](v8, "fontLookupByFileName"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v6));
LABEL_14:

        goto LABEL_15;
      }
      v15 = _AEBookPluginsFontCacheLog();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18 = 138543362;
        v19 = v9;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "Font lookup for %{public}@ not found, no font found", (uint8_t *)&v18, 0xCu);
      }

    }
    else
    {
      v14 = _AEBookPluginsFontCacheLog();
      v11 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v18 = 138543362;
        v19 = v7;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Filename for %{public}@ not found, no font found", (uint8_t *)&v18, 0xCu);
      }
    }
    v12 = 0;
    goto LABEL_14;
  }
  v13 = _AEBookPluginsFontCacheLog();
  v9 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v18 = 138543362;
    v19 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Empty language parameter, no font found for %{public}@", (uint8_t *)&v18, 0xCu);
  }
  v12 = 0;
LABEL_15:

  objc_sync_exit(v8);
  return v12;
}

- (id)defaultFontNameForLanguage:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  BKFontCache *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = a3;
  v25 = self;
  objc_sync_enter(v25);
  v23 = v4;
  if (objc_msgSend(v4, "length"))
  {
    -[BKFontCache prewarmFontsForLanguage:completion:](v25, "prewarmFontsForLanguage:completion:", v4, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache _presetsFileNameForLanguage:](v25, "_presetsFileNameForLanguage:", v4));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[BKFontCache _presetsForFileName:](v25, "_presetsForFileName:"));
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v5)
    {
      v6 = 0;
      v7 = 0;
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("default"), v23));
          v12 = objc_msgSend(v11, "integerValue");

          if ((uint64_t)v12 > (uint64_t)v6)
          {
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("fontFamily")));
            v14 = (void *)v13;
            v15 = &stru_1C3088;
            if (v13)
              v15 = (__CFString *)v13;
            v16 = v15;

            v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache fontLookupByFileName](v25, "fontLookupByFileName"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v24));

            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v16));
            if ((objc_msgSend(v19, "isInstalled") & 1) == 0)
              objc_msgSend(v19, "checkStateSynchronously:", 1);
            if ((objc_msgSend(v19, "isInstalled") & 1) != 0
              || objc_msgSend(v19, "state") == 1)
            {
              v20 = v10;

              v6 = v12;
              v7 = v20;
            }

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v5);

      if (v7)
        goto LABEL_27;
    }
    else
    {

    }
    if ((unint64_t)objc_msgSend(obj, "count", v23) < 2
      || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectAtIndex:", 1))) == 0)
    {
      if (objc_msgSend(obj, "count"))
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectAtIndex:", 0));
      else
        v7 = 0;
    }
LABEL_27:
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("fontFamily")));

    goto LABEL_28;
  }
  v21 = 0;
LABEL_28:
  objc_sync_exit(v25);

  return v21;
}

- (id)presetsForLanguage:(id)a3
{
  id v4;
  BKFontCache *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache _presetsFileNameForLanguage:](v5, "_presetsFileNameForLanguage:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache _presetsForFileName:](v5, "_presetsForFileName:", v6));

  objc_sync_exit(v5);
  return v7;
}

- (id)presetSettingsForFontFamily:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  BKFontCache *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_19990;
  v24 = sub_199A0;
  v25 = 0;
  if (objc_msgSend(v7, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache _presetsFileNameForLanguage:](v8, "_presetsFileNameForLanguage:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache _presetsForFileName:](v8, "_presetsForFileName:", v9));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_199A8;
    v17[3] = &unk_1BEE08;
    v11 = v6;
    v18 = v11;
    v19 = &v20;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);
    if (!v21[5])
    {
      v12 = _AEBookPluginsFontCacheLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_11C0DC((uint64_t)v11, (uint64_t)v7, v13);

      v14 = (void *)v21[5];
      v21[5] = (uint64_t)&off_1CD540;

    }
  }
  v15 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  objc_sync_exit(v8);
  return v15;
}

- (id)presetPostscriptsLookupForLanguage:(id)a3
{
  id v4;
  BKFontCache *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[BKFontCache prewarmFontsForLanguage:completion:](v5, "prewarmFontsForLanguage:completion:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache _presetsFileNameForLanguage:](v5, "_presetsFileNameForLanguage:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache fontFaceLookupByFileName](v5, "fontFaceLookupByFileName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  objc_sync_exit(v5);
  return v8;
}

- (void)prewarmFontsForLanguage:(id)a3 completion:(id)a4
{
  id v4;

  v4 = -[BKFontCache fontsForLanguage:completion:](self, "fontsForLanguage:completion:", a3, a4);
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  id v4;
  BKFontCache *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  char *v12;
  void *v13;
  NSObject *v14;
  id v15;
  char *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, char *);
  void *v20;
  NSObject *v21;
  BKFontCache *v22;
  uint8_t buf[4];
  char *v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache fileNames](v5, "fileNames"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "array"));
  v8 = objc_msgSend(v7, "copy");

  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
    v15 = _AEBookPluginsFontCacheLog();
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (char *)objc_claimAutoreleasedReturnValue(-[BKFontCache fileNames](v5, "fileNames"));
      *(_DWORD *)buf = 138543362;
      v24 = v16;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Received memory warning - files did not exceed minimum. Remaining files cached: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_19D88;
    v20 = &unk_1BEE30;
    v9 = v8;
    v21 = v9;
    v22 = v5;
    -[NSObject enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", &v17);
    v10 = _AEBookPluginsFontCacheLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (char *)-[NSObject count](v9, "count", v17, v18, v19, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache fileNames](v5, "fileNames"));
      *(_DWORD *)buf = 134218242;
      v24 = v12 - 1;
      v25 = 2114;
      v26 = v13;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Received memory warning - cleared %lu files. Remaining files cached: %{public}@", buf, 0x16u);

    }
    v14 = v21;
  }

  objc_sync_exit(v5);
}

- (id)_presetsForFileName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSMutableDictionary *v14;
  _QWORD *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  NSMutableDictionary *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache presetsByFileName](self, "presetsByFileName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (objc_msgSend(v6, "count"))
  {
    v7 = v6;
  }
  else
  {
    v8 = AEBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathForResource:ofType:", v4, CFSTR("plist")));

    v11 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("fonts")));
    v13 = objc_msgSend(v12, "mutableCopy");
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1A108;
    v28[3] = &unk_1BEE58;
    v14 = objc_opt_new(NSMutableDictionary);
    v29 = v14;
    v15 = objc_retainBlock(v28);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1A1D8;
    v25[3] = &unk_1BEE80;
    v16 = v13;
    v26 = v16;
    v27 = v15;
    v17 = v15;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v25);
    v7 = objc_msgSend(v16, "copy");

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache presetsByFileName](self, "presetsByFileName"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v7, v4);

    v19 = -[NSMutableDictionary copy](v14, "copy");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontCache fontFaceLookupByFileName](self, "fontFaceLookupByFileName"));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v4);

    v21 = _AEBookPluginsFontCacheLog();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134218242;
      v31 = v23;
      v32 = 2114;
      v33 = v4;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Cached %lu presets from file: %{public}@", buf, 0x16u);
    }

  }
  return v7;
}

- (id)_presetsFileNameForLanguage:(id)a3
{
  void *v3;
  __CFString *v4;
  const __CFString *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKStyleManager suffixForLanguage:](BKStyleManager, "suffixForLanguage:", a3));
  if (objc_msgSend(v3, "length"))
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-%@"), v3));
  else
    v4 = &stru_1C3088;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1C3088;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("FontPresets"), v5));

  return v6;
}

- (NSMutableDictionary)fontsByFileName
{
  return self->_fontsByFileName;
}

- (void)setFontsByFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fontsByFileName, a3);
}

- (NSMutableDictionary)fontLookupByFileName
{
  return self->_fontLookupByFileName;
}

- (void)setFontLookupByFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fontLookupByFileName, a3);
}

- (NSMutableDictionary)presetsByFileName
{
  return self->_presetsByFileName;
}

- (void)setPresetsByFileName:(id)a3
{
  objc_storeStrong((id *)&self->_presetsByFileName, a3);
}

- (NSMutableDictionary)fontFaceLookupByFileName
{
  return self->_fontFaceLookupByFileName;
}

- (void)setFontFaceLookupByFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fontFaceLookupByFileName, a3);
}

- (NSMutableOrderedSet)fileNames
{
  return self->_fileNames;
}

- (void)setFileNames:(id)a3
{
  objc_storeStrong((id *)&self->_fileNames, a3);
}

- (BOOL)disableAutoFontDownload
{
  return self->_disableAutoFontDownload;
}

- (void)setDisableAutoFontDownload:(BOOL)a3
{
  self->_disableAutoFontDownload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileNames, 0);
  objc_storeStrong((id *)&self->_fontFaceLookupByFileName, 0);
  objc_storeStrong((id *)&self->_presetsByFileName, 0);
  objc_storeStrong((id *)&self->_fontLookupByFileName, 0);
  objc_storeStrong((id *)&self->_fontsByFileName, 0);
}

@end
