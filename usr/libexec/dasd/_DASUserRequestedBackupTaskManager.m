@implementation _DASUserRequestedBackupTaskManager

+ (id)userRequestedBackupKeyPath
{
  if (qword_1001ABE48 != -1)
    dispatch_once(&qword_1001ABE48, &stru_100160418);
  return (id)qword_1001ABE50;
}

- (_DASUserRequestedBackupTaskManager)initWithContext:(id)a3
{
  id v5;
  _DASUserRequestedBackupTaskManager *v6;
  _DASUserRequestedBackupTaskManager *v7;
  os_log_t v8;
  OS_os_log *log;
  uint64_t v10;
  NSMutableDictionary *backupTasks;
  uint64_t v12;
  NSMutableArray *clientsWithErrors;
  _CDLocalContext *context;
  id v15;
  void *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_DASUserRequestedBackupTaskManager;
  v6 = -[_DASUserRequestedBackupTaskManager init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = os_log_create("com.apple.duetactivityscheduler", "syncOnBackup");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    backupTasks = v7->_backupTasks;
    v7->_backupTasks = (NSMutableDictionary *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    clientsWithErrors = v7->_clientsWithErrors;
    v7->_clientsWithErrors = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v7->_context, a3);
    context = v7->_context;
    v15 = objc_msgSend((id)objc_opt_class(v7), "userRequestedBackupKeyPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v16));
    v7->_syncInProgress = objc_msgSend(v17, "BOOLValue");

  }
  return v7;
}

+ (_DASUserRequestedBackupTaskManager)managerWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithContext:", v4);

  return (_DASUserRequestedBackupTaskManager *)v5;
}

- (id)currentClient
{
  BYBuddyDaemonCloudSyncClient *client;
  void *v4;
  objc_class *v5;
  BYBuddyDaemonCloudSyncClient *v6;
  BYBuddyDaemonCloudSyncClient *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  client = self->_client;
  if (!client)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)qword_1001ABE58;
    v13 = qword_1001ABE58;
    if (!qword_1001ABE58)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000D6174;
      v9[3] = &unk_10015D610;
      v9[4] = &v10;
      sub_1000D6174((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (BYBuddyDaemonCloudSyncClient *)objc_alloc_init(v5);
    v7 = self->_client;
    self->_client = v6;

    client = self->_client;
  }
  return client;
}

- (BOOL)isBackupStatusCompleted:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)activitySubmitted:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableDictionary *backupTasks;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  backupTasks = self->_backupTasks;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](backupTasks, "objectForKeyedSubscript:", v7));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v9 == (id)1)
    v10 = 3;
  else
    v10 = (uint64_t)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  v12 = self->_backupTasks;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);
  os_unfair_lock_unlock(p_lock);
}

- (void)reportActivityRunning:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  _BOOL4 syncInProgress;
  NSObject *log;
  _BOOL4 v8;
  NSMutableDictionary *backupTasks;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  syncInProgress = self->_syncInProgress;
  log = self->_log;
  v8 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (syncInProgress)
  {
    if (v8)
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%@ running", (uint8_t *)&v11, 0xCu);
    }
    backupTasks = self->_backupTasks;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](backupTasks, "setObject:forKeyedSubscript:", &off_10016F140, v10);

  }
  else if (v8)
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%@ running (no sync in progress)", (uint8_t *)&v11, 0xCu);
  }
  os_unfair_lock_unlock(p_lock);

}

- (unint64_t)backupTaskStatusForCompletedActivity:(int64_t)a3
{
  if (a3 == 3)
    return 2;
  else
    return 3;
}

- (void)reportActivityNoLongerRunning:(id)a3
{
  NSMutableDictionary *v4;
  os_unfair_lock_s *p_lock;
  _BOOL4 syncInProgress;
  NSObject *log;
  _BOOL4 v8;
  NSMutableDictionary *backupTasks;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  OS_os_log *v23;
  NSMutableDictionary *v24;
  void *v25;
  NSMutableArray *clientsWithErrors;
  NSMutableDictionary *v27;
  void *v28;
  int64_t totalClients;
  uint64_t v30;
  id v31;
  id v32;
  _CDLocalContext *context;
  void *v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  NSMutableDictionary *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  NSMutableArray *v45;
  __int16 v46;
  NSMutableDictionary *v47;
  _QWORD v48[2];
  _QWORD v49[2];

  v4 = (NSMutableDictionary *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  syncInProgress = self->_syncInProgress;
  log = self->_log;
  v8 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (syncInProgress)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v41 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%@ done running", buf, 0xCu);
    }
    backupTasks = self->_backupTasks;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary name](v4, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](backupTasks, "objectForKeyedSubscript:", v10));
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    if (!-[_DASUserRequestedBackupTaskManager isBackupStatusCompleted:](self, "isBackupStatusCompleted:", v12))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[_DASUserRequestedBackupTaskManager backupTaskStatusForCompletedActivity:](self, "backupTaskStatusForCompletedActivity:", -[NSMutableDictionary completionStatus](v4, "completionStatus"))));
      v14 = self->_backupTasks;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary name](v4, "name"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

    }
    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_backupTasks;
      *(_DWORD *)buf = 138412290;
      v41 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Now backup tasks are: %@", buf, 0xCu);
    }
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v18 = self->_backupTasks;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000D5B78;
    v35[3] = &unk_10015EB68;
    v35[4] = self;
    v35[5] = &v36;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v35);
    if (-[NSMutableDictionary completionStatus](v4, "completionStatus") == (id)3)
    {
      v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1000EB7FC((uint64_t)v4, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary name](v4, "name"));
      v48[0] = NSLocalizedDescriptionKey;
      v48[1] = CFSTR("client");
      v49[0] = CFSTR("Error attempting to sync local changes.");
      v49[1] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 2));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("XPCSyncOnBackup"), 228965071, v21));

      -[NSMutableArray addObject:](self->_clientsWithErrors, "addObject:", v22);
    }
    v23 = self->_log;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_totalClients));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v37[3] - (_QWORD)-[NSMutableArray count](self->_clientsWithErrors, "count")));
      v27 = self->_backupTasks;
      clientsWithErrors = self->_clientsWithErrors;
      *(_DWORD *)buf = 138413058;
      v41 = v24;
      v42 = 2112;
      v43 = v25;
      v44 = 2112;
      v45 = clientsWithErrors;
      v46 = 2112;
      v47 = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Total=%@ Completed=%@ Errors=%@ All=%@", buf, 0x2Au);

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[_DASUserRequestedBackupTaskManager currentClient](self, "currentClient"));
    totalClients = self->_totalClients;
    v30 = v37[3];
    v31 = -[NSMutableArray count](self->_clientsWithErrors, "count");
    v32 = -[NSMutableArray copy](self->_clientsWithErrors, "copy");
    objc_msgSend(v28, "cloudSyncProgressUpdate:completedClients:errors:", totalClients, v30 - (_QWORD)v31, v32);

    if (v37[3] == self->_totalClients)
    {
      self->_totalClients = 0;
      -[NSMutableArray removeAllObjects](self->_clientsWithErrors, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_backupTasks, "removeAllObjects");
      self->_syncInProgress = 0;
      context = self->_context;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath](_DASUserRequestedBackupTaskManager, "userRequestedBackupKeyPath"));
      -[_CDLocalContext setObject:forKeyedSubscript:](context, "setObject:forKeyedSubscript:", &off_10016F158, v34);

    }
    os_unfair_lock_unlock(p_lock);
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v41 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%@ done running (no sync in progress)", buf, 0xCu);
    }
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (BOOL)activityEligibleForRunning:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  _BOOL4 syncInProgress;
  NSMutableDictionary *backupTasks;
  void *v8;
  void *v9;
  id v10;
  BOOL v13;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  syncInProgress = self->_syncInProgress;
  backupTasks = self->_backupTasks;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](backupTasks, "objectForKeyedSubscript:", v8));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  v13 = syncInProgress && v9 != 0 && v10 == 0;
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (void)_queue_obtainPendingBackupTasks
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *backupTasks;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[NSMutableDictionary removeAllObjects](self->_backupTasks, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allPendingSyncOnBackupTasks"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        backupTasks = self->_backupTasks;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "name", (_QWORD)v12));
        -[NSMutableDictionary setObject:forKeyedSubscript:](backupTasks, "setObject:forKeyedSubscript:", &off_10016F170, v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)syncRequested
{
  os_unfair_lock_s *p_lock;
  _CDLocalContext *context;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *log;
  _BOOL4 v9;
  NSObject *v10;
  NSMutableDictionary *backupTasks;
  NSObject *v12;
  void *v13;
  _CDLocalContext *v14;
  void *v15;
  int v16;
  NSMutableDictionary *v17;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath](_DASUserRequestedBackupTaskManager, "userRequestedBackupKeyPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v5));
  v7 = objc_msgSend(v6, "BOOLValue");

  log = self->_log;
  v9 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) != 0)
  {
    if (v9)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Sync requested", (uint8_t *)&v16, 2u);
    }
    -[_DASUserRequestedBackupTaskManager _queue_obtainPendingBackupTasks](self, "_queue_obtainPendingBackupTasks");
    v10 = self->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      backupTasks = self->_backupTasks;
      v16 = 138412290;
      v17 = backupTasks;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pending tasks are %@", (uint8_t *)&v16, 0xCu);
    }
    self->_totalClients = (int64_t)-[NSMutableDictionary count](self->_backupTasks, "count");
    self->_syncInProgress = 1;
    if (!-[NSMutableDictionary count](self->_backupTasks, "count"))
    {
      v12 = self->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No pending tasks, reporting update!", (uint8_t *)&v16, 2u);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASUserRequestedBackupTaskManager currentClient](self, "currentClient"));
      objc_msgSend(v13, "cloudSyncProgressUpdate:completedClients:errors:", 0, 0, &__NSArray0__struct);

      self->_syncInProgress = 0;
      v14 = self->_context;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath](_DASUserRequestedBackupTaskManager, "userRequestedBackupKeyPath"));
      -[_CDLocalContext setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", &off_10016F158, v15);

    }
  }
  else
  {
    if (v9)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Sync ended", (uint8_t *)&v16, 2u);
    }
    self->_syncInProgress = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (int64_t)totalClients
{
  return self->_totalClients;
}

- (void)setTotalClients:(int64_t)a3
{
  self->_totalClients = a3;
}

- (NSMutableDictionary)backupTasks
{
  return self->_backupTasks;
}

- (void)setBackupTasks:(id)a3
{
  objc_storeStrong((id *)&self->_backupTasks, a3);
}

- (NSMutableArray)clientsWithErrors
{
  return self->_clientsWithErrors;
}

- (void)setClientsWithErrors:(id)a3
{
  objc_storeStrong((id *)&self->_clientsWithErrors, a3);
}

- (BOOL)syncInProgress
{
  return self->_syncInProgress;
}

- (void)setSyncInProgress:(BOOL)a3
{
  self->_syncInProgress = a3;
}

- (BYBuddyDaemonCloudSyncClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_clientsWithErrors, 0);
  objc_storeStrong((id *)&self->_backupTasks, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
