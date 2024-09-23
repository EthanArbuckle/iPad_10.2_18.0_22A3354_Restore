@implementation MSDProgressUpdater

+ (id)sharedInstance
{
  if (qword_1001754B8 != -1)
    dispatch_once(&qword_1001754B8, &stru_10013F2D0);
  return (id)qword_1001754B0;
}

- (MSDProgressUpdater)init
{
  MSDProgressUpdater *v2;
  MSDProgressUpdater *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDProgressUpdater;
  v2 = -[MSDProgressUpdater init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MSDProgressUpdater updateStage:](v2, "updateStage:", 199);
  return v3;
}

- (void)updateStage:(int)a3
{
  -[MSDProgressUpdater setCurrentStage:](self, "setCurrentStage:", *(_QWORD *)&a3);
}

- (void)resetTrackerForBundleType:(int)a3
{
  if (a3 == 1)
    -[MSDProgressUpdater setBackgroundBundle:](self, "setBackgroundBundle:", 0);
}

- (void)markBundleInProgressAsBundleCompleted
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[MSDProgressUpdater markBundleInProgressAsBundleCompleted]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s entered.", (uint8_t *)&v9, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
  objc_msgSend(v5, "markBundleInProgressAsCompleted");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](MSDMailProcessor, "sharedInstance"));
  objc_msgSend(v6, "reportBundleInstallCompleted");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
  objc_msgSend(v7, "renameBundleInPrgressToBundleInstalled");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
  -[MSDProgressUpdater setInstalledBundle:](self, "setInstalledBundle:", v8);

  -[MSDProgressUpdater setInstallingBundle:](self, "setInstallingBundle:", 0);
  -[MSDProgressUpdater setBundleInProgress:](self, "setBundleInProgress:", 0);
}

- (void)startBundleUpdateMonitor:(id)a3 inMode:(int)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  void *v16;
  MSDBundleProgressTracker *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  MSDBundleProgressTracker *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  int v33;
  id v34;

  v6 = a3;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 138543362;
    v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "start content update monitor:%{public}@", (uint8_t *)&v33, 0xCu);
  }

  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v11)
    {
      LOWORD(v33) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Inside start content background", (uint8_t *)&v33, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
    v13 = +[MSDBundleProgressTracker isBundleInstance:identicalWithNewBundle:](MSDBundleProgressTracker, "isBundleInstance:identicalWithNewBundle:", v12, v6);

    if ((v13 & 1) == 0)
    {
      v14 = sub_1000604F0();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "not the same background bundle...", (uint8_t *)&v33, 2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
      objc_msgSend(v16, "cleanUpBackgroundState:", 1);

      v17 = [MSDBundleProgressTracker alloc];
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker initializeTrackerForBundle:withContentType:](v17, "initializeTrackerForBundle:withContentType:", v6, 1));
      -[MSDProgressUpdater setBackgroundBundle:](self, "setBackgroundBundle:", v18);

    }
    v19 = objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
  }
  else
  {
    if (v11)
    {
      LOWORD(v33) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Inside start content foreground", (uint8_t *)&v33, 2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
    v21 = +[MSDBundleProgressTracker isBundleInstance:identicalWithNewBundle:](MSDBundleProgressTracker, "isBundleInstance:identicalWithNewBundle:", v20, v6);

    if ((v21 & 1) == 0)
    {
      v22 = sub_1000604F0();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "not the same foreground bundle...", (uint8_t *)&v33, 2u);
      }

      v24 = [MSDBundleProgressTracker alloc];
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker initializeTrackerForBundle:withContentType:](v24, "initializeTrackerForBundle:withContentType:", v6, 2));
      -[MSDProgressUpdater setInstallingBundle:](self, "setInstallingBundle:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
      LODWORD(v24) = +[MSDBundleProgressTracker isBundleInstance:identicalWithNewBundle:](MSDBundleProgressTracker, "isBundleInstance:identicalWithNewBundle:", v26, v6);

      if ((_DWORD)v24)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
        objc_msgSend(v28, "getBundleUpdateTime");
        objc_msgSend(v27, "addToBundleUpdateTime:");

      }
    }
    v19 = objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
  }
  v29 = (void *)v19;
  -[MSDProgressUpdater setBundleInProgress:](self, "setBundleInProgress:", v19);

  v30 = sub_1000604F0();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
    v33 = 138543362;
    v34 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "bundleInProgress:%{public}@", (uint8_t *)&v33, 0xCu);

  }
}

- (void)loadBundles
{
  void *v3;
  MSDBundleProgressTracker *v4;
  void *v5;
  MSDBundleProgressTracker *v6;
  void *v7;
  MSDBundleProgressTracker *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v4 = [MSDBundleProgressTracker alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker retrieveObjectFromPreferences:](v4, "retrieveObjectFromPreferences:", 0));
  -[MSDProgressUpdater setInstalledBundle:](self, "setInstalledBundle:", v5);

  v6 = [MSDBundleProgressTracker alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker retrieveObjectFromPreferences:](v6, "retrieveObjectFromPreferences:", 1));
  -[MSDProgressUpdater setBackgroundBundle:](self, "setBackgroundBundle:", v7);

  v8 = [MSDBundleProgressTracker alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBundleProgressTracker retrieveObjectFromPreferences:](v8, "retrieveObjectFromPreferences:", 2));
  -[MSDProgressUpdater setInstallingBundle:](self, "setInstallingBundle:", v9);

  if (objc_msgSend(v3, "mode") < 2 || objc_msgSend(v3, "mode") > 4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
    v12 = objc_msgSend(v11, "bundleState");

    if (v12)
      v10 = objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
    else
      v10 = objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
  }
  v13 = (void *)v10;
  -[MSDProgressUpdater setBundleInProgress:](self, "setBundleInProgress:", v10);

  v14 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
    v19 = 138543874;
    v20 = v16;
    v21 = 2114;
    v22 = v17;
    v23 = 2114;
    v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Bundles are: installedBundle:%{public}@ backgroundBundle:%{public}@ installingBundle:%{public}@", (uint8_t *)&v19, 0x20u);

  }
}

- (id)getContentStatus
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  _UNKNOWN **v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _UNKNOWN **v53;
  void *v54;
  char *v55;
  void *v56;
  char *v57;
  void *v58;
  char *v59;
  void *v60;
  char *v61;
  void *v62;
  void *v63;
  _UNKNOWN **v64;
  void *v66;
  _UNKNOWN **v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));

  v74 = v5;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hubSuppliedSettings"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Components")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "installedComponentList"));
    v15 = objc_msgSend(v14, "copy");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
    v17 = objc_msgSend(v16, "bundleState");

    objc_msgSend(v12, "removeObjectForKey:", CFSTR("ManifestVersion"));
    objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("ContentDetails"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v18, "preInstalledContent")));
    objc_msgSend(v6, "setObject:forKey:", v19, CFSTR("PreInstalledContent"));

    if ((v17 - 3) > 3u)
      v20 = &off_10014DA48;
    else
      v20 = off_10013F330[(char)(v17 - 3)];
    v75 = v6;
    objc_msgSend(v6, "setObject:forKey:", v20, CFSTR("Status"));
    v5 = v74;
    if (v66 && objc_msgSend(v66, "count"))
    {
      v68 = v7;
      v70 = v4;
      v72 = v3;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v24 = v66;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v78 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v29));
            if (v30)
              objc_msgSend(v22, "setObject:forKey:", v30, v29);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
        }
        while (v26);
      }

      v4 = v70;
      v3 = v72;
      v7 = v68;
      v5 = v74;
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v15));
    }

    v23 = v75;
  }
  else
  {
    v21 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", &__NSDictionary0__struct, CFSTR("ContentDetails"), 0, CFSTR("Status"), &__kCFBooleanFalse, CFSTR("PreInstalledContent"), 0));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    v23 = (void *)v21;
  }
  v76 = v23;
  objc_msgSend(v7, "setObject:forKey:");
  objc_msgSend(v7, "setObject:forKey:", v22, CFSTR("MSDDemoComponentsInstalled"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
  v32 = objc_msgSend(v31, "bundleType");

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
    v34 = objc_msgSend(v33, "bundleType");

    v71 = v4;
    v73 = v3;
    v69 = v7;
    if (v34 == 1)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "contentProgress"));
      objc_msgSend(v5, "setObject:forKey:", v36, CFSTR("DownloadingProgress"));

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "downloadedContentSource"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v38));

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bundleInfo"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v41));
      v43 = 0;
      v67 = &off_10014DA30;
    }
    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater bundleInProgress](self, "bundleInProgress"));
      v45 = objc_msgSend(v44, "bundleType");

      if (v45 != 2)
      {
        v39 = 0;
        v43 = 0;
        v42 = 0;
        v67 = 0;
LABEL_30:
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("remote")));
        v55 = (char *)objc_msgSend(v54, "integerValue");
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", CFSTR("remote")));
        v57 = &v55[(_QWORD)objc_msgSend(v56, "integerValue")];

        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("local")));
        v59 = (char *)objc_msgSend(v58, "integerValue");
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", CFSTR("local")));
        v61 = &v59[(_QWORD)objc_msgSend(v60, "integerValue")];

        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v57));
        v4 = v71;
        objc_msgSend(v71, "setObject:forKey:", v62, CFSTR("remote"));

        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v61));
        objc_msgSend(v71, "setObject:forKey:", v63, CFSTR("local"));

        v5 = v74;
        if (v42)
        {
          objc_msgSend(v42, "removeObjectForKey:", CFSTR("ManifestVersion"));
          objc_msgSend(v74, "setObject:forKey:", v42, CFSTR("ContentDetails"));
        }
        v3 = v73;
        if (objc_msgSend(v73, "criticalUpdatePrioritized"))
          v64 = &off_10014DA30;
        else
          v64 = &off_10014DA90;
        objc_msgSend(v74, "setObject:forKey:", v64, CFSTR("ComponentsType"));
        objc_msgSend(v74, "setObject:forKey:", v67, CFSTR("Status"));
        objc_msgSend(v74, "setObject:forKey:", v71, CFSTR("TotalBytesDownloaded"));
        v7 = v69;
        objc_msgSend(v69, "setObject:forKey:", v74, CFSTR("MSDDemoContentInProgress"));

        goto LABEL_36;
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "contentProgress"));
      objc_msgSend(v5, "setObject:forKey:", v47, CFSTR("InstallingProgress"));

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "downloadedContentSource"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v49));

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
      if (v50)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater backgroundBundle](self, "backgroundBundle"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "downloadedContentSource"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v52));

        v53 = &off_10014DA48;
      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("local"), &off_10014DA90, CFSTR("remote"), 0));
        v53 = &off_10014DA60;
      }
      v67 = v53;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installingBundle](self, "installingBundle"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bundleInfo"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v41));
    }

    goto LABEL_30;
  }
LABEL_36:

  return v7;
}

- (int64_t)getInternalStatus
{
  return -[MSDProgressUpdater currentStage](self, "currentStage");
}

- (id)getContentUpdateType
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));

  if (!v3)
    return CFSTR("ContentUpdateTypeFreshInstall");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProgressUpdater installedBundle](self, "installedBundle"));
  v5 = objc_msgSend(v4, "preInstalledContent");

  if (v5)
    return CFSTR("ContentUpdateTypeFreshInstallFactory");
  else
    return CFSTR("ContentUpdateTypeIncrementalUpdate");
}

- (void)demoUpdateFailed:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  MSDReportErrorRequest *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v5 = objc_msgSend(v4, "isOfflineMode");

  if ((v5 & 1) == 0)
  {
    v6 = objc_alloc_init(MSDReportErrorRequest);
    -[MSDReportErrorRequest setError:](v6, "setError:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handleRequestSync:", v6));

    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
      v12 = 136315394;
      v13 = "-[MSDProgressUpdater demoUpdateFailed:]";
      v14 = 2114;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: sent error status to hub; error=%{public}@",
        (uint8_t *)&v12,
        0x16u);

    }
  }

}

- (void)demoUpdateCompleted:(id)a3
{
  void *v3;
  MSDReportDoneRequest *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  if ((objc_msgSend(v3, "isOfflineMode") & 1) == 0)
  {
    v4 = objc_alloc_init(MSDReportDoneRequest);
    -[MSDReportDoneRequest setRequestStr:](v4, "setRequestStr:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSavedError"));
    -[MSDReportDoneRequest setError:](v4, "setError:", v5);

    -[MSDServerRequest setCompletion:](v4, "setCompletion:", &stru_10013F310);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](MSDServerRequestHandler, "sharedInstance"));
    objc_msgSend(v6, "handleRequestAsync:", v4);

  }
}

- (MSDBundleProgressTracker)backgroundBundle
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBackgroundBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MSDBundleProgressTracker)installedBundle
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInstalledBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MSDBundleProgressTracker)installingBundle
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstallingBundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (MSDBundleProgressTracker)bundleInProgress
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundleInProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)currentStage
{
  return self->_currentStage;
}

- (void)setCurrentStage:(int)a3
{
  self->_currentStage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleInProgress, 0);
  objc_storeStrong((id *)&self->_installingBundle, 0);
  objc_storeStrong((id *)&self->_installedBundle, 0);
  objc_storeStrong((id *)&self->_backgroundBundle, 0);
}

@end
