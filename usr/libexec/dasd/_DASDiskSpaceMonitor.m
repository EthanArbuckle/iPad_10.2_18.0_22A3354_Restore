@implementation _DASDiskSpaceMonitor

- (_DASDiskSpaceMonitor)initWithDaemon:(id)a3
{
  id v5;
  _DASDiskSpaceMonitor *v6;
  _DASDiskSpaceMonitor *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  os_log_t v12;
  OS_os_log *log;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_DASDiskSpaceMonitor;
  v6 = -[_DASDiskSpaceMonitor init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemon, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.duetactivityscheduler.diskspacemonitor", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = os_log_create("com.apple.duetactivityscheduler", "DiskSpaceMonitor");
    log = v7->_log;
    v7->_log = (OS_os_log *)v12;

    v7->_purgeableSpaceMapLock = 0;
    -[_DASDiskSpaceMonitor registerForCacheDeletePurgeableSpaceNotifications](v7, "registerForCacheDeletePurgeableSpaceNotifications");
  }

  return v7;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CB0AC;
  v8[3] = &unk_10015DF50;
  v9 = a3;
  v10 = a1;
  v4 = qword_1001ABD88;
  v5 = v9;
  if (v4 != -1)
    dispatch_once(&qword_1001ABD88, v8);
  v6 = (id)qword_1001ABD90;

  return v6;
}

- (void)registerForPurgeableSpaceWithActivity:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  OS_dispatch_queue *queue;
  id v8;
  NSObject *log;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDiskSpacePolicy policyInstance](_DASDiskSpacePolicy, "policyInstance"));
  v6 = objc_msgSend(v5, "appliesToActivity:", v4);

  if (v6)
  {
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000CB1C0;
    v16[3] = &unk_10015D558;
    v16[4] = self;
    v8 = v4;
    v17 = v8;
    dispatch_sync((dispatch_queue_t)queue, v16);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      sub_1000EB170((uint64_t)v8, log, v10, v11, v12, v13, v14, v15);

  }
}

- (void)unregisterForPurgeableSpaceWithActivity:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  OS_dispatch_queue *queue;
  id v8;
  NSObject *log;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDiskSpacePolicy policyInstance](_DASDiskSpacePolicy, "policyInstance"));
  v6 = objc_msgSend(v5, "appliesToActivity:", v4);

  if (v6)
  {
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000CB324;
    v16[3] = &unk_10015D558;
    v16[4] = self;
    v8 = v4;
    v17 = v8;
    dispatch_sync((dispatch_queue_t)queue, v16);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      sub_1000EB1D4((uint64_t)v8, log, v10, v11, v12, v13, v14, v15);

  }
}

- (void)registerForDiskVolumeMonitoring:(id)a3
{
  NSObject *v4;
  NSCountedSet *diskVolumes;
  NSCountedSet *v6;
  NSCountedSet *v7;
  id v8;

  v8 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[_DASDiskSpaceMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  diskVolumes = self->_diskVolumes;
  if (!diskVolumes)
  {
    v6 = (NSCountedSet *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](NSCountedSet, "set"));
    v7 = self->_diskVolumes;
    self->_diskVolumes = v6;

    diskVolumes = self->_diskVolumes;
  }
  -[NSCountedSet addObject:](diskVolumes, "addObject:", v8);
  if ((id)-[NSCountedSet countForObject:](self->_diskVolumes, "countForObject:", v8) == (id)1)
    -[_DASDiskSpaceMonitor fetchPurgeableSpaceInfoForVolume:](self, "fetchPurgeableSpaceInfoForVolume:", v8);

}

- (void)unregisterForDiskVolumeMonitoring:(id)a3
{
  NSObject *v4;
  NSCountedSet *diskVolumes;
  id v6;

  v6 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[_DASDiskSpaceMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  diskVolumes = self->_diskVolumes;
  if (diskVolumes)
  {
    -[NSCountedSet removeObject:](diskVolumes, "removeObject:", v6);
    if ((-[NSCountedSet containsObject:](self->_diskVolumes, "containsObject:", v6) & 1) == 0)
    {
      os_unfair_recursive_lock_lock_with_options(&self->_purgeableSpaceMapLock, 0);
      -[NSMutableDictionary removeObjectForKey:](self->_purgeableSpaceMap, "removeObjectForKey:", v6);
      os_unfair_recursive_lock_unlock(&self->_purgeableSpaceMapLock);
    }
  }

}

- (BOOL)isDiskSpaceAvailableForActivity:(id)a3
{
  id v4;
  os_unfair_recursive_lock_s *p_purgeableSpaceMapLock;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *log;

  v4 = a3;
  p_purgeableSpaceMapLock = &self->_purgeableSpaceMapLock;
  os_unfair_recursive_lock_lock_with_options(&self->_purgeableSpaceMapLock, 0);
  if (self->_purgeableSpaceMap)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDiskSpaceMonitor purgeableSpaceMap](self, "purgeableSpaceMap"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "diskVolume"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));
    v9 = objc_msgSend(v8, "unsignedLongLongValue");

    if (v9)
      LOBYTE(v9) = (unint64_t)v9 >= (_QWORD)objc_msgSend(v4, "downloadSize") << 10;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
      sub_1000EB238(log);
    LOBYTE(v9) = 0;
  }
  os_unfair_recursive_lock_unlock(p_purgeableSpaceMapLock);

  return (char)v9;
}

- (void)fetchPurgeableSpaceInfoForVolume:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *log;
  NSMutableDictionary *v10;
  NSMutableDictionary *purgeableSpaceMap;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[_DASDiskSpaceMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v13[0] = CFSTR("CACHE_DELETE_VOLUME");
  v13[1] = CFSTR("CACHE_DELETE_URGENCY");
  v14[0] = v4;
  v14[1] = &off_10016EE40;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
  v7 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ERROR")));

  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      sub_1000EB278(log, v7);
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options(&self->_purgeableSpaceMapLock, 0);
    if (!self->_purgeableSpaceMap)
    {
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      purgeableSpaceMap = self->_purgeableSpaceMap;
      self->_purgeableSpaceMap = v10;

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_purgeableSpaceMap, "setObject:forKeyedSubscript:", v12, v4);

    os_unfair_recursive_lock_unlock(&self->_purgeableSpaceMapLock);
  }

}

- (void)handleCacheDeletePurgeableSpaceNotification
{
  NSCountedSet *diskVolumes;
  NSCountedSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  uint64_t v15;
  NSObject *log;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  _BYTE v32[128];

  diskVolumes = self->_diskVolumes;
  if (diskVolumes)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v4 = diskVolumes;
    v5 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(v4);
          -[_DASDiskSpaceMonitor fetchPurgeableSpaceInfoForVolume:](self, "fetchPurgeableSpaceInfoForVolume:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i));
        }
        v6 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      }
      while (v6);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDiskSpaceMonitor pendingActivities](self, "pendingActivities"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
          if (-[_DASDiskSpaceMonitor isDiskSpaceAvailableForActivity:](self, "isDiskSpaceAvailableForActivity:", v15))
            objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v9, "count"))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Available disk space changed, re-evaluating activities: %@", buf, 0xCu);
      }
      global_queue = dispatch_get_global_queue(0, 0);
      v18 = objc_claimAutoreleasedReturnValue(global_queue);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000CB978;
      v19[3] = &unk_10015D558;
      v19[4] = self;
      v20 = v9;
      dispatch_async(v18, v19);

    }
  }
}

- (void)registerForCacheDeletePurgeableSpaceNotifications
{
  OS_dispatch_queue *queue;
  NSObject *log;
  _QWORD v5[5];
  int out_token;

  out_token = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000CBA4C;
  v5[3] = &unk_10015D9B8;
  v5[4] = self;
  if (notify_register_dispatch("CACHE_DELETE_PURGEABLE_UPDATED", &out_token, (dispatch_queue_t)queue, v5))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      sub_1000EB324(log);
  }
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableSet)pendingActivities
{
  return self->_pendingActivities;
}

- (void)setPendingActivities:(id)a3
{
  objc_storeStrong((id *)&self->_pendingActivities, a3);
}

- (NSCountedSet)diskVolumes
{
  return self->_diskVolumes;
}

- (void)setDiskVolumes:(id)a3
{
  objc_storeStrong((id *)&self->_diskVolumes, a3);
}

- (NSMutableDictionary)purgeableSpaceMap
{
  return self->_purgeableSpaceMap;
}

- (void)setPurgeableSpaceMap:(id)a3
{
  objc_storeStrong((id *)&self->_purgeableSpaceMap, a3);
}

- (os_unfair_recursive_lock_s)purgeableSpaceMapLock
{
  return self->_purgeableSpaceMapLock;
}

- (void)setPurgeableSpaceMapLock:(os_unfair_recursive_lock_s)a3
{
  self->_purgeableSpaceMapLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeableSpaceMap, 0);
  objc_storeStrong((id *)&self->_diskVolumes, 0);
  objc_storeStrong((id *)&self->_pendingActivities, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end
