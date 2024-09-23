@implementation MBLockdown

+ (id)connect
{
  return objc_alloc_init(MBLockdown);
}

- (MBLockdown)init
{
  MBLockdown *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MBLockdown;
  v2 = -[MBLockdown init](&v4, "init");
  if (v2)
  {
    if (qword_1000F9E30 != -1)
      dispatch_once(&qword_1000F9E30, &stru_1000D9E60);
    if (!-[MBLockdown connect](v2, "connect"))
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MBLockdown disconnect](self, "disconnect");
  v3.receiver = self;
  v3.super_class = (Class)MBLockdown;
  -[MBLockdown dealloc](&v3, "dealloc");
}

- (BOOL)connect
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005F9BC;
  v4[3] = &unk_1000D9210;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)qword_1000F9E38, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)disconnect
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005FA58;
  block[3] = &unk_1000D9260;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1000F9E38, block);
}

- (id)objectForDomain:(id)a3 andKey:(id)a4
{
  void *v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_10005FB38;
  v11 = sub_10005FB48;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005FB54;
  v6[3] = &unk_1000D9E88;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = &v7;
  dispatch_sync((dispatch_queue_t)qword_1000F9E38, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)setObject:(id)a3 forDomain:(id)a4 andKey:(id)a5 withError:(id *)a6
{
  char v6;
  _QWORD v8[10];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005FC30;
  v8[3] = &unk_1000D9EB0;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a5;
  v8[7] = a3;
  v8[8] = &v9;
  v8[9] = a6;
  dispatch_sync((dispatch_queue_t)qword_1000F9E38, v8);
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)removeObjectWithDomain:(id)a3 andKey:(id)a4 withError:(id *)a5
{
  char v5;
  _QWORD block[9];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005FE00;
  block[3] = &unk_1000D9ED8;
  block[4] = a3;
  block[5] = a4;
  block[7] = &v8;
  block[8] = a5;
  block[6] = self;
  dispatch_sync((dispatch_queue_t)qword_1000F9E38, block);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

+ (id)dateOfLastBackupFromLockdownPlist
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;
  CFTypeID TypeID;
  uint64_t v6;
  NSObject *v8;
  CFTypeID v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  CFTypeID v13;

  v2 = CFPreferencesCopyValue(CFSTR("LastCloudBackupDate"), CFSTR("com.apple.mobile.ldbackup"), kMBMobileUserName, kCFPreferencesAnyHost);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = CFGetTypeID(v2);
    TypeID = CFNumberGetTypeID();
    if (v4 == TypeID)
      return v3;
    v8 = MBGetDefaultLog(TypeID, v6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = CFSTR("LastCloudBackupDate");
      v12 = 2048;
      v13 = CFGetTypeID(v3);
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid type for \"%@\": %ld", buf, 0x16u);
      v9 = CFGetTypeID(v3);
      _MBLog(CFSTR("ERROR"), "Invalid type for \"%@\": %ld", CFSTR("LastCloudBackupDate"), v9);
    }
    CFRelease(v3);
  }
  return 0;
}

+ (id)buddySetupState
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;
  CFTypeID TypeID;
  uint64_t v6;
  NSObject *v8;
  CFTypeID v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  CFTypeID v15;

  v2 = CFPreferencesCopyValue(CFSTR("SetupState"), CFSTR("com.apple.purplebuddy"), kMBMobileUserName, kCFPreferencesAnyHost);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = CFGetTypeID(v2);
    TypeID = CFStringGetTypeID();
    if (v4 == TypeID)
      return v3;
    v8 = MBGetDefaultLog(TypeID, v6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v11 = CFSTR("com.apple.purplebuddy");
      v12 = 2112;
      v13 = CFSTR("SetupState");
      v14 = 2048;
      v15 = CFGetTypeID(v3);
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid type for %@/\"%@\": %ld", buf, 0x20u);
      v9 = CFGetTypeID(v3);
      _MBLog(CFSTR("ERROR"), "Invalid type for %@/\"%@\": %ld", CFSTR("com.apple.purplebuddy"), CFSTR("SetupState"), v9);
    }
    CFRelease(v3);
  }
  return 0;
}

+ (void)setDeviceName:(id)a3
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  id v17;

  v4 = MBGetDefaultLog(a1, a2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating the device name to \"%@\", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Updating the device name to \"%@\", a3);
  }
  if (a3)
  {
    v5 = +[MBLockdown connect](MBLockdown, "connect");
    if (v5)
    {
      v7 = v5;
      v15 = 0;
      v8 = objc_msgSend(v5, "setObject:forDomain:andKey:withError:", a3, 0, kLockdownDeviceNameKey, &v15);
      v9 = objc_msgSend(v7, "disconnect");
      v11 = MBGetDefaultLog(v9, v10);
      v12 = v11;
      if (v8)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = a3;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updated the device name to \"%@\", buf, 0xCu);
          _MBLog(CFSTR("DEFAULT"), "Updated the device name to \"%@\", a3);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to update the device name: %@", buf, 0xCu);
        _MBLog(CFSTR("ERROR"), "Failed to update the device name: %@", v15);
      }
    }
    else
    {
      v13 = MBGetDefaultLog(0, v6);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to connect to lockdown to update the device name", buf, 2u);
        _MBLog(CFSTR("ERROR"), "Failed to connect to lockdown to update the device name", v14);
      }
    }
  }
}

@end
