@implementation MapsRadarAttachmentProviderTask

- (MapsRadarAttachmentProviderTask)initWithRadarController:(id)a3
{
  id v5;
  MapsRadarAttachmentProviderTask *v6;
  id v7;
  NSObject *v8;
  NSBundle *v9;
  void *v10;
  NSString *v11;
  void *v12;
  id v13;
  const char *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *processingQueue;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;

  v5 = a3;
  if (!v5)
  {
    v20 = sub_1004318FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "-[MapsRadarAttachmentProviderTask initWithRadarController:]";
      v28 = 2080;
      v29 = "MapsRadarAttachmentProviderTask.m";
      v30 = 1024;
      v31 = 62;
      v32 = 2080;
      v33 = "radarController != nil";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v27 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)MapsRadarAttachmentProviderTask;
  v6 = -[MapsRadarAttachmentProviderTask init](&v25, "init");
  if (v6)
  {
    v7 = sub_1003BF910();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v27 = (const char *)v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.isolationQueue.%p"), v10, objc_opt_class(v6), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v13 = objc_retainAutorelease(v12);
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    v15 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_create(v14, v16);
    processingQueue = v6->_processingQueue;
    v6->_processingQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v6->_radarController, a3);
    -[MapsRadarController addAttachmentProvider:](v6->_radarController, "addAttachmentProvider:", v6);

  }
  return v6;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  MapsRadarAttachmentProviderTask *v7;

  v3 = sub_1003BF910();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  -[MapsRadarController removeAttachmentProvider:](self->_radarController, "removeAttachmentProvider:", self);
  v5.receiver = self;
  v5.super_class = (Class)MapsRadarAttachmentProviderTask;
  -[MapsRadarAttachmentProviderTask dealloc](&v5, "dealloc");
}

+ (BOOL)_isCarPlayMapView:(id)a3
{
  id v3;
  const char *label;
  const char *v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  v3 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v5 = dispatch_queue_get_label(0);
  if (label != v5)
  {
    v6 = !label || v5 == 0;
    if (v6 || strcmp(label, v5))
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316418;
        v18 = "+[MapsRadarAttachmentProviderTask _isCarPlayMapView:]";
        v19 = 2080;
        v20 = "MapsRadarAttachmentProviderTask.m";
        v21 = 1024;
        v22 = 84;
        v23 = 2080;
        v24 = "dispatch_get_main_queue()";
        v25 = 2080;
        v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v27 = 2080;
        v28 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v17,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v14 = sub_1004318FC();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v17 = 138412290;
          v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

        }
      }
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));
  v10 = v9 == v3;

  return v10;
}

+ (BOOL)_isMainScreenMapView:(id)a3
{
  id v3;
  const char *label;
  const char *v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  v3 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v5 = dispatch_queue_get_label(0);
  if (label != v5)
  {
    v6 = !label || v5 == 0;
    if (v6 || strcmp(label, v5))
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = 136316418;
        v18 = "+[MapsRadarAttachmentProviderTask _isMainScreenMapView:]";
        v19 = 2080;
        v20 = "MapsRadarAttachmentProviderTask.m";
        v21 = 1024;
        v22 = 90;
        v23 = 2080;
        v24 = "dispatch_get_main_queue()";
        v25 = 2080;
        v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v27 = 2080;
        v28 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v17,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v14 = sub_1004318FC();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v17 = 138412290;
          v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

        }
      }
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));
  v10 = v9 == v3;

  return v10;
}

+ (BOOL)getCurrentTileStateSnapshotWithDirectoryURL:(id *)a3 debugTreeURLs:(id *)a4 mapsActivityDataPath:(id *)a5 error:(id *)a6
{
  const char *label;
  const char *v12;
  BOOL v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  char *v27;
  id v28;
  NSObject *v29;
  char *v30;
  id v31;
  BOOL v32;
  void *v33;
  unsigned __int8 v34;
  id v35;
  id v36;
  NSObject *v37;
  char *v38;
  id v39;
  NSObject *v40;
  char *v41;
  unsigned __int8 v42;
  id v43;
  id v44;
  NSObject *v45;
  char *v46;
  id v47;
  NSObject *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  char *v57;
  id v58;
  NSObject *v59;
  char *v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  unsigned __int8 v77;
  id v78;
  id v79;
  NSObject *v80;
  char *v81;
  id v82;
  NSObject *v83;
  char *v84;
  void *v85;
  void *v86;
  void *v87;
  id v89;
  NSObject *v90;
  id v91;
  NSObject *v92;
  char *v93;
  void *v94;
  void *v95;
  id v96;
  unsigned __int8 v97;
  void *v98;
  id *v99;
  id *v100;
  id *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  id obj;
  void *v108;
  id v109;
  id v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  id v116;
  id v117;
  id v118;
  id v119;
  uint8_t v120[128];
  uint8_t buf[4];
  const char *v122;
  __int16 v123;
  const char *v124;
  __int16 v125;
  int v126;
  __int16 v127;
  const char *v128;
  __int16 v129;
  const char *v130;
  __int16 v131;
  const char *v132;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v12 = dispatch_queue_get_label(0);
  if (label != v12)
  {
    v13 = !label || v12 == 0;
    if (v13 || strcmp(label, v12))
    {
      v89 = sub_1004318FC();
      v90 = objc_claimAutoreleasedReturnValue(v89);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v122 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:]";
        v123 = 2080;
        v124 = "MapsRadarAttachmentProviderTask.m";
        v125 = 1024;
        v126 = 97;
        v127 = 2080;
        v128 = "dispatch_get_main_queue()";
        v129 = 2080;
        v130 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v131 = 2080;
        v132 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v91 = sub_1004318FC();
        v92 = objc_claimAutoreleasedReturnValue(v91);
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          v93 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v122 = v93;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v15 = objc_msgSend(v14, "isInternalInstall");

  if ((v15 & 1) != 0)
  {
    v110 = a1;
    v99 = a3;
    v100 = a4;
    v101 = a5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v17 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v103 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "components:fromDate:", 252, v17));

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("~/Library/Maps/StateSnapshots"), "stringByExpandingTildeInPath"));
    v102 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/State-%ld-%02ld-%02ld.%02ld-%02ld-%02ld"), v20, objc_msgSend(v19, "year"), objc_msgSend(v19, "month"), objc_msgSend(v19, "day"), objc_msgSend(v19, "hour"), objc_msgSend(v19, "minute"), objc_msgSend(v19, "second")));
    v119 = 0;
    v22 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v119);
    v23 = v119;
    v24 = v23;
    v104 = (void *)v20;
    v105 = v16;
    if ((v22 & 1) == 0 && v23)
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not create state snapshot directory %@"), v24));
        *(_DWORD *)buf = 136315906;
        v122 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:]";
        v123 = 2080;
        v124 = "MapsRadarAttachmentProviderTask.m";
        v125 = 1024;
        v126 = 129;
        v127 = 2112;
        v128 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

      }
      if (sub_100A70734())
      {
        v28 = sub_1004318FC();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v122 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      v31 = 0;
      v32 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v24);
      v86 = v102;
      v87 = (void *)v17;
LABEL_78:

      return v32;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v20));
    v118 = v24;
    v34 = objc_msgSend(v33, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsExcludedFromBackupKey, &v118);
    v35 = v118;

    if ((v34 & 1) == 0)
    {
      v36 = sub_1004318FC();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not exclude state snapshot directory %@ from backups: %@"), v20, v35));
        *(_DWORD *)buf = 136315906;
        v122 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:]";
        v123 = 2080;
        v124 = "MapsRadarAttachmentProviderTask.m";
        v125 = 1024;
        v126 = 141;
        v127 = 2112;
        v128 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

      }
      if (sub_100A70734())
      {
        v39 = sub_1004318FC();
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v122 = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/debugtree"), v21));
    v117 = v35;
    v42 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v24, 1, 0, &v117);
    v43 = v117;

    if ((v42 & 1) == 0 && v43)
    {
      v44 = sub_1004318FC();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not create debug tree directory %@"), v43));
        *(_DWORD *)buf = 136315906;
        v122 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:]";
        v123 = 2080;
        v124 = "MapsRadarAttachmentProviderTask.m";
        v125 = 1024;
        v126 = 147;
        v127 = 2112;
        v128 = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

      }
      if (sub_100A70734())
      {
        v47 = sub_1004318FC();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v122 = v49;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }

      v43 = 0;
    }
    v98 = v21;
    v50 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/MapsActivityData"), v21));
    v51 = objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v51, "mapsActivity"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "data"));

    v116 = v43;
    v95 = v53;
    v96 = (id)v50;
    LOBYTE(v51) = objc_msgSend(v53, "writeToFile:options:error:", v50, 1, &v116);
    v31 = v116;

    v54 = v110;
    v97 = v22;
    if ((v51 & 1) == 0 && v31)
    {
      v55 = sub_1004318FC();
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not write maps data to a file %@"), v31));
        *(_DWORD *)buf = 136315906;
        v122 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:]";
        v123 = 2080;
        v124 = "MapsRadarAttachmentProviderTask.m";
        v125 = 1024;
        v126 = 156;
        v127 = 2112;
        v128 = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

      }
      if (sub_100A70734())
      {
        v58 = sub_1004318FC();
        v59 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v122 = v60;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }

      v31 = 0;
    }
    v109 = objc_alloc_init((Class)NSMutableArray);
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "allVisibleMapViews"));
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
    if (!v61)
    {
LABEL_69:

      v21 = v98;
      if (v99)
        *v99 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v98));
      v86 = v102;
      v32 = v97;
      if (v100)
        *v100 = objc_msgSend(v109, "copy");
      if (v101)
        *v101 = objc_retainAutorelease(v96);

      v87 = v103;
      goto LABEL_78;
    }
    v62 = v61;
    v106 = 0;
    v63 = *(_QWORD *)v113;
    v108 = v24;
LABEL_47:
    v64 = 0;
    while (1)
    {
      if (*(_QWORD *)v113 != v63)
        objc_enumerationMutation(obj);
      if (!v24)
        goto LABEL_67;
      v65 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v64);
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingPathComponent:", CFSTR("debugtree")));
      if (objc_msgSend(v54, "_isMainScreenMapView:", v65))
        break;
      if (objc_msgSend(v54, "_isCarPlayMapView:", v65))
      {
        v67 = v66;
        v68 = CFSTR("-Car");
        goto LABEL_55;
      }
      v70 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-%lu"), v106 + v64));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "stringByAppendingString:", v70));

      v66 = (void *)v70;
LABEL_57:

      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "stringByAppendingPathExtension:", CFSTR("json")));
      v72 = objc_alloc_init((Class)VKDebugTree);
      objc_msgSend(v72, "enableAllOptions");
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "_mapLayer"));
      objc_msgSend(v72, "populateData:", v73);

      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "logTree"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "dataUsingEncoding:", 4));
      v76 = v75;
      if (!v75
        || (v111 = v31,
            v77 = objc_msgSend(v75, "writeToFile:options:error:", v71, 0, &v111),
            v78 = v111,
            v31,
            v31 = v78,
            (v77 & 1) == 0))
      {
        v79 = sub_1004318FC();
        v80 = objc_claimAutoreleasedReturnValue(v79);
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          v81 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not write debugtree to a file %@"), v31));
          *(_DWORD *)buf = 136315906;
          v122 = "+[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivit"
                 "yDataPath:error:]";
          v123 = 2080;
          v124 = "MapsRadarAttachmentProviderTask.m";
          v125 = 1024;
          v126 = 189;
          v127 = 2112;
          v128 = v81;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

        }
        if (sub_100A70734())
        {
          v82 = sub_1004318FC();
          v83 = objc_claimAutoreleasedReturnValue(v82);
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          {
            v84 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v122 = v84;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }

        v78 = 0;
      }
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v71));
      objc_msgSend(v109, "addObject:", v85);

      v31 = v78;
      v54 = v110;
      v24 = v108;
LABEL_67:
      if (v62 == (id)++v64)
      {
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
        v106 += v64;
        if (!v62)
          goto LABEL_69;
        goto LABEL_47;
      }
    }
    v67 = v66;
    v68 = CFSTR("-Main");
LABEL_55:
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "stringByAppendingString:", v68));
    goto LABEL_57;
  }
  v32 = 0;
  if (a6)
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3072, 0));
  return v32;
}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *processingQueue;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  char *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  NSObject *v33;
  _QWORD v34[4];
  id v35;
  NSObject *v36;
  _QWORD v37[4];
  id v38;
  NSObject *v39;
  _QWORD v40[4];
  id v41;
  NSObject *v42;
  _QWORD v43[4];
  id v44;
  NSObject *v45;
  _QWORD v46[4];
  id v47;
  NSObject *v48;
  _QWORD block[4];
  id v50;
  NSObject *v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  const char *v63;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v53 = "-[MapsRadarAttachmentProviderTask generateAttachmentsForRadarDraft:withCompletion:]";
        v54 = 2080;
        v55 = "MapsRadarAttachmentProviderTask.m";
        v56 = 1024;
        v57 = 220;
        v58 = 2080;
        v59 = "dispatch_get_main_queue()";
        v60 = 2080;
        v61 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v62 = 2080;
        v63 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v23 = sub_1004318FC();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v53 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v11 = dispatch_group_create();
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (GEOConfigGetBOOL(MapsConfig_EnableTapToRadarUIViewControllerDescriptionsAttachmentProvider, off_1014B4B58))
  {
    dispatch_group_enter(v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003C11A0;
    block[3] = &unk_1011AC8B0;
    v50 = v12;
    v51 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  if (GEOConfigGetBOOL(MapsConfig_EnableTapToRadarStateAttachmentProvider, off_1014B4B68))
  {
    dispatch_group_enter(v11);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1003C1264;
    v46[3] = &unk_1011AC8B0;
    v47 = v12;
    v48 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v46);

  }
  if (GEOConfigGetBOOL(MapsConfig_EnableTapToRadarMSgAttachmentProvider, off_1014B4B78))
  {
    dispatch_group_enter(v11);
    processingQueue = self->_processingQueue;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1003C15D8;
    v43[3] = &unk_1011AC8B0;
    v44 = v12;
    v45 = v11;
    dispatch_async(processingQueue, v43);

  }
  if (GEOConfigGetBOOL(MapsConfig_EnableTapToRadarMSPAttachmentProvider, off_1014B4B88))
  {
    dispatch_group_enter(v11);
    v15 = self->_processingQueue;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1003C1908;
    v40[3] = &unk_1011AC8B0;
    v41 = v12;
    v42 = v11;
    dispatch_async(v15, v40);

  }
  if (GEOConfigGetBOOL(MapsConfig_EnableTapToRadarUserDefaultsAttachmentProvider, off_1014B4B98))
  {
    dispatch_group_enter(v11);
    v16 = self->_processingQueue;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1003C1C90;
    v37[3] = &unk_1011AC8B0;
    v38 = v12;
    v39 = v11;
    dispatch_async(v16, v37);

  }
  if (GEOConfigGetBOOL(MapsConfig_EnableTapToRadarViewHierarchyAttachmentProvider, off_1014B50B8))
  {
    dispatch_group_enter(v11);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1003C1E98;
    v34[3] = &unk_1011AC8B0;
    v35 = v12;
    v36 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v34);

  }
  if (GEOConfigGetBOOL(MapsConfig_EnableTapToRadarSceneStateAttachmentProvider, off_1014B54B8))
  {
    dispatch_group_enter(v11);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1003C2438;
    v31[3] = &unk_1011AC8B0;
    v32 = v12;
    v33 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v31);

  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1003C2608;
  v26[3] = &unk_1011B4320;
  v27 = v6;
  v28 = v12;
  v29 = v13;
  v30 = v7;
  v17 = v7;
  v18 = v13;
  v19 = v12;
  v20 = v6;
  dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, v26);

}

+ (int64_t)creationPreference
{
  return 1;
}

- (MapsRadarController)radarController
{
  return self->_radarController;
}

- (void)setRadarController:(id)a3
{
  objc_storeStrong((id *)&self->_radarController, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_radarController, 0);
}

@end
