@implementation MFDiskFreeSpaceMonitor

+ (id)defaultMonitor
{
  if (qword_10001EBA8 != -1)
    dispatch_once(&qword_10001EBA8, &stru_100018938);
  return (id)qword_10001EBB0;
}

- (MFDiskFreeSpaceMonitor)init
{
  id v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  id v7;
  void *v8;
  dispatch_source_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD handler[4];
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MFDiskFreeSpaceMonitor;
  v2 = -[MFDiskFreeSpaceMonitor init](&v20, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.mobilemail.diskCacheMonitor.freeSpaceStatusQueue", v4);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    v7 = objc_alloc_init((Class)NSLock);
    v8 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v7;

    objc_msgSend(*((id *)v2 + 3), "setName:", CFSTR("com.apple.mobilemail.diskCacheMonitor.freeSpaceStatusLock"));
    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 1));
    v10 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v9;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 2), 0, 0xDF8475800uLL, 0x2540BE400uLL);
    v11 = *((_QWORD *)v2 + 2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000A008;
    handler[3] = &unk_100018618;
    v12 = v2;
    v19 = v12;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, "handleDidPurgeSpace:", off_10001EAA0, 0);

    *((_BYTE *)v12 + 32) = +[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 40);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    v15 = objc_msgSend(v14, "integerForKey:", EMUserDefaultSimulateDelayedFreeSpaceStatusTime);
    v16 = 10;
    if (v15)
      v16 = (uint64_t)v15;
    *((_QWORD *)v12 + 5) = v16;

  }
  return (MFDiskFreeSpaceMonitor *)v2;
}

- (void)setFreeSpaceStatus:(unint64_t)a3
{
  id v5;

  -[NSLock lock](self->_freeSpaceStatusLock, "lock");
  if (self->_freeSpaceStatus == a3)
  {
    -[NSLock unlock](self->_freeSpaceStatusLock, "unlock");
  }
  else
  {
    self->_freeSpaceStatus = a3;
    -[NSLock unlock](self->_freeSpaceStatusLock, "unlock");
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("MFDiskFreeSpaceMonitorDidChangeNotification"), self);

  }
}

- (unint64_t)freeSpaceStatus
{
  unint64_t freeSpaceStatus;

  -[NSLock lock](self->_freeSpaceStatusLock, "lock");
  freeSpaceStatus = self->_freeSpaceStatus;
  -[NSLock unlock](self->_freeSpaceStatusLock, "unlock");
  return freeSpaceStatus;
}

- (unint64_t)_retrieveFreeSpaceStatus:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int64_t freeSpaceStatusDelay;
  int v22;
  int64_t v23;
  uint8_t buf[24];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_freeSpaceStatusQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFDiskCacheUtilities systemSpaceWithError:](MFDiskCacheUtilities, "systemSpaceWithError:", a3));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MFFileSystemFreeSize")));
    v8 = v7;
    if (v7)
    {
      if ((unint64_t)objc_msgSend(v7, "longLongValue") >> 21 >= 0x4B)
        v9 = 1;
      else
        v9 = 2;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    if (a3)
    {
      v10 = ((uint64_t (*)(void))MFLogGeneral)();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "ef_publicDescription"));
        sub_10000D67C(v12, buf, v11);
      }

    }
    v9 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("SimulateCriticalFreeSpaceStatus"));

  if (v14)
  {
    v15 = ((uint64_t (*)(void))MFLogGeneral)();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Simulate critical free space is enabled: returning MFDiskFreeSpaceMonitorStatusCritical", (uint8_t *)&v22, 2u);
    }

    v9 = 2;
  }
  if (self->_shouldDelayFreeSpace)
  {
    v17 = sleep(self->_freeSpaceStatusDelay);
    v18 = MFLogGeneral(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      freeSpaceStatusDelay = self->_freeSpaceStatusDelay;
      v22 = 134217984;
      v23 = freeSpaceStatusDelay;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Simulate delayed free space is enabled: waiting %lu seconds before returning status", (uint8_t *)&v22, 0xCu);
    }

  }
  -[MFDiskFreeSpaceMonitor setFreeSpaceStatus:](self, "setFreeSpaceStatus:", v9);

  return v9;
}

- (void)getFreeSpaceStatusWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *freeSpaceStatusQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  freeSpaceStatusQueue = self->_freeSpaceStatusQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A3A0;
  v7[3] = &unk_100018960;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(freeSpaceStatusQueue, v7);

}

- (BOOL)isFreeSpaceCritical
{
  return (id)-[MFDiskFreeSpaceMonitor freeSpaceStatus](self, "freeSpaceStatus") == (id)2;
}

- (BOOL)hasAdequateFreeSpace
{
  return (id)-[MFDiskFreeSpaceMonitor freeSpaceStatus](self, "freeSpaceStatus") != (id)2;
}

- (void)handleDidPurgeSpace:(id)a3
{
  -[MFDiskFreeSpaceMonitor getFreeSpaceStatusWithCompletionHandler:](self, "getFreeSpaceStatusWithCompletionHandler:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeSpaceStatusLock, 0);
  objc_storeStrong((id *)&self->_freeSpaceStatusTimerSource, 0);
  objc_storeStrong((id *)&self->_freeSpaceStatusQueue, 0);
}

@end
