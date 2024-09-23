@implementation SDUnitLogRule

- (SDUnitLogRule)initWithDate:(id)a3 withFilter:(id)a4 newestFileCount:(unint64_t)a5 atInternalDirectory:(id)a6 withRuntimeChecks:(unint64_t)a7
{
  id v12;
  id v13;
  __CFString *v14;
  SDUnitLogRule *v15;
  SDUnitLogRule *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = (__CFString *)a6;
  v21.receiver = self;
  v21.super_class = (Class)SDUnitLogRule;
  v15 = -[SDUnitLogRule init](&v21, "init");
  v16 = v15;
  if (v15)
  {
    -[SDUnitLogRule setCreatedSince:](v15, "setCreatedSince:", v12);
    -[SDUnitLogRule setFilter:](v16, "setFilter:", v13);
    -[SDUnitLogRule setNewestFileLimit:](v16, "setNewestFileLimit:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a5));
    -[SDUnitLogRule setLogArray:](v16, "setLogArray:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a5));
    -[SDUnitLogRule setLogDates:](v16, "setLogDates:", v18);

    if (v14)
      v19 = v14;
    else
      v19 = CFSTR(".");
    -[SDUnitLogRule setRelative:](v16, "setRelative:", v19);
    -[SDUnitLogRule setMaxDepth:](v16, "setMaxDepth:", 1024);
    -[SDUnit setRuntimeChecks:](v16, "setRuntimeChecks:", a7);
    -[SDUnitLogRule setMobileContainerClass:](v16, "setMobileContainerClass:", 0);
    -[SDUnitLogRule setMobileContainer:](v16, "setMobileContainer:", 0);
    -[SDUnitLogRule setMatchEnumerator:](v16, "setMatchEnumerator:", 0);
    -[SDUnitLogRule setHeadDir:](v16, "setHeadDir:", CFSTR("."));
    -[SDUnitLogRule setResolveHomeDirs:](v16, "setResolveHomeDirs:", 1);
    -[SDUnitLogRule setPipelineFlush:](v16, "setPipelineFlush:", 0);
    -[SDUnitLogRule setOffsets:](v16, "setOffsets:", 0);
    -[SDUnitLogRule setSizes:](v16, "setSizes:", 0);
  }

  return v16;
}

- (id)getNextMatch
{
  return 0;
}

- (id)advanceMatchEnumerator
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    while (1)
    {
      v6 = v5;
      v7 = objc_autoreleasePoolPush();
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getNextMatch"));
      if (v9)
        break;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
      objc_msgSend(v10, "removeObjectAtIndex:", 0);

      objc_autoreleasePoolPop(v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
      v12 = objc_msgSend(v11, "count");

      if (!v12)
      {
        v13 = 0;
        goto LABEL_8;
      }
    }
    v13 = v9;
    objc_autoreleasePoolPop(v7);

    v5 = v13;
LABEL_8:

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (BOOL)considerURL:(id)a3 forRejection:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  unint64_t v13;
  void *v15;
  void *v16;
  int v17;
  unsigned int v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  id v32;
  unint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  double v57;
  int v58;
  void *v59;
  double v60;
  const char *v61;
  void *v62;
  NSObject *v63;
  uint32_t v64;
  void *v65;
  double v66;
  int v67;
  double v68;
  id v69;
  id v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  _BYTE v74[10];

  v6 = a3;
  v7 = v6;
  if (!v6 || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path")), v8, !v8))
  {
    v12 = 0;
    v13 = 1;
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if (!v11)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v17 = objc_msgSend(v15, "fileExistsAtPath:", v16);

    if ((v17 & 1) == 0)
    {
      v42 = sub_100026C34();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
        *(_DWORD *)buf = 138412290;
        v72 = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%@ failed due to file not found", buf, 0xCu);

      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
      objc_msgSend(v45, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("%@ failed due to file not found"), v46);

      v12 = 0;
      v13 = 10;
      goto LABEL_6;
    }
    v70 = 0;
    v69 = 0;
    v18 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v70, NSURLCreationDateKey, &v69);
    v19 = v70;
    v20 = v69;
    if (!v18 || !v19)
    {
      v47 = sub_100026C34();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedDescription"));
        *(_DWORD *)buf = 138412546;
        v72 = v49;
        v73 = 2112;
        *(_QWORD *)v74 = v50;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%@ failed to get date with error %@", buf, 0x16u);

      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedDescription"));
      objc_msgSend(v51, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("%@ failed to get date with error %@"), v52, v53);

      v12 = 0;
      *a4 = 5;
      goto LABEL_36;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdSince](self, "createdSince"));

    if (v21
      && (v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdSince](self, "createdSince")),
          v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "earlierDate:", v22)),
          v23,
          v22,
          v23 == v19))
    {
      *a4 = 6;
      v54 = sub_100026C34();
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
      objc_msgSend(v19, "timeIntervalSince1970");
      v58 = (int)v57;
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdSince](self, "createdSince"));
      objc_msgSend(v59, "timeIntervalSince1970");
      *(_DWORD *)buf = 138412802;
      v72 = v56;
      v73 = 1024;
      *(_DWORD *)v74 = v58;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = (int)v60;
      v61 = "%@ failed to pass date test %{time_t}d < %{time_t}d ";
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdUntil](self, "createdUntil"));

      if (!v24
        || (v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdUntil](self, "createdUntil")),
            v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "laterDate:", v25)),
            v26,
            v25,
            v26 != v19))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule filter](self, "filter"));

        if (!v27
          || (v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule filter](self, "filter")),
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path")),
              v30 = objc_msgSend(v28, "evaluateWithObject:", v29),
              v29,
              v28,
              (v30 & 1) != 0))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
          v32 = objc_msgSend(v31, "count");

          v33 = 0;
          if (v32)
          {
            do
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logDates](self, "logDates"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", v33));
              v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "laterDate:", v19));

              if (v36 == v19)
                break;
              ++v33;
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
              v38 = objc_msgSend(v37, "count");

            }
            while ((unint64_t)v38 > v33);
          }
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
          objc_msgSend(v39, "insertObject:atIndex:", v40, v33);

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logDates](self, "logDates"));
          objc_msgSend(v41, "insertObject:atIndex:", v19, v33);

          v12 = 1;
          goto LABEL_36;
        }
        *a4 = 8;
        v62 = sub_100026C34();
        v55 = objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule filter](self, "filter"));
          *(_DWORD *)buf = 138412546;
          v72 = v56;
          v73 = 2112;
          *(_QWORD *)v74 = v59;
          v61 = "%@ failed to pass predicate %@ ";
          v63 = v55;
          v64 = 22;
LABEL_34:
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, v61, buf, v64);

        }
LABEL_35:

        v12 = 0;
LABEL_36:

        goto LABEL_7;
      }
      *a4 = 6;
      v65 = sub_100026C34();
      v55 = objc_claimAutoreleasedReturnValue(v65);
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
      objc_msgSend(v19, "timeIntervalSince1970");
      v67 = (int)v66;
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule createdUntil](self, "createdUntil"));
      objc_msgSend(v59, "timeIntervalSince1970");
      *(_DWORD *)buf = 138412802;
      v72 = v56;
      v73 = 1024;
      *(_DWORD *)v74 = v67;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = (int)v68;
      v61 = "%@ failed to pass date test %{time_t}d < %{time_t}d ";
    }
    v63 = v55;
    v64 = 24;
    goto LABEL_34;
  }
  v12 = 0;
  v13 = 9;
LABEL_6:
  *a4 = v13;
LABEL_7:

  return v12;
}

- (id)applyFilters
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  unsigned int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[SDUnitLogRule newestFileLimit](self, "newestFileLimit"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
    v5 = objc_msgSend(v4, "count");
    v6 = -[SDUnitLogRule newestFileLimit](self, "newestFileLimit");

    if ((unint64_t)v5 > v6)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
      v7 = objc_msgSend((id)v8, "count");

      LODWORD(v8) = v7 - 1;
      if (-[SDUnitLogRule newestFileLimit](self, "newestFileLimit") <= (int)(v7 - 1))
      {
        v8 = (int)v8;
        do
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v8));

          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
          objc_msgSend(v11, "removeLastObject");

          v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logDates](self, "logDates"));
          objc_msgSend(v12, "removeLastObject");

          objc_msgSend(v3, "addObject:", v10);
          --v8;
        }
        while (-[SDUnitLogRule newestFileLimit](self, "newestFileLimit") <= v8);
      }
    }
  }
  return v3;
}

- (void)_getNextVariedSet:(id)a3 withLogs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
        objc_msgSend(v7, "addObject:", v15);

        objc_msgSend(v14, "removeLastObject");
        if (!objc_msgSend(v14, "count"))
          objc_msgSend(v5, "removeObjectForKey:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingSelector:", "compareLogDateDescending:"));
  objc_msgSend(v6, "addObjectsFromArray:", v16);

}

- (void)generateMaxVariety:(id)a3 withLogs:(id)a4 withHighPriority:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  id v45;
  void *v46;
  id obj;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  id v56;
  id v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;

  v7 = a3;
  v45 = a4;
  v44 = a5;
  v57 = 0;
  v8 = objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("[.]synced$"), 1, &v57));
  v9 = v57;
  v50 = (void *)v8;
  if (!v8)
  {
    v10 = sub_100026C34();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v60 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to compile generateMaxVariety::syncedRegex with error: %@", buf, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
    objc_msgSend(v13, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to compile generateMaxVariety::syncedRegex with error: %@"), v14);

    v9 = 0;
  }
  v56 = v9;
  v15 = objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("[.][0-9]{3}[.]ips"), 1, &v56));
  v16 = v56;

  v49 = (void *)v15;
  if (!v15)
  {
    v17 = sub_100026C34();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v60 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed to compile generateMaxVariety::stackTripleRegex with error: %@", buf, 0xCu);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedDescription"));
    objc_msgSend(v20, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to compile generateMaxVariety::stackTripleRegex with error: %@"), v21);

    v16 = 0;
  }
  v55 = v16;
  v22 = objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("([0-9]{4}(-|_)[0-9]{2}(-|_)[0-9]{2}(-|_)([0-9]{6}|[0-9]{2}(-|_)[0-9]{2}(-|_)[0-9]{2}))"), 1, &v55));
  v23 = v55;

  v48 = (void *)v22;
  if (!v22)
  {
    v24 = sub_100026C34();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v60 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to compile generateMaxVariety::regex with error: %@", buf, 0xCu);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedDescription"));
    objc_msgSend(v27, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to compile generateMaxVariety::regex with error: %@"), v28);

    v23 = 0;
  }
  v42 = v23;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v46 = v7;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseObjectEnumerator"));
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        v35 = objc_autoreleasePoolPush();
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "path"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "path"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "stringByReplacingMatchesInString:options:range:withTemplate:", v36, 0, 0, objc_msgSend(v37, "length"), &stru_10009DC10));

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "stringByReplacingMatchesInString:options:range:withTemplate:", v38, 0, 0, objc_msgSend(v38, "length"), CFSTR(".ips")));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringByReplacingMatchesInString:options:range:withTemplate:", v39, 0, 0, objc_msgSend(v39, "length"), &stru_10009DC10));

        if (v40)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", v40));
          if (v41
            || (v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array")),
                objc_msgSend(v29, "setObject:forKey:", v41, v40),
                v41))
          {
            objc_msgSend(v41, "addObject:", v34);

          }
        }

        objc_autoreleasePoolPop(v35);
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v31);
  }

  -[SDUnitLogRule _getNextVariedSet:withLogs:](self, "_getNextVariedSet:withLogs:", v29, v44);
  while (objc_msgSend(v29, "count"))
    -[SDUnitLogRule _getNextVariedSet:withLogs:](self, "_getNextVariedSet:withLogs:", v29, v45);

}

- (void)addPathsToArray:(id)a3 withHighPriority:(id)a4 withMaxVariety:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;
  SDLog *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  SDLog *v29;
  void *v30;
  void *v31;
  SDLog *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  id v40;
  id v41;
  void *v42;
  void *v43;

  v5 = a5;
  v41 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule headDir](self, "headDir"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "standardizedURL"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v39 = v5;
    v43 = v9;
    v40 = v8;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    do
    {
      v20 = v16;
      v21 = objc_autoreleasePoolPush();
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v15));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByDeletingLastPathComponent"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule headDir](self, "headDir"));
      LODWORD(v23) = objc_msgSend(v24, "isEqualToString:", CFSTR("."));

      if ((_DWORD)v23)
      {
        v25 = v19;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule headDir](self, "headDir"));
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsSeparatedByString:", v42));
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastObject"));

        v19 = (void *)v26;
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule relative](self, "relative"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingPathComponent:", v19));

      v29 = [SDLog alloc];
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", v15));
      v32 = -[SDLog initWithPath:subdirectory:error:](v29, "initWithPath:subdirectory:error:", v31, v28, 0);

      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule offsets](self, "offsets"));
        -[SDLog setOffsets:](v32, "setOffsets:", v33);

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule sizes](self, "sizes"));
        -[SDLog setSizes:](v32, "setSizes:", v34);

        objc_msgSend(v43, "addObject:", v32);
      }
      objc_autoreleasePoolPop(v21);
      ++v15;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
      v36 = objc_msgSend(v35, "count");

      v17 = v32;
      v18 = v28;
    }
    while ((unint64_t)v36 > v15);

    v8 = v40;
    v9 = v43;
    v5 = v39;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
  objc_msgSend(v37, "removeAllObjects");

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logDates](self, "logDates"));
  objc_msgSend(v38, "removeAllObjects");

  if (v5)
    -[SDUnitLogRule generateMaxVariety:withLogs:withHighPriority:](self, "generateMaxVariety:withLogs:withHighPriority:", v9, v41, v8);
  else
    objc_msgSend(v41, "addObjectsFromArray:", v9);

}

- (id)_localUserHomeDirectories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (sub_100026AF8())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/private/var/Users"), 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 7, &stru_100099080));

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
          v12 = objc_autoreleasePoolPush();
          objc_msgSend(v2, "addObject:", v11, (_QWORD)v14);
          objc_autoreleasePoolPop(v12);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/private/var/mobile/"), 1));
    objc_msgSend(v2, "addObject:", v6);
  }

  return v2;
}

- (id)resolvePathToMobileContainer:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  __CFString *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  uint64_t v29;

  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("~"))
    && (objc_msgSend(v4, "hasPrefix:", CFSTR("~~")) & 1) == 0)
  {
    v10 = sub_1000239CC();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), v9));
      v13 = objc_opt_class(SDUnitLogDirectory, v12);
      if ((objc_opt_isKindOfClass(self, v13) & 1) != 0)
        -[SDUnitLogRule setHeadDir:](self, "setHeadDir:", v11);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), CFSTR("/private/var/root")));
      v22 = sub_100026C34();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = (unint64_t)v4;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ cannot be resolved to user home directory. Setting to root home directory.", buf, 0xCu);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v24, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("%@ cannot be resolved to user home directory. Setting to root home directory."), v4);

    }
  }
  else
  {
    if (-[SDUnitLogRule mobileContainerClass](self, "mobileContainerClass")
      && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule mobileContainer](self, "mobileContainer")),
          v5,
          v5))
    {
      v25 = 1;
      v6 = -[SDUnitLogRule mobileContainerClass](self, "mobileContainerClass");
      if (v6 == 2)
      {
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule mobileContainer](self, "mobileContainer")));
        v8 = container_create_or_lookup_path_for_current_user(2, objc_msgSend(v7, "UTF8String"), 0, 0, 0, &v25);
      }
      else if (v6 == 1)
      {
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule mobileContainer](self, "mobileContainer")));
        v8 = container_system_group_path_for_identifier(0, objc_msgSend(v7, "UTF8String"), &v25);
      }
      else
      {
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule mobileContainer](self, "mobileContainer")));
        v8 = container_system_path_for_identifier(objc_msgSend(v7, "UTF8String"), &v25);
      }
      v14 = (void *)v8;

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v14, 1, 0));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));

        free(v14);
      }
      else
      {
        if ((id)-[SDUnitLogRule mobileContainerClass](self, "mobileContainerClass") == (id)2)
          v9 = CFSTR("/private/var/mobile/");
        else
          v9 = CFSTR("/DUMMY/");
        v16 = sub_100026C34();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = -[SDUnitLogRule mobileContainerClass](self, "mobileContainerClass");
          *(_DWORD *)buf = 134218240;
          v27 = v18;
          v28 = 2048;
          v29 = v25;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Error finding container of type %lu with error %llu, setting to bogus path.", buf, 0x16u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v20 = -[SDUnitLogRule mobileContainerClass](self, "mobileContainerClass");
        objc_msgSend(v19, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Error finding container of type %lu with error %llu, setting to bogus path."), v20, v25);

      }
    }
    else
    {
      v9 = CFSTR("/");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", v4));
  }

  return v11;
}

- (BOOL)canAddToCandidateList
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule logArray](self, "logArray"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 >= 0x3E8)
  {
    v5 = sub_100026C34();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Hit candidate limit -- flushing the log collection pipeline", v9, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Hit candidate limit -- flushing the log collection pipeline"));

    -[SDUnitLogRule setPipelineFlush:](self, "setPipelineFlush:", 1);
  }
  return (unint64_t)v4 < 0x3E8;
}

- (id)resolveCrashReporterPath:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  if (sub_100026AF8())
  {
    v4 = objc_msgSend(v3, "length");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathSubmission"));

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), v6, 9, 0, v4));
    v3 = (id)v7;
  }
  return v3;
}

- (void)resolvePaths
{
  __assert_rtn("-[SDUnitLogRule resolvePaths]", "SDUnit.m", 620, "0 && \"Must use a concrete subclass.\");
}

- (NSDate)createdSince
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCreatedSince:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)createdUntil
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCreatedUntil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSPredicate)filter
{
  return (NSPredicate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)newestFileLimit
{
  return self->_newestFileLimit;
}

- (void)setNewestFileLimit:(unint64_t)a3
{
  self->_newestFileLimit = a3;
}

- (NSString)relative
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRelative:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)headDir
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHeadDir:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)maxDepth
{
  return self->_maxDepth;
}

- (void)setMaxDepth:(unint64_t)a3
{
  self->_maxDepth = a3;
}

- (unint64_t)mobileContainerClass
{
  return self->_mobileContainerClass;
}

- (void)setMobileContainerClass:(unint64_t)a3
{
  self->_mobileContainerClass = a3;
}

- (NSString)mobileContainer
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMobileContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)resolveHomeDirs
{
  return self->_resolveHomeDirs;
}

- (void)setResolveHomeDirs:(BOOL)a3
{
  self->_resolveHomeDirs = a3;
}

- (BOOL)pipelineFlush
{
  return self->_pipelineFlush;
}

- (void)setPipelineFlush:(BOOL)a3
{
  self->_pipelineFlush = a3;
}

- (NSArray)offsets
{
  return self->_offsets;
}

- (void)setOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_offsets, a3);
}

- (NSArray)sizes
{
  return self->_sizes;
}

- (void)setSizes:(id)a3
{
  objc_storeStrong((id *)&self->_sizes, a3);
}

- (NSMutableArray)matchEnumerator
{
  return self->_matchEnumerator;
}

- (void)setMatchEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_matchEnumerator, a3);
}

- (NSMutableArray)logArray
{
  return self->_logArray;
}

- (void)setLogArray:(id)a3
{
  objc_storeStrong((id *)&self->_logArray, a3);
}

- (NSMutableArray)logDates
{
  return self->_logDates;
}

- (void)setLogDates:(id)a3
{
  objc_storeStrong((id *)&self->_logDates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logDates, 0);
  objc_storeStrong((id *)&self->_logArray, 0);
  objc_storeStrong((id *)&self->_matchEnumerator, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_mobileContainer, 0);
  objc_storeStrong((id *)&self->_headDir, 0);
  objc_storeStrong((id *)&self->_relative, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_createdUntil, 0);
  objc_storeStrong((id *)&self->_createdSince, 0);
}

@end
