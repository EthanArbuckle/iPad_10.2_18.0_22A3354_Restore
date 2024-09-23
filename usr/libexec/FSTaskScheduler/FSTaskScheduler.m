BOOL isInternalBuild()
{
  if (qword_1000146D0 != -1)
    dispatch_once(&qword_1000146D0, &stru_1000106B0);
  return byte_1000146C8 != 0;
}

void sub_100003AE0(id a1)
{
  byte_1000146C8 = CRIsAppleInternal(a1);
}

id isTaskingEnabled(uint64_t a1)
{
  void *v2;
  id result;

  v2 = (void *)OSAGetDATaskingValue(a1);
  if (!v2 || (result = objc_msgSend(v2, "intValue"), (_DWORD)result != 1))
  {
    NSLog(CFSTR("NANDStats: %@ status not available"), a1);
    return 0;
  }
  return result;
}

uint64_t isSeedBuild()
{
  return 0;
}

BOOL CRUOpenSQLDB()
{
  int v0;
  int v1;
  int v2;
  int v3;
  _BOOL4 v4;
  const char *v5;
  uint32_t v6;
  const char *v7;
  uint32_t v8;
  int v9;
  int v10;
  sqlite3_stmt *pStmt;
  char *errmsg;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  char *v17;

  errmsg = 0;
  if (CRUdb)
  {
    v0 = 0;
    return v0 == 0;
  }
  v0 = sqlite3_open("/var/mobile/Library/Caches/NANDUsage.db", (sqlite3 **)&CRUdb);
  pStmt = 0;
  v1 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "PRAGMA user_version;", -1, &pStmt, 0);
  if (v1 == 100)
    goto LABEL_6;
  if (v1)
    goto LABEL_16;
  if (sqlite3_step(pStmt) == 100)
  {
LABEL_6:
    v2 = sqlite3_column_int(pStmt, 0);
    sqlite3_finalize(pStmt);
    pStmt = 0;
    if (v2 == 1)
      goto LABEL_16;
    v3 = sqlite3_exec((sqlite3 *)CRUdb, "DROP TABLE NANDStats;", 0, 0, &errmsg);
    v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (!v4)
        goto LABEL_16;
      *(_WORD *)buf = 0;
      v5 = "NANDStats: Failed to drop table";
    }
    else
    {
      if (!v4)
        goto LABEL_16;
      *(_WORD *)buf = 0;
      v5 = "NANDStats: Dropping table due to schema mismatch";
    }
    v6 = 2;
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 67109378;
    v15 = v0;
    v16 = 2080;
    v17 = errmsg;
    v5 = "NANDStats: Failed to check user_version for CRUdb - %d %s\n";
    v6 = 18;
  }
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, buf, v6);
LABEL_16:
  if (v0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_DWORD *)buf = 67109120;
    v15 = v0;
    v7 = "NANDStats: Failed to open CRUdb with error number %d\n";
    v8 = 8;
    goto LABEL_25;
  }
  v9 = sqlite3_exec((sqlite3 *)CRUdb, "PRAGMA journal_mode = WAL", 0, 0, &errmsg);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v15 = v10;
      v16 = 2080;
      v17 = errmsg;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats: Failed to enable WAL for CRUdb - %d %s\n", buf, 0x12u);
    }
  }
  v0 = sqlite3_exec((sqlite3 *)CRUdb, "PRAGMA user_version = 1;", 0, 0, &errmsg);
  if (v0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_DWORD *)buf = 67109378;
    v15 = v0;
    v16 = 2080;
    v17 = errmsg;
    v7 = "NANDStats: Failed to set user_version for CRUdb - %d %s\n";
    v8 = 18;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
LABEL_26:
    if (CRUdb)
    {
      sqlite3_close((sqlite3 *)CRUdb);
      CRUdb = 0;
    }
  }
  return v0 == 0;
}

uint64_t CRUCloseSQLDB()
{
  uint64_t result;

  result = CRUdb;
  if (CRUdb)
  {
    result = sqlite3_close((sqlite3 *)CRUdb);
    CRUdb = 0;
  }
  return result;
}

BOOL CRUCreateTable()
{
  return sqlite3_exec((sqlite3 *)CRUdb, "CREATE TABLE IF NOT EXISTS NANDStats( bundleID TEXT NOT NULL,  presentDialog INTEGER,  dialogTimestamp INTEGER DEFAULT 0,  dialogInterval INTEGER DEFAULT 1,  logicalWrites INTEGER DEFAULT 0,  PRIMARY KEY (bundleID))", 0, 0, 0) == 0;
}

CFUserNotificationRef displayNotification(uint64_t a1, uint64_t a2, CFTimeInterval a3)
{
  SInt32 error;

  error = 0;
  return CFUserNotificationCreate(kCFAllocatorDefault, a3, 0, &error, (CFDictionaryRef)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", a1, kCFUserNotificationAlertHeaderKey, CFSTR("Dismiss"), kCFUserNotificationDefaultButtonTitleKey, CFSTR("Learn more"), kCFUserNotificationAlternateButtonTitleKey, a2, kCFUserNotificationAlertMessageKey, 0));
}

void InstallIOCSNotificationHandler()
{
  NSObject *v0;
  mach_port_t v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD handler[4];
  mach_port_name_t v7;
  uint8_t buf[12];
  mach_port_name_t name;

  name = 0;
  if (qword_1000146D8)
    return;
  v0 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "IOCS: Installing IOCS notification handler", buf, 2u);
  }
  qword_1000146D8 = (uint64_t)malloc_type_calloc(1uLL, 0x10uLL, 0x80040803F642BuLL);
  if (mach_port_allocate(mach_task_self_, 1u, &name))
  {
    sub_10000B7C8();
  }
  else if (mach_port_insert_right(mach_task_self_, name, name, 0x14u))
  {
    sub_10000B748();
  }
  else
  {
    v1 = mach_host_self();
    if (host_set_special_port(v1, 32, name))
    {
      sub_10000B6C8();
    }
    else
    {
      if (!mach_port_set_context(mach_task_self_, name, qword_1000146D8))
      {
        v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
        v3 = dispatch_queue_create("com.apple.fs_task_scheduler", v2);
        *(_QWORD *)qword_1000146D8 = v3;
        v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, name, 0, v3);
        *(_QWORD *)(qword_1000146D8 + 8) = v4;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100004198;
        handler[3] = &unk_1000106D0;
        v7 = name;
        dispatch_source_set_event_handler(v4, handler);
        v5 = oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IOCS: Successfully installed mach_port", buf, 2u);
        }
        dispatch_resume(*(dispatch_object_t *)(qword_1000146D8 + 8));
        return;
      }
      sub_10000B648();
    }
  }
  if (name)
    mach_port_deallocate(mach_task_self_, name);
}

void sub_100004198(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))iocompressionstats_notification_server, 0x1000u, *(_DWORD *)(a1 + 32), 0))
  {
    sub_10000B648();
  }
  objc_autoreleasePoolPop(v2);
}

void fetch_and_process_iocs_store_buffer(int a1, int a2)
{
  NSObject *v3;
  const char *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  size_t size;
  uint8_t buf[4];
  int v13;

  size = 0;
  v10 = a1;
  if (sysctlbyname("vfs.io_compression_dump_stats", 0, &size, &v10, 4uLL))
  {
    v3 = oslog;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v4 = "IOCS: Failed to get buffer length\n";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
    return;
  }
  if (size >= 0x6400001)
  {
    v3 = oslog;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v4 = "IOCS: Buffer length needed longer than supported \n";
    goto LABEL_13;
  }
  v5 = malloc_type_calloc(1uLL, size, 0xA236C864uLL);
  if (!v5)
  {
    v3 = oslog;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v4 = "IOCS: Failed to allocate buffer for reading iocs_store_buffer_entry\n";
    goto LABEL_13;
  }
  v6 = v5;
  v7 = sysctlbyname("vfs.io_compression_dump_stats", v5, &size, &v10, 4uLL);
  v8 = oslog;
  v9 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IOCS: Failed to get iocs_store_buffer_entry from XNU", buf, 2u);
    }
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 67109120;
      v13 = a2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IOCS: Sucessfully read iocs_store_buffer. Action = %d", buf, 8u);
    }
    ProcessIOCSStoreBuffer((uint64_t)v6, size, a2);
  }
  free(v6);
}

uint64_t iocompressionstats_notification()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "IOCS: received kernel notification", v2, 2u);
  }
  fetch_and_process_iocs_store_buffer(4, 1);
  return 0;
}

void sub_100004474(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_100004494()
{
  int v0;

  return _os_assumes_log(v0);
}

BOOL sub_1000044A0()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void GetWriteSourceFromFilePath(const char *a1, char *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  const char *v17;
  int v18;
  int v19;
  NSArray *v20;
  id v21;
  id v22;
  __CFString *v23;
  char *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = (void *)ContainerToBundleIDMap;
  v4 = objc_msgSend((id)ContainerToBundleIDMap, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v9 = objc_autoreleasePoolPush();
        v10 = objc_msgSend((id)ContainerToBundleIDMap, "objectForKey:", v8);
        if (!strncmp((const char *)objc_msgSend(v8, "UTF8String"), a1, (size_t)objc_msgSend(v8, "length"))
          || strlen(a1) >= 9
          && !strncmp((const char *)objc_msgSend(v8, "UTF8String"), a1 + 8, (size_t)objc_msgSend(v8, "length")))
        {
          strncpy(a2, (const char *)objc_msgSend(v10, "UTF8String"), 0x3FFuLL);
          objc_autoreleasePoolPop(v9);
          return;
        }
        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v5);
  }
  v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("/private/var/mobile/Library/Caches/"), CFSTR("/private/var/root/Library/Caches/"), CFSTR("/private/var/mobile/Library/Preferences/"), CFSTR("/private/var/root/Library/Preferences/"), CFSTR("/private/var/mobile/Library/HTTPStorages/"), CFSTR("/private/var/root/Library/HTTPStorages/"), CFSTR("/private/var/mobile/Library/Logs/"), CFSTR("/private/var/root/Library/Logs/"), CFSTR("/private/var/mobile/Library/Saved Application State/"), CFSTR("/private/var/root/Library/Saved Application State/"), CFSTR("/private/var/mobile/Library/Cookies/"), CFSTR("/private/var/root/Library/Cookies/"), CFSTR("/private/var/mobile/Library/Application Support/"), CFSTR("/private/var/root/Library/Application Support/"), CFSTR("/private/var/mobile/Library/"), CFSTR("/private/var/root/Library/"), CFSTR("/private/var/mobile/"),
          CFSTR("/private/var/root/"),
          CFSTR("/private/var/db/"),
          CFSTR("/private/var/log/"),
          CFSTR("/private/var/logs/"),
          CFSTR("/private/var/tmp/"),
          CFSTR("/private/var/preferences/"),
          CFSTR("/private/var/"),
          CFSTR("/dev/"),
          0);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (!v12)
    goto LABEL_23;
  v13 = v12;
  v14 = *(_QWORD *)v27;
  while (2)
  {
    for (j = 0; j != v13; j = (char *)j + 1)
    {
      if (*(_QWORD *)v27 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
      v17 = (const char *)objc_msgSend(v16, "UTF8String");
      v18 = objc_msgSend(v16, "length");
      if (v18 >= 1023)
        v19 = 1023;
      else
        v19 = v18;
      if (!strncmp(v17, a1, v19))
      {
        v20 = -[NSString componentsSeparatedByString:](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1), "componentsSeparatedByString:", CFSTR("/"));
        v21 = objc_msgSend(objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("/")), "count");
        if (-[NSArray count](v20, "count") >= (int)v21)
        {
          v22 = -[NSArray objectAtIndex:](v20, "objectAtIndex:", (((_QWORD)v21 << 32) - 0x100000000) >> 32);
          if ((objc_msgSend(v16, "hasSuffix:", CFSTR("Preferences/")) & 1) != 0
            || objc_msgSend(v16, "hasSuffix:", CFSTR("preferences/")))
          {
            v23 = CFSTR(".plist");
          }
          else
          {
            if (!objc_msgSend(v16, "hasSuffix:", CFSTR("Saved Application State/")))
            {
              if (!objc_msgSend(v16, "hasSuffix:", CFSTR("Cookies/")))
              {
                v24 = a2;
                goto LABEL_30;
              }
              v23 = CFSTR(".binaryCookies");
              v24 = a2;
              if (!objc_msgSend(v22, "hasSuffix:", CFSTR(".binaryCookies")))
                goto LABEL_30;
              goto LABEL_29;
            }
            v23 = CFSTR(".savedState");
          }
          v24 = a2;
          if ((objc_msgSend(v22, "hasSuffix:", v23) & 1) == 0)
          {
LABEL_30:
            strncpy(v24, (const char *)objc_msgSend(v22, "UTF8String"), 0x3FFuLL);
            return;
          }
LABEL_29:
          v22 = objc_msgSend(v22, "substringToIndex:", (int)(objc_msgSend(v22, "length") - -[__CFString length](v23, "length")));
          goto LABEL_30;
        }
      }
    }
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v13)
      continue;
    break;
  }
LABEL_23:
  bzero(a2, 0x3FFuLL);
}

int64_t GetFileExtensionFromFilePath(const char *a1, const char **a2)
{
  int64_t result;
  uint64_t v5;
  int64_t v6;
  const char *v7;

  result = strnlen(a1, 0x400uLL);
  if (result < 2)
    goto LABEL_11;
  v5 = result >= 20 ? 20 : result;
  v6 = result - 1;
  while (a1[v6] != 46)
  {
    --v6;
    if (!--v5)
      goto LABEL_11;
  }
  if (v6 == -1)
LABEL_11:
    v7 = (const char *)&unk_10000D177;
  else
    v7 = &a1[v6];
  *a2 = v7;
  return result;
}

BOOL IOCSOpenSQLDB()
{
  int v0;
  NSFileManager *v1;
  NSObject *v2;
  int v3;
  NSObject *v4;
  NSObject *v6;
  char *v7;
  uint64_t v8;

  if (qword_1000146E0)
  {
    v0 = 0;
LABEL_12:
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_10000B848();
    return v0 == 0;
  }
  v1 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v8 = 0;
  if (-[NSFileManager fileExistsAtPath:](v1, "fileExistsAtPath:", CFSTR("/var/db/IOCS/IOCSMonitoring.db")))
    goto LABEL_7;
  v2 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "IOCS: DB file does not exist, creating the file", (uint8_t *)&v7, 2u);
  }
  if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/db/IOCS"), 0, 0, &v8))
  {
LABEL_7:
    v3 = sqlite3_open("/var/db/IOCS/IOCSMonitoring.db", (sqlite3 **)&qword_1000146E0);
    if (v3)
    {
      v0 = v3;
      sqlite3_close((sqlite3 *)qword_1000146E0);
      qword_1000146E0 = 0;
    }
    else
    {
      v7 = 0;
      v0 = sqlite3_exec((sqlite3 *)qword_1000146E0, "PRAGMA journal_mode = WAL", 0, 0, &v7);
      if (v0)
      {
        v4 = oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
          sub_10000B874((uint64_t *)&v7, v0, v4);
      }
    }
    goto LABEL_12;
  }
  v6 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IOCS: Failed to create DIR", (uint8_t *)&v7, 2u);
  }
  return 0;
}

BOOL IOCSDeleteAllRowsSQLDB()
{
  _BOOL8 result;
  char *errmsg;

  if (qword_1000146E0)
  {
    if (sqlite3_open("/var/db/IOCS/IOCSMonitoring.db", (sqlite3 **)&qword_1000146E0))
    {
      sqlite3_close((sqlite3 *)qword_1000146E0);
      result = 0;
      qword_1000146E0 = 0;
    }
    else
    {
      errmsg = 0;
      return sqlite3_exec((sqlite3 *)qword_1000146E0, "DELETE FROM IOCSTable", 0, 0, &errmsg) == 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_10000B8FC();
    return 1;
  }
  return result;
}

uint64_t IOCSCloseSQLDB()
{
  uint64_t result;

  result = qword_1000146E0;
  if (qword_1000146E0)
  {
    result = sqlite3_close((sqlite3 *)qword_1000146E0);
    qword_1000146E0 = 0;
  }
  return result;
}

BOOL IOCSCreateTable()
{
  return sqlite3_exec((sqlite3 *)qword_1000146E0, "CREATE TABLE IF NOT EXISTS IOCSTable( writeSource TEXT,  fileExtension INTEGER,  uncompressedBytes INTEGER,  compressedBytes INTEGER,  bufferSizeCompressionDist BLOB,  blockCompressedSizeDist BLOB,  PRIMARY KEY(writeSource, fileExtension))", 0, 0, 0) == 0;
}

size_t printLine(int a1)
{
  int v1;

  if (a1 >= 1)
  {
    v1 = a1;
    do
    {
      fputs("-------------", __stdoutp);
      --v1;
    }
    while (v1);
  }
  return fwrite("-\n", 2uLL, 1uLL, __stdoutp);
}

size_t PrintIOCSStoreBufferEntry(uint64_t a1)
{
  size_t result;
  int i;
  uint64_t j;
  int v5;
  uint64_t k;
  uint64_t v7;
  uint64_t v8;
  uint64_t m;
  int v10;
  const char *v11;
  char v12[1024];

  bzero(v12, 0x400uLL);
  v11 = 0;
  GetWriteSourceFromFilePath((const char *)a1, v12);
  GetFileExtensionFromFilePath((const char *)a1, &v11);
  result = printf("IOCS: File Path: %s\nProcess Information: %s\nExtension: %s\n", (const char *)a1, v12, v11);
  if (*(_QWORD *)(a1 + 128))
  {
    fprintf(__stdoutp, "TotalUncompressedBytes = %lld\n", *(_QWORD *)(a1 + 128));
    fprintf(__stdoutp, "TotalCompressedBytes = %lld\n", *(_QWORD *)(a1 + 136));
    fwrite("Block Level compressed buffer size histogram\n", 0x2DuLL, 1uLL, __stdoutp);
    printLine(16);
    for (i = 0; i != 4096; i += 256)
    {
      if (!i)
        fputc(124, __stdoutp);
      fprintf(__stdoutp, "  %4d-%4d |", i, i + 255);
    }
    fputc(10, __stdoutp);
    printLine(16);
    for (j = 0; j != 64; j += 4)
    {
      v5 = *(_DWORD *)(a1 + 424 + j);
      if (!j)
        fputc(124, __stdoutp);
      fprintf(__stdoutp, "%9d   |", v5);
    }
    fputc(10, __stdoutp);
    printLine(16);
    fwrite("Buffer size (Rows) vs compressibility (Columns) histogram \n", 0x3BuLL, 1uLL, __stdoutp);
    printLine(8);
    fprintf(__stdoutp, "|%12s", (const char *)&unk_10000D177);
    for (k = 0; k != 28; k += 4)
    {
      if (!k)
        fputc(124, __stdoutp);
      fprintf(__stdoutp, "   %02d - %02d%% |", *(_DWORD *)((char *)&unk_10000CBA0 + k), *(_DWORD *)((char *)&unk_10000CBA0 + k + 4) - 1);
    }
    fputc(10, __stdoutp);
    printLine(8);
    v7 = 0;
    v8 = a1 + 144;
    do
    {
      fprintf(__stdoutp, "|%12s", (&off_100010730)[v7]);
      for (m = 0; m != 28; m += 4)
      {
        v10 = *(_DWORD *)(v8 + m);
        if (!m)
          fputc(124, __stdoutp);
        fprintf(__stdoutp, "%9d   |", v10);
      }
      fputc(10, __stdoutp);
      ++v7;
      v8 += 28;
    }
    while (v7 != 10);
    printLine(8);
    return fwrite("\n\n", 2uLL, 1uLL, __stdoutp);
  }
  return result;
}

void ProcessIOCSStoreBuffer(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  int v14;
  NSObject *v15;
  sqlite3_int64 v16;
  sqlite3_int64 v17;
  int v18;
  char *v19;
  int v20;
  char *v21;
  sqlite3_int64 v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t i;
  uint64_t j;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  int v32;
  void *context;
  void *v34;
  const char *v35;
  int v37;
  const char *v38;
  uint8_t v39;
  char v40[15];
  uint8_t v41;
  char v42[7];
  sqlite3_stmt *ppStmt;
  char __s[1024];
  uint8_t buf[32];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _OWORD v62[4];
  uint64_t v63;

  context = objc_autoreleasePoolPush();
  if (IOCSOpenSQLDB())
  {
    if (sqlite3_exec((sqlite3 *)qword_1000146E0, "CREATE TABLE IF NOT EXISTS IOCSTable( writeSource TEXT,  fileExtension INTEGER,  uncompressedBytes INTEGER,  compressedBytes INTEGER,  bufferSizeCompressionDist BLOB,  blockCompressedSizeDist BLOB,  PRIMARY KEY(writeSource, fileExtension))", 0, 0, 0))
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        sub_10000B990();
    }
    else
    {
      if (ContainerToBundleIDMap)
        objc_msgSend((id)ContainerToBundleIDMap, "removeAllObjects");
      else
        ContainerToBundleIDMap = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "enumerateBundlesOfType:block:", 0, &stru_1000107A0);
      if (a2 >= 1)
      {
        v5 = 0;
        v32 = a3;
        v31 = a2;
        do
        {
          v6 = objc_autoreleasePoolPush();
          v7 = a1 + v5;
          if (a3 == 1)
          {
            v34 = v6;
            bzero(__s, 0x400uLL);
            v38 = 0;
            GetWriteSourceFromFilePath((const char *)v7, __s);
            GetFileExtensionFromFilePath((const char *)v7, &v38);
            v9 = v38;
            ppStmt = 0;
            v10 = sqlite3_prepare_v2((sqlite3 *)qword_1000146E0, "SELECT uncompressedBytes,compressedBytes,bufferSizeCompressionDist,blockCompressedSizeDist FROM IOCSTable WHERE writeSource = ? AND fileExtension = ?", -1, &ppStmt, 0);
            if (v10)
            {
              v11 = v10;
              v12 = oslog;
              if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
              {
                v30 = sqlite3_errmsg((sqlite3 *)qword_1000146E0);
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v11;
                *(_WORD *)&buf[8] = 2080;
                *(_QWORD *)&buf[10] = v30;
                _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "IOCS: SQL table Insert failure: %d %s\n", buf, 0x12u);
              }
              sqlite3_finalize(ppStmt);
              a3 = v32;
              a2 = v31;
            }
            else
            {
              v13 = strlen(__s);
              sqlite3_bind_text(ppStmt, 1, __s, v13, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
              v14 = strlen(v9);
              v35 = v9;
              sqlite3_bind_text(ppStmt, 2, v9, v14, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
              if (sqlite3_step(ppStmt) != 100)
                goto LABEL_42;
              v37 = 0;
              do
              {
                if (v37 >= 1)
                {
                  v15 = oslog;
                  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = __s;
                    *(_WORD *)&buf[12] = 2080;
                    *(_QWORD *)&buf[14] = v35;
                    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "IOCS: IOCSdb: We should only ever have one row %s %s", buf, 0x16u);
                  }
                }
                v63 = 0;
                memset(v62, 0, sizeof(v62));
                v60 = 0u;
                v61 = 0u;
                v58 = 0u;
                v59 = 0u;
                v56 = 0u;
                v57 = 0u;
                v54 = 0u;
                v55 = 0u;
                v52 = 0u;
                v53 = 0u;
                v50 = 0u;
                v51 = 0u;
                v48 = 0u;
                v49 = 0u;
                v46 = 0u;
                v47 = 0u;
                memset(buf, 0, sizeof(buf));
                v16 = sqlite3_column_int64(ppStmt, 0);
                v17 = sqlite3_column_int64(ppStmt, 1);
                v18 = sqlite3_column_bytes(ppStmt, 2);
                v19 = (char *)sqlite3_column_blob(ppStmt, 2);
                v20 = sqlite3_column_bytes(ppStmt, 3);
                v21 = (char *)sqlite3_column_blob(ppStmt, 3);
                v22 = *(_QWORD *)(v7 + 128) + v16;
                *(_QWORD *)&buf[8] = *(_QWORD *)(v7 + 136) + v17;
                *(_QWORD *)buf = v22;
                if (v19 && v18 == 280)
                {
                  if (v21 && v20 == 64)
                  {
                    v23 = 0;
                    v24 = a1 + 144 + v5;
                    v25 = &buf[16];
                    do
                    {
                      for (i = 0; i != 28; i += 4)
                        *(_DWORD *)&v25[i] = *(_DWORD *)&v19[i] + *(_DWORD *)(v24 + i);
                      ++v23;
                      v25 += 28;
                      v19 += 28;
                      v24 += 28;
                    }
                    while (v23 != 10);
                    for (j = 0; j != 64; j += 4)
                      *(_DWORD *)((char *)v62 + j + 8) = *(_DWORD *)&v21[j] + *(_DWORD *)(a1 + 424 + v5 + j);
                    ++v37;
                    sub_100005E3C((sqlite3_int64 *)buf, __s, v35);
                  }
                  else
                  {
                    v29 = oslog;
                    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
                      sub_10000B95C(&v39, v40, v29);
                  }
                }
                else
                {
                  v28 = oslog;
                  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
                    sub_10000B928(&v41, v42, v28);
                }
              }
              while (sqlite3_step(ppStmt) == 100);
              a3 = v32;
              a2 = v31;
              if (!v37)
LABEL_42:
                sub_100005E3C((sqlite3_int64 *)(v7 + 128), __s, v35);
            }
            v6 = v34;
          }
          else if (!a3)
          {
            v8 = v6;
            PrintIOCSStoreBufferEntry(a1 + v5);
            v6 = v8;
          }
          objc_autoreleasePoolPop(v6);
          v5 = (int)v5 + 488;
        }
        while (v5 < a2);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
  {
    sub_10000B9BC();
  }
  objc_autoreleasePoolPop(context);
}

void IOCSPeriodicSyncToCA(_xpc_activity_s *a1)
{
  _BOOL4 v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  char *v8;
  NSObject *v9;
  char *v10;
  unsigned int v11;
  const unsigned __int8 *v12;
  const unsigned __int8 *v13;
  unint64_t v14;
  sqlite3_int64 v15;
  const void *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  int32x4_t v20;
  _BOOL4 v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  _QWORD v25[11];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  unsigned int v28;

  fetch_and_process_iocs_store_buffer(4, 1);
  if (a1)
  {
    if (xpc_activity_should_defer(a1))
    {
      v2 = xpc_activity_set_state(a1, 3);
      v3 = oslog;
      v4 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
      if (v2)
      {
        if (!v4)
          return;
        LOWORD(v25[0]) = 0;
        v5 = "IOCS: deferring XPC activity";
      }
      else
      {
        if (!v4)
          return;
        LOWORD(v25[0]) = 0;
        v5 = "IOCS: unable to defer XPC activity, abandon";
      }
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)v25, 2u);
      return;
    }
    fetch_and_process_iocs_store_buffer(1, 1);
    if (xpc_activity_should_defer(a1))
    {
      v6 = xpc_activity_set_state(a1, 3);
      v3 = oslog;
      v7 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (!v7)
          return;
        LOWORD(v25[0]) = 0;
        v5 = "IOCS: deferring XPC activity";
      }
      else
      {
        if (!v7)
          return;
        LOWORD(v25[0]) = 0;
        v5 = "IOCS: unable to defer XPC activity, abandon";
      }
      goto LABEL_33;
    }
  }
  else
  {
    fetch_and_process_iocs_store_buffer(1, 1);
  }
  ppStmt = 0;
  if (sqlite3_prepare_v2((sqlite3 *)qword_1000146E0, "SELECT writeSource, fileExtension, uncompressedBytes, compressedBytes,bufferSizeCompressionDist, blockCompressedSizeDist FROM IOCSTable", -1, &ppStmt, 0))
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_10000BA14();
    sqlite3_finalize(ppStmt);
  }
  else
  {
    v8 = (char *)malloc_type_malloc(0xBuLL, 0xBB9810D1uLL);
    v9 = oslog;
    if (v8)
    {
      v10 = v8;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending IOCS Data to CA, SELECT query succeeded", (uint8_t *)v25, 2u);
      }
      v11 = 0;
      while (sqlite3_step(ppStmt) == 100)
      {
        v12 = sqlite3_column_text(ppStmt, 0);
        v13 = sqlite3_column_text(ppStmt, 1);
        v14 = sqlite3_column_int64(ppStmt, 2);
        v15 = sqlite3_column_int64(ppStmt, 3);
        v16 = sqlite3_column_blob(ppStmt, 4);
        v17 = (char *)sqlite3_column_blob(ppStmt, 5);
        if (v14 >= 0xA000)
        {
          v18 = v17;
          v19 = 0;
          v20 = 0uLL;
          do
          {
            v20 = vaddq_s32(*(int32x4_t *)&v17[v19], v20);
            v19 += 16;
          }
          while (v19 != 64);
          if (vaddvq_s32(v20) >= 10)
          {
            strncpy(v10, (const char *)v13, 0xAuLL);
            v10[10] = 0;
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_100005FA8;
            v25[3] = &unk_100010800;
            v25[4] = v15;
            v25[5] = v14;
            v25[6] = v10;
            v25[7] = v12;
            v25[8] = v18;
            v25[9] = v16;
            analytics_send_event_lazy("com.apple.IOCompressionStats.AggregatedStats", v25);
            ++v11;
            if (a1 && !(v11 % 0xC8) && xpc_activity_should_defer(a1))
            {
              v21 = xpc_activity_set_state(a1, 3);
              v22 = oslog;
              v23 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
              if (v21)
              {
                if (!v23)
                  break;
                *(_DWORD *)buf = 67109120;
                v28 = v11;
                v24 = "IOCS: deferring XPC activity after processing %d rows";
              }
              else
              {
                if (!v23)
                  break;
                *(_DWORD *)buf = 67109120;
                v28 = v11;
                v24 = "IOCS: unable to defer XPC activity, abandon after %d rows";
              }
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 8u);
              break;
            }
            if (v11 == 10001)
              break;
          }
        }
      }
      free(v10);
    }
    else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10000B9E8();
    }
  }
  IOCSDeleteAllRowsSQLDB();
}

uint64_t IOCSFeatureEnabled()
{
  return _os_feature_enabled_impl("EmbeddedStorageReporting", "IOCompressionStats");
}

uint64_t EnableIOCSCollection()
{
  uint64_t v0;
  int v1;
  BOOL v2;
  int v4;
  size_t v5;
  int v6;

  v6 = 0;
  v5 = 4;
  v4 = 1;
  v0 = 0xFFFFFFFFLL;
  if (!sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, &v4, 4uLL))
  {
    v1 = sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, 0, 0);
    if (v6)
      v2 = v1 == 0;
    else
      v2 = 0;
    if (v2)
      return 1;
    else
      return 0xFFFFFFFFLL;
  }
  return v0;
}

uint64_t DisableIOCSCollection()
{
  uint64_t v0;
  int v1;
  int v4;
  size_t v5;
  int v6;

  v6 = 0;
  v5 = 4;
  v4 = 0;
  v0 = 0xFFFFFFFFLL;
  if (!sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, &v4, 4uLL))
  {
    v1 = sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, 0, 0);
    if (v6 != 1 && v1 == 0)
      return 1;
    else
      return 0xFFFFFFFFLL;
  }
  return v0;
}

uint64_t GetIOCSCollectionStatus()
{
  size_t v1;
  unsigned int v2;

  v2 = 0;
  v1 = 4;
  if (sysctlbyname("vfs.io_compression_stats_enable", &v2, &v1, 0, 0)
    && os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
  {
    sub_10000BA8C();
  }
  return v2;
}

id IOCSTaskingEnabled()
{
  void *v0;
  id result;

  v0 = (void *)OSAGetDATaskingValue(CFSTR("IOCompressionStats"));
  if (!v0 || (result = objc_msgSend(v0, "intValue"), (_DWORD)result != 1))
  {
    result = (id)os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_10000BAB8();
      return 0;
    }
  }
  return result;
}

void ScheduleIOCSTask()
{
  xpc_activity_register("com.apple.fs_task_scheduler.IOCS", XPC_ACTIVITY_CHECK_IN, &stru_100010710);
}

void sub_100005BE0(id a1, OS_xpc_object *a2)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  if (xpc_activity_get_state(a2) == 2)
  {
    if (IOCSTaskingEnabled())
    {
      v3 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "IOCS: Tasking enabled", buf, 2u);
      }
      if (GetIOCSCollectionStatus() == 1)
      {
        v4 = oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "IOCS: data collection has been running. Syncing data to CA", v10, 2u);
        }
        InstallIOCSNotificationHandler();
        IOCSPeriodicSyncToCA(a2);
      }
      else
      {
        v6 = EnableIOCSCollection();
        v7 = oslog;
        if (v6 == 1)
        {
          if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v9 = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IOCS: data collection has not been running. Installing IOCS notification handler", v9, 2u);
          }
          InstallIOCSNotificationHandler();
        }
        else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        {
          sub_10000BAE4();
        }
      }
    }
    else if (GetIOCSCollectionStatus() == 1)
    {
      v5 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IOCS: tasking is turned off, disabling data collection", v8, 2u);
      }
      DisableIOCSCollection();
    }
  }
}

void sub_100005D84(id a1, LSBundleProxy *a2, BOOL *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = objc_autoreleasePoolPush();
  v5 = -[LSBundleProxy bundleIdentifier](a2, "bundleIdentifier");
  if (-[LSBundleProxy dataContainerURL](a2, "dataContainerURL"))
  {
    v6 = objc_msgSend(objc_msgSend(-[LSBundleProxy dataContainerURL](a2, "dataContainerURL"), "path"), "stringByStandardizingPath");
    objc_msgSend((id)ContainerToBundleIDMap, "setObject:forKey:", v5, v6);
  }
  objc_msgSend(-[LSBundleProxy groupContainerURLs](a2, "groupContainerURLs"), "enumerateKeysAndObjectsUsingBlock:", &stru_1000107E0);
  objc_autoreleasePoolPop(v4);
}

void sub_100005E04(id a1, id a2, id a3, BOOL *a4)
{
  id v5;

  v5 = objc_msgSend(objc_msgSend(a3, "path"), "stringByStandardizingPath");
  objc_msgSend((id)ContainerToBundleIDMap, "setObject:forKey:", a2, v5);
}

uint64_t sub_100005E3C(sqlite3_int64 *a1, const char *a2, const char *a3)
{
  int v6;
  int v7;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2((sqlite3 *)qword_1000146E0, "REPLACE INTO IOCSTable (writeSource,fileExtension,uncompressedBytes,compressedBytes,bufferSizeCompressionDist,blockCompressedSizeDist)  VALUES (?,?,?,?,?,?)", -1, &ppStmt, 0))
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_10000BB88();
  }
  else
  {
    v6 = strlen(a2);
    sqlite3_bind_text(ppStmt, 1, a2, v6, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v7 = strlen(a3);
    sqlite3_bind_text(ppStmt, 2, a3, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_int64(ppStmt, 3, *a1);
    sqlite3_bind_int64(ppStmt, 4, a1[1]);
    sqlite3_bind_blob(ppStmt, 5, a1 + 2, 280, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_blob(ppStmt, 6, a1 + 37, 64, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (sqlite3_step(ppStmt) != 101 && os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_10000BB10();
  }
  return sqlite3_finalize(ppStmt);
}

xpc_object_t sub_100005FA8(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "CompressedWriteSize", *(_QWORD *)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "UncompressedWriteSize", *(_QWORD *)(a1 + 40));
  xpc_dictionary_set_string(v2, "FileExtension", *(const char **)(a1 + 48));
  xpc_dictionary_set_string(v2, "WriteSource", *(const char **)(a1 + 56));
  xpc_dictionary_set_data(v2, "BlockCompressionHistogram", *(const void **)(a1 + 64), 0x40uLL);
  xpc_dictionary_set_data(v2, "BufferSizeCompressionHistogram", *(const void **)(a1 + 72), 0x118uLL);
  return v2;
}

void sub_100006058(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100006068(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_100006074(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int main(int argc, const char **argv, const char **envp)
{
  int is_darwinos;
  int v6;
  NSUserDefaults *v7;
  BOOL v8;
  unsigned int v9;
  char v10;
  _BOOL4 v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  xpc_object_t v19;
  NSObject *v20;
  int v21;
  _QWORD handler[7];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[3];
  char v27;
  _QWORD v28[3];
  _QWORD v29[3];
  _BYTE buf[24];
  const char *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;

  is_darwinos = os_variant_is_darwinos(0, argv, envp);
  if (argc < 2 || (v6 = getopt(argc, (char *const *)argv, "fi") << 24, v6 == -16777216))
  {
    syslog(5, "Started");
    v7 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v28[0] = CFSTR("NANDNotificationThresholdPerInterval");
    v29[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 10.0);
    v28[1] = CFSTR("NANDNotificationThresholdPerDay");
    v29[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 100.0);
    v28[2] = CFSTR("NANDNotificationTimeout");
    v29[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0);
    -[NSUserDefaults registerDefaults:](v7, "registerDefaults:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
    v8 = isInternalBuild();
    v9 = isTaskingEnabled((uint64_t)CFSTR("NANDUsageDialogActive"));
    v10 = !((v8 && v9 != 0) & _os_feature_enabled_impl("EmbeddedStorageReporting", "NANDLongetivity")) | is_darwinos;
    v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if ((v10 & 1) != 0)
    {
      if (v11)
      {
        v12 = "True";
        if (v9)
          v13 = "True";
        else
          v13 = "False";
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        if (!is_darwinos)
          v12 = "False";
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2080;
        v31 = "False";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats :: nand_longetivity_daemon feature not enabled. isTaskingEnabled: %s, isWeakLinked: %s, nandDaemonEnabled: %s", buf, 0x20u);
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats :: Registering nand_longetivity_daemon", buf, 2u);
      }
      -[NSUserDefaults doubleForKey:](v7, "doubleForKey:", CFSTR("NANDNotificationThresholdPerInterval"));
      v15 = v14;
      -[NSUserDefaults doubleForKey:](v7, "doubleForKey:", CFSTR("NANDNotificationThresholdPerDay"));
      v17 = v16;
      -[NSUserDefaults doubleForKey:](v7, "doubleForKey:", CFSTR("NANDNotificationTimeout"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats :: In nand_longetivity_daemon. Registering nand stats info daemon\n", buf, 2u);
      }
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x2020000000;
      v27 = 0;
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x2020000000;
      v25[3] = 0;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x2020000000;
      v24[3] = 0;
      if (!qword_1000146E8)
      {
        v18 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor");
        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = sub_1000068D0;
        v31 = (const char *)&unk_1000108D8;
        v32 = v26;
        v33 = v25;
        v34 = v24;
        objc_msgSend(v18, "setTransitionHandler:", buf);
        qword_1000146E8 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v18);
      }
      v19 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v19, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_BOOL(v19, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_dictionary_set_int64(v19, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
      xpc_dictionary_set_string(v19, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100007330;
      handler[3] = &unk_100010900;
      handler[5] = v15;
      handler[6] = v17;
      handler[4] = v26;
      xpc_activity_register("com.apple.fs_task_scheduler.nandstats", v19, handler);
      _Block_object_dispose(v24, 8);
      _Block_object_dispose(v25, 8);
      _Block_object_dispose(v26, 8);
    }
    xpc_activity_register("com.apple.fs_task_scheduler", XPC_ACTIVITY_CHECK_IN, &stru_100010920);
    if ((is_darwinos & 1) == 0 && IOCSFeatureEnabled())
    {
      v20 = os_log_create("com.apple.FSTaskScheduler.IOCS", "main");
      oslog = (uint64_t)v20;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "IOCS feature is enabled, setting up IOCS periodic job", buf, 2u);
      }
      ScheduleIOCSTask();
    }
    CFRunLoopRun();
    NSLog(CFSTR("FSTaskScheduler :: CALLING FROM END OF RUNLOOP"));
    if (qword_1000146E8)
    {
      objc_msgSend((id)qword_1000146E8, "invalidate");
      qword_1000146E8 = 0;
    }
  }
  else
  {
    do
    {
      v21 = v6 >> 24;
      if (v21 != 102)
      {
        if (v21 == 105)
        {
          if (IOCSFeatureEnabled())
          {
            if (GetIOCSCollectionStatus() == 1)
            {
              puts("Force syncing IOCS data to CA");
              IOCSPeriodicSyncToCA(0);
            }
            else
            {
              if (EnableIOCSCollection() == 1)
              {
                InstallIOCSNotificationHandler();
                dispatch_main();
              }
              fwrite("Failed to enabled IOCS collection\n", 0x22uLL, 1uLL, __stderrp);
            }
          }
          else
          {
            puts("IOCompressionStats disabled. Enabled the feature flag.");
          }
          exit(0);
        }
        puts("Usage: FSTaskScheduler [-ai]");
        exit(1);
      }
      v6 = getopt(argc, (char *const *)argv, "fi") << 24;
    }
    while (v6 != -16777216);
    sub_1000066C0();
  }
  return 0;
}

void sub_100006684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va2;

  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v15 = va_arg(va2, _QWORD);
  v17 = va_arg(va2, _QWORD);
  v18 = va_arg(va2, _QWORD);
  v19 = va_arg(va2, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void sub_1000066C0()
{
  CFNumberRef storage_capacity;
  __CFDictionary *v1;
  _QWORD v2[5];

  v1 = CopyFSInfo();
  storage_capacity = get_storage_capacity();
  if (v1)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10000673C;
    v2[3] = &unk_100010868;
    v2[4] = storage_capacity;
    -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v1, "enumerateKeysAndObjectsUsingBlock:", v2);

  }
}

id sub_10000673C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id result;
  BOOL v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];

  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(a2, v6) & 1) == 0)
    a2 = 0;
  v7 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0)
    v8 = a3;
  else
    v8 = 0;
  result = objc_msgSend(v8, "mutableCopy");
  if (a2)
    v10 = result == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = result;
    objc_msgSend(result, "enumerateKeysAndObjectsUsingBlock:", &stru_100010888);
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      objc_msgSend(v11, "setValue:forKey:", v12, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "capacityGB"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100006834;
    v13[3] = &unk_100010848;
    v13[4] = v11;
    return (id)AnalyticsSendEventLazy(a2, v13);
  }
  return result;
}

uint64_t sub_100006834(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void sub_10000683C(id a1, id a2, id a3, BOOL *a4)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  CFStringRef v9;

  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(a2, v6) & 1) == 0)
    a2 = 0;
  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(a3, v7) & 1) == 0)
    a3 = 0;
  if (a2)
    v8 = a3 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = buildAggDKey(a2);
    ADClientSetValueForScalarKey(v9, objc_msgSend(a3, "longLongValue"));
  }
}

void sub_1000068D0(_QWORD *a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  _BOOL4 v14;
  uint64_t v15;
  NSURL *v16;
  NSURL *v17;
  NSBundle *v18;
  NSArray *v19;
  NSArray *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSString *v28;
  NSString *v29;
  BOOL v31;
  time_t v32;
  int v33;
  int v34;
  int v35;
  void *v36;
  int v37;
  const unsigned __int8 *v38;
  sqlite3_int64 v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  uint32_t v45;
  int v46;
  const char *v47;
  int v48;
  const char *v49;
  const char *v50;
  int v51;
  const char *v52;
  _QWORD *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  sqlite3_stmt *ppStmt;
  _QWORD v61[5];
  __int128 v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  sqlite3_stmt *pStmt;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  _BYTE v75[18];
  _BYTE v76[128];

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
    return;
  v4 = a1;
  if (!CRUOpenSQLDB())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: Unable to open SQL database\n", buf, 2u);
    }
    return;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v5 = objc_msgSend(a3, "elements");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (!v6)
    return;
  v7 = v6;
  v8 = *(_QWORD *)v70;
  v9 = SBSDisplayLayoutElementHomeScreenIdentifier;
  v56 = SBSDisplayLayoutElementHomeScreenIdentifier;
  v57 = *(_QWORD *)v70;
  v53 = v4;
  v55 = v5;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v70 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(objc_msgSend(v11, "identifier"), "isEqualToString:", v9))
      {
        if (!*(_QWORD *)(*(_QWORD *)(v4[5] + 8) + 24))
          continue;
        v58 = i;
        pStmt = 0;
        v12 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)(v4[5] + 8) + 24)), 0, &pStmt);
        if (!v12)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            continue;
          v43 = *(_QWORD *)(*(_QWORD *)(v4[5] + 8) + 24);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v75 = v43;
          *(_WORD *)&v75[8] = 2112;
          *(_QWORD *)&v75[10] = pStmt;
          v44 = "NANDStats - Exception ::::: Attempt to retrieve application record for bundle identifier %s failed with error: %@\n";
          v45 = 22;
LABEL_59:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v44, buf, v45);
          continue;
        }
        v13 = objc_msgSend(objc_msgSend(v12, "localizedName"), "UTF8String");
        v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
        v59 = v13;
        if (!v13)
        {
          if (!v14)
            continue;
          *(_WORD *)buf = 0;
          v44 = "NANDStats - Exception ::::: Unable to derive appName from localizedName\n";
          v45 = 2;
          goto LABEL_59;
        }
        if (v14)
        {
          v15 = *(_QWORD *)(*(_QWORD *)(v4[5] + 8) + 24);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v75 = v15;
          *(_WORD *)&v75[8] = 2080;
          *(_QWORD *)&v75[10] = v13;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats: localizedName for bundleID: %s is %s\n", buf, 0x16u);
        }
        v16 = -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 8, 0, 0, 0);
        if (!v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: Failed to find path to System-domain Library directory", buf, 2u);
        }
        v17 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("Extensions/IONVMeFamily.kext"), 0, v16);
        if (!-[NSURL checkResourceIsReachableAndReturnError:](v17, "checkResourceIsReachableAndReturnError:", 0)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: IONVMeFamily kext bundle file not found", buf, 2u);
        }
        v18 = +[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v17);
        v19 = +[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", -[NSBundle localizations](v18, "localizations"), +[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
        if (!v18)
          goto LABEL_38;
        v20 = v19;
        v21 = -[NSBundle _cfBundle](v18, "_cfBundle");
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        if (!v22)
          goto LABEL_38;
        v23 = v22;
        v54 = v7;
        v24 = *(_QWORD *)v65;
LABEL_23:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v65 != v24)
            objc_enumerationMutation(v20);
          v26 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v25);
          v27 = CFBundleCopyLocalizedStringForLocalization(v21, CFSTR("kNANDTaskSchedulerStorageHealth"), CFSTR("Storage Health"), CFSTR("Localizable"), v26);
          v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFBundleCopyLocalizedStringForLocalization(v21, CFSTR("kNANDTaskSchedulerExcessUsageDialog"), CFSTR("%@ is writing relatively large amounts of data to internal storage. This may cause additional NAND wear."), CFSTR("Localizable"), v26), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v59));
          v29 = v28;
          if (v27 && v28 != 0)
            break;
          if (v23 == (id)++v25)
          {
            v23 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
            if (v23)
              goto LABEL_23;
            break;
          }
        }
        v31 = !v27 || v29 == 0;
        v4 = v53;
        v7 = v54;
        if (v31)
LABEL_38:
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is writing relatively large amounts of data to internal storage. This may cause additional NAND wear."), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v59));
        v32 = time(0);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_100007248;
        v61[3] = &unk_1000108B0;
        v62 = xmmword_10000CBE0;
        v61[4] = v4[6];
        v63 = v59;
        AnalyticsSendEventLazy(CFSTR("com.apple.massStorage.nand.excessUsageWarning"), v61);
        ppStmt = 0;
        v33 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "UPDATE NANDStats SET presentDialog = ?, dialogTimestamp = ?, dialogInterval = CASE WHEN presentDialog >> 8 & 0x1 == 0x1 AND dialogInterval >= 25 THEN 30 WHEN presentDialog >> 8 & 0x1 == 0x1 AND dialogInterval < 25 THEN dialogInterval * 5 ELSE dialogInterval END WHERE bundleID = ?", -1, &ppStmt, 0);
        if (v33)
        {
          v48 = v33;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v49 = sqlite3_errmsg((sqlite3 *)CRUdb);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v75 = v48;
            *(_WORD *)&v75[4] = 2080;
            *(_QWORD *)&v75[6] = v49;
            v50 = "NANDStats - Exception ::::: SQL Update prepare failure %d %s\n";
            goto LABEL_76;
          }
LABEL_77:
          sqlite3_finalize(ppStmt);
          return;
        }
        sqlite3_bind_int64(ppStmt, 1, 0);
        sqlite3_bind_int64(ppStmt, 2, v32);
        v34 = strlen(*(const char **)(*(_QWORD *)(v4[5] + 8) + 24));
        sqlite3_bind_text(ppStmt, 3, *(const char **)(*(_QWORD *)(v4[5] + 8) + 24), v34, 0);
        v35 = sqlite3_step(ppStmt);
        if (v35 != 101)
        {
          v51 = v35;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v52 = sqlite3_errmsg((sqlite3 *)CRUdb);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v75 = v51;
            *(_WORD *)&v75[4] = 2080;
            *(_QWORD *)&v75[6] = v52;
            v50 = "NANDStats - Exception ::::: SQL Update step failure %d %s\n";
LABEL_76:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v50, buf, 0x12u);
          }
          goto LABEL_77;
        }
        sqlite3_finalize(ppStmt);
        v36 = *(void **)(*(_QWORD *)(v4[5] + 8) + 24);
        if (v36)
        {
          free(v36);
          *(_QWORD *)(*(_QWORD *)(v4[5] + 8) + 24) = 0;
          *(_QWORD *)(*(_QWORD *)(v4[6] + 8) + 24) = 0;
        }
        v5 = v55;
        v9 = v56;
        v8 = v57;
        i = v58;
      }
      else if ((objc_msgSend(objc_msgSend(v11, "identifier"), "containsString:", CFSTR("com.apple.springboard")) & 1) == 0)
      {
        pStmt = 0;
        v37 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "SELECT bundleID, logicalWrites FROM NANDStats WHERE presentDialog & 0x1 = 0x1", -1, &pStmt, 0);
        if (v37)
        {
          v46 = v37;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v47 = sqlite3_errmsg((sqlite3 *)CRUdb);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v75 = v46;
            *(_WORD *)&v75[4] = 2080;
            *(_QWORD *)&v75[6] = v47;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: SQL Select failure %d %s\n", buf, 0x12u);
          }
          sqlite3_finalize(pStmt);
          CRUCloseSQLDB();
          return;
        }
        if (sqlite3_step(pStmt) != 100 || !sqlite3_data_count(pStmt))
        {
          sqlite3_finalize(pStmt);
          CRUCloseSQLDB();
          *(_BYTE *)(*(_QWORD *)(v4[4] + 8) + 24) = 0;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats: INFO!! Displayed notifications for all apps. Invalidating mainDisplayLayoutMonitor", buf, 2u);
          }
          if (qword_1000146E8)
          {
            objc_msgSend((id)qword_1000146E8, "invalidate");
            qword_1000146E8 = 0;
          }
          return;
        }
        sqlite3_reset(pStmt);
        while (sqlite3_step(pStmt) == 100)
        {
          v38 = sqlite3_column_text(pStmt, 0);
          v39 = sqlite3_column_int64(pStmt, 1);
          if (objc_msgSend(objc_msgSend(v11, "identifier"), "containsString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v38)))
          {
            v40 = v7;
            v41 = *(_QWORD *)(v4[5] + 8);
            v42 = *(void **)(v41 + 24);
            if (v42)
            {
              free(v42);
              *(_QWORD *)(*(_QWORD *)(v4[5] + 8) + 24) = 0;
              *(_QWORD *)(*(_QWORD *)(v4[6] + 8) + 24) = 0;
              v41 = *(_QWORD *)(v4[5] + 8);
            }
            *(_QWORD *)(v41 + 24) = strdup((const char *)v38);
            *(_QWORD *)(*(_QWORD *)(v4[6] + 8) + 24) = v39;
            v7 = v40;
            break;
          }
        }
        sqlite3_finalize(pStmt);
        v9 = v56;
        v8 = v57;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    if (v7)
      continue;
    break;
  }
}

NSDictionary *sub_100007248(_QWORD *a1)
{
  _QWORD v3[4];
  _QWORD v4[4];

  v3[0] = CFSTR("dismiss");
  v4[0] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[5]);
  v3[1] = CFSTR("learnMore");
  v4[1] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[6]);
  v3[2] = CFSTR("logicalWrites");
  v4[2] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
  v3[3] = CFSTR("application");
  v4[3] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1[7]);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
}

void sub_100007330(uint64_t a1, xpc_activity_t activity)
{
  char **v3;
  CFRunLoopRef Main;
  int v5;
  int v6;
  const char *v7;
  sqlite3_stmt *v8;
  const char *v9;
  const char *v10;
  char *v11;
  id v12;
  const unsigned __int8 *v13;
  sqlite3_int64 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  id v30;
  int v31;
  int v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  const char *v38;
  int v39;
  int v40;
  int v41;
  int v42;
  const char *v43;
  int v44;
  const char *v45;
  id v46;
  id v47;
  id obj;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  sqlite3_stmt *pStmt;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  _BYTE v72[14];
  __int16 v73;
  const char *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  const __CFString *v78;
  NSNumber *v79;

  if (xpc_activity_get_state(activity) != 2)
    return;
  v3 = &selRef_URLForDirectory_inDomain_appropriateForURL_create_error_;
  if (!qword_1000146E8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats :: mainDisplayLayoutMonitor is invalidated. Restarting the runloop.", buf, 2u);
    }
    Main = CFRunLoopGetMain();
    CFRetain(Main);
    CFRunLoopStop(Main);
    CFRelease(Main);
  }
  if (!CRUOpenSQLDB())
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v9 = "NANDStats - Exception ::::: Unable to open SQL database\n";
    goto LABEL_15;
  }
  if (!CRUCreateTable())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = sqlite3_errmsg((sqlite3 *)CRUdb);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v72 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats -  Exception ::::: Unable to create NANDStats table %s\n", buf, 0xCu);
    }
    CRUCloseSQLDB();
    goto LABEL_19;
  }
  ppStmt = 0;
  v5 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "SELECT bundleID, dialogTimestamp, dialogInterval FROM NANDStats", -1, &ppStmt, 0);
  if (!v5)
  {
    v53 = objc_alloc_init((Class)NSMutableDictionary);
    v55 = objc_alloc_init((Class)NSMutableDictionary);
    v12 = objc_alloc_init((Class)NSMutableDictionary);
    v56 = objc_alloc_init((Class)NSMutableDictionary);
    v52 = objc_alloc_init((Class)NSMutableDictionary);
    while (sqlite3_step(ppStmt) == 100)
    {
      v13 = sqlite3_column_text(ppStmt, 0);
      v14 = sqlite3_column_int64(ppStmt, 1);
      v15 = sqlite3_column_int(ppStmt, 2);
      if (v14)
      {
        v16 = v15;
        NSLog(CFSTR("NANDStats: Apps with positive dialog timestamp [bundleId: %s - dialogTimestamp: %llu - Interval: %u]"), v13, v14, v15);
        objc_msgSend(v12, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v14), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
        objc_msgSend(v55, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v16), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
      }
      objc_msgSend(v56, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
    }
    sqlite3_finalize(ppStmt);
    v78 = CFSTR("LogicalWriteThresholdPerDay");
    v54 = a1;
    v79 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 40) * 1073741820.0);
    v17 = (void *)PLQueryRegistered(109, CFSTR("LogicalWritesPerApp"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1));
    v18 = objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("lastUpgradeTimestamp"));
    v19 = objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("responseStartTimestamp"));
    NSLog(CFSTR("NANDStats: lastUpgradeTimestamp = %@ responseStartTimestamp = %@"), v18, v19);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("queryResultsPerDay"));
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    if (v49)
    {
      v20 = 0;
      v21 = 0;
      v50 = *(_QWORD *)v67;
      v46 = v19;
      v47 = v18;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v67 != v50)
            objc_enumerationMutation(obj);
          v51 = v22;
          v23 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v22);
          v24 = 86400 * v20 + objc_msgSend(v19, "unsignedIntValue");
          if (v24 < objc_msgSend(v18, "unsignedIntValue")
            || v24 >= objc_msgSend(v18, "unsignedIntValue") + 259200)
          {
            v64 = 0u;
            v65 = 0u;
            v62 = 0u;
            v63 = 0u;
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v63;
              while (2)
              {
                for (i = 0; i != v26; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v63 != v27)
                    objc_enumerationMutation(v23);
                  v29 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
                  objc_msgSend(v56, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), v29);
                  v30 = objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", v29), "unsignedLongLongValue");
                  if (objc_msgSend(v12, "objectForKey:", v29)
                    && (unint64_t)objc_msgSend(objc_msgSend(v12, "objectForKey:", v29), "unsignedLongLongValue") >= v24)
                  {
                    NSLog(CFSTR("NANDStats: INFO!! BundleId : %@ already reported for day %lu with timestamp %llu"), v29, v20, v24);
                  }
                  else
                  {
                    v31 = sub_100007CA0(v20, v29, (unint64_t)v30, v24, v53, v12, v55, v52, *(double *)(v54 + 48));
                    if (v31 == 2)
                    {
                      v32 = 1;
                      goto LABEL_52;
                    }
                    v21 = (v31 | v21) != 0;
                  }
                }
                v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
                if (v26)
                  continue;
                break;
              }
            }
          }
          else
          {
            NSLog(CFSTR("NANDStats: ALERT!! OS upgrade occurred. Ignoring current day with number %lu : %llu. Upgrade timestamp : %@"), v20, v24, v18);
          }
          ++v20;
          v22 = v51 + 1;
          v19 = v46;
          v18 = v47;
        }
        while ((id)(v51 + 1) != v49);
        v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
      }
      while (v49);
    }
    else
    {
      v21 = 0;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v33 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v59;
      while (2)
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(_QWORD *)v59 != v35)
            objc_enumerationMutation(v56);
          v37 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
          if ((objc_msgSend(objc_msgSend(v56, "objectForKey:", v37), "BOOLValue") & 1) == 0)
          {
            NSLog(CFSTR("NANDStats: Deleting app %@ as it may be uninstalled"), v37);
            v38 = (const char *)objc_msgSend(v37, "UTF8String");
            pStmt = 0;
            v39 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "DELETE FROM NANDStats WHERE bundleID = ?", -1, &pStmt, 0);
            if (v39)
            {
              v44 = v39;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v45 = sqlite3_errmsg((sqlite3 *)CRUdb);
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v72 = v44;
                *(_WORD *)&v72[4] = 2080;
                *(_QWORD *)&v72[6] = v45;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: SQL delete failure %d %s\n", buf, 0x12u);
              }
              v8 = pStmt;
              goto LABEL_12;
            }
            v40 = strlen(v38);
            sqlite3_bind_text(pStmt, 1, v38, v40, 0);
            v41 = sqlite3_step(pStmt);
            if (v41 != 101)
            {
              v42 = v41;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v43 = sqlite3_errmsg((sqlite3 *)CRUdb);
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)v72 = v38;
                *(_WORD *)&v72[8] = 1024;
                *(_DWORD *)&v72[10] = v42;
                v73 = 2080;
                v74 = v43;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: SQL Delete step failure for bundleID: %s [%d %s]\n", buf, 0x1Cu);
              }
            }
            sqlite3_finalize(pStmt);
          }
        }
        v34 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
        if (v34)
          continue;
        break;
      }
    }
    v32 = 0;
LABEL_52:

    if (v32 && CRUdb)
      sqlite3_file_control((sqlite3 *)CRUdb, 0, 101, 0);
    CRUCloseSQLDB();
    v3 = &selRef_URLForDirectory_inDomain_appropriateForURL_create_error_;
    if (v21)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v54 + 32) + 8) + 24) = 1;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        return;
      *(_WORD *)buf = 0;
      v9 = "NANDStats: INFO!! isNANDStatsReporting set to true";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      return;
    }
LABEL_19:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats: INFO!! isNANDStatsReporting set to false. Invalidating FBSDisplayLayoutMonitor", buf, 2u);
    }
    v11 = v3[221];
    if (v11)
    {
      objc_msgSend(v11, "invalidate");
      v3[221] = 0;
    }
    return;
  }
  v6 = v5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = sqlite3_errmsg((sqlite3 *)CRUdb);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v72 = v6;
    *(_WORD *)&v72[4] = 2080;
    *(_QWORD *)&v72[6] = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NANDStats - Exception ::::: SQL Select failure %d %s\n", buf, 0x12u);
  }
  v8 = ppStmt;
LABEL_12:
  sqlite3_finalize(v8);
  CRUCloseSQLDB();
}

uint64_t sub_100007CA0(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, void *a5, void *a6, void *a7, void *a8, double a9)
{
  void *v12;
  sqlite3_int64 v13;
  int v14;
  uint64_t v21;
  unsigned int v22;

  if (a9 * 1073741820.0 < (double)a3)
  {
    NSLog(CFSTR("NANDStats: INFO!! BundleId : %@ has exceeded the day %lu budget"), a2, a1);
    v12 = a2;
    v13 = a3;
    v14 = 0;
    return sub_100007EA0(v12, v13, v14);
  }
  NSLog(CFSTR("NANDStats: INFO!! BundleId : %@ with writes: %llu being counted towards NAND dialog reporting for day %lu"), a2, a3, a1);
  if (objc_msgSend(a5, "objectForKey:", a2))
  {
    v21 = objc_msgSend(objc_msgSend(a5, "objectForKey:", a2), "unsignedIntValue") + 1;
    objc_msgSend(a5, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v21), a2);
    objc_msgSend(a8, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)objc_msgSend(objc_msgSend(a8, "objectForKey:", a2), "unsignedLongLongValue") + a3), a2);
    if (v21 >= 5)
    {
      if (!objc_msgSend(a7, "objectForKey:", a2)
        || (v22 = objc_msgSend(objc_msgSend(a7, "objectForKey:", a2), "unsignedIntValue"),
            (unint64_t)objc_msgSend(objc_msgSend(a6, "objectForKey:", a2), "unsignedLongLongValue") + 86400 * v22 < a4))
      {
        objc_msgSend(objc_msgSend(a8, "objectForKey:", a2), "unsignedLongLongValue");
        v12 = a2;
        v13 = a3;
        v14 = 1;
        return sub_100007EA0(v12, v13, v14);
      }
      NSLog(CFSTR("NANDStats: INFO!! Not reporting bundleId : %@ for day %lu. Too frequent since last dialog was reported."), a2, a1);
    }
  }
  else
  {
    objc_msgSend(a5, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1), a2);
    objc_msgSend(a8, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3), a2);
  }
  return 0;
}

uint64_t sub_100007EA0(void *a1, sqlite3_int64 a2, int a3)
{
  int v6;
  int v7;
  const char *v8;
  const char *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  sqlite3_int64 v13;
  int v14;
  int v15;
  const char *v16;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;

  ppStmt = 0;
  v6 = sqlite3_prepare_v2((sqlite3 *)CRUdb, "REPLACE INTO NANDStats(bundleID, presentDialog, logicalWrites) VALUES(?, ?, ?)", -1, &ppStmt, 0);
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = sqlite3_errmsg((sqlite3 *)CRUdb);
      *(_DWORD *)buf = 67109378;
      v20 = v7;
      v21 = 2080;
      v22 = v8;
      v9 = "NANDStats - Exception ::::: sqlite insert prepare failed %d %s\n";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, 0x12u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v10 = (const char *)objc_msgSend(a1, "UTF8String");
  v11 = strlen(v10);
  v12 = 1;
  sqlite3_bind_text(ppStmt, 1, v10, v11, 0);
  if (a3)
    v13 = 257;
  else
    v13 = 1;
  sqlite3_bind_int64(ppStmt, 2, v13);
  sqlite3_bind_int64(ppStmt, 3, a2);
  v14 = sqlite3_step(ppStmt);
  if (v14 != 101)
  {
    v15 = v14;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v16 = sqlite3_errmsg((sqlite3 *)CRUdb);
      *(_DWORD *)buf = 67109378;
      v20 = v15;
      v21 = 2080;
      v22 = v16;
      v9 = "NANDStats - Exception ::::: sqlite insert failed %d %s\n";
      goto LABEL_10;
    }
LABEL_11:
    v12 = 2;
  }
  sqlite3_finalize(ppStmt);
  return v12;
}

void sub_100008068(id a1, OS_xpc_object *a2)
{
  _BOOL4 v2;
  CFRunLoopRef Main;
  uint8_t v4[16];
  uint8_t buf[16];

  if (xpc_activity_get_state(a2) == 2)
  {
    v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (&_SBSGetScreenLockStatus)
    {
      if (v2)
      {
        *(_WORD *)v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FSTaskScheduler :: Sending data to CA", v4, 2u);
      }
      sub_1000066C0();
    }
    else if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FSTaskScheduler :: No SpringBoardServices framework. Not sending FS Stats to CA.", buf, 2u);
    }
    Main = CFRunLoopGetMain();
    CFRetain(Main);
    CFRunLoopStop(Main);
    CFRelease(Main);
  }
}

_DWORD *(*iocompressionstats_notification_server_routine(uint64_t a1))(_DWORD *result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 5600)
    return sub_100008154;
  else
    return 0;
}

_DWORD *sub_100008154(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    result = (_DWORD *)iocompressionstats_notification();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t iocompressionstats_notification_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (a1[5] == 5600)
  {
    if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    {
      *(_DWORD *)(a2 + 32) = -304;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
    }
    else
    {
      *(_DWORD *)(a2 + 32) = iocompressionstats_notification();
    }
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t FSDConnect(const char *a1)
{
  const __CFDictionary *v2;
  mach_port_t mainPort[2];

  *(_QWORD *)mainPort = 0;
  if (IOMainPort(0, &mainPort[1]))
  {
    warnx("IOMasterPort failed");
  }
  else
  {
    v2 = IOServiceMatching(a1);
    if (v2)
    {
      if (IOServiceGetMatchingServices(mainPort[1], v2, mainPort))
      {
        warnx("IOServiceGetMatchingServices failed");
      }
      else
      {
        fsdService = IOIteratorNext(mainPort[0]);
        IOObjectRelease(mainPort[0]);
        if (fsdService)
        {
          if (!IOServiceOpen(fsdService, mach_task_self_, 0, (io_connect_t *)&fsdConnection))
            return 1;
          warnx("IOServiceOpen failed for class '%s'");
        }
        else
        {
          warnx("No %s instance found");
        }
      }
    }
    else
    {
      warnx("IOServiceMatching failed for %s");
    }
  }
  return 0;
}

void FSDDisconnect()
{
  if (fsdConnection && IOServiceClose(fsdConnection))
    warnx("IOServiceClose failed");
  fsdConnection = 0;
}

uint64_t GetDiskObject(const char *a1)
{
  uint64_t v2;
  const char *v3;
  io_iterator_t iterator;
  char name[136];

  iterator = 0;
  memset(name, 0, 128);
  v2 = 0;
  if (IORegistryEntryCreateIterator(fsdService, "IOService", 0, &iterator))
  {
    v3 = "IORegistryEntryCreateIterator failed";
  }
  else
  {
    v3 = "IORegistryEntryGetName failed";
    while (1)
    {
      if ((_DWORD)v2)
        IOObjectRelease(v2);
      v2 = IOIteratorNext(iterator);
      if (IORegistryEntryGetName(v2, name))
        break;
      if (!strcmp(name, a1))
        goto LABEL_7;
    }
  }
  warnx(v3);
LABEL_7:
  if (iterator)
    IOObjectRelease(iterator);
  return v2;
}

uint64_t FSDGetInfo(const char *a1, int a2)
{
  uint64_t result;
  io_object_t v4;
  uint64_t v5;

  if (a2)
  {
    result = sub_100008664(fsdService, "NAND Controller");
    if (!(_DWORD)result)
      return result;
    result = GetDiskObject(a1);
    if (!(_DWORD)result)
      return result;
    v4 = result;
    if (!sub_100008664(result, "NAND Devices"))
    {
      IOObjectRelease(v4);
      return 0;
    }
  }
  else
  {
    result = GetDiskObject(a1);
    v4 = result;
    if (!(_DWORD)result)
      return result;
  }
  v5 = 0;
  if (sub_100008724(v4, CFSTR("#ce"), (UInt8 *)&gBankCount, 4)
    && sub_100008724(v4, CFSTR("ppn-device"), (UInt8 *)&gPpnDevice, 4)
    && sub_100008724(v4, CFSTR("device-readid"), (UInt8 *)&v5, 8)
    && sub_100008724(v4, CFSTR("#ce-blocks"), (UInt8 *)&gBlocksPerBank, 4)
    && sub_100008724(v4, CFSTR("#block-pages"), gPagesPerBlock, 4)
    && sub_100008724(v4, CFSTR("#page-bytes"), gBytesPerPage, 4))
  {
    gBuses = gBankCount;
    gTotalCAUs = 1;
    gBlocksPerCAU = gBlocksPerBank;
    if (sub_100008724(v4, CFSTR("ppn-spec-version"), (UInt8 *)&gPpnSpecLong, 8))
      snprintf(gPpnSpec, 0xDuLL, "%llx", gPpnSpecLong);
    gDevID = v5;
  }
  else
  {
    warnx("cannot get basic NAND parameters");
  }
  IOObjectRelease(v4);
  return 1;
}

BOOL sub_100008664(io_registry_entry_t a1, char *a2)
{
  size_t v4;
  kern_return_t v5;
  CFMutableDictionaryRef properties;

  puts(a2);
  if (*a2)
  {
    v4 = 0;
    do
    {
      putchar(61);
      ++v4;
    }
    while (v4 < strlen(a2));
  }
  properties = 0;
  putchar(10);
  v5 = IORegistryEntryCreateCFProperties(a1, &properties, kCFAllocatorDefault, 0);
  if (v5)
  {
    warnx("IORegistryEntryCreateCFProperties failed");
  }
  else
  {
    TAOCFPrettyPrint(properties);
    CFRelease(properties);
    putchar(10);
  }
  return v5 == 0;
}

BOOL sub_100008724(io_registry_entry_t a1, const __CFString *a2, UInt8 *a3, CFIndex a4)
{
  CFTypeRef CFProperty;
  const void *v7;
  CFTypeID v8;
  CFNumberType v9;
  CFTypeID v10;
  CFTypeID v12;
  CFIndex Length;
  CFRange v14;
  CFTypeID v15;
  char v16[64];

  CFProperty = IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    sub_1000095A0();
    return 0;
  }
  v7 = CFProperty;
  v8 = CFGetTypeID(CFProperty);
  if (v8 != CFNumberGetTypeID())
  {
    v10 = CFGetTypeID(v7);
    if (v10 == CFBooleanGetTypeID())
    {
      *(_DWORD *)a3 = CFBooleanGetValue((CFBooleanRef)v7);
      return 1;
    }
    v12 = CFGetTypeID(v7);
    if (v12 == CFDataGetTypeID())
    {
      Length = CFDataGetLength((CFDataRef)v7);
      if (Length >= a4)
        v14.length = a4;
      else
        v14.length = Length;
      v14.location = 0;
      CFDataGetBytes((CFDataRef)v7, v14, a3);
      return 1;
    }
    v15 = CFGetTypeID(v7);
    if (v15 == CFArrayGetTypeID())
    {
      gControllers = (uint64_t)v7;
      return 1;
    }
    sub_1000095D4(v7, v16);
    return 0;
  }
  if (a4 < 5)
    v9 = kCFNumberSInt32Type;
  else
    v9 = kCFNumberSInt64Type;
  return CFNumberGetValue((CFNumberRef)v7, v9, a3) != 0;
}

uint64_t FSDGetAdvancedInfo(const __CFString *a1, int a2)
{
  const __CFDictionary *v4;
  io_object_t v5;
  io_registry_entry_t v6;
  CFTypeRef v7;
  CFTypeID v8;
  const __CFDictionary *ValueAtIndex;
  CFTypeID v10;
  const __CFString *Value;
  const __CFString *v12;
  CFTypeID v13;
  CFStringEncoding SystemEncoding;
  const char *CStringPtr;
  CFTypeID v16;
  CFStringEncoding v17;
  const __CFString *v18;
  const __CFString *v19;
  CFTypeID v20;
  CFStringEncoding v21;
  const char *v22;
  CFTypeID v23;
  CFStringEncoding v24;
  const __CFString *v25;
  const __CFString *v26;
  CFTypeID v27;
  CFStringEncoding v28;
  const char *v29;
  CFTypeID v30;
  const __CFString *v31;
  const __CFString *v32;
  CFTypeID v33;
  CFStringEncoding v34;
  const char *v35;
  CFTypeID v36;
  uint64_t Length;
  CFStringEncoding v38;
  CFStringEncoding v39;
  const __CFString *v40;
  const __CFString *v41;
  CFTypeID v42;
  CFStringEncoding v43;
  const char *v44;
  CFStringEncoding v45;
  const __CFString *v46;
  const __CFString *v47;
  CFTypeID v48;
  CFStringEncoding v49;
  const char *v50;
  CFTypeID v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  CFStringEncoding v55;
  const __CFString *v56;
  const __CFString *v57;
  CFTypeID v58;
  uint64_t v59;
  CFStringEncoding v60;
  const char *v61;
  char *v62;
  CFStringEncoding v63;
  const void *v64;
  const void *v65;
  CFIndex v66;
  const void *v67;
  uint64_t v68;
  int *v69;
  int v70;
  CFIndex v71;
  uint64_t v72;
  uint64_t v73;
  const void *v74;
  const void *v75;
  const void *v76;
  const void *v77;
  const void *v78;
  const void *v79;
  io_iterator_t existing;
  int v82;
  CFArrayRef v83;
  CFArrayRef v84;
  UInt8 buffer[8];
  UInt8 v86[16];
  CFRange v87;
  CFRange v88;
  CFRange v89;
  CFRange v90;
  CFRange v91;

  existing = 0;
  v4 = IOServiceMatching("IOMedia");
  IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing);
  if (!existing)
    return 0;
  v5 = IOIteratorNext(existing);
  if (v5)
  {
    v6 = v5;
    do
    {
      v7 = IORegistryEntrySearchCFProperty(v6, "IOService", a1, kCFAllocatorDefault, 3u);
      IOObjectRelease(v6);
      if (!v7)
        break;
      v83 = 0;
      v84 = 0;
      v8 = CFGetTypeID(v7);
      ValueAtIndex = (const __CFDictionary *)v7;
      if (v8 != CFDictionaryGetTypeID())
      {
        v10 = CFGetTypeID(v7);
        if (v10 != CFArrayGetTypeID())
          goto LABEL_66;
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v7, 0);
      }
      Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("manufacturer-id"));
      if (!Value)
        goto LABEL_66;
      v12 = Value;
      v13 = CFGetTypeID(Value);
      if (v13 == CFStringGetTypeID())
      {
        SystemEncoding = CFStringGetSystemEncoding();
        CStringPtr = CFStringGetCStringPtr(v12, SystemEncoding);
        if (CStringPtr)
        {
          strncpy(gManufacturerID, CStringPtr, 0x15uLL)[20] = 0;
        }
        else
        {
          v17 = CFStringGetSystemEncoding();
          if (CFStringGetCString(v12, gManufacturerID, 21, v17))
            byte_1000141FC = 0;
        }
      }
      else
      {
        v16 = CFGetTypeID(v12);
        if (v16 != CFDataGetTypeID())
        {
          sub_10000975C(v12);
          goto LABEL_66;
        }
        if (CFDataGetLength((CFDataRef)v12) != 8)
        {
          warnx("Manufacturer ID not 8 bytes as expected\n");
          goto LABEL_66;
        }
        v87.location = 0;
        v87.length = 8;
        CFDataGetBytes((CFDataRef)v12, v87, buffer);
        snprintf(gManufacturerID, 0x15uLL, "0x%llx", *(_QWORD *)buffer);
        gManufacturerIDLong = *(_QWORD *)buffer;
      }
      v18 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("firmware-version"));
      if (v18)
      {
        v19 = v18;
        v20 = CFGetTypeID(v18);
        if (v20 == CFStringGetTypeID())
        {
          v21 = CFStringGetSystemEncoding();
          v22 = CFStringGetCStringPtr(v19, v21);
          if (v22)
          {
            strncpy((char *)gFirmwareVersion, v22, 0x11uLL);
          }
          else
          {
            v24 = CFStringGetSystemEncoding();
            if (!CFStringGetCString(v19, (char *)gFirmwareVersion, 17, v24))
              goto LABEL_26;
          }
        }
        else
        {
          v23 = CFGetTypeID(v19);
          if (v23 != CFDataGetTypeID())
          {
            sub_100009728(v19);
            goto LABEL_66;
          }
          if (CFDataGetLength((CFDataRef)v19) != 16)
          {
            warnx("Firmware Version not the expected size\n");
            goto LABEL_66;
          }
          v88.location = 0;
          v88.length = 16;
          CFDataGetBytes((CFDataRef)v19, v88, gFirmwareVersion);
        }
        byte_10001422B = 0;
      }
LABEL_26:
      v25 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("msp-version"));
      if (!v25)
        goto LABEL_34;
      v26 = v25;
      v27 = CFGetTypeID(v25);
      if (v27 != CFStringGetTypeID())
      {
        v30 = CFGetTypeID(v26);
        if (v30 != CFDataGetTypeID())
        {
          sub_1000096F4(v26);
          goto LABEL_66;
        }
        if (CFDataGetLength((CFDataRef)v26) != 16)
        {
          warnx("MSP Version not the expected size\n");
          goto LABEL_66;
        }
        v89.location = 0;
        v89.length = 16;
        CFDataGetBytes((CFDataRef)v26, v89, gMSPVersion);
        byte_10001423C = 0;
        goto LABEL_33;
      }
      v28 = CFStringGetSystemEncoding();
      v29 = CFStringGetCStringPtr(v26, v28);
      if (v29)
      {
        strncpy((char *)gMSPVersion, v29, 0x11uLL)[16] = 0;
LABEL_33:
        gMSPVersionPresent = 1;
        goto LABEL_34;
      }
      v38 = CFStringGetSystemEncoding();
      if (CFStringGetCString(v26, (char *)gMSPVersion, 17, v38))
      {
        gMSPVersionPresent = 1;
        byte_10001423C = 0;
      }
LABEL_34:
      v31 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("nand-marketing-name"));
      if (!v31)
        goto LABEL_45;
      v32 = v31;
      v33 = CFGetTypeID(v31);
      if (v33 == CFStringGetTypeID())
      {
        v34 = CFStringGetSystemEncoding();
        v35 = CFStringGetCStringPtr(v32, v34);
        if (v35)
        {
          strncpy((char *)gMarketingName, v35, 0x15uLL);
        }
        else
        {
          v39 = CFStringGetSystemEncoding();
          if (!CFStringGetCString(v32, (char *)gMarketingName, 21, v39))
            goto LABEL_45;
        }
      }
      else
      {
        v36 = CFGetTypeID(v32);
        if (v36 != CFDataGetTypeID())
        {
          sub_1000096C0(v32);
          goto LABEL_66;
        }
        Length = CFDataGetLength((CFDataRef)v32);
        if (Length > 20)
        {
          warnx("Marketing Name not the expected size\n");
          goto LABEL_66;
        }
        v90.length = Length;
        v90.location = 0;
        CFDataGetBytes((CFDataRef)v32, v90, gMarketingName);
      }
      byte_100014251 = 0;
LABEL_45:
      v40 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("vendor-name"));
      if (!v40)
        goto LABEL_52;
      v41 = v40;
      v42 = CFGetTypeID(v40);
      if (v42 != CFStringGetTypeID())
      {
        sub_10000968C(v41);
        goto LABEL_66;
      }
      v43 = CFStringGetSystemEncoding();
      v44 = CFStringGetCStringPtr(v41, v43);
      if (v44)
      {
        gManufacturerPresent = 1;
        strncpy(gManufacturer, v44, 0x1EuLL);
      }
      else
      {
        v45 = CFStringGetSystemEncoding();
        if (!CFStringGetCString(v41, gManufacturer, 30, v45))
          goto LABEL_52;
        gManufacturerPresent = 1;
      }
      byte_10001421A = 0;
LABEL_52:
      v46 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("controller-unique-id"));
      if (v46)
      {
        v47 = v46;
        v48 = CFGetTypeID(v46);
        if (v48 != CFStringGetTypeID())
        {
          v51 = CFGetTypeID(v47);
          if (v51 != CFDataGetTypeID())
          {
            sub_100009658(v47);
            goto LABEL_66;
          }
          if (CFDataGetLength((CFDataRef)v47) != 16)
          {
            warnx("Controller UID not the expected size\n");
            goto LABEL_66;
          }
          v91.location = 0;
          v91.length = 16;
          CFDataGetBytes((CFDataRef)v47, v91, v86);
          v52 = 0;
          gControllerUID = 0;
          v53 = &byte_100014253;
          do
          {
            v54 = v86[v52];
            *(v53 - 1) = a0123456789abcd[v54 >> 4];
            *v53 = a0123456789abcd[v54 & 0xF];
            v53 += 2;
            ++v52;
          }
          while (v52 != 16);
          goto LABEL_62;
        }
        v49 = CFStringGetSystemEncoding();
        v50 = CFStringGetCStringPtr(v47, v49);
        if (v50)
        {
          strncpy(&gControllerUID, v50, 0x21uLL);
LABEL_62:
          byte_100014272 = 0;
          goto LABEL_63;
        }
        v55 = CFStringGetSystemEncoding();
        if (CFStringGetCString(v47, &gControllerUID, 33, v55))
          goto LABEL_62;
      }
LABEL_63:
      v56 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("chip-id"));
      if (!v56)
        goto LABEL_87;
      v57 = v56;
      v58 = CFGetTypeID(v56);
      if (v58 == CFStringGetTypeID())
      {
        v60 = CFStringGetSystemEncoding();
        v61 = CFStringGetCStringPtr(v57, v60);
        if (v61)
        {
          v62 = strncpy(gChipID, v61, 0xDuLL);
          v62[12] = 0;
LABEL_85:
          if ((isPpnDevice(v62) & 1) != 0)
            gPpnDevice = 1;
        }
        else
        {
          v63 = CFStringGetSystemEncoding();
          if (CFStringGetCString(v57, gChipID, 13, v63))
          {
            byte_1000143DC = 0;
            v62 = gChipID;
            goto LABEL_85;
          }
        }
LABEL_87:
        v64 = CFDictionaryGetValue(ValueAtIndex, CFSTR("capacity"));
        FSDRetrieveValueFromCFNumber(v64, &gCapacity);
        v65 = CFDictionaryGetValue(ValueAtIndex, CFSTR("num-bus"));
        FSDRetrieveValueFromCFNumber(v65, &gBuses);
        v84 = (CFArrayRef)CFDictionaryGetValue(ValueAtIndex, CFSTR("dies-per-bus"));
        if (v84)
        {
          v66 = FSDFetchArrayHelper(&v84, 0x10uLL, (char *)gDiesPerBus);
          if (v66 != gBuses)
            warnx("diesPerBus elements count (%zu) not as expected (%u)\n", v66, gBuses);
        }
        else
        {
          v82 = 0;
          v67 = CFDictionaryGetValue(ValueAtIndex, CFSTR("dies-per-channel"));
          FSDRetrieveValueFromCFNumber(v67, &v82);
          v68 = gBuses;
          if (gBuses)
          {
            v69 = gDiesPerBus;
            v70 = v82;
            do
            {
              *v69++ = v70;
              --v68;
            }
            while (v68);
          }
        }
        v83 = (CFArrayRef)CFDictionaryGetValue(ValueAtIndex, CFSTR("bus-to-msp"));
        if (v83)
        {
          v71 = FSDFetchArrayHelper(&v83, 0x10uLL, (char *)&gBusToMsp);
          if (v71 != gBuses)
            warnx("busToMsp elements count (%zu) not as expected (%u)\n", v71, gBuses);
        }
        else
        {
          v72 = gBuses;
          if (gBuses)
          {
            v73 = 0;
            do
            {
              *((_DWORD *)&gBusToMsp + v73) = v73 >> 1;
              ++v73;
            }
            while (v72 != v73);
          }
        }
        v74 = CFDictionaryGetValue(ValueAtIndex, CFSTR("num-dip"));
        FSDRetrieveValueFromCFNumber(v74, &gTotalCAUs);
        v75 = CFDictionaryGetValue(ValueAtIndex, CFSTR("blocks-per-cau"));
        FSDRetrieveValueFromCFNumber(v75, &gBlocksPerCAU);
        v76 = CFDictionaryGetValue(ValueAtIndex, CFSTR("page-size"));
        FSDRetrieveValueFromCFNumber(v76, &gBytesPerPage);
        v77 = CFDictionaryGetValue(ValueAtIndex, CFSTR("pages-per-block-mlc"));
        FSDRetrieveValueFromCFNumber(v77, &gPagesPerBlock);
        v78 = CFDictionaryGetValue(ValueAtIndex, CFSTR("default-bits-per-cell"));
        FSDRetrieveValueFromCFNumber(v78, &gBitsPerCell);
        v79 = CFDictionaryGetValue(ValueAtIndex, CFSTR("program-scheme"));
        FSDRetrieveValueFromCFNumber(v79, &gPrgmScheme);
        if (a2)
        {
          puts("\nDevice Characteristics:\n");
          TAOCFPrettyPrint((const __CFDictionary *)v7);
        }
        CFRelease(v7);
        v59 = 1;
        goto LABEL_102;
      }
      sub_100009624(v57);
LABEL_66:
      CFRelease(v7);
      v6 = IOIteratorNext(existing);
    }
    while (v6);
  }
  v59 = 0;
LABEL_102:
  if (existing)
    IOObjectRelease(existing);
  return v59;
}

uint64_t isPpnDevice(const char *a1)
{
  size_t v2;
  uint64_t result;
  uint64_t i;
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  size_t v8;
  uint64_t v9;

  gPpnSpec[0] = 0;
  v2 = strlen(a1);
  result = 0;
  if (v2 >= 7)
  {
    for (i = 0; i != 6; ++i)
    {
      if (a1[i] != ppnChipID[i])
        return 0;
    }
    if (strlen(a1) < 7)
    {
      v9 = 0;
    }
    else
    {
      v5 = 0;
      do
      {
        gPpnSpec[v5] = a1[v5 + 6];
        v6 = v5 + 1;
        v7 = strlen(a1);
        v8 = v5 + 7;
        ++v5;
      }
      while (v7 > v8);
      v9 = v6;
    }
    gPpnSpec[v9] = 0;
    return 1;
  }
  return result;
}

uint64_t FSDHexDump(uint64_t result, _BYTE *a2, unsigned int a3, unsigned int a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  *a2 = 0;
  if (((2 * a3) | 1) <= a4)
  {
    if (a3)
    {
      v4 = 0;
      LOBYTE(v5) = 0;
      do
      {
        a2[v5] = a0123456789abcd[(unint64_t)*(unsigned __int8 *)(result + v4) >> 4];
        v6 = v5 | 1;
        LOBYTE(v5) = v5 + 2;
        a2[v6] = a0123456789abcd[*(_BYTE *)(result + v4++) & 0xF];
      }
      while (a3 > v4);
      v5 = v5;
    }
    else
    {
      v5 = 0;
    }
    a2[v5] = 0;
  }
  return result;
}

void FSDRetrieveValueFromCFNumber(const void *a1, void *a2)
{
  CFTypeID v4;
  CFNumberType Type;

  if (a1)
  {
    v4 = CFGetTypeID(a1);
    if (v4 == CFNumberGetTypeID())
    {
      Type = CFNumberGetType((CFNumberRef)a1);
      if (!CFNumberGetValue((CFNumberRef)a1, Type, a2))
        warnx("value could not be copied\n");
    }
    else
    {
      sub_100009790(a1);
    }
  }
}

CFIndex FSDFetchArrayHelper(CFArrayRef *a1, unint64_t a2, char *a3)
{
  unint64_t Count;
  CFIndex v7;
  unint64_t v8;
  const void **v9;
  size_t v10;
  CFIndex v11;
  const void *v12;
  uint64_t v14;
  CFRange v15;

  Count = CFArrayGetCount(*a1);
  if (Count > a2)
    return 0;
  v7 = Count;
  __chkstk_darwin();
  v9 = (const void **)((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v8 >= 0x200)
    v10 = 512;
  else
    v10 = v8;
  bzero((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  v15.location = 0;
  v15.length = v7;
  CFArrayGetValues(*a1, v15, v9);
  bzero(a3, 4 * a2);
  if (v7)
  {
    v11 = v7;
    do
    {
      v12 = *v9++;
      FSDRetrieveValueFromCFNumber(v12, a3);
      a3 += 4;
      --v11;
    }
    while (v11);
  }
  return v7;
}

uint64_t sub_10000957C(const __CFString *a1)
{
  char *v1;

  return CFStringGetCString(a1, v1, 64, 0x600u);
}

CFTypeID sub_10000958C(CFTypeRef cf)
{
  return CFGetTypeID(cf);
}

const char *sub_100009594(CFStringEncoding encoding)
{
  const __CFString *v1;

  return CFStringGetCStringPtr(v1, encoding);
}

void sub_1000095A0()
{
  CFStringEncoding SystemEncoding;
  const char *v1;

  SystemEncoding = CFStringGetSystemEncoding();
  v1 = sub_100009594(SystemEncoding);
  warnx("error fetching property '%s'", v1);
  sub_100004488();
}

void sub_1000095D4(const void *a1, char *a2)
{
  CFTypeID v3;
  const __CFString *v4;
  CFStringEncoding SystemEncoding;
  const char *v6;

  v3 = CFGetTypeID(a1);
  v4 = CFCopyTypeIDDescription(v3);
  CFStringGetCString(v4, a2, 64, 0x600u);
  SystemEncoding = CFStringGetSystemEncoding();
  v6 = sub_100009594(SystemEncoding);
  warnx("property '%s' has unexpected type '%s'", v6, a2);
  sub_100004488();
}

void sub_100009624(const void *a1)
{
  const char *v1;
  CFTypeID v2;
  const __CFString *v3;

  v2 = sub_10000958C(a1);
  v3 = CFCopyTypeIDDescription(v2);
  sub_10000957C(v3);
  warnx("Chip ID has unexpected type '%s'\n", v1);
  sub_100004488();
}

void sub_100009658(const void *a1)
{
  const char *v1;
  CFTypeID v2;
  const __CFString *v3;

  v2 = sub_10000958C(a1);
  v3 = CFCopyTypeIDDescription(v2);
  sub_10000957C(v3);
  warnx("Controller UID has unexpected type '%s'\n", v1);
  sub_100004488();
}

void sub_10000968C(const void *a1)
{
  const char *v1;
  CFTypeID v2;
  const __CFString *v3;

  v2 = sub_10000958C(a1);
  v3 = CFCopyTypeIDDescription(v2);
  sub_10000957C(v3);
  warnx("manufacturer name has unexpected type '%s'\n", v1);
  sub_100004488();
}

void sub_1000096C0(const void *a1)
{
  const char *v1;
  CFTypeID v2;
  const __CFString *v3;

  v2 = sub_10000958C(a1);
  v3 = CFCopyTypeIDDescription(v2);
  sub_10000957C(v3);
  warnx("marketing name has unexpected type '%s'\n", v1);
  sub_100004488();
}

void sub_1000096F4(const void *a1)
{
  const char *v1;
  CFTypeID v2;
  const __CFString *v3;

  v2 = sub_10000958C(a1);
  v3 = CFCopyTypeIDDescription(v2);
  sub_10000957C(v3);
  warnx("msp-version has unexpected type '%s'\n", v1);
  sub_100004488();
}

void sub_100009728(const void *a1)
{
  const char *v1;
  CFTypeID v2;
  const __CFString *v3;

  v2 = sub_10000958C(a1);
  v3 = CFCopyTypeIDDescription(v2);
  sub_10000957C(v3);
  warnx("firmware-version has unexpected type '%s'\n", v1);
  sub_100004488();
}

void sub_10000975C(const void *a1)
{
  const char *v1;
  CFTypeID v2;
  const __CFString *v3;

  v2 = sub_10000958C(a1);
  v3 = CFCopyTypeIDDescription(v2);
  sub_10000957C(v3);
  warnx("manufacturerID has unexpected type '%s'\n", v1);
  sub_100004488();
}

void sub_100009790(const void *a1)
{
  const char *v1;
  CFTypeID v2;
  const __CFString *v3;

  v2 = sub_10000958C(a1);
  v3 = CFCopyTypeIDDescription(v2);
  sub_10000957C(v3);
  warnx("value has unexpected type '%s'\n", v1);
  sub_100004488();
}

void TAOCFPrettyPrint(const __CFDictionary *a1)
{
  _QWORD v1[3];

  v1[0] = 0;
  v1[1] = "\t";
  v1[2] = __stdoutp;
  sub_10000988C(a1, v1);
}

void TAOCFPrettyPrintToFile(const __CFDictionary *a1, uint64_t a2)
{
  _QWORD v2[3];

  v2[0] = 0;
  v2[1] = "\t";
  v2[2] = a2;
  sub_10000988C(a1, v2);
}

void TAOCFPrettyPrintWithIndenter(const __CFDictionary *a1, uint64_t a2)
{
  _QWORD v2[3];

  v2[1] = a2;
  v2[2] = __stdoutp;
  v2[0] = 0;
  sub_10000988C(a1, v2);
}

void TAOCFPrettyPrintToFileWithIndenter(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  _QWORD v3[3];

  v3[1] = a3;
  v3[2] = a2;
  v3[0] = 0;
  sub_10000988C(a1, v3);
}

void sub_10000988C(const __CFDictionary *a1, void *a2)
{
  const __CFDictionary *v3;
  CFTypeID v4;
  CFTypeID v5;
  CFTypeID v6;
  CFTypeID v7;
  CFRange v8;

  if (a1)
  {
    v3 = a1;
    v4 = CFGetTypeID(a1);
    if (v4 == CFDictionaryGetTypeID())
    {
      CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_1000099E8, a2);
      return;
    }
    v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID())
    {
      v8.length = CFArrayGetCount(v3);
      v8.location = 0;
      CFArrayApplyFunction(v3, v8, (CFArrayApplierFunction)sub_100009A3C, a2);
      return;
    }
    v6 = CFGetTypeID(v3);
    if (v6 == CFTreeGetTypeID())
    {
      sub_100009ACC(v3, (uint64_t)a2);
      return;
    }
    v7 = CFGetTypeID(v3);
    if (v7 == CFBagGetTypeID())
    {
      CFBagApplyFunction(v3, (CFBagApplierFunction)sub_100009B44, a2);
      return;
    }
    a1 = v3;
  }
  sub_1000099A4((uint64_t)a1, (uint64_t)a2);
}

void sub_1000099A4(uint64_t a1, uint64_t a2)
{
  char *v3;

  v3 = (char *)sub_100009B58(a1);
  sub_100009C14(v3, 0, a2);
  if (v3)
    free(v3);
}

void sub_1000099E8(uint64_t a1, const void *a2, uint64_t a3)
{
  char *v5;

  v5 = (char *)sub_100009B58(a1);
  sub_100009C14(v5, a2, a3);
  if (v5)
    free(v5);
}

void sub_100009A3C(const void *a1, uint64_t a2)
{
  int v4;
  char __str[256];

  v4 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = v4 + 1;
  snprintf(__str, 0x100uLL, "%d", v4);
  sub_100009C14(__str, a1, a2);
}

void sub_100009ACC(__CFTree *a1, uint64_t a2)
{
  int v4;
  _DWORD v5[2];
  __int128 v6;
  CFTreeContext context;

  memset(&context, 0, sizeof(context));
  v4 = *(_DWORD *)a2 + 1;
  v6 = *(_OWORD *)(a2 + 8);
  v5[0] = v4;
  v5[1] = 0;
  CFTreeGetContext(a1, &context);
  sub_100009C14((char *)&unk_10000D177, context.info, a2);
  CFTreeApplyFunctionToChildren(a1, (CFTreeApplierFunction)sub_100009ACC, v5);
}

void sub_100009B44(const void *a1, uint64_t a2)
{
  sub_100009C14((char *)&unk_10000D177, a1, a2);
}

void *sub_100009B58(uint64_t a1)
{
  CFStringRef v2;
  BOOL v3;
  const __CFString *v4;
  CFIndex Length;
  CFIndex v6;
  void *v7;

  v2 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@"), a1);
  if (v2)
    v3 = 1;
  else
    v3 = a1 == 0;
  if (v3)
    v4 = v2;
  else
    v4 = CFSTR("<error getting string representation>");
  Length = CFStringGetLength(v4);
  v6 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v7 = malloc_type_malloc(v6, 0x7F6D81C0uLL);
  if (v7 && !CFStringGetCString(v4, (char *)v7, v6, 0x8000100u))
  {
    free(v7);
    return 0;
  }
  return v7;
}

void sub_100009C14(char *a1, const void *a2, uint64_t a3)
{
  int v6;
  CFTypeID v7;
  CFTypeID v8;
  CFTypeID v9;
  CFTypeID v10;
  char *v11;
  FILE *v12;
  _DWORD v13[2];
  __int128 v14;

  if (*(int *)a3 >= 1)
  {
    v6 = 0;
    do
    {
      fputs(*(const char **)(a3 + 8), *(FILE **)(a3 + 16));
      ++v6;
    }
    while (v6 < *(_DWORD *)a3);
  }
  fputs(a1, *(FILE **)(a3 + 16));
  if (a2)
  {
    if (a1 && *a1)
      fputc(58, *(FILE **)(a3 + 16));
    v7 = CFGetTypeID(a2);
    if (v7 == CFDictionaryGetTypeID()
      || (v8 = CFGetTypeID(a2), v8 == CFArrayGetTypeID())
      || (v9 = CFGetTypeID(a2), v9 == CFTreeGetTypeID())
      || (v10 = CFGetTypeID(a2), v10 == CFBagGetTypeID()))
    {
      fputc(10, *(FILE **)(a3 + 16));
      v13[0] = *(_DWORD *)a3 + 1;
      v13[1] = 0;
      v14 = *(_OWORD *)(a3 + 8);
      sub_10000988C(a2, v13);
    }
    else
    {
      v11 = (char *)sub_100009B58((uint64_t)a2);
      if (a1 && *a1)
        fputc(32, *(FILE **)(a3 + 16));
      v12 = *(FILE **)(a3 + 16);
      if (v11)
      {
        fprintf(v12, "%s\n", v11);
        free(v11);
      }
      else
      {
        fwrite("(NULL)\n", 7uLL, 1uLL, v12);
      }
    }
  }
  else
  {
    fputc(10, *(FILE **)(a3 + 16));
  }
}

CFStringRef buildAggDKey(void *a1)
{
  const __CFArray *v1;
  void *values[2];

  values[0] = kFSInfoCAPrefix;
  values[1] = a1;
  v1 = CFArrayCreate(kCFAllocatorDefault, (const void **)values, 2, &kCFTypeArrayCallBacks);
  return CFStringCreateByCombiningStrings(kCFAllocatorDefault, v1, CFSTR("."));
}

CFNumberRef get_storage_capacity()
{
  const __CFArray *v0;
  CFIndex v1;
  char i;
  char v3;
  const __CFString *ValueAtIndex;
  unint64_t v6;
  void *values[2];

  v6 = 0;
  values[0] = CFSTR("Device Characteristics");
  values[1] = CFSTR("Controller Characteristics");
  v0 = CFArrayCreate(kCFAllocatorDefault, (const void **)values, 2, &kCFTypeArrayCallBacks);
  v1 = 0;
  for (i = 1; ; i = 0)
  {
    v3 = i;
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v0, v1);
    if (FSDGetAdvancedInfo(ValueAtIndex, 0))
    {
      if (gCapacity)
        break;
    }
    v1 = 1;
    if ((v3 & 1) == 0)
      return CFNumberCreate(0, kCFNumberLongLongType, &v6);
  }
  v6 = gCapacity / 0x3B9ACA00uLL;
  return CFNumberCreate(0, kCFNumberLongLongType, &v6);
}

uint64_t FSStats_listenToLockStateChangeNotification(uint64_t result)
{
  NSObject *v1;
  const void *v2;
  const void *v3;
  _BOOL4 v4;

  if (&_SBSGetScreenLockStatus)
  {
    v1 = result;
    v2 = (const void *)MGCopyAnswer(CFSTR("DeviceClass"), 0);
    if (v2)
    {
      v3 = v2;
      v4 = CFEqual(v2, CFSTR("AppleTV")) != 0;
      CFRelease(v3);
    }
    else
    {
      v4 = 0;
    }
    result = notify_register_dispatch(&aComAppleSpring_0[100 * v4], &dword_1000146F0, v1, &stru_1000109A8);
    if (!(_DWORD)result)
    {
      result = SBSGetScreenLockStatus(0);
      if (!(_DWORD)result)
        byte_1000146F4 = 0;
    }
  }
  return result;
}

void sub_100009FF8(id a1, int a2)
{
  if (!(killRequested | SBSGetScreenLockStatus(0)))
  {
    killRequested = 1;
    byte_1000146F4 = 0;
    if (gtid)
      pthread_kill((pthread_t)gtid, 30);
  }
}

__CFDictionary *CopyFSInfo()
{
  __CFDictionary *Mutable;
  int v1;
  uint64_t f_bsize;
  __CFDictionary *v3;
  __CFDictionary *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  _QWORD v12[3];
  void *v13;
  statfs v14;
  pthread_attr_t v15;

  memset(&v15, 0, sizeof(v15));
  v13 = 0;
  v11 = 0;
  v10 = 0;
  memset(&v14, 0, 512);
  v8 = 0;
  v9 = 0;
  v7 = 0;
  v6 = 0;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 80, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v12[2] = 0;
  v12[0] = 5;
  v12[1] = 2147485184;
  if (!getattrlist("/private/var", v12, &v10, 0xCuLL, 0))
  {
    v9 = sub_10000A43C(HIDWORD(v10), 3u);
    v8 = sub_10000A43C(v11, 3u);
    if (!statfs("/private/var", &v14))
    {
      v1 = sub_10000A4B0(1);
      f_bsize = v14.f_bsize;
      if (!v1)
        HIDWORD(v7) = sub_10000A43C((v14.f_bsize* (unint64_t)(vaddvq_s32((int32x4_t)xmmword_10001447C) + dword_10001448C)) >> 20, 2u);
      v6 = (v14.f_bfree * f_bsize) >> 20;
      LODWORD(v7) = (v14.f_blocks * f_bsize) >> 20;
    }
  }
  v3 = CFDictionaryCreateMutable(kCFAllocatorDefault, 12, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  sub_10000A530(v3, CFSTR("FilesCount"), &v9, kCFNumberIntType);
  sub_10000A530(v3, CFSTR("DirectoriesCount"), &v8, kCFNumberIntType);
  sub_10000A530(v3, CFSTR("MetadataMB"), (char *)&v7 + 4, kCFNumberIntType);
  sub_10000A530(v3, CFSTR("TotalFreeSize"), &v6, kCFNumberIntType);
  sub_10000A530(v3, CFSTR("TotalSize"), &v7, kCFNumberIntType);
  CFDictionarySetValue(Mutable, CFSTR("com.apple.FileSystemInfo.MiscStats"), v3);
  xmmword_100014558 = 0u;
  xmmword_100014568 = 0u;
  defrag_stats = 0u;
  if (!fsctl("/private/var", 0xC0304A33uLL, &defrag_stats, 0) || !*__error())
  {
    v4 = CFDictionaryCreateMutable(kCFAllocatorDefault, 8, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    sub_10000A530(v4, CFSTR("FxDefragBlocksReallocated"), &defrag_stats, kCFNumberLongLongType);
    sub_10000A530(v4, CFSTR("FxDefragFextsReallocated"), (char *)&defrag_stats + 8, kCFNumberLongLongType);
    sub_10000A530(v4, CFSTR("FxDefragFextsSkipped"), &xmmword_100014558, kCFNumberLongLongType);
    sub_10000A530(v4, CFSTR("FxDefragChunksChosen"), (char *)&xmmword_100014558 + 8, kCFNumberLongLongType);
    sub_10000A530(v4, CFSTR("FxDefragRuns"), &xmmword_100014568, kCFNumberIntType);
    sub_10000A530(v4, CFSTR("FxDefragCompletions"), (char *)&xmmword_100014568 + 4, kCFNumberIntType);
    sub_10000A530(v4, CFSTR("FxDefragDeepRuns"), (char *)&xmmword_100014568 + 8, kCFNumberIntType);
    sub_10000A530(v4, CFSTR("FxDefragDeepCompletions"), (char *)&xmmword_100014568 + 12, kCFNumberIntType);
    CFDictionarySetValue(Mutable, CFSTR("com.apple.FileSystemInfo.NANDDefragStats"), v4);
  }
  killRequested = 0;
  gtid = 0;
  pthread_attr_init(&v15);
  pthread_attr_setdetachstate(&v15, 1);
  pthread_create((pthread_t *)&gtid, &v15, (void *(__cdecl *)(void *))sub_10000A59C, Mutable);
  pthread_attr_destroy(&v15);
  pthread_join((pthread_t)gtid, &v13);
  gtid = 0;
  return Mutable;
}

uint64_t sub_10000A43C(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  long double v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;

  v2 = a1;
  if ((_DWORD)a1)
  {
    v4 = log10((double)a1) + 1.0;
    v5 = v4 - a2;
    if (v4 >= a2)
    {
      if (v5 > 9)
      {
        return 0;
      }
      else
      {
        v6 = dword_10000CC08[v5];
        v7 = v2 / v6;
        if (v2 % v6 >= v6 >> 1)
          ++v7;
        return v7 * v6;
      }
    }
  }
  return v2;
}

uint64_t sub_10000A4B0(int a1)
{
  uint64_t result;

  *(_OWORD *)&word_100014478 = 0u;
  unk_100014538 = 0u;
  unk_100014528 = 0u;
  unk_100014518 = 0u;
  unk_100014508 = 0u;
  unk_1000144F8 = 0u;
  unk_1000144E8 = 0u;
  unk_1000144D8 = 0u;
  unk_1000144C8 = 0u;
  unk_1000144B8 = 0u;
  *(_OWORD *)&dword_1000144A8 = 0u;
  unk_100014498 = 0u;
  *(__int128 *)((char *)&xmmword_10001447C + 12) = 0u;
  fsinfo = a1;
  word_100014478 = 1;
  result = fsctl("/private/var", 0xC0D4682DuLL, &fsinfo, 0);
  if ((_DWORD)result)
    return *__error();
  return result;
}

void sub_10000A530(__CFDictionary *a1, const void *a2, const void *a3, CFNumberType theType)
{
  CFNumberRef v6;
  CFNumberRef v7;

  v6 = CFNumberCreate(kCFAllocatorDefault, theType, a3);
  if (a2)
  {
    v7 = v6;
    if (v6)
    {
      CFDictionarySetValue(a1, a2, v6);
      CFRelease(v7);
    }
  }
}

uint64_t sub_10000A59C(__CFDictionary *a1)
{
  dispatch_queue_t v2;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  __int128 *v6;
  __CFDictionary *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unsigned int v11;
  __CFDictionary *v12;
  __int128 *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __CFDictionary *v17;
  __int128 *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  __CFDictionary *v22;
  __int128 *v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  __CFDictionary *v31;
  __int128 *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  __CFDictionary *v36;
  __int128 *v37;
  uint64_t v38;
  unint64_t v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int *v46;
  int v47;
  __CFDictionary *v48;
  __int128 *v49;
  uint64_t v50;
  int v51;
  unint64_t v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int *v62;
  int v63;
  __CFDictionary *v64;
  __int128 *v65;
  uint64_t v66;
  int v67;
  unint64_t v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  __CFDictionary *v79;
  __int128 *v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  NSObject *object;
  sigaction v90;
  int v91;
  unint64_t v92;
  int v93;
  int v94;
  uint64_t v95;

  if (a1)
  {
    v95 = 0;
    v94 = 0;
    v93 = 0;
    v92 = 0;
    v91 = 0;
    v90.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_10000B5A0;
    *(_QWORD *)&v90.sa_mask = 0;
    sigaction(30, &v90, 0);
    v2 = dispatch_queue_create("com.apple.FSInfo", 0);
    if (v2)
    {
      byte_1000146F4 = 1;
      object = v2;
      FSStats_listenToLockStateChangeNotification((uint64_t)v2);
      if (byte_1000146F4 == 1)
      {
        if (!sub_10000A4B0(2))
        {
          HIDWORD(v95) = sub_10000A43C(xmmword_10001447C, 2u);
          LODWORD(v95) = sub_10000A43C(DWORD1(xmmword_10001447C), 2u);
          v94 = sub_10000A43C(DWORD2(xmmword_10001447C), 2u);
          v93 = sub_10000A43C(HIDWORD(xmmword_10001447C), 2u);
          Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          sub_10000A530(Mutable, CFSTR("dataExtents"), (char *)&v95 + 4, kCFNumberIntType);
          sub_10000A530(Mutable, CFSTR("catalogExtents"), &v95, kCFNumberIntType);
          sub_10000A530(Mutable, CFSTR("allocationExtents"), &v94, kCFNumberIntType);
          sub_10000A530(Mutable, CFSTR("attributeExtents"), &v93, kCFNumberIntType);
          CFDictionarySetValue(a1, CFSTR("com.apple.FileSystemInfo.MetaDataExtents"), Mutable);
        }
        if (byte_1000146F4 == 1)
        {
          if (!sub_10000A4B0(3))
          {
            v92 = __PAIR64__(xmmword_10001447C, DWORD1(xmmword_10001447C));
            v91 = HIDWORD(xmmword_10001447C);
            v5 = CFDictionaryCreateMutable(kCFAllocatorDefault, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            sub_10000A530(v5, CFSTR("PercentFreeExtents"), (char *)&v92 + 4, kCFNumberIntType);
            sub_10000A530(v5, CFSTR("PercentFreeCatalog"), &v92, kCFNumberIntType);
            sub_10000A530(v5, CFSTR("PercentFreeAttributes"), &v91, kCFNumberIntType);
            CFDictionarySetValue(a1, CFSTR("com.apple.FileSystemInfo.MetaDataPercentFree"), v5);
          }
          if (byte_1000146F4 == 1)
          {
            if (!sub_10000A4B0(11))
            {
              v6 = &bucket;
              LODWORD(bucket) = sub_10000A43C(xmmword_10001447C, 2u);
              DWORD1(bucket) = sub_10000A43C(DWORD1(xmmword_10001447C), 2u);
              DWORD2(bucket) = sub_10000A43C(DWORD2(xmmword_10001447C), 2u);
              HIDWORD(bucket) = sub_10000A43C(HIDWORD(xmmword_10001447C), 2u);
              LODWORD(xmmword_100014588) = sub_10000A43C(dword_10001448C, 2u);
              DWORD1(xmmword_100014588) = sub_10000A43C(dword_100014490, 2u);
              v7 = CFDictionaryCreateMutable(kCFAllocatorDefault, 6, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              v8 = -6;
              do
              {
                snprintf(keyName, 0xFFuLL, "FilesClass%d", v8 + 7);
                sub_10000B5D0(v7, v6);
                v6 = (__int128 *)((char *)v6 + 4);
                v9 = __CFADD__(v8++, 1);
              }
              while (!v9);
              CFDictionarySetValue(a1, CFSTR("com.apple.FileSystemInfo.FilesClass"), v7);
            }
            if (byte_1000146F4 == 1)
            {
              if (!sub_10000A4B0(4))
              {
                v10 = 0;
                xmmword_1000145A8 = 0u;
                unk_1000145B8 = 0u;
                xmmword_100014588 = 0u;
                *(_OWORD *)&dword_100014598 = 0u;
                bucket = 0u;
                do
                {
                  if (v10 >= 5)
                    v11 = 5;
                  else
                    v11 = v10;
                  *((_DWORD *)&bucket + v11) += fsinfo[v10++ + 2];
                }
                while (v10 != 42);
                v12 = CFDictionaryCreateMutable(kCFAllocatorDefault, 6, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                v13 = &bucket;
                v14 = -6;
                do
                {
                  snprintf(keyName, 0xFFuLL, "ExtentsCount%d", v14 + 7);
                  sub_10000B5D0(v12, v13);
                  v13 = (__int128 *)((char *)v13 + 4);
                  v9 = __CFADD__(v14++, 1);
                }
                while (!v9);
                CFDictionarySetValue(a1, CFSTR("com.apple.FileSystemInfo.ExtentsCount"), v12);
              }
              if (byte_1000146F4 == 1)
              {
                if (!sub_10000A4B0(8))
                {
                  v15 = 0;
                  xmmword_1000145A8 = 0u;
                  unk_1000145B8 = 0u;
                  xmmword_100014588 = 0u;
                  *(_OWORD *)&dword_100014598 = 0u;
                  bucket = 0u;
                  do
                  {
                    v16 = v15 >> 1;
                    if (v15 >= 0xC)
                      v16 = 5;
                    *((_DWORD *)&bucket + v16) += fsinfo[v15++ + 2];
                  }
                  while (v15 != 51);
                  v17 = CFDictionaryCreateMutable(kCFAllocatorDefault, 6, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                  v18 = &bucket;
                  v19 = -6;
                  do
                  {
                    snprintf(keyName, 0xFFuLL, "NameSize%d", v19 + 7);
                    sub_10000B5D0(v17, v18);
                    v18 = (__int128 *)((char *)v18 + 4);
                    v9 = __CFADD__(v19++, 1);
                  }
                  while (!v9);
                  CFDictionarySetValue(a1, CFSTR("com.apple.FileSystemInfo.NameSize"), v17);
                }
                if (byte_1000146F4 == 1)
                {
                  if (!sub_10000A4B0(9))
                  {
                    v20 = 0;
                    xmmword_1000145A8 = 0u;
                    unk_1000145B8 = 0u;
                    xmmword_100014588 = 0u;
                    *(_OWORD *)&dword_100014598 = 0u;
                    bucket = 0u;
                    do
                    {
                      if (v20 >= 8)
                        v21 = 8;
                      else
                        v21 = v20;
                      *((_DWORD *)&bucket + v21) += fsinfo[v20++ + 2];
                    }
                    while (v20 != 42);
                    v22 = CFDictionaryCreateMutable(kCFAllocatorDefault, 9, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                    v23 = &bucket;
                    v24 = -9;
                    do
                    {
                      snprintf(keyName, 0xFFuLL, "XattrSize%d", v24 + 10);
                      sub_10000B5D0(v22, v23);
                      v23 = (__int128 *)((char *)v23 + 4);
                      v9 = __CFADD__(v24++, 1);
                    }
                    while (!v9);
                    CFDictionarySetValue(a1, CFSTR("com.apple.FileSystemInfo.XattrSize"), v22);
                  }
                  if (byte_1000146F4 == 1)
                  {
                    if (!sub_10000A4B0(12))
                    {
                      v25 = 0;
                      v26 = 0;
                      v27 = 0;
                      v28 = 0;
                      v29 = 0;
                      v30 = 0;
                      xmmword_1000145A8 = 0u;
                      unk_1000145B8 = 0u;
                      xmmword_100014588 = 0u;
                      *(_OWORD *)&dword_100014598 = 0u;
                      bucket = 0u;
                      do
                      {
                        if (v25 > 3)
                        {
                          if (v25 == 4)
                          {
                            v29 += dword_10001448C;
                            DWORD1(bucket) = v29;
                          }
                          else if (v25 > 5)
                          {
                            if (v25 == 6)
                            {
                              v27 += dword_100014494;
                              HIDWORD(bucket) = v27;
                            }
                            else
                            {
                              v26 += fsinfo[v25 + 2];
                              LODWORD(xmmword_100014588) = v26;
                            }
                          }
                          else
                          {
                            v28 += dword_100014490;
                            DWORD2(bucket) = v28;
                          }
                        }
                        else
                        {
                          v30 += fsinfo[v25 + 2];
                          LODWORD(bucket) = v30;
                        }
                        ++v25;
                      }
                      while (v25 != 42);
                      v31 = CFDictionaryCreateMutable(kCFAllocatorDefault, 5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                      v32 = &bucket;
                      v33 = -5;
                      do
                      {
                        snprintf(keyName, 0xFFuLL, "SymLinkSize%d", v33 + 6);
                        sub_10000B5D0(v31, v32);
                        v32 = (__int128 *)((char *)v32 + 4);
                        v9 = __CFADD__(v33++, 1);
                      }
                      while (!v9);
                      CFDictionarySetValue(a1, CFSTR("com.apple.FileSystemInfo.SymLinkSize"), v31);
                    }
                    if (byte_1000146F4 == 1)
                    {
                      if (!sub_10000A4B0(7))
                      {
                        v34 = 0;
                        xmmword_1000145A8 = 0u;
                        unk_1000145B8 = 0u;
                        xmmword_100014588 = 0u;
                        *(_OWORD *)&dword_100014598 = 0u;
                        bucket = 0u;
                        do
                        {
                          if (v34 >= 9)
                            v35 = 9;
                          else
                            v35 = v34;
                          *((_DWORD *)&bucket + v35) += fsinfo[v34++ + 2];
                        }
                        while (v34 != 42);
                        v36 = CFDictionaryCreateMutable(kCFAllocatorDefault, 10, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                        v37 = &bucket;
                        v38 = -10;
                        do
                        {
                          snprintf(keyName, 0xFFuLL, "Valence%d", v38 + 11);
                          sub_10000B5D0(v36, v37);
                          CFDictionarySetValue(a1, CFSTR("com.apple.FileSystemInfo.Valence"), v36);
                          v37 = (__int128 *)((char *)v37 + 4);
                          v9 = __CFADD__(v38++, 1);
                        }
                        while (!v9);
                      }
                      if (byte_1000146F4 == 1)
                      {
                        if (!sub_10000A4B0(5))
                        {
                          v39 = 0;
                          v40 = 0;
                          v41 = 0;
                          v42 = 0;
                          v43 = 0;
                          v44 = 0;
                          v45 = 0;
                          xmmword_1000145A8 = 0u;
                          unk_1000145B8 = 0u;
                          xmmword_100014588 = 0u;
                          *(_OWORD *)&dword_100014598 = 0u;
                          bucket = 0u;
                          do
                          {
                            v46 = &fsinfo[v39];
                            if (v39 > 0xC)
                            {
                              if (v39 > 0xE)
                              {
                                if (v39 > 0x11)
                                {
                                  if (v39 > 0x14)
                                  {
                                    v47 = v46[2];
                                    if (v39 > 0x1C)
                                    {
                                      v40 += v47;
                                      DWORD1(xmmword_100014588) = v40;
                                    }
                                    else
                                    {
                                      v41 += v47;
                                      LODWORD(xmmword_100014588) = v41;
                                    }
                                  }
                                  else
                                  {
                                    v42 += v46[2];
                                    HIDWORD(bucket) = v42;
                                  }
                                }
                                else
                                {
                                  v43 += v46[2];
                                  DWORD2(bucket) = v43;
                                }
                              }
                              else
                              {
                                v44 += v46[2];
                                DWORD1(bucket) = v44;
                              }
                            }
                            else
                            {
                              v45 += v46[2];
                              LODWORD(bucket) = v45;
                            }
                            ++v39;
                          }
                          while (v39 != 42);
                          v48 = CFDictionaryCreateMutable(kCFAllocatorDefault, 6, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                          v49 = &bucket;
                          v50 = -6;
                          do
                          {
                            snprintf(keyName, 0xFFuLL, "ExtentsSize%d", v50 + 7);
                            sub_10000B5D0(v48, v49);
                            v49 = (__int128 *)((char *)v49 + 4);
                            v9 = __CFADD__(v50++, 1);
                          }
                          while (!v9);
                          CFDictionarySetValue(a1, CFSTR("com.apple.FileSystemInfo.ExtentsSize"), v48);
                        }
                        if (byte_1000146F4 == 1)
                        {
                          v51 = sub_10000A4B0(6);
                          if (!v51)
                          {
                            v52 = 0;
                            v53 = 0;
                            v54 = 0;
                            v83 = 0;
                            v82 = 0;
                            v86 = 0;
                            v55 = 0;
                            v56 = 0;
                            v57 = 0;
                            v58 = 0;
                            v59 = 0;
                            v60 = 0;
                            v61 = 0;
                            xmmword_1000145A8 = 0u;
                            unk_1000145B8 = 0u;
                            xmmword_100014588 = 0u;
                            *(_OWORD *)&dword_100014598 = 0u;
                            bucket = 0u;
                            do
                            {
                              if ((_DWORD)v52 == 1)
                              {
                                v53 += DWORD1(xmmword_10001447C);
                                DWORD1(bucket) = v53;
                              }
                              else if ((_DWORD)v52)
                              {
                                if (v52 > 2)
                                {
                                  if (v52 > 4)
                                  {
                                    if (v52 == 5)
                                    {
                                      v59 += dword_100014490;
                                      LODWORD(xmmword_100014588) = v59;
                                    }
                                    else if (v52 > 6)
                                    {
                                      if (v52 == 7)
                                      {
                                        v57 += unk_100014498;
                                        DWORD2(xmmword_100014588) = v57;
                                      }
                                      else if (v52 > 8)
                                      {
                                        if (v52 == 9)
                                        {
                                          v56 += unk_1000144A0;
                                          dword_100014598 = v56;
                                        }
                                        else if (v52 > 0xA)
                                        {
                                          if (v52 == 11)
                                          {
                                            HIDWORD(v86) += dword_1000144A8;
                                            dword_1000145A0 = HIDWORD(v86);
                                          }
                                          else if (v52 > 0xC)
                                          {
                                            v62 = &fsinfo[v52];
                                            if (v52 > 0xF)
                                            {
                                              v63 = v62[2];
                                              if (v52 > 0x11)
                                              {
                                                LODWORD(v83) = v83 + v63;
                                                DWORD2(xmmword_1000145A8) = v83;
                                              }
                                              else
                                              {
                                                v82 += v63;
                                                DWORD1(xmmword_1000145A8) = v82;
                                              }
                                            }
                                            else
                                            {
                                              HIDWORD(v83) += v62[2];
                                              LODWORD(xmmword_1000145A8) = HIDWORD(v83);
                                            }
                                          }
                                          else
                                          {
                                            LODWORD(v86) = v86 + dword_1000144AC;
                                            dword_1000145A4 = v86;
                                          }
                                        }
                                        else
                                        {
                                          v55 += dword_1000144A4;
                                          dword_10001459C = v55;
                                        }
                                      }
                                      else
                                      {
                                        v51 += dword_10001449C;
                                        HIDWORD(xmmword_100014588) = v51;
                                      }
                                    }
                                    else
                                    {
                                      v58 += dword_100014494;
                                      DWORD1(xmmword_100014588) = v58;
                                    }
                                  }
                                  else
                                  {
                                    v60 += fsinfo[v52 + 2];
                                    HIDWORD(bucket) = v60;
                                  }
                                }
                                else
                                {
                                  v61 += DWORD2(xmmword_10001447C);
                                  DWORD2(bucket) = v61;
                                }
                              }
                              else
                              {
                                v54 += xmmword_10001447C;
                                LODWORD(bucket) = v54;
                              }
                              ++v52;
                            }
                            while (v52 != 42);
                            v64 = CFDictionaryCreateMutable(kCFAllocatorDefault, 15, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                            v65 = &bucket;
                            v66 = -15;
                            do
                            {
                              snprintf(keyName, 0xFFuLL, "FileSize%d", v66 + 16);
                              sub_10000B5D0(v64, v65);
                              v65 = (__int128 *)((char *)v65 + 4);
                              v9 = __CFADD__(v66++, 1);
                            }
                            while (!v9);
                            CFDictionarySetValue(a1, CFSTR("com.apple.FileSystemInfo.FileSize"), v64);
                          }
                          if (byte_1000146F4 == 1)
                          {
                            v67 = sub_10000A4B0(10);
                            if (!v67)
                            {
                              v68 = 0;
                              v69 = 0;
                              v70 = 0;
                              v84 = 0;
                              v85 = 0;
                              v87 = 0;
                              v88 = 0;
                              v71 = 0;
                              v72 = 0;
                              v73 = 0;
                              v74 = 0;
                              v75 = 0;
                              v76 = 0;
                              v77 = 0;
                              xmmword_1000145A8 = 0u;
                              unk_1000145B8 = 0u;
                              xmmword_100014588 = 0u;
                              *(_OWORD *)&dword_100014598 = 0u;
                              bucket = 0u;
                              do
                              {
                                if ((_DWORD)v68 == 1)
                                {
                                  v69 += DWORD1(xmmword_10001447C);
                                  DWORD1(bucket) = v69;
                                }
                                else if ((_DWORD)v68)
                                {
                                  if (v68 > 2)
                                  {
                                    if (v68 == 3)
                                    {
                                      v76 += HIDWORD(xmmword_10001447C);
                                      HIDWORD(bucket) = v76;
                                    }
                                    else if (v68 > 4)
                                    {
                                      if (v68 == 5)
                                      {
                                        v74 += dword_100014490;
                                        DWORD1(xmmword_100014588) = v74;
                                      }
                                      else if (v68 > 6)
                                      {
                                        if (v68 > 8)
                                        {
                                          if (v68 > 0xA)
                                          {
                                            if (v68 == 11)
                                            {
                                              v71 += dword_1000144A8;
                                              dword_10001459C = v71;
                                            }
                                            else if (v68 > 0xD)
                                            {
                                              if (v68 > 0xF)
                                              {
                                                if (v68 == 16)
                                                {
                                                  LODWORD(v87) = v87 + dword_1000144BC;
                                                  LODWORD(xmmword_1000145A8) = v87;
                                                }
                                                else
                                                {
                                                  v78 = fsinfo[v68 + 2];
                                                  if (v68 > 0x12)
                                                  {
                                                    v85 += v78;
                                                    DWORD2(xmmword_1000145A8) = v85;
                                                  }
                                                  else
                                                  {
                                                    v84 += v78;
                                                    DWORD1(xmmword_1000145A8) = v84;
                                                  }
                                                }
                                              }
                                              else
                                              {
                                                HIDWORD(v87) += fsinfo[v68 + 2];
                                                dword_1000145A4 = HIDWORD(v87);
                                              }
                                            }
                                            else
                                            {
                                              v88 += fsinfo[v68 + 2];
                                              dword_1000145A0 = v88;
                                            }
                                          }
                                          else
                                          {
                                            v72 += fsinfo[v68 + 2];
                                            dword_100014598 = v72;
                                          }
                                        }
                                        else
                                        {
                                          v67 += fsinfo[v68 + 2];
                                          HIDWORD(xmmword_100014588) = v67;
                                        }
                                      }
                                      else
                                      {
                                        v73 += dword_100014494;
                                        DWORD2(xmmword_100014588) = v73;
                                      }
                                    }
                                    else
                                    {
                                      v75 += dword_10001448C;
                                      LODWORD(xmmword_100014588) = v75;
                                    }
                                  }
                                  else
                                  {
                                    v77 += DWORD2(xmmword_10001447C);
                                    DWORD2(bucket) = v77;
                                  }
                                }
                                else
                                {
                                  v70 += xmmword_10001447C;
                                  LODWORD(bucket) = v70;
                                }
                                ++v68;
                              }
                              while (v68 != 42);
                              v79 = CFDictionaryCreateMutable(kCFAllocatorDefault, 15, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                              v80 = &bucket;
                              v81 = -15;
                              do
                              {
                                snprintf(keyName, 0xFFuLL, "FreeExtentSize%d", v81 + 16);
                                sub_10000B5D0(v79, v80);
                                v80 = (__int128 *)((char *)v80 + 4);
                                v9 = __CFADD__(v81++, 1);
                              }
                              while (!v9);
                              CFDictionarySetValue(a1, CFSTR("com.apple.FileSystemInfo.FreeExtentSize"), v79);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      notify_cancel(dword_1000146F0);
      dispatch_release(object);
      pthread_exit(0);
    }
  }
  return 0;
}

void sub_10000B5A0()
{
  unsigned int v0;

  v0 = pthread_self();
  syslog(5, "SIGUSR1 received by TID(%u)\n", v0);
}

void sub_10000B5D0(__CFDictionary *a1, const void *a2)
{
  CFStringRef v4;
  CFStringRef v5;

  v4 = CFStringCreateWithCString(kCFAllocatorDefault, keyName, 0x8000100u);
  if (v4)
  {
    v5 = v4;
    sub_10000A530(a1, v4, a2, kCFNumberIntType);
    CFRelease(v5);
  }
}

void sub_10000B648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004494();
  if (sub_1000044A0())
  {
    sub_1000044AC();
    sub_100004474((void *)&_mh_execute_header, v0, v1, "IOCS: failed to set context for inbound notifications on the mach port. Error = %d", v2, v3, v4, v5, v6);
  }
  sub_100004488();
}

void sub_10000B6C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004494();
  if (sub_1000044A0())
  {
    sub_1000044AC();
    sub_100004474((void *)&_mh_execute_header, v0, v1, "IOCS: failed to bind host special port. Error = %d", v2, v3, v4, v5, v6);
  }
  sub_100004488();
}

void sub_10000B748()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004494();
  if (sub_1000044A0())
  {
    sub_1000044AC();
    sub_100004474((void *)&_mh_execute_header, v0, v1, "IOCS: failed to insert send right. Error = %d", v2, v3, v4, v5, v6);
  }
  sub_100004488();
}

void sub_10000B7C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004494();
  if (sub_1000044A0())
  {
    sub_1000044AC();
    sub_100004474((void *)&_mh_execute_header, v0, v1, "IOCS: failed to allocate a mach port. Error = %d", v2, v3, v4, v5, v6);
  }
  sub_100004488();
}

void sub_10000B848()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A8();
  sub_100006058((void *)&_mh_execute_header, v0, v1, "IOCS: Sucessfully opened IOCSdb", v2, v3, v4, v5, v6);
  sub_100006088();
}

void sub_10000B874(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;

  v3 = *a1;
  v4[0] = 67109378;
  v4[1] = a2;
  v5 = 2080;
  v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "IOCS: Failed to enable WAL for IOCSdb - %d %s\n", (uint8_t *)v4, 0x12u);
}

void sub_10000B8FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A8();
  sub_100006058((void *)&_mh_execute_header, v0, v1, "IOCS: Failed to DELETE", v2, v3, v4, v5, v6);
  sub_100006088();
}

void sub_10000B928(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100006068((void *)&_mh_execute_header, a3, (uint64_t)a3, "IOCSdb: error reading bufferSizeCompressionDist\n", a1);
}

void sub_10000B95C(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100006068((void *)&_mh_execute_header, a3, (uint64_t)a3, "IOCSdb: error reading blockCompressedSizeDist\n", a1);
}

void sub_10000B990()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A8();
  sub_100006058((void *)&_mh_execute_header, v0, v1, "IOCS: SQL Create table failed.\n", v2, v3, v4, v5, v6);
  sub_100006088();
}

void sub_10000B9BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A8();
  sub_100006058((void *)&_mh_execute_header, v0, v1, "IOCS: SQL Database open failed.\n", v2, v3, v4, v5, v6);
  sub_100006088();
}

void sub_10000B9E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A8();
  sub_100006058((void *)&_mh_execute_header, v0, v1, "IOCS: fileExtension malloc failed", v2, v3, v4, v5, v6);
  sub_100006088();
}

void sub_10000BA14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sqlite3_errmsg((sqlite3 *)qword_1000146E0);
  sub_100006090();
  sub_100006074((void *)&_mh_execute_header, v0, v1, "IOCS: SQL table failed to read: %d %s\n", v2, v3, v4, v5, v6);
  sub_1000060B4();
}

void sub_10000BA8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A8();
  sub_100006058((void *)&_mh_execute_header, v0, v1, "IOCS: Unable to read vfs.io_compression_stats_enable\n", v2, v3, v4, v5, v6);
  sub_100006088();
}

void sub_10000BAB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A8();
  sub_100006058((void *)&_mh_execute_header, v0, v1, "IOCS: com.apple.da IOCompressionStats not available\n", v2, v3, v4, v5, v6);
  sub_100006088();
}

void sub_10000BAE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000060A8();
  sub_100006058((void *)&_mh_execute_header, v0, v1, "IOCS: Failed to enabled IOCS collection\n", v2, v3, v4, v5, v6);
  sub_100006088();
}

void sub_10000BB10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sqlite3_errmsg((sqlite3 *)qword_1000146E0);
  sub_100006090();
  sub_100006074((void *)&_mh_execute_header, v0, v1, "IOCS: table insert failure: %d %s\n", v2, v3, v4, v5, v6);
  sub_1000060B4();
}

void sub_10000BB88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sqlite3_errmsg((sqlite3 *)qword_1000146E0);
  sub_100006090();
  sub_100006074((void *)&_mh_execute_header, v0, v1, "IOCS: SQL table Insert failure: %d %s\n", v2, v3, v4, v5, v6);
  sub_1000060B4();
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__cfBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cfBundle");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationForDefaultMainDisplayMonitor");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataContainerURL");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elements");
}

id objc_msgSend_enumerateBundlesOfType_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateBundlesOfType:block:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:relativeToURL:");
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupContainerURLs");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizations");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByStandardizingPath");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}
