@implementation MapsRadarDraft

- (NSURL)tapToRadarURL
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  const __CFString *v16;
  id v17;
  unint64_t v18;
  const __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;

  v3 = objc_alloc_init((Class)NSURLComponents);
  objc_msgSend(v3, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v3, "setHost:", CFSTR("new"));
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = objc_alloc((Class)NSURLQueryItem);
  v6 = objc_claimAutoreleasedReturnValue(-[MapsRadarDraft title](self, "title"));
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1011EB268;
  v9 = objc_msgSend(v5, "initWithName:value:", CFSTR("Title"), v8);
  objc_msgSend(v4, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft descriptionText](self, "descriptionText"));
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    v12 = objc_alloc((Class)NSURLQueryItem);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft descriptionText](self, "descriptionText"));
    v14 = objc_msgSend(v12, "initWithName:value:", CFSTR("Description"), v13);
    objc_msgSend(v4, "addObject:", v14);

  }
  if (-[MapsRadarDraft classification](self, "classification"))
  {
    v15 = -[MapsRadarDraft classification](self, "classification");
    if (v15 > 0xA)
      v16 = CFSTR("Security");
    else
      v16 = off_1011B9768[v15];
    v17 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Classification"), v16);
    objc_msgSend(v4, "addObject:", v17);

  }
  if (-[MapsRadarDraft reproducibility](self, "reproducibility"))
  {
    v18 = -[MapsRadarDraft reproducibility](self, "reproducibility");
    if (v18 > 6)
      v19 = CFSTR("Always");
    else
      v19 = off_1011B97C0[v18];
    v20 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Reproducibility"), v19);
    objc_msgSend(v4, "addObject:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft attachments](self, "attachments"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft screenshots](self, "screenshots"));
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    v24 = objc_alloc((Class)NSURLQueryItem);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft screenshots](self, "screenshots"));
    v26 = sub_10039DCD4(v25, &stru_1011B96A8);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "componentsJoinedByString:", CFSTR(",")));
    v29 = objc_msgSend(v24, "initWithName:value:", CFSTR("Screenshot"), v28);
    objc_msgSend(v4, "addObject:", v29);

  }
  if (objc_msgSend(v21, "count"))
  {
    v30 = objc_alloc((Class)NSURLQueryItem);
    v31 = sub_10039DCD4(v21, &stru_1011B96E8);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "componentsJoinedByString:", CFSTR(",")));
    v34 = objc_msgSend(v30, "initWithName:value:", CFSTR("Attachments"), v33);
    objc_msgSend(v4, "addObject:", v34);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft keywords](self, "keywords"));
  v36 = objc_msgSend(v35, "count");

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft keywords](self, "keywords"));
    v38 = sub_10039DCD4(v37, &stru_1011B9728);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v39));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allObjects"));

    v42 = objc_alloc((Class)NSURLQueryItem);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "componentsJoinedByString:", CFSTR(",")));
    v44 = objc_msgSend(v42, "initWithName:value:", CFSTR("Keywords"), v43);
    objc_msgSend(v4, "addObject:", v44);

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft component](self, "component"));

  if (v45)
  {
    v46 = objc_alloc((Class)NSURLQueryItem);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft component](self, "component"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
    v49 = objc_msgSend(v46, "initWithName:value:", CFSTR("ComponentName"), v48);
    objc_msgSend(v4, "addObject:", v49);

    v50 = objc_alloc((Class)NSURLQueryItem);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft component](self, "component"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "version"));
    v53 = objc_msgSend(v50, "initWithName:value:", CFSTR("ComponentVersion"), v52);
    objc_msgSend(v4, "addObject:", v53);

    v54 = objc_alloc((Class)NSURLQueryItem);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft component](self, "component"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "ID"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "stringValue"));
    v58 = objc_msgSend(v54, "initWithName:value:", CFSTR("ComponentID"), v57);
    objc_msgSend(v4, "addObject:", v58);

  }
  if (-[MapsRadarDraft collectFullLogArchive](self, "collectFullLogArchive"))
  {
    v59 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("full-log-archive"));
    objc_msgSend(v4, "addObject:", v59);

  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft collaborationContactHandles](self, "collaborationContactHandles"));
  v61 = objc_msgSend(v60, "count");

  if (v61)
  {
    v62 = objc_alloc((Class)NSURLQueryItem);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft collaborationContactHandles](self, "collaborationContactHandles"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "componentsJoinedByString:", CFSTR(",")));
    v65 = objc_msgSend(v62, "initWithName:value:", CFSTR("CollaborationContactHandles"), v64);
    objc_msgSend(v4, "addObject:", v65);

  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft deviceClasses](self, "deviceClasses"));
  v67 = objc_msgSend(v66, "count");

  if (v67)
  {
    v68 = objc_alloc((Class)NSURLQueryItem);
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft deviceClasses](self, "deviceClasses"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "componentsJoinedByString:", CFSTR(",")));
    v71 = objc_msgSend(v68, "initWithName:value:", CFSTR("DeviceClasses"), v70);
    objc_msgSend(v4, "addObject:", v71);

  }
  v72 = objc_alloc((Class)NSURLQueryItem);
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bundleIdentifier"));
  v75 = objc_msgSend(v72, "initWithName:value:", CFSTR("BundleID"), v74);
  objc_msgSend(v4, "addObject:", v75);

  v76 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("DeleteOnAttach"), CFSTR("1"));
  objc_msgSend(v4, "addObject:", v76);

  v77 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("IncludeDevicePrefixInTitle"), CFSTR("1"));
  objc_msgSend(v4, "addObject:", v77);

  v78 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("ExtensionIdentifiers"), CFSTR("com.apple.DiagnosticExtensions.StackShot,com.apple.DiagnosticExtensions.Syslog,com.apple.DiagnosticExtensions.CrashLogs"));
  objc_msgSend(v4, "addObject:", v78);

  if (qword_1014D2738 != -1)
    dispatch_once(&qword_1014D2738, &stru_1011B9748);
  v79 = objc_alloc((Class)NSURLQueryItem);
  v80 = (void *)qword_1014D2730;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft timeOfIssue](self, "timeOfIssue"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "stringFromDate:", v81));
  v83 = objc_msgSend(v79, "initWithName:value:", CFSTR("TimeOfIssue"), v82);
  objc_msgSend(v4, "addObject:", v83);

  objc_msgSend(v3, "setQueryItems:", v4);
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

  return (NSURL *)v84;
}

- (MapsRadarDraft)init
{
  MapsRadarDraft *v2;
  uint64_t v3;
  NSDate *timeOfIssue;
  void *v5;
  uint64_t v6;
  CLLocation *locationOfIssue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MapsRadarDraft;
  v2 = -[MapsRadarDraft init](&v9, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    timeOfIssue = v2->_timeOfIssue;
    v2->_timeOfIssue = (NSDate *)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastLocation"));
    locationOfIssue = v2->_locationOfIssue;
    v2->_locationOfIssue = (CLLocation *)v6;

    v2->_collectFullLogArchive = GEOConfigGetBOOL(MapsConfig_EnableTapToRadarLogArchiveFull, off_1014B4BD8);
  }
  return v2;
}

- (NSString)descriptionText
{
  const __CFString *descriptionText;
  void *v4;
  CLLocation *locationOfIssue;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (self->_descriptionText)
    descriptionText = (const __CFString *)self->_descriptionText;
  else
    descriptionText = &stru_1011EB268;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", descriptionText));
  locationOfIssue = self->_locationOfIssue;
  if (locationOfIssue)
  {
    -[CLLocation coordinate](locationOfIssue, "coordinate");
    v7 = v6;
    -[CLLocation coordinate](self->_locationOfIssue, "coordinate");
    objc_msgSend(v4, "appendFormat:", CFSTR("\nDevice location: %f, %f"), v7, v8);
  }
  return (NSString *)v4;
}

- (NSArray)attachments
{
  if (self->_attachments)
    return self->_attachments;
  else
    return (NSArray *)&__NSArray0__struct;
}

- (NSArray)screenshots
{
  if (self->_screenshots)
    return self->_screenshots;
  else
    return (NSArray *)&__NSArray0__struct;
}

- (NSArray)keywords
{
  if (self->_keywords)
    return self->_keywords;
  else
    return (NSArray *)&__NSArray0__struct;
}

- (NSArray)collaborationContactHandles
{
  if (self->_collaborationContactHandles)
    return self->_collaborationContactHandles;
  else
    return (NSArray *)&__NSArray0__struct;
}

- (NSArray)deviceClasses
{
  if (self->_deviceClasses)
    return self->_deviceClasses;
  else
    return (NSArray *)&__NSArray0__struct;
}

- (void)addAttachment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v4 = a3;
  if (!v4)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v13 = "-[MapsRadarDraft addAttachment:]";
      v14 = 2080;
      v15 = "MapsRadarDraft.m";
      v16 = 1024;
      v17 = 79;
      v18 = 2080;
      v19 = "attachment != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  -[MapsRadarDraft addAttachments:](self, "addAttachments:", v5);

}

- (void)addAttachments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v4 = a3;
  if (!v4)
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315906;
      v13 = "-[MapsRadarDraft addAttachments:]";
      v14 = 2080;
      v15 = "MapsRadarDraft.m";
      v16 = 1024;
      v17 = 85;
      v18 = 2080;
      v19 = "attachments != nil";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft attachments](self, "attachments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4));
  -[MapsRadarDraft setAttachments:](self, "setAttachments:", v6);

}

- (void)addScreenshot:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v4 = a3;
  if (!v4)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v13 = "-[MapsRadarDraft addScreenshot:]";
      v14 = 2080;
      v15 = "MapsRadarDraft.m";
      v16 = 1024;
      v17 = 91;
      v18 = 2080;
      v19 = "screenshot != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  -[MapsRadarDraft addScreenshots:](self, "addScreenshots:", v5);

}

- (void)addScreenshots:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v4 = a3;
  if (!v4)
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315906;
      v13 = "-[MapsRadarDraft addScreenshots:]";
      v14 = 2080;
      v15 = "MapsRadarDraft.m";
      v16 = 1024;
      v17 = 97;
      v18 = 2080;
      v19 = "screenshots != nil";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft screenshots](self, "screenshots"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4));
  -[MapsRadarDraft setScreenshots:](self, "setScreenshots:", v6);

}

- (void)addKeyword:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v4 = a3;
  if (!v4)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v13 = "-[MapsRadarDraft addKeyword:]";
      v14 = 2080;
      v15 = "MapsRadarDraft.m";
      v16 = 1024;
      v17 = 103;
      v18 = 2080;
      v19 = "keyword != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  -[MapsRadarDraft addKeywords:](self, "addKeywords:", v5);

}

- (void)addKeywords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v4 = a3;
  if (!v4)
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315906;
      v13 = "-[MapsRadarDraft addKeywords:]";
      v14 = 2080;
      v15 = "MapsRadarDraft.m";
      v16 = 1024;
      v17 = 109;
      v18 = 2080;
      v19 = "keywords != nil";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft keywords](self, "keywords"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4));
  -[MapsRadarDraft setKeywords:](self, "setKeywords:", v6);

}

- (void)addCollaborationContactHandle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v4 = a3;
  if (!v4)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v13 = "-[MapsRadarDraft addCollaborationContactHandle:]";
      v14 = 2080;
      v15 = "MapsRadarDraft.m";
      v16 = 1024;
      v17 = 115;
      v18 = 2080;
      v19 = "collaborationContactHandle != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  -[MapsRadarDraft addCollaborationContactHandles:](self, "addCollaborationContactHandles:", v5);

}

- (void)addCollaborationContactHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v4 = a3;
  if (!v4)
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315906;
      v13 = "-[MapsRadarDraft addCollaborationContactHandles:]";
      v14 = 2080;
      v15 = "MapsRadarDraft.m";
      v16 = 1024;
      v17 = 121;
      v18 = 2080;
      v19 = "collaborationContactHandles != nil";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft collaborationContactHandles](self, "collaborationContactHandles"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4));
  -[MapsRadarDraft setCollaborationContactHandles:](self, "setCollaborationContactHandles:", v6);

}

- (void)addDeviceClass:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v4 = a3;
  if (!v4)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v13 = "-[MapsRadarDraft addDeviceClass:]";
      v14 = 2080;
      v15 = "MapsRadarDraft.m";
      v16 = 1024;
      v17 = 127;
      v18 = 2080;
      v19 = "deviceClass != nil";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  -[MapsRadarDraft addDeviceClasses:](self, "addDeviceClasses:", v5);

}

- (void)addDeviceClasses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v4 = a3;
  if (!v4)
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315906;
      v13 = "-[MapsRadarDraft addDeviceClasses:]";
      v14 = 2080;
      v15 = "MapsRadarDraft.m";
      v16 = 1024;
      v17 = 133;
      v18 = 2080;
      v19 = "deviceClasses != nil";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft deviceClasses](self, "deviceClasses"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4));
  -[MapsRadarDraft setDeviceClasses:](self, "setDeviceClasses:", v6);

}

- (NSString)description
{
  MapsRadarDraft *v2;
  id v3;
  void ***v4;
  MapsRadarDraft *v5;
  MapsRadarDraft *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1008E6128;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[MapsRadarDraft _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v12, v13));

  return (NSString *)v14;
}

- (NSString)debugDescription
{
  MapsRadarDraft *v2;
  id v3;
  void ***v4;
  MapsRadarDraft *v5;
  MapsRadarDraft *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1008E62A8;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[MapsRadarDraft _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarDraft performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v12, v13));

  return (NSString *)v14;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  unint64_t classification;
  const __CFString *v5;
  unint64_t reproducibility;
  const __CFString *v7;
  void (**v8)(id, const __CFString *, NSString *);

  v8 = (void (**)(id, const __CFString *, NSString *))a3;
  v8[2](v8, CFSTR("title"), self->_title);
  v8[2](v8, CFSTR("descriptionText"), self->_descriptionText);
  v8[2](v8, CFSTR("component"), (NSString *)&self->_component->super.isa);
  classification = self->_classification;
  if (classification > 0xA)
    v5 = CFSTR("Security");
  else
    v5 = *(&off_1011DB468 + classification);
  v8[2](v8, CFSTR("classification"), &v5->isa);
  reproducibility = self->_reproducibility;
  if (reproducibility > 6)
    v7 = CFSTR("Always");
  else
    v7 = *(&off_1011DB4C0 + reproducibility);
  v8[2](v8, CFSTR("reproducibility"), &v7->isa);
  v8[2](v8, CFSTR("keywords"), (NSString *)&self->_keywords->super.isa);
  v8[2](v8, CFSTR("attachments"), (NSString *)&self->_attachments->super.isa);
  v8[2](v8, CFSTR("screenshots"), (NSString *)&self->_screenshots->super.isa);
  v8[2](v8, CFSTR("time of issue"), (NSString *)&self->_timeOfIssue->super.isa);
  v8[2](v8, CFSTR("location of issue"), (NSString *)&self->_locationOfIssue->super.isa);
  v8[2](v8, CFSTR("collaborationContactHandles"), (NSString *)&self->_collaborationContactHandles->super.isa);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MapsRadarComponent)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
  objc_storeStrong((id *)&self->_component, a3);
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (int64_t)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(int64_t)a3
{
  self->_reproducibility = a3;
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setScreenshots:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)timeOfIssue
{
  return self->_timeOfIssue;
}

- (CLLocation)locationOfIssue
{
  return self->_locationOfIssue;
}

- (BOOL)collectFullLogArchive
{
  return self->_collectFullLogArchive;
}

- (void)setCollectFullLogArchive:(BOOL)a3
{
  self->_collectFullLogArchive = a3;
}

- (void)setCollaborationContactHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setDeviceClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClasses, 0);
  objc_storeStrong((id *)&self->_collaborationContactHandles, 0);
  objc_storeStrong((id *)&self->_locationOfIssue, 0);
  objc_storeStrong((id *)&self->_timeOfIssue, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
