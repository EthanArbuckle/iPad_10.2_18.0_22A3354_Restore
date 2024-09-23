@implementation MSDBundleProgressTracker

- (id)initializeTrackerForBundle:(id)a3 withContentType:(unsigned __int8)a4
{
  id v5;
  MSDBundleProgressTracker *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  unsigned int v45;
  id obj;
  uint64_t v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  _BYTE v56[18];

  v45 = a4;
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v48 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "installationOrder"));
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  -[MSDBundleProgressTracker setComponentsFromBundle:](v6, "setComponentsFromBundle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "criticalComponents"));
  -[MSDBundleProgressTracker setCriticalComponents:](v6, "setCriticalComponents:", v9);

  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](v6, "criticalComponents"));
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v56 = objc_msgSend(v12, "count");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "criticalComponents count:%ld", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](v6, "criticalComponents"));
  v14 = v13 == 0;

  if (v14)
    -[MSDBundleProgressTracker setCriticalComponents:](v6, "setCriticalComponents:", v7);
  v15 = sub_1000604F0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](v6, "criticalComponents"));
    v18 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v56 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "installation order items are:%ld", buf, 0xCu);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker retrieveLegacyContentnIdentifier:](v6, "retrieveLegacyContentnIdentifier:", v45));
  -[MSDBundleProgressTracker setContentIdentifierString:](v6, "setContentIdentifierString:", v19);

  v20 = sub_1000604F0();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v56 = v45;
    *(_WORD *)&v56[4] = 2114;
    *(_QWORD *)&v56[6] = v48;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "initializing tracker:%d %{public}@", buf, 0x12u);
  }

  -[MSDBundleProgressTracker retrieveAndPopulateBundleInfo:](v6, "retrieveAndPopulateBundleInfo:", v48);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v6, "bundleInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("ManifestVersion")));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSignedManifest appsPrefixForManifestVersion:](MSDSignedManifest, "appsPrefixForManifestVersion:", v23));

  v24 = sub_1000604F0();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v56 = "-[MSDBundleProgressTracker initializeTrackerForBundle:withContentType:]";
    *(_WORD *)&v56[8] = 2114;
    *(_QWORD *)&v56[10] = v49;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s - installationOrderAppsPrefix:  %{public}@", buf, 0x16u);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v7;
  v26 = 0;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v27)
  {
    v47 = *(_QWORD *)v51;
    do
    {
      v28 = 0;
      v29 = v26;
      do
      {
        if (*(_QWORD *)v51 != v47)
          objc_enumerationMutation(obj);
        v30 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](v6, "criticalComponents"));
        v32 = objc_msgSend(v31, "containsObject:", v30);

        if (objc_msgSend(v30, "hasPrefix:", v49))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "substringFromIndex:", objc_msgSend(v49, "length")));

          v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "getComponentVersion:", v33));
          goto LABEL_20;
        }
        if (objc_msgSend(v48, "isItemStandAlonePackage:", v30))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "substringFromIndex:", objc_msgSend(CFSTR("/Packages/"), "length")));

          v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "getStandAlonePackageVersion:", v33));
LABEL_20:
          v35 = (__CFString *)v34;
          if (v34)
            goto LABEL_24;
          goto LABEL_23;
        }
        v33 = v30;
LABEL_23:
        v35 = CFSTR("1");
LABEL_24:
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v6, "bundleInfo"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("ManifestVersion")));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSignedManifest getComponentFromPath:forManifestVersion:](MSDSignedManifest, "getComponentFromPath:forManifestVersion:", v33, v37));

        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v32));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v35, CFSTR("Version"), &__NSDictionary0__struct, CFSTR("DebugInfo"), &off_10014D748, CFSTR("Status"), v38, CFSTR("CriticalComponent"), 0));

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v6, "componentsFromBundle"));
        objc_msgSend(v40, "setObject:forKey:", v39, v26);

        v28 = (char *)v28 + 1;
        v29 = v26;
      }
      while (v27 != v28);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v27);
  }

  -[MSDBundleProgressTracker setPercentageProgress:](v6, "setPercentageProgress:", 0);
  v41 = objc_alloc_init((Class)NSMutableDictionary);
  -[MSDBundleProgressTracker setDownloadedContentSource:](v6, "setDownloadedContentSource:", v41);

  -[MSDBundleProgressTracker setBundleState:](v6, "setBundleState:", 1);
  -[MSDBundleProgressTracker setBundleType:](v6, "setBundleType:", v45);
  -[MSDBundleProgressTracker addBundleSpecificCompoments:](v6, "addBundleSpecificCompoments:", v45);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v6, "componentsFromBundle"));
  -[MSDBundleProgressTracker setTotalComponents:](v6, "setTotalComponents:", objc_msgSend(v42, "count"));

  -[MSDBundleProgressTracker setComponentsSuccessful:](v6, "setComponentsSuccessful:", 0);
  -[MSDBundleProgressTracker setLastBundleUpdateDate:](v6, "setLastBundleUpdateDate:", CFSTR("<unknown>"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("startTime"), &off_10014D760, CFSTR("totalTimeTaken"), 0));
  -[MSDBundleProgressTracker setBundleTimerInfo:](v6, "setBundleTimerInfo:", v43);

  -[MSDBundleProgressTracker flushRecordsToPreferences](v6, "flushRecordsToPreferences");
  objc_sync_exit(v6);

  return v6;
}

- (id)retrieveObjectFromPreferences:(unsigned __int8)a3
{
  uint64_t v3;
  MSDBundleProgressTracker *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MSDBundleProgressTracker *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  int v33;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v33 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "loadFromPreferences called:%d", buf, 8u);
  }

  -[MSDBundleProgressTracker setPreInstalledContent:](v4, "setPreInstalledContent:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker retrieveLegacyContentnIdentifier:](v4, "retrieveLegacyContentnIdentifier:", v3));
  -[MSDBundleProgressTracker setContentIdentifierString:](v4, "setContentIdentifierString:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker contentIdentifierString](v4, "contentIdentifierString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("ContentStatus")));
    -[MSDBundleProgressTracker setBundleState:](v4, "setBundleState:", objc_msgSend(v11, "integerValue"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("ComponentInfo")));
    -[MSDBundleProgressTracker setComponentsFromBundle:](v4, "setComponentsFromBundle:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("BundleInfo")));
    -[MSDBundleProgressTracker setBundleInfo:](v4, "setBundleInfo:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("BundleTimerInfo")));
    if (v14)
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("BundleTimerInfo")));
    else
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("startTime"), &off_10014D760, CFSTR("totalTimeTaken"), 0));
    -[MSDBundleProgressTracker setBundleTimerInfo:](v4, "setBundleTimerInfo:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("PreInstalledContent")));
    -[MSDBundleProgressTracker setPreInstalledContent:](v4, "setPreInstalledContent:", objc_msgSend(v17, "BOOLValue"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("ContentSource")));
    v19 = objc_msgSend(v18, "mutableCopy");
    -[MSDBundleProgressTracker setDownloadedContentSource:](v4, "setDownloadedContentSource:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("TotalComponents")));
    -[MSDBundleProgressTracker setTotalComponents:](v4, "setTotalComponents:", objc_msgSend(v20, "integerValue"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("SuccessfulComponents")));
    -[MSDBundleProgressTracker setComponentsSuccessful:](v4, "setComponentsSuccessful:", objc_msgSend(v21, "integerValue"));

    if (-[MSDBundleProgressTracker totalComponents](v4, "totalComponents"))
    {
      v22 = -[MSDBundleProgressTracker componentsSuccessful](v4, "componentsSuccessful");
      v23 = 100 * v22 / -[MSDBundleProgressTracker totalComponents](v4, "totalComponents");
    }
    else
    {
      v23 = 100;
    }
    -[MSDBundleProgressTracker setPercentageProgress:](v4, "setPercentageProgress:", v23);
    -[MSDBundleProgressTracker setBundleType:](v4, "setBundleType:", v3);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("LastBundleUpdateDate")));
    -[MSDBundleProgressTracker setLastBundleUpdateDate:](v4, "setLastBundleUpdateDate:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker lastBundleUpdateDate](v4, "lastBundleUpdateDate"));
    LODWORD(v24) = v25 == 0;

    if ((_DWORD)v24)
      -[MSDBundleProgressTracker setLastBundleUpdateDate:](v4, "setLastBundleUpdateDate:", CFSTR("<unknown>"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v4, "bundleInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("PreInstalledContent")));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v4, "bundleInfo"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("PreInstalledContent")));
      -[MSDBundleProgressTracker setPreInstalledContent:](v4, "setPreInstalledContent:", objc_msgSend(v29, "BOOLValue"));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v4, "bundleInfo"));
      objc_msgSend(v30, "removeObjectForKey:", CFSTR("PreInstalledContent"));

      -[MSDBundleProgressTracker flushRecordsToPreferences](v4, "flushRecordsToPreferences");
    }
    v16 = v4;
  }
  else
  {
    v16 = 0;
  }

  objc_sync_exit(v4);
  return v16;
}

- (void)updateComponentProgress:(id)a3 withResult:(BOOL)a4 withAdditionalInfo:(id)a5
{
  _BOOL4 v6;
  MSDBundleProgressTracker *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  NSObject *v56;
  id v57;
  id obj;
  MSDBundleProgressTracker *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  NSObject *v66;
  __int16 v67;
  _BOOL4 v68;
  __int16 v69;
  id v70;

  v6 = a4;
  v54 = a3;
  v55 = a5;
  v8 = self;
  objc_sync_enter(v8);
  v59 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v8, "bundleInfo"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v59, "bundleInfo"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("ManifestVersion")));

    v53 = (void *)v11;
    if (v11)
    {
      v56 = objc_claimAutoreleasedReturnValue(+[MSDSignedManifest getComponentFromPath:forManifestVersion:](MSDSignedManifest, "getComponentFromPath:forManifestVersion:", v54, v11));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v59, "componentsFromBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v56));
      v57 = objc_msgSend(v13, "mutableCopy");

      v14 = sub_1000604F0();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v66 = v56;
        v67 = 1026;
        v68 = v6;
        v69 = 2114;
        v70 = v55;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating component record:%{public}@ result:%{public, BOOL}d info:%{public}@", buf, 0x1Cu);
      }

      if (v57)
      {
        if (v6)
          v16 = 2;
        else
          v16 = 1;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16));
        objc_msgSend(v57, "setObject:forKey:", v17, CFSTR("Status"));

        objc_msgSend(v57, "setObject:forKey:", v55, CFSTR("DebugInfo"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v59, "componentsFromBundle"));
        objc_msgSend(v18, "setObject:forKey:", v57, v56);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
      v20 = objc_msgSend(v19, "criticalUpdatePrioritized");

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v59, "componentsFromBundle"));
      v22 = 0;
      v23 = 0;
      v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v61;
        obj = v21;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v61 != v25)
              objc_enumerationMutation(obj);
            v27 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v59, "componentsFromBundle"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", v27));

            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("Status")));
            LODWORD(v28) = objc_msgSend(v30, "intValue");

            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("CriticalComponent")));
            v32 = objc_msgSend(v31, "BOOLValue");

            if ((_DWORD)v28 == 2)
              ++v22;
            if (v32)
              v33 = v23 + 1;
            else
              v33 = v23;
            if (v20)
              v23 = v33;
            else
              ++v23;

          }
          v21 = obj;
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
        }
        while (v24);
      }

      -[MSDBundleProgressTracker setComponentsSuccessful:](v59, "setComponentsSuccessful:", v22);
      if (v23)
        v34 = 100 * -[MSDBundleProgressTracker componentsSuccessful](v59, "componentsSuccessful") / v23;
      else
        v34 = 100;
      -[MSDBundleProgressTracker setPercentageProgress:](v59, "setPercentageProgress:", v34);
      -[MSDBundleProgressTracker flushRecordsToPreferences](v59, "flushRecordsToPreferences");

    }
    else
    {
      v44 = sub_1000604F0();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      v56 = v45;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        sub_1000BA5B4(v45, v46, v47, v48, v49, v50, v51, v52);
    }

  }
  else
  {
    v35 = sub_1000604F0();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    v53 = v36;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_1000BA540(v36, v37, v38, v39, v40, v41, v42, v43);
  }

  objc_sync_exit(v59);
}

- (void)updateDownloadedContent:(unint64_t)a3 fromSource:(id)a4
{
  MSDBundleProgressTracker *v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = self;
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker downloadedContentSource](v6, "downloadedContentSource"));
  v8 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v13));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker downloadedContentSource](v6, "downloadedContentSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v13));
    v8 = (char *)objc_msgSend(v10, "longLongValue");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker downloadedContentSource](v6, "downloadedContentSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", &v8[a3]));
  objc_msgSend(v11, "setObject:forKey:", v12, v13);

  -[MSDBundleProgressTracker flushRecordsToPreferences](v6, "flushRecordsToPreferences");
  objc_sync_exit(v6);

}

- (void)markBundleInProgressAsCompleted
{
  id v2;
  unsigned __int8 v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  MSDBundleProgressTracker *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[MSDBundleProgressTracker bundleState](obj, "bundleState") == 1)
  {
    v2 = -[MSDBundleProgressTracker totalComponents](obj, "totalComponents");
    if (v2 == (id)-[MSDBundleProgressTracker componentsSuccessful](obj, "componentsSuccessful"))
    {
      v3 = 3;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
      v5 = objc_msgSend(v4, "criticalUpdatePrioritized");

      if (v5)
      {
        if (-[MSDBundleProgressTracker checkIfAllCriticalComponentsTried](obj, "checkIfAllCriticalComponentsTried"))
          v3 = 5;
        else
          v3 = 6;
      }
      else
      {
        v3 = 4;
      }
    }
    -[MSDBundleProgressTracker setBundleState:](obj, "setBundleState:", v3);
    v6 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v6, "setDateFormat:", CFSTR("yyyyMMdd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v7));

    -[MSDBundleProgressTracker setLastBundleUpdateDate:](obj, "setLastBundleUpdateDate:", v8);
  }
  -[MSDBundleProgressTracker flushRecordsToPreferences](obj, "flushRecordsToPreferences");
  objc_sync_exit(obj);

}

- (void)renameBundleInPrgressToBundleInstalled
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  MSDBundleProgressTracker *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker contentIdentifierString](obj, "contentIdentifierString"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Content.Installing"));

  if (v3)
  {
    -[MSDBundleProgressTracker setContentIdentifierString:](obj, "setContentIdentifierString:", CFSTR("Content.Existing"));
    -[MSDBundleProgressTracker setBundleType:](obj, "setBundleType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v4, "setCriticalUpdatePrioritized:", 0);

    -[MSDBundleProgressTracker flushRecordsToPreferences](obj, "flushRecordsToPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("Content.Installing"));

  }
  objc_sync_exit(obj);

}

- (void)setBundleStateAs:(unsigned __int8)a3
{
  uint64_t v3;
  MSDBundleProgressTracker *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  -[MSDBundleProgressTracker setBundleState:](obj, "setBundleState:", v3);
  -[MSDBundleProgressTracker flushRecordsToPreferences](obj, "flushRecordsToPreferences");
  objc_sync_exit(obj);

}

- (int64_t)getAllComponentsForUpdate
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v4 = objc_msgSend(v3, "criticalUpdatePrioritized");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](self, "criticalComponents"));
    v6 = objc_msgSend(v5, "count");

  }
  else
  {
    v6 = -[MSDBundleProgressTracker totalComponents](self, "totalComponents");
  }
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000BA628(self, (uint64_t)v6, v8);

  return (int64_t)v6;
}

- (id)getLastBundleUpdateDate
{
  MSDBundleProgressTracker *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker lastBundleUpdateDate](v2, "lastBundleUpdateDate"));
  objc_sync_exit(v2);

  return v3;
}

- (double)getBundleUpdateTime
{
  MSDBundleProgressTracker *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("startTime")));
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("totalTimeTaken")));
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  if (v6 == 0.0)
  {
    v14 = 0.0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v12, "timeIntervalSinceDate:", v11);
    v14 = v13;

  }
  objc_sync_exit(v2);

  return v10 + v14;
}

- (void)addToBundleUpdateTime:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  MSDBundleProgressTracker *obj;

  obj = self;
  objc_sync_enter(obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](obj, "bundleTimerInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("totalTimeTaken")));
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](obj, "bundleTimerInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7 + a3));
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("totalTimeTaken"));

  -[MSDBundleProgressTracker flushRecordsToPreferences](obj, "flushRecordsToPreferences");
  objc_sync_exit(obj);

}

- (BOOL)getComponentProgressStatus:(id)a3
{
  id v4;
  MSDBundleProgressTracker *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](v5, "bundleInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("ManifestVersion")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSignedManifest getComponentFromPath:forManifestVersion:](MSDSignedManifest, "getComponentFromPath:forManifestVersion:", v4, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v5, "componentsFromBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("Status")));
  v12 = objc_msgSend(v11, "intValue") == 2;

  objc_sync_exit(v5);
  return v12;
}

- (NSMutableDictionary)installedComponentList
{
  MSDBundleProgressTracker *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v2 = self;
  objc_sync_enter(v2);
  v17 = objc_alloc_init((Class)NSMutableDictionary);
  if (!-[MSDBundleProgressTracker preInstalledContent](v2, "preInstalledContent"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v2, "componentsFromBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v2, "componentsFromBundle"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("Status")));
          v12 = objc_msgSend(v11, "integerValue") == (id)2;

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](v2, "componentsFromBundle"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v8));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("Version")));
            objc_msgSend(v17, "setObject:forKey:", v15, v8);

          }
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v5);
    }

  }
  objc_sync_exit(v2);

  return (NSMutableDictionary *)v17;
}

- (NSMutableDictionary)contentProgress
{
  MSDBundleProgressTracker *v2;
  id v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = -[MSDBundleProgressTracker bundleState](v2, "bundleState");
  if (v4 == 5)
  {
    v5 = 3;
  }
  else if (v4 == 6)
  {
    v5 = 4;
  }
  else
  {
    v5 = -[MSDBundleProgressTracker bundleState](v2, "bundleState");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker contentIdentifierString](v2, "contentIdentifierString"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Content.Installing"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MSDBundleProgressTracker percentageProgress](v2, "percentageProgress")));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("InstalledComponentsPercent"));

    objc_msgSend(v3, "setObject:forKey:", &off_10014D760, CFSTR("InstalledSizePercent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v5));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("InstallState"));
LABEL_10:

    goto LABEL_11;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker contentIdentifierString](v2, "contentIdentifierString"));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Content.Downloading"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MSDBundleProgressTracker percentageProgress](v2, "percentageProgress")));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("DownloadedComponentsPercent"));

    objc_msgSend(v3, "setObject:forKey:", &off_10014D760, CFSTR("DownloadedSizePercent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v5));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("DownloadState"));
    goto LABEL_10;
  }
LABEL_11:
  objc_sync_exit(v2);

  return (NSMutableDictionary *)v3;
}

- (void)retrieveAndPopulateBundleInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[MSDBundleProgressTracker setBundleInfo:](self, "setBundleInfo:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("PartNumber")));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("PartNumber"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Revision")));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
    objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("Revision"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("BundleName")));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("BundleName"));

  }
  v19 = (id)objc_claimAutoreleasedReturnValue(+[MSDFileDownloadCredentials sharedInstance](MSDFileDownloadCredentials, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "manifestInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("SigningKey")));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
    objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("SigningKey"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
  v17 = objc_msgSend(v4, "getVersion");

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17));
  objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("ManifestVersion"));

}

- (id)retrieveLegacyContentnIdentifier:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = CFSTR("Content.Downloading");
  if (a3 == 2)
    v3 = CFSTR("Content.Installing");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Content.Existing");
}

- (void)flushRecordsToPreferences
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
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[9];
  _QWORD v16[9];

  v15[0] = CFSTR("BundleInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
  v16[0] = v14;
  v15[1] = CFSTR("PreInstalledContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MSDBundleProgressTracker preInstalledContent](self, "preInstalledContent")));
  v16[1] = v3;
  v15[2] = CFSTR("ComponentInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](self, "componentsFromBundle"));
  v16[2] = v4;
  v15[3] = CFSTR("ContentStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[MSDBundleProgressTracker bundleState](self, "bundleState")));
  v16[3] = v5;
  v15[4] = CFSTR("ContentSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker downloadedContentSource](self, "downloadedContentSource"));
  v16[4] = v6;
  v15[5] = CFSTR("TotalComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MSDBundleProgressTracker totalComponents](self, "totalComponents")));
  v16[5] = v7;
  v15[6] = CFSTR("SuccessfulComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MSDBundleProgressTracker componentsSuccessful](self, "componentsSuccessful")));
  v16[6] = v8;
  v15[7] = CFSTR("LastBundleUpdateDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker lastBundleUpdateDate](self, "lastBundleUpdateDate"));
  v16[7] = v9;
  v15[8] = CFSTR("BundleTimerInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](self, "bundleTimerInfo"));
  v16[8] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker contentIdentifierString](self, "contentIdentifierString"));
  objc_msgSend(v12, "setObject:forKey:", v11, v13);

}

- (BOOL)checkIfAllCriticalComponentsTried
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker criticalComponents](self, "criticalComponents"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleInfo](self, "bundleInfo"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ManifestVersion")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSignedManifest getComponentFromPath:forManifestVersion:](MSDSignedManifest, "getComponentFromPath:forManifestVersion:", v7, v9));

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker componentsFromBundle](self, "componentsFromBundle"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("Status")));
          v14 = objc_msgSend(v13, "intValue");

          if (!v14)
          {

            v17 = 0;
            goto LABEL_15;
          }
        }
        else
        {
          v15 = sub_1000604F0();
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v27 = v10;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Couldn't get componentInfo for: %{public}@, skipping...", buf, 0xCu);
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v4);
  }
  v17 = 1;
LABEL_15:

  v18 = sub_1000604F0();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Critical components tried:%d", buf, 8u);
  }

  return v17;
}

+ (void)removeBundleFromPreferences:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a3;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "removing bundlepreferences:%{public}@", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  objc_msgSend(v6, "removeObjectForKey:", v3);

}

+ (BOOL)isBundleInstance:(id)a3 identicalWithNewBundle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v24;
  uint8_t v25[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "getInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileDownloadCredentials sharedInstance](MSDFileDownloadCredentials, "sharedInstance"));
  v8 = 0;
  if (v5 && a4)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("PartNumber")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("PartNumber")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Revision")));
    v13 = objc_msgSend(v12, "integerValue");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Revision")));
    v15 = objc_msgSend(v14, "integerValue");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("SigningKey")));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "manifestInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("SigningKey")));

    if (objc_msgSend(v24, "isEqualToString:", v10)
      && v13 == v15
      && objc_msgSend(v19, "isEqualToString:", v17))
    {
      v20 = sub_1000604F0();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "It is the same old bundle.", buf, 2u);
      }
      v8 = 1;
    }
    else
    {
      v22 = sub_1000604F0();
      v21 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "It is not the same old bundle.", v25, 2u);
      }
      v8 = 0;
    }

  }
  return v8;
}

+ (void)migratePreferencesFromLegacyDevicesIfNeeded
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  unsigned __int8 v17;
  void *v18;
  id v19;
  NSObject *v20;
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
  signed int v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("ContentInstalled")));

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found the key contentInstalled...", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Content.Existing")));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("ContentInstalled")));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("DemoContent")));
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("Installed")));
          v13 = (int)objc_msgSend(v12, "intValue");

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("Total")));
          v15 = (int)objc_msgSend(v14, "intValue");

        }
        else
        {
          v15 = 0;
          v13 = 0;
        }

      }
      else
      {
        v15 = 0;
        v13 = 0;
      }
      if (v13 == v15)
        v17 = 3;
      else
        v17 = 4;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("Content.Existing")));

      v16 = objc_alloc_init((Class)NSMutableDictionary);
      v8 = objc_alloc_init((Class)NSMutableDictionary);
      v19 = sub_1000604F0();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v49 = v15;
        v50 = 2048;
        v51 = v13;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "totalComponents:%ld componentsSuccessful:%ld", buf, 0x16u);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v17));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v5, CFSTR("BundleInfo"), v16, CFSTR("ComponentInfo"), v21, CFSTR("ContentStatus"), v8, CFSTR("ContentSource"), v22, CFSTR("TotalComponents"), v23, CFSTR("SuccessfulComponents"), CFSTR("<unknown>"), CFSTR("LastBundleUpdateDate"), 0));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
      objc_msgSend(v25, "setObject:forKey:", v24, CFSTR("Content.Existing"));

    }
    else
    {
      v16 = 0;
      v5 = 0;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("Content.Downloading")));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("BackgroundDownloadedComponents")));

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("TotalDownloadedContent")));
      v32 = objc_msgSend(v31, "intValue");

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("Content.Downloading")));

      v35 = objc_alloc_init((Class)NSMutableDictionary);
      v36 = objc_alloc_init((Class)NSMutableDictionary);

      v37 = 100 * (uint64_t)objc_msgSend(v29, "count") / (unint64_t)v32;
      v38 = objc_msgSend(v29, "count");
      if (v32 == 100)
        v39 = 3;
      else
        v39 = 4;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v39));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v37));
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v38));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v34, CFSTR("BundleInfo"), v35, CFSTR("ComponentInfo"), v40, CFSTR("ContentStatus"), v36, CFSTR("ContentSource"), v41, CFSTR("TotalComponents"), v42, CFSTR("SuccessfulComponents"), CFSTR("<unknown>"), CFSTR("LastBundleUpdateDate"), 0));

      v44 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
      objc_msgSend(v44, "setObject:forKey:", v43, CFSTR("Content.Existing"));

      v8 = v36;
      v16 = v35;
      v5 = v34;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
    objc_msgSend(v45, "removeObjectForKey:", CFSTR("ContentInstalled"));

    v46 = sub_1000604F0();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Migrating preferences from legacy device done.", buf, 2u);
    }

  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Nothing to migrate in preferences file for legacy device.", buf, 2u);
  }

}

+ (void)migratePreferencesFromFactoryDevicesIfNeeded
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint8_t buf[16];
  uint8_t v14[16];
  uint8_t v15[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](MSDHelperAgent, "sharedInstance"));
  if (objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/private/var/demo_backup/Metadata/Content.plist")))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readPlistFile:", CFSTR("/private/var/demo_backup/Metadata/Content.plist")));
    if (v5 && (v6 = objc_opt_class(NSDictionary, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    {
      -[NSObject addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v5);
      v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v3, CFSTR("BundleInfo"), &__kCFBooleanTrue, CFSTR("PreInstalledContent"), &__NSDictionary0__struct, CFSTR("ComponentInfo"), &off_10014D778, CFSTR("ContentStatus"), &__NSDictionary0__struct, CFSTR("ContentSource"), &off_10014D790, CFSTR("TotalComponents"), &off_10014D790, CFSTR("SuccessfulComponents"), CFSTR("<unknown>"), CFSTR("LastBundleUpdateDate"),
                           0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
      objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("Content.Existing"));

    }
    else
    {
      v10 = sub_1000604F0();
      v7 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cannot parse Content.plist.", v15, 2u);
      }
    }

    objc_msgSend(v2, "removeFileAtPath:", CFSTR("/private/var/demo_backup/Metadata/Content.plist"));
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Migrating Content.plist for factory device done.", v14, 2u);
    }

  }
  else
  {
    v9 = sub_1000604F0();
    v3 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "No Content.plist to migrate for factory device.", buf, 2u);
    }
  }

}

- (void)startBundleUpdateTimer
{
  MSDBundleProgressTracker *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("startTime")));
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  if (v6 == 0.0)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting bundle update timer.", v14, 2u);
    }

    v9 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[NSObject timeIntervalSince1970](v9, "timeIntervalSince1970");
    v6 = v10;
  }
  else
  {
    v11 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1000BA6F8(v9);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
  objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("startTime"));

  -[MSDBundleProgressTracker flushRecordsToPreferences](v2, "flushRecordsToPreferences");
  objc_sync_exit(v2);

}

- (void)stopBundleUpdateTimer
{
  MSDBundleProgressTracker *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  NSObject *v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  double v27;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("startTime")));
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("totalTimeTaken")));
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  if (v6 != 0.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v12, "timeIntervalSinceDate:", v11);
    v14 = v13;

    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = v10 + v14;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v18, "timeIntervalSinceDate:", v11);
      v24 = 134218240;
      v25 = v19;
      v26 = 2048;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Stopping bundle update timer. Time taken in this attempt: %lf, Total time taken: %lf", (uint8_t *)&v24, 0x16u);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
    objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("startTime"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker bundleTimerInfo](v2, "bundleTimerInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17));
    objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("totalTimeTaken"));

    -[MSDBundleProgressTracker flushRecordsToPreferences](v2, "flushRecordsToPreferences");
  }
  objc_sync_exit(v2);

}

- (unsigned)bundleType
{
  return self->_bundleType;
}

- (void)setBundleType:(unsigned __int8)a3
{
  self->_bundleType = a3;
}

- (unsigned)bundleState
{
  return self->_bundleState;
}

- (void)setBundleState:(unsigned __int8)a3
{
  self->_bundleState = a3;
}

- (NSMutableDictionary)bundleInfo
{
  return self->_bundleInfo;
}

- (void)setBundleInfo:(id)a3
{
  objc_storeStrong((id *)&self->_bundleInfo, a3);
}

- (void)setContentProgress:(id)a3
{
  objc_storeStrong((id *)&self->_contentProgress, a3);
}

- (void)setInstalledComponentList:(id)a3
{
  objc_storeStrong((id *)&self->_installedComponentList, a3);
}

- (NSMutableDictionary)downloadedContentSource
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDownloadedContentSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)preInstalledContent
{
  return self->_preInstalledContent;
}

- (void)setPreInstalledContent:(BOOL)a3
{
  self->_preInstalledContent = a3;
}

- (NSString)contentIdentifierString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContentIdentifierString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)componentsFromBundle
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setComponentsFromBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (int64_t)percentageProgress
{
  return self->_percentageProgress;
}

- (void)setPercentageProgress:(int64_t)a3
{
  self->_percentageProgress = a3;
}

- (int64_t)totalComponents
{
  return self->_totalComponents;
}

- (void)setTotalComponents:(int64_t)a3
{
  self->_totalComponents = a3;
}

- (int64_t)componentsSuccessful
{
  return self->_componentsSuccessful;
}

- (void)setComponentsSuccessful:(int64_t)a3
{
  self->_componentsSuccessful = a3;
}

- (NSArray)criticalComponents
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCriticalComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)lastBundleUpdateDate
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastBundleUpdateDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableDictionary)bundleTimerInfo
{
  return self->_bundleTimerInfo;
}

- (void)setBundleTimerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_bundleTimerInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleTimerInfo, 0);
  objc_storeStrong((id *)&self->_lastBundleUpdateDate, 0);
  objc_storeStrong((id *)&self->_criticalComponents, 0);
  objc_storeStrong((id *)&self->_componentsFromBundle, 0);
  objc_storeStrong((id *)&self->_contentIdentifierString, 0);
  objc_storeStrong((id *)&self->_downloadedContentSource, 0);
  objc_storeStrong((id *)&self->_installedComponentList, 0);
  objc_storeStrong((id *)&self->_contentProgress, 0);
  objc_storeStrong((id *)&self->_bundleInfo, 0);
}

@end
