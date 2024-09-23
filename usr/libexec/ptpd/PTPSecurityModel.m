@implementation PTPSecurityModel

- (PTPSecurityModel)init
{
  PTPSecurityModel *v2;
  PTPSecurityModel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTPSecurityModel;
  v2 = -[PTPSecurityModel init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->_hasVended = 0;
    *(_DWORD *)&v2->_deviceWasUnlocked = 0;
    v2->_observersInstalled = 0;
    *(_QWORD *)&v2->_prefsChangedToken = 0;
    *(_QWORD *)&v2->_photoStorageToken = 0;
    *(_QWORD *)&v2->_lockStatusToken = 0;
    objc_storeWeak(&v2->_delegate, 0);
    v3->_sessionID = -1592735106;
  }
  return v3;
}

- (void)dealloc
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;

  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPSecurityModel Deallocated SessionID - 0x%x"), self->_sessionID));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v11 = -[__CFString UTF8String](v7, "UTF8String");
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  -[PTPSecurityModel stop](self, "stop");
  -[PTPSecurityModel setDelegate:](self, "setDelegate:", 0);
  v9.receiver = self;
  v9.super_class = (Class)PTPSecurityModel;
  -[PTPSecurityModel dealloc](&v9, "dealloc");
}

- (void)start
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  if (!self->_observersInstalled)
  {
    __ICOSLogCreate();
    v3 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Install Device Security Observers")));
    v6 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v3);
      v8 = v6;
      v9 = 136446466;
      v10 = -[__CFString UTF8String](v7, "UTF8String");
      v11 = 2114;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);

    }
    -[PTPSecurityModel registerForSecurityNotifications](self, "registerForSecurityNotifications");
    self->_observersInstalled = 1;
    -[PTPSecurityModel handleProtectionStatusChanged:](self, "handleProtectionStatusChanged:", 0);
    -[PTPSecurityModel handleProtectionStatusChanged:](self, "handleProtectionStatusChanged:", 1);
    -[PTPSecurityModel handleProtectionStatusChanged:](self, "handleProtectionStatusChanged:", 4);
    -[PTPSecurityModel handleProtectionStatusChanged:](self, "handleProtectionStatusChanged:", 2);
  }
}

- (void)stop
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  if (self->_observersInstalled)
  {
    __ICOSLogCreate();
    v3 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Removing Device Security Observers \n")));
    v6 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v3);
      v8 = v6;
      v9 = 136446466;
      v10 = -[__CFString UTF8String](v7, "UTF8String");
      v11 = 2114;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);

    }
    -[PTPSecurityModel unregisterForSecurityNotifications](self, "unregisterForSecurityNotifications");
    self->_observersInstalled = 0;
  }
}

- (void)setDelegate:(id)a3
{
  id *p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = objc_storeWeak(&self->_delegate, a3);
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained(p_delegate);
    self->_sessionID = objc_msgSend(WeakRetained, "currentInternalSessionID");

  }
  else
  {
    self->_sessionID = 0;
  }

}

- (void)setSessionID:(unsigned int)a3
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;

  v3 = *(_QWORD *)&a3;
  self->_sessionID = a3;
  __ICOSLogCreate();
  v4 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR("..")));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPSecurityModel Allocated SessionID: 0x%x"), v3));
  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v4);
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    v11 = -[__CFString UTF8String](v8, "UTF8String");
    v12 = 2114;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

- (void)setHasVended:(BOOL)a3
{
  __CFString *v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;

  self->_hasVended = a3;
  __ICOSLogCreate();
  v4 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR("..")));

  }
  if (self->_hasVended)
    v6 = "YES";
  else
    v6 = "NO";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTPSecurityModel Has Vended: %s"), v6));
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v4);
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    v12 = -[__CFString UTF8String](v9, "UTF8String");
    v13 = 2114;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

- (BOOL)updateProtectionStatus:(int64_t)a3
{
  int deviceWasUnlocked;
  int photoLibraryIsAvailable;
  int hostIsTrusted;
  int photoStorageIsAvailable;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  BOOL v13;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  BOOL v19;
  unsigned int v20;
  int is_host_trusted;

  deviceWasUnlocked = self->_deviceWasUnlocked;
  photoLibraryIsAvailable = self->_photoLibraryIsAvailable;
  hostIsTrusted = self->_hostIsTrusted;
  photoStorageIsAvailable = self->_photoStorageIsAvailable;
  v9 = sub_10000D990();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  switch(a3)
  {
    case 0:
      v12 = objc_msgSend(v10, "libraryIsAvailable");
      self->_photoLibraryIsAvailable = v12;
      v13 = photoLibraryIsAvailable == v12;
      goto LABEL_18;
    case 1:
      v20 = -[PTPSecurityModel isPhotoStorageAvailable](self, "isPhotoStorageAvailable");
      self->_photoStorageIsAvailable = v20;
      v13 = photoStorageIsAvailable == v20;
      goto LABEL_18;
    case 2:
      is_host_trusted = lockdown_is_host_trusted(CFSTR("com.apple.ptp"), 0, 0);
      self->_hostIsTrusted = is_host_trusted;
      v13 = hostIsTrusted == is_host_trusted;
      goto LABEL_18;
    case 3:
      self->_hostIsTrusted = 1;
      v19 = hostIsTrusted == 0;
      break;
    case 4:
      v14 = MKBGetDeviceLockState(0);
      if (v14)
        v15 = v14 == 3;
      else
        v15 = 1;
      v16 = v15;
      v17 = self->_deviceWasUnlocked;
      if (!self->_deviceWasUnlocked && v16 != 0)
      {
        v17 = 1;
        self->_deviceWasUnlocked = 1;
      }
      v13 = deviceWasUnlocked == v17;
LABEL_18:
      v19 = !v13;
      break;
    case 5:
      v19 = 1;
      break;
    default:
      v19 = 0;
      break;
  }

  return v19;
}

- (BOOL)photoLibraryIsAvailable
{
  return self->_photoLibraryIsAvailable;
}

- (id)prettyHostID
{
  id *p_delegate;
  id WeakRetained;
  id v4;
  unsigned __int8 v5;
  id v7;
  unsigned __int8 v8;
  id v9;
  unsigned int v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);

  if (!WeakRetained)
    return 0;
  v4 = objc_loadWeakRetained(p_delegate);
  v5 = objc_msgSend(v4, "hostIsWindows");

  if ((v5 & 1) != 0)
    return CFSTR("Windows");
  v7 = objc_loadWeakRetained(p_delegate);
  v8 = objc_msgSend(v7, "hostIsMacOS");

  if ((v8 & 1) != 0)
    return CFSTR("macOS");
  v9 = objc_loadWeakRetained(p_delegate);
  v10 = objc_msgSend(v9, "hostIsLegacyOS");

  if (v10)
    return CFSTR("OSX");
  else
    return CFSTR("PTP");
}

- (id)prettyAccess:(int64_t)a3 value:(BOOL)a4
{
  __CFString *v4;
  void *v5;
  NSString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;

  switch(a3)
  {
    case 0:
      v8 = sub_10001AD6C(a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@) Library"), v5);
      goto LABEL_8;
    case 1:
      v9 = sub_10001AD6C(a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@) Storage"), v5);
      goto LABEL_8;
    case 2:
    case 3:
      v4 = sub_10001AD6C(a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@) Trusted"), v5);
      goto LABEL_8;
    case 4:
      v11 = sub_10001AD6C(a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@) Unlocked"), v5);
      goto LABEL_8;
    case 5:
      v10 = sub_10001AD6C(a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@) Primed "), v5);
LABEL_8:
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);

      break;
    default:
      v7 = CFSTR("Undefined");
      break;
  }
  return v7;
}

- (void)handleProtectionStatusChanged:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  unsigned int v7;
  _QWORD v8[5];
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = -[PTPSecurityModel updateProtectionStatus:](self, "updateProtectionStatus:", a3);

    if (v7)
    {
      if (-[PTPSecurityModel shouldRemovePlaceholderStorage](self, "shouldRemovePlaceholderStorage"))
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001BA34;
        block[3] = &unk_100048750;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
      if (-[PTPSecurityModel shouldVendPhotoStorage](self, "shouldVendPhotoStorage"))
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_10001BB9C;
        v8[3] = &unk_100048750;
        v8[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
      }
    }
  }
}

- (void)handleInternalSettingsChanged
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  id *p_delegate;
  id WeakRetained;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ApplePTP Internal Settings Changed")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    v12 = 136446466;
    v13 = -[__CFString UTF8String](v7, "UTF8String");
    v14 = 2114;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v12, 0x16u);

  }
  __ICReadPrefs();
  -[PTPSecurityModel setHasVended:](self, "setHasVended:", 0);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(p_delegate);

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained(p_delegate);
    objc_msgSend(v11, "handleInternalSettingsChanged");

  }
}

- (void)handleThrottleChanged
{
  double v2;
  double v3;
  int v4;
  id v5;
  double v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;

  v2 = (double)sub_100004BEC();
  v3 = v2 * 0.0009765625;
  v4 = sub_100004BEC();
  __ICOSLogCreate();
  v5 = objc_msgSend(&stru_100048E60, "length");
  if (v4)
  {
    v6 = 512.0 / v2;
    if ((unint64_t)v5 < 0x15)
    {
      v8 = &stru_100048E60;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Throttle Enabled [Size: %.2fKB Rate: %.2fMB/s Delay: %.2fs]\n"), 0x4080000000000000, *(_QWORD *)&v3, *(_QWORD *)&v6));
    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:
      v8 = objc_retainAutorelease(v8);
      v12 = v11;
      *(_DWORD *)buf = 136446466;
      v14 = -[__CFString UTF8String](v8, "UTF8String");
      v15 = 2114;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  else
  {
    if ((unint64_t)v5 < 0x15)
    {
      v8 = &stru_100048E60;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Throttle Disabled [Rate: %.2fMB/s]\n"), *(_QWORD *)&v3));
    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
  }

}

- (BOOL)isPhotoStorageAvailable
{
  id *p_delegate;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (!WeakRetained)
    return 0;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained(p_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "photoStorageAvailable"));

  if (!v6)
    return 0;
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)shouldRemovePlaceholderStorage
{
  return self->_deviceWasUnlocked && self->_hostIsTrusted;
}

- (BOOL)shouldVendPhotoStorage
{
  _BOOL4 v3;

  v3 = -[PTPSecurityModel canVendPhotoStorage](self, "canVendPhotoStorage");
  if (v3)
    LOBYTE(v3) = !self->_hasVended;
  return v3;
}

- (BOOL)canVendPhotoStorage
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v3 = self->_photoLibraryIsAvailable
    && self->_hostIsTrusted
    && self->_photoStorageIsAvailable
    && self->_deviceWasUnlocked;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPSecurityModel prettyAccess:value:](self, "prettyAccess:value:", 4, self->_deviceWasUnlocked));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPSecurityModel prettyAccess:value:](self, "prettyAccess:value:", 0, self->_photoLibraryIsAvailable));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPSecurityModel prettyAccess:value:](self, "prettyAccess:value:", 1, self->_photoStorageIsAvailable));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPSecurityModel prettyAccess:value:](self, "prettyAccess:value:", 2, self->_hostIsTrusted));
  __ICOSLogCreate();
  v8 = CFSTR("<Photos>");
  if ((unint64_t)-[__CFString length](v8, "length") >= 0x15)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v8, "substringWithRange:", 0, 18));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

    v8 = (__CFString *)v10;
  }
  v11 = CFSTR("❌");
  if (v3)
    v11 = CFSTR("✅");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [%20@ %20@ %20@ %20@]\n"), v11, v4, v5, v6, v7));
  v13 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainAutorelease(v8);
    v15 = v13;
    *(_DWORD *)buf = 136446466;
    v18 = -[__CFString UTF8String](v14, "UTF8String");
    v19 = 2114;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  return v3;
}

- (void)registerForSecurityNotifications
{
  PTPSecurityModel *v2;
  const char *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD handler[5];
  _QWORD v11[5];
  PTPSecurityModel *v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_10001C630;
  v11[4] = sub_10001C640;
  v2 = self;
  v12 = v2;
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(kLockdownNotificationTrustedPTPAttached), "cStringUsingEncoding:", 4);
  v4 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001C648;
  handler[3] = &unk_100048850;
  handler[4] = v11;
  notify_register_dispatch(v3, &v2->_trustedHostToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001C690;
  v9[3] = &unk_100048850;
  v9[4] = v11;
  notify_register_dispatch(kMobileKeyBagLockStatusNotifyToken, &v2->_lockStatusToken, (dispatch_queue_t)&_dispatch_main_q, v9);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001C6D8;
  v8[3] = &unk_100048850;
  v8[4] = v11;
  notify_register_dispatch("com.apple.ptpd.photoStorageChanged", &v2->_photoStorageToken, (dispatch_queue_t)&_dispatch_main_q, v8);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C720;
  v7[3] = &unk_100048850;
  v7[4] = v11;
  notify_register_dispatch("com.apple.ptpd.photoLibraryChanged", &v2->_photoLibraryToken, (dispatch_queue_t)&_dispatch_main_q, v7);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001C768;
  v6[3] = &unk_100048850;
  v6[4] = v11;
  notify_register_dispatch("com.apple.ImageCaptureFramework.prefsChanged", &v2->_prefsChangedToken, (dispatch_queue_t)&_dispatch_main_q, v6);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C7AC;
  v5[3] = &unk_100048850;
  v5[4] = v11;
  notify_register_dispatch("com.apple.ImageCaptureFramework.throttleRateChanged", &v2->_throttleChangedToken, (dispatch_queue_t)&_dispatch_main_q, v5);

  _Block_object_dispose(v11, 8);
}

- (void)unregisterForSecurityNotifications
{
  notify_cancel(self->_trustedHostToken);
  notify_cancel(self->_lockStatusToken);
  notify_cancel(self->_prefsChangedToken);
  notify_cancel(self->_photoStorageToken);
  notify_cancel(self->_photoLibraryToken);
  notify_cancel(self->_throttleChangedToken);
}

- (BOOL)hostIsTrusted
{
  return self->_hostIsTrusted;
}

- (BOOL)deviceWasUnlocked
{
  return self->_deviceWasUnlocked;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
}

@end
