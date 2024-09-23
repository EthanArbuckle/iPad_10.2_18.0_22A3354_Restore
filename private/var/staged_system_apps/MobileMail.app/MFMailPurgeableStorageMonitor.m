@implementation MFMailPurgeableStorageMonitor

- (void)dealloc
{
  objc_super v3;

  xpc_activity_unregister("com.apple.MobileMail.pushPurgeableSpaceUpdate");
  v3.receiver = self;
  v3.super_class = (Class)MFMailPurgeableStorageMonitor;
  -[MFMailPurgeableStorageMonitor dealloc](&v3, "dealloc");
}

- (MFMailPurgeableStorageMonitor)initWithPurgeableStorage:(id)a3
{
  id v5;
  MFMailPurgeableStorageMonitor *v6;
  MFMailPurgeableStorageMonitor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailPurgeableStorageMonitor;
  v6 = -[MFMailPurgeableStorageMonitor init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_serviceName = CFSTR("com.apple.mobilemail.CacheDelete");
    objc_storeStrong((id *)&v6->_purgeableStorage, a3);
    -[MFMailPurgeableStorageMonitor _schedulePushPurgeableSpaceUpdate](v7, "_schedulePushPurgeableSpaceUpdate");
  }

  return v7;
}

- (void)_schedulePushPurgeableSpaceUpdate
{
  _QWORD *v2;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10017697C;
  v3[3] = &unk_100521838;
  v3[4] = self;
  v2 = objc_retainBlock(v3);
  ef_xpc_activity_register("com.apple.MobileMail.pushPurgeableSpaceUpdate", &stru_100521810, v2);

}

- (void)pushPurgeableStateUpdate
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  void (*v18)(uint64_t);
  void *v19;
  MFMailPurgeableStorageMonitor *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  _QWORD v27[4];
  uint8_t buf[4];
  __CFString *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  double v33;

  if (!-[MFMailPurgeableStorageMonitor serviceName](self, "serviceName"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailPurgeableStorageMonitor.m"), 76, CFSTR("Should have a service name"));

  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v18 = sub_100176CC8;
  v19 = &unk_10051D620;
  v20 = self;
  v21 = &v22;
  v4 = v17;
  v5 = mach_absolute_time();
  v18((uint64_t)v4);
  v6 = mach_absolute_time();
  if (qword_1005AA1E8 != -1)
    dispatch_once(&qword_1005AA1E8, &stru_100521858);
  v8 = dword_1005AA1E0;
  v7 = *(unsigned int *)algn_1005AA1E4;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", v23[3], 0));
  v10 = MFLogGeneral(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[MFMailPurgeableStorageMonitor serviceName](self, "serviceName");
    *(_DWORD *)buf = 138412802;
    v29 = v12;
    v30 = 2112;
    v31 = v9;
    v32 = 2048;
    v33 = (double)((v6 - v5) * v8 / v7) / 1000000000.0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#CacheDelete %@ pushed non-purgeable amount change: %@ – (Duration: %.2fs)", buf, 0x20u);
  }

  v26[0] = CFSTR("CACHE_DELETE_ID");
  v27[0] = -[MFMailPurgeableStorageMonitor serviceName](self, "serviceName");
  v26[1] = CFSTR("CACHE_DELETE_VOLUME");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager mf_defaultVolumeMountPoint](NSFileManager, "mf_defaultVolumeMountPoint"));
  v27[1] = v13;
  v26[2] = CFSTR("CACHE_DELETE_NONPURGEABLE_AMOUNT");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v23[3]));
  v26[3] = CFSTR("CACHE_DELETE_URGENCY");
  v27[2] = v14;
  v27[3] = &off_1005418C0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));

  CacheDeleteUpdatePurgeable(v15);
  _Block_object_dispose(&v22, 8);
}

- (MFMailPurgeableStorage)purgeableStorage
{
  return self->_purgeableStorage;
}

- (void)setPurgeableStorage:(id)a3
{
  objc_storeStrong((id *)&self->_purgeableStorage, a3);
}

- (__CFString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeableStorage, 0);
}

@end
