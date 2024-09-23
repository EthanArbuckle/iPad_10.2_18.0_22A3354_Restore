@implementation _XBMemoryMonitor

- (_XBMemoryMonitor)init
{
  _XBMemoryMonitor *v2;
  _XBMemoryMonitor *v3;
  NSMutableArray *v4;
  NSMutableArray *accessLock_memoryRecords;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_XBMemoryMonitor;
  v2 = -[_XBMemoryMonitor init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 10);
    accessLock_memoryRecords = v3->_accessLock_memoryRecords;
    v3->_accessLock_memoryRecords = v4;

    -[_XBMemoryMonitor _setupProcessMemoryPressureMonitor](v3, "_setupProcessMemoryPressureMonitor");
  }
  return v3;
}

- (void)recordMemoryForBundleID:(id)a3
{
  __CFString *v5;
  os_unfair_lock_s *p_accessLock;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  __CFString *v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v5 = (__CFString *)a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  v7 = (uint64_t)-[NSMutableArray count](self->_accessLock_memoryRecords, "count");
  if (v7 >= 11)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProviderServer.m"), 365, CFSTR("memory record count should not be greater than the max allowed size"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_XBMemoryMonitor _getProcessMemoryUsed](self, "_getProcessMemoryUsed"));
  if (v8)
  {
    if (v7 == 10)
      -[NSMutableArray removeObjectAtIndex:](self->_accessLock_memoryRecords, "removeObjectAtIndex:", 0);
    if (!v5)
      v5 = CFSTR("<nil>");
    v24[0] = CFSTR("bundleID");
    v24[1] = CFSTR("memory");
    v25[0] = v5;
    v25[1] = v8;
    v9 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
    -[NSMutableArray addObject:](self->_accessLock_memoryRecords, "addObject:", v9);
    v10 = sub_100002AFC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v20 = 138543618;
      v21 = v8;
      v22 = 2114;
      v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Recorded process memory: %{public}@ Bytes while processing bundleID: %{public}@", (uint8_t *)&v20, 0x16u);
    }

  }
  else
  {
    v12 = sub_100002AFC();
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100007178((uint64_t)v5, v9, v13, v14, v15, v16, v17, v18);
  }

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_setupProcessMemoryPressureMonitor
{
  OS_dispatch_source *v3;
  OS_dispatch_source *memoryPressureSource;
  NSObject *v5;
  _QWORD handler[5];

  self->_memoryPressureStatus = 1;
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 0x31uLL, (dispatch_queue_t)&_dispatch_main_q);
  memoryPressureSource = self->_memoryPressureSource;
  self->_memoryPressureSource = v3;

  v5 = self->_memoryPressureSource;
  if (v5)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100006B04;
    handler[3] = &unk_10000C730;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
  }
}

- (void)_publishMemoryReportForPressureType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *p_accessLock;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  v5 = objc_alloc_init((Class)SDRDiagnosticReporter);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("SplashBoard"), CFSTR("MemoryPressure"), v4, CFSTR("splashboardd"), 0));
  v15 = kSymptomDiagnosticActionGetNetworkInfo;
  v16 = &__kCFBooleanFalse;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  v9 = -[NSMutableArray copy](self->_accessLock_memoryRecords, "copy");
  os_unfair_lock_unlock(p_accessLock);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006D0C;
  v12[3] = &unk_10000C7D0;
  v13 = v4;
  v14 = v9;
  v10 = v9;
  v11 = v4;
  objc_msgSend(v5, "snapshotWithSignature:duration:events:payload:actions:reply:", v6, v10, 0, v7, v12, 0.0);

}

- (id)_getProcessMemoryUsed
{
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;

  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  *(_OWORD *)task_info_out = 0u;
  v5 = 0u;
  task_info_outCnt = 93;
  if (task_info(mach_task_self_, 0x16u, task_info_out, &task_info_outCnt))
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (_QWORD)v7));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_accessLock_memoryRecords, 0);
}

@end
