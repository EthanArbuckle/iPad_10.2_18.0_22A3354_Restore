@implementation SDLogCollectionContainer

+ (id)rejectionReasonToString:(unint64_t)a3
{
  if (a3 > 0xB)
    return CFSTR("Invalid rejection reason");
  else
    return *(&off_100099F20 + a3);
}

+ (SDLogCollectionContainer)containerWithName:(id)a3 destination:(id)a4 withDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithName:andDestination:withDelegate:", v10, v9, v8);

  if (v11)
  {
    objc_msgSend(v11, "setMaximumSizeMB:", 5);
    objc_msgSend(v11, "setDelegate:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v11, "setHighPriorityLogs:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v11, "setLogs:", v13);

    objc_msgSend(v11, "setGenerateSummary:", 1);
    objc_msgSend(v11, "setMaxVariety:", 0);
    objc_msgSend(v11, "setRuntimeChecks:", 0);
    objc_msgSend(v11, "setResolveHomeDirs:", 1);
  }

  return (SDLogCollectionContainer *)v11;
}

- (BOOL)addRules:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "resolvePaths");
          objc_msgSend(v10, "setResolveHomeDirs:", -[SDLogCollectionContainer resolveHomeDirs](self, "resolveHomeDirs"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer units](self, "units"));
          objc_msgSend(v11, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
  }

  return 1;
}

- (void)clearLogs
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer highPriorityLogs](self, "highPriorityLogs"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
  objc_msgSend(v4, "removeAllObjects");

}

- (BOOL)execute
{
  SDLogCollectionContainer *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[SDContainer executionActivity](self, "executionActivity"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100051C54;
  v5[3] = &unk_100098FB0;
  v5[4] = v2;
  v5[5] = &v6;
  os_activity_apply(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)logFileToSummary:(id)a3 description:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@\n"), a3, a4));
  -[SDLogCollectionContainer writeToSummary:](self, "writeToSummary:", v5);

}

- (void)rejectFile:(id)a3 forReason:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "logCollectionContainer:didRejectFile:forReason:");

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
      objc_msgSend(v10, "logCollectionContainer:didRejectFile:forReason:", self, v12, a4);

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer rejectionReasonToString:](SDLogCollectionContainer, "rejectionReasonToString:", a4));
  -[SDLogCollectionContainer logFileToSummary:description:](self, "logFileToSummary:description:", v12, v11);

}

- (BOOL)applyRule:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  int v26;
  unsigned __int8 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  void *v37;
  void *v38;
  __CFString *v40;
  BOOL v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  unsigned __int8 v49;
  _BYTE v50[128];

  v4 = a3;
  v5 = -[SDContainer evaluateCollectionFlagsWithOverlay:withName:](self, "evaluateCollectionFlagsWithOverlay:withName:", objc_msgSend(v4, "runtimeChecks"), 0);
  if (!v5)
    goto LABEL_31;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filter"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filter"));
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nAPPLYING PREDICATE %@:\n"), v7));

  }
  else
  {
    v8 = CFSTR("\nAPPLYING DEFAULT FILTERS:\n");
  }
  v41 = v5;
  v40 = (__CFString *)v8;
  -[SDLogCollectionContainer writeToSummary:](self, "writeToSummary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getNextMatch"));
  v43 = v4;
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = objc_autoreleasePoolPush();
      if (!objc_msgSend(v4, "canAddToCandidateList"))
        break;
      v13 = v9;

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v11 = v13;
      if (WeakRetained)
      {
        v15 = WeakRetained;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
        v17 = objc_loadWeakRetained((id *)&self->_delegate);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rootPath"));
        v19 = objc_msgSend(v16, "hasPrefix:", v18);

        v11 = v13;
        if ((v19 & 1) == 0)
        {
          v20 = objc_loadWeakRetained((id *)&self->_delegate);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "rootPath"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingPathComponent:", v22));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v23));

        }
      }
      v49 = 0;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
      v25 = objc_msgSend(v42, "fileExistsAtPath:isDirectory:", v24, &v49);
      v26 = v49;

      if (!v25 || !v26)
      {
        v48 = 0;
        v27 = objc_msgSend(v43, "considerURL:forRejection:", v11, &v48);
        v28 = v48;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
        if ((v27 & 1) != 0 || !v28)
          -[SDLogCollectionContainer logFileToSummary:description:](self, "logFileToSummary:description:", v29, CFSTR("Added to Candidate logs"));
        else
          -[SDLogCollectionContainer rejectFile:forReason:](self, "rejectFile:forReason:", v29, v48);

      }
      objc_autoreleasePoolPop(v12);
      v4 = v43;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "getNextMatch"));

      --v10;
      if (!v9)
        goto LABEL_23;
    }
    -[SDLogCollectionContainer writeToSummary:](self, "writeToSummary:", CFSTR("Hit maximum number of candidates for rule\n"));
    objc_autoreleasePoolPop(v12);
    if (v10)
      goto LABEL_23;
  }
  else
  {
    v11 = 0;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: found no matches\n"), v30));
  -[SDLogCollectionContainer writeToSummary:](self, "writeToSummary:", v31);

LABEL_23:
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applyFilters"));
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v35)
          objc_enumerationMutation(v32);
        -[SDLogCollectionContainer rejectFile:forReason:](self, "rejectFile:forReason:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), 3);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v34);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer highPriorityLogs](self, "highPriorityLogs"));
  v4 = v43;
  objc_msgSend(v43, "addPathsToArray:withHighPriority:withMaxVariety:", v37, v38, -[SDLogCollectionContainer maxVariety](self, "maxVariety"));

  LOBYTE(v5) = v41;
LABEL_31:

  return v5;
}

- (BOOL)enforceContainerSizeLimit
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = -[SDLogCollectionContainer maximumSizeMB](self, "maximumSizeMB") << 20;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\nENFORCING SIZE LIMIT OF %lu MB ON FILTERED CANDIDATES:\n\n"), -[SDLogCollectionContainer maximumSizeMB](self, "maximumSizeMB")));
  -[SDLogCollectionContainer writeToSummary:](self, "writeToSummary:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer enforceSizeOnLogs:](self, "enforceSizeOnLogs:", v3));
  -[SDLogCollectionContainer setLogs:](self, "setLogs:", v5);

  -[SDLogCollectionContainer writeToSummary:](self, "writeToSummary:", CFSTR("\n** DONE Enforcing size limit **\n"));
  return 1;
}

- (id)enforceSizeOnLogs:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SDLogCollectionContainer *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  unint64_t v30;
  void *v31;
  id obj;
  unint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  void *v39;
  _BYTE v40[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer highPriorityLogs](self, "highPriorityLogs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8));

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v9;
  v11 = (void *)v6;
  obj = v10;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v12)
  {
    v13 = v12;
    v33 = 0;
    v14 = *(_QWORD *)v35;
    v30 = a3;
    v31 = (void *)v6;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path", v30));
        v18 = (uint64_t)objc_msgSend(v16, "sizeBytes");
        if (objc_msgSend(v5, "containsObject:", v16))
        {
          v19 = self;
          v20 = v17;
          v21 = 9;
LABEL_8:
          -[SDLogCollectionContainer rejectFile:forReason:](v19, "rejectFile:forReason:", v20, v21);
          goto LABEL_20;
        }
        if ((objc_msgSend(v11, "fileExistsAtPath:", v17) & 1) != 0)
        {
          if (a3)
          {
            v22 = CFSTR("Added");
            if (v18 + v33 > a3)
            {
              if (!objc_msgSend(v16, "supportsPartialCollection") || (v18 = a3 - v33, a3 <= v33))
              {
                v19 = self;
                v20 = v17;
                v21 = 2;
                goto LABEL_8;
              }
              v22 = CFSTR("Partially Added");
            }
          }
          else
          {
            v22 = CFSTR("Added");
          }
          -[SDLogCollectionContainer logFileToSummary:description:](self, "logFileToSummary:description:", v17, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "offsets"));

          if (!v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", 0));
            v39 = v24;
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
            objc_msgSend(v16, "setOffsets:", v25);

            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v18));
            v38 = v26;
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
            objc_msgSend(v16, "setSizes:", v27);

            a3 = v30;
          }
          v33 += v18;
          objc_msgSend(v5, "addObject:", v16);
          v11 = v31;
        }
        else
        {
          -[SDLogCollectionContainer logFileToSummary:description:](self, "logFileToSummary:description:", v17, CFSTR("NotFound"));
        }
LABEL_20:

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      v13 = v28;
    }
    while (v28);
  }

  return v5;
}

- (BOOL)prepareSummary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  NSString *summaryLocation;
  NSString *v18;
  void *v19;
  NSFileHandle *v20;
  NSFileHandle *summaryHandle;
  NSFileHandle *v22;
  BOOL v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  NSObject *v30;
  uint8_t v32[8];
  NSFileAttributeKey v33;
  _UNKNOWN **v34;

  if (-[SDLogCollectionContainer generateSummary](self, "generateSummary"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v4 = objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
    if (!v4
      || (v5 = (void *)v4,
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "outputDirectory")),
          v7,
          v6,
          v5,
          !v7))
    {
      v23 = 1;
LABEL_20:

      return v23;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "outputDirectory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("summaries")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_")));

    if (objc_msgSend(v13, "hasSuffix:", CFSTR("_collection")))
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringToIndex:", (_BYTE *)objc_msgSend(v13, "length") - (_BYTE *)objc_msgSend(CFSTR("_collection"), "length")));

      v13 = (void *)v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathExtension:", CFSTR("log")));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v15));
    summaryLocation = self->_summaryLocation;
    self->_summaryLocation = v16;

    if ((objc_msgSend(v3, "fileExistsAtPath:", self->_summaryLocation) & 1) != 0
      || (v18 = self->_summaryLocation,
          v33 = NSFilePosixPermissions,
          v34 = &off_1000ACFB0,
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1)), LOBYTE(v18) = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v18, 0, v19), v19, (v18 & 1) != 0))
    {
      v20 = (NSFileHandle *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", self->_summaryLocation));
      summaryHandle = self->_summaryHandle;
      self->_summaryHandle = v20;

      v22 = self->_summaryHandle;
      if (v22)
      {
        -[NSFileHandle seekToEndOfFile](v22, "seekToEndOfFile");
        v23 = 1;
LABEL_19:

        goto LABEL_20;
      }
      v24 = sub_100026C34();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Couldn't create file handle for summary file", v32, 2u);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v27 = v26;
      v28 = CFSTR("Couldn't create file handle for summary file");
    }
    else
    {
      v29 = sub_100026C34();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Couldn't create summary file.", v32, 2u);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v27 = v26;
      v28 = CFSTR("Couldn't create summary file.");
    }
    objc_msgSend(v26, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", v28);

    v23 = 0;
    goto LABEL_19;
  }
  return 0;
}

- (void)writeToSummary:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[SDLogCollectionContainer generateSummary](self, "generateSummary") && self->_summaryHandle)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("writing summary file for %@. Closing summary file handle."), self->_summaryLocation));
    if ((sub_100026870(self->_summaryHandle, 0, v5, v4) & 1) == 0)
      -[SDLogCollectionContainer closeSummary](self, "closeSummary");

  }
}

- (void)closeSummary
{
  NSFileHandle *summaryHandle;
  NSFileHandle *v4;

  if (-[SDLogCollectionContainer generateSummary](self, "generateSummary"))
  {
    summaryHandle = self->_summaryHandle;
    if (summaryHandle)
    {
      -[NSFileHandle closeFile](summaryHandle, "closeFile");
      v4 = self->_summaryHandle;
      self->_summaryHandle = 0;

    }
  }
}

- (BOOL)copyFilesForDirectory:(id)a3 withStreaming:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  SDArchiveFile *v30;
  void *v31;
  void *v32;
  SDArchiveFile *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  const char *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  char *v57;
  void *v58;
  NSObject *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  SDLogCollectionContainer *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  char *v74;
  NSFileAttributeKey v75;
  _UNKNOWN **v76;
  _QWORD v77[3];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
  if (v7)
    v8 = v4;
  else
    v8 = 0;
  v66 = v8;

  if (!v6)
  {
    v58 = sub_100026C34();
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "ERROR: No delegate outputDirectory, no target location to copy files.", buf, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v9, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("ERROR: No delegate outputDirectory, no target location to copy files."));
    goto LABEL_28;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer destination](self, "destination"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "standardizedURL"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
  v15 = objc_msgSend(v14, "count");

  if (!v15)
    goto LABEL_24;
  v61 = v12;
  v63 = v9;
  v64 = v6;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v62 = 0;
  v65 = self;
  do
  {
    v20 = v19;
    v68 = objc_autoreleasePoolPush();
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v16));

    if (v66
      && (v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate")),
          v23 = objc_opt_respondsToSelector(v22, "streamArchiveFile:"),
          v22,
          (v23 & 1) != 0))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subdirectory"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "URLByAppendingPathComponent:", v24));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "standardizedURL"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "path"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filename"));
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingPathComponent:", v28));

      v30 = [SDArchiveFile alloc];
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fileType"));
      v33 = -[SDArchiveFile initWithPath:target:ofType:](v30, "initWithPath:target:ofType:", v31, v29, v32);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "offsets"));
      -[SDArchiveFile setOffsets:](v33, "setOffsets:", v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sizes"));
      -[SDArchiveFile setSizes:](v33, "setSizes:", v35);

      self = v65;
      v36 = (id)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](v65, "delegate"));
      objc_msgSend(v36, "streamArchiveFile:", v33);
      v62 = (void *)v29;
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "stringByDeletingLastPathComponent"));
      v77[0] = v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "path"));
      v77[1] = v38;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subdirectory"));
      v77[2] = v39;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 3));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v40));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "standardizedURL"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "path"));
      v75 = NSFilePosixPermissions;
      v76 = &off_1000ACFC8;
      v33 = (SDArchiveFile *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
      if (!objc_msgSend(v63, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v27, 1, v33, 0))
      {
        self = v65;
        goto LABEL_18;
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filename"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingPathComponent:", v42));

      v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path")));
      v45 = (const char *)objc_msgSend(v44, "fileSystemRepresentation");
      v36 = objc_retainAutorelease(v43);
      LODWORD(v43) = sub_100053BC4(v45, (const char *)objc_msgSend(v36, "fileSystemRepresentation"), 0xFu);

      if ((_DWORD)v43)
      {
        v46 = *__error();
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path"));
          v57 = strerror(v46);
          *(_DWORD *)buf = 138412802;
          v70 = v56;
          v71 = 2112;
          v72 = v36;
          v73 = 2080;
          v74 = v57;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to copy file %@ -> %@: %s", buf, 0x20u);

        }
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path"));
        objc_msgSend(v47, "stderrWrite:", CFSTR("Unable to copy file %@ -> %@: %s"), v48, v36, strerror(v46));

        v49 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path"));
        objc_msgSend(v49, "log:", CFSTR("Unable to copy file %@ -> %@: %s"), v50, v36, strerror(v46));

        self = v65;
        goto LABEL_20;
      }
      self = v65;
    }

LABEL_18:
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
    v52 = objc_opt_respondsToSelector(v51, "logCollectionContainerDidCopyFile:");

    if ((v52 & 1) != 0)
    {
      v33 = (SDArchiveFile *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer delegate](self, "delegate"));
      -[SDArchiveFile logCollectionContainerDidCopyFile:](v33, "logCollectionContainerDidCopyFile:", v19);
LABEL_20:
      v53 = v68;

      v18 = v26;
      v17 = v27;
      goto LABEL_22;
    }
    v18 = v26;
    v17 = v27;
    v53 = v68;
LABEL_22:
    objc_autoreleasePoolPop(v53);
    ++v16;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogCollectionContainer logs](self, "logs"));
    v55 = objc_msgSend(v54, "count");

  }
  while ((unint64_t)v55 > v16);

  v9 = v63;
  v6 = v64;
  v12 = v61;
LABEL_24:

LABEL_28:
  return v6 != 0;
}

- (void)applyContainerOverride:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxSizeMB")));
  if (v4)
  {
    v5 = v4;
    -[SDLogCollectionContainer setMaximumSizeMB:](self, "setMaximumSizeMB:", objc_msgSend(v4, "unsignedIntegerValue"));
    v4 = v5;
  }

}

- (unint64_t)maximumSizeMB
{
  return self->_maximumSizeMB;
}

- (void)setMaximumSizeMB:(unint64_t)a3
{
  self->_maximumSizeMB = a3;
}

- (SDLogCollectionDelegate)delegate
{
  return (SDLogCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)maxVariety
{
  return self->_maxVariety;
}

- (void)setMaxVariety:(BOOL)a3
{
  self->_maxVariety = a3;
}

- (BOOL)generateSummary
{
  return self->_generateSummary;
}

- (void)setGenerateSummary:(BOOL)a3
{
  self->_generateSummary = a3;
}

- (BOOL)resolveHomeDirs
{
  return self->_resolveHomeDirs;
}

- (void)setResolveHomeDirs:(BOOL)a3
{
  self->_resolveHomeDirs = a3;
}

- (NSMutableArray)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
  objc_storeStrong((id *)&self->_logs, a3);
}

- (NSMutableArray)highPriorityLogs
{
  return self->_highPriorityLogs;
}

- (void)setHighPriorityLogs:(id)a3
{
  objc_storeStrong((id *)&self->_highPriorityLogs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highPriorityLogs, 0);
  objc_storeStrong((id *)&self->_logs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_summaryHandle, 0);
  objc_storeStrong((id *)&self->_summaryLocation, 0);
}

@end
