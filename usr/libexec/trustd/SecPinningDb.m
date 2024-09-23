@implementation SecPinningDb

- (BOOL)queryCacheForSuffix:(id)a3 firstLabel:(id)a4 results:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  os_unfair_lock_s *p_regexCacheLock;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v28;
  os_unfair_lock_s *v29;
  BOOL v30;
  id v31;
  SecPinningDb *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _QWORD v38[2];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];

  v8 = a3;
  v9 = a4;
  if (+[SecPinningDb enableInMemoryCache](SecPinningDb, "enableInMemoryCache"))
  {
    v10 = 0;
  }
  else
  {
    p_regexCacheLock = &self->_regexCacheLock;
    os_unfair_lock_lock(&self->_regexCacheLock);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecPinningDb regexCache](self, "regexCache"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));
    v10 = v13 != 0;

    if (v13)
    {
      v29 = &self->_regexCacheLock;
      v30 = v13 != 0;
      v32 = self;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecPinningDb regexCacheList](self, "regexCacheList"));
      v31 = v8;
      objc_msgSend(v14, "insertObject:atIndex:", v8, 0);

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v28 = v13;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v34;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v34 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v19);
            if (objc_msgSend(v20, "numberOfMatchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length")))
            {
              v21 = sub_100011628("SecPinningDb");
              v22 = objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v9;
                v41 = 2112;
                v42 = v31;
                _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "found matching rule in cache for %@.%@", buf, 0x16u);
              }

              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v20));
              v24 = v23;
              if (a5)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PinningPolicyName")));
                if (-[SecPinningDb isPinningDisabled:](v32, "isPinningDisabled:", v25))
                {
                  v37[0] = CFSTR("PinningRules");
                  v37[1] = CFSTR("PinningPolicyName");
                  v38[0] = &off_10007FEB8;
                  v38[1] = v25;
                  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 2));
                }
                else
                {
                  v26 = objc_retainAutorelease(v24);
                }
                *a5 = v26;

              }
            }
            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        }
        while (v17);
      }

      v8 = v31;
      v10 = v30;
      v13 = v28;
      p_regexCacheLock = v29;
    }
    os_unfair_lock_unlock(p_regexCacheLock);

  }
  return v10;
}

+ (BOOL)enableInMemoryCache
{
  return 0;
}

- (NSMutableDictionary)regexCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isPinningDisabled:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;
  unsigned int v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  id v10;
  int v12;
  id v13;
  __int16 v14;
  unsigned int v15;

  v3 = a3;
  if (!SecIsInternalRelease(v3))
  {
    LOBYTE(v6) = 0;
    if (!v3)
      goto LABEL_12;
    goto LABEL_10;
  }
  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.security"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("AppleServerAuthenticationNoPinning"));
  LOBYTE(v6) = v5;
  if (v3 && (v5 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("AppleServerAuthenticationNoPinning")));
    objc_msgSend(v7, "appendString:", v3);
    v6 = objc_msgSend(v4, "BOOLForKey:", v7);
    v8 = sub_100011628("pinningQA");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412546;
      v13 = v3;
      v14 = 1024;
      v15 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ disable pinning = %{BOOL}d", (uint8_t *)&v12, 0x12u);
    }

  }
  if (v3)
  {
LABEL_10:
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("IdMS")))
    {
      v10 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.security"));
      LOBYTE(v6) = objc_msgSend(v10, "BOOLForKey:", CFSTR("AppleServerAuthenticationNoPinningIdMS"));

    }
  }
LABEL_12:
  if (qword_100082DB8 != -1)
    dispatch_once(&qword_100082DB8, &stru_100077B40);
  dispatch_source_merge_data((dispatch_source_t)qword_100082DC0, 1uLL);

  return v6;
}

- (id)queryForPolicyName:(id)a3
{
  id v4;
  void *v5;
  const void *v7;
  NSObject *v8;
  __OpaqueSecDb *db;
  uint64_t v10;
  id v11;
  _BOOL4 v12;
  _BOOL4 v13;
  const void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  __int128 *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  _UNKNOWN **v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[2];
  _QWORD v45[2];
  uint8_t buf[4];
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v4 = a3;
  if (!self->_queue)

  if (!self->_db)
    -[SecPinningDb initializedDb](self, "initializedDb");
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("sslServer")) & 1) != 0)
    goto LABEL_8;
  v5 = 0;
  if (!-[SecPinningDb isPinningDisabled:](self, "isPinningDisabled:", 0))
  {
    if (-[SecPinningDb isPinningDisabled:](self, "isPinningDisabled:", v4))
    {
LABEL_8:
      v5 = 0;
      goto LABEL_9;
    }
    v7 = sub_100011628("SecPinningDb");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v48) = 138412290;
      *(_QWORD *)((char *)&v48 + 4) = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Fetching rules for policy named %@", (uint8_t *)&v48, 0xCu);
    }

    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 1;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    *(_QWORD *)&v48 = 0;
    *((_QWORD *)&v48 + 1) = &v48;
    v49 = 0x3032000000;
    v50 = sub_1000429E0;
    v51 = sub_1000429F0;
    v52 = (id)0xAAAAAAAAAAAAAAAALL;
    v52 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = sub_1000429E0;
    v32 = sub_1000429F0;
    v33 = &off_10007FDB8;
    db = self->_db;
    v10 = (uint64_t)(v35 + 3);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001B1F0;
    v22[3] = &unk_100077C50;
    v24 = &v38;
    v25 = &v34;
    v11 = v4;
    v23 = v11;
    v26 = &v48;
    v27 = &v28;
    v12 = sub_1000193B4((uint64_t)db, v10, (uint64_t)v22);
    if (*((_BYTE *)v39 + 24))
      v13 = v12;
    else
      v13 = 0;
    *((_BYTE *)v39 + 24) = v13;
    if (!v13 || v35[3])
    {
      v14 = sub_100011628("SecError");
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v35[3];
        *(_DWORD *)buf = 138412290;
        v47 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SecPinningDb: error querying DB for policyName: %@", buf, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[TrustAnalytics logger](TrustAnalytics, "logger"));
      v18 = v35[3];
      v44[0] = CFSTR("database");
      v44[1] = CFSTR("operation");
      v45[0] = &off_10007FDD0;
      v45[1] = &off_10007FE18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 2));
      objc_msgSend(v17, "logHardError:withEventName:withAttributes:", v18, CFSTR("DatabaseEvent"), v19);

      v20 = (const void *)v35[3];
      if (v20)
      {
        v35[3] = 0;
        CFRelease(v20);
      }
    }
    if (objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 40), "count"))
    {
      v21 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 40);
      v42[0] = CFSTR("PinningRules");
      v42[1] = CFSTR("PinningPolicyName");
      v43[0] = v21;
      v43[1] = v11;
      v42[2] = CFSTR("PinningTransparentConnection");
      v43[2] = v29[5];
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 3));
    }
    else
    {
      v5 = 0;
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
  }
LABEL_9:

  return v5;
}

- (id)queryForDomain:(id)a3
{
  id v4;
  char *v5;
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  id v13;
  void *v14;
  __OpaqueSecDb *db;
  _BOOL4 v16;
  _BOOL4 v17;
  const void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[12];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  _UNKNOWN **v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[4];
  uint64_t v76;
  _QWORD v77[2];
  _QWORD v78[2];
  uint8_t buf[4];
  uint64_t v80;

  v4 = a3;
  if (!self->_queue)

  if (!self->_db)
    -[SecPinningDb initializedDb](self, "initializedDb");
  v5 = (char *)objc_msgSend(v4, "rangeOfString:", CFSTR("."));
  if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v7 = v5;
    v64 = 0;
    v65 = &v64;
    v66 = 0x3032000000;
    v67 = sub_1000429E0;
    v68 = sub_1000429F0;
    v69 = (id)0xAAAAAAAAAAAAAAAALL;
    v69 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", v5));
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = sub_1000429E0;
    v62 = sub_1000429F0;
    v63 = (id)0xAAAAAAAAAAAAAAAALL;
    v63 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", v7 + 1));
    if (objc_msgSend((id)v59[5], "hasSuffix:", CFSTR(".")))
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v59[5], "substringToIndex:", (char *)objc_msgSend((id)v59[5], "length") - 1));
      v9 = (void *)v59[5];
      v59[5] = v8;

    }
    v10 = v59[5];
    v11 = v65[5];
    v57 = 0;
    v12 = -[SecPinningDb queryCacheForSuffix:firstLabel:results:](self, "queryCacheForSuffix:firstLabel:results:", v10, v11, &v57);
    v13 = v57;
    v14 = v13;
    if (v12)
    {
      v6 = v13;
    }
    else
    {
      v53 = 0;
      v54 = &v53;
      v55 = 0x2020000000;
      v56 = 1;
      v49 = 0;
      v50 = &v49;
      v51 = 0x2020000000;
      v52 = 0;
      v43 = 0;
      v44 = &v43;
      v45 = 0x3032000000;
      v46 = sub_1000429E0;
      v47 = sub_1000429F0;
      v48 = (id)0xAAAAAAAAAAAAAAAALL;
      v48 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v40 = 0;
      v41[0] = &v40;
      v41[1] = 0x3032000000;
      v41[2] = sub_1000429E0;
      v41[3] = sub_1000429F0;
      v42 = 0;
      v37 = 0;
      v38[0] = &v37;
      v38[1] = 0x3032000000;
      v38[2] = sub_1000429E0;
      v38[3] = sub_1000429F0;
      v39 = &off_10007FDB8;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = sub_1000429E0;
      v35 = sub_1000429F0;
      v36 = (id)0xAAAAAAAAAAAAAAAALL;
      v36 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      db = self->_db;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10001A408;
      v30[3] = &unk_100077BD8;
      v30[4] = &v53;
      v30[5] = &v49;
      v30[6] = &v58;
      v30[7] = &v31;
      v30[8] = &v64;
      v30[9] = &v43;
      v30[10] = &v40;
      v30[11] = &v37;
      v16 = sub_1000193B4((uint64_t)db, (uint64_t)(v50 + 3), (uint64_t)v30);
      if (*((_BYTE *)v54 + 24))
        v17 = v16;
      else
        v17 = 0;
      *((_BYTE *)v54 + 24) = v17;
      if (!v17 || v50[3])
      {
        v18 = sub_100011628("SecError");
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v50[3];
          *(_DWORD *)buf = 138412290;
          v80 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SecPinningDb: error querying DB for hostname: %@", buf, 0xCu);
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[TrustAnalytics logger](TrustAnalytics, "logger"));
        v22 = v50[3];
        v77[0] = CFSTR("database");
        v77[1] = CFSTR("operation");
        v78[0] = &off_10007FDD0;
        v78[1] = &off_10007FE18;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v78, v77, 2));
        objc_msgSend(v21, "logHardError:withEventName:withAttributes:", v22, CFSTR("DatabaseEvent"), v23);

        v24 = (const void *)v50[3];
        if (v24)
        {
          v50[3] = 0;
          CFRelease(v24);
        }
      }
      if (objc_msgSend((id)v32[5], "count"))
        -[SecPinningDb addSuffixToCache:entry:](self, "addSuffixToCache:entry:", v59[5], v32[5]);
      if (objc_msgSend((id)v44[5], "count"))
      {
        if (-[SecPinningDb isPinningDisabled:](self, "isPinningDisabled:", *(_QWORD *)(v41[0] + 40)))
        {
          v25 = v41;
          v75[1] = CFSTR("PinningRules");
          v75[2] = CFSTR("PinningPolicyName");
          v75[3] = &off_10007FED0;
          v26 = &v76;
        }
        else
        {
          v25 = v38;
          v27 = v44[5];
          v70 = CFSTR("PinningRules");
          v71 = CFSTR("PinningPolicyName");
          v28 = *(_QWORD *)(v41[0] + 40);
          v73 = v27;
          v74 = v28;
          v72 = CFSTR("PinningTransparentConnection");
          v26 = v75;
        }
        *v26 = *(_QWORD *)(*v25 + 40);
        v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:"));
      }
      else
      {
        v6 = 0;
      }
      _Block_object_dispose(&v31, 8);

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v40, 8);

      _Block_object_dispose(&v43, 8);
      _Block_object_dispose(&v49, 8);
      _Block_object_dispose(&v53, 8);
    }

    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v64, 8);

  }
  return v6;
}

- (id)getSchemaVersion:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  char v4;
  char v5;
  id v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000429E0;
  v13 = sub_1000429F0;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100043DB0;
  v8[3] = &unk_100077940;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = &v15;
  v8[5] = &v9;
  v4 = sub_10001979C((uint64_t)a3, CFSTR("PRAGMA user_version"), (CFTypeRef *)a4, (uint64_t)v8);
  if (*((_BYTE *)v16 + 24))
    v5 = v4;
  else
    v5 = 0;
  *((_BYTE *)v16 + 24) = v5;
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (BOOL)setSchemaVersion:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  __CFString *v6;
  char v7;
  const void *v8;
  NSObject *v9;
  __CFError *v10;
  uint8_t buf[4];
  __CFError *v13;

  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PRAGMA user_version = %llu"), 3));
  v7 = sub_1000279E0((uint64_t)a3, v6, (CFTypeRef *)a4);
  if ((v7 & 1) == 0)
  {
    v8 = sub_100011628("SecError");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v10 = *a4;
      else
        v10 = 0;
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to create admin table: %@", buf, 0xCu);
    }

  }
  return v7;
}

- (id)getContentVersion:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  char v4;
  char v5;
  id v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000429E0;
  v13 = sub_1000429F0;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100043CDC;
  v8[3] = &unk_100077940;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = &v15;
  v8[5] = &v9;
  v4 = sub_10001979C((uint64_t)a3, CFSTR("SELECT ival FROM admin WHERE key='version'"), (CFTypeRef *)a4, (uint64_t)v8);
  if (*((_BYTE *)v16 + 24))
    v5 = v4;
  else
    v5 = 0;
  *((_BYTE *)v16 + 24) = v5;
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (BOOL)setContentVersion:(id)a3 dbConnection:(__OpaqueSecDbConnection *)a4 error:(__CFError *)a5
{
  BOOL v7;
  id v8;
  char v9;
  char v10;
  const void *v11;
  NSObject *v12;
  __CFError *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  CFTypeRef *v18;
  __OpaqueSecDbConnection *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  __CFError *v27;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v7 = 1;
  v23 = 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100043BD4;
  v15[3] = &unk_100077968;
  v17 = &v20;
  v18 = (CFTypeRef *)a5;
  v8 = a3;
  v16 = v8;
  v19 = a4;
  v9 = sub_10001979C((uint64_t)a4, CFSTR("INSERT OR REPLACE INTO admin (key,ival,value) VALUES (?,?,?)"), v18, (uint64_t)v15);
  if (*((_BYTE *)v21 + 24))
    v10 = v9;
  else
    v10 = 0;
  *((_BYTE *)v21 + 24) = v10;
  if ((v10 & 1) == 0)
  {
    v11 = sub_100011628("SecError");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a5)
        v13 = *a5;
      else
        v13 = 0;
      *(_DWORD *)buf = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to set version %@ from pinning list: %@", buf, 0x16u);
    }

    v7 = *((_BYTE *)v21 + 24) != 0;
  }

  _Block_object_dispose(&v20, 8);
  return v7;
}

- (BOOL)shouldUpdateContent:(id)a3 error:(id *)a4
{
  id v6;
  __OpaqueSecDb *v7;
  uint64_t v8;
  id v9;
  const void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v7 = -[SecPinningDb db](self, "db");
  v8 = (uint64_t)(v25 + 3);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100043A5C;
  v16[3] = &unk_100077990;
  v16[4] = self;
  v18 = &v24;
  v9 = v6;
  v17 = v9;
  v19 = &v20;
  if (!sub_1000193B4((uint64_t)v7, v8, (uint64_t)v16) || v25[3])
  {
    v10 = sub_100011628("SecError");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v25[3];
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecPinningDb: error reading content version from database %@", buf, 0xCu);
    }

  }
  if (a4)
  {
    v13 = (void *)v25[3];
    if (v13)
      *a4 = v13;
  }
  v14 = *((_BYTE *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

- (BOOL)insertRuleWithName:(id)a3 domainSuffix:(id)a4 labelRegex:(id)a5 policies:(id)a6 transparentConnection:(id)a7 dbConnection:(__OpaqueSecDbConnection *)a8 error:(__CFError *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  char v26;
  const void *v27;
  NSObject *v28;
  __CFError *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  __CFError **v38;
  __OpaqueSecDbConnection *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  __CFError *v51;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v19 = 1;
  v43 = 1;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000437F4;
  v31[3] = &unk_1000779B8;
  v37 = &v40;
  v20 = v14;
  v32 = v20;
  v38 = a9;
  v21 = v15;
  v33 = v21;
  v22 = v16;
  v34 = v22;
  v23 = v17;
  v35 = v23;
  v24 = v18;
  v36 = v24;
  v39 = a8;
  v25 = sub_10001979C((uint64_t)a8, CFSTR("INSERT OR REPLACE INTO rules (policyName,domainSuffix,labelRegex,policies,transparentConnection) VALUES (?,?,?,?,?) "), (CFTypeRef *)a9, (uint64_t)v31);
  if (*((_BYTE *)v41 + 24))
    v26 = v25;
  else
    v26 = 0;
  *((_BYTE *)v41 + 24) = v26;
  if ((v26 & 1) == 0)
  {
    v27 = sub_100011628("SecError");
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      if (a9)
        v29 = *a9;
      else
        v29 = 0;
      *(_DWORD *)buf = 138413058;
      v45 = v20;
      v46 = 2112;
      v47 = v22;
      v48 = 2112;
      v49 = v21;
      v50 = 2112;
      v51 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to insert rule %@ for %@.%@ with error %@", buf, 0x2Au);
    }

    v19 = *((_BYTE *)v41 + 24) != 0;
  }

  _Block_object_dispose(&v40, 8);
  return v19;
}

- (BOOL)populateDbFromBundle:(id)a3 dbConnection:(__OpaqueSecDbConnection *)a4 error:(__CFError *)a5
{
  id v8;
  BOOL v9;
  const void *v10;
  NSObject *v11;
  __CFError *v12;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  __CFError *v20;

  v8 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000432C8;
  v14[3] = &unk_100077A08;
  v14[4] = self;
  v14[5] = &v15;
  v14[6] = a4;
  v14[7] = a5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
  if (*((_BYTE *)v16 + 24))
  {
    v9 = 1;
  }
  else
  {
    v10 = sub_100011628("SecError");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (a5)
        v12 = *a5;
      else
        v12 = 0;
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to populate DB from pinning list: %@", buf, 0xCu);
    }

    v9 = *((_BYTE *)v16 + 24) != 0;
  }
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (BOOL)removeAllRulesFromDb:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  BOOL v5;
  char v6;
  char v7;
  const void *v8;
  NSObject *v9;
  __CFError *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  __CFError *v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v5 = 1;
  v16 = 1;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100043278;
  v12[3] = &unk_100077A30;
  v12[4] = &v13;
  v12[5] = a3;
  v12[6] = a4;
  v6 = sub_10001979C((uint64_t)a3, CFSTR("DELETE FROM rules;"), (CFTypeRef *)a4, (uint64_t)v12);
  if (*((_BYTE *)v14 + 24))
    v7 = v6;
  else
    v7 = 0;
  *((_BYTE *)v14 + 24) = v7;
  if ((v7 & 1) == 0)
  {
    v8 = sub_100011628("SecError");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v10 = *a4;
      else
        v10 = 0;
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to delete old values: %@", buf, 0xCu);
    }

    v5 = *((_BYTE *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

- (BOOL)createOrAlterAdminTable:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  char v5;
  const void *v6;
  NSObject *v7;
  __CFError *v8;
  int v10;
  __CFError *v11;

  v5 = sub_1000279E0((uint64_t)a3, CFSTR("CREATE TABLE IF NOT EXISTS admin(key TEXT PRIMARY KEY NOT NULL,ival INTEGER NOT NULL,value BLOB);"),
         (CFTypeRef *)a4);
  if ((v5 & 1) == 0)
  {
    v6 = sub_100011628("SecError");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v8 = *a4;
      else
        v8 = 0;
      v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to create admin table: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v5;
}

- (BOOL)createOrAlterRulesTable:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  const void *v12;
  NSObject *v13;
  __CFError *v14;
  BOOL v15;
  int v17;
  __CFError *v18;

  v7 = sub_1000279E0((uint64_t)a3, CFSTR("CREATE TABLE IF NOT EXISTS rules(policyName TEXT NOT NULL,domainSuffix TEXT NOT NULL,labelRegex TEXT NOT NULL,policies BLOB NOT NULL,transparentConnection INTEGER,UNIQUE(policyName, domainSuffix, labelRegex));"),
         (CFTypeRef *)a4);
  v8 = v7 & sub_1000279E0((uint64_t)a3, CFSTR("CREATE INDEX IF NOT EXISTS idomain ON rules(domainSuffix);"),
              (CFTypeRef *)a4);
  v9 = v8 & sub_1000279E0((uint64_t)a3, CFSTR("CREATE INDEX IF NOT EXISTS ipolicy ON rules(policyName);"),
              (CFTypeRef *)a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecPinningDb getSchemaVersion:error:](self, "getSchemaVersion:error:", a3, a4));
  v11 = v10;
  if (!v10 || (int)objc_msgSend(v10, "intValue") < 1 || (int)objc_msgSend(v11, "intValue") > 2)
  {
    if ((v9 & 1) == 0)
      goto LABEL_5;
LABEL_9:
    v15 = 1;
    goto LABEL_13;
  }
  if ((v9 & sub_1000279E0((uint64_t)a3, CFSTR("ALTER TABLE rules ADD COLUMN transparentConnection INTEGER"), (CFTypeRef *)a4) & 1) != 0)goto LABEL_9;
LABEL_5:
  v12 = sub_100011628("SecError");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (a4)
      v14 = *a4;
    else
      v14 = 0;
    v17 = 138412290;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to create rules table: %@", (uint8_t *)&v17, 0xCu);
  }

  v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)installDbFromURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *queue;
  const void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  const void *v20;
  const void *v21;
  _QWORD v23[8];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t v28[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  v6 = a3;
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", CFSTR("CertificatePinning.plist"), v6));
    *(_QWORD *)v28 = 0;
    v29 = v28;
    v30 = 0x3032000000;
    v31 = sub_1000429E0;
    v32 = sub_1000429F0;
    v33 = (id)0xAAAAAAAAAAAAAAAALL;
    v33 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfURL:error:](NSArray, "arrayWithContentsOfURL:error:", v7, a4));
    v8 = (void *)*((_QWORD *)v29 + 5);
    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
      if (-[SecPinningDb shouldUpdateContent:error:](self, "shouldUpdateContent:error:", v9, a4))
      {
        *(_QWORD *)&v40 = 0;
        *((_QWORD *)&v40 + 1) = &v40;
        v41 = 0x2020000000;
        v42 = 0;
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v27 = 1;
        queue = self->_queue;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100043188;
        v23[3] = &unk_100077A80;
        v23[4] = self;
        v23[5] = &v24;
        v23[6] = &v40;
        v23[7] = v28;
        dispatch_sync(queue, v23);
        if (!*((_BYTE *)v25 + 24) || *(_QWORD *)(*((_QWORD *)&v40 + 1) + 24))
        {
          v11 = sub_100011628("SecError");
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v29 + 5), "objectAtIndex:", 0));
            v14 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 24);
            *(_DWORD *)buf = 138412546;
            v37 = v13;
            v38 = 2112;
            v39 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SecPinningDb: error installing updated pinning list version %@: %@", buf, 0x16u);

          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[TrustAnalytics logger](TrustAnalytics, "logger"));
          v16 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 24);
          v34[0] = CFSTR("database");
          v34[1] = CFSTR("operation");
          v35[0] = &off_10007FDD0;
          v35[1] = &off_10007FDE8;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 2));
          objc_msgSend(v15, "logHardError:withEventName:withAttributes:", v16, CFSTR("DatabaseEvent"), v17);

          if (a4)
          {
            v18 = *(void **)(*((_QWORD *)&v40 + 1) + 24);
            if (v18)
              *a4 = v18;
          }
        }
        v19 = *((_BYTE *)v25 + 24) != 0;
        _Block_object_dispose(&v24, 8);
        _Block_object_dispose(&v40, 8);
        goto LABEL_21;
      }
      if (!a4 || !*a4)
      {
        v19 = 1;
        goto LABEL_21;
      }
    }
    else
    {
      v21 = sub_100011628("SecError");
      v9 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v40) = 138412290;
        *(_QWORD *)((char *)&v40 + 4) = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SecPinningDb: unable to create pinning list from asset file: %@", (uint8_t *)&v40, 0xCu);
      }
    }
    v19 = 0;
LABEL_21:

    _Block_object_dispose(v28, 8);
    goto LABEL_22;
  }
  v20 = sub_100011628("SecError");
  v7 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecPinningDb: missing url for downloaded asset", v28, 2u);
  }
  v19 = 0;
LABEL_22:

  return v19;
}

- (id)copySystemPinningList
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  const void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const void *v10;
  id v12;
  uint8_t buf[4];
  id v14;

  v2 = sub_100004464();
  v3 = (void *)v2;
  if (!v2)
  {
    v4 = 0;
LABEL_11:
    v8 = v3;

    v9 = v8;
    goto LABEL_15;
  }
  v4 = *(void **)(v2 + 56);
  if (v4)
    CFRetain(*(CFTypeRef *)(v2 + 56));
  CFRelease(v3);
  if (v4)
  {
    v12 = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfURL:error:](NSArray, "arrayWithContentsOfURL:error:", v4, &v12));
    v5 = v12;
    if (!v3)
    {
      v6 = sub_100011628("SecError");
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to read pinning plist from bundle: %@", buf, 0xCu);
      }

    }
    goto LABEL_11;
  }
  v10 = sub_100011628("SecError");
  v8 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to get pinning plist URL", buf, 2u);
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (BOOL)updateDb:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4 pinningList:(id)a5 updateSchema:(BOOL)a6 updateContent:(BOOL)a7
{
  id v12;
  BOOL v13;
  BOOL v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  __OpaqueSecDbConnection *v19;
  __CFError **v20;
  BOOL v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v12 = a5;
  if (qword_100082C28 != -1)
    dispatch_once(&qword_100082C28, &stru_1000767D0);
  if (byte_100082C20 == 1)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004304C;
    v16[3] = &unk_100077AA8;
    v21 = a6;
    v18 = &v23;
    v19 = a3;
    v16[4] = self;
    v20 = a4;
    v22 = a7;
    v17 = v12;
    v13 = sub_10002884C((uint64_t)a3, 2, (CFTypeRef *)a4, (uint64_t)v16);
    if (*((_BYTE *)v24 + 24))
      v14 = v13;
    else
      v14 = 0;
    *((_BYTE *)v24 + 24) = v14;

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (__OpaqueSecDb)createAtPath
{
  char v3;
  const __CFString *v4;
  __OpaqueSecDb *v5;
  _QWORD v7[5];

  if (qword_100082C28 != -1)
    dispatch_once(&qword_100082C28, &stru_1000767D0);
  v3 = byte_100082C20;
  v4 = CFStringCreateWithCString(0, -[NSURL fileSystemRepresentation](self->_dbPath, "fileSystemRepresentation"), 0x8000100u);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042AB0;
  v7[3] = &unk_100077AF8;
  v7[4] = self;
  v5 = (__OpaqueSecDb *)sub_1000275D0(v4, 384, v3, v3, 0, 0, v7);
  if (v4)
    CFRelease(v4);
  return v5;
}

- (void)initializedDb
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042A58;
  block[3] = &unk_100077B20;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (SecPinningDb)init
{
  SecPinningDb *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMutableDictionary *regexCache;
  uint64_t v9;
  NSMutableArray *regexCacheList;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SecPinningDb;
  v2 = -[SecPinningDb init](&v12, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("Pinning DB Queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    if (+[SecPinningDb enableInMemoryCache](SecPinningDb, "enableInMemoryCache"))
    {
      v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      regexCache = v2->_regexCache;
      v2->_regexCache = (NSMutableDictionary *)v7;

      v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      regexCacheList = v2->_regexCacheList;
      v2->_regexCacheList = (NSMutableArray *)v9;

      v2->_regexCacheLock._os_unfair_lock_opaque = 0;
    }
    -[SecPinningDb initializedDb](v2, "initializedDb");
  }
  return v2;
}

- (void)dealloc
{
  __OpaqueSecDb *db;
  objc_super v4;

  db = self->_db;
  if (db)
  {
    self->_db = 0;
    CFRelease(db);
  }
  v4.receiver = self;
  v4.super_class = (Class)SecPinningDb;
  -[SecPinningDb dealloc](&v4, "dealloc");
}

- (void)clearCache
{
  void *v3;
  void *v4;

  if (!+[SecPinningDb enableInMemoryCache](SecPinningDb, "enableInMemoryCache"))
  {
    os_unfair_lock_lock(&self->_regexCacheLock);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[SecPinningDb setRegexCache:](self, "setRegexCache:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[SecPinningDb setRegexCacheList:](self, "setRegexCacheList:", v4);

    os_unfair_lock_unlock(&self->_regexCacheLock);
  }
}

- (void)addSuffixToCache:(id)a3 entry:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_regexCacheLock;
  const void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  if (!+[SecPinningDb enableInMemoryCache](SecPinningDb, "enableInMemoryCache"))
  {
    p_regexCacheLock = &self->_regexCacheLock;
    os_unfair_lock_lock(&self->_regexCacheLock);
    v9 = sub_100011628("SecPinningDb");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v21 = 134218242;
      v22 = objc_msgSend(v7, "count");
      v23 = 2112;
      v24 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "adding %llu entries for %@ to cache", (uint8_t *)&v21, 0x16u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecPinningDb regexCache](self, "regexCache"));
    v12 = objc_msgSend(v11, "count");

    if ((unint64_t)v12 >= 4)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SecPinningDb regexCacheList](self, "regexCacheList"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));

      v15 = sub_100011628("SecPinningDb");
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v21 = 138412290;
        v22 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "purging LRU suffix: %@", (uint8_t *)&v21, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecPinningDb regexCache](self, "regexCache"));
      objc_msgSend(v17, "removeObjectForKey:", v14);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SecPinningDb regexCacheList](self, "regexCacheList"));
      objc_msgSend(v18, "removeLastObject");

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecPinningDb regexCache](self, "regexCache"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v7, v6);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SecPinningDb regexCacheList](self, "regexCacheList"));
    objc_msgSend(v20, "insertObject:atIndex:", v6, 0);

    os_unfair_lock_unlock(p_regexCacheLock);
  }

}

- (__OpaqueSecDb)db
{
  return self->_db;
}

- (void)setDb:(__OpaqueSecDb *)a3
{
  self->_db = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURL)dbPath
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDbPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (os_unfair_lock_s)regexCacheLock
{
  return self->_regexCacheLock;
}

- (void)setRegexCacheLock:(os_unfair_lock_s)a3
{
  self->_regexCacheLock = a3;
}

- (void)setRegexCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)regexCacheList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRegexCacheList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regexCacheList, 0);
  objc_storeStrong((id *)&self->_regexCache, 0);
  objc_storeStrong((id *)&self->_dbPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)pinningDbPath
{
  return sub_10001DCB8((uint64_t)CFSTR("pinningrules.sqlite3"));
}

@end
