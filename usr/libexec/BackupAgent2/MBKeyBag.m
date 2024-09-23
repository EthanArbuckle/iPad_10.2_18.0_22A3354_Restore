@implementation MBKeyBag

+ (__MKBAssertion)holdLockAssertion:(id)a3
{
  id v3;
  CFNumberRef v4;
  CFDictionaryRef v5;
  __MKBAssertion *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  CFTypeRef cf;
  unsigned int valuePtr;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  CFTypeRef v18;
  __int16 v19;
  unsigned int v20;
  void *values[2];
  void *keys[2];

  v3 = a3;
  valuePtr = 300;
  cf = 0;
  v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *(_OWORD *)keys = *(_OWORD *)&off_1000D9F48;
  values[0] = CFSTR("Other");
  values[1] = v4;
  v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v6 = (__MKBAssertion *)MKBDeviceLockAssertion(v5, &cf);
  CFRelease(v5);
  CFRelease(v4);
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v16 = v3;
      v17 = 2048;
      v18 = v6;
      v19 = 1024;
      v20 = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Holding \"%{public}@\" keybag lock assertion (%p) for %ds", buf, 0x1Cu);
      _MBLog(CFSTR("DEFAULT"), "Holding \"%{public}@\" keybag lock assertion (%p) for %ds", v3, v6, valuePtr);
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = v3;
      v17 = 2112;
      v18 = cf;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to acquire keybag lock assertion \"%{public}@\": %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to acquire keybag lock assertion \"%{public}@\": %@", v3, cf);
    }

    if (cf)
      CFRelease(cf);
  }

  return v6;
}

+ (void)releaseLockAssertion:(__MKBAssertion *)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t buf[4];
  __MKBAssertion *v7;

  if (a3)
  {
    v4 = MBGetDefaultLog(a1, a2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Releasing keybag lock assertion (%p)", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), "Releasing keybag lock assertion (%p)", a3);
    }

    CFRelease(a3);
  }
}

+ (BOOL)wasDeviceUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot(a1, a2) == 1;
}

+ (BOOL)isDeviceKeyBagLocked
{
  return MKBGetDeviceLockState(0, a2) == 1;
}

+ (int)codeWithReturnCode:(int)a3
{
  int result;
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  int v8;

  result = 208;
  switch(a3)
  {
    case -8:
      result = 4;
      break;
    case -6:
      result = +[MBError codeForErrno:](MBError, "codeForErrno:", *__error());
      break;
    case -4:
      result = 3;
      break;
    case -3:
      result = 207;
      break;
    case -2:
      return result;
    case -1:
      result = 1;
      break;
    default:
      v5 = MBGetDefaultLog(208, a2);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v8 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No code for MobileKeyBag error: %d", buf, 8u);
        _MBLog(CFSTR("DEFAULT"), "No code for MobileKeyBag error: %d", a3);
      }

      result = 100;
      break;
  }
  return result;
}

+ (id)errorWithReturnCode:(int)a3 description:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", +[MBKeyBag codeWithReturnCode:](MBKeyBag, "codeWithReturnCode:", v4), CFSTR("%@ (%d)"), v5, v4));

  return v6;
}

+ (id)errorWithReturnCode:(int)a3 path:(id)a4 description:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  MBError *v10;
  void *v11;
  uint64_t v13;

  if (a3 == -6)
  {
    v7 = a5;
    v8 = a4;
    v9 = (int)+[MBError codeForErrno:](MBError, "codeForErrno:", *__error());
    v10 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", v9, v8, CFSTR("%@ (%d/%d)"), v7, 4294967290, *__error());
  }
  else
  {
    v10 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", +[MBKeyBag codeWithReturnCode:](MBKeyBag, "codeWithReturnCode:", *(_QWORD *)&a3), a4, CFSTR("%@ (%d)"), a5, *(_QWORD *)&a3, v13);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

+ (MBKeyBag)keybagWithData:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  MBKeyBag *v13;
  MBKeyBag *v14;
  void *v16;
  void *v17;
  CFTypeRef cf;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  CFTypeRef v22;

  v7 = a3;
  if (!v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBKeyBag.m"), 120, CFSTR("No keybag data"));

  }
  cf = 0;
  v8 = MKBKeyBagCreateWithData(v7, &cf);
  v10 = MBGetDefaultLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "MKBKeyBagCreateWithData: %d", buf, 8u);
      _MBLog(CFSTR("ERROR"), "MKBKeyBagCreateWithData: %d", v8);
    }

    v13 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:description:](MBKeyBag, "errorWithReturnCode:description:", v8, CFSTR("MKBKeyBagCreateWithData error")));
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v20 = 0;
      v21 = 2048;
      v22 = cf;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "MKBKeyBagCreateWithData: %d %p", buf, 0x12u);
      _MBLog(CFSTR("INFO"), "MKBKeyBagCreateWithData: %d %p", 0, cf);
    }

    if (!cf)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBKeyBag.m"), 125, CFSTR("MKBKeyBagCreateWithData succeeded but handle is null"));

    }
    v14 = [MBKeyBag alloc];
    v13 = -[MBKeyBag initWithHandle:OTA:](v14, "initWithHandle:OTA:", cf, 0);
    CFRelease(cf);
  }

  return v13;
}

+ (id)unlockedKeyBagWithData:(id)a3 password:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeyBag keybagWithData:error:](MBKeyBag, "keybagWithData:error:", a3, a5));
  v9 = v8;
  if (v8 && objc_msgSend(v8, "unlockWithPassword:error:", v7, a5))
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

+ (MBKeyBag)keybagWithPassword:(id)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  MBKeyBag *v13;
  MBKeyBag *v14;
  void *v15;
  CFTypeRef cf;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  CFTypeRef v20;

  cf = 0;
  v7 = MKBKeyBagCreateBackup(objc_msgSend(a3, "dataUsingEncoding:", 4), &cf);
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if ((_DWORD)v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MKBKeyBagCreateBackup: %d", buf, 8u);
      _MBLog(CFSTR("ERROR"), "MKBKeyBagCreateBackup: %d", v7);
    }

    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:description:](MBKeyBag, "errorWithReturnCode:description:", v7, CFSTR("MKBKeyBagCreateBackup error")));
    return (MBKeyBag *)0;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v18 = 0;
      v19 = 2048;
      v20 = cf;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MKBKeyBagCreateBackup: %d %p", buf, 0x12u);
      _MBLog(CFSTR("DEFAULT"), "MKBKeyBagCreateBackup: %d %p", 0, cf);
    }

    if (!cf)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBKeyBag.m"), 156, CFSTR("MKBKeyBagCreateBackup succeeded but handle is null"));

    }
    v13 = [MBKeyBag alloc];
    v14 = -[MBKeyBag initWithHandle:OTA:](v13, "initWithHandle:OTA:", cf, 0);
    CFRelease(cf);
    return v14;
  }
}

+ (id)OTAKeyBagWithData:(id)a3 error:(id *)a4
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MBKeyBag keybagWithData:error:](MBKeyBag, "keybagWithData:error:", a3, a4));
  objc_msgSend(v4, "setOTA:", 1);
  return v4;
}

+ (id)OTAKeyBagWithSecret:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  MBKeyBag *v13;
  MBKeyBag *v14;
  void *v16;
  void *v17;
  CFTypeRef cf;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  CFTypeRef v22;

  v7 = a3;
  if (!v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBKeyBag.m"), 175, CFSTR("Null secret"));

  }
  cf = 0;
  v8 = MKBKeyBagCreateOTABackup(v7, &cf);
  v10 = MBGetDefaultLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "MKBKeyBagCreateOTABackup: %d", buf, 8u);
      _MBLog(CFSTR("ERROR"), "MKBKeyBagCreateOTABackup: %d", v8);
    }

    v13 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:description:](MBKeyBag, "errorWithReturnCode:description:", v8, CFSTR("MKBKeyBagCreateOTABackup error")));
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v20 = 0;
      v21 = 2048;
      v22 = cf;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MKBKeyBagCreateOTABackup: %d %p", buf, 0x12u);
      _MBLog(CFSTR("DEFAULT"), "MKBKeyBagCreateOTABackup: %d %p", 0, cf);
    }

    if (!cf)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBKeyBag.m"), 180, CFSTR("MKBKeyBagCreateOTABackup succeeded but handle is null"));

    }
    v14 = [MBKeyBag alloc];
    v13 = -[MBKeyBag initWithHandle:OTA:](v14, "initWithHandle:OTA:", cf, 1);
    CFRelease(cf);
  }

  return v13;
}

+ (id)sharedOTAKeyBag
{
  if (qword_1000F9E48 != -1)
    dispatch_once(&qword_1000F9E48, &stru_1000D9F58);
  return (id)qword_1000F9E40;
}

+ (BOOL)unregisterOTAKeyBagWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  int v11;

  v4 = MKBKeyBagRegisterOTABackup(0, 0);
  v6 = MBGetDefaultLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MKBKeyBagRegisterOTABackup(NULL, NULL): %d", buf, 8u);
      _MBLog(CFSTR("ERROR"), "MKBKeyBagRegisterOTABackup(NULL, NULL): %d", v4);
    }

    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:description:](MBKeyBag, "errorWithReturnCode:description:", v4, CFSTR("MKBKeyBagRegisterOTABackup error")));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MKBKeyBagRegisterOTABackup(NULL, NULL): %d", buf, 8u);
      _MBLog(CFSTR("DEFAULT"), "MKBKeyBagRegisterOTABackup(NULL, NULL): %d", 0);
    }

  }
  return (_DWORD)v4 == 0;
}

+ (void)startOTABackup
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  int v10;

  v2 = MBGetDefaultLog(a1, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MKBOTABackupStart", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "MKBOTABackupStart");
  }

  v4 = MKBOTABackupStart();
  if ((_DWORD)v4)
  {
    v6 = v4;
    v7 = MBGetDefaultLog(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MKBOTABackupStart failed: %d", buf, 8u);
      _MBLog(CFSTR("ERROR"), "MKBOTABackupStart failed: %d", v6);
    }

  }
}

+ (void)stopOTABackup
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  int v10;

  v2 = MBGetDefaultLog(a1, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MKBOTABackupStop", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "MKBOTABackupStop");
  }

  v4 = MKBOTABackupStop();
  if ((_DWORD)v4)
  {
    v6 = v4;
    v7 = MBGetDefaultLog(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MKBOTABackupStop failed: %d", buf, 8u);
      _MBLog(CFSTR("ERROR"), "MKBOTABackupStop failed: %d", v6);
    }

  }
}

+ (void)startOTABackupForVolumeUUID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;
  _QWORD v19[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v6 = MBGetDefaultLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MKBOTABackupStartForVolume %{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "MKBOTABackupStartForVolume %{public}@", v4);
  }

  v19[0] = 0;
  v19[1] = 0;
  objc_msgSend(v3, "getUUIDBytes:", v19);
  v8 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v19, 16));
  if (!v8)
    sub_100088800();
  v9 = (void *)v8;
  v10 = MKBOTABackupStartForVolume();
  if ((_DWORD)v10)
  {
    v12 = v10;
    v13 = MBGetDefaultLog(v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = v4;
      v17 = 1024;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "MKBOTABackupStartForVolume %{public}@ failed: %d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "MKBOTABackupStartForVolume %{public}@ failed: %d", v4, v12);
    }

  }
}

+ (void)stopOTABackupForVolumeUUID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;
  _QWORD v19[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v6 = MBGetDefaultLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MKBOTABackupStopForVolume %{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "MKBOTABackupStopForVolume %{public}@", v4);
  }

  v19[0] = 0;
  v19[1] = 0;
  objc_msgSend(v3, "getUUIDBytes:", v19);
  v8 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v19, 16));
  if (!v8)
    sub_100088828();
  v9 = (void *)v8;
  v10 = MKBOTABackupStopForVolume();
  if ((_DWORD)v10)
  {
    v12 = v10;
    v13 = MBGetDefaultLog(v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = v4;
      v17 = 1024;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "MKBOTABackupStopForVolume %{public}@ failed: %d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "MKBOTABackupStopForVolume %{public}@ failed: %d", v4, v12);
    }

  }
}

+ (id)randomSecret
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v6[16];

  v2 = MBGetDefaultLog(a1, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Generating random keybag secret", v6, 2u);
    _MBLog(CFSTR("INFO"), "Generating random keybag secret");
  }

  v4 = MBRandomDataWithLength(32);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (MBKeyBag)initWithHandle:(__MKBKeyBagHandle *)a3 OTA:(BOOL)a4
{
  MBKeyBag *v7;
  void *v10;
  objc_super v11;

  if (!a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBKeyBag.m"), 264, CFSTR("Null keybag handle"));

  }
  v11.receiver = self;
  v11.super_class = (Class)MBKeyBag;
  v7 = -[MBKeyBag init](&v11, "init");
  if (v7)
  {
    v7->_handle = (__MKBKeyBagHandle *)CFRetain(a3);
    v7->_OTA = a4;
  }
  return v7;
}

- (MBKeyBag)initWithOTAHandle:(__MKBOTABackupBagHandle *)a3 keyBagData:(id)a4
{
  id v8;
  MBKeyBag *v9;
  MBKeyBag *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!a3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBKeyBag.m"), 273, CFSTR("Null keybag handle"));

  }
  v13.receiver = self;
  v13.super_class = (Class)MBKeyBag;
  v9 = -[MBKeyBag init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    v9->_OTAHandle = a3;
    *(_WORD *)&v9->_OTA = 257;
    objc_storeStrong((id *)&v9->_keyBagData, a4);
  }

  return v10;
}

- (void)dealloc
{
  __MKBOTABackupBagHandle *OTAHandle;
  __MKBKeyBagHandle *handle;
  objc_super v5;

  OTAHandle = self->_OTAHandle;
  if (OTAHandle)
    MKBOTABackupBagClose(OTAHandle, a2);
  handle = self->_handle;
  if (handle)
    CFRelease(handle);
  v5.receiver = self;
  v5.super_class = (Class)MBKeyBag;
  -[MBKeyBag dealloc](&v5, "dealloc");
}

- (BOOL)registerWithPasscode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  __MKBKeyBagHandle *handle;
  BOOL v14;
  __MKBKeyBagHandle *v15;
  uint8_t buf[4];
  __MKBKeyBagHandle *v18;
  __int16 v19;
  int v20;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBKeyBag dataWithError:](self, "dataWithError:", a4));
  if (!v7)
    goto LABEL_7;
  v8 = MKBKeyBagRegisterOTABackup(v7, objc_msgSend(v6, "dataUsingEncoding:", 4));
  v10 = MBGetDefaultLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      handle = self->_handle;
      *(_DWORD *)buf = 134218240;
      v18 = handle;
      v19 = 1024;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "MKBKeyBagRegisterOTABackup(%p): %d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "MKBKeyBagRegisterOTABackup(%p): %d", self->_handle, v8);
    }

    if (a4)
    {
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:description:](MBKeyBag, "errorWithReturnCode:description:", v8, CFSTR("MKBKeyBagRegisterOTABackup error")));
      goto LABEL_11;
    }
LABEL_7:
    v14 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = self->_handle;
    *(_DWORD *)buf = 134218240;
    v18 = v15;
    v19 = 1024;
    v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MKBKeyBagRegisterOTABackup(%p): %d", buf, 0x12u);
    _MBLog(CFSTR("DEFAULT"), "MKBKeyBagRegisterOTABackup(%p): %d", self->_handle, 0);
  }

  v14 = 1;
LABEL_11:

  return v14;
}

- (BOOL)unlockWithPassword:(id)a3 error:(id *)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  LOBYTE(a4) = -[MBKeyBag unlockWithSecret:error:](self, "unlockWithSecret:error:", v6, a4);

  return (char)a4;
}

- (BOOL)unlockWithSecret:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  __MKBKeyBagHandle *handle;
  id v15;
  __MKBKeyBagHandle *v16;
  uint8_t buf[4];
  __MKBKeyBagHandle *v18;
  __int16 v19;
  int v20;

  v6 = a3;
  if (self->_OTAHandle)
  {
    if (!self->_isUnlocked)
      sub_100088850();
    v7 = 1;
  }
  else
  {
    v9 = MKBKeyBagUnlock(self->_handle, v6);
    v11 = MBGetDefaultLog(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if ((_DWORD)v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        handle = self->_handle;
        *(_DWORD *)buf = 134218240;
        v18 = handle;
        v19 = 1024;
        v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "MKBKeyBagUnlock(%p): %d", buf, 0x12u);
        _MBLog(CFSTR("ERROR"), "MKBKeyBagUnlock(%p): %d", self->_handle, v9);
      }

      if (a4)
      {
        v15 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:description:](MBKeyBag, "errorWithReturnCode:description:", v9, CFSTR("MKBKeyBagUnlock error")));
        v7 = 0;
        *a4 = v15;
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 1;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v16 = self->_handle;
        *(_DWORD *)buf = 134218240;
        v18 = v16;
        v19 = 1024;
        v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "MKBKeyBagUnlock(%p): %d", buf, 0x12u);
        _MBLog(CFSTR("INFO"), "MKBKeyBagUnlock(%p): %d", self->_handle, 0);
      }

      self->_isUnlocked = 1;
    }
  }

  return v7;
}

- (BOOL)changePasswordFrom:(id)a3 toPassword:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));

  LOBYTE(a5) = -[MBKeyBag changeSecretFrom:toSecret:error:](self, "changeSecretFrom:toSecret:error:", v9, v10, a5);
  return (char)a5;
}

- (BOOL)changeSecretFrom:(id)a3 toSecret:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  __MKBKeyBagHandle *handle;
  __MKBKeyBagHandle *v13;
  uint8_t buf[4];
  __MKBKeyBagHandle *v16;
  __int16 v17;
  int v18;

  v7 = MKBKeyBagChangeSecret(self->_handle, a3, a4);
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if ((_DWORD)v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      handle = self->_handle;
      *(_DWORD *)buf = 134218240;
      v16 = handle;
      v17 = 1024;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MKBKeyBagChangeSecret(%p): %d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "MKBKeyBagChangeSecret(%p): %d", self->_handle, v7);
    }

    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:description:](MBKeyBag, "errorWithReturnCode:description:", v7, CFSTR("MKBKeyBagChangeSecret error")));
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = self->_handle;
      *(_DWORD *)buf = 134218240;
      v16 = v13;
      v17 = 1024;
      v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "MKBKeyBagChangeSecret(%p): %d", buf, 0x12u);
      _MBLog(CFSTR("INFO"), "MKBKeyBagChangeSecret(%p): %d", self->_handle, 0);
    }

  }
  return (_DWORD)v7 == 0;
}

- (BOOL)validateWrappedKey:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  MBError *v12;
  BOOL v13;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  int v19;

  v6 = a3;
  if (!v6)
  {
    if (a4)
    {
      v12 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("Invalid encryption key (key is nil)"), v15);
      goto LABEL_9;
    }
LABEL_10:
    v13 = 0;
    goto LABEL_14;
  }
  v7 = MKBBackupValidateKeyUUID(self->_handle, v6);
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if ((_DWORD)v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 1024;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MKBBackupValidateKeyUUID(%@): %d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "MKBBackupValidateKeyUUID(%@): %d", v6, v7);
    }

    if (a4)
    {
      v12 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, CFSTR("Encryption key is invalid: %d"), v7);
LABEL_9:
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 1024;
    v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MKBBackupValidateKeyUUID(%@): %d", buf, 0x12u);
    _MBLog(CFSTR("DEBUG"), "MKBBackupValidateKeyUUID(%@): %d", v6, 0);
  }

  v13 = 1;
LABEL_14:

  return v13;
}

- (id)dataWithError:(id *)a3
{
  NSData *keyBagData;
  NSData *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __MKBKeyBagHandle *v14;
  uint64_t v15;
  NSObject *v16;
  __MKBKeyBagHandle *handle;
  id v18;
  void *v19;
  NSData *v20;
  uint8_t buf[4];
  __MKBKeyBagHandle *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;

  keyBagData = self->_keyBagData;
  if (keyBagData)
  {
    v4 = keyBagData;
    return v4;
  }
  v20 = 0;
  v9 = MKBKeyBagCopyData(self->_handle, &v20);
  if (!(_DWORD)v9)
  {
    v4 = v20;
    v15 = MBGetDefaultLog(v9, v10);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      handle = self->_handle;
      v18 = -[NSData length](v4, "length");
      *(_DWORD *)buf = 134218496;
      v22 = handle;
      v23 = 1024;
      v24 = 0;
      v25 = 2048;
      v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "MKBKeyBagCopyData(%p): %d, size:%lu", buf, 0x1Cu);
      _MBLog(CFSTR("INFO"), "MKBKeyBagCopyData(%p): %d, size:%lu", self->_handle, 0, -[NSData length](v4, "length"));
    }

    if (!v4)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBKeyBag.m"), 372, CFSTR("MKBKeyBagCopyData succeeded but data is null"));

    }
    return v4;
  }
  v11 = v9;
  v12 = MBGetDefaultLog(v9, v10);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = self->_handle;
    *(_DWORD *)buf = 134218240;
    v22 = v14;
    v23 = 1024;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "MKBKeyBagCopyData(%p): %d", buf, 0x12u);
    _MBLog(CFSTR("ERROR"), "MKBKeyBagCopyData(%p): %d", self->_handle, v11);
  }

  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:description:](MBKeyBag, "errorWithReturnCode:description:", v11, CFSTR("MKBKeyBagCopyData error")));
  return 0;
}

- (id)UUIDWithError:(id *)a3
{
  __MKBOTABackupBagHandle *OTAHandle;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __MKBOTABackupBagHandle *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  __MKBKeyBagHandle *handle;
  void *v20;
  void *v21;
  const __CFString *v22;
  SEL v23;
  MBKeyBag *v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  int v30;

  v26 = 0;
  OTAHandle = self->_OTAHandle;
  if (OTAHandle)
  {
    v7 = MKBOTABackupBagCopyUUID(OTAHandle, &v26);
    if ((_DWORD)v7)
    {
      v9 = v7;
      v10 = MBGetDefaultLog(v7, v8);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = self->_OTAHandle;
        *(_DWORD *)buf = 134218240;
        v28 = v12;
        v29 = 1024;
        v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MKBOTABackupBagCopyUUID(%p): %d", buf, 0x12u);
        _MBLog(CFSTR("ERROR"), "MKBOTABackupBagCopyUUID(%p): %d", self->_OTAHandle, v9);
      }

      if (a3)
      {
        v13 = CFSTR("MKBOTABackupBagCopyUUID error");
LABEL_12:
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:description:](MBKeyBag, "errorWithReturnCode:description:", v9, v13));
        return 0;
      }
      return 0;
    }
    if (!v26)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v21 = v20;
      v22 = CFSTR("MKBOTABackupBagCopyUUID succeeded but data is null");
      v23 = a2;
      v24 = self;
      v25 = 391;
LABEL_20:
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, CFSTR("MBKeyBag.m"), v25, v22);

    }
  }
  else
  {
    v14 = MKBKeyBagCopyUUID(self->_handle, &v26);
    if ((_DWORD)v14)
    {
      v9 = v14;
      v16 = MBGetDefaultLog(v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        handle = self->_handle;
        *(_DWORD *)buf = 134218240;
        v28 = handle;
        v29 = 1024;
        v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "MKBKeyBagCopyUUID(%p): %d", buf, 0x12u);
        _MBLog(CFSTR("ERROR"), "MKBKeyBagCopyUUID(%p): %d", self->_handle, v9);
      }

      if (a3)
      {
        v13 = CFSTR("MKBKeyBagCopyUUID error");
        goto LABEL_12;
      }
      return 0;
    }
    if (!v26)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v21 = v20;
      v22 = CFSTR("MKBKeyBagCopyUUID succeeded but data is null");
      v23 = a2;
      v24 = self;
      v25 = 399;
      goto LABEL_20;
    }
  }
  return v26;
}

- (id)encryptionKeyForFile:(_mkbfileref *)a3 path:(id)a4 error:(id *)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  __MKBKeyBagHandle *handle;
  void *v16;
  __MKBKeyBagHandle *v17;
  void *v18;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  __MKBKeyBagHandle *v24;
  __int16 v25;
  int v26;

  v9 = a4;
  v20 = 0;
  v10 = MKBFileCopyWrappedKey(a3, self->_handle, &v20);
  v12 = MBGetDefaultLog(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if ((_DWORD)v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      handle = self->_handle;
      *(_DWORD *)buf = 138412802;
      v22 = v9;
      v23 = 2048;
      v24 = handle;
      v25 = 1024;
      v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "MKBFileCopyWrappedKey(\"%@\", %p, ...): %d", buf, 0x1Cu);
      _MBLog(CFSTR("ERROR"), "MKBFileCopyWrappedKey(\"%@\", %p, ...): %d", v9, self->_handle, v10);
    }

    v16 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:path:description:](MBKeyBag, "errorWithReturnCode:path:description:", v10, v9, CFSTR("MKBFileCopyWrappedKey error")));
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v17 = self->_handle;
      *(_DWORD *)buf = 138412802;
      v22 = v9;
      v23 = 2048;
      v24 = v17;
      v25 = 1024;
      v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "MKBFileCopyWrappedKey(\"%@\", %p, ...): %d", buf, 0x1Cu);
      _MBLog(CFSTR("DEBUG"), "MKBFileCopyWrappedKey(\"%@\", %p, ...): %d", v9, self->_handle, 0);
    }

    v16 = v20;
    if (!v20)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBKeyBag.m"), 538, CFSTR("MKBFileCopyWrappedKey succeeded but returned key is null"));

    }
  }

  return v16;
}

- (BOOL)validateEncryptionKey:(id)a3 file:(_mkbfileref *)a4 path:(id)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  __MKBKeyBagHandle *handle;
  __MKBKeyBagHandle *v17;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  __MKBKeyBagHandle *v22;
  __int16 v23;
  int v24;

  v10 = a5;
  v11 = MKBFileValidateWrappedKey(a4, self->_handle, a3);
  v13 = MBGetDefaultLog(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if ((_DWORD)v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      handle = self->_handle;
      *(_DWORD *)buf = 138412802;
      v20 = v10;
      v21 = 2048;
      v22 = handle;
      v23 = 1024;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "MKBFileValidateWrappedKey(\"%@\", %p, ...): %d", buf, 0x1Cu);
      _MBLog(CFSTR("ERROR"), "MKBFileValidateWrappedKey(\"%@\", %p, ...): %d", v10, self->_handle, v11);
    }

    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:path:description:](MBKeyBag, "errorWithReturnCode:path:description:", v11, v10, CFSTR("MKBFileValidateWrappedKey error")));
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v17 = self->_handle;
      *(_DWORD *)buf = 138412802;
      v20 = v10;
      v21 = 2048;
      v22 = v17;
      v23 = 1024;
      v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "MKBFileValidateWrappedKey(\"%@\", %p, ...): %d", buf, 0x1Cu);
      _MBLog(CFSTR("DEBUG"), "MKBFileValidateWrappedKey(\"%@\", %p, ...): %d", v10, self->_handle, 0);
    }

  }
  return (_DWORD)v11 == 0;
}

- (_mkbfileref)encryptedFileForRestoreWithPath:(id)a3 key:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _mkbfileref *v15;
  _mkbfileref *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  int v21;

  v7 = a3;
  v8 = a4;
  if (!v8)
    sub_100088878();
  v9 = v8;
  v17 = 0;
  v10 = MKBFileCreateForRestore(v7, self->_handle, v8, &v17);
  v12 = MBGetDefaultLog(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if ((_DWORD)v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 1024;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "MKBFileCreateForRestore(\"%@\", ...): %d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), "MKBFileCreateForRestore(\"%@\", ...): %d", v7, v10);
    }

    v15 = 0;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 1024;
      v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "MKBFileCreateForRestore(\"%@\", ...): %d", buf, 0x12u);
      _MBLog(CFSTR("DEBUG"), "MKBFileCreateForRestore(\"%@\", ...): %d", v7, 0);
    }

    v15 = v17;
  }

  return v15;
}

- (BOOL)decryptFileWithPath:(id)a3 encryptionKey:(id)a4 size:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  __MKBOTABackupBagHandle *OTAHandle;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  __MKBOTABackupBagHandle *v19;
  const __CFString *v20;
  __MKBKeyBagHandle *handle;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  __MKBKeyBagHandle *v25;
  BOOL v26;
  __MKBOTABackupBagHandle *v27;
  __MKBKeyBagHandle *v28;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int v39;

  v10 = a3;
  v11 = a4;
  OTAHandle = self->_OTAHandle;
  if (!OTAHandle)
  {
    handle = self->_handle;
    v13 = objc_retainAutorelease(v10);
    v14 = MKBBackupDecryptInPlace(handle, objc_msgSend(v13, "fileSystemRepresentation"), a5, v11);
    v23 = MBGetDefaultLog(v14, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v18 = v24;
    if ((_DWORD)v14)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = self->_handle;
        *(_DWORD *)buf = 134219010;
        v31 = v25;
        v32 = 2112;
        v33 = v13;
        v34 = 2048;
        v35 = a5;
        v36 = 2112;
        v37 = v11;
        v38 = 1024;
        v39 = v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "MKBBackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", buf, 0x30u);
        _MBLog(CFSTR("ERROR"), "MKBBackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", self->_handle, v13, a5, v11, v14);
      }

      if (a6)
      {
        v20 = CFSTR("MKBBackupDecryptInPlace error");
        goto LABEL_12;
      }
LABEL_15:
      v26 = 0;
      goto LABEL_19;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v28 = self->_handle;
      *(_DWORD *)buf = 134219010;
      v31 = v28;
      v32 = 2112;
      v33 = v13;
      v34 = 2048;
      v35 = a5;
      v36 = 2112;
      v37 = v11;
      v38 = 1024;
      v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "MKBBackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", buf, 0x30u);
      _MBLog(CFSTR("DEBUG"), "MKBBackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", self->_handle, v13, a5, v11, 0);
    }
LABEL_18:

    v26 = 1;
    goto LABEL_19;
  }
  v13 = objc_retainAutorelease(v10);
  v14 = MKBOTABackupDecryptInPlace(OTAHandle, objc_msgSend(v13, "fileSystemRepresentation"), a5, v11);
  v16 = MBGetDefaultLog(v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (!(_DWORD)v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v27 = self->_OTAHandle;
      *(_DWORD *)buf = 134219010;
      v31 = v27;
      v32 = 2112;
      v33 = v13;
      v34 = 2048;
      v35 = a5;
      v36 = 2112;
      v37 = v11;
      v38 = 1024;
      v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "MKBOTABackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", buf, 0x30u);
      _MBLog(CFSTR("DEBUG"), "MKBOTABackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", self->_OTAHandle, v13, a5, v11, 0);
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v19 = self->_OTAHandle;
    *(_DWORD *)buf = 134219010;
    v31 = v19;
    v32 = 2112;
    v33 = v13;
    v34 = 2048;
    v35 = a5;
    v36 = 2112;
    v37 = v11;
    v38 = 1024;
    v39 = v14;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "MKBOTABackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", buf, 0x30u);
    _MBLog(CFSTR("ERROR"), "MKBOTABackupDecryptInPlace(%p, \"%@\", %llu, %@): %d", self->_OTAHandle, v13, a5, v11, v14);
  }

  if (!a6)
    goto LABEL_15;
  v20 = CFSTR("MKBOTABackupDecryptInPlace error");
LABEL_12:
  v26 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue(+[MBKeyBag errorWithReturnCode:path:description:](MBKeyBag, "errorWithReturnCode:path:description:", v14, v13, v20));
LABEL_19:

  return v26;
}

- (BOOL)decryptFileWithPath:(id)a3 encryptionKey:(id)a4 size:(unint64_t)a5 hardwareModel:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  BOOL v20;
  uint8_t buf[4];
  id v23;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  if ((objc_msgSend(v14, "hasPrefix:", CFSTR("N66")) & 1) != 0
    || (objc_msgSend(v14, "hasPrefix:", CFSTR("N71")) & 1) != 0
    || (objc_msgSend(v14, "hasPrefix:", CFSTR("J98")) & 1) != 0
    || objc_msgSend(v14, "hasPrefix:", CFSTR("J99")))
  {
    v15 = objc_msgSend(v13, "mutableCopy");
    v16 = MKBBackupSetKeyEncryptionModeToXTS();
    if ((_DWORD)v16)
    {
      v18 = MBGetDefaultLog(v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to set encryption mode to XTS for: %{public}@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Failed to set encryption mode to XTS for: %{public}@", v12);
      }

    }
    v13 = v15;
  }
  v20 = -[MBKeyBag decryptFileWithPath:encryptionKey:size:error:](self, "decryptFileWithPath:encryptionKey:size:error:", v12, v13, a5, a7);

  return v20;
}

- (BOOL)isOTA
{
  return self->_OTA;
}

- (void)setOTA:(BOOL)a3
{
  self->_OTA = a3;
}

- (BOOL)isUnlocked
{
  return self->_isUnlocked;
}

- (void)setIsUnlocked:(BOOL)a3
{
  self->_isUnlocked = a3;
}

- (NSData)keyBagData
{
  return self->_keyBagData;
}

- (void)setKeyBagData:(id)a3
{
  objc_storeStrong((id *)&self->_keyBagData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyBagData, 0);
}

@end
