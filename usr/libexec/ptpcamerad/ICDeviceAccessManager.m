@implementation ICDeviceAccessManager

- (ICDeviceAccessManager)init
{
  ICDeviceAccessManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *deviceAccessQueue;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  ICDeviceAccessManager *v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ICDeviceAccessManager;
  v2 = -[ICDeviceAccessManager init](&v18, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("ICDeviceAccessManagerQueue", 0);
    deviceAccessQueue = v2->_deviceAccessQueue;
    v2->_deviceAccessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_semaphore_create(0);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v6 = objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager deviceAccessQueue](v2, "deviceAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000162F8;
    block[3] = &unk_100048A88;
    v2 = v2;
    v11 = v2;
    v13 = &v14;
    v7 = v5;
    v12 = v7;
    dispatch_async(v6, block);

    v8 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v7, v8);
    if (!*((_BYTE *)v15 + 24))
    {

      v2 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }
  return v2;
}

- (int)openDB:(id)a3
{
  return sqlite3_open((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), &self->_externalMediaAccessDB);
}

- (void)dealloc
{
  __CFString *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (sqlite3_close(self->_externalMediaAccessDB))
  {
    __ICOSLogCreate();
    v3 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to close database")));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();

  }
  v6.receiver = self;
  v6.super_class = (Class)ICDeviceAccessManager;
  -[ICDeviceAccessManager dealloc](&v6, "dealloc");
}

+ (id)sharedAccessManager
{
  if (qword_10005F498 != -1)
    dispatch_once(&qword_10005F498, &stru_100048B90);
  return (id)qword_10005F490;
}

- (NSArray)bundleIdentifiersAccessingExternalCameras
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager bundleIdentifiersWithAccessType:](self, "bundleIdentifiersWithAccessType:", CFSTR("read_access")));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "objectForKeyedSubscript:", CFSTR("bundle_id")));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)updateApplicationWithBundleIdentifier:(id)a3 withStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  NSObject *v29;
  id v30;
  _BYTE buf[24];

  v4 = a4;
  v6 = a3;
  v7 = -[ICDeviceAccessManager bundleIdentifier:stateForAccessType:](self, "bundleIdentifier:stateForAccessType:", v6, CFSTR("write_access"));
  v8 = -[ICDeviceAccessManager bundleIdentifier:stateForAccessType:](self, "bundleIdentifier:stateForAccessType:", v6, CFSTR("read_access"));
  if (v7)
  {
    if (v4)
      v9 = 2;
    else
      v9 = 1;
    -[ICDeviceAccessManager updateBundleIdentifier:accessType:withState:](self, "updateBundleIdentifier:accessType:withState:", v6, CFSTR("write_access"), v9);
    __ICOSLogCreate();
    v10 = CFSTR("PrivacySettings");
    if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Setting (write) Access State %d"), v6, v4));
    v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:
      v10 = objc_retainAutorelease(v10);
      v15 = v13;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = -[__CFString UTF8String](v10, "UTF8String");
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  else
  {
    __ICOSLogCreate();
    v10 = CFSTR("PrivacySettings");
    if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR("..")));

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (write) Access State Unknown, not updating"), v6));
    v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
  }

  if (v8)
  {
    if (v4)
      v16 = 2;
    else
      v16 = 1;
    -[ICDeviceAccessManager updateBundleIdentifier:accessType:withState:](self, "updateBundleIdentifier:accessType:withState:", v6, CFSTR("read_access"), v16);
    __ICOSLogCreate();
    v17 = CFSTR("PrivacySettings");
    if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", CFSTR("..")));

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Setting (read) Access State %d"), v6, v4, *(_OWORD *)buf, *(_QWORD *)&buf[16]));
    v20 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:
      v17 = objc_retainAutorelease(v17);
      v22 = v20;
      v23 = -[__CFString UTF8String](v17, "UTF8String");
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  else
  {
    __ICOSLogCreate();
    v17 = CFSTR("PrivacySettings");
    if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR("..")));

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (read) Access State Unknown, not updating"), v6));
    v20 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
  }

  __ICOSLogCreate();
  v24 = CFSTR("DEPRECATED");
  if ((unint64_t)objc_msgSend(CFSTR("DEPRECATED"), "length") >= 0x15)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("DEPRECATED"), "substringWithRange:", 0, 18));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingString:", CFSTR("..")));

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("updateApplicationWithBundleIdentifier:%@ withStatus:%d"), v6, v4, *(_QWORD *)buf, *(_OWORD *)&buf[8]));
  v27 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_retainAutorelease(v24);
    v29 = v27;
    v30 = -[__CFString UTF8String](v28, "UTF8String");
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v26;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

- (NSArray)bundleIdentifiersAccessingExternalCamerasWithStatus
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *j;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  __CFString *v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  NSObject *v53;
  id v54;
  ICDeviceAccessManager *v56;
  id v57;
  id obj;
  uint64_t v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];

  v60 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v56 = self;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager bundleIdentifiersWithAccessType:](self, "bundleIdentifiersWithAccessType:", CFSTR("read_access")));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("read_access")));
        v9 = objc_msgSend(v8, "intValue");

        if (v9 == 1)
        {
          v10 = 0;
          goto LABEL_10;
        }
        if (v9 == 2)
        {
          v10 = 1;
LABEL_10:
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
          -[__CFString setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, CFSTR("whitelisted"));

          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundle_id")));
          -[__CFString setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, CFSTR("bundle_id"));

          objc_msgSend(v60, "addObject:", v11);
          __ICOSLogCreate();
          v14 = CFSTR("PrivacySettings");
          if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18));
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundle_id")));
          v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (read) Access State %d, adding"), v16, v10));

          v18 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v19 = objc_retainAutorelease(v14);
            v20 = v18;
            v21 = -[__CFString UTF8String](v19, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v71 = v21;
            v72 = 2114;
            v73 = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          goto LABEL_18;
        }
        __ICOSLogCreate();
        v11 = CFSTR("PrivacySettings");
        if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18));
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", CFSTR("..")));

        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundle_id")));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (read) Access State Unknown, not adding"), v23));

        v24 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_retainAutorelease(v11);
          v17 = v24;
          v25 = -[__CFString UTF8String](v11, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v71 = v25;
          v72 = 2114;
          v73 = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
LABEL_18:

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    }
    while (v4);
  }
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v57 = (id)objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager bundleIdentifiersWithAccessType:](v56, "bundleIdentifiersWithAccessType:", CFSTR("write_access")));
  v26 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (!v26)
    goto LABEL_41;
  v27 = v26;
  v59 = *(_QWORD *)v62;
  do
  {
    for (j = 0; j != v27; j = (char *)j + 1)
    {
      if (*(_QWORD *)v62 != v59)
        objc_enumerationMutation(v57);
      v29 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("write_access")));
      v31 = objc_msgSend(v30, "intValue");

      if (v31 == 1)
      {
        v32 = 0;
        goto LABEL_30;
      }
      if (v31 == 2)
      {
        v32 = 1;
LABEL_30:
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v32));
        -[__CFString setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v34, CFSTR("whitelisted"));

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("bundle_id")));
        -[__CFString setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v35, CFSTR("bundle_id"));

        objc_msgSend(v60, "addObject:", v33);
        __ICOSLogCreate();
        v36 = CFSTR("PrivacySettings");
        if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18));
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringByAppendingString:", CFSTR("..")));

        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("bundle_id")));
        v39 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (write) Access State %d, adding"), v38, v32));

        v40 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v41 = objc_retainAutorelease(v36);
          v42 = v40;
          v43 = -[__CFString UTF8String](v41, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v71 = v43;
          v72 = 2114;
          v73 = v39;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        goto LABEL_38;
      }
      __ICOSLogCreate();
      v33 = CFSTR("PrivacySettings");
      if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringByAppendingString:", CFSTR("..")));

      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("bundle_id")));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (write) Access State Unknown, not adding"), v45));

      v46 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_retainAutorelease(v33);
        v39 = v46;
        v47 = -[__CFString UTF8String](v33, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v71 = v47;
        v72 = 2114;
        v73 = v36;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
LABEL_38:

      }
    }
    v27 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  }
  while (v27);
LABEL_41:
  __ICOSLogCreate();
  v48 = CFSTR("DEPRECATED");
  if ((unint64_t)objc_msgSend(CFSTR("DEPRECATED"), "length") >= 0x15)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("DEPRECATED"), "substringWithRange:", 0, 18));
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "stringByAppendingString:", CFSTR("..")));

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bundleIdentifiersAccessingExternalCamerasWithStatus: %@"), v60));
  v51 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v52 = objc_retainAutorelease(v48);
    v53 = v51;
    v54 = -[__CFString UTF8String](v52, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v71 = v54;
    v72 = 2114;
    v73 = v50;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  return (NSArray *)v60;
}

- (NSArray)allBundleIdentifiers
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  dispatch_semaphore_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10001771C;
  v15 = sub_10001772C;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = dispatch_semaphore_create(0);
  v4 = objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017734;
  block[3] = &unk_100048BE0;
  v9 = v3;
  v10 = &v11;
  block[4] = self;
  v5 = v3;
  dispatch_async(v4, block);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

- (void)addBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD block[4];
  id v13;
  ICDeviceAccessManager *v14;
  dispatch_semaphore_t v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager allBundleIdentifiers](self, "allBundleIdentifiers"));
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    __ICOSLogCreate();
    v6 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18));
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is already in the database, will not be added again"), v4));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();
  }
  else
  {
    v9 = dispatch_semaphore_create(0);
    v10 = objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017C68;
    block[3] = &unk_100048908;
    v13 = v4;
    v14 = self;
    v15 = v9;
    v6 = v9;
    dispatch_async(v10, block);

    v11 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v6, v11);

    v8 = v13;
  }

}

- (void)updateBundleIdentifier:(id)a3 accessType:(id)a4 withState:(unint64_t)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_time_t v15;
  _QWORD block[4];
  id v17;
  id v18;
  ICDeviceAccessManager *v19;
  dispatch_semaphore_t v20;
  unint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = dispatch_semaphore_create(0);
  v11 = objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017E2C;
  block[3] = &unk_100048C08;
  v20 = v10;
  v21 = a5;
  v17 = v9;
  v18 = v8;
  v19 = self;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, block);

  v15 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v12, v15);

}

- (id)bundleIdentifiersWithAccessType:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  ICDeviceAccessManager *v14;
  dispatch_semaphore_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10001771C;
  v21 = sub_10001772C;
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = dispatch_semaphore_create(0);
  v6 = objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000180D8;
  v12[3] = &unk_100048C30;
  v13 = v4;
  v14 = self;
  v15 = v5;
  v16 = &v17;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, v12);

  v9 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v7, v9);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (unint64_t)connection:(id)a3 stateForAccessType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __SecTask *v11;
  __SecTask *v12;
  __CFString *v13;
  audit_token_t v15;
  audit_token_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)xpc_connection_copy_entitlement_value(v6, "com.apple.private.imagecapturecore.authorization_bypass");
  v9 = v8;
  if (v8 && xpc_BOOL_get_value(v8))
  {
    v10 = 2;
  }
  else
  {
    memset(&v16, 0, sizeof(v16));
    xpc_connection_get_audit_token(v6, &v16);
    v15 = v16;
    v11 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v15);
    if (v11)
    {
      v12 = v11;
      *(_QWORD *)v15.val = 0;
      v13 = (__CFString *)SecTaskCopySigningIdentifier(v11, (CFErrorRef *)&v15);
      CFRelease(v12);
    }
    else
    {
      v13 = 0;
    }
    v10 = -[ICDeviceAccessManager bundleIdentifier:stateForAccessType:](self, "bundleIdentifier:stateForAccessType:", v13, v7);

  }
  return v10;
}

- (unint64_t)bundleIdentifier:(id)a3 stateForAccessType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  -[ICDeviceAccessManager validateBundleIdentifierInstalled:](self, "validateBundleIdentifierInstalled:", v6);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager bundleIdentifiersWithAccessType:](self, "bundleIdentifiersWithAccessType:", v7));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bundle_id")));
        v16 = objc_msgSend(v15, "isEqualToString:", v6);

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v19));
          v11 = (int)objc_msgSend(v17, "intValue");

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)revokeBundleIdentifier:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  dispatch_time_t v12;
  _QWORD block[4];
  id v14;
  ICDeviceAccessManager *v15;
  dispatch_semaphore_t v16;

  v4 = a3;
  __ICOSLogCreate();
  v5 = CFSTR("icaccess");
  if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Revoking Application BundleID %@"), v4));
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
    sub_10002FADC();

  v8 = dispatch_semaphore_create(0);
  v9 = objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000187D8;
  block[3] = &unk_100048908;
  v14 = v4;
  v15 = self;
  v16 = v8;
  v10 = v8;
  v11 = v4;
  dispatch_async(v9, block);

  v12 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v10, v12);

}

- (BOOL)validateBundleIdentifierInstalled:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  id v21;
  BOOL v22;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _QWORD block[4];
  id v32;
  ICDeviceAccessManager *v33;
  NSObject *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];

  v3 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_10001771C;
  v40 = sub_10001772C;
  v41 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = dispatch_semaphore_create(0);
  v5 = objc_claimAutoreleasedReturnValue(-[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018CE8;
  block[3] = &unk_100048C30;
  v6 = v3;
  v32 = v6;
  v33 = self;
  v35 = &v36;
  v7 = v4;
  v34 = v7;
  dispatch_async(v5, block);

  v8 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v7, v8);
  v30 = 0;
  v9 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v30);
  v10 = v30;
  v24 = v10;
  if (v9 && !v10)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = (id)v37[5];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v46, 16, v24);
    if (v12)
    {
      v13 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("bundle_id")));
          v16 = objc_msgSend(v15, "isEqualToString:", v6);

          if ((v16 & 1) != 0)
          {

            v22 = 1;
            goto LABEL_19;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v46, 16);
        if (v12)
          continue;
        break;
      }
    }

  }
  __ICOSLogCreate();
  if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") < 0x15)
  {
    v18 = CFSTR("icaccess");
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Bundle was not found to be installed on the device, revoking access defensively to require the user to re-authorize upon install."), v24));
  v20 = (id)_gICOSLog;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = -[__CFString UTF8String](objc_retainAutorelease(v18), "UTF8String");
    *(_DWORD *)buf = 136446466;
    v43 = v21;
    v44 = 2114;
    v45 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  -[ICDeviceAccessManager revokeBundleIdentifier:](self, "revokeBundleIdentifier:", v6);
  v22 = 0;
LABEL_19:

  _Block_object_dispose(&v36, 8);
  return v22;
}

- (void)displayAlertForApplication:(id)a3 withNotification:(id)a4 completionBlock:(id)a5
{
  void (**v6)(id, uint64_t, CFOptionFlags);
  __CFUserNotification *v7;
  __CFUserNotification *v8;
  CFOptionFlags v9;
  SInt32 error;

  v6 = (void (**)(id, uint64_t, CFOptionFlags))a5;
  error = 0;
  v7 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, &error, (CFDictionaryRef)a4);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    CFUserNotificationReceiveResponse(v7, 0.0, &v9);
    v6[2](v6, 1, v9);
    CFRelease(v8);
  }

}

- (BOOL)captureUserIntentForBundleIdentifier:(id)a3 withNotification:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (v6)
  {
    v7 = dispatch_semaphore_create(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100019010;
    v12[3] = &unk_100048C58;
    v14 = &v15;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "displayAlertForApplication:withNotification:completionBlock:", v5, v6, v12);

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v10 = *((_BYTE *)v16 + 24) != 0;
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (sqlite3)externalMediaAccessDB
{
  return self->_externalMediaAccessDB;
}

- (void)setExternalMediaAccessDB:(sqlite3 *)a3
{
  self->_externalMediaAccessDB = a3;
}

- (OS_dispatch_queue)deviceAccessQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceAccessQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAccessQueue, 0);
}

@end
