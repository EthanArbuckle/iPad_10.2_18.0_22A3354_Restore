@implementation SSHTTPArchive

- (SSHTTPArchive)initWithJSONObject:(id)a3
{
  id v4;
  SSHTTPArchive *v5;
  void *v6;
  uint64_t (*v7)(void *);
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSHTTPArchive;
  v5 = -[SSHTTPArchive init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)SSViTunesStoreFramework();
    v7 = (uint64_t (*)(void *))SSVWeakLinkedSymbolForString("ISCopyGzippedDataForData", v6);
    if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v4))
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v9 = v7(v8);
    v10 = (void *)v9;
    v11 = v9 != 0;
    if (v9)
      v12 = (void *)v9;
    else
      v12 = v8;
    objc_storeStrong((id *)&v5->_backingJSONData, v12);
    v5->_compressed = v11;

  }
  return v5;
}

- (SSHTTPArchive)initWithTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SSHTTPArchive *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "_JSONObjectForTaskMetrics:requestData:responseData:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SSHTTPArchive initWithJSONObject:](self, "initWithJSONObject:", v11);
  return v12;
}

- (NSData)JSONData
{
  void *v3;
  uint64_t (*v4)(void);
  void *v5;
  void *v6;

  if (-[SSHTTPArchive compressed](self, "compressed"))
  {
    v3 = (void *)SSViTunesStoreFramework();
    v4 = (uint64_t (*)(void))SSVWeakLinkedSymbolForString("ISCopyDecompressedGZipDataForData", v3);
    -[SSHTTPArchive backingJSONData](self, "backingJSONData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4();

  }
  else
  {
    -[SSHTTPArchive backingJSONData](self, "backingJSONData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)v6;
}

- (NSDictionary)JSONObject
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[SSHTTPArchive JSONData](self, "JSONData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "JSONObjectWithData:options:error:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSString)JSONString
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SSHTTPArchive JSONData](self, "JSONData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return (NSString *)v5;
}

+ (id)merge:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1A8585BF8]();
        objc_msgSend(v9, "JSONObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("log"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("entries"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v17, "addObjectsFromArray:", v13);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend((id)objc_opt_class(), "_JSONObjectForEntries:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithJSONObject:", v14);

  return v15;
}

+ (id)merge:(id)a3 withEstimatedFileSizeLimit:(unint64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  id obj;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v23 = a1;
  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v26 = 1000 * a4;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1A8585BF8]();
        objc_msgSend(v12, "JSONObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("log"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("entries"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          objc_msgSend(v6, "addObjectsFromArray:", v16);
        objc_msgSend(v12, "JSONData", v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v9 += objc_msgSend(v17, "length");

        if (v9 > v26)
        {
          objc_msgSend((id)objc_opt_class(), "_JSONObjectForEntries:", v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithJSONObject:", v18);
          objc_msgSend(v24, "addObject:", v19);

          objc_msgSend(v6, "removeAllObjects");
        }

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_JSONObjectForEntries:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithJSONObject:", v20);
    objc_msgSend(v24, "addObject:", v21);

  }
  return v24;
}

+ (id)outputDirectoryForLogConfig:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "outputDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("HTTPArchives"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)removeLogsWithLogConfig:(id)a3 olderThanDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  int v30;
  NSObject *v31;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  char v41;
  id v42;
  id v43;
  void *v44;
  int v45;
  NSObject *v46;
  int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  NSObject *v57;
  int v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  int v76;
  void *v77;
  __int16 v78;
  id v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)objc_opt_class(), "outputDirectoryForLogConfig:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((v10 & 1) == 0)
  {
    v15 = v6;
    if (!v15)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v55 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v56 = v55 | 2;
    else
      v56 = v55;
    objc_msgSend(v15, "OSLogObject");
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      v58 = v56;
    else
      v58 = v56 & 2;
    if (v58)
    {
      v76 = 138412290;
      v77 = v8;
      LODWORD(v67) = 12;
      v59 = (void *)_os_log_send_and_compose_impl();

      if (!v59)
        goto LABEL_53;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v59, 4, &v76, v67);
      v57 = objc_claimAutoreleasedReturnValue();
      free(v59);
      SSFileLog(v15, CFSTR("%@"), v60, v61, v62, v63, v64, v65, (uint64_t)v57);
    }

    goto LABEL_53;
  }
  v68 = v7;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enumeratorAtPath:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  if (!v16)
    goto LABEL_40;
  v17 = v16;
  v18 = *(_QWORD *)v73;
  v69 = *(_QWORD *)v73;
  do
  {
    v19 = 0;
    v70 = v17;
    do
    {
      if (*(_QWORD *)v73 != v18)
        objc_enumerationMutation(v15);
      v20 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v19);
      objc_msgSend(a1, "_timeIntervalFromFilename:", v20, v66);
      if (v21 != 1.79769313e308 && v21 <= v12)
      {
        v23 = a1;
        v24 = v15;
        v25 = v8;
        objc_msgSend(v8, "stringByAppendingPathComponent:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v6;
        v28 = v27;
        v29 = v6;
        if (!v6)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v30 = objc_msgSend(v28, "shouldLog");
        if (objc_msgSend(v28, "shouldLogToDisk"))
          v30 |= 2u;
        objc_msgSend(v28, "OSLogObject");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          v32 = v30;
        else
          v32 = v30 & 2;
        if (v32)
        {
          v76 = 138412290;
          v77 = v26;
          LODWORD(v67) = 12;
          v66 = &v76;
          v33 = (void *)_os_log_send_and_compose_impl();

          if (v33)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v33, 4, &v76, v67);
            v31 = objc_claimAutoreleasedReturnValue();
            free(v33);
            SSFileLog(v28, CFSTR("%@"), v34, v35, v36, v37, v38, v39, (uint64_t)v31);
            goto LABEL_23;
          }
        }
        else
        {
LABEL_23:

        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 0;
        v41 = objc_msgSend(v40, "removeItemAtPath:error:", v26, &v71);
        v42 = v71;

        if ((v41 & 1) == 0)
        {
          v43 = v27;
          if (!v29)
          {
            +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
            v43 = (id)objc_claimAutoreleasedReturnValue();
          }
          v44 = v43;
          v45 = objc_msgSend(v43, "shouldLog", v66);
          if (objc_msgSend(v44, "shouldLogToDisk"))
            v45 |= 2u;
          objc_msgSend(v44, "OSLogObject");
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            v47 = v45;
          else
            v47 = v45 & 2;
          if (v47)
          {
            v76 = 138412546;
            v77 = v26;
            v78 = 2112;
            v79 = v42;
            LODWORD(v67) = 22;
            v66 = &v76;
            v48 = (void *)_os_log_send_and_compose_impl();

            if (v48)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v48, 4, &v76, v67);
              v46 = objc_claimAutoreleasedReturnValue();
              free(v48);
              SSFileLog(v44, CFSTR("%@"), v49, v50, v51, v52, v53, v54, (uint64_t)v46);
              goto LABEL_35;
            }
          }
          else
          {
LABEL_35:

          }
        }

        v8 = v25;
        v6 = v29;
        v15 = v24;
        a1 = v23;
        v18 = v69;
        v17 = v70;
      }
      ++v19;
    }
    while (v17 != v19);
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  }
  while (v17);
LABEL_40:

  v7 = v68;
LABEL_53:

}

+ (void)sendWriteAllLogsToDiskNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SSHTTPArchiveShouldSaveToDiskNotification"), 0, 0, 1u);
}

+ (void)sendWriteAllLogsToDiskDecompressedNotification
{
  id v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v14[4];
  id v15;
  dispatch_semaphore_t v16;

  v2 = objc_alloc_init(MEMORY[0x1E0CFE2F0]);
  v3 = objc_msgSend(v2, "applicationStateForApplication:", CFSTR("com.apple.AppStore"));
  v4 = v3;
  NSLog(CFSTR("App Store states is: %d"), v3);
  if (v4 == 2)
  {
    v5 = (void *)SSVFrontBoardServicesFramework();
    SSVWeakLinkedStringConstantForString("FBSOpenApplicationOptionKeyActivateSuspended", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0C99E08]);
      v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], v6, 0);
      v9 = SSVFrontBoardServicesFramework();
      v10 = objc_alloc_init((Class)SSVWeakLinkedClassForString(CFSTR("FBSSystemService"), v9));
      v11 = dispatch_semaphore_create(0);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __63__SSHTTPArchive_sendWriteAllLogsToDiskDecompressedNotification__block_invoke;
      v14[3] = &unk_1E47BE780;
      v15 = v2;
      v16 = v11;
      v12 = v11;
      objc_msgSend(v10, "openApplication:options:withResult:", CFSTR("com.apple.AppStore"), v8, v14);
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      objc_msgSend(v2, "invalidate");
    }

  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SSHTTPArchiveShouldSaveToDiskDecompressedNotification"), 0, 0, 1u);
    objc_msgSend(v2, "invalidate");
  }

}

intptr_t __63__SSHTTPArchive_sendWriteAllLogsToDiskDecompressedNotification__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  NSLog(CFSTR("Launched App Store error: %@ state: %d"), v4, objc_msgSend(v3, "applicationStateForApplication:", CFSTR("com.apple.AppStore")));

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SSHTTPArchiveShouldSaveToDiskDecompressedNotification"), 0, 0, 1u);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)writeToDiskError:(id *)a3
{
  return -[SSHTTPArchive writeToDiskWithLogConfig:compressed:error:](self, "writeToDiskWithLogConfig:compressed:error:", 0, 1, a3);
}

- (BOOL)writeToDiskWithLogConfig:(id)a3 compressed:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  __CFString *v9;
  void *v10;
  char v11;
  __CFString *v12;
  void *v13;
  char v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  id v24;
  int v25;
  NSObject *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  id v39;
  void *v40;
  int v41;
  NSObject *v42;
  int v43;
  int v44;
  int v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  const __CFString *v56;
  void *v57;
  id *v58;
  __CFString *v59;
  id v60;
  int v61;
  __CFString *v62;
  __int16 v63;
  __CFString *v64;
  uint64_t v65;

  v6 = a4;
  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)objc_opt_class(), "outputDirectoryForLogConfig:", v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if ((v11 & 1) != 0)
  {
    v12 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  v14 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v60);
  v12 = (__CFString *)v60;

  if ((v14 & 1) == 0)
  {
    v24 = v8;
    if (!v24)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = objc_msgSend(v24, "shouldLog");
    if (objc_msgSend(v24, "shouldLogToDisk"))
      v25 |= 2u;
    objc_msgSend(v24, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      v27 = v25;
    else
      v27 = v25 & 2;
    if (v27)
    {
      v61 = 138412546;
      v62 = v9;
      v63 = 2112;
      v64 = v12;
      LODWORD(v54) = 22;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
        goto LABEL_23;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v28, 4, &v61, v54);
      v26 = objc_claimAutoreleasedReturnValue();
      free(v28);
      SSFileLog(v24, CFSTR("%@"), v29, v30, v31, v32, v33, v34, (uint64_t)v26);
    }

LABEL_23:
    if (SSFileIsLocalWritable(v9))
    {
      v35 = 0;
      if (!a5)
        goto LABEL_53;
      goto LABEL_52;
    }
    goto LABEL_26;
  }
LABEL_6:
  if (!SSFileIsLocalWritable(v9))
  {
LABEL_26:
    SSError((uint64_t)CFSTR("SSErrorDomain"), 107, 0, 0);
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v37 = v12;
    goto LABEL_51;
  }
  v15 = CFSTR(".har");
  v58 = a5;
  if (-[SSHTTPArchive compressed](self, "compressed") && v6)
  {
    objc_msgSend(CFSTR(".har"), "stringByAppendingString:", CFSTR(".compressed"));
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v56 = v15;
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@_%f%@"), v18, v20, v15);
  v21 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)v21;
  objc_msgSend(v22, "URLByAppendingPathComponent:", v21);
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[SSHTTPArchive backingJSONData](self, "backingJSONData");
  else
    -[SSHTTPArchive JSONData](self, "JSONData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v12;
  v35 = objc_msgSend(v38, "writeToURL:options:error:", v23, 1, &v59);
  v36 = v59;

  v39 = v8;
  v40 = v39;
  v37 = (__CFString *)v56;
  if ((v35 & 1) != 0)
  {
    if (!v39)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41 = objc_msgSend(v40, "shouldLog");
    if (objc_msgSend(v40, "shouldLogToDisk"))
      v41 |= 2u;
    objc_msgSend(v40, "OSLogObject");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      v43 = v41;
    else
      v43 = v41 & 2;
    if (!v43)
      goto LABEL_49;
    v61 = 138412290;
    v62 = v23;
    LODWORD(v55) = 12;
  }
  else
  {
    if (!v39)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = objc_msgSend(v40, "shouldLog");
    if (objc_msgSend(v40, "shouldLogToDisk"))
      v44 |= 2u;
    objc_msgSend(v40, "OSLogObject");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      v45 = v44;
    else
      v45 = v44 & 2;
    if (!v45)
      goto LABEL_49;
    v61 = 138412290;
    v62 = v36;
    LODWORD(v55) = 12;
  }
  v46 = (void *)_os_log_send_and_compose_impl();

  if (v46)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v46, 4, &v61, v55);
    v42 = objc_claimAutoreleasedReturnValue();
    free(v46);
    SSFileLog(v40, CFSTR("%@"), v47, v48, v49, v50, v51, v52, (uint64_t)v42);
LABEL_49:

  }
  a5 = v58;
LABEL_51:

  v12 = v36;
  if (a5)
LABEL_52:
    *a5 = objc_retainAutorelease(v12);
LABEL_53:

  return v35;
}

+ (id)_contentDictionaryForResponse:(id)a3 responseData:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  char ShouldIncludeFullResponseBodiesInNetworkLogs;
  unint64_t v15;
  uint64_t v16;

  v5 = a4;
  if (v5)
  {
    v6 = (objc_class *)MEMORY[0x1E0C99E08];
    v7 = a3;
    v8 = objc_alloc_init(v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "expectedContentLength"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("bodySize"));

    objc_msgSend(v7, "MIMEType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("mimeType"));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
    v12 = objc_msgSend(v11, "length");
    if (v12)
    {
      v13 = v12;
      ShouldIncludeFullResponseBodiesInNetworkLogs = SSDebugShouldIncludeFullResponseBodiesInNetworkLogs();
      v15 = objc_msgSend(v5, "length");
      if ((ShouldIncludeFullResponseBodiesInNetworkLogs & 1) == 0 && v15 >= 0x9C41)
      {
        if (v13 <= (unint64_t)((double)v13 / (double)(unint64_t)objc_msgSend(v5, "length") * 40000.0))
        {
          v16 = 0;
        }
        else
        {
          objc_msgSend(v11, "substringToIndex:");
          v16 = objc_claimAutoreleasedReturnValue();
        }

        v11 = (void *)v16;
      }
    }
    if (objc_msgSend(v11, "length"))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("text"));

  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

+ (id)_creatorDictionary
{
  void *v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[SSDevice currentDevice](SSDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userAgent");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  +[SSDevice currentDevice](SSDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientVersion");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    v3 = CFSTR("UNKNOWN");
  if (!v5)
    v5 = CFSTR("UNKNOWN");
  v8[0] = CFSTR("name");
  v8[1] = CFSTR("version");
  v9[0] = v3;
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_dateFormatterForTimeZone:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD block[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a3;
  if (_dateFormatterForTimeZone__onceToken != -1)
    dispatch_once(&_dateFormatterForTimeZone__onceToken, &__block_literal_global_24);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__53;
  v21 = __Block_byref_object_dispose__53;
  v22 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v5 = _dateFormatterForTimeZone__dateFormatterAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SSHTTPArchive__dateFormatterForTimeZone___block_invoke_57;
  block[3] = &unk_1E47B8680;
  v16 = &v17;
  v6 = v3;
  v15 = v6;
  dispatch_sync(v5, block);
  v7 = (void *)v18[5];
  if (!v7)
  {
    v8 = _dateFormatterForTimeZone__dateFormatterAccessQueue;
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __43__SSHTTPArchive__dateFormatterForTimeZone___block_invoke_2;
    v11[3] = &unk_1E47B8680;
    v13 = &v17;
    v12 = v6;
    dispatch_barrier_sync(v8, v11);

    v7 = (void *)v18[5];
  }
  v9 = v7;

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __43__SSHTTPArchive__dateFormatterForTimeZone___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.StoreServices.SSHTTPArchive", MEMORY[0x1E0C80D50]);
  v1 = (void *)_dateFormatterForTimeZone__dateFormatterAccessQueue;
  _dateFormatterForTimeZone__dateFormatterAccessQueue = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)_dateFormatterForTimeZone__dateFormatters;
  _dateFormatterForTimeZone__dateFormatters = (uint64_t)v2;

}

void __43__SSHTTPArchive__dateFormatterForTimeZone___block_invoke_57(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)_dateFormatterForTimeZone__dateFormatters, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __43__SSHTTPArchive__dateFormatterForTimeZone___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDateFormat:", CFSTR("uuuu-MM-dd'T'HH:mm:ss.sXXX"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTimeZone:", *(_QWORD *)(a1 + 32));
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocale:", v6);

  return objc_msgSend((id)_dateFormatterForTimeZone__dateFormatters, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
}

+ (id)_entriesArrayForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v8, "transactionMetrics", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(a1, "_entryDictionaryForTaskMetrics:requestData:responseData:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16), v9, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v11;
}

+ (id)_entryDictionaryForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  objc_msgSend(v11, "fetchStartDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_stringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("startedDateTime"));

  objc_msgSend(v11, "responseEndDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestStartDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v16);
  v18 = v17 * 1000.0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("time"));

  objc_msgSend(a1, "_requestDictionaryForTaskTransactionMetrics:requestData:", v11, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("request"));
  objc_msgSend(a1, "_responseDictionaryForTaskMetrics:responseData:", v11, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("response"));
  objc_msgSend(a1, "_generateCommentsForTaskMetrics:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("comment"));
  return v12;
}

+ (id)_headersArrayForHTTPHeaders:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v18[1] = CFSTR("value");
        v19[0] = v9;
        v18[0] = CFSTR("name");
        objc_msgSend(v3, "objectForKeyedSubscript:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)_JSONObjectForEntries:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("1.2"), CFSTR("version"));
  objc_msgSend(a1, "_creatorDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("creator"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("entries"));
  v10 = CFSTR("log");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_JSONObjectForTaskMetrics:(id)a3 requestData:(id)a4 responseData:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "_entriesArrayForTaskMetrics:requestData:responseData:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_JSONObjectForEntries:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_generateCommentsForTaskMetrics:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "_apsRelayAttempted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("APS-Attempted"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v5, "_apsRelaySucceeded");

  objc_msgSend(v8, "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("APS-Succeeded"));

  objc_msgSend(a1, "_localIPAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("clientIPAddress"));

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v12, 4);
  else
    v13 = 0;
  if (v13)
    v14 = v13;
  else
    v14 = &stru_1E47D72B0;
  v15 = v14;

  return v15;
}

+ (id)_localIPAddress
{
  int v2;
  ifaddrs *v3;
  __CFString *v4;
  void *v5;
  int v6;
  in_addr v7;
  uint64_t v8;
  ifaddrs *v10;

  v10 = 0;
  v2 = getifaddrs(&v10);
  v3 = v10;
  v4 = CFSTR("error");
  if (!v2 && v10)
  {
    do
    {
      if (v3->ifa_addr->sa_family == 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3->ifa_name);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("en0"));

        if (v6)
        {
          v7.s_addr = *(_DWORD *)&v3->ifa_addr->sa_data[2];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", inet_ntoa(v7));
          v8 = objc_claimAutoreleasedReturnValue();

          v4 = (__CFString *)v8;
        }
      }
      v3 = v3->ifa_next;
    }
    while (v3);
    v3 = v10;
  }
  MEMORY[0x1A8585AD8](v3);
  return v4;
}

+ (id)_requestDictionaryForTaskTransactionMetrics:(id)a3 requestData:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  uint64_t (*v18)(id);
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("bodySize"));

  objc_msgSend(v7, "allHTTPHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_headersArrayForHTTPHeaders:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("headers"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E481E7E0, CFSTR("headersSize"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("HTTP/1.1"), CFSTR("httpVersion"));
  objc_msgSend(v7, "HTTPMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("method"));
  objc_msgSend(v7, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("url"));
  if (SSDebugShouldLogFullMetricsRequest())
  {
    v15 = objc_msgSend(v14, "containsString:", CFSTR("xp.apple.com"));
    if (!v6)
      goto LABEL_15;
  }
  else
  {
    v15 = 0;
    if (!v6)
    {
LABEL_15:
      v19 = 0;
      goto LABEL_16;
    }
  }
  if ((unint64_t)objc_msgSend(v6, "length") < 0x9C41)
    v16 = 1;
  else
    v16 = v15;
  if (v16 != 1)
    goto LABEL_15;
  v17 = (void *)SSViTunesStoreFramework();
  v18 = (uint64_t (*)(id))SSVWeakLinkedSymbolForString("ISCopyDecompressedGZipDataForData", v17);
  v19 = (id)v18(v6);
  if (!v19)
    v19 = v6;
LABEL_16:
  if (objc_msgSend(v14, "containsString:", CFSTR("/WebObjects/MZFinance.woa/wa/authenticate")))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v19, 1, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v20;
      objc_msgSend(v21, "valueForKey:", CFSTR("password"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v21, "setValue:forKey:", CFSTR("REDACTED"), CFSTR("password"));
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v21, 100, 0, 0);
        v23 = objc_claimAutoreleasedReturnValue();

        v19 = (id)v23;
      }

    }
  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v19, 4);
  if (objc_msgSend(v24, "length"))
  {
    v27 = CFSTR("text");
    v28[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("postData"));

  }
  return v8;
}

+ (id)_responseDictionaryForTaskMetrics:(id)a3 responseData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "_contentDictionaryForResponse:responseData:", v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("content"));

    v13 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v10, "allHeaderFields");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_headersArrayForHTTPHeaders:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v6, "resourceFetchType");
    v28[0] = CFSTR("name");
    v28[1] = CFSTR("value");
    v18 = CFSTR("false");
    if (v17 == 3)
      v18 = CFSTR("true");
    v29[0] = CFSTR("X-Apple-Connection-Reused");
    v29[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v19);

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("headers"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E481E7E0, CFSTR("headersSize"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("HTTP/1.1"), CFSTR("httpVersion"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "statusCode"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("status"));

    objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", objc_msgSend(v10, "statusCode"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("statusText"));
    objc_msgSend(v10, "allHeaderFields");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Content-Length"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v23, "integerValue"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = (void *)v24;
    else
      v26 = &unk_1E481E7E0;
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, CFSTR("bodySize"));

  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA70];
  }

  return v11;
}

+ (id)_stringFromDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E80];
  v5 = a3;
  objc_msgSend(v4, "systemTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dateFormatterForTimeZone:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (double)_timeIntervalFromFilename:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v11;

  v3 = a3;
  if (objc_msgSend(v3, "containsString:", CFSTR(".har")))
  {
    v4 = (void *)MEMORY[0x1A8585BF8]();
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".har"), &stru_1E47D72B0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".compressed"), &stru_1E47D72B0);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("_"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 2)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0.0;
      if (objc_msgSend(v8, "scanDouble:", &v11))
        v9 = v11;
      else
        v9 = 1.79769313e308;

    }
    else
    {
      v9 = 1.79769313e308;
    }

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v9 = 1.79769313e308;
  }

  return v9;
}

- (NSData)backingJSONData
{
  return self->_backingJSONData;
}

- (void)setBackingJSONData:(id)a3
{
  objc_storeStrong((id *)&self->_backingJSONData, a3);
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingJSONData, 0);
}

@end
