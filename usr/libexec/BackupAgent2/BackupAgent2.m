void sub_100004444(int a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  int v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "processName"));

  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BackupAgent2"));
  if ((_DWORD)v4)
    v4 = sub_100004520();
  if (a1)
  {
    v6 = MBGetDefaultLog(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v9 = a1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MBExit(%d)", buf, 8u);
      _MBLog(CFSTR("DEFAULT"), "MBExit(%d)", a1);
    }

  }
  _MBLogFlushDeprecated(v4);
  exit(a1);
}

id sub_100004520()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v0 = MBRemoveTemporaryDirectory();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = MBFinderSnapshotMountPoints(v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        +[MBFileSystemManager unmount:error:](MBFileSystemManager, "unmount:error:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), 0);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return +[MBPersona removeBackupSnapshotsForPersonalPersona](MBPersona, "removeBackupSnapshotsForPersonalPersona");
}

uint64_t sub_100005130(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  int v12;
  char v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  void *Data;
  uint64_t result;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v9 = v5++ >= 9;
      if (v9)
      {
        LODWORD(v6) = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      LODWORD(v6) = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    v12 = (unsigned __int16)(v6 >> 3);
    if (v12 == 2)
    {
      Data = (void *)PBReaderReadData(a2);

      *(_QWORD *)(a1 + 8) = Data;
    }
    else if (v12 == 1)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_BYTE *)(a1 + 20) |= 1u;
      while (1)
      {
        v16 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 == -1 || v16 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          break;
        v17 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
        *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
        v15 |= (unint64_t)(v17 & 0x7F) << v13;
        if ((v17 & 0x80) == 0)
          goto LABEL_30;
        v13 += 7;
        v9 = v14++ >= 9;
        if (v9)
        {
          LODWORD(v15) = 0;
          goto LABEL_32;
        }
      }
      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
        LODWORD(v15) = 0;
LABEL_32:
      *(_DWORD *)(a1 + 16) = v15;
    }
    else
    {
      result = PBReaderSkipValueWithTag(a2, (unsigned __int16)(v6 >> 3));
      if (!(_DWORD)result)
        return result;
    }
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100005628(void *a1)
{
  NSObject *v2;

  if (qword_1000F9DC8 != -1)
    dispatch_once(&qword_1000F9DC8, &stru_1000D9280);
  v2 = qword_1000F9DC0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)qword_1000F9DC0);
  dispatch_sync(v2, a1);
}

id sub_100005684(uint64_t a1)
{
  id v2;
  _QWORD v4[6];

  v2 = objc_msgSend(+[MBSCachePool sharedPool](MBSCachePool, "sharedPool"), "acquireCache");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005708;
  v4[3] = &unk_1000D91A8;
  v4[4] = v2;
  v4[5] = a1;
  sub_100005628(v4);
  return objc_msgSend(+[MBSCachePool sharedPool](MBSCachePool, "sharedPool"), "releaseCache:", v2);
}

id sub_100005708(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "begin");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "end");
}

void sub_10000577C(id a1)
{
  qword_1000F9DB0 = objc_alloc_init(MBSCachePool);
}

void sub_100005970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005990(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_1000059A0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t sub_1000059AC(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t result;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndexedSubscript:", 0);
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectAtIndex:", 0);
    v5 = MBGetDefaultLog(v3, v4);
    result = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if ((_DWORD)result)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 134217984;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Re-using cache from pool: %p", buf, 0xCu);
      return _MBLog(CFSTR("DEBUG"), "Re-using cache from pool: %p");
    }
  }
  else
  {
    v8 = MBGetDefaultLog(0, v2);
    result = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if ((_DWORD)result)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Cache pool is empty", buf, 2u);
      return _MBLog(CFSTR("DEBUG"), "Cache pool is empty");
    }
  }
  return result;
}

id sub_100005B5C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  v4 = MBGetDefaultLog(v2, v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if ((unint64_t)v2 > 7)
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Not adding to cache because pool is full: %p", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), "Not adding to cache because pool is full: %p", *(const void **)(a1 + 40));
    }
    return objc_msgSend(*(id *)(a1 + 32), "_closeCache:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Adding cache to pool: %p", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), "Adding cache to pool: %p", *(const void **)(a1 + 40));
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));

    return objc_msgSend(*(id *)(a1 + 32), "_scheduleDrain");
  }
}

id sub_100005E00(uint64_t a1)
{
  MBAppManager *v2;
  id v3;
  id v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "open");
  v2 = +[MBAppManager appManagerWithSettingsContext:](MBAppManager, "appManagerWithSettingsContext:", objc_alloc_init(MBSettingsContext));
  v6 = 0;
  v3 = +[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", &v6);
  if (!v3)
    sub_100087518();
  if ((-[MBAppManager loadAppsWithPersona:safeHarbors:dataSeparatedBundleIDs:error:](v2, "loadAppsWithPersona:safeHarbors:dataSeparatedBundleIDs:error:", v3, 0, 0, &v6) & 1) == 0)
  {
    v5 = objc_alloc((Class)MBException);
    objc_exception_throw(objc_msgSend(v5, "initWithCode:format:", 1, CFSTR("Error loading apps: %@"), +[MBError descriptionForError:](MBError, "descriptionForError:", v6)));
  }
  return objc_msgSend(*(id *)(a1 + 32), "setDisabledDomainNames:restrictedDomainNames:", -[MBAppManager allDisabledDomainNames](v2, "allDisabledDomainNames"), -[MBAppManager allRestrictedDomainNames](v2, "allRestrictedDomainNames"));
}

id sub_10000610C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drain");
}

void sub_100006270(id a1)
{
  NSObject *v1;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qword_1000F9DC0 = (uint64_t)dispatch_queue_create("com.apple.backupd.MBSCachePool", v1);
}

void sub_100006448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000647C(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_10000648C(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

intptr_t sub_100006498(uint64_t a1, void *a2, void *a3, void *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000066D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_100006708(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id sub_100006734(_QWORD *a1, void *a2)
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v8;
  uint8_t v9[16];

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "length");
  v5 = objc_msgSend(a2, "length");
  if (((unint64_t)v4 + (unint64_t)v5) >> 20 <= 4)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "appendData:", a2);
  v8 = MBGetDefaultLog(v5, v6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Response from the server is too large. Bailing.", v9, 2u);
    _MBLog(CFSTR("ERROR"), "Response from the server is too large. Bailing.");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "cancel");
  +[MBError errorWithDomain:code:format:](MBError, "errorWithDomain:code:format:", NSURLErrorDomain, -1103, CFSTR("Response body too large"));
  return (id)(*(uint64_t (**)(void))(a1[4] + 16))();
}

uint64_t sub_100006850(_QWORD *a1)
{

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = 0;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = 0;
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

uint64_t sub_1000068BC(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, id, id, _QWORD))(a1[4] + 16))(a1[4], *(id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(*(_QWORD *)(a1[6] + 8) + 40), 0);
}

uint64_t sub_100006D80(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    v2 = result;
    objc_msgSend(*(id *)(v1 + 16), "cancel");
    +[MBError errorWithDomain:code:format:](MBError, "errorWithDomain:code:format:", NSURLErrorDomain, -999, CFSTR("Request cancelled"));
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 64) + 16))();
  }
  return result;
}

NSString *sub_10000741C()
{
  uint64_t v0;
  uint64_t v1;

  v0 = MBProductVersion();
  v1 = MBBuildVersion();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@ (%@; %@)"),
           CFSTR("MobileBackup"),
           v0,
           v1,
           MBProductType());
}

NSURL *sub_10000792C()
{
  const __CFString *v0;
  const __CFString *v1;
  NSURL *v2;

  v0 = (id)CFPreferencesCopyValue(CFSTR("ConfigurationURL"), CFSTR("com.apple.MobileBackup"), kMBMobileUserName, kCFPreferencesAnyHost);
  if (v0)
    v1 = v0;
  else
    v1 = CFSTR("https://configuration.apple.com/configurations/internetservices/mobileme/mobilebackup/mobilebackup-1.0.plist");
  v2 = +[NSURL URLWithString:](NSURL, "URLWithString:", v1);
  if (!v2)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSURL *MBServiceConfigurationURL(void)"), CFSTR("MBServiceConfiguration.m"), 22, CFSTR("Invalid configuration URL: %@"), v1);
  return v2;
}

void sub_100008E54(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_100008E9C(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x100008DFCLL);
  }
  JUMPOUT(0x100008E88);
}

void sub_100009248(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009378(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000096B4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100009718(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000976C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A7A0(uint64_t a1, uint64_t a2)
{
  char **v4;
  char v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  char v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  unint64_t v25;
  char v26;
  uint64_t result;
  char **v28;
  MBSSnapshotAttributes *v29;
  char v30;
  unsigned int v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  _QWORD v35[2];

  if (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
    return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  v4 = &selRef_initWithDecoder_;
  while (2)
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v9 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0)
        goto LABEL_12;
      v5 += 7;
      v10 = v6++ >= 9;
      if (v10)
      {
        LODWORD(v7) = 0;
        v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
    v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      LODWORD(v7) = 0;
LABEL_14:
    if (v11 || (v7 & 7) == 4)
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    switch((unsigned __int16)(v7 >> 3))
    {
      case 1u:
        v13 = 0;
        v14 = 0;
        v15 = 0;
        *(_BYTE *)(a1 + *((int *)v4 + 840)) |= 8u;
        while (1)
        {
          v16 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
            break;
          v17 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0)
            goto LABEL_53;
          v13 += 7;
          v10 = v14++ >= 9;
          if (v10)
          {
            LODWORD(v15) = 0;
            goto LABEL_55;
          }
        }
        *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_53:
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v15) = 0;
LABEL_55:
        *(_DWORD *)(a1 + 40) = v15;
        goto LABEL_69;
      case 2u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + *((int *)v4 + 840)) |= 4u;
        while (2)
        {
          v21 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              v10 = v19++ >= 9;
              if (v10)
              {
                v20 = 0;
                goto LABEL_59;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
          v20 = 0;
LABEL_59:
        v34 = 24;
        goto LABEL_68;
      case 3u:
        v23 = 0;
        v24 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + *((int *)v4 + 840)) |= 2u;
        while (2)
        {
          v25 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
            v20 |= (unint64_t)(v26 & 0x7F) << v23;
            if (v26 < 0)
            {
              v23 += 7;
              v10 = v24++ >= 9;
              if (v10)
              {
                v20 = 0;
                goto LABEL_63;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
          v20 = 0;
LABEL_63:
        v34 = 16;
        goto LABEL_68;
      case 5u:
        v28 = v4;
        v29 = objc_alloc_init(MBSSnapshotAttributes);

        *(_QWORD *)(a1 + 32) = v29;
        v35[0] = 0;
        v35[1] = 0;
        if (PBReaderPlaceMark(a2, v35) && (sub_10000B698((uint64_t)v29, a2) & 1) != 0)
        {
          PBReaderRecallMark(a2, v35);
          v4 = v28;
LABEL_69:
          if (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
            return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          continue;
        }
        return 0;
      case 6u:
        v30 = 0;
        v31 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + *((int *)v4 + 840)) |= 1u;
        while (2)
        {
          v32 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v32 == -1 || v32 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v32);
            *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v32 + 1;
            v20 |= (unint64_t)(v33 & 0x7F) << v30;
            if (v33 < 0)
            {
              v30 += 7;
              v10 = v31++ >= 9;
              if (v10)
              {
                v20 = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
          v20 = 0;
LABEL_67:
        v34 = 8;
LABEL_68:
        *(_QWORD *)(a1 + v34) = v20;
        goto LABEL_69;
      default:
        result = PBReaderSkipValueWithTag(a2, (unsigned __int16)(v7 >> 3));
        if (!(_DWORD)result)
          return result;
        goto LABEL_69;
    }
  }
}

uint64_t sub_10000B698(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  void *String;
  id v13;
  uint64_t v14;
  uint64_t result;
  void *v16;
  void *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  void *Data;
  char v24;
  unsigned int v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  unint64_t v30;
  char v31;
  uint64_t v32;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v9 = v5++ >= 9;
      if (v9)
      {
        LODWORD(v6) = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      LODWORD(v6) = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    switch((unsigned __int16)(v6 >> 3))
    {
      case 1u:
        String = (void *)PBReaderReadString(a2);

        v13 = String;
        v14 = 24;
        goto LABEL_31;
      case 2u:
        v16 = (void *)PBReaderReadString(a2);

        v13 = v16;
        v14 = 48;
        goto LABEL_31;
      case 3u:
        v17 = (void *)PBReaderReadString(a2);

        v13 = v17;
        v14 = 16;
        goto LABEL_31;
      case 4u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 56) |= 4u;
        while (2)
        {
          v21 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              v9 = v19++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v20) = 0;
LABEL_49:
        v32 = 32;
        goto LABEL_58;
      case 5u:
        Data = (void *)PBReaderReadData(a2);

        v13 = Data;
        v14 = 40;
LABEL_31:
        *(_QWORD *)(a1 + v14) = v13;
        continue;
      case 6u:
        v24 = 0;
        v25 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 56) |= 1u;
        while (2)
        {
          v26 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v26 == -1 || v26 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
            v20 |= (unint64_t)(v27 & 0x7F) << v24;
            if (v27 < 0)
            {
              v24 += 7;
              v9 = v25++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v20) = 0;
LABEL_53:
        v32 = 8;
        goto LABEL_58;
      case 7u:
        v28 = 0;
        v29 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 56) |= 2u;
        break;
      default:
        result = PBReaderSkipValueWithTag(a2, (unsigned __int16)(v6 >> 3));
        if (!(_DWORD)result)
          return result;
        continue;
    }
    while (1)
    {
      v30 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v30 == -1 || v30 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v31 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v30);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v30 + 1;
      v20 |= (unint64_t)(v31 & 0x7F) << v28;
      if ((v31 & 0x80) == 0)
        goto LABEL_55;
      v28 += 7;
      v9 = v29++ >= 9;
      if (v9)
      {
        LODWORD(v20) = 0;
        goto LABEL_57;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_55:
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      LODWORD(v20) = 0;
LABEL_57:
    v32 = 12;
LABEL_58:
    *(_DWORD *)(a1 + v32) = v20;
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_10000C48C(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  int v10;
  int *v12;
  void *String;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      if (v5++ >= 9)
      {
        v6 = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    if ((unsigned __int16)((v6 >> 3) - 1) >= 7u)
    {
      if ((PBReaderSkipValueWithTag(a2, (unsigned __int16)(v6 >> 3)) & 1) == 0)
        return 0;
    }
    else
    {
      v12 = (&off_1000D93E0)[(__int16)((v6 >> 3) - 1)];
      String = (void *)PBReaderReadString(a2);

      *(_QWORD *)(a1 + *v12) = String;
    }
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000CC88(const char *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  _QWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  uint8_t v61[4];
  _BYTE v62[18];
  _BYTE buf[24];
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;

  v2 = malloc_type_malloc(0x10uLL, 0x85514AE9uLL);
  if (!v2)
    sub_1000875B8();
  v3 = v2;
  *v2 = 0;
  v2[1] = 0;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v34 = 0;
  v33 = xmmword_10009D170;
  v35 = v2;
  v36 = 0x10uLL;
  if (fsctl(a1, 0xC1B04A1EuLL, &v33, 0))
  {
    free(v3);
    v6 = MBGetDefaultLog(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) failed: %{errno}d", buf, 8u);
      v31 = *__error();
      _MBLog(CFSTR("DEFAULT"), "=diag= fsctl(APFSIOC_DEBUG_STATS) failed: %{errno}d", v31);
    }
LABEL_5:

    return;
  }
  if (!(_QWORD)v37)
  {
    free(v3);
    v26 = MBGetDefaultLog(v24, v25);
    v7 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) returned zero buffer entries", buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "=diag= fsctl(APFSIOC_DEBUG_STATS) returned zero buffer entries");
    }
    goto LABEL_5;
  }
  v9 = (char *)malloc_type_malloc(0x4E200uLL, 0x81E2D296uLL);
  if (v9)
  {
    v11 = v9;
    v12 = MBGetDefaultLog(v9, v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *v3;
      v15 = v3[1];
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=diag= Dstream id %llu, dstream size %llu bytes\n", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "=diag= Dstream id %llu, dstream size %llu bytes\n", *v3, v3[1]);
    }

    for (i = 0; ; i = *((_QWORD *)v19 - 7) + *((_QWORD *)v19 - 8))
    {
      bzero(v11, 0x4E200uLL);
      v91 = 0;
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v68 = 0u;
      *(_OWORD *)buf = xmmword_10009D180;
      *(_QWORD *)&buf[16] = 10;
      v64 = v11;
      v65 = 320000;
      v66 = i;
      v67 = *v3;
      v17 = fsctl(a1, 0xC1B04A1EuLL, buf, 0);
      if ((_DWORD)v17)
        break;
      if (!(_QWORD)v68)
      {
        v30 = MBGetDefaultLog(v17, v18);
        v28 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v61 = 134217984;
          *(_QWORD *)v62 = i;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) for FUSION_DEBUG_STATS_PURE_FEXTS_ONLY returned zero buffer entries at offset %lld", v61, 0xCu);
          _MBLog(CFSTR("DEFAULT"), "=diag= fsctl(APFSIOC_DEBUG_STATS) for FUSION_DEBUG_STATS_PURE_FEXTS_ONLY returned zero buffer entries at offset %lld");
        }
        goto LABEL_22;
      }
      v19 = &v11[64 * (_QWORD)v68];
      v20 = MBGetDefaultLog(v17, v18);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *((_QWORD *)v19 - 8);
        v23 = *((_QWORD *)v19 - 7);
        *(_DWORD *)v61 = 134218240;
        *(_QWORD *)v62 = v22;
        *(_WORD *)&v62[8] = 2048;
        *(_QWORD *)&v62[10] = v23;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=diag= Extent offset %lld and length %lld\n", v61, 0x16u);
        _MBLog(CFSTR("DEFAULT"), "=diag= Extent offset %lld and length %lld\n", *((_QWORD *)v19 - 8), *((_QWORD *)v19 - 7));
      }

    }
    v27 = MBGetDefaultLog(v17, v18);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *__error();
      *(_DWORD *)v61 = 67109376;
      *(_DWORD *)v62 = v29;
      *(_WORD *)&v62[4] = 2048;
      *(_QWORD *)&v62[6] = i;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) failed: %{errno}d, cannot get extents at offset %lld", v61, 0x12u);
      v32 = *__error();
      _MBLog(CFSTR("DEFAULT"), "=diag= fsctl(APFSIOC_DEBUG_STATS) failed: %{errno}d, cannot get extents at offset %lld", v32, i);
    }
LABEL_22:

    free(v11);
  }
  free(v3);
}

void sub_10000D140(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  __darwin_ino64_t st_ino;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  __darwin_ino64_t v54;
  NSObject *v55;
  uint64_t v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  int *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  int *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  uint64_t v72;
  DIR *v73;
  DIR *v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  NSObject *v84;
  uint64_t v85;
  int *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  NSObject *v101;
  NSObject *v102;
  ssize_t v103;
  uint64_t v104;
  __uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  int *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  NSObject *v113;
  int *v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  int *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  NSObject *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  NSObject *v132;
  int *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  NSObject *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  NSObject *v152;
  NSObject *v153;
  int32_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NSObject *v160;
  NSObject *v161;
  int *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  NSObject *v166;
  NSObject *v167;
  uint64_t v168;
  NSObject *v169;
  NSObject *v170;
  char *v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  int *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  NSObject *v179;
  NSObject *v180;
  uint64_t v181;
  NSObject *v182;
  NSObject *v183;
  int32_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  unsigned __int16 v188;
  char *v189;
  int v190;
  char *v191;
  uint64_t v192;
  uint64_t v193;
  NSObject *v194;
  NSObject *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  NSObject *v201;
  NSObject *v202;
  char *v203;
  int v204;
  int v205;
  int v206;
  ssize_t v207;
  uint64_t v208;
  uint64_t v209;
  NSObject *v210;
  NSObject *v211;
  id v212;
  uint64_t v213;
  NSObject *v214;
  __uint64_t d_ino;
  uint64_t v216;
  NSObject *v217;
  NSObject *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  int v234[2];
  int v235;
  int v236;
  uint64_t v237;
  uint64_t v238;
  int v239;
  uint64_t v240;
  char *v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  uint64_t v245;
  dirent *v246;
  fsid_t f_fsid;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  _DWORD v252[9];
  __int128 v253;
  uint64_t v254;
  stat v255;
  __int128 v256;
  __uint64_t v257;
  __int16 v258;
  int d_namlen;
  __int16 v260;
  int d_reclen;
  dirent v262;
  statfs buf;

  v1 = a1;
  v2 = geteuid();
  v4 = MBGetDefaultLog(v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138543618;
      *(_QWORD *)&buf.f_iosize = v1;
      WORD2(buf.f_blocks) = 1024;
      *(_DWORD *)((char *)&buf.f_blocks + 6) = v2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "=diag= Dumping diagnostics for %{public}@ (%d)", (uint8_t *)&buf, 0x12u);
    }

    _MBLog(CFSTR("DEFAULT"), "=diag= Dumping diagnostics for %{public}@ (%d)", v1, v2);
  }

  v7 = objc_retainAutorelease(v1);
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");

  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByDeletingLastPathComponent")));
  v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");

  if (!v7)
    goto LABEL_215;
  if (!v8)
  {
    v30 = MBGetDefaultLog(v13, v14);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "=diag= nil path FSR", (uint8_t *)&buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "=diag= nil path FSR", v219);
    }
    goto LABEL_214;
  }
  if (!v10)
  {
    v32 = MBGetDefaultLog(v13, v14);
    v31 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "=diag= nil name FSR", (uint8_t *)&buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "=diag= nil name FSR", v219);
    }
    goto LABEL_214;
  }
  if (!v12)
  {
    v33 = MBGetDefaultLog(v13, v14);
    v31 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "=diag= nil dir path FSR", (uint8_t *)&buf, 2u);
      _MBLog(CFSTR("DEFAULT"), "=diag= nil dir path FSR", v219);
    }
    goto LABEL_214;
  }
  v15 = access(v8, 4);
  if ((_DWORD)v15)
  {
    v17 = __error();
    v18 = *v17;
    v20 = MBGetDefaultLog(v17, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 67109120;
        buf.f_iosize = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "=diag= access(R_OK) failed: %{errno}d", (uint8_t *)&buf, 8u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= access(R_OK) failed: %{errno}d", v18);
    }

    v23 = access(v8, 0);
    if ((_DWORD)v23)
    {
      v25 = __error();
      v26 = *v25;
      v28 = MBGetDefaultLog(v25, v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v29;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 67109120;
          buf.f_iosize = v26;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "=diag= access(F_OK) failed: %{errno}d", (uint8_t *)&buf, 8u);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= access(F_OK) failed: %{errno}d", v26);
      }
    }
    else
    {
      v35 = MBGetDefaultLog(v23, v24);
      v29 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v29;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 67109120;
          buf.f_iosize = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "=diag= access(F_OK): %d", (uint8_t *)&buf, 8u);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= access(F_OK): %d");
      }
    }
  }
  else
  {
    v34 = MBGetDefaultLog(v15, v16);
    v29 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v29;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 67109120;
        buf.f_iosize = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "=diag= access(R_OK): %d", (uint8_t *)&buf, 8u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= access(R_OK): %d");
    }
  }

  memset(&v255, 0, sizeof(v255));
  v36 = stat(v8, &v255);
  if ((_DWORD)v36)
  {
    v38 = __error();
    v39 = *v38;
    v41 = MBGetDefaultLog(v38, v40);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v42;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 67109120;
        buf.f_iosize = v39;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "=diag= stat failed: %{errno}d", (uint8_t *)&buf, 8u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= stat failed: %{errno}d", v39);
    }
    st_ino = 0;
  }
  else
  {
    st_ino = v255.st_ino;
    v44 = MBGetDefaultLog(v36, v37);
    v42 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v42;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 67113472;
        buf.f_iosize = v255.st_dev;
        LOWORD(buf.f_blocks) = 2048;
        *(uint64_t *)((char *)&buf.f_blocks + 2) = v255.st_ino;
        WORD1(buf.f_bfree) = 1024;
        HIDWORD(buf.f_bfree) = v255.st_mode;
        LOWORD(buf.f_bavail) = 1024;
        *(_DWORD *)((char *)&buf.f_bavail + 2) = v255.st_nlink;
        HIWORD(buf.f_bavail) = 1024;
        LODWORD(buf.f_files) = v255.st_uid;
        WORD2(buf.f_files) = 1024;
        *(_DWORD *)((char *)&buf.f_files + 6) = v255.st_gid;
        WORD1(buf.f_ffree) = 1024;
        HIDWORD(buf.f_ffree) = v255.st_rdev;
        LOWORD(buf.f_fsid.val[0]) = 2048;
        *(fsid_t *)((char *)&buf.f_fsid + 2) = (fsid_t)v255.st_atimespec.tv_sec;
        HIWORD(buf.f_owner) = 2048;
        *(_QWORD *)&buf.f_type = v255.st_atimespec.tv_nsec;
        LOWORD(buf.f_fssubtype) = 2048;
        *(_QWORD *)((char *)&buf.f_fssubtype + 2) = v255.st_mtimespec.tv_sec;
        *(_WORD *)&buf.f_fstypename[6] = 2048;
        *(_QWORD *)&buf.f_fstypename[8] = v255.st_mtimespec.tv_nsec;
        *(_WORD *)buf.f_mntonname = 2048;
        *(_QWORD *)&buf.f_mntonname[2] = v255.st_ctimespec.tv_sec;
        *(_WORD *)&buf.f_mntonname[10] = 2048;
        *(_QWORD *)&buf.f_mntonname[12] = v255.st_ctimespec.tv_nsec;
        *(_WORD *)&buf.f_mntonname[20] = 2048;
        *(_QWORD *)&buf.f_mntonname[22] = v255.st_size;
        *(_WORD *)&buf.f_mntonname[30] = 2048;
        *(_QWORD *)&buf.f_mntonname[32] = v255.st_blocks << 9;
        *(_WORD *)&buf.f_mntonname[40] = 1024;
        *(_DWORD *)&buf.f_mntonname[42] = v255.st_blksize;
        *(_WORD *)&buf.f_mntonname[46] = 1024;
        *(_DWORD *)&buf.f_mntonname[48] = v255.st_flags;
        *(_WORD *)&buf.f_mntonname[52] = 1024;
        *(_DWORD *)&buf.f_mntonname[54] = v255.st_gen;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "=diag= stat: dev %d, ino %llu, mode 0%o, nlink %u, uid %u, gid %u, rdev %d, atime %lu.%ld, mtime %lu.%ld, ctime %lu.%ld, lgsize %lld, physize %lld, blksize %d, flags %u, gen %u", (uint8_t *)&buf, 0x92u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= stat: dev %d, ino %llu, mode 0%o, nlink %u, uid %u, gid %u, rdev %d, atime %lu.%ld, mtime %lu.%ld, ctime %lu.%ld, lgsize %lld, physize %lld, blksize %d, flags %u, gen %u", v255.st_dev, v255.st_ino, v255.st_mode, v255.st_nlink, v255.st_uid, v255.st_gid, v255.st_rdev, v255.st_atimespec.tv_sec, v255.st_atimespec.tv_nsec, v255.st_mtimespec.tv_sec, v255.st_mtimespec.tv_nsec, v255.st_ctimespec.tv_sec, v255.st_ctimespec.tv_nsec, v255.st_size, v255.st_blocks << 9, v255.st_blksize,
        v255.st_flags,
        v255.st_gen);
    }
  }

  v253 = xmmword_10009D1F8;
  v254 = 0x1800000403;
  memset(v252, 0, sizeof(v252));
  v250 = 0u;
  v251 = 0u;
  v249 = 0u;
  v248 = 0u;
  v45 = getattrlist(v8, &v253, &v248, 0x64uLL, 0x29u);
  v233 = v8;
  if ((_DWORD)v45)
  {
    v47 = __error();
    v48 = *v47;
    v50 = MBGetDefaultLog(v47, v49);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v51 = v51;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 67109120;
        buf.f_iosize = v48;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "=diag= getattrlist failed: %{errno}d", (uint8_t *)&buf, 8u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= getattrlist failed: %{errno}d", v48);
    }
  }
  else
  {
    if (!st_ino)
    {
      if ((BYTE7(v248) & 2) != 0)
        st_ino = *(_QWORD *)((char *)&v251 + 4);
      else
        st_ino = 0;
    }
    if (HIDWORD(v249) != 1)
    {
      v52 = MBGetDefaultLog(v45, v46);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = st_ino;
        v55 = v53;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.f_bsize) = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "=diag= warning: not a regular file, link info and sizes will be garbage", (uint8_t *)&buf, 2u);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= warning: not a regular file, link info and sizes will be garbage");
        st_ino = v54;
      }

    }
    v56 = MBGetDefaultLog(v45, v46);
    v51 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v51 = v51;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_iosize = v248;
        *(_DWORD *)((char *)&buf.f_blocks + 2) = (DWORD1(v248) >> 1) & 1;
        LODWORD(buf.f_bfree) = DWORD2(v249);
        *(_DWORD *)((char *)&buf.f_bfree + 6) = (DWORD1(v248) >> 3) & 1;
        HIDWORD(buf.f_bavail) = HIDWORD(v249);
        *(_DWORD *)((char *)&buf.f_files + 2) = (DWORD1(v248) >> 25) & 1;
        buf.f_ffree = *(_QWORD *)((char *)&v251 + 4);
        *(int32_t *)((char *)buf.f_fsid.val + 2) = (DWORD1(v248) >> 15) & 1;
        buf.f_owner = v250;
        *(uint32_t *)((char *)&buf.f_type + 2) = HIWORD(DWORD1(v248)) & 1;
        buf.f_fssubtype = DWORD1(v250);
        *(_DWORD *)&buf.f_fstypename[2] = (DWORD1(v248) >> 17) & 1;
        *(_DWORD *)&buf.f_fstypename[8] = DWORD2(v250);
        *(_DWORD *)&buf.f_fstypename[14] = (DWORD1(v248) >> 18) & 1;
        *(_DWORD *)&buf.f_mntonname[4] = HIDWORD(v250);
        *(_DWORD *)&buf.f_mntonname[10] = (DWORD1(v248) >> 19) & 1;
        *(_DWORD *)&buf.f_mntonname[16] = v251;
        *(_DWORD *)&buf.f_mntonname[22] = (DWORD1(v248) >> 30) & 1;
        *(_DWORD *)&buf.f_mntonname[28] = HIDWORD(v251);
        *(_DWORD *)&buf.f_mntonname[34] = v249 & 1;
        *(_DWORD *)&buf.f_mntonname[40] = v252[0];
        *(_DWORD *)&buf.f_mntonname[46] = (v249 >> 1) & 1;
        *(_QWORD *)&buf.f_mntonname[52] = *(_QWORD *)&v252[1];
        *(_DWORD *)&buf.f_mntonname[62] = (v249 >> 10) & 1;
        *(_QWORD *)&buf.f_mntonname[68] = *(_QWORD *)&v252[3];
        *(_DWORD *)&buf.f_mntonname[78] = (DWORD1(v249) >> 3) & 1;
        *(_QWORD *)&buf.f_mntonname[84] = *(_QWORD *)&v252[5];
        LOWORD(buf.f_blocks) = 1024;
        HIWORD(buf.f_blocks) = 1024;
        WORD2(buf.f_bfree) = 1024;
        WORD1(buf.f_bavail) = 1024;
        LOWORD(buf.f_files) = 1024;
        LOWORD(buf.f_fsid.val[0]) = 1024;
        HIWORD(buf.f_fsid.val[1]) = 1024;
        LOWORD(buf.f_type) = 1024;
        HIWORD(buf.f_flags) = 1024;
        *(_WORD *)buf.f_fstypename = 1024;
        *(_WORD *)&buf.f_fstypename[6] = 1024;
        *(_WORD *)&buf.f_fstypename[12] = 1024;
        *(_WORD *)&buf.f_mntonname[2] = 1024;
        *(_WORD *)&buf.f_mntonname[8] = 1024;
        *(_WORD *)&buf.f_mntonname[14] = 1024;
        *(_WORD *)&buf.f_mntonname[20] = 1024;
        *(_WORD *)&buf.f_mntonname[26] = 1024;
        *(_WORD *)&buf.f_mntonname[32] = 1024;
        *(_WORD *)&buf.f_mntonname[38] = 1024;
        *(_WORD *)&buf.f_mntonname[44] = 1024;
        *(_WORD *)&buf.f_mntonname[60] = 1024;
        *(_WORD *)&buf.f_mntonname[76] = 1024;
        *(_WORD *)&buf.f_mntonname[92] = 1024;
        *(_DWORD *)&buf.f_mntonname[94] = (DWORD1(v249) >> 4) & 1;
        HIWORD(buf.f_files) = 2048;
        *(_WORD *)&buf.f_mntonname[50] = 2048;
        *(_WORD *)&buf.f_mntonname[66] = 2048;
        *(_WORD *)&buf.f_mntonname[82] = 2048;
        *(_WORD *)&buf.f_mntonname[98] = 2048;
        *(_QWORD *)&buf.f_mntonname[100] = *(_QWORD *)&v252[7];
        buf.f_bsize = 67116288;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "=diag= getattrlist: len %u, dev (%d)%d, type (%d)%u, fileId (%d)%llu, uid (%d)%u, gid (%d)%u, access (%d)0%o, flags (%d)0x%x, gencount (%d)%u, protclass (%d)%u, nlink (%d)%u, lgsize (%d)%lld, physize (%d)%lld, realsize (%d)%lld, linkid (%d)%llu", (uint8_t *)&buf, 0xC4u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= getattrlist: len %u, dev (%d)%d, type (%d)%u, fileId (%d)%llu, uid (%d)%u, gid (%d)%u, access (%d)0%o, flags (%d)0x%x, gencount (%d)%u, protclass (%d)%u, nlink (%d)%u, lgsize (%d)%lld, physize (%d)%lld, realsize (%d)%lld, linkid (%d)%llu", (_DWORD)v248, (DWORD1(v248) >> 1) & 1, DWORD2(v249), (DWORD1(v248) >> 3) & 1, HIDWORD(v249), (DWORD1(v248) >> 25) & 1, *(_QWORD *)((char *)&v251 + 4), (DWORD1(v248) >> 15) & 1, (_DWORD)v250, HIWORD(DWORD1(v248)) & 1, DWORD1(v250), (DWORD1(v248) >> 17) & 1, DWORD2(v250), (DWORD1(v248) >> 18) & 1, HIDWORD(v250),
        (DWORD1(v248) >> 19) & 1,
        (_DWORD)v251,
        (DWORD1(v248) >> 30) & 1,
        HIDWORD(v251),
        v249 & 1,
        v252[0],
        (v249 >> 1) & 1,
        *(_QWORD *)&v252[1],
        (v249 >> 10) & 1,
        *(_QWORD *)&v252[3],
        (DWORD1(v249) >> 3) & 1,
        *(_QWORD *)&v252[5],
        (DWORD1(v249) >> 4) & 1,
        *(_QWORD *)&v252[7]);
    }
  }

  f_fsid = 0;
  v57 = open(v12, 256);
  if (v57 == -1)
  {
    v66 = __error();
    v67 = *v66;
    v69 = MBGetDefaultLog(v66, v68);
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v71 = v70;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 136446466;
        *(_QWORD *)&buf.f_iosize = v12;
        WORD2(buf.f_blocks) = 1024;
        *(_DWORD *)((char *)&buf.f_blocks + 6) = v67;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "=diag= open failed at %{public}s: %{errno}d", (uint8_t *)&buf, 0x12u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= open failed at %{public}s: %{errno}d", v12, v67);
    }

    if (!st_ino)
      goto LABEL_125;
LABEL_104:
    if (f_fsid.val[0])
    {
      *(_QWORD *)&v256 = st_ino;
      v97 = openbyid_np(&f_fsid, &v256, 256);
      if ((_DWORD)v97 == -1)
      {
        v108 = __error();
        v109 = *v108;
        v111 = MBGetDefaultLog(v108, v110);
        v112 = objc_claimAutoreleasedReturnValue(v111);
        if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
        {
          v113 = v112;
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109888;
            buf.f_iosize = f_fsid.val[0];
            LOWORD(buf.f_blocks) = 1024;
            *(_DWORD *)((char *)&buf.f_blocks + 2) = f_fsid.val[1];
            HIWORD(buf.f_blocks) = 2048;
            buf.f_bfree = st_ino;
            LOWORD(buf.f_bavail) = 1024;
            *(_DWORD *)((char *)&buf.f_bavail + 2) = v109;
            _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "=diag= openbyid_np({%d, %d}, %llu) failed: %{errno}d", (uint8_t *)&buf, 0x1Eu);
          }

          _MBLog(CFSTR("DEFAULT"), "=diag= openbyid_np({%d, %d}, %llu) failed: %{errno}d", f_fsid.val[0], f_fsid.val[1], st_ino, v109);
        }

      }
      else
      {
        v99 = v97;
        v100 = MBGetDefaultLog(v97, v98);
        v101 = objc_claimAutoreleasedReturnValue(v100);
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
        {
          v102 = v101;
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109632;
            buf.f_iosize = f_fsid.val[0];
            LOWORD(buf.f_blocks) = 1024;
            *(_DWORD *)((char *)&buf.f_blocks + 2) = f_fsid.val[1];
            HIWORD(buf.f_blocks) = 2048;
            buf.f_bfree = st_ino;
            _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "=diag= openbyid_np({%d, %d}, %llu) succeeded", (uint8_t *)&buf, 0x18u);
          }

          _MBLog(CFSTR("DEFAULT"), "=diag= openbyid_np({%d, %d}, %llu) succeeded", f_fsid.val[0], f_fsid.val[1], st_ino);
        }

        v103 = pread(v99, &buf, 0x10uLL, 0);
        if (v103 == -1)
        {
          v114 = __error();
          v115 = *v114;
          v117 = MBGetDefaultLog(v114, v116);
          v107 = objc_claimAutoreleasedReturnValue(v117);
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            v107 = v107;
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v262.d_ino) = 67109120;
              HIDWORD(v262.d_ino) = v115;
              _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "=diag= pread failed: %d", (uint8_t *)&v262, 8u);
            }

            _MBLog(CFSTR("DEFAULT"), "=diag= pread failed: %d");
          }
        }
        else
        {
          v105 = v103;
          v106 = MBGetDefaultLog(v103, v104);
          v107 = objc_claimAutoreleasedReturnValue(v106);
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            v107 = v107;
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v262.d_ino) = 134217984;
              *(__uint64_t *)((char *)&v262.d_ino + 4) = v105;
              _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "=diag= pread returned %ld bytes", (uint8_t *)&v262, 0xCu);
            }

            _MBLog(CFSTR("DEFAULT"), "=diag= pread returned %ld bytes");
          }
        }

        close(v99);
      }
    }
    goto LABEL_125;
  }
  v58 = v57;
  *(_QWORD *)v234 = st_ino;
  bzero(&buf, 0x878uLL);
  v59 = fstatfs(v58, &buf);
  if ((_DWORD)v59)
  {
    v61 = __error();
    v62 = *v61;
    v64 = MBGetDefaultLog(v61, v63);
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v65 = v65;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v262.d_ino) = 136446466;
        *(__uint64_t *)((char *)&v262.d_ino + 4) = (__uint64_t)v12;
        WORD2(v262.d_seekoff) = 1024;
        *(_DWORD *)((char *)&v262.d_seekoff + 6) = v62;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "=diag= fstatfs failed at %{public}s: %{errno}d", (uint8_t *)&v262, 0x12u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= fstatfs failed at %{public}s: %{errno}d", v12, v62, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232);
    }
  }
  else
  {
    f_fsid = buf.f_fsid;
    v72 = MBGetDefaultLog(v59, v60);
    v65 = objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v65 = v65;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v262.d_ino) = 67112448;
        HIDWORD(v262.d_ino) = buf.f_bsize;
        LOWORD(v262.d_seekoff) = 1024;
        *(_DWORD *)((char *)&v262.d_seekoff + 2) = buf.f_iosize;
        HIWORD(v262.d_seekoff) = 2048;
        *(_QWORD *)&v262.d_reclen = buf.f_blocks;
        *(_WORD *)&v262.d_name[3] = 2048;
        *(_QWORD *)&v262.d_name[5] = buf.f_bfree;
        *(_WORD *)&v262.d_name[13] = 2048;
        *(_QWORD *)&v262.d_name[15] = buf.f_bavail;
        *(_WORD *)&v262.d_name[23] = 2048;
        *(_QWORD *)&v262.d_name[25] = buf.f_files;
        *(_WORD *)&v262.d_name[33] = 2048;
        *(_QWORD *)&v262.d_name[35] = buf.f_ffree;
        *(_WORD *)&v262.d_name[43] = 1024;
        *(_DWORD *)&v262.d_name[45] = buf.f_fsid.val[0];
        *(_WORD *)&v262.d_name[49] = 1024;
        *(_DWORD *)&v262.d_name[51] = buf.f_fsid.val[1];
        *(_WORD *)&v262.d_name[55] = 1024;
        *(_DWORD *)&v262.d_name[57] = buf.f_owner;
        *(_WORD *)&v262.d_name[61] = 1024;
        *(_DWORD *)&v262.d_name[63] = buf.f_type;
        *(_WORD *)&v262.d_name[67] = 1024;
        *(_DWORD *)&v262.d_name[69] = buf.f_flags;
        *(_WORD *)&v262.d_name[73] = 1024;
        *(_DWORD *)&v262.d_name[75] = buf.f_fssubtype;
        *(_WORD *)&v262.d_name[79] = 1024;
        *(_DWORD *)&v262.d_name[81] = buf.f_flags_ext;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "=diag= fstatfs: bsize %u, iosize %d, blocks %llu, bfree %llu, bavail %llu, files %llu, ffree %llu, fsid {%d, %d}, owner %d, type %d, flags 0x%x, fssubtype %d, flags_ext 0x%x", (uint8_t *)&v262, 0x6Au);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= fstatfs: bsize %u, iosize %d, blocks %llu, bfree %llu, bavail %llu, files %llu, ffree %llu, fsid {%d, %d}, owner %d, type %d, flags 0x%x, fssubtype %d, flags_ext 0x%x", buf.f_bsize, buf.f_iosize, buf.f_blocks, buf.f_bfree, buf.f_bavail);
    }
  }

  v73 = fdopendir(v58);
  if (!v73)
  {
    v79 = __error();
    v80 = *v79;
    v82 = MBGetDefaultLog(v79, v81);
    v83 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v84 = v83;
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v262.d_ino) = 136446466;
        *(__uint64_t *)((char *)&v262.d_ino + 4) = (__uint64_t)v12;
        WORD2(v262.d_seekoff) = 1024;
        *(_DWORD *)((char *)&v262.d_seekoff + 6) = v80;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "=diag= fdopendir failed at %{public}s: %{errno}d", (uint8_t *)&v262, 0x12u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= fdopendir failed at %{public}s: %{errno}d", v12, v80);
    }

    close(v58);
    st_ino = *(_QWORD *)v234;
    if (!*(_QWORD *)v234)
      goto LABEL_125;
    goto LABEL_104;
  }
  v74 = v73;
  v75 = 0;
  while (1)
  {
    bzero(&v262, 0x418uLL);
    v246 = 0;
    v76 = readdir_r(v74, &v262, &v246);
    if ((_DWORD)v76)
    {
      v85 = v76;
      v86 = __error();
      v87 = *v86;
      v89 = MBGetDefaultLog(v86, v88);
      v90 = objc_claimAutoreleasedReturnValue(v89);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        v91 = v90;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v256) = 67109376;
          DWORD1(v256) = v85;
          WORD4(v256) = 1024;
          *(_DWORD *)((char *)&v256 + 10) = v87;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "=diag= readdir_r failed: %d (%{errno}d)", (uint8_t *)&v256, 0xEu);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= readdir_r failed: %d (%{errno}d)", v85, v87);
      }

LABEL_99:
      v92 = closedir(v74);
      v94 = MBGetDefaultLog(v92, v93);
      v95 = objc_claimAutoreleasedReturnValue(v94);
      st_ino = *(_QWORD *)v234;
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        v96 = v95;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v262.d_ino) = 67109120;
          HIDWORD(v262.d_ino) = v75;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "=diag= Failed to find the file using readdir_r (%u)", (uint8_t *)&v262, 8u);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= Failed to find the file using readdir_r (%u)", v75);
      }

      if (!*(_QWORD *)v234)
        goto LABEL_125;
      goto LABEL_104;
    }
    if (!v246)
      goto LABEL_99;
    if (*(unsigned __int16 *)v262.d_name != 46)
    {
      if (*(unsigned __int16 *)v262.d_name ^ 0x2E2E | v262.d_name[2])
      {
        v77 = strcmp(v262.d_name, v10);
        if (!(_DWORD)v77)
          break;
      }
    }
    if (++v75 == 500000)
    {
      v75 = 500000;
      goto LABEL_99;
    }
  }
  d_ino = *(_QWORD *)v234;
  if (!*(_QWORD *)v234)
    d_ino = v262.d_ino;
  v216 = MBGetDefaultLog(v77, v78);
  v217 = objc_claimAutoreleasedReturnValue(v216);
  if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
  {
    v218 = v217;
    if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v256) = 67110144;
      DWORD1(v256) = v75;
      WORD4(v256) = 1024;
      *(_DWORD *)((char *)&v256 + 10) = v262.d_type;
      HIWORD(v256) = 2048;
      v257 = v262.d_ino;
      v258 = 1024;
      d_namlen = v262.d_namlen;
      v260 = 1024;
      d_reclen = v262.d_reclen;
      _os_log_impl((void *)&_mh_execute_header, v218, OS_LOG_TYPE_DEFAULT, "=diag= readdir_r found file entry (%u), type %d, ino %llu, namelen %d, reclen %d", (uint8_t *)&v256, 0x24u);
    }

    _MBLog(CFSTR("DEFAULT"), "=diag= readdir_r found file entry (%u), type %d, ino %llu, namelen %d, reclen %d", v75, v262.d_type, v262.d_ino, v262.d_namlen, v262.d_reclen);
  }

  closedir(v74);
  st_ino = d_ino;
  if (d_ino)
    goto LABEL_104;
LABEL_125:
  v256 = 0uLL;
  v118 = fsctl(v8, 0x40104A0EuLL, &v256, 0);
  if ((_DWORD)v118)
  {
    v120 = __error();
    v121 = *v120;
    v123 = MBGetDefaultLog(v120, v122);
    v124 = objc_claimAutoreleasedReturnValue(v123);
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      v124 = v124;
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 67109120;
        buf.f_iosize = v121;
        _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_CLONE_INFO) failed: %{errno}d", (uint8_t *)&buf, 8u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= fsctl(APFSIOC_GET_CLONE_INFO) failed: %{errno}d", v121, v220);
    }
  }
  else
  {
    v125 = MBGetDefaultLog(v118, v119);
    v124 = objc_claimAutoreleasedReturnValue(v125);
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      v124 = v124;
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 134218240;
        *(_QWORD *)&buf.f_iosize = v256;
        WORD2(buf.f_blocks) = 2048;
        *(uint64_t *)((char *)&buf.f_blocks + 6) = *((_QWORD *)&v256 + 1);
        _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_CLONE_INFO): flags 0x%llx, private_id %llu", (uint8_t *)&buf, 0x16u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= fsctl(APFSIOC_GET_CLONE_INFO): flags 0x%llx, private_id %llu");
    }
  }

  v235 = open_dprotected_np(v8, 0, 0, 1, 0);
  if (v235 == -1)
  {
    v133 = __error();
    v134 = *v133;
    v136 = MBGetDefaultLog(v133, v135);
    v137 = objc_claimAutoreleasedReturnValue(v136);
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 67109120;
      buf.f_iosize = v134;
      _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "=diag= Failed to open the file raw encrypted: %{errno}d", (uint8_t *)&buf, 8u);
      _MBLog(CFSTR("DEFAULT"), "=diag= Failed to open the file raw encrypted: %{errno}d", v134);
    }

  }
  else
  {
    v245 = 0;
    v126 = fsctl(v8, 0x40084A25uLL, &v245, 8u);
    if ((_DWORD)v126)
    {
      v128 = __error();
      v129 = *v128;
      v131 = MBGetDefaultLog(v128, v130);
      v132 = objc_claimAutoreleasedReturnValue(v131);
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        v132 = v132;
        if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 67109120;
          buf.f_iosize = v129;
          _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_INTERNAL_FLAGS) failed: %{errno}d", (uint8_t *)&buf, 8u);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= fsctl(APFSIOC_GET_INTERNAL_FLAGS) failed: %{errno}d", v129);
      }
    }
    else
    {
      v140 = MBGetDefaultLog(v126, v127);
      v132 = objc_claimAutoreleasedReturnValue(v140);
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        v132 = v132;
        if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 134217984;
          *(_QWORD *)&buf.f_iosize = v245;
          _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_INTERNAL_FLAGS): flags 0x%llx", (uint8_t *)&buf, 0xCu);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= fsctl(APFSIOC_GET_INTERNAL_FLAGS): flags 0x%llx");
      }
    }

    v243 = 0u;
    v244 = 0u;
    v242 = 0u;
    v141 = fsctl(v8, 0x40304A6DuLL, &v242, 0);
    if ((_DWORD)v141)
    {
      v143 = __error();
      v144 = *v143;
      v146 = MBGetDefaultLog(v143, v145);
      v147 = objc_claimAutoreleasedReturnValue(v146);
      if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
      {
        v147 = v147;
        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 67109120;
          buf.f_iosize = v144;
          _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_PURGEABLE_GET_FILE_INFO) failed: %{errno}d", (uint8_t *)&buf, 8u);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= fsctl(APFSIOC_PURGEABLE_GET_FILE_INFO) failed: %{errno}d", v144, v220, v221, v222, v223, v224);
      }
    }
    else
    {
      v148 = MBGetDefaultLog(v141, v142);
      v147 = objc_claimAutoreleasedReturnValue(v148);
      if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
      {
        v147 = v147;
        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 134219264;
          *(_QWORD *)&buf.f_iosize = v242;
          WORD2(buf.f_blocks) = 2048;
          *(uint64_t *)((char *)&buf.f_blocks + 6) = *((_QWORD *)&v242 + 1);
          HIWORD(buf.f_bfree) = 2048;
          buf.f_bavail = v243;
          LOWORD(buf.f_files) = 2048;
          *(uint64_t *)((char *)&buf.f_files + 2) = *((_QWORD *)&v243 + 1);
          WORD1(buf.f_ffree) = 2048;
          *(uint64_t *)((char *)&buf.f_ffree + 4) = v244;
          LOWORD(buf.f_fsid.val[1]) = 2048;
          *(fsid_t *)((char *)&buf.f_fsid + 6) = (fsid_t)*((_QWORD *)&v244 + 1);
          _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_PURGEABLE_GET_FILE_INFO): file flags: 0x%llx related flags: 0x%llx, file acctime: %llu\n gen count: %llu sync root id: %llu size: %llu", (uint8_t *)&buf, 0x3Eu);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= fsctl(APFSIOC_PURGEABLE_GET_FILE_INFO): file flags: 0x%llx related flags: 0x%llx, file acctime: %llu\n gen count: %llu sync root id: %llu size: %llu");
      }
    }

    v151 = MBGetDefaultLog(v149, v150);
    v152 = objc_claimAutoreleasedReturnValue(v151);
    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
    {
      v153 = v152;
      if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_DEFAULT, "=diag= Dumping extent information", (uint8_t *)&buf, 2u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= Dumping extent information");
    }

    v154 = 0;
    v155 = 0;
    while (1)
    {
      LODWORD(v262.d_ino) = 0;
      *(__uint64_t *)((char *)&v262.d_ino + 4) = 0x7FFFFFFFFFFFFFFFLL;
      *(__uint64_t *)((char *)&v262.d_seekoff + 4) = v155;
      v156 = fcntl(v235, 65, &v262);
      if ((_DWORD)v156)
        break;
      v158 = *(__uint64_t *)((char *)&v262.d_ino + 4);
      v159 = MBGetDefaultLog(v156, v157);
      v160 = objc_claimAutoreleasedReturnValue(v159);
      if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
      {
        v161 = v160;
        if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 134218496;
          *(_QWORD *)&buf.f_iosize = v155;
          WORD2(buf.f_blocks) = 2048;
          *(uint64_t *)((char *)&buf.f_blocks + 6) = v158;
          HIWORD(buf.f_bfree) = 2048;
          buf.f_bavail = *(__uint64_t *)((char *)&v262.d_seekoff + 4);
          _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_DEFAULT, "=diag= 0x%llx:+%lld @ 0x%llx", (uint8_t *)&buf, 0x20u);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= 0x%llx:+%lld @ 0x%llx", v155, v158, *(__uint64_t *)((char *)&v262.d_seekoff + 4));
      }

      if (v158 < 1 || (v158 ^ 0x7FFFFFFFFFFFFFFFLL) < v155)
        goto LABEL_176;
      v155 += v158;
      if (++v154 == 10000)
      {
        v154 = 10000;
        goto LABEL_176;
      }
    }
    v162 = __error();
    v164 = *v162;
    if ((_DWORD)v164 != 34)
    {
      v165 = MBGetDefaultLog(v162, v163);
      v166 = objc_claimAutoreleasedReturnValue(v165);
      if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
      {
        v167 = v166;
        if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 134218240;
          *(_QWORD *)&buf.f_iosize = v155;
          WORD2(buf.f_blocks) = 1024;
          *(_DWORD *)((char *)&buf.f_blocks + 6) = v164;
          _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_DEFAULT, "=diag= log2phys failed at 0x%llx: %{errno}d", (uint8_t *)&buf, 0x12u);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= log2phys failed at 0x%llx: %{errno}d", v155, v164);
      }

    }
LABEL_176:
    v168 = MBGetDefaultLog(v162, v163);
    v169 = objc_claimAutoreleasedReturnValue(v168);
    if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
    {
      v170 = v169;
      if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
      {
        buf.f_bsize = 67109120;
        buf.f_iosize = v154;
        _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_DEFAULT, "=diag= Found %u extents", (uint8_t *)&buf, 8u);
      }

      _MBLog(CFSTR("DEFAULT"), "=diag= Found %u extents", v154);
    }

    v171 = (char *)malloc_type_malloc(0x4000uLL, 0x445AE8B7uLL);
    if (!v171)
      sub_1000875E0();
    v172 = v171;
    v236 = 1;
    v238 = 0;
    v237 = 0;
    v239 = 0;
    v240 = 0x4000;
    v241 = v171;
    v173 = ffsctl(v235, 0x80284A7FuLL, &v236, 0);
    if ((_DWORD)v173)
    {
      v175 = __error();
      v176 = *v175;
      v178 = MBGetDefaultLog(v175, v177);
      v179 = objc_claimAutoreleasedReturnValue(v178);
      if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
      {
        v180 = v179;
        if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 67109120;
          buf.f_iosize = v176;
          _os_log_impl((void *)&_mh_execute_header, v180, OS_LOG_TYPE_DEFAULT, "=diag= Failed to get the crypto file infos: %{errno}d", (uint8_t *)&buf, 8u);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= Failed to get the crypto file infos: %{errno}d", v176);
      }

    }
    else
    {
      if ((*((_QWORD *)v172 + 2) & 0x8000000000000000) == 0)
        sub_100087608();
      v181 = MBGetDefaultLog(v173, v174);
      v182 = objc_claimAutoreleasedReturnValue(v181);
      if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
      {
        v183 = v182;
        if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
        {
          v184 = *((_DWORD *)v172 + 85);
          v185 = *((_QWORD *)v172 + 3);
          buf.f_bsize = 67109376;
          buf.f_iosize = v184;
          LOWORD(buf.f_blocks) = 2048;
          *(uint64_t *)((char *)&buf.f_blocks + 2) = v185;
          _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_DEFAULT, "=diag= Found %u crypto ids for filesize %lld", (uint8_t *)&buf, 0x12u);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= Found %u crypto ids for filesize %lld", *((_DWORD *)v172 + 85), *((_QWORD *)v172 + 3));
      }

      if (*((_DWORD *)v172 + 85))
      {
        v188 = 0;
        v189 = v172 + 344;
        do
        {
          v190 = v188;
          v191 = &v189[312 * v188];
          v192 = *((_QWORD *)v191 + 2);
          v193 = MBGetDefaultLog(v186, v187);
          v194 = objc_claimAutoreleasedReturnValue(v193);
          if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
          {
            v195 = v194;
            if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
            {
              v196 = *(_QWORD *)v191;
              v197 = *(_QWORD *)&v189[312 * v190 + 8];
              buf.f_bsize = 134218496;
              *(_QWORD *)&buf.f_iosize = v196;
              WORD2(buf.f_blocks) = 2048;
              *(uint64_t *)((char *)&buf.f_blocks + 6) = v197;
              HIWORD(buf.f_bfree) = 2048;
              buf.f_bavail = v192;
              _os_log_impl((void *)&_mh_execute_header, v195, OS_LOG_TYPE_DEFAULT, "=diag= offset %lld:length %llu, id %lld", (uint8_t *)&buf, 0x20u);
            }

            _MBLog(CFSTR("DEFAULT"), "=diag= offset %lld:length %llu, id %lld", *(_QWORD *)v191, *(_QWORD *)&v189[312 * v190 + 8], v192);
          }

          v200 = MBGetDefaultLog(v198, v199);
          v201 = objc_claimAutoreleasedReturnValue(v200);
          if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
          {
            v202 = v201;
            if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
            {
              v203 = &v189[312 * v190];
              v204 = *((_DWORD *)v203 + 10);
              v205 = *((_DWORD *)v203 + 11);
              v206 = *((unsigned __int16 *)v203 + 24);
              LODWORD(v203) = *((unsigned __int16 *)v203 + 25);
              buf.f_bsize = 134219008;
              *(_QWORD *)&buf.f_iosize = v192;
              WORD2(buf.f_blocks) = 1024;
              *(_DWORD *)((char *)&buf.f_blocks + 6) = v204;
              WORD1(buf.f_bfree) = 1024;
              HIDWORD(buf.f_bfree) = v205;
              LOWORD(buf.f_bavail) = 1024;
              *(_DWORD *)((char *)&buf.f_bavail + 2) = v206;
              HIWORD(buf.f_bavail) = 1024;
              LODWORD(buf.f_files) = (_DWORD)v203;
              _os_log_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_DEFAULT, "=diag= crypto_id %llu key_class %u, os_vers 0x%x, rev %hu, len %hu", (uint8_t *)&buf, 0x24u);
            }

            _MBLog(CFSTR("DEFAULT"), "=diag= crypto_id %llu key_class %u, os_vers 0x%x, rev %hu, len %hu", v192, *(_DWORD *)&v189[312 * v190 + 40], *(_DWORD *)&v189[312 * v190 + 44], *(unsigned __int16 *)&v189[312 * v190 + 48], *(unsigned __int16 *)&v189[312 * v190 + 50]);
          }

          v188 = v190 + 1;
        }
        while (*((_DWORD *)v172 + 85) > (unsigned __int16)(v190 + 1));
      }
    }
    free(v172);
    sub_10000CC88(v233);
    v207 = getxattr(v233, "com.apple.ResourceFork", 0, 0, 0, 0);
    if (v207 != -1)
    {
      v209 = MBGetDefaultLog(v207, v208);
      v210 = objc_claimAutoreleasedReturnValue(v209);
      if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
      {
        v211 = v210;
        if (os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 136315138;
          *(_QWORD *)&buf.f_iosize = v233;
          _os_log_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_DEFAULT, "=diag= %s is a compressed file", (uint8_t *)&buf, 0xCu);
        }

        _MBLog(CFSTR("DEFAULT"), "=diag= %s is a compressed file", v233);
      }

      v212 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/..namedfork/rsrc"))));
      sub_10000CC88((const char *)objc_msgSend(v212, "fileSystemRepresentation"));

    }
    v138 = close(v235);
  }
  v213 = MBGetDefaultLog(v138, v139);
  v31 = objc_claimAutoreleasedReturnValue(v213);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v214 = v31;
    if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138543362;
      *(_QWORD *)&buf.f_iosize = v7;
      _os_log_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_DEFAULT, "=diag= Finished dumping diagnostics for %{public}@", (uint8_t *)&buf, 0xCu);
    }

    _MBLog(CFSTR("DEFAULT"), "=diag= Finished dumping diagnostics for %{public}@", v7);
  }
LABEL_214:

LABEL_215:
}

void sub_10000F1A4(void *a1)
{
  void *v1;
  void *v2;
  unsigned int v3;
  id v4;

  v4 = a1;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "processName"));

  if (objc_msgSend(v2, "isEqualToString:", CFSTR("BackupAgent2")))
  {
    do
      v3 = __ldxr(&dword_1000F9DD0);
    while (__stxr(v3 + 1, &dword_1000F9DD0));
    if (v3 <= 1)
      sub_10000D140(v4);
  }

}

void sub_10000F234(void *a1)
{
  void *v1;
  void *v2;
  unsigned int v3;
  id v4;

  v4 = a1;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "processName"));

  if (objc_msgSend(v2, "isEqualToString:", CFSTR("backupd")))
  {
    do
      v3 = __ldxr(&dword_1000F9DD4);
    while (__stxr(v3 + 1, &dword_1000F9DD4));
    if (v3 <= 1)
      sub_10000D140(v4);
  }

}

void sub_10000F2C4(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "processName"));
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("backupd"));

  if (v14)
  {
    do
      v15 = __ldxr(&dword_1000F9DD8);
    while (__stxr(v15 + 1, &dword_1000F9DD8));
    if (!v15)
    {
      sub_10000D140(v9);
      v16 = MBLivePathFromSnapshotPath(v9, v10, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (v17 && (objc_msgSend(v9, "isEqualToString:", v17) & 1) == 0)
        sub_10000D140(v17);
      v18 = sub_100081D30();
      if ((_DWORD)v18)
      {
        v20 = MBGetDefaultLog(v18, v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136446722;
          v23 = a5;
          v24 = 1024;
          v25 = a4;
          v26 = 2114;
          v27 = v9;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "=diag= %{public}s failed with %d at %{public}@", buf, 0x1Cu);
          _MBLog(CFSTR("FAULT"), "=diag= %{public}s failed with %d at %{public}@", a5, a4, v9);
        }

      }
    }
  }

}

void sub_10000F480(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "processName"));
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("BackupAgent2"));

  if (v14)
  {
    do
      v15 = __ldxr(&dword_1000F9DDC);
    while (__stxr(v15 + 1, &dword_1000F9DDC));
    if (!v15)
    {
      sub_10000D140(v9);
      v16 = MBLivePathFromSnapshotPath(v9, v10, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (v17 && (objc_msgSend(v9, "isEqualToString:", v17) & 1) == 0)
        sub_10000D140(v17);
      v18 = sub_100081D30();
      if ((_DWORD)v18)
      {
        v20 = MBGetDefaultLog(v18, v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136446722;
          v23 = a5;
          v24 = 1024;
          v25 = a4;
          v26 = 2114;
          v27 = v9;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "=diag= %{public}s failed with %d at %{public}@", buf, 0x1Cu);
          _MBLog(CFSTR("FAULT"), "=diag= %{public}s failed with %d at %{public}@", a5, a4, v9);
        }

      }
    }
  }

}

uint64_t sub_10000FA88(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  void *Data;
  uint64_t result;
  char v14;
  unsigned int v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  MBSSnapshot *v19;
  MBSBackupAttributes *v20;
  char v21;
  unsigned int v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
    return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  while (2)
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v9 = v5++ >= 9;
      if (v9)
      {
        LODWORD(v6) = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      LODWORD(v6) = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    switch((unsigned __int16)(v6 >> 3))
    {
      case 1u:
        Data = (void *)PBReaderReadData(a2);

        *(_QWORD *)(a1 + 32) = Data;
        goto LABEL_50;
      case 2u:
        v14 = 0;
        v15 = 0;
        v16 = 0;
        *(_BYTE *)(a1 + 48) |= 2u;
        while (2)
        {
          v17 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v17 == -1 || v17 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v18 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
            v16 |= (unint64_t)(v18 & 0x7F) << v14;
            if (v18 < 0)
            {
              v14 += 7;
              v9 = v15++ >= 9;
              if (v9)
              {
                v16 = 0;
                goto LABEL_44;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
          v16 = 0;
LABEL_44:
        v25 = 16;
        goto LABEL_49;
      case 3u:
        v19 = objc_alloc_init(MBSSnapshot);
        objc_msgSend((id)a1, "addSnapshot:", v19);

        v26 = 0;
        v27 = 0;
        if (!PBReaderPlaceMark(a2, &v26) || (sub_10000A7A0((uint64_t)v19, a2) & 1) == 0)
          return 0;
        goto LABEL_33;
      case 4u:
        v20 = objc_alloc_init(MBSBackupAttributes);

        *(_QWORD *)(a1 + 24) = v20;
        v26 = 0;
        v27 = 0;
        if (PBReaderPlaceMark(a2, &v26) && sub_10000C48C((uint64_t)v20, a2))
        {
LABEL_33:
          PBReaderRecallMark(a2, &v26);
LABEL_50:
          if (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
            return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          continue;
        }
        return 0;
      case 5u:
        v21 = 0;
        v22 = 0;
        v16 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
        while (2)
        {
          v23 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
            *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
            v16 |= (unint64_t)(v24 & 0x7F) << v21;
            if (v24 < 0)
            {
              v21 += 7;
              v9 = v22++ >= 9;
              if (v9)
              {
                v16 = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
          v16 = 0;
LABEL_48:
        v25 = 8;
LABEL_49:
        *(_QWORD *)(a1 + v25) = v16;
        goto LABEL_50;
      default:
        result = PBReaderSkipValueWithTag(a2, (unsigned __int16)(v6 >> 3));
        if (!(_DWORD)result)
          return result;
        goto LABEL_50;
    }
  }
}

void sub_100010808(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010820(id a1)
{
  qword_1000F9DE8 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
}

uint64_t sub_100011014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  double v7;
  double v8;
  id v9;
  double v10;
  uint64_t v11;
  uint64_t v12;

  v6 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", a2), "objectAtIndexedSubscript:", 0), "integerValue");
  objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", a2), "objectAtIndexedSubscript:", 1), "doubleValue");
  v8 = v7;
  v9 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", a3), "objectAtIndexedSubscript:", 0), "integerValue");
  objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", a3), "objectAtIndexedSubscript:", 1), "doubleValue");
  v11 = -1;
  if ((uint64_t)v9 >= (uint64_t)v6)
    v11 = 1;
  v12 = -1;
  if (v10 >= v8)
    v12 = v10 != v8;
  if (v9 == v6)
    return v12;
  else
    return v11;
}

id sub_1000110E8(void *a1)
{
  id v2;

  v2 = objc_msgSend(a1, "rangeOfCharacterFromSet:", +[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  if (v2 == (id)0x7FFFFFFFFFFFFFFFLL)
    return a1;
  else
    return objc_msgSend(objc_msgSend(a1, "substringToIndex:", v2), "stringByAppendingString:", CFSTR("..."));
}

uint64_t sub_100011670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v9;

  if ((_DWORD)a1 == 1)
  {
    if (a4)
    {
      v5 = MBGetSQLLog(a1, a2);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v9 = sub_1000110E8(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SQL: %@", buf, 0xCu);
        v6 = sub_1000110E8(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
        _MBLog(CFSTR("DEBUG"), "SQL: %@", v6);
      }
    }
  }
  return 0;
}

int64_t sub_100012524(id a1, id a2, id a3)
{
  unsigned int v5;
  unsigned int v7;

  v5 = objc_msgSend(a2, "snapshotID");
  if (v5 < objc_msgSend(a3, "snapshotID"))
    return -1;
  v7 = objc_msgSend(a2, "snapshotID");
  return v7 != objc_msgSend(a3, "snapshotID");
}

int64_t sub_1000137A0(id a1, id a2, id a3)
{
  unsigned int v5;
  unsigned int v7;

  v5 = objc_msgSend(a2, "snapshotID");
  if (v5 < objc_msgSend(a3, "snapshotID"))
    return -1;
  v7 = objc_msgSend(a2, "snapshotID");
  return v7 != objc_msgSend(a3, "snapshotID");
}

MBFileID *sub_10001418C(uint64_t a1)
{
  MBFileID *result;

  if (objc_msgSend(*(id *)(a1 + 32), "step"))
  {
    result = +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", objc_msgSend(*(id *)(a1 + 32), "textColumn:", 0));
    if (result)
      return result;
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("MBServiceCache.m"), 1227, CFSTR("Failed to convert file ID"));
  }
  return 0;
}

void sub_100014C94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014CEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001608C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x100015E04);
  }
  _Unwind_Resume(exc_buf);
}

void sub_10001663C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_100016660(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1000165CCLL);
}

id sub_1000199E0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;
  id v9;

  v8 = objc_alloc_init((Class)NSAutoreleasePool);
  v9 = objc_msgSend(a1, "openWithPath:flags:mode:", +[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a2), a3, a4);
  objc_msgSend(v8, "drain");
  return v9;
}

id sub_100019A5C(void *a1, uint64_t a2)
{
  id v4;
  id v5;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = objc_msgSend(a1, "closeWithFD:", a2);
  objc_msgSend(v4, "drain");
  return v5;
}

id sub_100019AB0(void *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  id v7;

  v6 = objc_alloc_init((Class)NSAutoreleasePool);
  v7 = objc_msgSend(a1, "statWithFD:buf:", a2, a3);
  objc_msgSend(v6, "drain");
  return v7;
}

id sub_100019B0C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;
  id v9;

  v8 = objc_alloc_init((Class)NSAutoreleasePool);
  v9 = objc_msgSend(a1, "readWithFD:bytes:length:", a2, a3, a4);
  objc_msgSend(v8, "drain");
  return v9;
}

id sub_100019B78(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;
  id v9;

  v8 = objc_alloc_init((Class)NSAutoreleasePool);
  v9 = objc_msgSend(a1, "writeWithFD:bytes:length:", a2, a3, a4);
  objc_msgSend(v8, "drain");
  return v9;
}

void sub_10001D144(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001DAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DB14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;

  v5 = a2;
  v6 = a3;
  v8 = v6;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v9 = MBGetDefaultLog(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Passcode policy evalutation succeeded: %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Passcode policy evalutation succeeded: %@", v5);
    }
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  if (objc_msgSend(v11, "isEqualToString:", LAErrorDomain))
  {
    v12 = objc_msgSend(v8, "code");

    if (v12 == (id)-5)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      v15 = MBGetDefaultLog(v13, v14);
      v10 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Skipping passcode policy evaluation because there is no passcode set on device: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Skipping passcode policy evaluation because there is no passcode set on device: %@", v8);
      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  v16 = MBGetDefaultLog(v13, v14);
  v10 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Passcode policy evaluation failed: %@", buf, 0xCu);
    _MBLog(CFSTR("ERROR"), "Passcode policy evaluation failed: %@", v8);
  }
LABEL_11:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001EFEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100020C9C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v21;

  v5 = a2;
  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "prefixDirectories"));
  v9 = objc_msgSend(v8, "containsObject:", v5);

  if ((v9 & 1) == 0)
  {
    v10 = MBBackupMetadataFilenames();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v11, "containsObject:", v5);

    if ((v12 & 1) == 0)
    {
      v13 = objc_claimAutoreleasedReturnValue(+[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", v5));
      v15 = (void *)v13;
      if (v13 && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 192))
      {
        v16 = MBGetDefaultLog(v13, v14);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v15;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Already uploaded to snapshot: %@", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Already uploaded to snapshot: %@", v15);
        }

        v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setFlags:mask:forFileID:", 200, -17, v15);
      }

    }
  }
  objc_autoreleasePoolPop(v7);

  return 1;
}

uint64_t sub_100020E34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v21;

  v5 = a2;
  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "prefixDirectories"));
  v9 = objc_msgSend(v8, "containsObject:", v5);

  if ((v9 & 1) == 0)
  {
    v10 = MBBackupMetadataFilenames();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v11, "containsObject:", v5);

    if ((v12 & 1) == 0)
    {
      v13 = objc_claimAutoreleasedReturnValue(+[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", v5));
      v15 = (void *)v13;
      if (v13)
      {
        v16 = MBGetDefaultLog(v13, v14);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v15;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Already uploaded to backup: %@", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Already uploaded to backup: %@", v15);
        }

        v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setFlags:mask:forFileID:", 72, -17, v15);
      }

    }
  }
  objc_autoreleasePoolPop(v7);

  return 1;
}

void sub_1000211A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000211BC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Manifest.db")))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "prefixDirectories"));
  v9 = objc_msgSend(v8, "containsObject:", v5);

  if ((v9 & 1) == 0)
  {
    v10 = MBBackupMetadataFilenames();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v11, "containsObject:", v5);

    if ((v12 & 1) == 0)
    {
      v13 = objc_claimAutoreleasedReturnValue(+[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", v5));
      v15 = (void *)v13;
      if (v13)
      {
        v16 = MBGetDefaultLog(v13, v14);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v5;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Not already moved from snapshot: %@", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Not already moved from snapshot: %@", v5);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupOperation backupOperationWithType:domain:fileID:path:size:](MBBackupOperation, "backupOperationWithType:domain:fileID:path:size:", 0, 0, v15, 0, 0));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "addOperation:", v18);

      }
    }
  }
  objc_autoreleasePoolPop(v7);

  return 1;
}

id sub_100022050(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCanceled");
}

void sub_100024958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100024970(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100024980(uint64_t a1)
{

}

BOOL sub_100024988(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id obj;
  uint8_t buf[4];
  void *v28;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchFileWithID:error:", v6, &obj));
  objc_storeStrong((id *)(v7 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v9 = 0;
    goto LABEL_13;
  }
  if (v8)
  {
    if ((objc_msgSend(v8, "isRegularFile") & 1) != 0
      || (v10 = objc_msgSend(v3, "isRegularFile"), !(_DWORD)v10))
    {
LABEL_12:
      v9 = 1;
      goto LABEL_13;
    }
LABEL_9:
    v17 = MBGetDefaultLog(v10, v11);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Removed from backup: %@", buf, 0xCu);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
      _MBLog(CFSTR("INFO"), "Removed from backup: %@", v20);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupOperation backupOperationWithType:domain:fileID:path:size:](MBBackupOperation, "backupOperationWithType:domain:fileID:path:size:", 4, v21, v22, 0, 0));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "addOperation:", v23);
    goto LABEL_12;
  }
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v25 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "containsPlaceholderForFileID:error:", v13, &v25);
  objc_storeStrong((id *)(v14 + 40), v25);

  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v9 = v16 == 0;
  if (!v16 && (v15 & 1) == 0)
    goto LABEL_9;
LABEL_13:

  objc_autoreleasePoolPop(v4);
  return v9;
}

void sub_100027D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a67;
  char a71;

  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

void sub_100027DF8(uint64_t a1, uint64_t *a2, void *a3)
{
  id v5;
  __uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  NSObject *v36;
  unsigned int v37;
  void *v38;
  id v39;
  unsigned int v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  unsigned int v45;
  __int16 v46;
  id v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  unsigned int v53;

  v5 = a3;
  v6 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v42 = *(_QWORD *)(a1 + 112);
  v43 = *(_QWORD *)(a1 + 120);
  v7 = objc_msgSend(*(id *)(a1 + 40), "index");
  if (!(_DWORD)v7)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "isFlagSet:", CFSTR("SimulateErrorAfterUploadingFirstBatch")))
    {
      v9 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Simulated error after uploading first batch")));

      v5 = (id)v9;
    }
    else
    {
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "isFlagSet:", CFSTR("SimulateCrashAfterUploadingFirstBatch"));
      if ((_DWORD)v7)
        abort();
    }
  }
  if (v5)
  {
    v10 = MBGetDefaultLog(v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(*(id *)(a1 + 40), "index");
      *(_DWORD *)buf = 67109378;
      v45 = v12;
      v46 = 2112;
      v47 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to upload batch i:%u: %@", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "Failed to upload batch i:%u: %@", objc_msgSend(*(id *)(a1 + 40), "index"), v5);
    }

  }
  v14 = *a2;
  v13 = a2[1];
  v16 = a2[2];
  v15 = a2[3];
  v17 = *(id *)(a1 + 48);
  objc_sync_enter(v17);
  if (v5)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v20 = *(_QWORD *)(v18 + 40);
    v19 = (id *)(v18 + 40);
    if (!v20)
      objc_storeStrong(v19, v5);
  }
  v21 = *(void **)(*(_QWORD *)(a1 + 48) + 184);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "allKeys"));
  objc_msgSend(v21, "removeObjectsForKeys:", v22);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += v14;
  v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) += v13;
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v25 = *(_QWORD *)(v24 + 24);
  if (v25 >= v16)
    v25 = v16;
  *(_QWORD *)(v24 + 24) = v25;
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v27 = *(_QWORD *)(v26 + 24);
  if (v27 <= v15)
    v27 = v15;
  *(_QWORD *)(v26 + 24) = v27;
  objc_sync_exit(v17);

  v30 = (double)(v6 - v43) / 1000000000.0;
  v31 = -1.0;
  if (v30 > 0.0)
    v31 = (double)v23 / v30 / 1000000.0;
  v32 = (double)(v6 - v42) / 1000000000.0;
  do
  {
    v33 = __ldxr(&dword_1000F9DF4);
    v34 = v33 - 1;
  }
  while (__stxr(v33 - 1, &dword_1000F9DF4));
  v35 = MBGetDefaultLog(v28, v29);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = objc_msgSend(*(id *)(a1 + 40), "index");
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "paths"));
    v39 = objc_msgSend(v38, "count");
    *(_DWORD *)buf = 67110144;
    v45 = v37;
    v46 = 2048;
    v47 = v39;
    v48 = 2048;
    v49 = v32;
    v50 = 2048;
    v51 = v31;
    v52 = 1024;
    v53 = v34;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Finished batch i:%u, c:%lu, t:%.3f, r:%.3f, o:%u", buf, 0x2Cu);

    v40 = objc_msgSend(*(id *)(a1 + 40), "index");
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "paths"));
    _MBLog(CFSTR("INFO"), "Finished batch i:%u, c:%lu, t:%.3f, r:%.3f, o:%u", v40, objc_msgSend(v41, "count"), v32, v31, v34);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void sub_1000281B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000281D4(uint64_t a1, void *a2)
{
  if (a2)
    sub_1000877C0();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100028328(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  unsigned int v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  _QWORD v55[3];
  _BYTE v56[128];

  v40 = a3;
  v5 = a4;
  v39 = v5;
  if (v5
    && (v6 = v5,
        (+[MBError isError:withCode:](MBError, "isError:withCode:", v5, 2) & 1) == 0))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v6, CFSTR("Error uploading files to snapshot")));
  }
  else
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v40;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v43)
    {
      v41 = 0;
      v42 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v42)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          v9 = objc_autoreleasePoolPush();
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v8));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", v12));

          if (!v13)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("MBDriveBackupEngine.m"), 2041, CFSTR("Unable to extract file ID from path: %@"), v11);

          }
          v14 = *(id *)(a1 + 40);
          objc_sync_enter(v14);
          v15 = *(void **)(*(_QWORD *)(a1 + 40) + 184);
          v16 = objc_retainAutorelease(v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(v16, "fileSystemRepresentation")));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v17));

          objc_sync_exit(v14);
          if (!v18)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("MBDriveBackupEngine.m"), 2047, CFSTR("No operation found for path: %@"), v16);

          }
          if (v10)
          {
            v19 = +[MBError isError:withCode:](MBError, "isError:withCode:", v10, 202);
            if ((v19 & 1) == 0)
            {
              v21 = MBGetDefaultLog(v19, v20);
              v22 = objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                v23 = *(_DWORD *)(a1 + 64);
                *(_DWORD *)buf = 138413058;
                v51 = v16;
                v52 = 2112;
                v53 = v11;
                v54 = 1024;
                LODWORD(v55[0]) = v23;
                WORD2(v55[0]) = 2112;
                *(_QWORD *)((char *)v55 + 6) = v10;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to upload %@ to %@ in batch %u: %@", buf, 0x26u);
                _MBLog(CFSTR("ERROR"), "Failed to upload %@ to %@ in batch %u: %@", v16, v11, *(unsigned int *)(a1 + 64), v10);
              }

            }
            v24 = *(id *)(a1 + 40);
            objc_sync_enter(v24);
            v25 = +[MBError isError:withCodes:](MBError, "isError:withCodes:", v10, 4, 6, 7, 0);
            if ((_DWORD)v25)
            {
              v27 = MBGetDefaultLog(v25, v26);
              v28 = objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = v28;
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  v30 = objc_msgSend(v10, "code");
                  *(_DWORD *)buf = 138412802;
                  v51 = v16;
                  v52 = 2048;
                  v53 = v30;
                  v54 = 2112;
                  v55[0] = v13;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "File removed before being uploaded: %@ (%ld, %@)", buf, 0x20u);
                }

                _MBLog(CFSTR("DEFAULT"), "File removed before being uploaded: %@ (%ld, %@)", v16, objc_msgSend(v10, "code"), v13);
              }

              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setFlag:", CFSTR("FileDeletedWhileScanning"));
              v31 = *(void **)(*(_QWORD *)(a1 + 40) + 176);
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "domain"));
              objc_msgSend(v31, "addObject:", v32);

              v33 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "setFlags:mask:forFileID:", 16, -9, v13);
            }
            else if (!+[MBError isError:withCodes:](MBError, "isError:withCodes:", v10, 9, 100, 0)|| (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "flagsForFileID:error:", v13, 0) & 0x10) == 0)
            {
              v34 = +[MBError isError:withCode:](MBError, "isError:withCode:", v10, 105);
              if (!v41)
              {
                if (v34)
                  v35 = CFSTR("No space left on host");
                else
                  v35 = CFSTR("Multiple errors uploading files");
                if (v34)
                  v36 = 105;
                else
                  v36 = 104;
                v41 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v36, v35));
              }
            }
            objc_sync_exit(v24);

          }
          objc_autoreleasePoolPop(v9);
        }
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v43);
    }
    else
    {
      v41 = 0;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_100028920(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10002A73C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "prefixDirectories"));
  v9 = objc_msgSend(v8, "containsObject:", v5);

  if ((v9 & 1) == 0)
  {
    v10 = MBBackupMetadataFilenames();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v11, "containsObject:", v5);

    if ((v12 & 1) == 0)
    {
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", v5));
      v15 = objc_msgSend(v13, "setFlags:forFileID:", 32, v14);

    }
  }
  objc_autoreleasePoolPop(v7);

  return 1;
}

void sub_10002B50C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002BC14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002C1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10002C1DC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  _BOOL8 v14;
  void *v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  uint8_t buf[4];
  id v30;

  v5 = a2;
  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  v8 = MBBackupMetadataFilenames();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v9, "containsObject:", v5);

  if ((v10 & 1) != 0
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "prefixDirectories")),
        v12 = objc_msgSend(v11, "containsObject:", v5),
        v11,
        (v12 & 1) != 0))
  {
    v13 = 0;
LABEL_4:
    v14 = 1;
    goto LABEL_5;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", v5));
  v16 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v17 + 40);
  v18 = objc_msgSend(v16, "containsRegularFileForFileID:error:", v13, &obj);
  objc_storeStrong((id *)(v17 + 40), obj);
  v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v14 = v21 == 0;
  if (!v21 && (v18 & 1) == 0)
  {
    v22 = MBGetDefaultLog(v19, v20);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Removed from backup: %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Removed from backup: %@", v5);
    }

    if (v13)
    {
      v24 = 0;
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "settingsContext"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "driveBackupDir"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingPathComponent:", v5));

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MBBackupOperation backupOperationWithType:domain:fileID:path:size:](MBBackupOperation, "backupOperationWithType:domain:fileID:path:size:", *(unsigned int *)(a1 + 56), 0, v13, v24, 0));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "addOperation:", v27);

    goto LABEL_4;
  }
LABEL_5:

  objc_autoreleasePoolPop(v7);
  return v14;
}

uint64_t start(int a1, char *const *a2)
{
  uint64_t IsRunningInDaemon;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  MBDeviceManager *v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint8_t buf[4];
  uint64_t v26;

  IsRunningInDaemon = MBSetIsRunningInDaemon();
  MBLogEnableFileLogging(IsRunningInDaemon);
  v5 = 2;
  do
  {
    while (1)
    {
      v6 = getopt_long(a1, a2, "hkl", (const option *)&off_1000F97E0, 0);
      if (v6 <= 106)
        break;
      if (v6 == 107)
      {
        v5 = 0;
      }
      else if (v6 == 108)
      {
        v5 = 1;
      }
    }
    if (v6 == -1)
    {
      v7 = objc_alloc_init((Class)NSAutoreleasePool);
      v9 = MBGetDefaultLog(v7, v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = MBDeviceUDID_Legacy();
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device UDID: %@", buf, 0xCu);
        v10 = MBDeviceUDID_Legacy();
        _MBLog(CFSTR("DEFAULT"), "Device UDID: %@", v10);
      }
      atexit_b(&stru_1000D9650);
      v11 = +[MBDeviceManager deviceManagerWithCheckinMethod:](MBDeviceManager, "deviceManagerWithCheckinMethod:", v5);
      v12 = -[MBDeviceManager open](v11, "open");
      if (v12)
      {
        v14 = v12;
        v15 = MBGetDefaultLog(v12, v13);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = (uint64_t)v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error opening connection: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Error opening connection: %@", v14);
        }
        sub_100004444(1);
      }
      v16 = -[MBDeviceManager run](v11, "run");
      if (v16)
      {
        v18 = v16;
        v19 = MBGetDefaultLog(v16, v17);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = (uint64_t)v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error running connection: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Error running connection: %@", v18);
        }
        sub_100004444(1);
      }
      v20 = -[MBDeviceManager close](v11, "close");
      if (v20)
      {
        v22 = v20;
        v23 = MBGetDefaultLog(v20, v21);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = (uint64_t)v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Error closing connection: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Error closing connection: %@", v22);
        }
        sub_100004444(1);
      }
      objc_msgSend(v7, "drain");
      sub_100004444(0);
    }
  }
  while (v6 != 104);
  printf("Usage: %s [options]\n\n  -k, --lockdown   check-in with lockdown\n  -l, --launchd    check-in with launchd\n  -h, --help       print this message and exit\n", *(const char **)a2);
  return 0;
}

void sub_10002EB7C(id a1, BOOL a2, NSError *a3)
{
  NSObject *v4;
  uint8_t buf[4];
  NSError *v6;

  if (!a2)
  {
    v4 = MBGetDefaultLog(a1, a2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v6 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to save account: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Failed to save account: %@", a3);
    }
  }
}

id sub_10002ED44(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)DLGetDeviceLinkConnectionContext();
  return objc_msgSend(v3, "_acceptFailedCallback:", a2);
}

id sub_10002ED68(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)DLGetDeviceLinkConnectionContext();
  return objc_msgSend(v3, "_disconnectCallback:", a2);
}

id sub_10002ED8C(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)DLGetDeviceLinkConnectionContext();
  return objc_msgSend(v3, "_processMessageCallback:", a2);
}

void sub_1000302D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000302EC(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("MBPrefetchPath", v4);
  v3 = (void *)qword_1000F9DF8;
  qword_1000F9DF8 = (uint64_t)v2;

}

uint64_t sub_10003033C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10003034C(uint64_t a1)
{

}

void sub_100030354(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  int v20;

  v2 = mkpath_np(*(const char **)(a1 + 56), 0x1C0u);
  if ((_DWORD)v2 != 17)
  {
    if ((_DWORD)v2)
    {
      v7 = MBGetDefaultLog(v2, v3);
      v5 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *__error();
        *(_DWORD *)buf = 138412546;
        v18 = v8;
        v19 = 1024;
        v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "mkdir failed at %@: %{errno}d", buf, 0x12u);
        v10 = *(_QWORD *)(a1 + 32);
        v16 = *__error();
        _MBLog(CFSTR("ERROR"), "mkdir failed at %@: %{errno}d", v10, v16);
      }
    }
    else
    {
      v4 = MBGetDefaultLog(v2, v3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Created the directory at %@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Created the directory at %@", *(_QWORD *)(a1 + 32));
      }
    }

  }
  v11 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:"));
  }
  else
  {
    v13 = MBCreateTemporaryFilePathIn(v11);
    v12 = objc_claimAutoreleasedReturnValue(v13);
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v12;

}

void sub_100033C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100033CDC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100033CEC(uint64_t a1)
{

}

uint64_t sub_100033CF4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  id obj;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  if (!objc_msgSend(v3, "isRegularFile"))
    goto LABEL_21;
  v5 = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldRestoreContentWithFile:quiet:", v3, 1))
  {
    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[26];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugContext"));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v9 + 40);
    v10 = objc_msgSend(v7, "restoreBehaviorForFile:debugContext:error:", v3, v8, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);

    if (v10 == (id)1)
    {
      v5 = 0;
      LOBYTE(a1) = 1;
      goto LABEL_22;
    }
    if (v10 == (id)-1)
    {
      v5 = 0;
      LOBYTE(a1) = 0;
      goto LABEL_22;
    }
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "inodeNumber")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "fetchFileWithID:error:", v13, 0));
      if (!v14)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("MBDriveRestoreEngine.m"), 664, CFSTR("Restored file not found: %@"), v13);

      }
      v15 = objc_msgSend(v14, "lastModified");
      if (v15 == objc_msgSend(v3, "lastModified"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "volumeMountPoint"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "volumeMountPoint"));
        v20 = objc_msgSend(v17, "isEqualToString:", v19);

        if ((v20 & 1) != 0)
        {
          v21 = 1;
          goto LABEL_18;
        }
LABEL_15:
        if ((unint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - 31) >= 0xFFFFFFFFFFFFFFE0)
        {
          v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          if (!(((unint64_t)objc_msgSend(v3, "size") + v24) >> 26))
            goto LABEL_19;
        }
        v21 = 0;
LABEL_18:
        v25 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToDownloadFilesWithCount:size:](MBDriveOperation, "operationToDownloadFilesWithCount:size:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));
        objc_msgSend(v25, "addOperation:", v26);

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        if ((v21 & 1) != 0)
        {
LABEL_20:

LABEL_21:
          v5 = 1;
          goto LABEL_22;
        }
LABEL_19:
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v3, "size");
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) += objc_msgSend(v3, "size");
        goto LABEL_20;
      }
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
      v22 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "inodeNumber")));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v14, v23);

    }
    goto LABEL_15;
  }
LABEL_22:
  objc_autoreleasePoolPop(v4);

  return (v5 | a1) & 1;
}

void sub_1000351F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100035258(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  char *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  char v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  char *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unsigned __int8 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  unsigned int v78;
  uint64_t v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  unsigned int v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v124;
  void *v125;
  unsigned int v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id obj;
  uint8_t buf[4];
  const char *v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  void *v139;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  if (!objc_msgSend(*(id *)(a1 + 32), "_shouldRestoreContentWithFile:quiet:", v3, 0))
  {
LABEL_75:
    v9 = 1;
    goto LABEL_83;
  }
  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[26];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "debugContext"));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v8 + 40);
  v9 = (uint64_t)objc_msgSend(v6, "restoreBehaviorForFile:debugContext:error:", v3, v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);

  if (v9 != 1)
  {
    if (v9 == -1)
    {
LABEL_82:
      v9 = 0;
      goto LABEL_83;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "persona"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "restorePathForRestorable:", v3));

    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relativePath"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "validateRestoreDomain:relativePath:", v13, v14));
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    if (v15)
    {
LABEL_81:

      goto LABEL_82;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relativePath"));
    v19 = objc_msgSend(v18, "length");

    if (!v19)
    {
      v20 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByDeletingLastPathComponent"));
      v22 = MBGetDefaultLog(v20, v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v135 = v20;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Creating directory: %@", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Creating directory: %@", v20);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v132 = 0;
      v25 = objc_msgSend(v24, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v132);
      v26 = v132;

      if ((v25 & 1) == 0)
      {
        v52 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 102, v26, v20, CFSTR("Error creating directory")));
        v53 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v54 = *(id *)(v53 + 40);
        *(_QWORD *)(v53 + 40) = v52;
LABEL_80:

        goto LABEL_81;
      }

    }
    v27 = objc_msgSend(v3, "isDirectory");
    if ((_DWORD)v27)
    {
      v29 = MBGetDefaultLog(v27, v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
        *(_DWORD *)buf = 138412546;
        v135 = v31;
        v136 = 2112;
        v137 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Restoring directory: %@ (%@)", buf, 0x16u);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
        _MBLog(CFSTR("INFO"), "Restoring directory: %@ (%@)", v33, v34);

      }
      v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "restoreDirectoryAtPath:settingDataProtection:", v11, 1));
      goto LABEL_24;
    }
    if (!objc_msgSend(v3, "isRegularFile"))
    {
      v41 = objc_msgSend(v3, "isSymbolicLink");
      if (!(_DWORD)v41)
      {
        v35 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("Invalid file type: 0%o"), objc_msgSend(v3, "type")));
LABEL_24:
        v55 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v20 = *(char **)(v55 + 40);
        *(_QWORD *)(v55 + 40) = v35;
        goto LABEL_71;
      }
      v43 = MBGetDefaultLog(v41, v42);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
        *(_DWORD *)buf = 138412546;
        v135 = v45;
        v136 = 2112;
        v137 = v46;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Restoring symbolic link: %@ (%@)", buf, 0x16u);

        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
        _MBLog(CFSTR("INFO"), "Restoring symbolic link: %@ (%@)", v47, v48);

      }
      v20 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "target"));
      v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "restoreSymbolicLinkAtPath:withTarget:", v11, v20));
      v50 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v51 = *(void **)(v50 + 40);
      *(_QWORD *)(v50 + 40) = v49;

LABEL_71:
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
        v115 = objc_msgSend(v114, "isAppDomain");

        if (v115)
        {
          v116 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
          v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "containerID"));
          objc_msgSend(v116, "addObject:", v118);

        }
        goto LABEL_75;
      }
      goto LABEL_81;
    }
    v36 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "inodeNumber")));
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v37));

    if (!v26
      || (v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID")),
          v39 = objc_msgSend(v26, "isEqualToFileID:", v38),
          v38,
          (v39 & 1) != 0))
    {
      v20 = 0;
      v40 = 0;
LABEL_43:
      if (objc_msgSend(*(id *)(a1 + 32), "encrypted"))
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "encryptionKey"));

        if (!v81)
        {
          v54 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
          v119 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("Encryption key missing: %@ (%@)"), v3, v54));
          v120 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v98 = *(NSObject **)(v120 + 40);
          *(_QWORD *)(v120 + 40) = v119;
LABEL_79:

          goto LABEL_80;
        }
      }
      if (!v20
        && (char *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") - 31 >= (char *)0xFFFFFFFFFFFFFFE0)
      {
        v82 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        if (!(((unint64_t)objc_msgSend(v3, "size") + v82) >> 26))
          goto LABEL_61;
      }
      v83 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_restoreRegularFiles:size:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));
      v84 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v85 = *(void **)(v84 + 40);
      *(_QWORD *)(v84 + 40) = v83;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeAllObjects");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 40), "count");
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      if (!v20)
      {
LABEL_61:
        if ((v40 & 1) == 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v3);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v3, "size");
        }
        goto LABEL_70;
      }
      v129 = v26;
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "persona"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "restorePathForRestorable:", v20));

      v54 = objc_retainAutorelease(v87);
      v88 = (const char *)objc_msgSend(v54, "fileSystemRepresentation");
      if (!v88)
        sub_100088080();
      v89 = v88;
      v127 = objc_retainAutorelease(v11);
      v90 = (const char *)objc_msgSend(v127, "fileSystemRepresentation");
      if (!v90)
        sub_1000880A8();
      v92 = v90;
      v93 = MBGetDefaultLog(v90, v91);
      v94 = objc_claimAutoreleasedReturnValue(v93);
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
        *(_DWORD *)buf = 136315650;
        v135 = v89;
        v136 = 2080;
        v137 = (void *)v92;
        v138 = 2112;
        v139 = v95;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_INFO, "Restoring hard link from %s to %s (%@)", buf, 0x20u);

        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
        _MBLog(CFSTR("INFO"), "Restoring hard link from %s to %s (%@)", v89, v92, v96);

      }
      if (!link(v89, v92))
      {
LABEL_69:

        v26 = v129;
LABEL_70:

        goto LABEL_71;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "isDeviceTransferEngine")
        && _os_feature_enabled_impl("MobileBackup", "D2DHardLinksAndClones"))
      {
        if (*__error() != 17 || (objc_msgSend(v54, "isEqualToString:", v127) & 1) != 0)
          goto LABEL_69;
        v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v130 = 0;
        v126 = objc_msgSend(v97, "removeItemAtPath:error:", v127, &v130);
        v98 = v130;

        if (v126)
        {
          if (link(v89, v92))
          {
            v101 = objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v127, CFSTR("hard link error: %@"), v54));
            v102 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v103 = *(void **)(v102 + 40);
            *(_QWORD *)(v102 + 40) = v101;

LABEL_78:
            v26 = v129;
            goto LABEL_79;
          }
          goto LABEL_68;
        }
        v124 = MBGetDefaultLog(v99, v100);
        v112 = objc_claimAutoreleasedReturnValue(v124);
        if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v135 = (const char *)v127;
          v136 = 2112;
          v137 = v98;
          _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "Failed to remove existing hard link at %@: %@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "Failed to remove existing hard link at %@: %@", v127, v98);
        }
      }
      else
      {
        if (*__error() != 17
          || (v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v89)),
              v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v92)),
              v106 = objc_msgSend(v104, "isEqualToString:", v105),
              v105,
              v104,
              !v106))
        {
          v121 = objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v127, CFSTR("link error to \"%@\""), v54));
          v122 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v98 = *(NSObject **)(v122 + 40);
          *(_QWORD *)(v122 + 40) = v121;
          goto LABEL_78;
        }
        v109 = MBGetDefaultLog(v107, v108);
        v98 = objc_claimAutoreleasedReturnValue(v109);
        if (!os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
          goto LABEL_68;
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "name"));
        *(_DWORD *)buf = 138412546;
        v135 = (const char *)v54;
        v136 = 2112;
        v137 = v111;
        _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Ignoring spurious hard link at %@ for %@", buf, 0x16u);

        v112 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
        v113 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject name](v112, "name"));
        _MBLog(CFSTR("DEFAULT"), "Ignoring spurious hard link at %@ for %@", v54, v113);

      }
LABEL_68:

      goto LABEL_69;
    }
    v56 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
    v57 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v131 = *(id *)(v57 + 40);
    v128 = v26;
    v20 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "fetchFileWithID:error:", v26, &v131));
    objc_storeStrong((id *)(v57 + 40), v131);
    if (!v20)
    {
      v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v125, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("MBDriveRestoreEngine.m"), 864, CFSTR("Restored file not found: %@"), v26);

    }
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "domain"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "volumeMountPoint"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "volumeMountPoint"));
    v62 = objc_msgSend(v59, "isEqualToString:", v61);

    if ((v62 & 1) == 0)
    {
      v65 = MBGetDefaultLog(v63, v64);
      v66 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "Not hard linking files with same inode number because they are on different volumes", buf, 2u);
        _MBLog(CFSTR("INFO"), "Not hard linking files with same inode number because they are on different volumes");
      }

      v20 = 0;
    }
    v67 = objc_msgSend(v20, "lastModified");
    v68 = objc_msgSend(v3, "lastModified");
    if (v67 != v68)
    {
      v70 = MBGetDefaultLog(v68, v69);
      v71 = objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "Not hard linking files with same inode number because modification times differ", buf, 2u);
        _MBLog(CFSTR("INFO"), "Not hard linking files with same inode number because modification times differ");
      }

      v20 = 0;
    }
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "domain"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "name"));
    if (objc_msgSend(v73, "isEqualToString:", CFSTR("HomeKitDomain")))
    {

    }
    else
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "name"));
      v78 = objc_msgSend(v77, "isEqualToString:", CFSTR("HomeKitDomain"));

      if (!v78)
      {
        v40 = 0;
LABEL_42:
        v26 = v128;
        goto LABEL_43;
      }
    }
    v79 = MBGetDefaultLog(v74, v75);
    v80 = objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "Not hard linking known duplicate file in HomeKitDomain", buf, 2u);
      _MBLog(CFSTR("INFO"), "Not hard linking known duplicate file in HomeKitDomain");
    }

    v20 = 0;
    v40 = 1;
    goto LABEL_42;
  }
LABEL_83:
  objc_autoreleasePoolPop(v4);

  return v9;
}

void sub_100038208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100038240(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id obj;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[26];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "debugContext"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v5, "restoreBehaviorForFile:debugContext:error:", v3, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);

  if (v8 == (id)1)
    goto LABEL_7;
  if (v8 == (id)-1)
  {
    v9 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v3, "isDirectory"))
  {
LABEL_7:
    v9 = 1;
    goto LABEL_8;
  }
  v9 = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldRestoreContentWithFile:quiet:", v3, 1))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "persona"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "restorePathForRestorable:", v3));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(id *)(v12 + 40);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000383B8;
    v14[3] = &unk_1000D9728;
    v15 = v3;
    v9 = (uint64_t)objc_msgSend(v11, "mb_openatWithFlags:error:setupDir:itemAccessor:", 256, &v16, 0, v14);
    objc_storeStrong((id *)(v12 + 40), v16);

  }
LABEL_8:

  return v9;
}

id sub_1000383B8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "restoreLastModifiedWithFD:", a2);
}

MBError *sub_1000397BC(void *a1, void *a2, SEL sel, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  double v8;
  double v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  double v21;
  double v22;
  MBError *v23;
  id v24;
  uint64_t v25;
  double v26;
  double v27;
  NSObject *v28;
  double v29;
  MBError *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  double v34;
  double v35;
  uint64_t v36;
  NSObject *v37;
  double v38;
  const char *Name;
  const char *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  double v53;
  _BYTE v54[128];

  Name = sel_getName(sel);
  v7 = MBGetDefaultLog(Name, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v49 = Name;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting to notify plugins of %{public}s", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Starting to notify plugins of %{public}s", Name);
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v9 = v8;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(a2);
        v15 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v16 = objc_autoreleasePoolPush();
        if (objc_msgSend(a1, "isCanceled"))
        {
          v23 = +[MBError errorWithCode:description:](MBError, "errorWithCode:description:", 202, CFSTR("Canceled"));
LABEL_25:
          objc_autoreleasePoolPop(v16);
          goto LABEL_26;
        }
        if ((objc_opt_respondsToSelector(v15, sel) & 1) != 0)
        {
          v43 = v12;
          v17 = (objc_class *)objc_opt_class(v15);
          v18 = class_getName(v17);
          v20 = MBGetDefaultLog(v18, v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136446466;
            v49 = v18;
            v50 = 2082;
            v51 = Name;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Notifying %{public}s of %{public}s", buf, 0x16u);
            _MBLog(CFSTR("INFO"), "Notifying %{public}s of %{public}s", v18, Name);
          }
          +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
          v22 = v21;
          v23 = (MBError *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, v15);
          v24 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
          if (v23)
          {
            v30 = v23;
            v32 = MBGetDefaultLog(v30, v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v49 = v18;
              v50 = 2082;
              v51 = Name;
              v52 = 2112;
              v53 = *(double *)&v23;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to notify %{public}s of %{public}s: %@", buf, 0x20u);
              _MBLog(CFSTR("ERROR"), "Failed to notify %{public}s of %{public}s: %@", v18, Name, v23);
            }
            v12 = v43;
            goto LABEL_25;
          }
          v27 = v26;
          v28 = MBGetDefaultLog(v24, v25);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = v27 - v22;
            *(_DWORD *)buf = 136446722;
            v49 = v18;
            v50 = 2082;
            v51 = Name;
            v52 = 2048;
            v53 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Notified %{public}s of %{public}s in %0.3fs", buf, 0x20u);
            _MBLog(CFSTR("DEFAULT"), "Notified %{public}s of %{public}s in %0.3fs", v18, Name, *(_QWORD *)&v29);
          }
          v12 = v43 + 1;
        }
        objc_autoreleasePoolPop(v16);
      }
      v11 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
  v23 = 0;
LABEL_26:
  v33 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v35 = v34;
  v37 = MBGetDefaultLog(v33, v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = v35 - v9;
    *(_DWORD *)buf = 134218498;
    v49 = v12;
    v50 = 2082;
    v51 = Name;
    v52 = 2048;
    v53 = v38;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Notified %lu plugins of %{public}s in %0.3fs", buf, 0x20u);
    _MBLog(CFSTR("INFO"), "Notified %lu plugins of %{public}s in %0.3fs", v12, Name, *(_QWORD *)&v38);
  }
  return v23;
}

MBError *sub_100039C34(void *a1, void *a2, const char *a3, uint64_t a4)
{
  _QWORD v5[6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100039C84;
  v5[3] = &unk_1000D9750;
  v5[4] = a4;
  v5[5] = a3;
  return sub_1000397BC(a1, a2, a3, (uint64_t)v5);
}

id sub_100039C84(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performSelector:withObject:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

MBError *sub_100039C90(void *a1, void *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[7];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100039CE4;
  v6[3] = &unk_1000D9778;
  v6[5] = a5;
  v6[6] = a3;
  v6[4] = a4;
  return sub_1000397BC(a1, a2, a3, (uint64_t)v6);
}

id sub_100039CE4(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "performSelector:withObject:withObject:", a1[6], a1[4], a1[5]);
}

void sub_10003A374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;

  v6 = objc_autoreleasePoolPush();
  if (!a2)
    sub_1000880F8();
  v8 = v6;
  v9 = MBGetDefaultLog(v6, v7);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((a3 & 1) != 0)
  {
    if ((_DWORD)v10)
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v24 = v15;
      v25 = 2048;
      v26 = a3;
      v27 = 2112;
      v28 = a2;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: attrs:0x%lx, pathNotToBackup:%@", buf, 0x20u);
      _MBLog(CFSTR("DEFAULT"), "%@: attrs:0x%lx, pathNotToBackup:%@", *(_QWORD *)(a1 + 32), a3, a2);
    }
    v16 = objc_msgSend(*(id *)(a1 + 40), "_standardizePath:fromDomain:", a2, *(_QWORD *)(a1 + 48));
    v17 = *(void **)(a1 + 72);
    goto LABEL_17;
  }
  if ((_DWORD)v10)
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v24 = v12;
    v25 = 2048;
    v26 = a3;
    v27 = 2112;
    v28 = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: attrs:0x%lx, pathToBackup:%@", buf, 0x20u);
    v10 = _MBLog(CFSTR("DEFAULT"), "%@: attrs:0x%lx, pathToBackup:%@", *(_QWORD *)(a1 + 32), a3, a2);
  }
  if ((a3 & 2) != 0 && (*(_DWORD *)(a1 + 80) - 3) >= 0xFFFFFFFE)
  {
    v13 = MBGetDefaultLog(v10, v11);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v24 = v14;
      v25 = 2112;
      v26 = a2;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Skipping redownloadable path: %@", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "%@: Skipping redownloadable path: %@", *(_QWORD *)(a1 + 32), a2);
    }
    goto LABEL_18;
  }
  v18 = objc_msgSend(*(id *)(a1 + 40), "_standardizePath:fromDomain:", a2, *(_QWORD *)(a1 + 48));
  v19 = objc_msgSend(*(id *)(a1 + 56), "containsObject:", v18);
  if (!(_DWORD)v19)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v18);
    v17 = *(void **)(a1 + 64);
    v16 = v18;
LABEL_17:
    objc_msgSend(v17, "addObject:", v16);
    goto LABEL_18;
  }
  v21 = MBGetDefaultLog(v19, v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v24 = v22;
    v25 = 2112;
    v26 = a2;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@: Skipping duplicate path: %@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "%@: Skipping duplicate path: %@", *(_QWORD *)(a1 + 32), a2);
  }
LABEL_18:
  objc_autoreleasePoolPop(v8);
}

void sub_10003AEEC(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v4 = objc_autoreleasePoolPush();
  v5 = objc_msgSend(a2, "purchaserDSID");
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, "isEqualToNumber:", &off_1000E4F08) & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0)
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "addAccountWithDSID:", v6);
      if ((v7 & 1) != 0)
      {
        v9 = objc_msgSend(*(id *)(a1 + 48), "accountWithUniqueIdentifier:", v6);
        if (v9)
        {
          v10 = v9;
          v11 = objc_msgSend(v9, "accountName");
          v12 = objc_msgSend(objc_msgSend(v10, "uniqueIdentifier"), "stringValue");
          v13 = objc_msgSend(v10, "altDSID");
        }
        else
        {
          v15 = objc_msgSend(*(id *)(a1 + 64), "aa_appleAccountWithPersonID:", objc_msgSend(v6, "stringValue"));
          if (!v15)
            goto LABEL_14;
          v16 = v15;
          v11 = objc_msgSend(v15, "username");
          v12 = objc_msgSend(v16, "aa_personID");
          v13 = objc_msgSend(v16, "aa_altDSID");
        }
        objc_msgSend(*(id *)(a1 + 56), "addAppleID:DSID:altDSID:dataClass:", v11, v12, v13, 0);
        if (!*(_BYTE *)(a1 + 72))
          objc_msgSend(*(id *)(a1 + 56), "addAssetDescriptionForAppleID:assetDescription:", v11, objc_msgSend(a2, "localizedNameForContext:", 0));
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      }
      else
      {
        v14 = MBGetDefaultLog(v7, v8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v18 = objc_msgSend(a2, "applicationIdentifier");
          v19 = 2112;
          v20 = v6;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Skipping %@ for account %@", buf, 0x16u);
          _MBLog(CFSTR("INFO"), "Skipping %@ for account %@", objc_msgSend(a2, "applicationIdentifier"), v6);
        }
      }
    }
  }
LABEL_14:
  objc_autoreleasePoolPop(v4);
}

void sub_10003B88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003B8C4(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  __CFRunLoop *Current;
  uint8_t v5[16];

  v3 = MBGetDefaultLog(a1, a2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Springboard is ready for a restore", v5, 2u);
    _MBLog(CFSTR("INFO"), "Springboard is ready for a restore");
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

void sub_10003BF88(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;

  v5 = a3;
  v7 = v5;
  if ((a2 & 1) == 0)
  {
    v8 = MBGetDefaultLog(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "-restoreUserURL failed: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "-restoreUserURL failed: %@", v7);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

BOOL sub_10003C158(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  char v16;
  id v17;
  id v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  MBError *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  MBError *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  _BOOL4 v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  MBError *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  _BOOL8 v49;
  id v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  id v57;
  const char *v58;
  int v59;
  ssize_t v60;
  ssize_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  double v66;
  double v67;
  MBError *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  MBError *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  MBError *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  id v85;
  uint8_t v86[4];
  _BYTE v87[14];
  __int16 v88;
  double v89;
  uint8_t buf[4];
  _BYTE v91[18];

  v7 = a1;
  if (!v7)
    sub_100088198();
  if (!a4)
    sub_1000881C0();
  v9 = v7;
  v10 = MBGetDefaultLog(v7, v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v91 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Saving keychain data to %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Saving keychain data to %@", v9);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR(".tmp"))));
  v14 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");
  v15 = open_dprotected_np(v14, 1538, 1, 0, 256);
  if ((v15 & 0x80000000) != 0)
  {
    v30 = +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *__error(), v13, CFSTR("Error writing keychain temp file (open_dprotected_np)"));
    v31 = (id)objc_claimAutoreleasedReturnValue(v30);
    *a4 = v31;
    v33 = MBGetDefaultLog(v31, v32);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = *a4;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v91 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "open_dprotected_np failed: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "open_dprotected_np failed: %@", *a4);
    }
    goto LABEL_29;
  }
  unlink(v14);
  v85 = 0;
  v16 = _SecKeychainWriteBackupToFileDescriptor(a2, a3, v15, &v85);
  v17 = v85;
  if ((v16 & 1) == 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "domain"));
    if (objc_msgSend(v36, "isEqualToString:", NSOSStatusErrorDomain))
    {
      v37 = objc_msgSend(v17, "code") == (id)-36;

      if (v37)
        v38 = 106;
      else
        v38 = 100;
    }
    else
    {

      v38 = 100;
    }
    v39 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", v38, v17, v13, CFSTR("Error writing keychain temp file")));
    *a4 = v39;
    v41 = MBGetDefaultLog(v39, v40);
    v28 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v42 = *a4;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v91 = v42;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "_SecKeychainWriteBackupToFileDescriptor failed: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "_SecKeychainWriteBackupToFileDescriptor failed: %@", *a4);
    }
    goto LABEL_24;
  }
  v18 = objc_msgSend(v12, "timeIntervalSinceNow");
  v20 = v19;
  v22 = MBGetDefaultLog(v18, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v91 = v15;
    *(_WORD *)&v91[4] = 2048;
    *(double *)&v91[6] = -v20;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Wrote keychain data to anonymous fd (%d) in %.3fs", buf, 0x12u);
    _MBLog(CFSTR("INFO"), "Wrote keychain data to anonymous fd (%d) in %.3fs", v15, -v20);
  }

  if (lseek(v15, 0, 2) <= 0)
  {
    v43 = +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *__error(), v13, CFSTR("Keychain temp file contains no data"));
    v44 = (id)objc_claimAutoreleasedReturnValue(v43);
    *a4 = v44;
    v46 = MBGetDefaultLog(v44, v45);
    v28 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v47 = *a4;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v91 = v47;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "_SecKeychainWriteBackupToFileDescriptor wrote no data: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "_SecKeychainWriteBackupToFileDescriptor wrote no data: %@", *a4);
    }
    goto LABEL_24;
  }
  if (lseek(v15, 0, 0))
  {
    v24 = +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *__error(), v13, CFSTR("lseek error"));
    v25 = (id)objc_claimAutoreleasedReturnValue(v24);
    *a4 = v25;
    v27 = MBGetDefaultLog(v25, v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = *a4;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v91 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to seek to the beginning of the temp file: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Failed to seek to the beginning of the temp file: %@", *a4);
    }
LABEL_24:

    v48 = 1;
    goto LABEL_25;
  }
  v57 = objc_retainAutorelease(v9);
  v58 = (const char *)objc_msgSend(v57, "fileSystemRepresentation");
  v59 = open_dprotected_np(v58, 1537, 1, 0, 256);
  if (v59 <= 0)
  {
    v68 = +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *__error(), v57, CFSTR("Error opening keychain backup (open_dprotected_np)"));
    v69 = (id)objc_claimAutoreleasedReturnValue(v68);
    *a4 = v69;
    v71 = MBGetDefaultLog(v69, v70);
    v28 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v72 = *a4;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v91 = v72;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "open_dprotected_np failed: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "open_dprotected_np failed: %@", *a4);
    }
    goto LABEL_24;
  }
  bzero(buf, 0x1000uLL);
  do
  {
    v60 = read(v15, buf, 0x1000uLL);
    if (v60 < 0)
    {
      v73 = +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *__error(), v13, CFSTR("failed reading keychain temp FD"));
      v74 = (id)objc_claimAutoreleasedReturnValue(v73);
      *a4 = v74;
      v76 = MBGetDefaultLog(v74, v75);
      v77 = objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v78 = *a4;
        *(_DWORD *)v86 = 138412290;
        *(_QWORD *)v87 = v78;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "reading keychain temp FD failed: %@", v86, 0xCu);
        _MBLog(CFSTR("ERROR"), "reading keychain temp FD failed: %@", *a4);
      }

      goto LABEL_49;
    }
    v61 = write(v59, buf, v60);
    if (v61 < 0)
    {
      v79 = +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *__error(), v57, CFSTR("failed writing keychain backup file"));
      v80 = (id)objc_claimAutoreleasedReturnValue(v79);
      *a4 = v80;
      v82 = MBGetDefaultLog(v80, v81);
      v83 = objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        v84 = *a4;
        *(_DWORD *)v86 = 138412290;
        *(_QWORD *)v87 = v84;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "writing keychain backup file failed: %@", v86, 0xCu);
        _MBLog(CFSTR("ERROR"), "writing keychain backup file failed: %@", *a4);
      }

      unlink(v58);
LABEL_49:
      v48 = 1;
      goto LABEL_50;
    }
  }
  while (v60);
  v63 = MBGetDefaultLog(v61, v62);
  v64 = objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
  {
    v65 = v64;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v12, "timeIntervalSinceNow");
      *(_DWORD *)v86 = 67109634;
      *(_DWORD *)v87 = v15;
      *(_WORD *)&v87[4] = 2112;
      *(_QWORD *)&v87[6] = v57;
      v88 = 2048;
      v89 = v20 - v66;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Copied keychain data from anonymous fd (%d) to %@ in %.3fs", v86, 0x1Cu);
    }

    objc_msgSend(v12, "timeIntervalSinceNow");
    _MBLog(CFSTR("INFO"), "Copied keychain data from anonymous fd (%d) to %@ in %.3fs", v15, v57, v20 - v67);
  }

  v48 = 0;
LABEL_50:
  close(v59);
LABEL_25:

  close(v15);
  if (!v48)
  {
    v50 = objc_msgSend(v12, "timeIntervalSinceNow");
    v52 = v51;
    v54 = MBGetDefaultLog(v50, v53);
    v34 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v55 = -v52;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v91 = v9;
      *(_WORD *)&v91[8] = 2048;
      *(double *)&v91[10] = v55;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Exported keychain data to %@ in %.3fs", buf, 0x16u);
      _MBLog(CFSTR("INFO"), "Exported keychain data to %@ in %.3fs", v9, *(_QWORD *)&v55);
    }
LABEL_29:

    v49 = (int)v15 >= 0;
    goto LABEL_30;
  }
  v49 = 0;
LABEL_30:

  return v49;
}

void sub_10003CA80(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x10003CA50);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_10003CB60(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  char v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  unsigned int v42;
  id v44;
  void *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  _BYTE v49[18];

  v7 = a1;
  if (!v7)
    sub_1000881E8();
  if (!a2)
    sub_100088210();
  if (!a4)
    sub_100088238();
  v9 = v7;
  v10 = MBGetDefaultLog(v7, v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v49 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Restoring keychain backup at %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Restoring keychain backup at %@", v9);
  }

  v47 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeychain allPasswordItemsForServices:error:](MBKeychain, "allPasswordItemsForServices:error:", &off_1000E5000, &v47));
  v13 = v47;
  v15 = MBGetDefaultLog(v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v12)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v12, "count");
      v19 = MBStringWithArray(v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v49 = v18;
      *(_WORD *)&v49[4] = 2112;
      *(_QWORD *)&v49[6] = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Preserving %d keychain items: %@", buf, 0x12u);

      v21 = objc_msgSend(v12, "count");
      v22 = MBStringWithArray(v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      _MBLog(CFSTR("DEFAULT"), "Preserving %d keychain items: %@", v21, v23);

    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v49 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unable to fetch keychain items: %@", buf, 0xCu);
    _MBLog(CFSTR("ERROR"), "Unable to fetch keychain items: %@", v13);
  }

  v46 = 0;
  v24 = +[MBProtectionClassUtils getWithPath:error:](MBProtectionClassUtils, "getWithPath:error:", v9, &v46);
  v25 = v46;
  if (v24 == 1)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v9));
    v28 = v27;
    v29 = v27 != 0;
    if (v27)
    {
      v45 = 0;
      v30 = _SecKeychainRestoreBackupFromFileDescriptor(objc_msgSend(v27, "fileDescriptor"), a2, a3, &v45);
      v31 = v45;

      if ((v30 & 1) == 0)
      {
        v34 = MBGetDefaultLog(v32, v33);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v49 = v9;
          *(_WORD *)&v49[8] = 2112;
          *(_QWORD *)&v49[10] = v31;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to restore keychain from %@: %@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "Failed to restore keychain from %@: %@", v9, v31);
        }

        *a4 = 0;
      }
      if (objc_msgSend(v12, "count"))
      {
        v44 = v31;
        v36 = +[MBKeychain addAllPasswordItems:error:](MBKeychain, "addAllPasswordItems:error:", v12, &v44);
        v25 = v44;

        v39 = MBGetDefaultLog(v37, v38);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        v41 = v40;
        if ((v36 & 1) != 0)
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v42 = objc_msgSend(v12, "count");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v49 = v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Added %d preserved keychain items to restored keychain", buf, 8u);
            objc_msgSend(v12, "count");
            _MBLog(CFSTR("DEFAULT"), "Added %d preserved keychain items to restored keychain");
          }
        }
        else if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v49 = v25;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to add preserved password items to keychain: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Failed to add preserved password items to keychain: %@", v25);
        }

      }
      else
      {
        v25 = v31;
      }
    }
    else
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 101, v9, CFSTR("Error reading keychain backup")));
    }

  }
  else
  {
    if (v24 == 255)
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 101, v25, v9, CFSTR("Error getting keychain backup protection class")));
    else
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 1, v9, CFSTR("Unexpected keychain backup protection class: %d"), v24));
    v29 = 0;
    *a4 = v26;
  }

  return v29;
}

void sub_10003F934(_Unwind_Exception *a1)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10003F94C(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x10003F958);
}

NSDictionary *sub_10003F960()
{
  _QWORD v1[6];
  _QWORD v2[6];

  v1[0] = kLockdownUniqueDeviceIDKey;
  v1[1] = kLockdownDeviceNameKey;
  v2[0] = CFSTR("UniqueDeviceID");
  v2[1] = CFSTR("UserAssignedDeviceName");
  v1[2] = kLockdownSerialNumberKey;
  v1[3] = kLockdownProductTypeKey;
  v2[2] = CFSTR("SerialNumber");
  v2[3] = CFSTR("ProductType");
  v1[4] = kLockdownBuildVersionKey;
  v1[5] = kLockdownProductVersionKey;
  v2[4] = CFSTR("BuildVersion");
  v2[5] = CFSTR("ProductVersion");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v2, v1, 6);
}

void sub_10003FFBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSObject *v27;

  if (a2)
  {
    if (a2 == 2)
    {
      v25 = objc_begin_catch(exception_object);
      v27 = MBGetDefaultLog(v25, v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)(v24 - 112) = 138412290;
        *(_QWORD *)(v23 + 4) = v25;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Exception while fetching last backup date: %@", (uint8_t *)(v24 - 112), 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Exception while fetching last backup date: %@");
      }
      objc_end_catch();
    }
    else
    {
      objc_begin_catch(exception_object);
    }
    JUMPOUT(0x10003FF28);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000400D8(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_1000400E8(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t sub_1000400F4(uint64_t a1, void *a2)
{
  unsigned int v4;
  double v5;
  NSNumber *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v12;

  v4 = objc_msgSend(a2, "committed");
  if (v4)
  {
    objc_msgSend(objc_msgSend(a2, "created"), "timeIntervalSinceReferenceDate");
    v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v6;
    v8 = MBGetDefaultLog(v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Backup date is %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Backup date is %@", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    }
  }
  return v4 ^ 1;
}

NSNumber *sub_10004020C(uint64_t a1, void *a2)
{
  NSNumber *result;
  NSNumber *v4;

  result = (NSNumber *)objc_msgSend(objc_msgSend(a2, "backupForUDID:lastModified:", MBDeviceUDID_Legacy(), 0), "snapshots");
  if (result)
  {
    v4 = result;
    result = (NSNumber *)-[NSNumber count](result, "count");
    if (result)
    {
      result = (NSNumber *)objc_msgSend(-[NSNumber lastObject](v4, "lastObject"), "committed");
      if (result)
      {
        result = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)((double)(unint64_t)objc_msgSend(-[NSNumber lastObject](v4, "lastObject"), "committed")+ -978307200.0));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
      }
    }
  }
  return result;
}

void sub_100040888(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x10004077CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_100041534(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x100041464);
  }
  _Unwind_Resume(exc_buf);
}

id sub_100041E24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close:", 0);
}

void sub_1000420A0(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));

}

void sub_10004233C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100042378(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100042388(uint64_t a1)
{

}

void sub_100042390(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;
  id obj;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v4, "close:", &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;

}

void sub_100042694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1000426B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v6 = objc_msgSend(v2, "fetch:", CFSTR("PRAGMA quick_check"));

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == 0;
}

void sub_100042790(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));

  if (v2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
    objc_msgSend(v3, "flush");

  }
}

void sub_100042CF8(id a1, PQLConnection *a2, PQLStatement *a3, NSError *a4)
{
  PQLConnection *v6;
  PQLStatement *v7;
  NSError *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint8_t buf[4];
  PQLStatement *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  NSError *v18;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v10 = MBGetDefaultLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412802;
      v14 = v7;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Sqlite request %@ failed on %@ with error [%@]", buf, 0x20u);
      _MBLog(CFSTR("ERROR"), "Sqlite request %@ failed on %@ with error [%@]", v7, v6, v8);
    }
  }
  else if (v12)
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Sqlite failed on %@ with error [%@]", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), "Sqlite failed on %@ with error [%@]", v6, v8);
  }

  sub_100004444(1);
}

void sub_100042E24()
{
  void *v0;
  void *v1;
  void *v2;

}

void sub_10004359C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000435C8(void *a1, uint64_t a2, void **a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v9;
  _QWORD v10[4];

  v4 = a1;
  v10[0] = CFSTR("CREATE TABLE IF NOT EXISTS Files (fileID TEXT PRIMARY KEY, domain TEXT, relativePath TEXT, flags INTEGER, file BLOB);");
  v10[1] = CFSTR("CREATE INDEX IF NOT EXISTS FilesDomainIdx ON Files(domain);");
  v10[2] = CFSTR("CREATE INDEX IF NOT EXISTS FilesRelativePathIdx ON Files(relativePath);");
  v10[3] = CFSTR("CREATE INDEX IF NOT EXISTS FilesFlagsIdx ON Files(flags);");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 4));
  v9 = CFSTR("CREATE TABLE IF NOT EXISTS Properties (key TEXT PRIMARY KEY, value BLOB);");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  if (sub_100047074(v4, v5, a3))
    v7 = sub_100047074(v4, v6, a3);
  else
    v7 = 0;

  return v7;
}

id sub_1000436D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int v12;
  void *v13;
  id obj;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;

  v3 = a2;
  obj = 0;
  v4 = objc_autoreleasePoolPush();
  v5 = (*((uint64_t (**)(id, _QWORD, id *))&unk_1000D9918 + 3 * *(unsigned int *)(a1 + 48) + 1))(v3, *(_QWORD *)(a1 + 32), &obj);
  objc_autoreleasePoolPop(v4);
  if ((v5 & 1) != 0)
  {
    v8 = objc_msgSend(v3, "setUserVersion:", *(unsigned int *)(a1 + 56));
  }
  else
  {
    v9 = MBGetDefaultLog(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_DWORD *)(a1 + 52);
      v12 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 67109634;
      v17 = v11;
      v18 = 1024;
      v19 = v12;
      v20 = 2112;
      v21 = obj;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Can't migrate from version %d to %d: %@", buf, 0x18u);
      _MBLog(CFSTR("ERROR"), "Can't migrate from version %d to %d: %@", *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), obj);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
    objc_msgSend(v13, "close:", 0);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
    v8 = 0;
  }

  return v8;
}

void sub_10004393C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100043950(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_100043AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100043AFC(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v3 = objc_msgSend(v2, "execute:args:", *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 56));

  if ((v3 & 1) == 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastError"));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void sub_100043CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100043CC8(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v3 = objc_msgSend(v2, "fetch:args:", *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 64));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = objc_msgSend(v3, "enumerateObjectsOfClass:", objc_opt_class(*(_QWORD *)(a1 + 72)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(v5);
      v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8);
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 1;
      v10 = *(void **)(a1 + 32);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100043F20;
      v18[3] = &unk_1000D99A0;
      v20 = &v21;
      v11 = *(id *)(a1 + 48);
      v18[4] = v9;
      v19 = v11;
      objc_msgSend(v10, "performCallbackOnQueue:", v18);
      LOBYTE(v10) = *((_BYTE *)v22 + 24) == 0;

      _Block_object_dispose(&v21, 8);
      if ((v10 & 1) != 0)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastError"));
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  if (objc_msgSend(*(id *)(a1 + 32), "_isNotFoundError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

  }
}

void sub_100043F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100043F20(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_1000440A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000440C8(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v3 = objc_msgSend(v2, "fetchObjectOfClass:sql:args:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 72));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastError"));

  if (objc_msgSend(*(id *)(a1 + 32), "_isNotFoundError:", v7))
  {

    v7 = 0;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void sub_100045078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10004509C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "string"));
  v10 = objc_msgSend(v2, "fetch:", CFSTR("SELECT flags FROM Files WHERE fileID = %@"), v3);

  if (objc_msgSend(v10, "next"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "unsignedIntAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_isNotFoundError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

void sub_1000452A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000452CC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "string"));
  v10 = objc_msgSend(v2, "fetch:", CFSTR("SELECT COUNT(*) FROM Files WHERE fileID = %@ AND file IS NOT NULL"), v3);

  if (objc_msgSend(v10, "next"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "unsignedIntAtIndex:", 0) != 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_isNotFoundError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

void sub_1000454DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100045500(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "string"));
  v10 = objc_msgSend(v2, "fetch:", CFSTR("SELECT COUNT(*) FROM Files WHERE fileID = %@ AND file IS NULL"), v3);

  if (objc_msgSend(v10, "next"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "unsignedIntAtIndex:", 0) != 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_isNotFoundError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

void sub_100045710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100045734(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "string"));
  v10 = objc_msgSend(v2, "fetch:", CFSTR("SELECT COUNT(*) FROM Files WHERE fileID = %@ AND (flags & %lu) != 0 AND file IS NOT NULL"), v3, 1);

  if (objc_msgSend(v10, "next"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "unsignedIntAtIndex:", 0) != 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_isNotFoundError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

void sub_100045934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100045958(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id obj;
  uint8_t buf[4];
  uint64_t v36;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "string"));
  v4 = objc_msgSend(v2, "fetch:", CFSTR("SELECT file, domain, relativePath FROM Files WHERE fileID = %@ AND file IS NOT NULL"), v3);

  if (objc_msgSend(v4, "next"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "encrypted"))
    {
      v5 = objc_msgSend(v4, "archivedObjectOfClass:atIndex:", objc_opt_class(NSString), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "passwordData"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "salt"));
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v9 + 40);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MBEncryptionUtilities decryptString:withKey:salt:error:](MBEncryptionUtilities, "decryptString:withKey:salt:error:", v6, v7, v8, &obj));
      objc_storeStrong((id *)(v9 + 40), obj);

      if (!v10)
      {
LABEL_14:

        goto LABEL_15;
      }
      v11 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v10, 0);
      v12 = objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(MBFile), NSKeyedArchiveRootObjectKey);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (!v13)
      {
        v31 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Failed to unarchive encrypted file (%@): %@"), *(_QWORD *)(a1 + 40), v6));
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v33 = *(void **)(v32 + 40);
        *(_QWORD *)(v32 + 40) = v31;

        goto LABEL_14;
      }
      v14 = (void *)v13;

    }
    else
    {
      v15 = objc_msgSend(v4, "archivedObjectOfClass:atIndex:", objc_opt_class(MBFile), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringAtIndex:", 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "domainManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "domainForName:", v16));

    if (v18)
    {
      objc_msgSend(v14, "setNonRedirectedDomain:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "domainManager"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "relativePath"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "redirectDomain:forRelativePath:", v18, v22));

      objc_msgSend(v14, "setDomain:", v23);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v14);
    }
    else
    {
      v24 = MBGetDefaultLog(v19, v20);
      v23 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v25 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v36 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "File %@ exists in manifest without a domain entry in manifest properties", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "File %@ exists in manifest without a domain entry in manifest properties", *(_QWORD *)(a1 + 40));
      }
    }

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastError"));
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v27;

  if (objc_msgSend(*(id *)(a1 + 32), "_isNotFoundError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
  {
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = 0;
    goto LABEL_14;
  }
LABEL_15:

}

void sub_100045E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100045E4C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v10 = objc_msgSend(v2, "fetch:", CFSTR("SELECT COUNT(*) From Files WHERE (flags & %lu) = 0 AND file IS NOT NULL"), 54);

  if (objc_msgSend(v10, "next"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v10, "unsignedIntAtIndex:", 0) != 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastError"));
  v5 = objc_msgSend(v4, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_isNotFoundError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

void sub_100045F3C(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v2 = objc_msgSend(v1, "fetch:", CFSTR("SELECT fileID, domain, relativePath, flags From Files WHERE (flags & %lu) = 0 AND file IS NOT NULL"), 54);

  v3 = objc_msgSend(v2, "next");
  if ((_DWORD)v3)
  {
    do
    {
      v5 = MBGetDefaultLog(v3, v4);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringAtIndex:", 0));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringAtIndex:", 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringAtIndex:", 2));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringAtIndex:", 3));
        *(_DWORD *)buf = 138413058;
        v16 = v7;
        v17 = 2112;
        v18 = v8;
        v19 = 2112;
        v20 = v9;
        v21 = 2112;
        v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Referenced File Not In Backup: %@|%@|%@|%@", buf, 0x2Au);

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringAtIndex:", 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringAtIndex:", 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringAtIndex:", 2));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringAtIndex:", 3));
        _MBLog(CFSTR("INFO"), "Referenced File Not In Backup: %@|%@|%@|%@", v11, v12, v13, v14);

      }
      v3 = objc_msgSend(v2, "next");
    }
    while ((v3 & 1) != 0);
  }

}

void sub_1000465E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100046600(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *context;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 *p_buf;
  id obj;
  __int128 buf;
  uint64_t v47;
  char v48;

  context = objc_autoreleasePoolPush();
  v2 = objc_msgSend(*(id *)(a1 + 32), "fetch:", CFSTR("SELECT file, domain, relativePath FROM Files WHERE file IS NOT NULL ORDER BY domain, relativePath ASC"));
  if (!objc_msgSend(v2, "next"))
  {
LABEL_20:
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastError"));
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v37 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = v35;

    if (objc_msgSend(*(id *)(a1 + 40), "_isNotFoundError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
    {
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v39 = *(void **)(v38 + 40);
      *(_QWORD *)(v38 + 40) = 0;

    }
    goto LABEL_22;
  }
  while (1)
  {
    v3 = objc_autoreleasePoolPush();
    if (objc_msgSend(*(id *)(a1 + 40), "encrypted"))
      break;
    v13 = objc_msgSend(v2, "archivedObjectOfClass:atIndex:", objc_opt_class(MBFile), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
LABEL_7:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringAtIndex:", 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "domainManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domainForName:", v14));

    v17 = objc_msgSend(v16, "isUninstalledAppDomain");
    if ((_DWORD)v17)
    {
      v19 = MBGetDefaultLog(v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "File %@ exists in manifest for uninstalled app", (uint8_t *)&buf, 0xCu);
        _MBLog(CFSTR("INFO"), "File %@ exists in manifest for uninstalled app", v12);
      }
LABEL_15:

      goto LABEL_16;
    }
    v21 = objc_msgSend(v12, "setNonRedirectedDomain:", v16);
    if (!v16)
    {
      v29 = MBGetDefaultLog(v21, v22);
      v20 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "File %@ exists in manifest without a domain entry in manifest properties", (uint8_t *)&buf, 0xCu);
        _MBLog(CFSTR("INFO"), "File %@ exists in manifest without a domain entry in manifest properties", v12);
      }
      goto LABEL_15;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "domainManager"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relativePath"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "redirectDomain:forRelativePath:", v16, v24));

    objc_msgSend(v12, "setDomain:", v25);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v47 = 0x2020000000;
    v48 = 1;
    v26 = *(void **)(a1 + 40);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100046B18;
    v41[3] = &unk_1000D99A0;
    p_buf = &buf;
    v43 = *(id *)(a1 + 48);
    v27 = v12;
    v42 = v27;
    objc_msgSend(v26, "performCallbackOnQueue:", v41);
    v28 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) == 0;

    _Block_object_dispose(&buf, 8);
    if (v28)
    {

      objc_autoreleasePoolPop(v3);
      goto LABEL_20;
    }
LABEL_16:

    objc_autoreleasePoolPop(v3);
    if ((objc_msgSend(v2, "next") & 1) == 0)
      goto LABEL_20;
  }
  v4 = objc_msgSend(v2, "archivedObjectOfClass:atIndex:", objc_opt_class(NSString), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "passwordData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "salt"));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v8 + 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MBEncryptionUtilities decryptString:withKey:salt:error:](MBEncryptionUtilities, "decryptString:withKey:salt:error:", v5, v6, v7, &obj));
  objc_storeStrong((id *)(v8 + 40), obj);

  if (!v9)
    goto LABEL_19;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v9, 0);
  v11 = objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(MBFile), NSKeyedArchiveRootObjectKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {

    goto LABEL_7;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringAtIndex:", 1));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringAtIndex:", 2));
  v32 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Failed to unarchive encrypted file (%@:%@): %@"), v30, v31, v5));
  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v34 = *(void **)(v33 + 40);
  *(_QWORD *)(v33 + 40) = v32;

LABEL_19:
  objc_autoreleasePoolPop(v3);
LABEL_22:

  objc_autoreleasePoolPop(context);
}

void sub_100046AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100046B18(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void sub_100046B50(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id obj;
  uint8_t buf[4];
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "close:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0)
  {
    v7 = MBGetDefaultLog(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to close read-only connection to MBManifestDB: %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Failed to close read-only connection to MBManifestDB: %@", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }

  }
}

void sub_100046DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100046E08(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v4 = objc_msgSend(v3, "fetch:", CFSTR("SELECT value FROM Properties WHERE key = %@"), *(_QWORD *)(a1 + 40));

  if (objc_msgSend(v4, "next"))
  {
    v5 = *(_QWORD *)(a1 + 64);
    if (v5 == objc_opt_class(NSData))
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataAtIndex:", 0));
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 64);
      if (v6 == objc_opt_class(NSString))
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringAtIndex:", 0));
      else
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unarchivedObjectOfClass:atIndex:", *(_QWORD *)(a1 + 64), 0));
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pql_database"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastError"));

  if (objc_msgSend(*(id *)(a1 + 32), "_isNotFoundError:", v11))
  {

    v11 = 0;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100047074(void *a1, void *a2, void **a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a1;
  v6 = a2;
  if (!a3)
    sub_100088288();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      if (!objc_msgSend(v5, "executeRaw:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11), (_QWORD)v17))
        break;
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastError"));

    if (v14)
    {
      v15 = *a3;
      *a3 = v14;
      v13 = v14;

      v12 = 0;
      goto LABEL_13;
    }
    v12 = 1;
  }
  else
  {
LABEL_10:
    v12 = 1;
    v13 = v7;
LABEL_13:

  }
  return v12;
}

uint64_t sub_10004727C(void *a1)
{
  id v1;
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "managementDomain"));
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("swift-playgrounds"));

  if ((v3 & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "appClipMetadata"));
    v4 = v5 != 0;

  }
  return v4;
}

id sub_100047DA8(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *i;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t HasVolumePrefix;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  NSObject *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  NSObject *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  NSObject *v138;
  void *v139;
  void *v140;
  NSObject *v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  void *v147;
  NSObject *v148;
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _QWORD v162[3];
  _QWORD v163[3];
  _BYTE v164[128];
  _QWORD v165[6];
  _QWORD v166[6];
  _QWORD v167[3];
  _QWORD v168[3];
  uint8_t buf[4];
  uint64_t v170;
  __int16 v171;
  NSObject *v172;
  __int16 v173;
  NSObject *v174;
  __int16 v175;
  NSObject *v176;
  _BYTE v177[128];
  _BYTE v178[128];

  v3 = a1;
  v148 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  if (!v6)
  {
    v7 = MBGetDefaultLog(0, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v170 = (uint64_t)v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "app.bundleIdentifier is nil: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "app.bundleIdentifier is nil: %@", v3);
    }

  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6);
  v9 = MBStringForContainerType(1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("ContainerContentClass"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleVersion"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleVersion"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, kCFBundleVersionKey);

  }
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mb_applicationType"));
  v130 = (void *)v13;
  if (v13)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("ApplicationType"));
  }
  else
  {
    v15 = MBGetDefaultLog(0, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v170 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "app.applicationType is nil for \"%@\"", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), "app.applicationType is nil for \"%@\"", v6);
    }

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mb_bundleURL"));
  v129 = v17;
  if (v17)
  {
    v19 = sub_10004ADEC(v17);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("Path"));
  }
  else
  {
    v21 = MBGetDefaultLog(0, v18);
    v20 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v170 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "app.bundleURL is nil for \"%@\"", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "app.bundleURL is nil for \"%@\"", v6);
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataContainerURL"));
  v128 = v22;
  if (v22)
  {
    v24 = sub_10004ADEC(v22);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("Container"));
  }
  else
  {
    v26 = MBGetDefaultLog(0, v23);
    v25 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v170 = v6;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "app.dataContainerURL is nil for \"%@\"", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), "app.dataContainerURL is nil for \"%@\"", v6);
    }
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mb_entitlements"));
  v131 = v27;
  v132 = v6;
  if (!objc_msgSend(v27, "count"))
  {
    v29 = MBGetDefaultLog(0, v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      if (v131)
        v31 = "empty";
      else
        v31 = "nil";
      *(_DWORD *)buf = 136315394;
      v170 = (uint64_t)v31;
      v171 = 2112;
      v172 = v132;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Found %s entitlements dictionary for %@", buf, 0x16u);
      _MBLog(CFSTR("DEBUG"), "Found %s entitlements dictionary for %@", v31, v132);
    }

    v27 = v131;
  }
  if (v27)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("Entitlements"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationExtensionRecords"));
  v33 = objc_msgSend(v32, "count");

  v142 = v3;
  v136 = v4;
  if (v33)
  {
    v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationExtensionRecords"));
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v158, v178, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v159;
      v133 = *(_QWORD *)v159;
      v134 = v34;
      do
      {
        v38 = 0;
        v137 = v36;
        do
        {
          if (*(_QWORD *)v159 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * (_QWORD)v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "dataContainerURL"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mb_bundleURL"));
          v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mb_pluginIdentifier"));
          v147 = (void *)v42;
          v143 = v41;
          if (v40)
          {
            if (v41)
            {
              if (v42)
              {
                v44 = sub_10004ADEC(v41);
                v45 = objc_claimAutoreleasedReturnValue(v44);
                v46 = sub_10004ADEC(v40);
                v47 = objc_claimAutoreleasedReturnValue(v46);
                v141 = v45;
                if (v45)
                {
                  v140 = (void *)v47;
                  if (v47)
                  {
                    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mb_entitlements"));
                    if (!v49)
                    {
                      v51 = MBGetDefaultLog(0, v50);
                      v52 = objc_claimAutoreleasedReturnValue(v51);
                      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v170 = (uint64_t)v147;
                        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "Plugin %@ found without entitlements.", buf, 0xCu);
                        _MBLog(CFSTR("DEBUG"), "Plugin %@ found without entitlements.", v147);
                      }

                      v49 = &__NSDictionary0__struct;
                    }
                    v138 = v49;
                    v139 = v38;
                    v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                    v154 = 0u;
                    v155 = 0u;
                    v156 = 0u;
                    v157 = 0u;
                    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "groupContainerURLs"));
                    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v154, v177, 16);
                    if (v54)
                    {
                      v55 = v54;
                      v56 = *(_QWORD *)v155;
                      v145 = v53;
                      do
                      {
                        for (i = 0; i != v55; i = (char *)i + 1)
                        {
                          if (*(_QWORD *)v155 != v56)
                            objc_enumerationMutation(v53);
                          v58 = *(NSObject **)(*((_QWORD *)&v154 + 1) + 8 * (_QWORD)i);
                          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "groupContainerURLs"));
                          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", v58));

                          if (v60)
                          {
                            v63 = sub_10004ADEC(v60);
                            v64 = objc_claimAutoreleasedReturnValue(v63);
                            v66 = v64;
                            if (v64)
                            {
                              HasVolumePrefix = MBPathHasVolumePrefix(v64, v148);
                              if ((HasVolumePrefix & 1) != 0)
                              {
                                v168[0] = v58;
                                v167[0] = kCFBundleIdentifierKey;
                                v167[1] = CFSTR("ContainerContentClass");
                                v69 = MBStringForContainerType(3);
                                v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
                                v167[2] = CFSTR("Container");
                                v168[1] = v70;
                                v168[2] = v66;
                                v71 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v168, v167, 3));

                                objc_msgSend(v144, "addObject:", v71);
                              }
                              else
                              {
                                v74 = MBGetDefaultLog(HasVolumePrefix, v68);
                                v71 = objc_claimAutoreleasedReturnValue(v74);
                                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 138413058;
                                  v170 = (uint64_t)v147;
                                  v171 = 2112;
                                  v172 = v58;
                                  v173 = 2112;
                                  v174 = v66;
                                  v175 = 2112;
                                  v176 = v148;
                                  _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ at %@ does not reside on the user data volume %@ - will not be backed up", buf, 0x2Au);
                                  v53 = v145;
                                  _MBLog(CFSTR("DEFAULT"), "Plugin %@ groupContainer %@ at %@ does not reside on the user data volume %@ - will not be backed up", v147, v58, v66, v148);
                                }
                              }
                            }
                            else
                            {
                              v73 = MBGetDefaultLog(0, v65);
                              v71 = objc_claimAutoreleasedReturnValue(v73);
                              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138412546;
                                v170 = (uint64_t)v147;
                                v171 = 2112;
                                v172 = v58;
                                _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ found with a nil SanitizedFilesystemRepresentation for container - will not be backed up", buf, 0x16u);
                                v53 = v145;
                                _MBLog(CFSTR("DEFAULT"), "Plugin %@ groupContainer %@ found with a nil SanitizedFilesystemRepresentation for container - will not be backed up", v147, v58, v126, v127);
                              }
                            }

                          }
                          else
                          {
                            v72 = MBGetDefaultLog(v61, v62);
                            v66 = objc_claimAutoreleasedReturnValue(v72);
                            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138412546;
                              v170 = (uint64_t)v147;
                              v171 = 2112;
                              v172 = v58;
                              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ found without a container - will not be backed up", buf, 0x16u);
                              _MBLog(CFSTR("DEFAULT"), "Plugin %@ groupContainer %@ found without a container - will not be backed up", v147, v58);
                            }
                          }

                        }
                        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v154, v177, 16);
                      }
                      while (v55);
                    }

                    v166[0] = v147;
                    v165[0] = kCFBundleIdentifierKey;
                    v165[1] = CFSTR("ContainerContentClass");
                    v75 = MBStringForContainerType(2);
                    v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
                    v166[1] = v76;
                    v77 = v140;
                    v166[2] = v141;
                    v165[2] = CFSTR("Path");
                    v165[3] = CFSTR("Container");
                    v166[3] = v140;
                    v78 = v138;
                    v166[4] = v138;
                    v165[4] = CFSTR("Entitlements");
                    v165[5] = CFSTR("GroupContainers");
                    v166[5] = v144;
                    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v166, v165, 6));

                    v80 = v141;
                    objc_msgSend(v135, "addObject:", v79);

                    v4 = v136;
                    v36 = v137;
                    v37 = v133;
                    v34 = v134;
                    v38 = v139;
                  }
                  else
                  {
                    v85 = MBGetDefaultLog(0, v48);
                    v78 = objc_claimAutoreleasedReturnValue(v85);
                    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v170 = (uint64_t)v147;
                      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Plugin %@ found with a nil SanitizedFilesystemRepresentation for dataContainerURL - will not be backed up.", buf, 0xCu);
                      _MBLog(CFSTR("DEFAULT"), "Plugin %@ found with a nil SanitizedFilesystemRepresentation for dataContainerURL - will not be backed up.", v147);
                    }
                    v77 = 0;
                    v80 = v141;
                  }
                }
                else
                {
                  v77 = (void *)v47;
                  v84 = MBGetDefaultLog(v47, v48);
                  v78 = objc_claimAutoreleasedReturnValue(v84);
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v170 = (uint64_t)v147;
                    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Plugin %@ found with a nil SanitizedFilesystemRepresentation for bundleURL - will not be backed up.", buf, 0xCu);
                    _MBLog(CFSTR("DEFAULT"), "Plugin %@ found with a nil SanitizedFilesystemRepresentation for bundleURL - will not be backed up.", v147);
                  }
                  v80 = 0;
                }

              }
              else
              {
                v83 = MBGetDefaultLog(0, v43);
                v80 = objc_claimAutoreleasedReturnValue(v83);
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v170 = 0;
                  v171 = 2112;
                  v172 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a pluginIdentifier (%@) - will not be backed up.", buf, 0x16u);
                  _MBLog(CFSTR("DEFAULT"), "Plugin %@ found without a pluginIdentifier (%@) - will not be backed up.", 0, 0);
                }
              }
            }
            else
            {
              v82 = MBGetDefaultLog(v42, v43);
              v80 = objc_claimAutoreleasedReturnValue(v82);
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v170 = (uint64_t)v147;
                v171 = 2112;
                v172 = 0;
                _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a bundle URL (%@) - will not be backed up.", buf, 0x16u);
                _MBLog(CFSTR("DEFAULT"), "Plugin %@ found without a bundle URL (%@) - will not be backed up.", v147, 0);
              }
            }
          }
          else
          {
            v81 = MBGetDefaultLog(v42, v43);
            v80 = objc_claimAutoreleasedReturnValue(v81);
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v170 = (uint64_t)v147;
              v171 = 2112;
              v172 = 0;
              _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a data container (%@) - will not be backed up.", buf, 0x16u);
              _MBLog(CFSTR("DEFAULT"), "Plugin %@ found without a data container (%@) - will not be backed up.", v147, 0);
            }
          }

          v38 = (char *)v38 + 1;
        }
        while (v38 != v36);
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v158, v178, 16);
      }
      while (v36);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v135, CFSTR("Plugins"));
    v3 = v142;
  }
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupContainerURLs"));
  v87 = objc_msgSend(v86, "count");

  if (v87)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupContainerURLs"));
    v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v150, v164, 16);
    if (v90)
    {
      v91 = v90;
      v92 = *(_QWORD *)v151;
      do
      {
        v93 = 0;
        v146 = v91;
        do
        {
          if (*(_QWORD *)v151 != v92)
            objc_enumerationMutation(v89);
          v94 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * (_QWORD)v93);
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupContainerURLs"));
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", v94));

          if (v96)
          {
            v99 = sub_10004ADEC(v96);
            v100 = objc_claimAutoreleasedReturnValue(v99);
            v102 = v100;
            if (v100)
            {
              v103 = MBPathHasVolumePrefix(v100, v148);
              if ((v103 & 1) != 0)
              {
                v163[0] = v94;
                v162[0] = kCFBundleIdentifierKey;
                v162[1] = CFSTR("ContainerContentClass");
                v105 = MBStringForContainerType(3);
                v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
                v162[2] = CFSTR("Container");
                v163[1] = v106;
                v163[2] = v102;
                v107 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v163, v162, 3));

                objc_msgSend(v88, "addObject:", v107);
              }
              else
              {
                v110 = MBGetDefaultLog(v103, v104);
                v107 = objc_claimAutoreleasedReturnValue(v110);
                if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v170 = (uint64_t)v94;
                  v171 = 2112;
                  v172 = v102;
                  v173 = 2112;
                  v174 = v148;
                  _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "GroupContainer %@ at %@ does not reside on the user data volume %@ - will not be backed up", buf, 0x20u);
                  v91 = v146;
                  _MBLog(CFSTR("DEFAULT"), "GroupContainer %@ at %@ does not reside on the user data volume %@ - will not be backed up", v94, v102, v148);
                }
              }
            }
            else
            {
              v109 = MBGetDefaultLog(0, v101);
              v107 = objc_claimAutoreleasedReturnValue(v109);
              if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v170 = (uint64_t)v94;
                _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "GroupContainer %@ found with a nil SanitizedFilesystemRepresentation for container - will not be backed up", buf, 0xCu);
                _MBLog(CFSTR("DEFAULT"), "GroupContainer %@ found with a nil SanitizedFilesystemRepresentation for container - will not be backed up", v94, v125, v126);
              }
            }

            v3 = v142;
          }
          else
          {
            v108 = MBGetDefaultLog(v97, v98);
            v102 = objc_claimAutoreleasedReturnValue(v108);
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v170 = (uint64_t)v94;
              _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "GroupContainer %@ found without a container - will not be backed up", buf, 0xCu);
              _MBLog(CFSTR("DEFAULT"), "GroupContainer %@ found without a container - will not be backed up", v94);
            }
          }

          v93 = (char *)v93 + 1;
        }
        while (v91 != v93);
        v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v150, v164, 16);
      }
      while (v91);
    }

    v4 = v136;
    objc_msgSend(v136, "setObject:forKeyedSubscript:", v88, CFSTR("GroupContainers"));

  }
  v111 = objc_msgSend(v3, "isPlaceholder");
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v111));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v112, CFSTR("IsPlaceholder"));

  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationState"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v113, "isInstalled")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v114, CFSTR("IsInstalled"));

  if ((v111 & 1) == 0)
  {
    v149 = 0;
    v115 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v132, 1, &v149);
    v116 = v149;
    v117 = objc_msgSend(v115, "hasParallelPlaceholder");
    if ((_DWORD)v117)
    {
      v119 = MBGetDefaultLog(v117, v118);
      v120 = objc_claimAutoreleasedReturnValue(v119);
      if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
      {
        v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
        *(_DWORD *)buf = 138412290;
        v170 = (uint64_t)v121;
        _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_INFO, "%@ has a parallel placeholder", buf, 0xCu);

        v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
        _MBLog(CFSTR("INFO"), "%@ has a parallel placeholder", v122);

      }
      v123 = &__kCFBooleanTrue;
    }
    else
    {
      v123 = &__kCFBooleanFalse;
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v123, CFSTR("IsUpdating"));

  }
  return v4;
}

void sub_100049EAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100049F90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004A3B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10004ADEC(void *a1)
{
  void *v1;
  uint64_t v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation")));
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("/private")))
  {
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length")));

    v1 = (void *)v2;
  }
  return v1;
}

uint64_t sub_10004CA10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10004CA20(uint64_t a1)
{

}

void sub_10004CA28(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id obj;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  if (*(_BYTE *)(a1 + 56))
    v2 = 3145729;
  else
    v2 = 3145734;
  v3 = *(void **)(a1 + 32);
  v4 = *(unsigned __int8 *)(a1 + 57);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "_openWithFlags:usePQLBatching:error:", v2, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v9 = MBGetDefaultLog(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Can't open database at %@: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Can't open database at %@: %@", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    }

  }
}

void sub_10004CCD4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_invalidate:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

void sub_10004CFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10004D034(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;
  id obj;
  uint8_t buf[4];
  uint64_t v11;

  v3 = MBGetDefaultLog(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Closing PQL connection %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Closing PQL connection %@", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40));
  }

  v6 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  v7 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "close:", &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v8;
}

id sub_10004D2B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close:", 0);
}

uint64_t sub_10004D364(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeCorruptDatabaseWithError:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_10004DD84(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10004E568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004E594(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unsigned __int8 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v13 = MBGetDefaultLog(WeakRetained, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412802;
        v29 = v8;
        v30 = 2112;
        v31 = v7;
        v32 = 2112;
        v33 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Sqlite request %@ failed on %@ with error: %@", buf, 0x20u);
        _MBLog(CFSTR("ERROR"), "Sqlite request %@ failed on %@ with error: %@", v8, v7, v9);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 138412546;
      v29 = v7;
      v30 = 2112;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Sqlite failed on %@ with error: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Sqlite failed on %@ with error: %@", v7, v9);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
    v17 = objc_msgSend(v16, "isEqualToString:", PQLSqliteErrorDomain);

    if (v17)
    {
      v18 = (unint64_t)objc_msgSend(v9, "code");
      v20 = v18;
      if (v18 <= 0x1A)
      {
        if (((1 << v18) & 0x1384000) != 0)
          goto LABEL_10;
        if (((1 << v18) & 0x4000800) != 0)
        {
LABEL_16:
          objc_msgSend(v12, "_removeCorruptDatabaseWithError:completion:", v9, &stru_1000D9B50);
          goto LABEL_22;
        }
        if (v18 == 13)
        {
LABEL_18:
          sleep(5u);
          goto LABEL_22;
        }
      }
      if (v18 != 1)
        goto LABEL_22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("SqliteSQL")));

      v26 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
      {
        v27 = objc_msgSend(v25, "isEqualToString:", CFSTR("commit"));

        if ((v27 & 1) != 0)
          goto LABEL_22;
      }
      else
      {

      }
LABEL_10:
      v21 = MBGetDefaultLog(v18, v19);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        v23 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v29 = v23;
        v30 = 2112;
        v31 = v9;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Unexpected SQLite error for db at %@: %@", buf, 0x16u);
        _MBLog(CFSTR("FAULT"), "Unexpected SQLite error for db at %@: %@", *(_QWORD *)(a1 + 32), v9);
      }

      if (v20 != 11)
      {
        if (v20 != 13)
          goto LABEL_22;
        goto LABEL_18;
      }
      goto LABEL_16;
    }
  }
LABEL_22:

}

void sub_10004EDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_10004EDF4(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = (_QWORD *)a1[4];
  v3 = (void *)v2[5];
  if (v3)
  {
    v4 = a1[5];
    v5 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v5 + 40);
    LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *, id *))(v4 + 16))(v4, v3, &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v4;
  }
  else
  {
    v6 = 0;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_invalidatedError"));
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

id sub_10004EFDC(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "groupInTransaction:error:", *(_QWORD *)(a1 + 32), a3);
}

id sub_10004F0F8(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = objc_msgSend(v5, "execute:args:", *(_QWORD *)(a1 + 32), **(_QWORD **)(a1 + 40));
  v7 = v6;
  if (a3 && (v6 & 1) == 0)
    *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastError"));

  return v7;
}

void sub_10004F25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10004F274(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = **(_QWORD **)(a1 + 56);
  v8 = a2;
  v9 = objc_msgSend(v8, "fetchObjectOfClass:sql:args:", v6, v5, v7);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastError"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "excludingNotFound"));

  if (a3)
    *a3 = objc_retainAutorelease(v13);

  return v13 == 0;
}

void sub_10004F424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10004F43C(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = objc_msgSend(v5, "fetchObjectOfClass:sql:args:", objc_opt_class(NSNumber), *(_QWORD *)(a1 + 32), **(_QWORD **)(a1 + 48));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastError"));
  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return v9 == 0;
}

id sub_10004F56C(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "executeStatements:error:", *(_QWORD *)(a1 + 32), a3);
}

void sub_10004F6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10004F6C0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend(a2, "fetch:args:", *(_QWORD *)(a1 + 32), **(_QWORD **)(a1 + 48));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "checkSuccessWithError:", a3);
}

id sub_10004F974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateWithError:block:", a3, *(_QWORD *)(a1 + 40));
}

void sub_10004FFA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005003C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100051E44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000543D8()
{
  objc_end_catch();
  JUMPOUT(0x1000543E0);
}

uint64_t sub_100057890(uint64_t a1, void *a2)
{
  NSString *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  __CFError *v8;
  uint64_t v9;
  __CFError *v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFBoolean *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  const __CFBoolean *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFErrorRef error;
  const __CFBoolean *propertyValueTypeRefPtr;
  id v34;
  id v35;
  uint8_t buf[4];
  NSURLResourceKey v37;
  __int16 v38;
  CFErrorRef v39;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
  v35 = 0;
  v34 = 0;
  v6 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v35, NSURLIsExcludedFromBackupKey, &v34);
  v7 = v35;
  v8 = (__CFError *)v34;
  v10 = v8;
  if ((v6 & 1) != 0)
  {
    if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
      goto LABEL_24;
  }
  else
  {
    v11 = MBGetDefaultLog(v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v37 = NSURLIsExcludedFromBackupKey;
      v38 = 2112;
      v39 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error fetching value for property %{public}@: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Error fetching value for property %{public}@: %@", NSURLIsExcludedFromBackupKey, v10);
    }

  }
  if (*(_BYTE *)(a1 + 40)
    && (objc_msgSend(*(id *)(a1 + 32), "_isEncrypted") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "_isDeviceTransferEngine") & 1) == 0)
  {
    error = 0;
    propertyValueTypeRefPtr = 0;
    v13 = (NSString *)_kCFURLIsExcludedFromUnencryptedBackupKey;
    v23 = CFURLCopyResourcePropertyForKey((CFURLRef)v5, _kCFURLIsExcludedFromUnencryptedBackupKey, &propertyValueTypeRefPtr, &error);
    if (!(_DWORD)v23)
    {
      v30 = MBGetDefaultLog(v23, v24);
      v22 = objc_claimAutoreleasedReturnValue(v30);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      goto LABEL_26;
    }
    v25 = propertyValueTypeRefPtr;
    if (propertyValueTypeRefPtr)
    {
      CFRelease(propertyValueTypeRefPtr);
      if (v25 == kCFBooleanTrue)
      {
        v28 = MBGetDefaultLog(v26, v27);
        v20 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v3;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not restoring from unencrypted iTunes backup (attribute set locally): %@", buf, 0xCu);
          _MBLog(CFSTR("DEFAULT"), "Not restoring from unencrypted iTunes backup (attribute set locally): %@", v3);
        }
        goto LABEL_23;
      }
    }
LABEL_29:
    v29 = 0;
    goto LABEL_30;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_isCloudKitEngine"))
    goto LABEL_29;
  error = 0;
  propertyValueTypeRefPtr = 0;
  v13 = (NSString *)_kCFURLIsExcludedFromCloudBackupKey;
  v14 = CFURLCopyResourcePropertyForKey((CFURLRef)v5, _kCFURLIsExcludedFromCloudBackupKey, &propertyValueTypeRefPtr, &error);
  if (!(_DWORD)v14)
  {
    v21 = MBGetDefaultLog(v14, v15);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
LABEL_26:
    *(_DWORD *)buf = 138543618;
    v37 = v13;
    v38 = 2112;
    v39 = error;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error fetching value for property %{public}@: %@", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), "Error fetching value for property %{public}@: %@", v13, error);
LABEL_27:

    if (error)
      CFRelease(error);
    goto LABEL_29;
  }
  v16 = propertyValueTypeRefPtr;
  if (!propertyValueTypeRefPtr)
    goto LABEL_29;
  CFRelease(propertyValueTypeRefPtr);
  if (v16 != kCFBooleanTrue)
    goto LABEL_29;
  v19 = MBGetDefaultLog(v17, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v3;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not restoring from iCloud (attribute set locally): %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Not restoring from iCloud (attribute set locally): %@", v3);
  }
LABEL_23:

LABEL_24:
  v29 = 1;
LABEL_30:

  objc_autoreleasePoolPop(v4);
  return v29;
}

BOOL sub_100057C74(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  _BOOL8 v13;
  stat v15;

  memset(&v15, 0, sizeof(v15));
  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persona", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0));
  v8 = sub_100057D4C(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v5));
  v11 = objc_retainAutorelease(v10);
  v12 = lstat((const char *)objc_msgSend(v11, "fileSystemRepresentation"), &v15);
  v13 = (v12 | ~v15.st_mode & 0xA000) == 0;

  return v13;
}

id sub_100057D4C(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = a1;
  if ((objc_msgSend(v4, "shouldRestoreToSharedVolume") & 1) != 0)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharedIncompleteRestoreDirectory"));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userIncompleteRestoreDirectory"));
  v6 = (void *)v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v7));

  return v8;
}

id sub_100058994(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startingRestoreWithPolicy:engine:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id sub_100058A50(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "preparingRestoreWithPolicy:engine:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id sub_100058B0C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "endingRestoreWithPolicy:engine:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id sub_100058BF4(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "endedRestoreWithPolicy:engine:error:", a1[4], a1[5], a1[6]);
}

void sub_10005D7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10005D7EC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10005D7FC(uint64_t a1)
{

}

uint64_t sub_10005D804(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  id v28;
  id obj;
  uint8_t buf[4];
  void *v31;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "domain"));
  if ((objc_msgSend(v4, "isEqualToDomain:", v5) & 1) == 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relativePath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "relativePath"));
  v8 = objc_msgSend(v6, "hasPrefix:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "relativePath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relativePath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "relativePath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v12, "length")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v13));

    v14 = objc_msgSend(v3, "isDirectory");
    if ((_DWORD)v14)
    {
      v16 = MBGetDefaultLog(v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Creating directory \"%@\"", buf, 0xCu);
        _MBLog(CFSTR("INFO"), "Creating directory \"%@\"", v4);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "drive"));
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v19 + 40);
      v20 = objc_msgSend(v18, "createDirectoryAtPath:options:error:", v4, 0, &obj);
      objc_storeStrong((id *)(v19 + 40), obj);

      if ((v20 & 1) == 0)
        goto LABEL_14;
    }
    else if (objc_msgSend(v3, "isRegularFile"))
    {
      v23 = *(void **)(a1 + 40);
      v24 = *(_QWORD *)(a1 + 48);
      v25 = *(_QWORD *)(a1 + 56);
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v28 = *(id *)(v26 + 40);
      v27 = objc_msgSend(v23, "_extractWithManifest:file:keybag:toDrivePath:error:", v24, v3, v25, v4, &v28);
      objc_storeStrong((id *)(v26 + 40), v28);
      if (!v27)
      {
LABEL_14:

        v21 = 0;
        goto LABEL_11;
      }
    }
    goto LABEL_9;
  }
LABEL_10:
  v21 = 1;
LABEL_11:

  return v21;
}

void sub_10005DE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10005DE78(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  if (objc_msgSend(v3, "isRegularFile"))
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v3, "size");
    v4 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)objc_msgSend(v8, "longValue") + 1));
      objc_msgSend(v7, "setObject:atIndexedSubscript:", v9, 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)objc_msgSend(v10, "longLongValue") + (_QWORD)objc_msgSend(v3, "size")));
      objc_msgSend(v7, "setObject:atIndexedSubscript:", v11, 1);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v3, "size")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v10, v11, 0));
    }

    v12 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, v14);

  }
  return 1;
}

BOOL sub_10005E25C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  if (v3)
  {
    v34 = v4;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileID"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "digest"));
    if (v5)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "digest"));
      v6 = MBStringWithData(v23);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v6));
      v29 = (const char *)objc_msgSend(v22, "UTF8String");
    }
    else
    {
      v29 = "";
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modeString"));
    v26 = objc_msgSend(v3, "inodeNumber");
    v25 = objc_msgSend(v3, "userID");
    v24 = objc_msgSend(v3, "groupID");
    v7 = *(void **)(a1 + 32);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastModifiedDate"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:"));
    v8 = *(void **)(a1 + 32);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastStatusChangeDate"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:"));
    v33 = a1;
    v9 = *(void **)(a1 + 32);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "birthDate"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:"));
    v10 = objc_msgSend(v3, "size");
    v11 = objc_msgSend(v3, "protectionClass");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relativePath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "target"));
    v31 = (void *)v5;
    if (v15)
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "target"));
    else
      v16 = &stru_1000DBB88;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "extendedAttributes"));
    v18 = MBStringWithDictionary(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %40s, %@, %7lld, %3d, %3d, %@, %@, %@, %10lld, %5d, %@, %@, %@, %@\n"), v32, v29, v38, v26, v25, v24, v37, v36, v35, v10, v11, v13, v14, v16, v19));

    if (v15)
    if (v31)
    {

    }
    objc_msgSend(*(id *)(v33 + 40), "appendString:", v20);

    v4 = v34;
  }
  objc_autoreleasePoolPop(v4);

  return v3 != 0;
}

void sub_10005EA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10005EA34(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  _UNKNOWN **v13;
  char *v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  unsigned __int8 v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unsigned __int8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id obj;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  uint64_t v62;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isUninstalledAppDomain");

  v55 = v3;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relativePath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("var/mobile/Applications/%@/%@"), v7, v8));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absolutePath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", 1));
  }

  v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v9));
  v54 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByDeletingLastPathComponent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathComponents"));

  v12 = (char *)objc_msgSend(v11, "count");
  v13 = &AnalyticsSendEventLazy_ptr;
  if (v12)
  {
    v14 = v12;
    v15 = 0;
    do
    {
      v16 = v13[229];
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subarrayWithRange:", 0, ++v15));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathWithComponents:", v17));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v19));

      if (!v20)
      {
        v23 = MBGetDefaultLog(v21, v22);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v60 = (uint64_t)v19;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Creating directory: %@", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Creating directory: %@", v19);
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "drive"));
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        obj = *(id *)(v26 + 40);
        v27 = objc_msgSend(v25, "createDirectoryAtPath:options:error:", v19, 0, &obj);
        objc_storeStrong((id *)(v26 + 40), obj);

        if ((v27 & 1) == 0
          && !+[MBError isError:withCode:](MBError, "isError:withCode:", *(_QWORD *)(a1 + 56), 3))
        {

          v51 = 0;
          v37 = v54;
          v28 = v55;
          v33 = (void *)v53;
          goto LABEL_26;
        }
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v19);
        v13 = &AnalyticsSendEventLazy_ptr;
      }

    }
    while (v14 != v15);
  }
  v28 = v55;
  v29 = objc_msgSend(v55, "isDirectory");
  if ((_DWORD)v29)
  {
    v31 = MBGetDefaultLog(v29, v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)v53;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v53;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Creating directory: %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Creating directory: %@", v53);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "drive"));
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v57 = *(id *)(v35 + 40);
    v36 = objc_msgSend(v34, "createDirectoryAtPath:options:error:", v53, 0, &v57);
    objc_storeStrong((id *)(v35 + 40), v57);

    v37 = v54;
    if ((v36 & 1) == 0
      && (+[MBError isError:withCode:](MBError, "isError:withCode:", *(_QWORD *)(a1 + 56), 3) & 1) == 0)
    {
LABEL_24:
      v51 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    v33 = (void *)v53;
    v37 = v54;
    if (objc_msgSend(v55, "isRegularFile"))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "driveBackupDir"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "fileID"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "description"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringByAppendingPathComponent:", v40));

      v44 = MBGetDefaultLog(v42, v43);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v60 = (uint64_t)v41;
        v61 = 2112;
        v62 = v53;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Copying: %@ -> %@", buf, 0x16u);
        _MBLog(CFSTR("INFO"), "Copying: %@ -> %@", v41, v53);
      }

      v46 = *(void **)(a1 + 48);
      v47 = *(_QWORD *)(a1 + 64);
      v48 = *(_QWORD *)(a1 + 72);
      v49 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v56 = *(id *)(v49 + 40);
      v50 = objc_msgSend(v46, "_extractWithManifest:file:keybag:toDrivePath:error:", v47, v55, v48, v53, &v56);
      objc_storeStrong((id *)(v49 + 40), v56);

      if (!v50)
        goto LABEL_24;
    }
  }
  v51 = 1;
LABEL_26:

  return v51;
}

void sub_10005F8B8(id a1)
{
  qword_1000F9E38 = (uint64_t)dispatch_queue_create("MBLockdown", 0);
}

uint64_t sub_10005F9BC(uint64_t a1)
{
  uint64_t result;

  result = lockdown_connect();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) != 0;
  return result;
}

uint64_t sub_10005FA58(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v2 + 8);
  if (result)
  {
    result = lockdown_disconnect();
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v2 + 8) = 0;
  return result;
}

void sub_10005FB38(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_10005FB48(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t sub_10005FB54(_QWORD *a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1[4] + 8);
  if (result)
  {
    result = lockdown_copy_value(result, a1[5], a1[6]);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  }
  return result;
}

uint64_t sub_10005FC30(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  MBError *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
  {
    result = lockdown_save_value(result, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    if ((_DWORD)result)
    {
      v4 = (MBError *)result;
      v5 = MBGetDefaultLog(result, v3);
      result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        v6 = *(_QWORD *)(a1 + 40);
        v7 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v9 = v6;
        v10 = 2112;
        v11 = v7;
        v12 = 1024;
        v13 = (int)v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to save object to lockdown with domain '%@', key '%@': %d", buf, 0x1Cu);
        result = _MBLog(CFSTR("ERROR"), "Failed to save object to lockdown with domain '%@', key '%@': %d", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);
      }
      if (*(_QWORD *)(a1 + 72))
      {
        result = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Failed to save object to lockdown"));
        **(_QWORD **)(a1 + 72) = result;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  return result;
}

uint64_t sub_10005FE00(uint64_t a1)
{
  __CFString *v2;
  const __CFString *v3;
  uint64_t result;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.mobile.backup")) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.mobile.ldbackup")) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.purplebuddy")))
  {
    v2 = *(__CFString **)(a1 + 32);
    if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.mobile.backup")))
      v2 = CFSTR("com.apple.mobile.ldbackup");
    v3 = (const __CFString *)kMBMobileUserName;
    CFPreferencesSetValue(*(CFStringRef *)(a1 + 40), 0, v2, kMBMobileUserName, kCFPreferencesAnyHost);
    result = CFPreferencesSynchronize(v2, v3, kCFPreferencesAnyHost);
    if (!(_DWORD)result)
    {
      v6 = MBGetDefaultLog(result, v5);
      result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        v7 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v14 = v2;
        v15 = 2112;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to sync preferences for %@ domain (%@)", buf, 0x16u);
        return _MBLog(CFSTR("ERROR"), "Failed to sync preferences for %@ domain (%@)", v2, *(_QWORD *)(a1 + 40));
      }
    }
  }
  else
  {
    result = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (result)
    {
      result = lockdown_remove_value(result, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      if ((_DWORD)result)
      {
        v9 = result;
        v10 = MBGetDefaultLog(result, v8);
        result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
        if ((_DWORD)result)
        {
          v11 = *(__CFString **)(a1 + 32);
          v12 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412802;
          v14 = v11;
          v15 = 2112;
          v16 = v12;
          v17 = 1024;
          v18 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to remove object from lockdown with domain '%@', key '%@': %d", buf, 0x1Cu);
          result = _MBLog(CFSTR("ERROR"), "Failed to remove object from lockdown with domain '%@', key '%@': %d", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v9);
        }
        if (*(_QWORD *)(a1 + 64))
        {
          result = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Failed to remove object from lockdown"));
          **(_QWORD **)(a1 + 64) = result;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }
    }
  }
  return result;
}

void sub_10006114C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  NSObject *v38;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  v5 = objc_opt_class(LSApplicationProxy);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationType"));
    v8 = objc_msgSend(v7, "isEqualToString:", LSSystemApplicationType);

    if ((v8 & 1) != 0)
      goto LABEL_30;
    v9 = (char *)objc_msgSend(v6, "installType");
    if ((unint64_t)(v9 - 7) > 1)
      goto LABEL_30;
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedPersonas"));
    v13 = objc_msgSend(v12, "count");
    if (v13)
    {
      v15 = MBGetDefaultLog(v13, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v11;
        v35 = 2114;
        v36 = (char *)v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Found app %@ with managed personae: %{public}@", buf, 0x16u);
        _MBLog(CFSTR("DEFAULT"), "Found app %@ with managed personae: %{public}@", v11, v12);
      }

    }
    if (*(_BYTE *)(a1 + 64))
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "purchaserDSID"));
      v18 = objc_msgSend(v12, "count");
      if (!v18 || *(_QWORD *)(a1 + 32) && (v18 = objc_msgSend(v12, "containsObject:"), (v18 & 1) != 0))
      {
        if (objc_msgSend(v12, "count")
          || (v20 = objc_msgSend(*(id *)(a1 + 40), "addAccountWithDSID:", v17), (v20 & 1) != 0))
        {

LABEL_16:
          v24 = MBGetDefaultLog(v22, v23);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v34 = v11;
            v35 = 2048;
            v36 = v10;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Found demoted bundle: %@/%lu", buf, 0x16u);
            _MBLog(CFSTR("DEFAULT"), "Found demoted bundle: %@/%lu", v11, v10);
          }

          if (v10 == (char *)8)
          {
            v26 = *(void **)(a1 + 56);
            goto LABEL_28;
          }
          if (v10 == (char *)7)
          {
            v26 = *(void **)(a1 + 48);
LABEL_28:
            objc_msgSend(v26, "addObject:", v11);
          }
LABEL_29:

LABEL_30:
          goto LABEL_31;
        }
        v32 = MBGetDefaultLog(v20, v21);
        v28 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v34 = v11;
          v35 = 2048;
          v36 = v10;
          v37 = 2112;
          v38 = v17;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Skipping demoted bundle:%@/%lu for DSID %@", buf, 0x20u);
          _MBLog(CFSTR("DEFAULT"), "Skipping demoted bundle:%@/%lu for DSID %@", v11, v10, v17);
        }
      }
      else
      {
        v27 = MBGetDefaultLog(v18, v19);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = *(NSObject **)(a1 + 32);
          *(_DWORD *)buf = 138412802;
          v34 = v11;
          v35 = 2048;
          v36 = v10;
          v37 = 2114;
          v38 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Skipping demoted bundle:%@/%lu for personal persona %{public}@", buf, 0x20u);
          _MBLog(CFSTR("DEFAULT"), "Skipping demoted bundle:%@/%lu for personal persona %{public}@", v11, v10, *(_QWORD *)(a1 + 32));
        }
      }

    }
    else
    {
      v22 = objc_msgSend(v12, "containsObject:", *(_QWORD *)(a1 + 32));
      if ((v22 & 1) != 0)
        goto LABEL_16;
      v30 = MBGetDefaultLog(v22, v23);
      v17 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v31 = *(NSObject **)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v34 = v11;
        v35 = 2048;
        v36 = v10;
        v37 = 2114;
        v38 = v31;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Skipping demoted bundle: %@/%lu for managed persona %{public}@", buf, 0x20u);
        _MBLog(CFSTR("DEFAULT"), "Skipping demoted bundle: %@/%lu for managed persona %{public}@", v11, v10, *(_QWORD *)(a1 + 32));
      }
    }

    goto LABEL_29;
  }
LABEL_31:
  objc_autoreleasePoolPop(v4);

}

void sub_1000626B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100062774(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v13;

  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v5 = MBGetDefaultLog(a1, a2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = a2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Passcode policy evaluation succeeded: %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Passcode policy evaluation succeeded: %@", a2);
    }
  }
  else
  {
    v7 = objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", LAErrorDomain);
    if ((_DWORD)v7 && (v7 = objc_msgSend(a3, "code"), v7 == (id)-5))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      v9 = MBGetDefaultLog(-5, v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Skipping passcode policy evaluation: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Skipping passcode policy evaluation: %@", a3);
      }
    }
    else
    {
      v10 = MBGetDefaultLog(v7, v8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Passcode policy evaluation failed: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Passcode policy evaluation failed: %@", a3);
      }
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000639A0(id a1)
{
  MBKeyBag *v1;
  void *v2;

  v1 = -[MBKeyBag initWithHandle:OTA:]([MBKeyBag alloc], "initWithHandle:OTA:", MKBOTABackupKeyBag(), 1);
  v2 = (void *)qword_1000F9E40;
  qword_1000F9E40 = (uint64_t)v1;

}

uint64_t sub_100066CC0(uint64_t result, char a2, _QWORD *a3)
{
  BOOL v3;

  v3 = (result - 1) < 4 || (_DWORD)result == 7;
  if (!v3 && ((_DWORD)result || (a2 & 1) != 0))
  {
    if (a3)
      *a3 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 241, CFSTR("unsupported protection class (%d)"), result);
    LOBYTE(result) = -1;
  }
  return result;
}

void sub_100067F0C(id a1)
{
  void *v1;

  v1 = (void *)qword_1000F9E50;
  qword_1000F9E50 = (uint64_t)&__NSDictionary0__struct;

}

id sub_10006A80C(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "executeStatements:error:", *(_QWORD *)(a1 + 32), a3);
}

void sub_10006B2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006B2E8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10006B2F8(uint64_t a1)
{

}

id sub_10006B300(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  char v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int v15;
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "upgradeBlock"));
  v17 = 0;
  v6 = ((uint64_t (**)(_QWORD, id, id *))v5)[2](v5, v3, &v17);
  v7 = v17;
  v8 = v17;

  if ((v6 & 1) != 0)
  {
    v11 = objc_msgSend(v3, "setUserVersion:", *(unsigned int *)(a1 + 52));
  }
  else
  {
    v12 = MBGetDefaultLog(v9, v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_DWORD *)(a1 + 48);
      v15 = *(_DWORD *)(a1 + 52);
      *(_DWORD *)buf = 67109634;
      v19 = v14;
      v20 = 1024;
      v21 = v15;
      v22 = 2112;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "=pqldb= Can't migrate from version %d to %d: %@", buf, 0x18u);
      _MBLog(CFSTR("ERROR"), "=pqldb= Can't migrate from version %d to %d: %@", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), v8);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
    v11 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v11;
}

void sub_10006B560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006B578(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, id *))(v2 + 16))(v2, a2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  return v4;
}

BOOL sub_10006B950(int a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  _BOOL8 result;
  int v5;
  int *v6;
  stat v7;
  uint8_t buf[4];
  int v9;

  memset(&v7, 0, sizeof(v7));
  v1 = fstat(a1, &v7);
  if (!(_DWORD)v1)
    return (HIBYTE(v7.st_flags) >> 6) & 1;
  v3 = MBGetDefaultLog(v1, v2);
  result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v5 = *__error();
    *(_DWORD *)buf = 67109120;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "fstat failed: %{errno}d", buf, 8u);
    v6 = __error();
    _MBLog(CFSTR("ERROR"), "fstat failed: %{errno}d", *v6);
    return 0;
  }
  return result;
}

BOOL sub_10006BA40(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL8 result;
  int v6;
  int *v7;
  stat v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  int v12;

  memset(&v8, 0, sizeof(v8));
  v2 = lstat((const char *)objc_msgSend(a1, "fileSystemRepresentation"), &v8);
  if (!(_DWORD)v2)
    return (HIBYTE(v8.st_flags) >> 6) & 1;
  v4 = MBGetDefaultLog(v2, v3);
  result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v6 = *__error();
    *(_DWORD *)buf = 138412546;
    v10 = a1;
    v11 = 1024;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "stat failed at %@: %{errno}d", buf, 0x12u);
    v7 = __error();
    _MBLog(CFSTR("ERROR"), "stat failed at %@: %{errno}d", a1, *v7);
    return 0;
  }
  return result;
}

uint64_t sub_10006CED4(_WORD *a1)
{
  unsigned int v2;

  if (sub_10007EF38(a1))
  {
    v2 = 0;
  }
  else if (sub_10007EF04((uint64_t)a1))
  {
    v2 = 128;
  }
  else
  {
    v2 = 0;
  }
  if (sub_10007EEE0((uint64_t)a1))
    v2 |= 0x40u;
  if (sub_10007EED4((uint64_t)a1))
    return v2 | 0x8000;
  else
    return v2;
}

BOOL sub_10006CF3C(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  int *v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v24[2];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;

  v5 = a1;
  v6 = a2;
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v5;
    v27 = 2112;
    v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using APFSIOC_MAKE_OBJECT_DATALESS to restore the com.apple.decmpfs xattr on %@: %@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "Using APFSIOC_MAKE_OBJECT_DATALESS to restore the com.apple.decmpfs xattr on %@: %@", v5, v6);
  }

  if (v6)
  {
    v12 = objc_retainAutorelease(v6);
    v24[0] = objc_msgSend(v12, "bytes");
    v24[1] = objc_msgSend(v12, "length");
    v13 = objc_retainAutorelease(v5);
    v14 = fsctl((const char *)objc_msgSend(v13, "fileSystemRepresentation"), 0x80104A39uLL, v24, 0);
    v16 = (_DWORD)v14 == 0;
    if ((_DWORD)v14)
    {
      v17 = MBGetDefaultLog(v14, v15);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *__error();
        *(_DWORD *)buf = 138412546;
        v26 = v13;
        v27 = 1024;
        LODWORD(v28) = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "fsctl(APFSIOC_MAKE_OBJECT_DATALESS) failed at %@: %{errno}d", buf, 0x12u);
        v20 = __error();
        _MBLog(CFSTR("ERROR"), "fsctl(APFSIOC_MAKE_OBJECT_DATALESS) failed at %@: %{errno}d", v13, *v20);
      }

      if (a3)
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 102, v13, CFSTR("set_dataless_attribute error")));
    }
  }
  else
  {
    v21 = MBGetDefaultLog(v10, v11);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Unexpected nil extended attribute com.apple.decmpfs for dataless file: %@", buf, 0xCu);
      _MBLog(CFSTR("FAULT"), "Unexpected nil extended attribute com.apple.decmpfs for dataless file: %@", v5);
    }

    v16 = 1;
  }

  return v16;
}

id sub_10006EBE0(uint64_t a1, int a2, char *a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  char *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  char *v25;
  const char *v26;
  stat v28;
  uint8_t buf[4];
  char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  int v34;

  memset(&v28, 0, sizeof(v28));
  v6 = fstatat(a2, a3, &v28, 32);
  if ((_DWORD)v6)
  {
    v8 = __error();
    v10 = *v8;
    if ((_DWORD)v10 != 2)
    {
      v11 = MBGetDefaultLog(v8, v9);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_msgSend(*(id *)(a1 + 32), "length");
        *(_DWORD *)buf = 136315650;
        v30 = a3;
        v31 = 2048;
        v32 = v13;
        v33 = 1024;
        v34 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "fstatat failed at %s (%ld): %{errno}d", buf, 0x1Cu);
        _MBLog(CFSTR("ERROR"), "fstatat failed at %s (%ld): %{errno}d", a3, objc_msgSend(*(id *)(a1 + 32), "length"), v10);
      }

      v14 = *(_QWORD *)(a1 + 32);
      v15 = CFSTR("fstatat error");
      v16 = v10;
      return (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v16, v14, v15));
    }
  }
  else
  {
    v17 = MBGetDefaultLog(v6, v7);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = sub_10007EFE8(v28.st_mode);
      v20 = (char *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412290;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Removing existing %@", buf, 0xCu);

      v21 = sub_10007EFE8(v28.st_mode);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      _MBLog(CFSTR("INFO"), "Removing existing %@", v22);

    }
    v8 = (int *)unlinkat(a2, a3, 0);
    if ((_DWORD)v8)
    {
      v8 = __error();
      if (*v8 != 2)
      {
        v16 = *__error();
        v14 = *(_QWORD *)(a1 + 32);
        v15 = CFSTR("Error removing existing item while restoring symbolic link");
        return (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v16, v14, v15));
      }
    }
  }
  v23 = MBGetDefaultLog(v8, v9);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = *(char **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v30 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Creating symbolic link: %@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Creating symbolic link: %@", *(_QWORD *)(a1 + 40));
  }

  if (objc_msgSend(*(id *)(a1 + 40), "length"))
    v26 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation");
  else
    v26 = "";
  if (!symlinkat(v26, a2, a3))
    return 0;
  v16 = *__error();
  v14 = *(_QWORD *)(a1 + 32);
  v15 = CFSTR("symlinkat error");
  return (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v16, v14, v15));
}

id sub_10006EEEC(uint64_t a1, uint64_t a2)
{
  uid_t v4;
  gid_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  unsigned int v26;
  id v27;
  void *v28;
  uint64_t v29;
  uid_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  uid_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;

  v4 = *(_DWORD *)(a1 + 60);
  v5 = *(_DWORD *)(a1 + 64);
  v6 = MBGetDefaultLog(a1, a2);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v38 = v4;
    v39 = 1024;
    LODWORD(v40) = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Restoring symbolic link ownership: %d:%d", buf, 0xEu);
    _MBLog(CFSTR("INFO"), "Restoring symbolic link ownership: %d:%d", v4, v5);
  }

  if (fchown(a2, v4, v5))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 102, *(_QWORD *)(a1 + 32), CFSTR("fchown error")));
    return v8;
  }
  v10 = sub_10006CED4((_WORD *)(a1 + 56));
  if ((_DWORD)v10)
  {
    v12 = v10;
    v13 = MBGetDefaultLog(v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v38 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Restoring symlink BSD flags: 0x%x", buf, 8u);
      _MBLog(CFSTR("INFO"), "Restoring symlink BSD flags: 0x%x", v12);
    }

    if (fchflags(a2, v12))
    {
      v15 = __error();
      v16 = *v15;
      v18 = MBGetDefaultLog(v15, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 67109634;
        v38 = v12;
        v39 = 2112;
        v40 = v20;
        v41 = 1024;
        v42 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to restore symlink BSD flags (0x%x) at %@: %{errno}d", buf, 0x18u);
        _MBLog(CFSTR("ERROR"), "Failed to restore symlink BSD flags (0x%x) at %@: %{errno}d", v12, *(_QWORD *)(a1 + 32), v16);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 102, *(_QWORD *)(a1 + 32), CFSTR("fchflags error")));
      return v8;
    }
  }
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "extendedAttributes"));
  v23 = (void *)v21;
  if (!v21)
    goto LABEL_18;
  v24 = MBGetDefaultLog(v21, v22);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Restoring symbolic link extended attributes", buf, 2u);
    _MBLog(CFSTR("INFO"), "Restoring symbolic link extended attributes");
  }

  v36 = 0;
  v26 = +[MBExtendedAttributes setAttributes:forFD:error:](MBExtendedAttributes, "setAttributes:forFD:error:", v23, a2, &v36);
  v27 = v36;
  v28 = v27;
  if (v26)
  {

LABEL_18:
    v29 = sub_10007EF4C((_WORD *)(a1 + 56));
    v30 = v29;
    v32 = MBGetDefaultLog(v29, v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v38 = v30;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Restoring symbolic link permissions: 0%3o", buf, 8u);
      _MBLog(CFSTR("INFO"), "Restoring symbolic link permissions: 0%3o", v30);
    }

    if (fchmod(a2, v30))
      v34 = objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 102, *(_QWORD *)(a1 + 32), CFSTR("fchmod error")));
    else
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "restoreLastModifiedWithFD:", a2));
    v35 = (void *)v34;
    goto LABEL_25;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, *(_QWORD *)(a1 + 48), CFSTR("setxattr error")));

LABEL_25:
  return v35;
}

id sub_10006F65C(uint64_t a1, int a2, const char *a3)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  const __CFString *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  char *v32;
  const __CFString *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  stat v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  int v47;

  v6 = sub_10007EF4C((_WORD *)(a1 + 40));
  memset(&v41, 0, sizeof(v41));
  v7 = fstatat(a2, a3, &v41, 32);
  if (!(_DWORD)v7)
  {
    v16 = v41.st_mode & 0xF000;
    v17 = MBGetDefaultLog(v7, v8);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v16 == 0x4000)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Directory already exists", buf, 2u);
        _MBLog(CFSTR("INFO"), "Directory already exists");
      }

      v22 = MBGetDefaultLog(v20, v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = v6;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Restoring directory permissions: 0%3o", buf, 8u);
        _MBLog(CFSTR("INFO"), "Restoring directory permissions: 0%3o", v6);
      }

      if (fchmodat(a2, a3, v6, 32))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = CFSTR("fchmodat error");
        goto LABEL_23;
      }
    }
    else
    {
      if (v19)
      {
        v31 = sub_10007EFE8(v41.st_mode);
        v32 = (char *)objc_claimAutoreleasedReturnValue(v31);
        *(_DWORD *)buf = 138412290;
        v43 = v32;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Removing existing object %@", buf, 0xCu);

        v33 = sub_10007EFE8(v41.st_mode);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        _MBLog(CFSTR("INFO"), "Removing existing object %@", v34);

      }
      v35 = unlinkat(a2, a3, 0);
      v37 = MBGetDefaultLog(v35, v36);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = v6;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Making directory: 0%3o", buf, 8u);
        _MBLog(CFSTR("INFO"), "Making directory: 0%3o", v6);
      }

      if (mkdirat(a2, a3, v6))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = CFSTR("mkdirat error");
        goto LABEL_23;
      }
    }
LABEL_25:
    v39 = 0;
    return v39;
  }
  v9 = __error();
  if (*v9 != 2)
  {
    v24 = __error();
    v25 = *v24;
    v27 = MBGetDefaultLog(v24, v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(*(id *)(a1 + 32), "length");
      *(_DWORD *)buf = 136315650;
      v43 = a3;
      v44 = 2048;
      v45 = v29;
      v46 = 1024;
      v47 = v25;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "fstatat failed at %s (%ld): %{errno}d", buf, 0x1Cu);
      _MBLog(CFSTR("ERROR"), "fstatat failed at %s (%ld): %{errno}d", a3, objc_msgSend(*(id *)(a1 + 32), "length"), v25);
    }

    v14 = *(_QWORD *)(a1 + 32);
    v15 = CFSTR("fstatat error");
    v30 = 101;
    goto LABEL_24;
  }
  v11 = MBGetDefaultLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v43 = v13;
    v44 = 1024;
    LODWORD(v45) = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Making directory at %@ (0%3o)", buf, 0x12u);
    _MBLog(CFSTR("INFO"), "Making directory at %@ (0%3o)", *(_QWORD *)(a1 + 32), v6);
  }

  if (!mkpathat_np(a2, a3, v6))
    goto LABEL_25;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = CFSTR("mkpathat_np error");
LABEL_23:
  v30 = 102;
LABEL_24:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", v30, v14, v15));
  return v39;
}

id sub_10006FAB8(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  unsigned int v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _BOOL4 v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  _BYTE v46[20];

  v2 = a2;
  v4 = *(unsigned int *)(a1 + 60);
  v5 = *(unsigned int *)(a1 + 64);
  v6 = MBGetDefaultLog(a1, a2);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v46 = v4;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v5;
    *(_WORD *)&v46[10] = 2112;
    *(_QWORD *)&v46[12] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Restoring directory ownership: %d:%d at path %@", buf, 0x18u);
    _MBLog(CFSTR("INFO"), "Restoring directory ownership: %d:%d at path %@", v4, v5, *(_QWORD *)(a1 + 32));
  }

  if (fchown(v2, v4, v5))
    return (id)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 102, *(_QWORD *)(a1 + 32), CFSTR("fchown error")));
  v10 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "extendedAttributes"));
  v13 = (void *)v11;
  if (v11)
  {
    v14 = MBGetDefaultLog(v11, v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(v13, "count");
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v46 = v16;
      *(_WORD *)&v46[8] = 2112;
      *(_QWORD *)&v46[10] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Restoring directory extended attributes (%ld) at path %@", buf, 0x16u);
      _MBLog(CFSTR("INFO"), "Restoring directory extended attributes (%ld) at path %@", objc_msgSend(v13, "count"), *(_QWORD *)(a1 + 32));
    }

    if (sub_10007EEC8(a1 + 56))
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("com.apple.decmpfs")));
      v20 = (void *)v18;
      if (v18)
      {
        v21 = MBGetDefaultLog(v18, v19);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Not re-applying the com.apple.decmpfs xattr yet.", buf, 2u);
          _MBLog(CFSTR("INFO"), "Not re-applying the com.apple.decmpfs xattr yet.");
        }

        v23 = objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v23, "removeObjectForKey:", CFSTR("com.apple.decmpfs"));

        v13 = v23;
      }
    }
    else
    {
      v20 = 0;
    }
    v44 = 0;
    v24 = +[MBExtendedAttributes setAttributes:forPathFSR:error:](MBExtendedAttributes, "setAttributes:forPathFSR:error:", v13, v10, &v44);
    v25 = v44;
    v26 = v25;
    if (!v24)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v25, CFSTR("setxattr error")));

      goto LABEL_32;
    }

  }
  else
  {
    v20 = 0;
  }
  v27 = sub_10006CED4((_WORD *)(a1 + 56));
  if ((_DWORD)v27)
  {
    v29 = v27;
    v30 = MBGetDefaultLog(v27, v28);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v46 = v29;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Restoring directory BSD flags: 0x%x", buf, 8u);
      _MBLog(CFSTR("INFO"), "Restoring directory BSD flags: 0x%x", v29);
    }

    if (fchflags(v2, v29))
    {
      v32 = __error();
      v33 = *v32;
      v35 = MBGetDefaultLog(v32, v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v46 = v29;
        *(_WORD *)&v46[4] = 2112;
        *(_QWORD *)&v46[6] = v37;
        *(_WORD *)&v46[14] = 1024;
        *(_DWORD *)&v46[16] = v33;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to restore directory BSD flags (0x%x) at %@: %{errno}d", buf, 0x18u);
        _MBLog(CFSTR("ERROR"), "Failed to restore directory BSD flags (0x%x) at %@: %{errno}d", v29, *(_QWORD *)(a1 + 32), v33);
      }

      v38 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 102, *(_QWORD *)(a1 + 32), CFSTR("fchflags error")));
LABEL_29:
      v42 = (void *)v38;
      goto LABEL_32;
    }
  }
  if (!sub_10007EEC8(a1 + 56))
  {
LABEL_27:
    if (!*(_BYTE *)(a1 + 128))
    {
      v42 = 0;
      goto LABEL_32;
    }
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_setProtectionClassWithPathFSR:", v10));
    goto LABEL_29;
  }
  v39 = *(void **)(a1 + 32);
  v43 = 0;
  v40 = sub_10006CF3C(v39, v20, &v43);
  v41 = v43;
  v42 = v41;
  if (v40)
  {

    goto LABEL_27;
  }
LABEL_32:

  return v42;
}

id sub_100070A4C(void *a1)
{
  _UNKNOWN **v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  unsigned __int8 v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  NSMutableDictionary *v73;
  unsigned int v74;
  id v75;
  MBIgnoredAccountsTracker *v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  id v90;
  uint8_t v91[4];
  void *v92;
  __int16 v93;
  id v94;

  v70 = a1;
  v76 = objc_alloc_init(MBIgnoredAccountsTracker);
  v1 = &AnalyticsSendEventLazy_ptr;
  v73 = objc_opt_new(NSMutableDictionary);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 192));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v82;
    v6 = LSUserApplicationType;
    v72 = _kCFBundleDisplayNameKey;
    v71 = _kCFBundleShortVersionStringKey;
    v77 = LSUserApplicationType;
    v78 = *(_QWORD *)v82;
    v75 = v2;
    do
    {
      v7 = 0;
      v79 = v4;
      do
      {
        if (*(_QWORD *)v82 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)v7);
        v9 = objc_autoreleasePoolPush();
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "typeForInstallMachinery"));
        if (objc_msgSend(v10, "isEqualToString:", v6))
        {
          v11 = (void *)objc_opt_new(v1[217]);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
          v13 = objc_msgSend(v8, "installType");
          if (v12)
          {
            v15 = v13;
            v16 = objc_msgSend(v8, "isBeta");
            if ((_DWORD)v16)
            {
              v18 = MBGetDefaultLog(v16, v17);
              v19 = objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v86 = v12;
                v87 = 2048;
                v88 = v15;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skipping %@/%lu (beta)", buf, 0x16u);
                _MBLog(CFSTR("DEFAULT"), "Skipping %@/%lu (beta)", v12, v15);
              }
              goto LABEL_24;
            }
            v21 = objc_msgSend(v8, "applicationDSID");
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v21));
            v23 = -[MBIgnoredAccountsTracker addAccountWithDSID:](v76, "addAccountWithDSID:", v22);

            if ((v23 & 1) == 0)
            {
              v29 = MBGetDefaultLog(v24, v25);
              v19 = objc_claimAutoreleasedReturnValue(v29);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v86 = v12;
                v87 = 2048;
                v88 = v15;
                v89 = 2048;
                v90 = v21;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skipping %@/%lu for account %llu", buf, 0x20u);
                _MBLog(CFSTR("DEFAULT"), "Skipping %@/%lu for account %llu", v12, v15, v21);
              }
              goto LABEL_23;
            }
            v26 = sub_10004727C(v8);
            if (v26 == 2)
            {
              v30 = MBGetDefaultLog(2, v27);
              v19 = objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v86 = v12;
                v87 = 2048;
                v88 = v15;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skipping %@/%lu (Swift Playgrounds app)", buf, 0x16u);
                _MBLog(CFSTR("DEFAULT"), "Skipping %@/%lu (Swift Playgrounds app)", v12, v15, v69);
              }
              goto LABEL_23;
            }
            if (v26 == 1)
            {
              v28 = MBGetDefaultLog(1, v27);
              v19 = objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v86 = v12;
                v87 = 2048;
                v88 = v15;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skipping %@/%lu (app clip)", buf, 0x16u);
                _MBLog(CFSTR("DEFAULT"), "Skipping %@/%lu (app clip)", v12, v15, v69);
              }
LABEL_23:
              v1 = &AnalyticsSendEventLazy_ptr;
              v2 = v75;
              goto LABEL_24;
            }
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationState"));
            v74 = objc_msgSend(v31, "isDowngraded");

            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "compatibilityObject"));
            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bundleExecutable"));

            objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("ApplicationType"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedName"));
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v33, v72);

            objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, kCFBundleExecutableKey);
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, kCFBundleIdentifierKey);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedName"));
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v34, kCFBundleNameKey);

            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleVersion"));
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v35, kCFBundleVersionKey);

            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortVersionString"));
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v36, v71);

            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v21));
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v37, CFSTR("ApplicationDSID"));

            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v74));
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v38, CFSTR("IsDemotedApp"));

            if (objc_msgSend(v8, "isLaunchProhibited"))
            {
              objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("LSApplicationLaunchProhibited"));
            }
            else
            {
              v40 = (void *)SBSCopyIconImagePNGDataForDisplayIdentifier(v12);
              if (!v40)
              {
                v41 = MBGetDefaultLog(0, v39);
                v42 = objc_claimAutoreleasedReturnValue(v41);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v86 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Failed to fetch the icon for %@", buf, 0xCu);
                  _MBLog(CFSTR("DEFAULT"), "Failed to fetch the icon for %@", v12);
                }

                v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
              }
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v40, CFSTR("PlaceholderIcon"));

            }
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleContainerURL"));
            v45 = v43;
            if (v43)
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "URLByAppendingPathComponent:", CFSTR("iTunesMetadata.plist")));
              v47 = sub_10007145C(v46, CFSTR("iTunesMetadata"), v11);

              v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
              if (v49)
              {
                v50 = v45;
                v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SC_Info/%@.sinf"), v19));
                v52 = objc_claimAutoreleasedReturnValue(-[NSObject URLByAppendingPathComponent:](v49, "URLByAppendingPathComponent:", v51));
                v53 = sub_10007145C(v52, CFSTR("ApplicationSINF"), v11);

                v45 = v50;
              }
              else
              {
                v55 = MBGetDefaultLog(0, v48);
                v52 = objc_claimAutoreleasedReturnValue(v55);
                if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v86 = v12;
                  v87 = 2112;
                  v88 = v8;
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "nil bundleURL for %@: %@", buf, 0x16u);
                  _MBLog(CFSTR("ERROR"), "nil bundleURL for %@: %@", v12, v8);
                }
              }

            }
            else
            {
              v54 = MBGetDefaultLog(0, v44);
              v49 = objc_claimAutoreleasedReturnValue(v54);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v86 = v12;
                v87 = 2112;
                v88 = v8;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "nil bundleContainerURL for %@: %@", buf, 0x16u);
                _MBLog(CFSTR("ERROR"), "nil bundleContainerURL for %@: %@", v12, v8);
              }
            }
            v4 = v79;

            -[NSMutableDictionary setObject:forKeyedSubscript:](v73, "setObject:forKeyedSubscript:", v11, v12);
            v1 = &AnalyticsSendEventLazy_ptr;
            v2 = v75;
          }
          else
          {
            v20 = MBGetDefaultLog(v13, v14);
            v19 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v86 = v8;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "nil bundleID for app record: %@", buf, 0xCu);
              _MBLog(CFSTR("ERROR"), "nil bundleID for app record: %@", v8, v68);
            }
LABEL_24:
            v4 = v79;
          }

          v6 = v77;
          v5 = v78;
        }

        objc_autoreleasePoolPop(v9);
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      v56 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
      v4 = v56;
    }
    while (v56);
  }

  v57 = -[NSMutableDictionary copy](v73, "copy");
  v80 = 0;
  v58 = objc_msgSend(v57, "writeToURL:error:", v70, &v80);
  v59 = v80;
  v61 = MBGetDefaultLog(v59, v60);
  v62 = objc_claimAutoreleasedReturnValue(v61);
  v63 = v62;
  if ((v58 & 1) != 0)
  {
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "path"));
      *(_DWORD *)v91 = 138412290;
      v92 = v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "Wrote restore apps plist to %@", v91, 0xCu);

      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "path"));
      _MBLog(CFSTR("INFO"), "Wrote restore apps plist to %@", v65, v68);
LABEL_50:

    }
  }
  else if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "path"));
    *(_DWORD *)v91 = 138412546;
    v92 = v66;
    v93 = 2112;
    v94 = v59;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Failed to write the plist to %@: %@", v91, 0x16u);

    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "path"));
    _MBLog(CFSTR("ERROR"), "Failed to write the plist to %@: %@", v65, v59);
    goto LABEL_50;
  }

  return v59;
}

id sub_10007145C(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v19 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v5, 2, &v19));
  v9 = v19;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);
LABEL_3:
    v11 = 0;
    goto LABEL_12;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
  if (objc_msgSend(v12, "isEqualToString:", NSCocoaErrorDomain))
  {
    v13 = objc_msgSend(v10, "code");

    if (v13 == (id)260)
      goto LABEL_3;
  }
  else
  {

  }
  v16 = MBGetDefaultLog(v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v5;
    v22 = 2112;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to get data from %@: %@", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), "Failed to get data from %@: %@", v5, v10);
  }

  if (!v10)
    sub_100088B48();
  v11 = v10;
LABEL_12:

  return v11;
}

void sub_100075594(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;

  v5 = a3;
  v7 = v5;
  if ((a2 & 1) == 0)
  {
    v8 = MBGetDefaultLog(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "=iCloudDrive= BRCDatabaseRestoreManager failed: %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "=iCloudDrive= BRCDatabaseRestoreManager failed: %@", v7);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100075A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100075A8C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100075A9C(uint64_t a1)
{

}

void sub_100075AA4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100075DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100075DFC(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

int64_t sub_100079554(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a3, "compare:", a2);
}

int64_t sub_10007B4DC(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a3, "compare:", a2);
}

void sub_10007C328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007C374(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10007C384(uint64_t a1)
{

}

BOOL sub_10007C38C(uint64_t a1, void *a2, _WORD *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;

  v7 = a2;
  v8 = a4;
  v10 = v8;
  if (v8)
  {
    v11 = MBGetDefaultLog(v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v38 = v13;
      v39 = 2112;
      v40 = v14;
      v41 = 2112;
      v42 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "=scanning= Error enumerating file attrs %@ %@: %@", buf, 0x20u);
      _MBLog(CFSTR("DEFAULT"), "=scanning= Error enumerating file attrs %@ %@: %@", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v10);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a4);
    goto LABEL_13;
  }
  v15 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 49));
  if ((v15 & 1) != 0)
  {
    v29 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("File scan cancelled")));
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

LABEL_13:
    v28 = 0;
    goto LABEL_14;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  if (__ROR8__(0xD288CE703AFB7E91 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), 4) <= 0x68DB8BAC710CBuLL)
  {
    v16 = MBGetDefaultLog(0, v9);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      *(_DWORD *)buf = 134218498;
      v38 = v18;
      v39 = 2114;
      v40 = v19;
      v41 = 2114;
      v42 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=scanning= Found %llu items under %{public}@ (%{public}@), single pass", buf, 0x20u);

      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      v22 = *(_QWORD *)(a1 + 40);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      _MBLog(CFSTR("DEFAULT"), "=scanning= Found %llu items under %{public}@ (%{public}@), single pass", v21, v22, v23);

    }
  }
  v24 = *(_QWORD *)(a1 + 56);
  v25 = *(_QWORD *)(a1 + 32);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v7));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v25, v24, v26));

  objc_msgSend(v27, "setNode:", a3);
  if ((objc_msgSend(*(id *)(a1 + 48), "_shouldNotBackupFile:domain:", v27, *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v28 = 1;
  }
  else
  {
    if (sub_10007EF10(a3) || !objc_msgSend(v7, "mb_pathHasSQLiteJournalSuffix"))
    {
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v7);
      v36 = *(void **)(a1 + 72);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, 72));
      objc_msgSend(v36, "addObject:", v35);
    }
    else
    {
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_foundFile:snapshotPath:stats:", v27, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96)));
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = v33;
    }

    v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) == 0;
  }

LABEL_14:
  return v28;
}

void sub_10007CBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 224), 8);
  _Unwind_Resume(a1);
}

BOOL sub_10007CC4C(uint64_t a1, void *a2, _WORD *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;

  v7 = a2;
  v8 = a4;
  v10 = v8;
  if (v8)
  {
    v11 = MBGetDefaultLog(v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v37 = v13;
      v38 = 2112;
      v39 = v14;
      v40 = 2112;
      v41 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "=scanning= Error enumerating file attrs %@ %@: %@", buf, 0x20u);
      _MBLog(CFSTR("DEFAULT"), "=scanning= Error enumerating file attrs %@ %@: %@", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v10);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4);
    goto LABEL_15;
  }
  v15 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 49));
  if ((v15 & 1) != 0)
  {
    v29 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("File scan cancelled")));
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

LABEL_15:
    v28 = 0;
    goto LABEL_16;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (__ROR8__(0xD288CE703AFB7E91 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), 4) <= 0x68DB8BAC710CBuLL)
  {
    v16 = MBGetDefaultLog(0, v9);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      *(_DWORD *)buf = 134218498;
      v37 = v18;
      v38 = 2114;
      v39 = v19;
      v40 = 2114;
      v41 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=scanning= Found %llu items under %{public}@ (%{public}@), first pass", buf, 0x20u);

      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v22 = *(_QWORD *)(a1 + 40);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      _MBLog(CFSTR("DEFAULT"), "=scanning= Found %llu items under %{public}@ (%{public}@), first pass", v21, v22, v23);

    }
  }
  if (sub_10007EF10(a3) || !objc_msgSend(v7, "mb_pathHasSQLiteJournalSuffix"))
  {
    v28 = 1;
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 56);
    v25 = *(_QWORD *)(a1 + 32);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v7));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v25, v24, v26));

    objc_msgSend(v27, "setNode:", a3);
    if ((objc_msgSend(*(id *)(a1 + 48), "_shouldNotBackupFile:domain:", v27, *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      v28 = 1;
    }
    else
    {
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_foundFile:snapshotPath:stats:", v27, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80)));
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = v33;

      v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) == 0;
    }

  }
LABEL_16:

  return v28;
}

uint64_t sub_10007CF9C(uint64_t a1, void *a2, _WORD *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;

  v7 = a2;
  v8 = a4;
  v10 = v8;
  if (v8)
  {
    v11 = MBGetDefaultLog(v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v41 = v13;
      v42 = 2112;
      v43 = v14;
      v44 = 2112;
      v45 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "=scanning= Error enumerating file attrs %@ %@: %@", buf, 0x20u);
      _MBLog(CFSTR("DEFAULT"), "=scanning= Error enumerating file attrs %@ %@: %@", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v10);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a4);
    goto LABEL_14;
  }
  v15 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 49));
  if ((v15 & 1) != 0)
  {
    v25 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("File scan cancelled")));
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

LABEL_14:
    v24 = 0;
    goto LABEL_15;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  if (__ROR8__(0xD288CE703AFB7E91 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), 4) <= 0x68DB8BAC710CBuLL)
  {
    v16 = MBGetDefaultLog(0, v9);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      *(_DWORD *)buf = 134218498;
      v41 = v18;
      v42 = 2114;
      v43 = v19;
      v44 = 2114;
      v45 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=scanning= Found %llu items under %{public}@ (%{public}@), second pass", buf, 0x20u);

      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      v22 = *(_QWORD *)(a1 + 40);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      _MBLog(CFSTR("DEFAULT"), "=scanning= Found %llu items under %{public}@ (%{public}@), second pass", v21, v22, v23);

    }
  }
  if (sub_10007EF10(a3) || (objc_msgSend(v7, "mb_pathHasSQLiteJournalSuffix") & 1) == 0)
  {
    v29 = *(_QWORD *)(a1 + 56);
    v30 = *(_QWORD *)(a1 + 32);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v7));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MBFile fileWithDomain:snapshotPath:relativePath:](MBFile, "fileWithDomain:snapshotPath:relativePath:", v30, v29, v31));

    objc_msgSend(v32, "setNode:", a3);
    if ((objc_msgSend(*(id *)(a1 + 48), "_shouldNotBackupFile:domain:", v32, *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_foundFile:snapshotPath:stats:", v32, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96)));
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = v33;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
      {
        v24 = 0;
        goto LABEL_20;
      }
      if (objc_msgSend(v32, "isDirectory"))
      {
        v36 = *(void **)(a1 + 64);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "relativePath"));
        objc_msgSend(v36, "addObject:", v37);

        v38 = *(void **)(a1 + 72);
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)a3[1]));
        objc_msgSend(v38, "addObject:", v39);

      }
    }
    v24 = 1;
LABEL_20:

    goto LABEL_15;
  }
  v24 = 1;
LABEL_15:

  return v24;
}

uint64_t sub_10007E6BC(int a1, void *a2, uint64_t a3)
{
  int v4;
  int v5;
  unint64_t v6;
  int v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  NSString *v16;
  char v17;
  NSData *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  unsigned int v24;
  NSObject *v25;
  const __CFString *v26;
  MBError *v27;
  uint64_t v29;
  NSFileManager *v32;
  id v33;
  char *v34;
  _OWORD v35[4];
  uint64_t v36;
  _WORD v37[2];
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  uint8_t buf[16];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  v37[0] = word_1000F9CD8;
  v37[1] = 0;
  v38 = dword_1000F9CDC | 0x20000001;
  v39 = 0;
  v40 = unk_1000F9CE4;
  v41 = dword_1000F9CEC;
  v33 = objc_msgSend(a2, "mutableBytes");
  v34 = (char *)objc_msgSend(a2, "length");
  v32 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
LABEL_2:
  v4 = getattrlistbulk(a1, v37, v33, (size_t)v34, 0x29uLL);
  v5 = v4;
  if (v4 >= 1)
  {
    v6 = 0;
    v7 = 0;
    while (1)
    {
      if (v6 >= (unint64_t)v34)
        sub_100088CD8();
      v8 = (char *)v33 + v6;
      if (*(_DWORD *)((char *)v33 + v6 + 24))
      {
        v26 = CFSTR("getattrlistbulk() enumeration error");
LABEL_27:
        v27 = +[MBError errorWithErrno:format:](MBError, "errorWithErrno:format:", *__error(), v26);
        (*(void (**)(uint64_t, _QWORD, _QWORD, MBError *))(a3 + 16))(a3, 0, 0, v27);
        return 0;
      }
      v9 = *(unsigned int *)v8;
      v10 = objc_autoreleasePoolPush();
      v11 = (uint64_t)&v8[*((int *)v8 + 7) + 28];
      v12 = *((unsigned int *)v8 + 8);
      if ((char *)(v11 + v12) > &v34[(_QWORD)v33])
        sub_100088C88();
      v13 = (v12 - 1);
      if (*(_BYTE *)(v11 + v13))
        sub_100088CB0();
      v14 = v10;
      v15 = -[NSFileManager stringWithFileSystemRepresentation:length:](v32, "stringWithFileSystemRepresentation:length:", &v8[*((int *)v8 + 7) + 28], v13);
      if (v15)
      {
        v16 = v15;
        v36 = 0;
        memset(v35, 0, sizeof(v35));
        v45 = *(_OWORD *)(v8 + 84);
        v46 = *(_OWORD *)(v8 + 100);
        v47 = *(_OWORD *)(v8 + 116);
        v48 = *(_OWORD *)(v8 + 132);
        *(_OWORD *)buf = *(_OWORD *)(v8 + 36);
        v43 = *(_OWORD *)(v8 + 52);
        v44 = *(_OWORD *)(v8 + 68);
        if ((sub_10007EA9C((unsigned int *)buf, (uint64_t)v35, (uint64_t)v15, 0) & 1) != 0)
        {
          v17 = (*(uint64_t (**)(uint64_t, NSString *, _OWORD *, _QWORD))(a3 + 16))(a3, v16, v35, 0);
          objc_autoreleasePoolPop(v14);
          if ((v17 & 1) == 0)
            return 0;
          goto LABEL_24;
        }
      }
      else
      {
        v18 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v11, v13);
        v20 = MBGetDefaultLog(v18, v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unexpected mbNode name: %@", buf, 0xCu);
          _MBLog(CFSTR("ERROR"), "Unexpected mbNode name: %@", v18);
        }
        v21 = sub_100081D30();
        if ((_DWORD)v21)
        {
          v23 = MBGetDefaultLog(v21, v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v18;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Unexpected mbNode name: %@", buf, 0xCu);
            _MBLog(CFSTR("FAULT"), "Unexpected mbNode name: %@", v18);
          }
        }
        else if (!dword_1000F9E64)
        {
          do
            v24 = __ldxr((unsigned int *)&dword_1000F9E64);
          while (__stxr(v24 + 1, (unsigned int *)&dword_1000F9E64));
          if (!v24)
          {
            v25 = MBGetDefaultLog(v21, v22);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "Unexpected mbNode name", buf, 2u);
              _MBLog(CFSTR("FAULT"), "Unexpected mbNode name", v29);
            }
          }
        }
      }
      objc_autoreleasePoolPop(v14);
LABEL_24:
      v6 += v9;
      if (++v7 == v5)
        goto LABEL_2;
    }
  }
  if (v4 < 0)
  {
    v26 = CFSTR("getattrlistbulk() error");
    goto LABEL_27;
  }
  return 1;
}

uint64_t sub_10007EA9C(unsigned int *a1, uint64_t a2, uint64_t a3, MBError **a4)
{
  uint64_t v7;
  unsigned int v8;
  __int16 v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  unsigned int v15;
  MBError *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  MBError *v26;

  if (!a2)
    sub_100088D00();
  v7 = *a1;
  v8 = a1[15];
  switch((_DWORD)v7)
  {
    case 1:
      v9 = 0x8000;
      break;
    case 2:
      v9 = 0x4000;
      break;
    case 5:
      v9 = -24576;
      break;
    default:
      if (a4)
      {
        if (a3)
          v16 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 242, a3, CFSTR("Not a directory, symlink, or regular file (%d)"), v7);
        else
          v16 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 242, CFSTR("Not a directory, symlink, or regular file (%d)"), v7);
        v26 = v16;
        result = 0;
        *a4 = v26;
        return result;
      }
      return 0;
  }
  v10 = sub_100066CC0(a1[20], (_DWORD)v7 == 1, a4);
  if (v10 == 255)
    return 0;
  v11 = a1[21];
  if ((_DWORD)v7 == 2)
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
  else
  {
    v13 = v11 > 1;
    v14 = *((_QWORD *)a1 + 12);
    if ((_DWORD)v7 == 1)
    {
      v12 = *((_QWORD *)a1 + 11);
      v15 = a1[17];
    }
    else
    {
      v12 = 0;
      v15 = 0;
    }
    LOWORD(v11) = 1;
  }
  v18 = 26;
  if ((_DWORD)v7 == 2)
    v18 = 24;
  v19 = *(_QWORD *)&a1[v18];
  *(_QWORD *)(a2 + 64) = 0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  v20 = *(_QWORD *)(a1 + 1);
  v21 = *(_QWORD *)(a1 + 5);
  v22 = *(_QWORD *)(a1 + 9);
  v23 = *((_QWORD *)a1 + 9);
  if ((_DWORD)v7 == 1 && (v19 & 0x40) != 0)
    v24 = 2;
  else
    v24 = 0;
  *(_WORD *)a2 = v8 & 0xFFF | v9;
  *(_WORD *)(a2 + 2) = v11;
  *(_QWORD *)(a2 + 4) = *(_QWORD *)(a1 + 13);
  *(_DWORD *)(a2 + 12) = 0;
  *(_QWORD *)(a2 + 16) = v20;
  *(_QWORD *)(a2 + 24) = v21;
  *(_QWORD *)(a2 + 32) = v22;
  *(_QWORD *)(a2 + 40) = v12;
  *(_QWORD *)(a2 + 48) = v23;
  *(_DWORD *)(a2 + 56) = v15;
  *(_QWORD *)(a2 + 60) = v14;
  *(_BYTE *)(a2 + 68) = v10;
  *(_BYTE *)(a2 + 69) = (v13 & 0xFB | (4 * ((v19 & 2) != 0)) | v24) ^ 4;
  v25 = a1[16];
  *(_DWORD *)(a2 + 12) = v25;
  if ((v25 & 0x40000000) != 0)
    *(_QWORD *)(a2 + 40) = 0;
  return 1;
}

uint64_t sub_10007EC7C(void *a1, uint64_t a2, MBError **a3)
{
  MBError *v6;
  uint64_t result;
  _OWORD v8[7];
  _OWORD v9[9];

  if (!a1)
    sub_100088D28();
  if (!a2)
    sub_100088D50();
  memset(v9, 0, 136);
  if (getattrlist((const char *)objc_msgSend(a1, "fileSystemRepresentation"), &word_1000F9CD8, v9, 0x88uLL, 0x29u))
  {
    if (a3)
    {
      v6 = +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *__error(), a1, CFSTR("getattrlist() error"));
      result = 0;
      *a3 = v6;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v8[4] = *(_OWORD *)((char *)&v9[5] + 8);
    v8[5] = *(_OWORD *)((char *)&v9[6] + 8);
    v8[6] = *(_OWORD *)((char *)&v9[7] + 8);
    v8[0] = *(_OWORD *)((char *)&v9[1] + 8);
    v8[1] = *(_OWORD *)((char *)&v9[2] + 8);
    v8[2] = *(_OWORD *)((char *)&v9[3] + 8);
    v8[3] = *(_OWORD *)((char *)&v9[4] + 8);
    return sub_10007EA9C((unsigned int *)v8, a2, (uint64_t)a1, a3);
  }
  return result;
}

uint64_t sub_10007ED7C(int a1, __CFString *a2, uint64_t a3, MBError **a4)
{
  __CFString *v8;
  MBError *v9;
  uint64_t result;
  _OWORD v11[7];
  _OWORD v12[9];

  if (a1 < 0)
    sub_100088D78();
  if (!a2)
    sub_100088DA0();
  if (!a3)
    sub_100088DC8();
  if (-[__CFString length](a2, "length"))
    v8 = a2;
  else
    v8 = CFSTR(".");
  memset(v12, 0, 136);
  if (getattrlistat(a1, (const char *)-[__CFString fileSystemRepresentation](v8, "fileSystemRepresentation"), &word_1000F9CD8, v12, 0x88uLL, 0x29uLL))
  {
    if (a4)
    {
      v9 = +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *__error(), a2, CFSTR("getattrlistat() error"));
      result = 0;
      *a4 = v9;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v11[4] = *(_OWORD *)((char *)&v12[5] + 8);
    v11[5] = *(_OWORD *)((char *)&v12[6] + 8);
    v11[6] = *(_OWORD *)((char *)&v12[7] + 8);
    v11[0] = *(_OWORD *)((char *)&v12[1] + 8);
    v11[1] = *(_OWORD *)((char *)&v12[2] + 8);
    v11[2] = *(_OWORD *)((char *)&v12[3] + 8);
    v11[3] = *(_OWORD *)((char *)&v12[4] + 8);
    return sub_10007EA9C((unsigned int *)v11, a3, (uint64_t)a2, a4);
  }
  return result;
}

uint64_t sub_10007EEB0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t sub_10007EEB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 12) = a2;
  if ((a2 & 0x40000000) != 0)
    *(_QWORD *)(result + 40) = 0;
  return result;
}

uint64_t sub_10007EEC8(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 15) >> 6) & 1;
}

uint64_t sub_10007EED4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 13) >> 7;
}

uint64_t sub_10007EEE0(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 12) >> 6) & 1;
}

BOOL sub_10007EEEC(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 12) & 0x40000020) == 32;
}

uint64_t sub_10007EF04(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 12) >> 7;
}

BOOL sub_10007EF10(_WORD *a1)
{
  return (*a1 & 0xF000) == 0x4000;
}

BOOL sub_10007EF24(_WORD *a1)
{
  return (*a1 & 0xF000) == 0x8000;
}

BOOL sub_10007EF38(_WORD *a1)
{
  return (*a1 & 0xF000) == 40960;
}

uint64_t sub_10007EF4C(_WORD *a1)
{
  return *a1 & 0xFFF;
}

_WORD *sub_10007EF58(_WORD *result, __int16 a2)
{
  *result = *result & 0xF000 | a2 & 0xFFF;
  return result;
}

NSString *sub_10007EF68(unsigned __int16 *a1)
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MBNode %p: mode 0%o, direntCount %hu, uid %d, gid %d, birth %ld, modified %ld, flags 0x%x, statusChanged %ld, fileSize %llu, inode %llu, genCount %u, cloneID %llu, pc %hhu, xattrs %d>"), a1, *a1, a1[1], *((unsigned int *)a1 + 1), *((unsigned int *)a1 + 2), *((_QWORD *)a1 + 2), *((_QWORD *)a1 + 3), *((unsigned int *)a1 + 3), *((_QWORD *)a1 + 4), *((_QWORD *)a1 + 5), *((_QWORD *)a1 + 6), *((unsigned int *)a1 + 14), *(_QWORD *)(a1 + 30), *((unsigned __int8 *)a1 + 68), (*((unsigned __int8 *)a1 + 69) >> 2) & 1);
}

const __CFString *sub_10007EFE8(__int16 a1)
{
  const __CFString *v1;
  int v2;
  const __CFString *v3;

  v1 = CFSTR("regular file");
  v2 = a1 & 0xF000;
  v3 = CFSTR("(unknown)");
  if (v2 == 0x4000)
    v3 = CFSTR("directory");
  if (v2 != 0x8000)
    v1 = v3;
  if (v2 == 40960)
    return CFSTR("symbolic link");
  else
    return v1;
}

BOOL sub_10007F028(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  char v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v3 = *(unsigned __int16 *)(a1 + 4);
  v4 = v3 & 0xF000;
  if (v4 == 0x4000 || v4 == 0x8000 || v4 == 40960)
  {
    if (v4 == 0x8000)
    {
      v5 = *(_QWORD *)(a1 + 96);
      v6 = (*(unsigned __int16 *)(a1 + 6) > 1u) | 4;
    }
    else
    {
      if (v4 == 0x4000)
      {
        v5 = 0;
        v7 = *(_WORD *)(a1 + 6);
        v6 = 4;
        goto LABEL_12;
      }
      v5 = 0;
      v6 = 4;
    }
    v7 = 1;
LABEL_12:
    *(_QWORD *)(a2 + 64) = 0;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    v8 = *(_QWORD *)(a1 + 80);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 8);
    *(_WORD *)a2 = v3;
    *(_WORD *)(a2 + 2) = v7;
    *(_QWORD *)(a2 + 4) = *(_QWORD *)(a1 + 16);
    *(_DWORD *)(a2 + 12) = 0;
    *(_QWORD *)(a2 + 16) = v8;
    *(_QWORD *)(a2 + 24) = v9;
    *(_QWORD *)(a2 + 32) = v10;
    *(_QWORD *)(a2 + 40) = v5;
    *(_QWORD *)(a2 + 48) = v11;
    *(_DWORD *)(a2 + 56) = 0;
    *(_QWORD *)(a2 + 60) = 0;
    *(_BYTE *)(a2 + 68) = 0;
    *(_BYTE *)(a2 + 69) = v6;
    v12 = *(_DWORD *)(a1 + 116);
    *(_DWORD *)(a2 + 12) = v12;
    if ((v12 & 0x40000000) != 0)
      *(_QWORD *)(a2 + 40) = 0;
    return v4 == 0x8000 || v4 == 40960 || v4 == 0x4000;
  }
  if (a3)
    *a3 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("Not a directory, symlink, or regular file (%d)"), v3);
  return v4 == 0x8000 || v4 == 40960 || v4 == 0x4000;
}

void sub_10007F6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007F6FC(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_10007F70C(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

intptr_t sub_10007F718(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10007F914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10007F938(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10007FB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10007FB24(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10007FCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10007FCDC(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

NSObject *sub_100080294(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t isKindOfClass;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint8_t buf[4];
  _BYTE v30[14];
  __int16 v31;
  NSObject *v32;

  v2 = a1;
  if (qword_1000F9E70 != -1)
    dispatch_once(&qword_1000F9E70, &stru_1000DA1E0);
  if ((_DWORD)v2 != 4)
  {
    if ((_DWORD)v2 == 3)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000F9E68, "objectForKeyedSubscript:", CFSTR("Cloud")));
      if (!v3)
      {
        v4 = (void *)qword_1000F9E68;
        v5 = CFSTR("iCloud");
        goto LABEL_14;
      }
    }
    else
    {
      if ((_DWORD)v2 != 1)
        goto LABEL_9;
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000F9E68, "objectForKeyedSubscript:", CFSTR("Local")));
      if (!v3)
      {
        v4 = (void *)qword_1000F9E68;
        v5 = CFSTR("Drive");
LABEL_14:
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
LABEL_15:
        v6 = v8;

        if (v6)
          goto LABEL_16;
LABEL_9:
        v7 = MBGetDefaultLog(a1, a2);
        v6 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v30 = v2;
          *(_WORD *)&v30[4] = 2114;
          *(_QWORD *)&v30[6] = qword_1000F9E68;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Missing required product versions for engine type %d: %{public}@", buf, 0x12u);
          _MBLog(CFSTR("DEFAULT"), "Missing required product versions for engine type %d: %{public}@", v2, qword_1000F9E68);
        }
        goto LABEL_27;
      }
    }
    v8 = v3;
    goto LABEL_15;
  }
  a1 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000F9E68, "objectForKeyedSubscript:", CFSTR("D2D")));
  v6 = a1;
  if (!a1)
    goto LABEL_9;
LABEL_16:
  v9 = objc_opt_class(NSDictionary);
  isKindOfClass = objc_opt_isKindOfClass(v6, v9);
  if ((isKindOfClass & 1) != 0)
  {
    v12 = MBProductVersion();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (!v13)
      sub_100088DF0();
    v14 = (void *)v13;
    v16 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v13));
    if (v16)
    {
      v17 = objc_opt_class(NSString);
      v18 = objc_opt_isKindOfClass(v16, v17);
      if ((v18 & 1) != 0)
      {
        v18 = (uint64_t)objc_msgSend(v14, "compare:options:", v16, 64);
        if (v18 != -1)
        {
          v20 = MBGetDefaultLog(v18, v19);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)v30 = v14;
            *(_WORD *)&v30[8] = 1024;
            *(_DWORD *)&v30[10] = v2;
            v31 = 2114;
            v32 = v16;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "productVersion:\"%{public}@\", engineType:%d, requiredProductVersion:\"%{public}@\"", buf, 0x1Cu);
            _MBLog(CFSTR("DEFAULT"), "productVersion:\"%{public}@\", engineType:%d, requiredProductVersion:\"%{public}@\"", v14, v2, v16);
          }

          v22 = v16;
          goto LABEL_33;
        }
      }
      v25 = MBGetDefaultLog(v18, v19);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v30 = v14;
        *(_WORD *)&v30[8] = 1024;
        *(_DWORD *)&v30[10] = v2;
        v31 = 2114;
        v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Invalid required product version for \"%{public}@\" and engine type %d: %{public}@", buf, 0x1Cu);
        _MBLog(CFSTR("ERROR"), "Invalid required product version for \"%{public}@\" and engine type %d: %{public}@", v14, v2, v6);
      }
    }
    else
    {
      v27 = MBGetDefaultLog(0, v15);
      v26 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v30 = v14;
        *(_WORD *)&v30[8] = 1024;
        *(_DWORD *)&v30[10] = v2;
        v31 = 2114;
        v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Missing required product version for \"%{public}@\" and engine type %d: %{public}@", buf, 0x1Cu);
        _MBLog(CFSTR("DEFAULT"), "Missing required product version for \"%{public}@\" and engine type %d: %{public}@", v14, v2, v6);
      }
    }

    v22 = 0;
LABEL_33:

    goto LABEL_34;
  }
  v23 = MBGetDefaultLog(isKindOfClass, v11);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v30 = v2;
    *(_WORD *)&v30[4] = 2114;
    *(_QWORD *)&v30[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Invalid required product versions for engine type %d: %{public}@", buf, 0x12u);
    _MBLog(CFSTR("ERROR"), "Invalid required product versions for engine type %d: %{public}@", v2, v6);
  }

LABEL_27:
  v22 = 0;
LABEL_34:

  return v22;
}

void sub_1000806EC(id a1)
{
  NSBundle *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;

  v1 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MBEngine));
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathForResource:ofType:", CFSTR("CompatibilityVersions"), CFSTR("plist")));

  v4 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v3));
  v5 = (void *)qword_1000F9E68;
  qword_1000F9E68 = v4;

  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = v3;
    v12 = 2114;
    v13 = qword_1000F9E68;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loaded \"%{public}@\": %{public}@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "Loaded \"%{public}@\": %{public}@", v3, qword_1000F9E68);
  }

}

uint64_t sub_100081D30()
{
  if (qword_1000F9E80 != -1)
    dispatch_once(&qword_1000F9E80, &stru_1000DA238);
  return byte_1000F9E78;
}

void sub_100081D70(id a1)
{
  void *v1;

  v1 = (void *)MGCopyAnswer(CFSTR("InternalBuild"), 0);
  byte_1000F9E78 = objc_msgSend(v1, "BOOLValue");
  if (v1)
    CFRelease(v1);
}

void sub_1000826EC(id a1)
{
  NSMutableDictionary *v1;
  void *v2;

  v1 = objc_opt_new(NSMutableDictionary);
  v2 = (void *)qword_1000F9E88;
  qword_1000F9E88 = (uint64_t)v1;

  dword_1000F9E98 = 0;
}

uint64_t sub_100082C9C(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  void *v24;
  unsigned int v25;
  void *v26;
  uint8_t v28[8];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);
  if (!(_DWORD)v7)
    goto LABEL_22;
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing old restore directory", v28, 2u);
    _MBLog(CFSTR("DEFAULT"), "Removing old restore directory");
  }

  if (objc_msgSend(v6, "removeItemAtPath:error:", v5, a3))
  {
LABEL_22:
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("var")));
    v12 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, a3);

    if (v12)
    {
      v31[0] = NSFileOwnerAccountName;
      v31[1] = NSFileGroupOwnerAccountName;
      v32[0] = CFSTR("mobile");
      v32[1] = CFSTR("mobile");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
      v29[0] = NSFileOwnerAccountName;
      v29[1] = NSFileGroupOwnerAccountName;
      v30[0] = CFSTR("_securityd");
      v30[1] = CFSTR("wheel");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
      if (a2 == 1)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("var/Keychains")));
        v19 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, v14, a3);

        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("var/Managed Preferences")));
          v21 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, 0, a3);

          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("var/Managed Preferences/mobile")));
            v23 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v22, 1, v13, a3);

            if (v23)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("var/MobileDevice")));
              v25 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v24, 1, 0, a3);

              if (v25)
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("var/MobileDevice/ProvisioningProfiles")));
                v17 = (uint64_t)objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 1, v13, a3);

                if (!(_DWORD)v17)
                  goto LABEL_18;
                goto LABEL_9;
              }
            }
          }
        }
      }
      else if (a2 != 2
             || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("var/mobile"))),
                 v16 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, v13, a3), v15, (v16 & 1) != 0))
      {
LABEL_9:
        v17 = 1;
LABEL_18:

        goto LABEL_19;
      }
      v17 = 0;
      goto LABEL_18;
    }
  }
  v17 = 0;
LABEL_19:

  return v17;
}

void sub_10008487C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000848F0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100084900(uint64_t a1)
{

}

uint64_t sub_100084908(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "=restore-placeholder= Failed to enumerate placeholder ipas at %@: %@", buf, 0x16u);
    _MBLog(CFSTR("FAULT"), "=restore-placeholder= Failed to enumerate placeholder ipas at %@: %@", v5, v6);
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

  return 0;
}

uint64_t sub_100084A04(uint64_t result)
{
  byte_1000F9EA0 = result;
  return result;
}

void sub_100084A50(id a1)
{
  qword_1000F9EA8 = objc_alloc_init(MBNotificationCenter);
}

void sub_100084D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100084D94(uint64_t a1)
{
  id v2;
  uint64_t result;
  char i;
  char v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    result = (uint64_t)objc_msgSend(v2, "intValue");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  }
  else
  {
    for (i = 1; ; i = 0)
    {
      v5 = i;
      v6 = notify_register_check((const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;
      if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        break;
      v8 = MBGetDefaultLog(v6, v7);
      result = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        v9 = *(_QWORD *)(a1 + 40);
        v10 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        *(_DWORD *)buf = 138412546;
        v12 = v9;
        v13 = 2048;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "notify_register_check(%@) failed: %lu", buf, 0x16u);
        result = _MBLog(CFSTR("ERROR"), "notify_register_check(%@) failed: %lu", *(_QWORD *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      }
      if ((v5 & 1) == 0)
        return result;
    }
    return (uint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)), *(_QWORD *)(a1 + 40));
  }
  return result;
}

id sub_1000854A8()
{
  id v0;

  v0 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBAnalyticsEventPlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBAppleCarePlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBApplePushServicePlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBDataMigratorPlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBDaemonPlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBiTunesStorePlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBKeychainPlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBLockdownPlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBManagerPlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBRestoreAppsPlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBATCBundlesPlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBManateePlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBWiFiPlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBiCloudDrivePlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBScreenTimePlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBSiriPlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBKeyboardPlugin));
  objc_msgSend(v0, "addObject:", objc_alloc_init(MBFileProviderPlugin));
  return v0;
}

int64_t sub_100086F74(id a1, id a2, id a3)
{
  return -(uint64_t)objc_msgSend(a2, "compare:", a3);
}

int64_t sub_100086F90(id a1, id a2, id a3)
{
  return -(uint64_t)objc_msgSend(a2, "compare:", a3);
}

void sub_100087518()
{
  __assert_rtn("-[MBSCachePool _openCache]_block_invoke", "MBSCachePool.m", 138, "personalPersona");
}

void sub_100087540()
{
  __assert_rtn("-[MBURLConnection connection:didFailWithError:]", "MBURLConnection.m", 197, "!_done && \"Received connection:didFailWithError: when already done\"");
}

void sub_100087568()
{
  __assert_rtn("-[MBURLConnection connectionDidFinishLoading:]", "MBURLConnection.m", 206, "!_done && \"Received connection:didFinishLoading: when already done\"");
}

void sub_100087590()
{
  __assert_rtn("+[MBAnalyticsEvent submitEventName:metrics:]", "MBAnalyticsEvent.m", 50, "eventName && metrics");
}

void sub_1000875B8()
{
  __assert_rtn("MBDiagnoseGetNumberOfFileExtents", "MBDiagnostics.m", 43, "ds_buffer");
}

void sub_1000875E0()
{
  __assert_rtn("MBDiagnoseFile", "MBDiagnostics.m", 365, "finfo");
}

void sub_100087608()
{
  __assert_rtn("MBDiagnoseFile", "MBDiagnostics.m", 379, "finfo->dstream_exists");
}

void sub_100087630()
{
  __assert_rtn("-[MBServiceCache initWithPath:domainManager:]", "MBServiceCache.m", 283, "domainManager");
}

void sub_100087658()
{
  __assert_rtn("-[MBDrive uploadBatch:options:completion:]", "MBDrive.m", 148, "result || error");
}

void sub_100087680()
{
  __assert_rtn("-[MBDriveBackupEngine initWithSettingsContext:debugContext:]", "MBDriveBackupEngine.m", 126, "!_preflightProperties");
}

void sub_1000876A8()
{
  __assert_rtn("-[MBDriveBackupEngine _setup]", "MBDriveBackupEngine.m", 405, "!self.password");
}

void sub_1000876D0()
{
  __assert_rtn("-[MBDriveBackupEngine _scanAllDomains]", "MBDriveBackupEngine.m", 1220, "snapshotMountPoint");
}

void sub_1000876F8()
{
  __assert_rtn("-[MBDriveBackupEngine _uploadInBatches]", "MBDriveBackupEngine.m", 1878, "_batchSize");
}

void sub_100087720()
{
  __assert_rtn("-[MBDriveBackupEngine _uploadInBatches]", "MBDriveBackupEngine.m", 1879, "_concurrentUploadBatchCount");
}

void sub_100087748()
{
  __assert_rtn("-[MBDriveBackupEngine _uploadInBatches]", "MBDriveBackupEngine.m", 1881, "drive");
}

void sub_100087770()
{
  __assert_rtn("-[MBDriveBackupEngine _uploadInBatches]", "MBDriveBackupEngine.m", 1890, "batchSize");
}

void sub_100087798()
{
  __assert_rtn("-[MBDriveBackupEngine _uploadInBatches]", "MBDriveBackupEngine.m", 1892, "driveSnapshotDir");
}

void sub_1000877C0()
{
  __assert_rtn("-[MBDriveBackupEngine _uploadInBatches]_block_invoke", "MBDriveBackupEngine.m", 2003, "finishError == nil");
}

void sub_1000877E8()
{
  __assert_rtn("-[MBDriveBackupEngine _uploadBatch:options:completion:]", "MBDriveBackupEngine.m", 2023, "batch");
}

void sub_100087810()
{
  __assert_rtn("-[MBDriveBackupEngine _uploadBatch:options:completion:]", "MBDriveBackupEngine.m", 2024, "completion");
}

void sub_100087838()
{
  __assert_rtn("-[MBDriveBackupEngine _uploadBatch:options:completion:]", "MBDriveBackupEngine.m", 2026, "drive");
}

void sub_100087860()
{
  __assert_rtn("-[MBDriveBackupEngine _compactSQLiteDatabaseAtPath:file:error:]", "MBDriveBackupEngine.m", 2619, "path");
}

void sub_100087888()
{
  __assert_rtn("-[MBDriveBackupEngine _compactSQLiteDatabaseAtPath:file:error:]", "MBDriveBackupEngine.m", 2620, "file");
}

void sub_1000878B0()
{
  __assert_rtn("-[MBDriveBackupEngine _compactSQLiteDatabaseAtPath:file:error:]", "MBDriveBackupEngine.m", 2621, "error");
}

void sub_1000878D8()
{
  __assert_rtn("-[MBDriveBackupEngine fileHandleWithPath:flags:mode:error:]", "MBDriveBackupEngine.m", 2658, "snapshotMountPoint");
}

void sub_100087900()
{
  __assert_rtn("-[MBDriveBackupEngine fileHandleWithPath:flags:mode:error:]", "MBDriveBackupEngine.m", 2669, "file");
}

void sub_100087928()
{
  __assert_rtn("-[MBKeyboardPlugin _updatePathsForKeyboardDomainWithEngine:]", "MBKeyboardPlugin.m", 81, "keyboardDomain");
}

void sub_100087950()
{
  __assert_rtn("+[MBFileOperation openFD:baseFD:rpath:flags:error:]", "MBFileOperation.m", 23, "fd");
}

void sub_100087978()
{
  __assert_rtn("+[MBFileOperation openFD:baseFD:rpath:flags:error:]", "MBFileOperation.m", 24, "baseFD != -1");
}

void sub_1000879A0()
{
  __assert_rtn("+[MBFileOperation openFD:baseFD:rpath:flags:error:]", "MBFileOperation.m", 25, "rpath");
}

void sub_1000879C8()
{
  __assert_rtn("+[MBFileOperation openFD:baseFD:rpath:flags:error:]", "MBFileOperation.m", 26, "flags");
}

void sub_1000879F0()
{
  __assert_rtn("+[MBFileOperation openFD:path:flags:error:]", "MBFileOperation.m", 40, "fd");
}

void sub_100087A18()
{
  __assert_rtn("+[MBFileOperation openFD:path:flags:error:]", "MBFileOperation.m", 41, "path");
}

void sub_100087A40()
{
  __assert_rtn("+[MBFileOperation openFD:path:flags:error:]", "MBFileOperation.m", 42, "flags");
}

void sub_100087A68()
{
  __assert_rtn("+[MBFileOperation closeFD:path:error:]", "MBFileOperation.m", 56, "fd != -1");
}

void sub_100087A90()
{
  __assert_rtn("+[MBFileOperation exists:atBasePath:baseFD:rpath:error:]", "MBFileOperation.m", 68, "existsOut");
}

void sub_100087AB8()
{
  __assert_rtn("+[MBFileOperation exists:atBasePath:baseFD:rpath:error:]", "MBFileOperation.m", 69, "basePath");
}

void sub_100087AE0()
{
  __assert_rtn("+[MBFileOperation exists:atBasePath:baseFD:rpath:error:]", "MBFileOperation.m", 70, "baseFD != -1");
}

void sub_100087B08()
{
  __assert_rtn("+[MBFileOperation exists:atBasePath:baseFD:rpath:error:]", "MBFileOperation.m", 71, "rpath");
}

void sub_100087B30()
{
  __assert_rtn("+[MBFileOperation rename:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:flags:error:]", "MBFileOperation.m", 94, "sourceBaseFD != -1");
}

void sub_100087B58()
{
  __assert_rtn("+[MBFileOperation rename:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:flags:error:]", "MBFileOperation.m", 95, "sourceRpath");
}

void sub_100087B80()
{
  __assert_rtn("+[MBFileOperation rename:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:flags:error:]", "MBFileOperation.m", 96, "destinationBasePath");
}

void sub_100087BA8()
{
  __assert_rtn("+[MBFileOperation rename:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:flags:error:]", "MBFileOperation.m", 97, "destinationBaseFD != -1");
}

void sub_100087BD0()
{
  __assert_rtn("+[MBFileOperation rename:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:flags:error:]", "MBFileOperation.m", 98, "destinationRpath");
}

void sub_100087BF8()
{
  __assert_rtn("+[MBFileOperation hardlink:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 114, "sourceBaseFD != -1");
}

void sub_100087C20()
{
  __assert_rtn("+[MBFileOperation hardlink:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 115, "sourceRpath");
}

void sub_100087C48()
{
  __assert_rtn("+[MBFileOperation hardlink:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 116, "destinationBasePath");
}

void sub_100087C70()
{
  __assert_rtn("+[MBFileOperation hardlink:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 117, "destinationBaseFD != -1");
}

void sub_100087C98()
{
  __assert_rtn("+[MBFileOperation hardlink:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 118, "destinationRpath");
}

void sub_100087CC0()
{
  __assert_rtn("+[MBFileOperation clone:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 134, "sourceBaseFD != -1");
}

void sub_100087CE8()
{
  __assert_rtn("+[MBFileOperation clone:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 135, "sourceRpath");
}

void sub_100087D10()
{
  __assert_rtn("+[MBFileOperation clone:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 136, "destinationBasePath");
}

void sub_100087D38()
{
  __assert_rtn("+[MBFileOperation clone:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 137, "destinationBaseFD != -1");
}

void sub_100087D60()
{
  __assert_rtn("+[MBFileOperation clone:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 138, "destinationRpath");
}

void sub_100087D88()
{
  __assert_rtn("+[MBFileOperation createDirectories:destinationBasePath:destinationRpath:permissions:error:]", "MBFileOperation.m", 154, "destinationBaseFD != 1");
}

void sub_100087DB0()
{
  __assert_rtn("+[MBFileOperation createDirectories:destinationBasePath:destinationRpath:permissions:error:]", "MBFileOperation.m", 155, "destinationBasePath");
}

void sub_100087DD8()
{
  __assert_rtn("+[MBFileOperation createDirectories:destinationBasePath:destinationRpath:permissions:error:]", "MBFileOperation.m", 156, "destinationRpath");
}

void sub_100087E00()
{
  __assert_rtn("+[MBFileOperation createDirectories:destinationBasePath:destinationRpath:permissions:error:]", "MBFileOperation.m", 157, "permissions");
}

void sub_100087E28()
{
  __assert_rtn("+[MBFileOperation unlink:targetBasePath:targetRpath:error:]", "MBFileOperation.m", 173, "targetBaseFD != 1");
}

void sub_100087E50()
{
  __assert_rtn("+[MBFileOperation unlink:targetBasePath:targetRpath:error:]", "MBFileOperation.m", 174, "targetRpath");
}

void sub_100087E78()
{
  __assert_rtn("+[MBFileOperation createPathInDirectory:fileName:]", "MBFileOperation.m", 190, "parentDir");
}

void sub_100087EA0()
{
  __assert_rtn("+[MBFileOperation crossVolumeCopyFromSource:toDestination:shouldDeleteSource:error:]", "MBFileOperation.m", 232, "src");
}

void sub_100087EC8()
{
  __assert_rtn("+[MBFileOperation crossVolumeCopyFromSource:toDestination:shouldDeleteSource:error:]", "MBFileOperation.m", 233, "dst");
}

void sub_100087EF0()
{
  __assert_rtn("+[MBFileOperation crossVolumeCopyFromSource:toDestination:shouldDeleteSource:error:]", "MBFileOperation.m", 234, "error");
}

void sub_100087F18()
{
  __assert_rtn("+[MBFileOperation crossVolumeCopyFrom:toDestination:shouldDeleteSource:error:]", "MBFileOperation.m", 240, "src");
}

void sub_100087F40()
{
  __assert_rtn("+[MBFileOperation crossVolumeCopyFrom:toDestination:shouldDeleteSource:error:]", "MBFileOperation.m", 241, "dst");
}

void sub_100087F68()
{
  __assert_rtn("+[MBFileOperation crossVolumeCopyFrom:toDestination:shouldDeleteSource:error:]", "MBFileOperation.m", 242, "error");
}

void sub_100087F90()
{
  __assert_rtn("+[MBFileOperation crossVolumeMoveFrom:intoDir:toFileNamed:error:]", "MBFileOperation.m", 263, "srcFilePath");
}

void sub_100087FB8()
{
  __assert_rtn("+[MBFileOperation crossVolumeMoveFrom:intoDir:toFileNamed:error:]", "MBFileOperation.m", 264, "parentDir");
}

void sub_100087FE0()
{
  __assert_rtn("+[MBFileOperation crossVolumeMoveFrom:intoDir:toFileNamed:error:]", "MBFileOperation.m", 265, "fileName");
}

void sub_100088008()
{
  __assert_rtn("+[MBFileOperation crossVolumeMoveFrom:intoDir:toFileNamed:error:]", "MBFileOperation.m", 266, "error");
}

void sub_100088030()
{
  __assert_rtn("-[MBDriveRestoreEngine _prepareEncryption]", "MBDriveRestoreEngine.m", 587, "!encrypted");
}

void sub_100088058()
{
  __assert_rtn("-[MBDriveRestoreEngine _prepareEncryption]", "MBDriveRestoreEngine.m", 588, "!password");
}

void sub_100088080()
{
  __assert_rtn("-[MBDriveRestoreEngine _restoreContent]_block_invoke", "MBDriveRestoreEngine.m", 900, "hardLinkPathFSR");
}

void sub_1000880A8()
{
  __assert_rtn("-[MBDriveRestoreEngine _restoreContent]_block_invoke", "MBDriveRestoreEngine.m", 902, "pathFSR");
}

void sub_1000880D0()
{
  __assert_rtn("-[MBATCBundlesPlugin _populatePathsForEngine:domain:dataclass:allBackupPaths:]", "MBATCBundlesPlugin.m", 69, "restoreType != ATRestoreTypeNone");
}

void sub_1000880F8()
{
  __assert_rtn("-[MBATCBundlesPlugin _populatePathsForEngine:domain:dataclass:allBackupPaths:]_block_invoke", "MBATCBundlesPlugin.m", 73, "path");
}

void sub_100088120()
{
  __assert_rtn("-[MBATCBundlesPlugin _populateAccountsForEngine:dataClasses:accountsTracker:]", "MBATCBundlesPlugin.m", 147, "accountsTracker");
}

void sub_100088148()
{
  __assert_rtn("-[MBATCBundlesPlugin _populateAccountsAndAssetsForEngine:accountsTracker:]", "MBATCBundlesPlugin.m", 215, "accountsTracker");
}

void sub_100088170()
{
  __assert_rtn("-[MBATCBundlesPlugin _populateAccountsAndAssetsForEngine:accountsTracker:]", "MBATCBundlesPlugin.m", 226, "acAccountStore");
}

void sub_100088198()
{
  __assert_rtn("WriteKeychainToDisk", "MBKeychainPlugin.m", 47, "path");
}

void sub_1000881C0()
{
  __assert_rtn("WriteKeychainToDisk", "MBKeychainPlugin.m", 48, "errorPtr");
}

void sub_1000881E8()
{
  __assert_rtn("RestoreKeychainFromDisk", "MBKeychainPlugin.m", 147, "path");
}

void sub_100088210()
{
  __assert_rtn("RestoreKeychainFromDisk", "MBKeychainPlugin.m", 148, "keybagData");
}

void sub_100088238()
{
  __assert_rtn("RestoreKeychainFromDisk", "MBKeychainPlugin.m", 149, "errorPtr");
}

void sub_100088260()
{
  __assert_rtn("-[MBKeychainPlugin _restoreKeychainBackupAtPath:withEngine:]", "MBKeychainPlugin.m", 479, "keyBagData");
}

void sub_100088288()
{
  __assert_rtn("_executeStatements", "MBManifestDB.m", 466, "error");
}

void sub_1000882B0()
{
  __assert_rtn("-[MBMobileInstallation _enumerateAppsWithEnumerationOptions:to:persona:dataSeparatedBundleIDs:]", "MBMobileInstallation.m", 339, "personaIdentifier");
}

void sub_1000882D8()
{
  __assert_rtn("-[MBMobileInstallation _enumerateAppsWithEnumerationOptions:to:persona:dataSeparatedBundleIDs:]", "MBMobileInstallation.m", 336, "isPersonalPersona || isDataSeparatedPersona");
}

void sub_100088300()
{
  __assert_rtn("+[MBMobileInstallation displayNamesForDomainNames:domainManager:]", "MBMobileInstallation.m", 682, "domainManager");
}

void sub_100088328()
{
  __assert_rtn("-[MBSQLiteDB _removeCorruptDatabaseWithError:]", "MBSQLiteDB.m", 136, "error");
}

void sub_100088350()
{
  __assert_rtn("-[MBSQLiteDB _removeCorruptDatabaseWithError:]", "MBSQLiteDB.m", 139, "path");
}

void sub_100088378()
{
  __assert_rtn("-[MBSQLiteDB _removeCorruptDatabaseWithError:]", "MBSQLiteDB.m", 146, "dir");
}

void sub_1000883A0()
{
  __assert_rtn("-[MBSQLiteDB _removeCorruptDatabaseWithError:]", "MBSQLiteDB.m", 148, "destinationPath");
}

void sub_1000883C8()
{
  __assert_rtn("-[MBSQLiteDB _openWithFlags:usePQLBatching:error:]", "MBSQLiteDB.m", 216, "localError");
}

void sub_1000883F0()
{
  __assert_rtn("-[MBSQLiteDB _openWithFlags:usePQLBatching:error:]", "MBSQLiteDB.m", 208, "localError");
}

void sub_100088418()
{
  __assert_rtn("-[MBSQLiteDB _makePQLConnectionWithFlags:usePQLBatching:error:]", "MBSQLiteDB.m", 225, "error");
}

void sub_100088440()
{
  __assert_rtn("-[MBSQLiteDB _makePQLConnectionWithFlags:usePQLBatching:error:]", "MBSQLiteDB.m", 232, "self.schemaMinDatabaseVersionForUpgrade <= self.schemaCurrentVersion");
}

void sub_100088468()
{
  __assert_rtn("-[MBSQLiteDB _makePQLConnectionWithFlags:usePQLBatching:error:]", "MBSQLiteDB.m", 243, "path");
}

void sub_100088490()
{
  __assert_rtn("-[MBSQLiteDB _makePQLConnectionWithFlags:usePQLBatching:error:]", "MBSQLiteDB.m", 245, "dbHandle");
}

void sub_1000884B8()
{
  __assert_rtn("-[MBSQLiteDB _openPQLConnectionWithFlags:error:]", "MBSQLiteDB.m", 290, "error");
}

void sub_1000884E0()
{
  __assert_rtn("-[MBSQLiteDB _openPQLConnectionWithFlags:error:]", "MBSQLiteDB.m", 295, "path");
}

void sub_100088508()
{
  __assert_rtn("-[MBSQLiteDB _openPQLConnectionWithFlags:error:]", "MBSQLiteDB.m", 297, "url");
}

void sub_100088530()
{
  __assert_rtn("-[MBSQLiteDB _removeDatabaseAtPath:error:]", "MBSQLiteDB.m", 375, "path");
}

void sub_100088558()
{
  __assert_rtn("-[MBSQLiteDB _removeDatabaseAtPath:error:]", "MBSQLiteDB.m", 376, "error");
}

void sub_100088580()
{
  __assert_rtn("+[MBIgnoredAccountsTracker _isEnterpriseAccount:]", "MBIgnoredAccountsTracker.m", 38, "account");
}

void sub_1000885A8()
{
  __assert_rtn("+[MBIgnoredAccountsTracker _isEnterpriseAccount:]", "MBIgnoredAccountsTracker.m", 50, "[personaIdentifier isEqualToString:attributes.userPersonaUniqueString]");
}

void sub_1000885D0()
{
  __assert_rtn("-[MBPersona(Preferences) setPreferencesValue:forKey:]", "MBPersona+Preferences.m", 18, "key");
}

void sub_1000885F8()
{
  __assert_rtn("-[MBPersona(Preferences) copyPreferencesValueForKey:class:]", "MBPersona+Preferences.m", 73, "key");
}

void sub_100088620()
{
  __assert_rtn("-[MBFile initWithDomain:snapshotPath:relativePath:]", "MBFile.m", 94, "!snapshotPath || domain.volumeMountPoint");
}

void sub_100088648()
{
  __assert_rtn("-[MBRestorePolicy initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:]", "MBRestorePolicy.m", 44, "persona");
}

void sub_100088670()
{
  __assert_rtn("-[MBRestorePolicy initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:]", "MBRestorePolicy.m", 45, "appManager");
}

void sub_100088698()
{
  __assert_rtn("-[MBRestorePolicy _enginePolicy]", "MBRestorePolicy.m", 67, "_enginePolicy");
}

void sub_1000886C0()
{
  __assert_rtn("-[MBRestorePolicy shouldRestoreFile:markFileAsSkipped:error:]", "MBRestorePolicy.m", 219, "domain");
}

void sub_1000886E8()
{
  __assert_rtn("-[MBPersona(Helpers) _removeTemporaryDirectories]", "MBPersona+Helpers.m", 80, "volumeMountPoint");
}

void sub_100088710()
{
  __assert_rtn("-[MBAppleCarePlugin _logEventWithSubtype:code:]", "MBAppleCarePlugin.m", 19, "subtype");
}

void sub_100088738()
{
  __assert_rtn("-[MBDeviceTools listWithError:]", "MBDeviceTools.m", 221, "error");
}

void sub_100088760()
{
  __assert_rtn("-[MBRestoreAppsPlugin startingBackupWithEngine:]", "MBRestoreAppsPlugin.m", 54, "demotedAppsPlistPath");
}

void sub_100088788()
{
  __assert_rtn("-[MBRestoreAppsPlugin startingBackupWithEngine:]", "MBRestoreAppsPlugin.m", 55, "isPrimaryAccount || personaIdentifier");
}

void sub_1000887B0()
{
  __assert_rtn("-[MBDriveEncryptionManager changePasswordFrom:toPassword:error:]", "MBDriveEncryptionManager.m", 86, "passcodePromptContext");
}

void sub_1000887D8()
{
  __assert_rtn("-[MBDriveEncryptionManager changePasswordFrom:toPassword:error:]", "MBDriveEncryptionManager.m", 88, "laOptions");
}

void sub_100088800()
{
  __assert_rtn("+[MBKeyBag startOTABackupForVolumeUUID:]", "MBKeyBag.m", 235, "volumeUUIDData");
}

void sub_100088828()
{
  __assert_rtn("+[MBKeyBag stopOTABackupForVolumeUUID:]", "MBKeyBag.m", 250, "volumeUUIDData");
}

void sub_100088850()
{
  __assert_rtn("-[MBKeyBag unlockWithSecret:error:]", "MBKeyBag.m", 312, "_isUnlocked");
}

void sub_100088878()
{
  __assert_rtn("-[MBKeyBag encryptedFileForRestoreWithPath:key:error:]", "MBKeyBag.m", 554, "key");
}

void sub_1000888A0()
{
  __assert_rtn("-[MBEncryptedFileHandle encryptionKeyWithError:]", "MBEncryptedFileHandle.m", 101, "_keybag");
}

void sub_1000888C8()
{
  __assert_rtn("-[MBEncryptedFileHandle validateEncryptionKey:error:]", "MBEncryptedFileHandle.m", 106, "_keybag");
}

void sub_1000888F0()
{
  __assert_rtn("-[MBDataMigratorPlugin _setDMContextWithPolicy:engine:]", "MBDataMigratorPlugin.m", 117, "!restoredFromCloudBackup");
}

void sub_100088918()
{
  __assert_rtn("-[MBDataMigratorPlugin _setDMContextWithPolicy:engine:]", "MBDataMigratorPlugin.m", 118, "!restoredFromiTunesBackup");
}

void sub_100088940()
{
  __assert_rtn("-[MBDataMigratorPlugin _setDMContextWithPolicy:engine:]", "MBDataMigratorPlugin.m", 138, "reason");
}

void sub_100088968()
{
  __assert_rtn("-[MBDataMigratorPlugin _setDMContextWithPolicy:engine:]", "MBDataMigratorPlugin.m", 126, "!restoredFromCloudBackup || !restoredFromiTunesBackup");
}

void sub_100088990()
{
  __assert_rtn("-[MBDataMigratorPlugin _setDMContextWithPolicy:engine:]", "MBDataMigratorPlugin.m", 127, "!restoredFromiTunesBackup || !restoredFromCloudBackup");
}

void sub_1000889B8()
{
  __assert_rtn("-[MBDataMigratorPlugin _setDMContextWithPolicy:engine:]", "MBDataMigratorPlugin.m", 135, "backupType");
}

void sub_1000889E0()
{
  __assert_rtn("-[MBDataMigratorPlugin _updateMobileBackupPreferencesWithEngine:]", "MBDataMigratorPlugin.m", 194, "persona");
}

void sub_100088A08()
{
  __assert_rtn("-[MBWiFiPlugin endingRestoreWithPolicy:engine:]", "MBWiFiPlugin.m", 67, "wifiPathToMerge");
}

void sub_100088A30()
{
  __assert_rtn("+[MBDriveRestoreDomainManagerDelegate domainForName:containerID:engine:]", "MBDriveRestoreDomainManagerDelegate.m", 17, "persona");
}

void sub_100088A58()
{
  __assert_rtn("+[MBDriveRestoreDomainManagerDelegate domainForName:containerID:engine:]", "MBDriveRestoreDomainManagerDelegate.m", 18, "containerID");
}

void sub_100088A80()
{
  __assert_rtn("-[PQLConnection(MBAdditions) executeStatements:error:]", "PQLConnection+MBAdditions.m", 63, "error");
}

void sub_100088AA8()
{
  __assert_rtn("-[PQLConnection(MBAdditions) performSchemaUpgrades:isReadOnly:error:]", "PQLConnection+MBAdditions.m", 102, "schemaUpgrades");
}

void sub_100088AD0()
{
  __assert_rtn("-[PQLConnection(MBAdditions) performSchemaUpgrades:isReadOnly:error:]", "PQLConnection+MBAdditions.m", 103, "error");
}

void sub_100088AF8()
{
  __assert_rtn("-[PQLConnection(MBAdditions) _performSchemaUpgrade:fromDatabaseVersion:error:]", "PQLConnection+MBAdditions.m", 137, "error");
}

void sub_100088B20()
{
  __assert_rtn("-[NSObject(MBRestorableMixin) moveFileFromSource:destination:destinationSize:conflictResolution:error:]", "MBRestorable.m", 238, "operation != MBFileRestoreOperationUnspecified");
}

void sub_100088B48()
{
  __assert_rtn("FetchAndSetData", "LookupInstalledApps.m", 35, "error");
}

void sub_100088B70()
{
  __assert_rtn("+[MBSQLiteFileHandle compactSQLiteDatabaseAtPath:toPath:error:]", "MBSQLiteFileHandle.m", 116, "errorPtr");
}

void sub_100088B98()
{
  __assert_rtn("+[MBSQLiteFileHandle compactSQLiteDatabaseAtPath:toPath:error:]", "MBSQLiteFileHandle.m", 209, "error");
}

void sub_100088BC0()
{
  __assert_rtn("-[MBSiriPlugin startingBackupWithEngine:]", "MBSiriPlugin.m", 26, "homeDomain");
}

void sub_100088BE8()
{
  __assert_rtn("-[MBSiriPlugin startingRestoreWithPolicy:engine:]", "MBSiriPlugin.m", 60, "homeDomain");
}

void sub_100088C10()
{
  __assert_rtn("-[MBMountedSnapshotTracker trackSnapshotForVolume:snapshotName:mountPount:]", "MBMountedSnapshotTracker.m", 47, "_snapshotMountPointsByVolume[volumeMountPoint] == nil");
}

void sub_100088C38()
{
  __assert_rtn("-[MBFileScanner initWithDelegate:mode:enginePolicy:debugContext:]", "MBFileScanner.m", 66, "mode != MBFileScannerModeUnspecified");
}

void sub_100088C60()
{
  __assert_rtn("-[MBFileScanner _shouldNotBackupFile:domain:]", "MBFileScanner.m", 271, "!isMegaBackupPolicy || _isCloudKitEngine(_policy)");
}

void sub_100088C88()
{
  __assert_rtn("_checkedNameFromRef", "MBNode.m", 104, "nameOffset + nameLen <= bufferEnd");
}

void sub_100088CB0()
{
  __assert_rtn("_checkedNameFromRef", "MBNode.m", 105, "nameOffset[nameLen - 1] == '\\0'");
}

void sub_100088CD8()
{
  __assert_rtn("MBEnumerateDirectoryNodes", "MBNode.m", 148, "byteOffset < attrBufSize");
}

void sub_100088D00()
{
  __assert_rtn("_mbNodeFromAttrs", "MBNode.m", 230, "mbNode");
}

void sub_100088D28()
{
  __assert_rtn("MBNodeForPath", "MBNode.m", 187, "path");
}

void sub_100088D50()
{
  __assert_rtn("MBNodeForPath", "MBNode.m", 188, "mbNode");
}

void sub_100088D78()
{
  __assert_rtn("MBNodeForRelativePathAt", "MBNode.m", 213, "fd >= 0");
}

void sub_100088DA0()
{
  __assert_rtn("MBNodeForRelativePathAt", "MBNode.m", 214, "relativePath");
}

void sub_100088DC8()
{
  __assert_rtn("MBNodeForRelativePathAt", "MBNode.m", 215, "mbNode");
}

void sub_100088DF0()
{
  __assert_rtn("MBRequiredProductVersion", "MBEngine.m", 46, "productVersion");
}

void sub_100088E18()
{
  __assert_rtn("-[MBEngine cancelWithError:]", "MBEngine.m", 186, "self.cancelError");
}

void sub_100088E40()
{
  __assert_rtn("-[MBiTunesStorePlugin endingRestoreWithPolicy:engine:]", "MBiTunesStorePlugin.m", 62, "persona");
}

void sub_100088E68()
{
  __assert_rtn("-[MBScreenTimePlugin _updatePathsForHomeDomainWithEngine:]", "MBScreenTimePlugin.m", 40, "homeDomain");
}

void sub_100088E90()
{
  __assert_rtn("-[MBPersona(RestoreLocationAdditions) restorePathForRestorable:]", "MBPersona+RestoreLocations.m", 23, "restorable");
}

void sub_100088EB8()
{
  __assert_rtn("-[MBPersona(RestoreLocationAdditions) _restorePathForDomain:isSystemContainer:]", "MBPersona+RestoreLocations.m", 37, "domain");
}

void sub_100088EE0()
{
  __assert_rtn("-[MBPersona(RestoreLocationAdditions) _restorePathForDomain:isSystemContainer:]", "MBPersona+RestoreLocations.m", 38, "isSystemContainerOut");
}

void sub_100088F08()
{
  __assert_rtn("+[MBPersona(RestoreLocationAdditions) _stashFileAtURL:prefetchDirectory:error:]", "MBPersona+RestoreLocations.m", 73, "srcURL");
}

void sub_100088F30()
{
  __assert_rtn("+[MBPersona(RestoreLocationAdditions) _stashFileAtURL:prefetchDirectory:error:]", "MBPersona+RestoreLocations.m", 74, "prefetchDirectory");
}

void sub_100088F58()
{
  __assert_rtn("+[MBPersona(RestoreLocationAdditions) _stashFileAtURL:prefetchDirectory:error:]", "MBPersona+RestoreLocations.m", 75, "error");
}

void sub_100088F80()
{
  __assert_rtn("-[MBPersona(RestoreLocationAdditions) finalizeRestoreDirectoriesWithError:]", "MBPersona+RestoreLocations.m", 309, "error");
}

void sub_100088FA8()
{
  __assert_rtn("-[MBPersona(RestoreLocationAdditions) _moveRestoreDirectoryFrom:toFinalLocation:error:]", "MBPersona+RestoreLocations.m", 328, "outError");
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DSID");
}

id objc_msgSend_MBFileWithDomainManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MBFileWithDomainManager:");
}

id objc_msgSend_NSURLRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NSURLRequest");
}

id objc_msgSend_SQLiteFileHandleWithOriginalFileHandle_copiedFileHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SQLiteFileHandleWithOriginalFileHandle:copiedFileHandle:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_UUIDWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDWithError:");
}

id objc_msgSend__addBackupPathsNotInManifestDB_operationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addBackupPathsNotInManifestDB:operationType:");
}

id objc_msgSend__addFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addFile:");
}

id objc_msgSend__addFileToLeaveAlone_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addFileToLeaveAlone:flags:");
}

id objc_msgSend__addFileToMove_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addFileToMove:");
}

id objc_msgSend__addFileToUploadAndMove_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addFileToUploadAndMove:flags:");
}

id objc_msgSend__addMetadataToFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addMetadataToFile:");
}

id objc_msgSend__addRelativePathsToPathsToBackupAndRestore_forDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addRelativePathsToPathsToBackupAndRestore:forDomain:");
}

id objc_msgSend__annotate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_annotate");
}

id objc_msgSend__annotateNotBackedUpDomain_relativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_annotateNotBackedUpDomain:relativePath:");
}

id objc_msgSend__annotatePath_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_annotatePath:value:");
}

id objc_msgSend__annotateRestoredDomain_relativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_annotateRestoredDomain:relativePath:");
}

id objc_msgSend__backupAfterPreflight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_backupAfterPreflight");
}

id objc_msgSend__baseRestorePathForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baseRestorePathForDomain:");
}

id objc_msgSend__changeBackupKeyBagPasswordInProperties_fromPassword_toPassword_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_changeBackupKeyBagPasswordInProperties:fromPassword:toPassword:error:");
}

id objc_msgSend__checkCompatibility(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkCompatibility");
}

id objc_msgSend__checkPassword_withPasswordHash_andSalt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkPassword:withPasswordHash:andSalt:");
}

id objc_msgSend__checkinWithConnectionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkinWithConnectionInfo:");
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanup");
}

id objc_msgSend__cleanupDeviceSnapshotDir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupDeviceSnapshotDir");
}

id objc_msgSend__closeCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_closeCache:");
}

id objc_msgSend__compactSQLiteDatabaseAtPath_file_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_compactSQLiteDatabaseAtPath:file:error:");
}

id objc_msgSend__containerClassForMBContainerType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_containerClassForMBContainerType:");
}

id objc_msgSend__defaultSubdirectoriesForMCMContainerType_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultSubdirectoriesForMCMContainerType:withError:");
}

id objc_msgSend__detectModifiedDomain_relativePath_lastModified_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_detectModifiedDomain:relativePath:lastModified:");
}

id objc_msgSend__deviceIsNonAopDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceIsNonAopDevice");
}

id objc_msgSend__deviceSnapshotDir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceSnapshotDir");
}

id objc_msgSend__deviceSnapshotManifestDatabasePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceSnapshotManifestDatabasePath");
}

id objc_msgSend__deviceSnapshotPropertiesPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceSnapshotPropertiesPath");
}

id objc_msgSend__disabledDomainNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disabledDomainNames");
}

id objc_msgSend__enableCloudBackupMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableCloudBackupMessage:");
}

id objc_msgSend__endingRestoreWithDriveEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endingRestoreWithDriveEngine:");
}

id objc_msgSend__endingRestoreWithServicePolicy_engine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endingRestoreWithServicePolicy:engine:");
}

id objc_msgSend__enginePolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enginePolicy");
}

id objc_msgSend__enumerateAppsWithEnumerationOptions_to_persona_dataSeparatedBundleIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enumerateAppsWithEnumerationOptions:to:persona:dataSeparatedBundleIDs:");
}

id objc_msgSend__eraseDeviceMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_eraseDeviceMessage:");
}

id objc_msgSend__errorWithSQL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorWithSQL:");
}

id objc_msgSend__exec_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_exec:");
}

id objc_msgSend__executeSQL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_executeSQL:");
}

id objc_msgSend__expandedSQL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_expandedSQL");
}

id objc_msgSend__exportKeychainForCKBackupEngine_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_exportKeychainForCKBackupEngine:error:");
}

id objc_msgSend__extractWithManifest_file_keybag_toDrivePath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extractWithManifest:file:keybag:toDrivePath:error:");
}

id objc_msgSend__fetch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetch");
}

id objc_msgSend__fileChangeFromStmt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileChangeFromStmt:");
}

id objc_msgSend__fileForFD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileForFD:");
}

id objc_msgSend__fileHandleWithPath_flags_mode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileHandleWithPath:flags:mode:error:");
}

id objc_msgSend__fileSystemSupportsSparseFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileSystemSupportsSparseFiles:");
}

id objc_msgSend__fileWithStmt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileWithStmt:");
}

id objc_msgSend__finalizeAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finalizeAll");
}

id objc_msgSend__findPathsRemovedFromBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findPathsRemovedFromBackup");
}

id objc_msgSend__foundFile_snapshotPath_stats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_foundFile:snapshotPath:stats:");
}

id objc_msgSend__handleBackupMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleBackupMessage:");
}

id objc_msgSend__handleChangePasswordMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleChangePasswordMessage:");
}

id objc_msgSend__handleExtractMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleExtractMessage:");
}

id objc_msgSend__handleHelloMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleHelloMessage:");
}

id objc_msgSend__handleInfoMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleInfoMessage:");
}

id objc_msgSend__handleListMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleListMessage:");
}

id objc_msgSend__handleRemoveMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleRemoveMessage:");
}

id objc_msgSend__handleRestoreMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleRestoreMessage:");
}

id objc_msgSend__handleUnbackMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleUnbackMessage:");
}

id objc_msgSend__initWithDatabase_creationError_resultSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithDatabase:creationError:resultSet:");
}

id objc_msgSend__initWithRequest_delegate_usesCache_maxContentLength_startImmediately_connectionProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:");
}

id objc_msgSend__initWithType_value_errorCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithType:value:errorCode:");
}

id objc_msgSend__initWithType_values_errorCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithType:values:errorCode:");
}

id objc_msgSend__invalidate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidate:");
}

id objc_msgSend__invalidatedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidatedError");
}

id objc_msgSend__isCloudKitEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isCloudKitEngine");
}

id objc_msgSend__isDeviceTransferEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isDeviceTransferEngine");
}

id objc_msgSend__isDriveEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isDriveEngine");
}

id objc_msgSend__isDriveOrMegaBackupPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isDriveOrMegaBackupPolicy");
}

id objc_msgSend__isEncrypted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isEncrypted");
}

id objc_msgSend__isEnterpriseAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isEnterpriseAccount:");
}

id objc_msgSend__isForegroundRestore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isForegroundRestore");
}

id objc_msgSend__isMegaBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isMegaBackup");
}

id objc_msgSend__isModifiedSince_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isModifiedSince:error:");
}

id objc_msgSend__isNotFoundError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isNotFoundError:");
}

id objc_msgSend__isServiceEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isServiceEngine");
}

id objc_msgSend__lastInsertRowID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lastInsertRowID");
}

id objc_msgSend__lastRefreshPropertyKeyForBackupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lastRefreshPropertyKeyForBackupUDID:");
}

id objc_msgSend__localRootPathForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localRootPathForDomain:");
}

id objc_msgSend__logEventWithSubtype_code_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logEventWithSubtype:code:");
}

id objc_msgSend__logProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logProfile");
}

id objc_msgSend__makeAnnotatedIntermediatePaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_makeAnnotatedIntermediatePaths:");
}

id objc_msgSend__makeEmptyAnnotationFileWithPath_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_makeEmptyAnnotationFileWithPath:value:");
}

id objc_msgSend__makePQLConnectionWithFlags_usePQLBatching_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_makePQLConnectionWithFlags:usePQLBatching:error:");
}

id objc_msgSend__mkdir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mkdir:");
}

id objc_msgSend__moveBatchWithPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveBatchWithPaths:");
}

id objc_msgSend__moveInBatchesWithOperationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveInBatchesWithOperationType:");
}

id objc_msgSend__moveRestoreDirectoryFrom_toFinalLocation_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveRestoreDirectoryFrom:toFinalLocation:error:");
}

id objc_msgSend__moveRestoreDirs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveRestoreDirs");
}

id objc_msgSend__moveWithOperationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveWithOperationType:");
}

id objc_msgSend__newConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newConnection:");
}

id objc_msgSend__openBackupManifestForResume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openBackupManifestForResume");
}

id objc_msgSend__openCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openCache");
}

id objc_msgSend__openPQLConnectionWithFlags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openPQLConnectionWithFlags:error:");
}

id objc_msgSend__openWithFlags_usePQLBatching_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openWithFlags:usePQLBatching:error:");
}

id objc_msgSend__passwordHashWithPassword_salt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_passwordHashWithPassword:salt:");
}

id objc_msgSend__perform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_perform:");
}

id objc_msgSend__performOnDBQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performOnDBQueue:");
}

id objc_msgSend__performSchemaUpgrade_fromDatabaseVersion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performSchemaUpgrade:fromDatabaseVersion:error:");
}

id objc_msgSend__performSinglePassEnumerationForDomain_snapshotPath_relativePath_buffer_dirFd_direntCount_directoryPathStack_directoryCountStack_stats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performSinglePassEnumerationForDomain:snapshotPath:relativePath:buffer:dirFd:direntCount:directoryPathStack:directoryCountStack:stats:");
}

id objc_msgSend__performTwoPassEnumerationForDomain_snapshotPath_relativePath_buffer_dirFd_directoryPathStack_directoryCountStack_stats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performTwoPassEnumerationForDomain:snapshotPath:relativePath:buffer:dirFd:directoryPathStack:directoryCountStack:stats:");
}

id objc_msgSend__pluginsAllowForegroundRestoreFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pluginsAllowForegroundRestoreFile:");
}

id objc_msgSend__policyElementsForEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_policyElementsForEngine:");
}

id objc_msgSend__populatePathsForEngine_domain_dataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_populatePathsForEngine:domain:dataclass:");
}

id objc_msgSend__populatePathsForEngine_domainName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_populatePathsForEngine:domainName:");
}

id objc_msgSend__postNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_postNotification:");
}

id objc_msgSend__postconditions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_postconditions");
}

id objc_msgSend__preconditions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preconditions");
}

id objc_msgSend__preflight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preflight");
}

id objc_msgSend__prepare(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepare");
}

id objc_msgSend__prepare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepare:");
}

id objc_msgSend__prepareCopyBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareCopyBackup");
}

id objc_msgSend__prepareEncryption(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareEncryption");
}

id objc_msgSend__prepareForPreflight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareForPreflight");
}

id objc_msgSend__prepareForUpload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareForUpload");
}

id objc_msgSend__prepareFreeSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareFreeSpace");
}

id objc_msgSend__prepareMoveBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareMoveBackup");
}

id objc_msgSend__prepareProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareProgress");
}

id objc_msgSend__prepareResume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareResume");
}

id objc_msgSend__prepareSnapshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareSnapshot");
}

id objc_msgSend__preparingBackupWithCKEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preparingBackupWithCKEngine:");
}

id objc_msgSend__preparingBackupWithDriveEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preparingBackupWithDriveEngine:");
}

id objc_msgSend__profile_time_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_profile:time:");
}

id objc_msgSend__raise_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_raise:");
}

id objc_msgSend__rebuildSnapshot_backupUDID_service_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rebuildSnapshot:backupUDID:service:error:");
}

id objc_msgSend__recordCurrentTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recordCurrentTime");
}

id objc_msgSend__remove(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remove");
}

id objc_msgSend__removeBatchWithPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeBatchWithPaths:");
}

id objc_msgSend__removeCorruptDatabaseWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeCorruptDatabaseWithError:");
}

id objc_msgSend__removeCorruptDatabaseWithError_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeCorruptDatabaseWithError:completion:");
}

id objc_msgSend__removeDatabaseAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeDatabaseAtPath:error:");
}

id objc_msgSend__removeDeviceSnapshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeDeviceSnapshot");
}

id objc_msgSend__removeFileWithFD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeFileWithFD:");
}

id objc_msgSend__removeFilesystemSnapshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeFilesystemSnapshot");
}

id objc_msgSend__removeInBatchesWithOperationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeInBatchesWithOperationType:");
}

id objc_msgSend__removeOldBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeOldBackup");
}

id objc_msgSend__removeRelativePathsFromPathsNotToBackup_forDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeRelativePathsFromPathsNotToBackup:forDomain:");
}

id objc_msgSend__removeRelativePathsFromPathsNotToRestore_forDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeRelativePathsFromPathsNotToRestore:forDomain:");
}

id objc_msgSend__removeRestorePrefetchCacheAtPath_earliestDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeRestorePrefetchCacheAtPath:earliestDate:");
}

id objc_msgSend__removeSnapshotForID_backupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeSnapshotForID:backupUDID:");
}

id objc_msgSend__removeTemporaryDirectories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeTemporaryDirectories");
}

id objc_msgSend__removeWithOperationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeWithOperationType:");
}

id objc_msgSend__restore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restore");
}

id objc_msgSend__restoreContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreContent");
}

id objc_msgSend__restoreDefaultsWithEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreDefaultsWithEngine:");
}

id objc_msgSend__restoreDirectoryModificationTimes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreDirectoryModificationTimes");
}

id objc_msgSend__restoreFileWithStmt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreFileWithStmt:");
}

id objc_msgSend__restoreFilesWithStmt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreFilesWithStmt:");
}

id objc_msgSend__restoreKeychainBackupAtPath_withEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreKeychainBackupAtPath:withEngine:");
}

id objc_msgSend__restorePathForDomain_isSystemContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restorePathForDomain:isSystemContainer:");
}

id objc_msgSend__restoreRegularFiles_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreRegularFiles:size:");
}

id objc_msgSend__resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resume");
}

id objc_msgSend__resumeAfterFailureMoving(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resumeAfterFailureMoving");
}

id objc_msgSend__resumeAfterFailureRemoving(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resumeAfterFailureRemoving");
}

id objc_msgSend__resumeAfterFailureUploading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resumeAfterFailureUploading");
}

id objc_msgSend__resumeAfterSuccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resumeAfterSuccess");
}

id objc_msgSend__retry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retry");
}

id objc_msgSend__savePurpleBuddyRestoreState_persona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_savePurpleBuddyRestoreState:persona:");
}

id objc_msgSend__scan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scan");
}

id objc_msgSend__scanAllDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scanAllDomains");
}

id objc_msgSend__scanDirectory_domain_domainDirFd_snapshotPath_relativePath_depth_stats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scanDirectory:domain:domainDirFd:snapshotPath:relativePath:depth:stats:");
}

id objc_msgSend__scanDomain_snapshotPath_stats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scanDomain:snapshotPath:stats:");
}

id objc_msgSend__scanFilesForDomain_snapshotPath_relativePath_stats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scanFilesForDomain:snapshotPath:relativePath:stats:");
}

id objc_msgSend__scanFilesUsingGetattrlistbulkForDomain_snapshotPath_relativePath_stats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scanFilesUsingGetattrlistbulkForDomain:snapshotPath:relativePath:stats:");
}

id objc_msgSend__scanFilesUsingReaddirForDomain_snapshotPath_relativePath_depth_stats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scanFilesUsingReaddirForDomain:snapshotPath:relativePath:depth:stats:");
}

id objc_msgSend__scanFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scanFinished");
}

id objc_msgSend__scanTree_forDomain_snapshotPath_relativePath_stats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scanTree:forDomain:snapshotPath:relativePath:stats:");
}

id objc_msgSend__scheduleDrain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleDrain");
}

id objc_msgSend__sendResponseMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendResponseMessage:");
}

id objc_msgSend__sendResponseMessageWithCode_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendResponseMessageWithCode:description:");
}

id objc_msgSend__sendResponseMessageWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendResponseMessageWithError:");
}

id objc_msgSend__sendSuccessResponseMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendSuccessResponseMessage");
}

id objc_msgSend__sendSuccessResponseMessageWithProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendSuccessResponseMessageWithProperties:");
}

id objc_msgSend__setDMContextWithPolicy_engine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setDMContextWithPolicy:engine:");
}

id objc_msgSend__setLockdownValue_forDomain_key_connection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLockdownValue:forDomain:key:connection:");
}

id objc_msgSend__setProperty_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setProperty:forKey:");
}

id objc_msgSend__setProtectionClassWithPathFSR_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setProtectionClassWithPathFSR:");
}

id objc_msgSend__setPurpleBuddyRestoreState_withEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPurpleBuddyRestoreState:withEngine:");
}

id objc_msgSend__setState_forToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setState:forToken:");
}

id objc_msgSend__setUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setUp");
}

id objc_msgSend__settingsContextWithSourceIdentifier_targetIdentifier_applicationIDs_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_settingsContextWithSourceIdentifier:targetIdentifier:applicationIDs:options:");
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setup");
}

id objc_msgSend__setupCacheWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupCacheWithError:");
}

id objc_msgSend__setupConnectionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupConnectionWithError:");
}

id objc_msgSend__setupEncryption(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupEncryption");
}

id objc_msgSend__setupManifestDB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupManifestDB");
}

id objc_msgSend__setupOperationJournal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupOperationJournal");
}

id objc_msgSend__setupSnapshotDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupSnapshotDirectory");
}

id objc_msgSend__shouldNotBackupFile_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldNotBackupFile:domain:");
}

id objc_msgSend__shouldRestoreContentWithFile_quiet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldRestoreContentWithFile:quiet:");
}

id objc_msgSend__shouldRetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldRetry");
}

id objc_msgSend__snapshotFilesystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_snapshotFilesystem");
}

id objc_msgSend__snapshotWithStmt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_snapshotWithStmt:");
}

id objc_msgSend__standardizePath_fromDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_standardizePath:fromDomain:");
}

id objc_msgSend__stashFileAtURL_prefetchDirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stashFileAtURL:prefetchDirectory:error:");
}

id objc_msgSend__stateForToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stateForToken:");
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stop");
}

id objc_msgSend__stopWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopWithError:");
}

id objc_msgSend__stringValueForStats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stringValueForStats:");
}

id objc_msgSend__systemContainersWithError_shared_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemContainersWithError:shared:");
}

id objc_msgSend__temporaryPathForFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_temporaryPathForFile:");
}

id objc_msgSend__tokenForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tokenForName:");
}

id objc_msgSend__typeString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_typeString");
}

id objc_msgSend__updateDeviceTransferInfoWithPlist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDeviceTransferInfoWithPlist:");
}

id objc_msgSend__updateMobileBackupPreferencesWithEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateMobileBackupPreferencesWithEngine:");
}

id objc_msgSend__updatePathsForHomeDomainWithEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePathsForHomeDomainWithEngine:");
}

id objc_msgSend__updatePathsForKeyboardDomainWithEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePathsForKeyboardDomainWithEngine:");
}

id objc_msgSend__updateStats_file_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateStats:file:");
}

id objc_msgSend__upload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_upload");
}

id objc_msgSend__uploadBatch_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uploadBatch:options:completion:");
}

id objc_msgSend__uploadInBatches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uploadInBatches");
}

id objc_msgSend__uploadStatusToDriveWithSnapshotState_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uploadStatusToDriveWithSnapshotState:error:");
}

id objc_msgSend__verifyBackupReloadingManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_verifyBackupReloadingManifest:");
}

id objc_msgSend__waitForRebootSignal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_waitForRebootSignal");
}

id objc_msgSend_aa_altDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_altDSID");
}

id objc_msgSend_aa_appleAccountWithPersonID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_appleAccountWithPersonID:");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_abbreviation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "abbreviation");
}

id objc_msgSend_absolutePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absolutePath");
}

id objc_msgSend_absolutePathFSR(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absolutePathFSR");
}

id objc_msgSend_accessGroupName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessGroupName");
}

id objc_msgSend_accessibilityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityType");
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountDescription");
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountName");
}

id objc_msgSend_accountWithUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountWithUniqueIdentifier:");
}

id objc_msgSend_accountsForAssets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountsForAssets");
}

id objc_msgSend_acquireCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireCache");
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeAccount");
}

id objc_msgSend_addAccountWithDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAccountWithDSID:");
}

id objc_msgSend_addAllPasswordItems_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAllPasswordItems:error:");
}

id objc_msgSend_addAppleID_DSID_altDSID_dataClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAppleID:DSID:altDSID:dataClass:");
}

id objc_msgSend_addAppleIDsFromSet_dataClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAppleIDsFromSet:dataClass:");
}

id objc_msgSend_addAssetDescriptionForAppleID_assetDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAssetDescriptionForAppleID:assetDescription:");
}

id objc_msgSend_addBackup_lastModified_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBackup:lastModified:");
}

id objc_msgSend_addContainersFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addContainersFromArray:");
}

id objc_msgSend_addDisabledDomainNames_restricted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDisabledDomainNames:restricted:");
}

id objc_msgSend_addDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDomain:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFile_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFile:flags:");
}

id objc_msgSend_addFile_snapshotID_backupUDID_committed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFile:snapshotID:backupUDID:committed:");
}

id objc_msgSend_addKeybagSecret_forUUID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addKeybagSecret:forUUID:error:");
}

id objc_msgSend_addLocalBackupPassword_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLocalBackupPassword:error:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperations:");
}

id objc_msgSend_addPasswordItem_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPasswordItem:error:");
}

id objc_msgSend_addPlaceholderForFile_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPlaceholderForFile:flags:");
}

id objc_msgSend_addSnapshot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSnapshot:");
}

id objc_msgSend_addSnapshot_backupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSnapshot:backupUDID:");
}

id objc_msgSend_addValue_forServiceName_accountName_withAccessibility_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addValue:forServiceName:accountName:withAccessibility:error:");
}

id objc_msgSend_added(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "added");
}

id objc_msgSend_adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn_path_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:path:");
}

id objc_msgSend_allClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allClients");
}

id objc_msgSend_allContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allContainers");
}

id objc_msgSend_allDisabledDomainNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allDisabledDomainNames");
}

id objc_msgSend_allDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allDomains");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allHeaderFields");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allPasswordItemsForService_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allPasswordItemsForService:error:");
}

id objc_msgSend_allPasswordItemsForServices_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allPasswordItemsForServices:error:");
}

id objc_msgSend_allPersonae(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allPersonae");
}

id objc_msgSend_allRestrictedDomainNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allRestrictedDomainNames");
}

id objc_msgSend_allSystemContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allSystemContainers");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "altDSID");
}

id objc_msgSend_analyticsEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "analyticsEvent");
}

id objc_msgSend_analyze(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "analyze");
}

id objc_msgSend_annotateDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "annotateDomain:");
}

id objc_msgSend_annotateDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "annotateDomains:");
}

id objc_msgSend_appClipMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appClipMetadata");
}

id objc_msgSend_appManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appManager");
}

id objc_msgSend_appManagerWithSettingsContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appManagerWithSettingsContext:");
}

id objc_msgSend_appPlaceholderArchiveDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appPlaceholderArchiveDirectory");
}

id objc_msgSend_appWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appWithIdentifier:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleID");
}

id objc_msgSend_appleIDHeadersForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleIDHeadersForRequest:");
}

id objc_msgSend_appleIDsForAssets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleIDsForAssets");
}

id objc_msgSend_applicationDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationDSID");
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationExtensionRecords");
}

id objc_msgSend_applicationIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIDs");
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIdentifier");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationState");
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationType");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_archivedObjectOfClass_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedObjectOfClass:atIndex:");
}

id objc_msgSend_areAllFilesCommittedForSnapshotID_backupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areAllFilesCommittedForSnapshotID:backupUDID:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetType");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_attributesForFD_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesForFD:error:");
}

id objc_msgSend_attributesForPathFSR_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesForPathFSR:error:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_backUpFPFSDatabaseManifestForUserVolume_snapshotMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backUpFPFSDatabaseManifestForUserVolume:snapshotMountPoint:");
}

id objc_msgSend_backUpUserURL_outputUserURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backUpUserURL:outputUserURL:completionHandler:");
}

id objc_msgSend_backUpWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backUpWithCompletionBlock:");
}

id objc_msgSend_backUpiCloudDriveDatabaseManifestForUserVolume_snapshotMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backUpiCloudDriveDatabaseManifestForUserVolume:snapshotMountPoint:");
}

id objc_msgSend_backsUpPrimaryAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backsUpPrimaryAccount");
}

id objc_msgSend_backup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backup");
}

id objc_msgSend_backupAfterPreflight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupAfterPreflight");
}

id objc_msgSend_backupEnded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupEnded");
}

id objc_msgSend_backupEngineWithSettingsContext_debugContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupEngineWithSettingsContext:debugContext:");
}

id objc_msgSend_backupForUDID_lastModified_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupForUDID:lastModified:");
}

id objc_msgSend_backupForUDID_lastModified_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupForUDID:lastModified:error:");
}

id objc_msgSend_backupOperationJournalWithBatchSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupOperationJournalWithBatchSize:");
}

id objc_msgSend_backupOperationWithType_domain_fileID_path_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupOperationWithType:domain:fileID:path:size:");
}

id objc_msgSend_backupOperationWithType_domain_fileID_path_size_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupOperationWithType:domain:fileID:path:size:flags:");
}

id objc_msgSend_backupPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupPolicy");
}

id objc_msgSend_backupState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupState");
}

id objc_msgSend_backupStateName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupStateName");
}

id objc_msgSend_backupStateWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupStateWithString:");
}

id objc_msgSend_backupSymbolicLinkTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupSymbolicLinkTarget");
}

id objc_msgSend_backupUDID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupUDID");
}

id objc_msgSend_bagID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bagID");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_basicFileHandleWithPath_flags_mode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "basicFileHandleWithPath:flags:mode:error:");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "begin");
}

id objc_msgSend_beginPerforming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginPerforming");
}

id objc_msgSend_bindBlob_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bindBlob:atIndex:");
}

id objc_msgSend_bindInt64_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bindInt64:atIndex:");
}

id objc_msgSend_bindInt_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bindInt:atIndex:");
}

id objc_msgSend_bindInteger_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bindInteger:atIndex:");
}

id objc_msgSend_bindText_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bindText:atIndex:");
}

id objc_msgSend_birth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "birth");
}

id objc_msgSend_birthDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "birthDate");
}

id objc_msgSend_blobColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blobColumn:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_buildIndexFromDatabaseIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildIndexFromDatabaseIfNeeded");
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildVersion");
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleContainerURL");
}

id objc_msgSend_bundleExecutable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleExecutable");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIDsNotToBackUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIDsNotToBackUp");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleVersion");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cache");
}

id objc_msgSend_cachedFileDescriptorWithSnapshotPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedFileDescriptorWithSnapshotPath:error:");
}

id objc_msgSend_canOpenWhenLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canOpenWhenLocked:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelError");
}

id objc_msgSend_cancelWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelWithError:");
}

id objc_msgSend_changePasswordFrom_toPassword_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changePasswordFrom:toPassword:error:");
}

id objc_msgSend_changeSecretFrom_toSecret_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changeSecretFrom:toSecret:error:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_checkIfBackupHasKeybagWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkIfBackupHasKeybagWithUUID:");
}

id objc_msgSend_checkWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkWithError:");
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanup");
}

id objc_msgSend_clearSnapshots(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearSnapshots");
}

id objc_msgSend_clientForDataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientForDataclass:");
}

id objc_msgSend_cloneID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloneID");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_close_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close:");
}

id objc_msgSend_closeAndRemoveFileWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeAndRemoveFileWithError:");
}

id objc_msgSend_closeWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeWithError:");
}

id objc_msgSend_closeWithFD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeWithFD:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_codeForErrno_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "codeForErrno:");
}

id objc_msgSend_codeForNSError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "codeForNSError:");
}

id objc_msgSend_codeWithReturnCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "codeWithReturnCode:");
}

id objc_msgSend_columnCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "columnCount");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commit");
}

id objc_msgSend_committed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "committed");
}

id objc_msgSend_compactSQLiteDatabaseAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compactSQLiteDatabaseAtPath:toPath:error:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compatibilityObject");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationWithPropertyList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithPropertyList:");
}

id objc_msgSend_configurationWithURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithURL:error:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connect");
}

id objc_msgSend_connectionWithRequest_properties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionWithRequest:properties:");
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerID");
}

id objc_msgSend_containerIDWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerIDWithName:");
}

id objc_msgSend_containerType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerType");
}

id objc_msgSend_containerWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithIdentifier:");
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingBundleRecord");
}

id objc_msgSend_containsDomainName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsDomainName:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsPlaceholderForFileID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsPlaceholderForFileID:error:");
}

id objc_msgSend_containsRegularFileForFileID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsRegularFileForFileID:error:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:options:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copyItemAtPath_toPath_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtPath:toPath:options:error:");
}

id objc_msgSend_copyPreferencesValueForKey_class_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPreferencesValueForKey:class:");
}

id objc_msgSend_copySQLiteFileAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copySQLiteFileAtPath:toPath:error:");
}

id objc_msgSend_copySQLiteFileAtPath_toPath_timeout_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copySQLiteFileAtPath:toPath:timeout:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countForType:");
}

id objc_msgSend_createAndMountSnapshotForVolume_name_atFirstAvailableMountPoint_error_cancelationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:");
}

id objc_msgSend_createDirectoryAtPath_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:options:error:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createPathInDirectory_fileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPathInDirectory:fileName:");
}

id objc_msgSend_createRestoreDirectoriesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createRestoreDirectoriesWithError:");
}

id objc_msgSend_createSafeHarborForContainer_withPersona_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSafeHarborForContainer:withPersona:error:");
}

id objc_msgSend_created(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "created");
}

id objc_msgSend_crossVolumeCopyFrom_toDestination_shouldDeleteSource_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "crossVolumeCopyFrom:toDestination:shouldDeleteSource:error:");
}

id objc_msgSend_current(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "current");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataAtIndex:");
}

id objc_msgSend_dataAtPath_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataAtPath:options:error:");
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataContainerURL");
}

id objc_msgSend_dataFromPropertyList_format_errorDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataFromPropertyList:format:errorDescription:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithError:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_databaseIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseIndex");
}

id objc_msgSend_databasePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePath");
}

id objc_msgSend_databaseWithDrive_path_domainManager_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseWithDrive:path:domainManager:error:");
}

id objc_msgSend_dataclass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataclass");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dbHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dbHandle");
}

id objc_msgSend_debugContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugContext");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_decodeBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBytes:length:");
}

id objc_msgSend_decodeData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeData");
}

id objc_msgSend_decodeInt16(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt16");
}

id objc_msgSend_decodeInt32(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt32");
}

id objc_msgSend_decodeInt32ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt32ForKey:");
}

id objc_msgSend_decodeInt64(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt64");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeInt8(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt8");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeString");
}

id objc_msgSend_decodeVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeVersion");
}

id objc_msgSend_decoderWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decoderWithData:");
}

id objc_msgSend_decryptFileWithPath_encryptionKey_size_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decryptFileWithPath:encryptionKey:size:error:");
}

id objc_msgSend_decryptString_withKey_salt_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decryptString:withKey:salt:error:");
}

id objc_msgSend_decryptedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decryptedSize");
}

id objc_msgSend_defaultDebugContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultDebugContext");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultSettingsContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSettingsContext");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteAllSnapshotsForVolume_withPrefix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAllSnapshotsForVolume:withPrefix:error:");
}

id objc_msgSend_demotedAppsPlistPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "demotedAppsPlistPath");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionForError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForError:");
}

id objc_msgSend_deviceCacheDir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceCacheDir");
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceID");
}

id objc_msgSend_deviceLinkDriveWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLinkDriveWithConnection:");
}

id objc_msgSend_deviceManagerWithCheckinMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceManagerWithCheckinMethod:");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceName");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_digest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "digest");
}

id objc_msgSend_digestDidNotMatchForFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "digestDidNotMatchForFile:");
}

id objc_msgSend_digestForData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "digestForData:");
}

id objc_msgSend_digestForFileAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "digestForFileAtPath:error:");
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnect");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_displayNameForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayNameForBundleIdentifier:");
}

id objc_msgSend_displayNameForDomain_isSystemDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayNameForDomain:isSystemDomain:");
}

id objc_msgSend_dispose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispose");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_domainForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainForName:");
}

id objc_msgSend_domainForPath_relativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainForPath:relativePath:");
}

id objc_msgSend_domainManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainManager");
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainName");
}

id objc_msgSend_domainNamesNotToBackUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainNamesNotToBackUp");
}

id objc_msgSend_domainRedirects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainRedirects");
}

id objc_msgSend_done(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "done");
}

id objc_msgSend_doubleColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleColumn:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadFileAtPath_toPath_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadFileAtPath:toPath:options:error:");
}

id objc_msgSend_downloadFilesAtPaths_options_results_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadFilesAtPaths:options:results:error:");
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drain");
}

id objc_msgSend_drive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drive");
}

id objc_msgSend_driveBackupDatabaseIndexPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveBackupDatabaseIndexPath");
}

id objc_msgSend_driveBackupDatabasePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveBackupDatabasePath");
}

id objc_msgSend_driveBackupDir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveBackupDir");
}

id objc_msgSend_driveBackupManifestDatabasePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveBackupManifestDatabasePath");
}

id objc_msgSend_driveBackupPropertiesPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveBackupPropertiesPath");
}

id objc_msgSend_driveBackupStatusPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveBackupStatusPath");
}

id objc_msgSend_driveOperationWithBackupOperationType_count_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveOperationWithBackupOperationType:count:size:");
}

id objc_msgSend_driveOperationsForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveOperationsForType:");
}

id objc_msgSend_driveReadError_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveReadError:description:");
}

id objc_msgSend_driveSnapshotDatabasePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveSnapshotDatabasePath");
}

id objc_msgSend_driveSnapshotDir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveSnapshotDir");
}

id objc_msgSend_driveSnapshotManifestDatabasePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveSnapshotManifestDatabasePath");
}

id objc_msgSend_driveSnapshotPropertiesPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveSnapshotPropertiesPath");
}

id objc_msgSend_driveWriteError_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driveWriteError:description:");
}

id objc_msgSend_duplicateFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duplicateFile");
}

id objc_msgSend_duplicateFileReference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duplicateFileReference");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_encode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encode:");
}

id objc_msgSend_encodeBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBytes:length:");
}

id objc_msgSend_encodeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeData:");
}

id objc_msgSend_encodeInt16_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt16:");
}

id objc_msgSend_encodeInt32_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt32:");
}

id objc_msgSend_encodeInt32_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt32:forKey:");
}

id objc_msgSend_encodeInt64_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt64:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInt8_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt8:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeString:");
}

id objc_msgSend_encodeVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeVersion:");
}

id objc_msgSend_encoderToFile_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encoderToFile:error:");
}

id objc_msgSend_encrypted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encrypted");
}

id objc_msgSend_encryptedFileForRestoreWithPath_key_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptedFileForRestoreWithPath:key:error:");
}

id objc_msgSend_encryptedFileHandleForBackupWithPath_keybag_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptedFileHandleForBackupWithPath:keybag:error:");
}

id objc_msgSend_encryptedFileHandleForRestoreWithPath_keybag_key_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptedFileHandleForRestoreWithPath:keybag:key:error:");
}

id objc_msgSend_encryptionKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptionKey");
}

id objc_msgSend_encryptionKeyVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptionKeyVersion");
}

id objc_msgSend_encryptionKeyWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptionKeyWithError:");
}

id objc_msgSend_encryptionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptionManager");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "end");
}

id objc_msgSend_endWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endWithError:");
}

id objc_msgSend_engineMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engineMode");
}

id objc_msgSend_engineModeString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engineModeString");
}

id objc_msgSend_enginePolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enginePolicy");
}

id objc_msgSend_engineType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engineType");
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlements");
}

id objc_msgSend_enumerateBundlesOfType_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateBundlesOfType:block:");
}

id objc_msgSend_enumerateContentsOfDirectoryAtPath_options_foundItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateContentsOfDirectoryAtPath:options:foundItem:");
}

id objc_msgSend_enumerateContentsOfDirectoryAtPath_options_recurse_foundItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateContentsOfDirectoryAtPath:options:recurse:foundItem:");
}

id objc_msgSend_enumerateFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateFiles:");
}

id objc_msgSend_enumerateFiles_includeUninstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateFiles:includeUninstalled:");
}

id objc_msgSend_enumerateObjectsOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsOfClass:");
}

id objc_msgSend_enumeratePathsForBackupType_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratePathsForBackupType:usingBlock:");
}

id objc_msgSend_enumerateSnapshots_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateSnapshots:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_enumeratorWithStmt_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorWithStmt:block:");
}

id objc_msgSend_errnoForError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errnoForError:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorCode");
}

id objc_msgSend_errorForException_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorForException:");
}

id objc_msgSend_errorForNSError_path_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorForNSError:path:format:");
}

id objc_msgSend_errorWithCode_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:description:");
}

id objc_msgSend_errorWithCode_error_URL_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:error:URL:format:");
}

id objc_msgSend_errorWithCode_error_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:error:format:");
}

id objc_msgSend_errorWithCode_error_path_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:error:path:format:");
}

id objc_msgSend_errorWithCode_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:format:");
}

id objc_msgSend_errorWithCode_path_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:path:format:");
}

id objc_msgSend_errorWithDomain_code_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:format:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithErrno_code_path_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithErrno:code:path:format:");
}

id objc_msgSend_errorWithErrno_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithErrno:format:");
}

id objc_msgSend_errorWithErrno_path_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithErrno:path:format:");
}

id objc_msgSend_errorWithReturnCode_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithReturnCode:description:");
}

id objc_msgSend_errorWithReturnCode_path_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithReturnCode:path:description:");
}

id objc_msgSend_evaluatePolicy_options_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluatePolicy:options:reply:");
}

id objc_msgSend_excludingNotFound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "excludingNotFound");
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "execute:");
}

id objc_msgSend_execute_args_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "execute:args:");
}

id objc_msgSend_executeRaw_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeRaw:");
}

id objc_msgSend_exportKeychainForCKBackupEngine_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportKeychainForCKBackupEngine:error:");
}

id objc_msgSend_extendedAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendedAttributes");
}

id objc_msgSend_extendedAttributesCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendedAttributesCount");
}

id objc_msgSend_extendedSqliteCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendedSqliteCode");
}

id objc_msgSend_extractWithDomainName_relativePath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractWithDomainName:relativePath:error:");
}

id objc_msgSend_factoryWithProtectionClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "factoryWithProtectionClass:");
}

id objc_msgSend_fd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fd");
}

id objc_msgSend_fetch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetch:");
}

id objc_msgSend_fetch_args_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetch:args:");
}

id objc_msgSend_fetchDeviceToDeviceEncryptionSupportedByAccount_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchDeviceToDeviceEncryptionSupportedByAccount:error:");
}

id objc_msgSend_fetchFileWithID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchFileWithID:error:");
}

id objc_msgSend_fetchKeybagSecretForUUID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchKeybagSecretForUUID:error:");
}

id objc_msgSend_fetchLocalBackupPasswordAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchLocalBackupPasswordAndReturnError:");
}

id objc_msgSend_fetchObjectOfClass_sql_args_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchObjectOfClass:sql:args:");
}

id objc_msgSend_fetchPropertyWithName_class_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchPropertyWithName:class:error:");
}

id objc_msgSend_fetchValueForServiceName_accountName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchValueForServiceName:accountName:error:");
}

id objc_msgSend_fileAtOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileAtOffset:");
}

id objc_msgSend_fileChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileChange");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_fileEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileEnumerator");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileForID_snapshotID_backupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileForID:snapshotID:backupUDID:");
}

id objc_msgSend_fileForTemporaryPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileForTemporaryPath:");
}

id objc_msgSend_fileHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandle");
}

id objc_msgSend_fileHandleForReadingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReadingAtPath:");
}

id objc_msgSend_fileHandleForReadingFromURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReadingFromURL:error:");
}

id objc_msgSend_fileHandleWithPath_flags_mode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleWithPath:flags:mode:error:");
}

id objc_msgSend_fileID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileID");
}

id objc_msgSend_fileIDWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileIDWithData:");
}

id objc_msgSend_fileIDWithDomain_relativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileIDWithDomain:relativePath:");
}

id objc_msgSend_fileIDWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileIDWithString:");
}

id objc_msgSend_fileInfoWithRestorable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileInfoWithRestorable:");
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileModificationDate");
}

id objc_msgSend_fileModifiedWhileUploadingFile_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileModifiedWhileUploadingFile:reason:");
}

id objc_msgSend_fileScanner_failedToOpenFile_withErrno_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileScanner:failedToOpenFile:withErrno:");
}

id objc_msgSend_fileScanner_failedToStatFile_withErrno_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileScanner:failedToStatFile:withErrno:");
}

id objc_msgSend_fileScanner_isFileAddedOrModified_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileScanner:isFileAddedOrModified:");
}

id objc_msgSend_fileScanner_shouldExcludeFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileScanner:shouldExcludeFile:");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileSystemCapacity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemCapacity");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileType");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fileWithDecoder_database_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileWithDecoder:database:");
}

id objc_msgSend_fileWithDomain_relativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileWithDomain:relativePath:");
}

id objc_msgSend_fileWithDomain_snapshotPath_relativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileWithDomain:snapshotPath:relativePath:");
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filename");
}

id objc_msgSend_filenamePrefix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filenamePrefix");
}

id objc_msgSend_filenameWithPrefix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filenameWithPrefix");
}

id objc_msgSend_final(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "final");
}

id objc_msgSend_finalizeRestoreDirectoriesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizeRestoreDirectoriesWithError:");
}

id objc_msgSend_finishBatchUploadsWithOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishBatchUploadsWithOptions:completion:");
}

id objc_msgSend_finishedPerforming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedPerforming");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flags");
}

id objc_msgSend_flagsForFileID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flagsForFileID:error:");
}

id objc_msgSend_flagsForMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flagsForMode:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flush");
}

id objc_msgSend_freeSpace_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freeSpace:error:");
}

id objc_msgSend_getBooleanValueForKey_keyExists_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBooleanValueForKey:keyExists:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getEncryptedFileHandleWithKeybag_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEncryptedFileHandleWithKeybag:error:");
}

id objc_msgSend_getNode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNode:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_getValueForDomain_key_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getValueForDomain:key:usingBlock:");
}

id objc_msgSend_getWithFD_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getWithFD:error:");
}

id objc_msgSend_getWithPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getWithPath:error:");
}

id objc_msgSend_getWithPathFSR_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getWithPathFSR:error:");
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupContainerURLs");
}

id objc_msgSend_groupID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupID");
}

id objc_msgSend_groupInTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupInTransaction:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAttributes");
}

id objc_msgSend_hasCorruptSQLiteDBs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasCorruptSQLiteDBs");
}

id objc_msgSend_hasExternalConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasExternalConfig");
}

id objc_msgSend_hasManifestDB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasManifestDB");
}

id objc_msgSend_hasParallelPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasParallelPlaceholder");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasRootPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasRootPath");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasUnverifiedFilesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasUnverifiedFilesWithError:");
}

id objc_msgSend_hasXattrs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasXattrs");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_headers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headers");
}

id objc_msgSend_iTunesStoreKVS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesStoreKVS");
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "icon");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "index");
}

id objc_msgSend_indexFromDatabaseIgnoringTruncation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexFromDatabaseIgnoringTruncation:");
}

id objc_msgSend_infoWithDrive_path_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoWithDrive:path:error:");
}

id objc_msgSend_infoWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoWithError:");
}

id objc_msgSend_infoWithID_uuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoWithID:uuid:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initFileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithPath:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAttributes:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBatchSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBatchSize:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCache:");
}

id objc_msgSend_initWithCache_SQL_stmt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCache:SQL:stmt:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCheckinMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCheckinMethod:");
}

id objc_msgSend_initWithCode_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCode:format:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithContext_persona_engineType_backupPolicy_encrypted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContext:persona:engineType:backupPolicy:encrypted:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:error:");
}

id objc_msgSend_initWithDecoder_database_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDecoder:database:");
}

id objc_msgSend_initWithDecoder_domainManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDecoder:domainManager:");
}

id objc_msgSend_initWithDelegate_mode_enginePolicy_debugContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:mode:enginePolicy:debugContext:");
}

id objc_msgSend_initWithDirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDirectory:error:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithDomain_relativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:relativePath:");
}

id objc_msgSend_initWithDomain_snapshotPath_relativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:snapshotPath:relativePath:");
}

id objc_msgSend_initWithDomainName_relativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomainName:relativePath:");
}

id objc_msgSend_initWithDrive_path_domainManager_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDrive:path:domainManager:error:");
}

id objc_msgSend_initWithDrive_path_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDrive:path:error:");
}

id objc_msgSend_initWithEncoder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEncoder:");
}

id objc_msgSend_initWithEngine_fileHandle_file_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEngine:fileHandle:file:");
}

id objc_msgSend_initWithEventName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventName:");
}

id objc_msgSend_initWithFile_domainManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFile:domainManager:");
}

id objc_msgSend_initWithFile_domainManager_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFile:domainManager:error:");
}

id objc_msgSend_initWithFileHandleFactory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileHandleFactory:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithHandle_OTA_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHandle:OTA:");
}

id objc_msgSend_initWithID_uuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithID:uuid:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_initWithKeyBag_key_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKeyBag:key:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithOffset_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOffset:flags:");
}

id objc_msgSend_initWithOriginalFileHandle_copiedFileHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOriginalFileHandle:copiedFileHandle:");
}

id objc_msgSend_initWithOutputStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOutputStream:");
}

id objc_msgSend_initWithPath_domainManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:domainManager:");
}

id objc_msgSend_initWithPath_fd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:fd:");
}

id objc_msgSend_initWithPath_keybag_file_restore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:keybag:file:restore:");
}

id objc_msgSend_initWithPath_properties_domainManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:properties:domainManager:");
}

id objc_msgSend_initWithPath_readOnly_usePQLBatching_schemaCurrentVersion_schemaMinDatabaseVersionForUpgrade_error_schemaUpgrades_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:readOnly:usePQLBatching:schemaCurrentVersion:schemaMinDatabaseVersionForUpgrade:error:schemaUpgrades:");
}

id objc_msgSend_initWithPaths_size_last_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPaths:size:last:");
}

id objc_msgSend_initWithPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersona:");
}

id objc_msgSend_initWithPersona_enginePolicyProvider_appManager_plugins_serviceRestoreMode_osBuildVersionOfBackup_shouldRestoreSystemFiles_isRestoringPrimaryAccount_shouldCreateMissingIntermediateDirectories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:");
}

id objc_msgSend_initWithProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProgress:");
}

id objc_msgSend_initWithProperties_database_databaseIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProperties:database:databaseIndex:");
}

id objc_msgSend_initWithPropertyList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPropertyList:");
}

id objc_msgSend_initWithProtectionClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProtectionClass:");
}

id objc_msgSend_initWithRequest_properties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequest:properties:");
}

id objc_msgSend_initWithSafeHarborDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSafeHarborDir:");
}

id objc_msgSend_initWithScript_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithScript:delegate:");
}

id objc_msgSend_initWithScript_delegate_index_subindex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithScript:delegate:index:subindex:");
}

id objc_msgSend_initWithSettingsContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSettingsContext:");
}

id objc_msgSend_initWithSettingsContext_debugContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSettingsContext:debugContext:");
}

id objc_msgSend_initWithSettingsContext_domainManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSettingsContext:domainManager:");
}

id objc_msgSend_initWithSettingsContext_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSettingsContext:error:");
}

id objc_msgSend_initWithStmt_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStmt:block:");
}

id objc_msgSend_initWithStorageLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStorageLocation:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTools_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTools:error:");
}

id objc_msgSend_initWithType_count_size_duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:count:size:duration:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUserURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUserURL:");
}

id objc_msgSend_initWithUserURL_outputUserURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUserURL:outputUserURL:");
}

id objc_msgSend_inodeNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inodeNumber");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertOperation_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertOperation:atIndex:");
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installType");
}

id objc_msgSend_int64Column_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "int64Column:");
}

id objc_msgSend_intColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intColumn:");
}

id objc_msgSend_intForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intForName:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAbsolutePath");
}

id objc_msgSend_isAppDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppDomain");
}

id objc_msgSend_isBackgroundApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBackgroundApp");
}

id objc_msgSend_isBackgroundFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBackgroundFile");
}

id objc_msgSend_isBackgroundFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBackgroundFiles");
}

id objc_msgSend_isBackupEmpty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBackupEmpty");
}

id objc_msgSend_isBackupNew(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBackupNew");
}

id objc_msgSend_isBackupOld(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBackupOld");
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBeta");
}

id objc_msgSend_isCameraRollDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCameraRollDomain");
}

id objc_msgSend_isCanceled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCanceled");
}

id objc_msgSend_isCloudKitEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCloudKitEngine");
}

id objc_msgSend_isCommitted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCommitted");
}

id objc_msgSend_isCompressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCompressed");
}

id objc_msgSend_isContainerizedName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isContainerizedName:");
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDataSeparatedPersona");
}

id objc_msgSend_isDataless(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDataless");
}

id objc_msgSend_isDeviceKeyBagLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceKeyBagLocked");
}

id objc_msgSend_isDeviceTransfer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceTransfer");
}

id objc_msgSend_isDeviceTransferEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceTransferEngine");
}

id objc_msgSend_isDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDirectory");
}

id objc_msgSend_isDowngraded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDowngraded");
}

id objc_msgSend_isDriveEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDriveEngine");
}

id objc_msgSend_isEnterpriseBookBackupAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnterpriseBookBackupAllowed");
}

id objc_msgSend_isEnterprisePersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnterprisePersona");
}

id objc_msgSend_isEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEphemeralMultiUser");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDomain:");
}

id objc_msgSend_isEqualToFileID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToFileID:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isError_withCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isError:withCode:");
}

id objc_msgSend_isError_withCodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isError:withCodes:");
}

id objc_msgSend_isExternalConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExternalConfig");
}

id objc_msgSend_isFinalRetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinalRetry");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isFlagSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFlagSet:");
}

id objc_msgSend_isForeground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isForeground");
}

id objc_msgSend_isForegroundRestore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isForegroundRestore");
}

id objc_msgSend_isFullBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFullBackup");
}

id objc_msgSend_isFullClone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFullClone");
}

id objc_msgSend_isGroupAppDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGroupAppDomain");
}

id objc_msgSend_isHardLink(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHardLink");
}

id objc_msgSend_isIPod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIPod");
}

id objc_msgSend_isIgnoredAppleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIgnoredAppleID:");
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInstalled");
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLaunchProhibited");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isModifiedSince_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isModifiedSince:reason:");
}

id objc_msgSend_isMoving(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMoving");
}

id objc_msgSend_isNSFileNotFoundError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNSFileNotFoundError:");
}

id objc_msgSend_isOTA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOTA");
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeSet");
}

id objc_msgSend_isPersonalPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPersonalPersona");
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaceholder");
}

id objc_msgSend_isPlaceholderAppDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaceholderAppDomain");
}

id objc_msgSend_isPlaceholderDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaceholderDomain");
}

id objc_msgSend_isPluginAppDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPluginAppDomain");
}

id objc_msgSend_isPrimaryAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPrimaryAccount");
}

id objc_msgSend_isPrimaryUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPrimaryUser");
}

id objc_msgSend_isProvisionedForDataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isProvisionedForDataclass:");
}

id objc_msgSend_isRefreshNeededForBackupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRefreshNeededForBackupUDID:");
}

id objc_msgSend_isRegularFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRegularFile");
}

id objc_msgSend_isRemoving(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRemoving");
}

id objc_msgSend_isReset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReset");
}

id objc_msgSend_isRestoreEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRestoreEngine");
}

id objc_msgSend_isRestoredPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRestoredPath:");
}

id objc_msgSend_isRestoringToSameDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRestoringToSameDevice");
}

id objc_msgSend_isSQLiteFileAtPath_result_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSQLiteFileAtPath:result:error:");
}

id objc_msgSend_isSQLiteFileHandle_result_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSQLiteFileHandle:result:error:");
}

id objc_msgSend_isServiceEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServiceEngine");
}

id objc_msgSend_isSettingLockedDownByRestrictions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSettingLockedDownByRestrictions:");
}

id objc_msgSend_isStaleSnapshotID_backupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStaleSnapshotID:backupUDID:");
}

id objc_msgSend_isStatusChangedComparedToFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStatusChangedComparedToFile:");
}

id objc_msgSend_isSymbolicLink(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSymbolicLink");
}

id objc_msgSend_isSystemApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemApp");
}

id objc_msgSend_isSystemContainerDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemContainerDomain");
}

id objc_msgSend_isSystemContainerName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemContainerName:");
}

id objc_msgSend_isSystemDomainName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemDomainName:");
}

id objc_msgSend_isSystemSharedContainerDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemSharedContainerDomain");
}

id objc_msgSend_isSystemSharedContainerName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemSharedContainerName:");
}

id objc_msgSend_isUninstalledAppDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUninstalledAppDomain");
}

id objc_msgSend_isUnlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUnlocked");
}

id objc_msgSend_isUploading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUploading");
}

id objc_msgSend_isVersionAmbiguous(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVersionAmbiguous");
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemID");
}

id objc_msgSend_keyBagForUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyBagForUUID:");
}

id objc_msgSend_keyDataForKey_salt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyDataForKey:salt:");
}

id objc_msgSend_keybag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keybag");
}

id objc_msgSend_keybagData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keybagData");
}

id objc_msgSend_keybagID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keybagID");
}

id objc_msgSend_keybagUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keybagUUID");
}

id objc_msgSend_keybagWithData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keybagWithData:error:");
}

id objc_msgSend_keybagWithPassword_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keybagWithPassword:error:");
}

id objc_msgSend_keychainItemWithAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keychainItemWithAttributes:");
}

id objc_msgSend_keysForFD_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysForFD:error:");
}

id objc_msgSend_keysForPathFSR_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysForPathFSR:error:");
}

id objc_msgSend_keysFromDictionary_toIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysFromDictionary:toIndex:");
}

id objc_msgSend_knownAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knownAccounts");
}

id objc_msgSend_knownAccountsByDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knownAccountsByDSID");
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastError");
}

id objc_msgSend_lastKeyBag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastKeyBag");
}

id objc_msgSend_lastModified(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastModified");
}

id objc_msgSend_lastModifiedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastModifiedDate");
}

id objc_msgSend_lastModifiedForSQLiteFileAtPath_time_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastModifiedForSQLiteFileAtPath:time:error:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastStatusChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastStatusChange");
}

id objc_msgSend_lastStatusChangeDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastStatusChangeDate");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_listFilesCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listFilesCount");
}

id objc_msgSend_listFilesForBackupUDID_snapshotID_offset_limit_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listFilesForBackupUDID:snapshotID:offset:limit:error:");
}

id objc_msgSend_listWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listWithError:");
}

id objc_msgSend_livePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "livePath");
}

id objc_msgSend_loadAppsWithPersona_safeHarbors_dataSeparatedBundleIDs_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadAppsWithPersona:safeHarbors:dataSeparatedBundleIDs:error:");
}

id objc_msgSend_loadAppsWithPersona_safeHarbors_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadAppsWithPersona:safeHarbors:error:");
}

id objc_msgSend_localCommittedForSnapshotID_backupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localCommittedForSnapshotID:backupUDID:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedNameForContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedNameForContext:");
}

id objc_msgSend_localizedNameWithPreferredLocalizations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedNameWithPreferredLocalizations:");
}

id objc_msgSend_localizedStringForStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForStatusCode:");
}

id objc_msgSend_lockdownKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockdownKeys");
}

id objc_msgSend_lockdownShouldDisableDeviceRestore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockdownShouldDisableDeviceRestore");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_logSetClassForRestorable_state_absolutePath_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logSetClassForRestorable:state:absolutePath:value:");
}

id objc_msgSend_loggableDescriptionForError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loggableDescriptionForError:");
}

id objc_msgSend_loggableStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loggableStats");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_makeLockdownAndKeychainConsistentWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeLockdownAndKeychainConsistentWithError:");
}

id objc_msgSend_makeTemporaryFilePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeTemporaryFilePath");
}

id objc_msgSend_managedPersonas(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedPersonas");
}

id objc_msgSend_managementDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managementDomain");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manager");
}

id objc_msgSend_managerToUse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managerToUse");
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifest");
}

id objc_msgSend_manifestDBWithDrive_sourcePath_properties_domainManager_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestDBWithDrive:sourcePath:properties:domainManager:error:");
}

id objc_msgSend_manifestDBWithDrive_sourcePath_properties_domainManager_keybag_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestDBWithDrive:sourcePath:properties:domainManager:keybag:error:");
}

id objc_msgSend_manifestEncryptionKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestEncryptionKey");
}

id objc_msgSend_manifestWithProperties_database_databaseIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestWithProperties:database:databaseIndex:");
}

id objc_msgSend_mapAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapAttributes:");
}

id objc_msgSend_mapFileType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapFileType:");
}

id objc_msgSend_mapOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapOptions:");
}

id objc_msgSend_mapResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapResults:");
}

id objc_msgSend_mapStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapStatus:");
}

id objc_msgSend_mapStatus_errorString_path_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapStatus:errorString:path:error:");
}

id objc_msgSend_maximumLengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumLengthOfBytesUsingEncoding:");
}

id objc_msgSend_mb_applicationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_applicationType");
}

id objc_msgSend_mb_bundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_bundleURL");
}

id objc_msgSend_mb_dataFromHexadecimalString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_dataFromHexadecimalString:");
}

id objc_msgSend_mb_entitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_entitlements");
}

id objc_msgSend_mb_isContainerized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_isContainerized");
}

id objc_msgSend_mb_minusPathSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_minusPathSet:");
}

id objc_msgSend_mb_moveToTmpDirThenRemoveItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_moveToTmpDirThenRemoveItemAtPath:error:");
}

id objc_msgSend_mb_openatWithFlags_error_setupDir_itemAccessor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_openatWithFlags:error:setupDir:itemAccessor:");
}

id objc_msgSend_mb_pathComponentExistsInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_pathComponentExistsInSet:");
}

id objc_msgSend_mb_pathHasSQLiteJournalSuffix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_pathHasSQLiteJournalSuffix");
}

id objc_msgSend_mb_pluginIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_pluginIdentifier");
}

id objc_msgSend_mb_splitIntoBase_andRelativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_splitIntoBase:andRelativePath:");
}

id objc_msgSend_mb_stringWithFileSystemRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mb_stringWithFileSystemRepresentation:");
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_mergeKnownAccountsByDSID_into_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeKnownAccountsByDSID:into:");
}

id objc_msgSend_method(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "method");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mode");
}

id objc_msgSend_modeString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modeString");
}

id objc_msgSend_modifiedDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifiedDomains");
}

id objc_msgSend_mountedSnapshotTracker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountedSnapshotTracker");
}

id objc_msgSend_mountedSnapshots(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountedSnapshots");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_moveItemAtPath_toPath_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:options:error:");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_moveItemsAtPaths_options_results_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemsAtPaths:options:results:error:");
}

id objc_msgSend_movedBackupName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "movedBackupName");
}

id objc_msgSend_movedOldBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "movedOldBackup");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nameWithAppID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nameWithAppID:");
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newlineCharacterSet");
}

id objc_msgSend_next(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "next");
}

id objc_msgSend_nextIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextIndex");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nextSubindex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextSubindex");
}

id objc_msgSend_nonRedirectedDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonRedirectedDomain");
}

id objc_msgSend_notifyPluginsEndedRestoreWithEngine_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyPluginsEndedRestoreWithEngine:error:");
}

id objc_msgSend_notifyPluginsEndingRestoreWithEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyPluginsEndingRestoreWithEngine:");
}

id objc_msgSend_notifyPluginsPreparingRestoreWithEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyPluginsPreparingRestoreWithEngine:");
}

id objc_msgSend_notifyPluginsStartingRestoreWithEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyPluginsStartingRestoreWithEngine:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
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

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForDomain_andKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForDomain:andKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offset");
}

id objc_msgSend_offsetForFileID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offsetForFileID:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_openAtURL_withFlags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openAtURL:withFlags:error:");
}

id objc_msgSend_openRawEncryptedWithPathFSR_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openRawEncryptedWithPathFSR:error:");
}

id objc_msgSend_openWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openWithError:");
}

id objc_msgSend_openWithPath_flags_mode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openWithPath:flags:mode:");
}

id objc_msgSend_operationAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationAtIndex:");
}

id objc_msgSend_operationEnumeratorWithDomainManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationEnumeratorWithDomainManager:");
}

id objc_msgSend_operationForContentsOfDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationForContentsOfDirectory");
}

id objc_msgSend_operationToC0pyItemWithCount_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationToC0pyItemWithCount:size:");
}

id objc_msgSend_operationToCreateDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationToCreateDirectory");
}

id objc_msgSend_operationToDownloadFilesWithCount_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationToDownloadFilesWithCount:size:");
}

id objc_msgSend_operationToMoveItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationToMoveItem");
}

id objc_msgSend_operationToMoveItemsWithCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationToMoveItemsWithCount:");
}

id objc_msgSend_operationToRemoveItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationToRemoveItem");
}

id objc_msgSend_operationToRemoveItemsWithCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationToRemoveItemsWithCount:");
}

id objc_msgSend_operationToUploadFileWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationToUploadFileWithSize:");
}

id objc_msgSend_operationToUploadFilesWithCount_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationToUploadFilesWithCount:size:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_osBuildVersionOfBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "osBuildVersionOfBackup");
}

id objc_msgSend_outputStreamToFileAtPath_append_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputStreamToFileAtPath:append:");
}

id objc_msgSend_outputStreamToMemory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputStreamToMemory");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "password");
}

id objc_msgSend_passwordData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passwordData");
}

id objc_msgSend_passwordHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passwordHash");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "paths");
}

id objc_msgSend_pathsToBackup_pathsNotToBackup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathsToBackup:pathsNotToBackup:");
}

id objc_msgSend_percentage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "percentage");
}

id objc_msgSend_performCallbackOnQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performCallbackOnQueue:");
}

id objc_msgSend_performSchemaUpgrades_isReadOnly_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSchemaUpgrades:isReadOnly:error:");
}

id objc_msgSend_performSelectorForName_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelectorForName:withObject:");
}

id objc_msgSend_performWithConnection_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performWithConnection:error:");
}

id objc_msgSend_performWithFlags_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performWithFlags:action:");
}

id objc_msgSend_performingOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performingOperation:");
}

id objc_msgSend_persona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persona");
}

id objc_msgSend_personaAttributesForPersonaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaAttributesForPersonaType:");
}

id objc_msgSend_personaAttributesForPersonaType_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaAttributesForPersonaType:withError:");
}

id objc_msgSend_personaAttributesForPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaAttributesForPersonaUniqueString:");
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaIdentifier");
}

id objc_msgSend_personaLayoutPathURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaLayoutPathURL");
}

id objc_msgSend_personaWithAttributes_volumeMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaWithAttributes:volumeMountPoint:");
}

id objc_msgSend_personalPersonaWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personalPersonaWithError:");
}

id objc_msgSend_placeholderRestoreDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placeholderRestoreDirectory");
}

id objc_msgSend_plugins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plugins");
}

id objc_msgSend_posixErrorWithCode_path_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "posixErrorWithCode:path:format:");
}

id objc_msgSend_posixErrorWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "posixErrorWithFormat:");
}

id objc_msgSend_posixErrorWithPath_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "posixErrorWithPath:format:");
}

id objc_msgSend_postNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotification:");
}

id objc_msgSend_pql_database(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pql_database");
}

id objc_msgSend_preferencesDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferencesDirectory");
}

id objc_msgSend_prefixDirectories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefixDirectories");
}

id objc_msgSend_preflight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflight");
}

id objc_msgSend_preflightProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightProperties");
}

id objc_msgSend_prepareForBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForBackup");
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousFailureCount");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "priority");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productType");
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productVersion");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progress");
}

id objc_msgSend_promptUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptUser");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "properties");
}

id objc_msgSend_propertiesPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertiesPath");
}

id objc_msgSend_propertiesWithDrive_path_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertiesWithDrive:path:error:");
}

id objc_msgSend_propertiesWithFile_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertiesWithFile:error:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_propertyList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyList");
}

id objc_msgSend_propertyListAtPath_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListAtPath:options:error:");
}

id objc_msgSend_propertyListFromData_mutabilityOption_format_errorDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListFromData:mutabilityOption:format:errorDescription:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_proposedCredential(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proposedCredential");
}

id objc_msgSend_protectionClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionClass");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocolVersion");
}

id objc_msgSend_provisionedDataclasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provisionedDataclasses");
}

id objc_msgSend_purchaserDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purchaserDSID");
}

id objc_msgSend_purgeDiskSpace_amountRequested_urgencyLevel_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeDiskSpace:amountRequested:urgencyLevel:error:");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "query");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_readBackupDatabaseWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readBackupDatabaseWithError:");
}

id objc_msgSend_readBackupManifestDatabaseWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readBackupManifestDatabaseWithError:");
}

id objc_msgSend_readBackupManifestWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readBackupManifestWithError:");
}

id objc_msgSend_readBackupPropertiesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readBackupPropertiesWithError:");
}

id objc_msgSend_readSnapshotDatabaseWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readSnapshotDatabaseWithError:");
}

id objc_msgSend_readSnapshotManifestDatabaseWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readSnapshotManifestDatabaseWithError:");
}

id objc_msgSend_readSnapshotPropertiesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readSnapshotPropertiesWithError:");
}

id objc_msgSend_readStatusWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readStatusWithError:");
}

id objc_msgSend_readWithBytes_length_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readWithBytes:length:error:");
}

id objc_msgSend_readWithFD_bytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readWithFD:bytes:length:");
}

id objc_msgSend_recordMetadataWithSHA256Data_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordMetadataWithSHA256Data:error:");
}

id objc_msgSend_redirectDomain_forRelativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redirectDomain:forRelativePath:");
}

id objc_msgSend_refreshForBackupUDID_service_deleted_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshForBackupUDID:service:deleted:error:");
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePath");
}

id objc_msgSend_relativePathsNotToBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToBackup");
}

id objc_msgSend_relativePathsNotToBackupAndRestoreToAppleTVs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToBackupAndRestoreToAppleTVs");
}

id objc_msgSend_relativePathsNotToBackupInMegaBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToBackupInMegaBackup");
}

id objc_msgSend_relativePathsNotToBackupToDrive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToBackupToDrive");
}

id objc_msgSend_relativePathsNotToBackupToLocal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToBackupToLocal");
}

id objc_msgSend_relativePathsNotToBackupToService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToBackupToService");
}

id objc_msgSend_relativePathsNotToCheckIfModifiedDuringBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToCheckIfModifiedDuringBackup");
}

id objc_msgSend_relativePathsNotToMigrate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToMigrate");
}

id objc_msgSend_relativePathsNotToRemoveIfNotRestored(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToRemoveIfNotRestored");
}

id objc_msgSend_relativePathsNotToRestore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToRestore");
}

id objc_msgSend_relativePathsNotToRestoreFromLocal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToRestoreFromLocal");
}

id objc_msgSend_relativePathsNotToRestoreToIPods(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsNotToRestoreToIPods");
}

id objc_msgSend_relativePathsOfSystemFilesToAlwaysRemoveOnRestore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsOfSystemFilesToAlwaysRemoveOnRestore");
}

id objc_msgSend_relativePathsOfSystemFilesToAlwaysRestore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsOfSystemFilesToAlwaysRestore");
}

id objc_msgSend_relativePathsToBackgroundRestore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsToBackgroundRestore");
}

id objc_msgSend_relativePathsToBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsToBackup");
}

id objc_msgSend_relativePathsToBackupAndRestore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsToBackupAndRestore");
}

id objc_msgSend_relativePathsToBackupToDriveAndStandardAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsToBackupToDriveAndStandardAccount");
}

id objc_msgSend_relativePathsToIgnoreExclusionsForDrive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsToIgnoreExclusionsForDrive");
}

id objc_msgSend_relativePathsToOnlyBackupEncrypted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsToOnlyBackupEncrypted");
}

id objc_msgSend_relativePathsToRemoveOnRestore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsToRemoveOnRestore");
}

id objc_msgSend_relativePathsToRestore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsToRestore");
}

id objc_msgSend_relativePathsToRestoreOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsToRestoreOnly");
}

id objc_msgSend_relativePathsToRestoreOnlyFromService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePathsToRestoreOnlyFromService");
}

id objc_msgSend_releaseCachedFileDescriptors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseCachedFileDescriptors");
}

id objc_msgSend_removeAllBackups(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllBackups");
}

id objc_msgSend_removeAllContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllContainers");
}

id objc_msgSend_removeAllDisabledDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllDisabledDomains");
}

id objc_msgSend_removeAllFileChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllFileChanges");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAllSQLiteFilesAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllSQLiteFilesAtPath:");
}

id objc_msgSend_removeAllValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllValues");
}

id objc_msgSend_removeAllValuesWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllValuesWithCompletionBlock:");
}

id objc_msgSend_removeBackupForUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeBackupForUDID:");
}

id objc_msgSend_removeBackupSnapshotsForPersonalPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeBackupSnapshotsForPersonalPersona");
}

id objc_msgSend_removeEphemeralRetriedFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeEphemeralRetriedFiles");
}

id objc_msgSend_removeFilesNotAlreadyUploaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFilesNotAlreadyUploaded");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtPath_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:options:error:");
}

id objc_msgSend_removeItemsAtPaths_options_results_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemsAtPaths:options:results:error:");
}

id objc_msgSend_removeJournalsForSQLiteFileAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeJournalsForSQLiteFileAtPath:error:");
}

id objc_msgSend_removeKeybagSecretForUUID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeKeybagSecretForUUID:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeLocalBackupPasswordAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLocalBackupPasswordAndReturnError:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectWithDomain_andKey_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectWithDomain:andKey:withError:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeOldSafeHarbors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeOldSafeHarbors");
}

id objc_msgSend_removePropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePropertyForKey:");
}

id objc_msgSend_removeSQLiteFileAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSQLiteFileAtPath:error:");
}

id objc_msgSend_repair(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "repair");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requiredProductVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiredProductVersion");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_restore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restore");
}

id objc_msgSend_restoreAttributesToDestination_withUserID_groupID_permissions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreAttributesToDestination:withUserID:groupID:permissions:error:");
}

id objc_msgSend_restoreBehaviorForDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreBehaviorForDomain:error:");
}

id objc_msgSend_restoreBehaviorForFile_debugContext_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreBehaviorForFile:debugContext:error:");
}

id objc_msgSend_restoreDirectoryAnnotatorWithContext_persona_engineType_backupPolicy_encrypted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreDirectoryAnnotatorWithContext:persona:engineType:backupPolicy:encrypted:");
}

id objc_msgSend_restoreDirectoryAtPath_settingDataProtection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreDirectoryAtPath:settingDataProtection:");
}

id objc_msgSend_restoreEngineWithSettingsContext_debugContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreEngineWithSettingsContext:debugContext:");
}

id objc_msgSend_restoreFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreFile");
}

id objc_msgSend_restoreID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreID");
}

id objc_msgSend_restoreLastModifiedWithFD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreLastModifiedWithFD:");
}

id objc_msgSend_restoreModeWithType_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreModeWithType:value:");
}

id objc_msgSend_restorePathForRestorable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restorePathForRestorable:");
}

id objc_msgSend_restorePrefetchDirectories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restorePrefetchDirectories");
}

id objc_msgSend_restorePrefetchDirectoryForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restorePrefetchDirectoryForDomain:");
}

id objc_msgSend_restoreRegularFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreRegularFileAtPath:");
}

id objc_msgSend_restoreStateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreStateWithError:");
}

id objc_msgSend_restoreSymbolicLinkAtPath_withTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreSymbolicLinkAtPath:withTarget:");
}

id objc_msgSend_restoreType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreType");
}

id objc_msgSend_restoreTypeForContainerType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreTypeForContainerType:");
}

id objc_msgSend_restoreUserURL_fromBuild_restoreType_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreUserURL:fromBuild:restoreType:completionHandler:");
}

id objc_msgSend_restoreWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreWithCompletionBlock:");
}

id objc_msgSend_restoresPrimaryAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoresPrimaryAccount");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_rollback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rollback");
}

id objc_msgSend_rootPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootPath");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_salt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "salt");
}

id objc_msgSend_saveAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveAccount:withCompletionHandler:");
}

id objc_msgSend_scanDomain_snapshotMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanDomain:snapshotMountPoint:");
}

id objc_msgSend_scanner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanner");
}

id objc_msgSend_schemaCurrentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "schemaCurrentVersion");
}

id objc_msgSend_schemaMinDatabaseVersionForUpgrade(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "schemaMinDatabaseVersionForUpgrade");
}

id objc_msgSend_secret(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secret");
}

id objc_msgSend_secretForUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secretForUUID:");
}

id objc_msgSend_sendAsyncRequest_properties_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAsyncRequest:properties:block:");
}

id objc_msgSend_sendSyncRequest_properties_connection_response_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSyncRequest:properties:connection:response:error:");
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sender");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialQueue");
}

id objc_msgSend_serviceAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceAccount");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceName");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setActiveAppleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveAppleID:");
}

id objc_msgSend_setAllHTTPHeaderFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllHTTPHeaderFields:");
}

id objc_msgSend_setAnalyticsEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnalyticsEvent:");
}

id objc_msgSend_setApplicationIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationIDs:");
}

id objc_msgSend_setAssetType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetType:");
}

id objc_msgSend_setAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:");
}

id objc_msgSend_setAttributes_forFD_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:forFD:error:");
}

id objc_msgSend_setAttributes_forPathFSR_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:forPathFSR:error:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setAutoRollbackHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoRollbackHandler:");
}

id objc_msgSend_setBackupBuildVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackupBuildVersion:");
}

id objc_msgSend_setBackupPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackupPolicy:");
}

id objc_msgSend_setBackupState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackupState:");
}

id objc_msgSend_setBackupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackupUDID:");
}

id objc_msgSend_setBool_forName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forName:");
}

id objc_msgSend_setBuddyStashData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuddyStashData:");
}

id objc_msgSend_setBuildVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuildVersion:");
}

id objc_msgSend_setCachePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachePolicy:");
}

id objc_msgSend_setCancelError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelError:");
}

id objc_msgSend_setCommitted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommitted:");
}

id objc_msgSend_setCommitted_forSnapshotID_backupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommitted:forSnapshotID:backupUDID:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setCookiesFromCookieStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCookiesFromCookieStorage:");
}

id objc_msgSend_setCrashIfUsedAfterClose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCrashIfUsedAfterClose:");
}

id objc_msgSend_setDataReceived_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataReceived:");
}

id objc_msgSend_setDataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataclass:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDecryptedSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDecryptedSize:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegateQueue:");
}

id objc_msgSend_setDeleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeleted:");
}

id objc_msgSend_setDeviceBuildVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceBuildVersion:");
}

id objc_msgSend_setDeviceCacheDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceCacheDir:");
}

id objc_msgSend_setDeviceClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceClass:");
}

id objc_msgSend_setDeviceColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceColor:");
}

id objc_msgSend_setDeviceEnclosureColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceEnclosureColor:");
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceName:");
}

id objc_msgSend_setDigest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDigest:");
}

id objc_msgSend_setDisabledDomainNames_restrictedDomainNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisabledDomainNames:restrictedDomainNames:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDomain:");
}

id objc_msgSend_setDomainName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDomainName:");
}

id objc_msgSend_setDomainRedirects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDomainRedirects:");
}

id objc_msgSend_setDrive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrive:");
}

id objc_msgSend_setDuplicateFileReference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuplicateFileReference:");
}

id objc_msgSend_setEnabled_forDataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:forDataclass:");
}

id objc_msgSend_setEncrypted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncrypted:");
}

id objc_msgSend_setEncryptionKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncryptionKey:");
}

id objc_msgSend_setEncryptionKeyVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncryptionKeyVersion:");
}

id objc_msgSend_setEncryptionManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncryptionManager:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setExtendedAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtendedAttributes:");
}

id objc_msgSend_setFailure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFailure:");
}

id objc_msgSend_setFileHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileHandle:");
}

id objc_msgSend_setFileID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileID:");
}

id objc_msgSend_setFinishedLoading_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinishedLoading:");
}

id objc_msgSend_setFlag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlag:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setFlags_forFileID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlags:forFileID:");
}

id objc_msgSend_setFlags_mask_forFileID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlags:mask:forFileID:");
}

id objc_msgSend_setFormatterBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormatterBehavior:");
}

id objc_msgSend_setFullBackup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFullBackup:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHTTPShouldUsePipelining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPShouldUsePipelining:");
}

id objc_msgSend_setHardwareModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHardwareModel:");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIndex:");
}

id objc_msgSend_setInt_forName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInt:forName:");
}

id objc_msgSend_setItemID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemID:");
}

id objc_msgSend_setKey_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKey:value:");
}

id objc_msgSend_setKeybag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeybag:");
}

id objc_msgSend_setKeybagData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeybagData:");
}

id objc_msgSend_setKeybagID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeybagID:");
}

id objc_msgSend_setKeybagUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeybagUUID:");
}

id objc_msgSend_setKnownAccounts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKnownAccounts:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLast_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLast:");
}

id objc_msgSend_setLastModified_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastModified:");
}

id objc_msgSend_setLastModified_forBackupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastModified:forBackupUDID:");
}

id objc_msgSend_setLastModified_forSnapshotID_backupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastModified:forSnapshotID:backupUDID:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLocalCommitted_snapshotID_backupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalCommitted:snapshotID:backupUDID:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLockdownKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockdownKeys:");
}

id objc_msgSend_setManifestEncryptionKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManifestEncryptionKey:");
}

id objc_msgSend_setMarketingName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMarketingName:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMethod:");
}

id objc_msgSend_setMetric_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetric:value:");
}

id objc_msgSend_setMinUploadedFileSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinUploadedFileSize:");
}

id objc_msgSend_setMobileInstallation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMobileInstallation:");
}

id objc_msgSend_setMovedBackupName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMovedBackupName:");
}

id objc_msgSend_setMovedOldBackup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMovedOldBackup:");
}

id objc_msgSend_setNode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNode:");
}

id objc_msgSend_setNonRedirectedDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNonRedirectedDomain:");
}

id objc_msgSend_setOTA_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOTA:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forDomain_andKey_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forDomain:andKey:withError:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOffset:");
}

id objc_msgSend_setOffset_flags_forFileID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOffset:flags:forFileID:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setPasscodeSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeSet:");
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPassword:");
}

id objc_msgSend_setPasswordData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasswordData:");
}

id objc_msgSend_setPasswordHash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasswordHash:");
}

id objc_msgSend_setPasswordInKeychain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasswordInKeychain:error:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPaths:");
}

id objc_msgSend_setPlugins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlugins:");
}

id objc_msgSend_setPreferencesValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferencesValue:forKey:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProductType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProductType:");
}

id objc_msgSend_setProductVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProductVersion:");
}

id objc_msgSend_setProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperties:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setPropertyWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPropertyWithName:value:");
}

id objc_msgSend_setProtectionClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtectionClass:");
}

id objc_msgSend_setProtocolVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtocolVersion:");
}

id objc_msgSend_setRelativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelativePath:");
}

id objc_msgSend_setRelativePathsNotToBackup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelativePathsNotToBackup:");
}

id objc_msgSend_setRelativePathsNotToBackupToDrive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelativePathsNotToBackupToDrive:");
}

id objc_msgSend_setRelativePathsNotToRemoveIfNotRestored_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelativePathsNotToRemoveIfNotRestored:");
}

id objc_msgSend_setRelativePathsNotToRestore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelativePathsNotToRestore:");
}

id objc_msgSend_setRelativePathsToBackupAndRestore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelativePathsToBackupAndRestore:");
}

id objc_msgSend_setRelativePathsToIgnoreExclusionsForDrive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelativePathsToIgnoreExclusionsForDrive:");
}

id objc_msgSend_setRelativePathsToOnlyBackupEncrypted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelativePathsToOnlyBackupEncrypted:");
}

id objc_msgSend_setRelativePathsToRestoreOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelativePathsToRestoreOnly:");
}

id objc_msgSend_setRequestUserConfirmation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestUserConfirmation:");
}

id objc_msgSend_setRequiredProductVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiredProductVersion:");
}

id objc_msgSend_setResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceValue:forKey:error:");
}

id objc_msgSend_setResponseReceived_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponseReceived:");
}

id objc_msgSend_setRestoreID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRestoreID:");
}

id objc_msgSend_setResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResult:");
}

id objc_msgSend_setSafeHarborExpiration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSafeHarborExpiration:");
}

id objc_msgSend_setSalt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSalt:");
}

id objc_msgSend_setScanner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanner:");
}

id objc_msgSend_setSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSerialNumber:");
}

id objc_msgSend_setSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSet:");
}

id objc_msgSend_setShouldDigest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDigest:");
}

id objc_msgSend_setShouldPreserveSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldPreserveSettings:");
}

id objc_msgSend_setShouldVacuum_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldVacuum:");
}

id objc_msgSend_setShowArchiveOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowArchiveOption:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSnapshotID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSnapshotID:");
}

id objc_msgSend_setSnapshotMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSnapshotMountPoint:");
}

id objc_msgSend_setSnapshotName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSnapshotName:");
}

id objc_msgSend_setSnapshotState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSnapshotState:");
}

id objc_msgSend_setSnapshots_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSnapshots:");
}

id objc_msgSend_setSourceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceIdentifier:");
}

id objc_msgSend_setSqliteErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSqliteErrorHandler:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_forNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:forNotification:");
}

id objc_msgSend_setStatementCacheMaxCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatementCacheMaxCount:");
}

id objc_msgSend_setSystemAppNotAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemAppNotAllowed:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTargetDeviceClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetDeviceClass:");
}

id objc_msgSend_setTargetIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetIdentifier:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutInterval:");
}

id objc_msgSend_setTotal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotal:");
}

id objc_msgSend_setTraced_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTraced:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUUID:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setUpgradeBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpgradeBlock:");
}

id objc_msgSend_setUploadFileCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUploadFileCount:");
}

id objc_msgSend_setUploadSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUploadSize:");
}

id objc_msgSend_setUploadSizeExcludingHardlinksAndClones_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUploadSizeExcludingHardlinksAndClones:");
}

id objc_msgSend_setUserVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserVersion:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setValue_forDomain_key_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forDomain:key:completionBlock:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forKey_forPathFSR_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:forPathFSR:error:");
}

id objc_msgSend_setValue_forName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forName:");
}

id objc_msgSend_setValuesWithDictionary_forDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValuesWithDictionary:forDomain:");
}

id objc_msgSend_setValuesWithDictionary_forDomain_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValuesWithDictionary:forDomain:completionBlock:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setVolumeMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolumeMountPoint:");
}

id objc_msgSend_setWaitForDeletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitForDeletion:");
}

id objc_msgSend_setWasCloudRestore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWasCloudRestore:");
}

id objc_msgSend_setWillEncryptInLockdown_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWillEncryptInLockdown:error:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithFD_value_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithFD:value:error:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWithPath_value_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithPath:value:error:");
}

id objc_msgSend_setWithPathFSR_value_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithPathFSR:value:error:");
}

id objc_msgSend_settingsContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settingsContext");
}

id objc_msgSend_setupEncryptionWithPassword_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupEncryptionWithPassword:withError:");
}

id objc_msgSend_setupPragmas(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupPragmas");
}

id objc_msgSend_sha1ForData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sha1ForData:");
}

id objc_msgSend_sha256(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sha256");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedIncompleteRestoreDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedIncompleteRestoreDirectory");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedNotificationCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedNotificationCenter");
}

id objc_msgSend_sharedOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedOptions");
}

id objc_msgSend_sharedPool(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPool");
}

id objc_msgSend_sharedRestoreDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedRestoreDirectory");
}

id objc_msgSend_sharedTemporaryDirectoryIdentifiedBy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedTemporaryDirectoryIdentifiedBy:");
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortVersionString");
}

id objc_msgSend_shouldAlwaysRestoreSystemSharedContainerDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAlwaysRestoreSystemSharedContainerDomain:");
}

id objc_msgSend_shouldBackgroundRestoreContentWithPolicy_fileInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldBackgroundRestoreContentWithPolicy:fileInfo:");
}

id objc_msgSend_shouldCommitIfPossible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldCommitIfPossible");
}

id objc_msgSend_shouldCopyBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldCopyBackup");
}

id objc_msgSend_shouldDigest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldDigest");
}

id objc_msgSend_shouldForegroundRestoreDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldForegroundRestoreDomain:");
}

id objc_msgSend_shouldNotifySpringBoard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldNotifySpringBoard");
}

id objc_msgSend_shouldPreserveSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPreserveSettings");
}

id objc_msgSend_shouldRemoveItemsNotRestored(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRemoveItemsNotRestored");
}

id objc_msgSend_shouldRestoreAppWithID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRestoreAppWithID:");
}

id objc_msgSend_shouldRestoreContentWithPolicy_atPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRestoreContentWithPolicy:atPath:");
}

id objc_msgSend_shouldRestoreContentWithPolicy_fileInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRestoreContentWithPolicy:fileInfo:");
}

id objc_msgSend_shouldRestoreRelativeSymlinks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRestoreRelativeSymlinks");
}

id objc_msgSend_shouldRestoreSystemFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRestoreSystemFile:");
}

id objc_msgSend_shouldRestoreSystemFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRestoreSystemFiles");
}

id objc_msgSend_shouldRestoreToSharedVolume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRestoreToSharedVolume");
}

id objc_msgSend_shouldVacuum(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldVacuum");
}

id objc_msgSend_shouldVerifyDigests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldVerifyDigests");
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signature");
}

id objc_msgSend_singleFromMultiErrorWithReturnValue_results_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singleFromMultiErrorWithReturnValue:results:error:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sizeExcludingHardlinksAndClonesForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeExcludingHardlinksAndClonesForType:");
}

id objc_msgSend_sizeForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeForType:");
}

id objc_msgSend_sizeOfAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeOfAttributes:");
}

id objc_msgSend_skippedFileRecordsPlistPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skippedFileRecordsPlistPath");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshot");
}

id objc_msgSend_snapshotAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotAtIndex:");
}

id objc_msgSend_snapshotID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotID");
}

id objc_msgSend_snapshotManifestDB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotManifestDB");
}

id objc_msgSend_snapshotMountPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotMountPoint");
}

id objc_msgSend_snapshotMountPointForVolumeMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotMountPointForVolumeMountPoint:");
}

id objc_msgSend_snapshotName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotName");
}

id objc_msgSend_snapshotPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotPath");
}

id objc_msgSend_snapshotState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotState");
}

id objc_msgSend_snapshotStateName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotStateName");
}

id objc_msgSend_snapshotStateWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotStateWithString:");
}

id objc_msgSend_snapshots(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshots");
}

id objc_msgSend_snapshotsCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotsCount");
}

id objc_msgSend_snapshotsForBackupUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotsForBackupUDID:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceIdentifier");
}

id objc_msgSend_sqlBatchCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sqlBatchCount");
}

id objc_msgSend_sqlBatchTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sqlBatchTime");
}

id objc_msgSend_sqlTrace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sqlTrace");
}

id objc_msgSend_sqliteErrorHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sqliteErrorHandler");
}

id objc_msgSend_sqliteOpenFlagForProtectionClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sqliteOpenFlagForProtectionClass:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTime");
}

id objc_msgSend_statWithBuffer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statWithBuffer:error:");
}

id objc_msgSend_statWithFD_buf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statWithFD:buf:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_statusWithDrive_path_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusWithDrive:path:error:");
}

id objc_msgSend_step(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "step");
}

id objc_msgSend_stmt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stmt");
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamError");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringAtIndex:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByStandardizingPath");
}

id objc_msgSend_stringForEngineMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForEngineMode:");
}

id objc_msgSend_stringForEngineType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForEngineType:");
}

id objc_msgSend_stringForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForType:");
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromByteCount:countStyle:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFileSystemRepresentation_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFileSystemRepresentation:length:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithSnapshotState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithSnapshotState:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subcount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subcount");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_subdictionary_toIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdictionary:toIndex:");
}

id objc_msgSend_subdictionary_withKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdictionary:withKeys:");
}

id objc_msgSend_subindex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subindex");
}

id objc_msgSend_submit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submit");
}

id objc_msgSend_submitEventName_metrics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitEventName:metrics:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_symbolicLinkTargetWithPathFSR_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "symbolicLinkTargetWithPathFSR:error:");
}

id objc_msgSend_systemContainerDomainWithIdentifier_volumeMountPoint_rootPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemContainerDomainWithIdentifier:volumeMountPoint:rootPath:");
}

id objc_msgSend_systemContainersVolumeMountPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemContainersVolumeMountPoint");
}

id objc_msgSend_systemDataContainerRestoreDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemDataContainerRestoreDirectory");
}

id objc_msgSend_systemDataContainerWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemDataContainerWithIdentifier:");
}

id objc_msgSend_systemPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemPath");
}

id objc_msgSend_systemSharedContainerDomainWithIdentifier_volumeMountPoint_rootPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemSharedContainerDomainWithIdentifier:volumeMountPoint:rootPath:");
}

id objc_msgSend_systemSharedContainerWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemSharedContainerWithIdentifier:");
}

id objc_msgSend_systemSharedDataContainerRestoreDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemSharedDataContainerRestoreDirectory");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "target");
}

id objc_msgSend_targetDeviceClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetDeviceClass");
}

id objc_msgSend_targetIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetIdentifier");
}

id objc_msgSend_temporaryDirectoryOnSameVolumeAsPath_identifiedBy_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:");
}

id objc_msgSend_textColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textColumn:");
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "time");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_toolsWithSettingsContext_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toolsWithSettingsContext:error:");
}

id objc_msgSend_total(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "total");
}

id objc_msgSend_trackSnapshotForVolume_snapshotName_mountPount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackSnapshotForVolume:snapshotName:mountPount:");
}

id objc_msgSend_treeWithPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "treeWithPaths:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_typeForInstallMachinery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeForInstallMachinery");
}

id objc_msgSend_typeName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeName");
}

id objc_msgSend_typeOfColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeOfColumn:");
}

id objc_msgSend_typeString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeString");
}

id objc_msgSend_unarchivedObjectOfClass_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:atIndex:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unbackWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unbackWithError:");
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "underlyingErrors");
}

id objc_msgSend_uninstallAppWithBundleID_options_disposition_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uninstallAppWithBundleID:options:disposition:error:");
}

id objc_msgSend_uninstalledDomainWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uninstalledDomainWithName:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_unlockWithPassword_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockWithPassword:error:");
}

id objc_msgSend_unlockWithSecret_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockWithSecret:error:");
}

id objc_msgSend_unlockedKeyBagWithData_password_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockedKeyBagWithData:password:error:");
}

id objc_msgSend_unmount_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmount:error:");
}

id objc_msgSend_unmountAndDeleteSnapshotForVolume_name_mountPoint_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmountAndDeleteSnapshotForVolume:name:mountPoint:error:");
}

id objc_msgSend_unsetAlreadyUploadedFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsetAlreadyUploadedFlags");
}

id objc_msgSend_unsetVerifiedFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsetVerifiedFlags");
}

id objc_msgSend_unsignedIntAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntAtIndex:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateKeybagSecret_forUUID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateKeybagSecret:forUUID:error:");
}

id objc_msgSend_updateLocalBackupPassword_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLocalBackupPassword:error:");
}

id objc_msgSend_updatePassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePassword:");
}

id objc_msgSend_updateValue_forServiceName_accountName_withAccessibility_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateValue:forServiceName:accountName:withAccessibility:error:");
}

id objc_msgSend_updateWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithBytes:length:");
}

id objc_msgSend_updateWithDuration_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithDuration:size:");
}

id objc_msgSend_upgradeBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upgradeBlock");
}

id objc_msgSend_upgradeWithVersion_shouldVacuum_upgradeBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upgradeWithVersion:shouldVacuum:upgradeBlock:");
}

id objc_msgSend_uploadBatch_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadBatch:options:completion:");
}

id objc_msgSend_uploadData_toPath_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadData:toPath:options:error:");
}

id objc_msgSend_uploadFileAtPath_toPath_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadFileAtPath:toPath:options:error:");
}

id objc_msgSend_uploadFilesAtPaths_options_results_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadFilesAtPaths:options:results:error:");
}

id objc_msgSend_uploadPropertyList_toPath_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadPropertyList:toPath:options:error:");
}

id objc_msgSend_uploadToPath_withDrive_keybag_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadToPath:withDrive:keybag:error:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_usageOfDirectoryAtPath_count_size_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageOfDirectoryAtPath:count:size:options:error:");
}

id objc_msgSend_useBatchingWithDelay_changeCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useBatchingWithDelay:changeCount:");
}

id objc_msgSend_useSerialQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useSerialQueue");
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "user");
}

id objc_msgSend_userDataVolume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDataVolume");
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userID");
}

id objc_msgSend_userIncompleteRestoreDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userIncompleteRestoreDirectory");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaUniqueString");
}

id objc_msgSend_userRestoreDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userRestoreDirectory");
}

id objc_msgSend_userTemporaryDirectoryForPersona_identifiedBy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userTemporaryDirectoryForPersona:identifiedBy:");
}

id objc_msgSend_userVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userVersion");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_validateRestoreDomain_relativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateRestoreDomain:relativePath:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_valueData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueData");
}

id objc_msgSend_valueForDomain_key_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForDomain:key:");
}

id objc_msgSend_valueForKey_forFD_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:forFD:error:");
}

id objc_msgSend_valueForKey_forPathFSR_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:forPathFSR:error:");
}

id objc_msgSend_valueForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForName:");
}

id objc_msgSend_valueOfColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueOfColumn:");
}

id objc_msgSend_verifyEqualToStmt_exceptColumnNumbers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyEqualToStmt:exceptColumnNumbers:");
}

id objc_msgSend_verifyWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyWithError:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_volumeMountPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeMountPoint");
}

id objc_msgSend_volumesToBackUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumesToBackUp");
}

id objc_msgSend_wasPasscodeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wasPasscodeSet");
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "write:maxLength:");
}

id objc_msgSend_writeToDrive_path_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToDrive:path:error:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:error:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}

id objc_msgSend_writeWithBytes_length_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeWithBytes:length:error:");
}

id objc_msgSend_writeWithFD_bytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeWithFD:bytes:length:");
}

id objc_msgSend_xattrOptionsForFD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xattrOptionsForFD:");
}

id objc_msgSend_xattrOptionsForPathFSR_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xattrOptionsForPathFSR:");
}
