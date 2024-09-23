@implementation RMECacheEnumerator

- (id)initCacheEnumeratorWithVolume:(id)a3
{
  __CFString *v4;
  RMECacheEnumerator *v5;
  RMECacheEnumerator *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDirectoryEnumerator *internalEnumerator;
  RMECacheEnumerator *v19;
  _QWORD v21[4];
  id v22;
  __CFString *v23;
  objc_super v24;

  v4 = (__CFString *)a3;
  v24.receiver = self;
  v24.super_class = (Class)RMECacheEnumerator;
  v5 = -[RMECacheEnumerator init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    if (!v4)
      v4 = CFSTR("/");
    objc_storeStrong((id *)&v5->_volume, v4);
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMECacheEnumerator getLogContainer:](RMECacheEnumerator, "getLogContainer:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = v8,
          objc_msgSend(v8, "substringFromIndex:", 1),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v10))
    {
      objc_msgSend(v7, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "hasPrefix:", v11);

      if (v12)
      {
        objc_msgSend(v7, "URLByDeletingLastPathComponent");
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v13;
      }
      objc_msgSend(v7, "URLByAppendingPathComponent:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *MEMORY[0x24BDBCC60], *MEMORY[0x24BDBCCD0], *MEMORY[0x24BDBCCD8], *MEMORY[0x24BDBCBF0], 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = sub_21344EEF4;
        v21[3] = &unk_24CFC85A8;
        v22 = v14;
        v23 = v4;
        objc_msgSend(v15, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v22, v16, 5, v21);
        v17 = objc_claimAutoreleasedReturnValue();
        internalEnumerator = v6->_internalEnumerator;
        v6->_internalEnumerator = (NSDirectoryEnumerator *)v17;

      }
      v19 = v6;

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)initCacheEnumerator
{
  id v3;

  v3 = -[RMECacheEnumerator initCacheEnumeratorWithVolume:]([RMECacheEnumerator alloc], "initCacheEnumeratorWithVolume:", 0);

  return v3;
}

- (id)nextValidURL
{
  return (id)MEMORY[0x24BEDD108](self->_internalEnumerator, sel_nextObject);
}

+ (id)getLogPathsSortedByTime
{
  id v2;
  void *v3;

  v2 = -[RMECacheEnumerator initCacheEnumeratorWithVolume:]([RMECacheEnumerator alloc], "initCacheEnumeratorWithVolume:", 0);
  sub_213464414(1, 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getLogPathsSortedByProcessFrequency
{
  id v2;
  void *v3;
  void *v4;

  v2 = -[RMECacheEnumerator initCacheEnumeratorWithVolume:]([RMECacheEnumerator alloc], "initCacheEnumeratorWithVolume:", 0);
  sub_213464414(1, 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_21344E860(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)getLogPathsForSystemDiagnostic
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id obj;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  double v73;
  __int16 v74;
  double v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getLogPathsSortedByTime");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = v2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -3600.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v65;
    v7 = *MEMORY[0x24BDBCBF0];
    v8 = *MEMORY[0x24BDBCCD0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v65 != v6)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x2199B3174]();
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = 0;
        objc_msgSend(v12, "getResourceValue:forKey:error:", &v63, v7, 0);
        v13 = v63;
        if (v13)
        {
          v62 = 0;
          objc_msgSend(v12, "getResourceValue:forKey:error:", &v62, v8, 0);
          v14 = v62;
          if (v14 && (objc_msgSend(v56, "compare:", v13) == -1 || !objc_msgSend(v56, "compare:", v13)))
          {
            sub_2134642FC(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = v15;
              if (sub_213463A70(v15))
                objc_msgSend(v53, "addObject:", v12);

            }
          }

        }
        objc_autoreleasePoolPop(v11);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
    }
    while (v5);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v17 = v53;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, &v68, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v59 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, &v68, 16);
    }
    while (v19);
  }

  *(_QWORD *)&v64 = 0;
  sub_21344FB18(v51, 0xF00000uLL, (unint64_t *)&v64);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v73 = 15.0;
    v74 = 2048;
    v75 = (double)(unint64_t)v64 * 0.000000953674316;
    v76 = 2112;
    v77 = v23;
    _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Critical Logs Capped (cap=%f MB, included total=%f MB): %@", buf, 0x20u);
  }
  v57 = (void *)v23;
  objc_msgSend(v52, "addObjectsFromArray:", v23);
  sub_21344E860(obj);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  sub_21344FCA8(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = v25;
  sub_21344FE58(v25, v52);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v58 = 0;
  v50 = v26;
  sub_21344FB18(v26, 0xF00000uLL, (unint64_t *)&v58);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v73 = 15.0;
    v74 = 2048;
    v75 = (double)(unint64_t)v58 * 0.000000953674316;
    v76 = 2112;
    v77 = v27;
    _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Top Offender Logs Capped (cap=%f MB, included total=%f MB): %@", buf, 0x20u);
  }
  v49 = (void *)v27;
  objc_msgSend(v52, "addObjectsFromArray:", v27);
  v28 = 15728640 - v58;
  if ((unint64_t)v58 > 0xF00000)
    v28 = 0;
  v47 = v28;
  sub_21344FCA8(obj);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v31 = v29;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, buf, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v69 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v36, v47);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "pathExtension");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("lite_diag"));

        if (v39)
          objc_msgSend(v30, "addObject:", v36);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, buf, 16);
    }
    while (v33);
  }

  sub_21344FE58(v30, v52);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v68 = 0;
  sub_21344FB18(v40, 0x100000uLL, (unint64_t *)&v68);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v73 = 1.0;
    v74 = 2048;
    v75 = (double)(unint64_t)v68 * 0.000000953674316;
    v76 = 2112;
    v77 = (uint64_t)v41;
    _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Recent Lite Diags Capped (cap=%f MB, included total=%f MB): %@", buf, 0x20u);
  }
  objc_msgSend(v52, "addObjectsFromArray:", v41, v47);
  v42 = 0x100000 - v68;
  if ((unint64_t)v68 > 0x100000)
    v42 = 0;
  v43 = v48 + v42 + 14680064;
  sub_21344FE58(v31, v52);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  sub_21344FB18(v44, v43, (unint64_t *)&v63);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v73 = (double)v43 * 0.000000953674316;
    v74 = 2048;
    v75 = (double)(unint64_t)v58 * 0.000000953674316;
    v76 = 2112;
    v77 = (uint64_t)v45;
    _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Recent Logs Capped (cap=%f MB, included total=%f MB): %@", buf, 0x20u);
  }
  objc_msgSend(v52, "addObjectsFromArray:", v45);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v73 = *(double *)&v52;
    _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Completed List of Files for sysdiagnose: %@", buf, 0xCu);
  }

  return v52;
}

+ (id)getGcoreSpoolWithCreateIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  id v16;
  char v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  +[RMECacheEnumerator getLogContainer:](RMECacheEnumerator, "getLogContainer:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v14 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("/gcore_spool"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    if (objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, &v17))
      v10 = v17 == 0;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v8;
        _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Directory doesn't exist -> trying to create directory at path: %@", buf, 0xCu);
      }
      v16 = 0;
      objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v16);
      v11 = v16;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v8, &v17);

      if (!v13 || !v17)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v19 = v8;
          v20 = 2112;
          v21 = v11;
          _os_log_error_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error: error creating directory at path %@ %@", buf, 0x16u);
        }

        v14 = 0;
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v8;
        _os_log_impl(&dword_21344C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Successfully created directory at path %@", buf, 0xCu);
      }

    }
  }
  v14 = v7;
LABEL_17:

LABEL_19:
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_internalEnumerator, 0);
}

+ (id)getLogContainer:(BOOL)a3
{
  if (qword_253D9AAD8 != -1)
    dispatch_once(&qword_253D9AAD8, &unk_24CFC94B8);
  return (id)qword_253D9AAD0;
}

+ (id)getEPLProfilePath
{
  if (qword_253D9AAE8 != -1)
    dispatch_once(&qword_253D9AAE8, &unk_24CFC94D8);
  return (id)qword_253D9AAE0;
}

@end
