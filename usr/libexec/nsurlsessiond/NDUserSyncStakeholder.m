@implementation NDUserSyncStakeholder

+ (BOOL)EDUMode
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v3 = objc_msgSend(v2, "isMultiUser");

  return v3;
}

- (id)startUMTask:(id)a3 taskInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (!+[NDUserSyncStakeholder EDUMode](NDUserSyncStakeholder, "EDUMode"))
    goto LABEL_8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
  if (!objc_msgSend(v8, "isInSyncBubble"))
  {
    if (objc_msgSend(v7, "taskKind") == (id)1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "originalRequest"));
      objc_msgSend(v9, "_timeWindowDelay");
      v11 = v10;

      if (v11 == 0.0)
        goto LABEL_6;
    }
    else
    {

    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }

LABEL_6:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserSyncTask taskWithName:reason:forBundleID:](UMUserSyncTask, "taskWithName:reason:forBundleID:", CFSTR("nsurlsession bg task"), CFSTR("client"), v6));
  os_unfair_lock_lock(&self->_activeTasksLock);
  -[NSMutableSet addObject:](self->_activeTasks, "addObject:", v12);
  os_unfair_lock_unlock(&self->_activeTasksLock);
  objc_msgSend(v12, "begin");
LABEL_9:

  return v12;
}

- (void)endBridgingUMTask:(id)a3
{
  id v4;
  NSMutableDictionary *bridgeTasks;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = a3;
  bridgeTasks = self->_bridgeTasks;
  v10 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](bridgeTasks, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    objc_msgSend(v7, "end");
    v8 = self->_bridgeTasks;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0, v9);

  }
}

+ (id)sharedStakeholder
{
  if (qword_1000C7108 != -1)
    dispatch_once(&qword_1000C7108, &stru_1000B19B8);
  return (id)qword_1000C7110;
}

- (void)restoredTaskActive:(id)a3
{
  id v4;
  UMUserSyncTask *monitorTask;
  id v6;

  v4 = a3;
  if (!self->_tasksInitialized)
  {
    v6 = v4;
    os_unfair_lock_lock(&self->_monitorTaskLock);
    -[NSMutableSet removeObject:](self->_monitorTaskSet, "removeObject:", v6);
    if (!-[NSMutableSet count](self->_monitorTaskSet, "count") && self->_tasksEnqueued)
    {
      -[UMUserSyncTask end](self->_monitorTask, "end");
      monitorTask = self->_monitorTask;
      self->_monitorTask = 0;

      self->_tasksInitialized = 1;
    }
    os_unfair_lock_unlock(&self->_monitorTaskLock);
    v4 = v6;
  }

}

- (NDUserSyncStakeholder)init
{
  NDUserSyncStakeholder *v2;
  uint64_t v3;
  NSMutableSet *activeTasks;
  NSMutableSet *v5;
  NSMutableSet *monitorTaskSet;
  NSMutableDictionary *v7;
  NSMutableDictionary *bridgeTasks;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NDUserSyncStakeholder;
  v2 = -[NDUserSyncStakeholder init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    activeTasks = v2->_activeTasks;
    v2->_activeTasks = (NSMutableSet *)v3;

    v2->_tasksInitialized = 0;
    v2->_activeTasksLock._os_unfair_lock_opaque = 0;
    v2->_monitorTaskLock._os_unfair_lock_opaque = 0;
    v5 = objc_opt_new(NSMutableSet);
    monitorTaskSet = v2->_monitorTaskSet;
    v2->_monitorTaskSet = v5;

    v7 = objc_opt_new(NSMutableDictionary);
    bridgeTasks = v2->_bridgeTasks;
    v2->_bridgeTasks = v7;

  }
  return v2;
}

- (void)startBridgingUMTask:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  NSMutableDictionary *bridgeTasks;
  void *v11;
  id v12;

  v12 = a3;
  if (+[NDUserSyncStakeholder EDUMode](NDUserSyncStakeholder, "EDUMode"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
    if (objc_msgSend(v4, "isInSyncBubble"))
    {

      goto LABEL_6;
    }
    if (objc_msgSend(v12, "taskKind") != (id)1)
    {
      v9 = v4;
      goto LABEL_8;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "originalRequest"));
    objc_msgSend(v5, "_timeWindowDelay");
    v7 = v6;

    if (v7 == 0.0)
    {
LABEL_6:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserSyncTask taskWithName:reason:forBundleID:](UMUserSyncTask, "taskWithName:reason:forBundleID:", CFSTR("nsurlsession bg task"), CFSTR("retry"), v8));

      objc_msgSend(v9, "begin");
      bridgeTasks = self->_bridgeTasks;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueIdentifier"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](bridgeTasks, "setObject:forKeyedSubscript:", v9, v11);

LABEL_8:
    }
  }

}

- (void)endUMTask:(id)a3
{
  id v4;
  os_unfair_lock_s *p_activeTasksLock;
  void *v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  if (v4)
  {
    p_activeTasksLock = &self->_activeTasksLock;
    os_unfair_lock_lock(&self->_activeTasksLock);
    -[NSMutableSet removeObject:](self->_activeTasks, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_activeTasksLock);
    objc_msgSend(v4, "end");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allCredentials"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      os_unfair_lock_lock(&self->_activeTasksLock);
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = self->_activeTasks;
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v18;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1)
                                                                               + 8 * (_QWORD)v12), "bundleID"));
            objc_msgSend(v8, "addObject:", v13);

            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

      os_unfair_lock_unlock(p_activeTasksLock);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10004FD08;
      v15[3] = &unk_1000B1A08;
      v14 = v8;
      v16 = v14;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v15);

    }
  }

}

- (void)uploadContent
{
  os_unfair_lock_s *p_monitorTaskLock;
  UMUserSyncTask *v4;
  UMUserSyncTask *monitorTask;

  p_monitorTaskLock = &self->_monitorTaskLock;
  os_unfair_lock_lock(&self->_monitorTaskLock);
  if (!self->_tasksInitialized)
  {
    v4 = (UMUserSyncTask *)objc_claimAutoreleasedReturnValue(+[UMUserSyncTask taskWithName:reason:](UMUserSyncTask, "taskWithName:reason:", CFSTR("nsurlsession bg task"), CFSTR("monitor")));
    monitorTask = self->_monitorTask;
    self->_monitorTask = v4;

    -[UMUserSyncTask begin](self->_monitorTask, "begin");
  }
  os_unfair_lock_unlock(p_monitorTaskLock);
}

- (void)restoredTaskEnqueued:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_tasksInitialized)
  {
    v5 = v4;
    os_unfair_lock_lock(&self->_monitorTaskLock);
    -[NSMutableSet addObject:](self->_monitorTaskSet, "addObject:", v5);
    os_unfair_lock_unlock(&self->_monitorTaskLock);
    v4 = v5;
  }

}

- (void)tasksHaveBeenEnqueued
{
  os_unfair_lock_s *p_monitorTaskLock;
  UMUserSyncTask *monitorTask;

  p_monitorTaskLock = &self->_monitorTaskLock;
  os_unfair_lock_lock(&self->_monitorTaskLock);
  self->_tasksEnqueued = 1;
  if (!-[NSMutableSet count](self->_monitorTaskSet, "count"))
  {
    -[UMUserSyncTask end](self->_monitorTask, "end");
    monitorTask = self->_monitorTask;
    self->_monitorTask = 0;

    self->_tasksInitialized = 1;
  }
  os_unfair_lock_unlock(p_monitorTaskLock);
}

- (NSMutableSet)activeTasks
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActiveTasks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (os_unfair_lock_s)activeTasksLock
{
  return self->_activeTasksLock;
}

- (void)setActiveTasksLock:(os_unfair_lock_s)a3
{
  self->_activeTasksLock = a3;
}

- (UMUserSyncTask)monitorTask
{
  return (UMUserSyncTask *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMonitorTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableSet)monitorTaskSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMonitorTaskSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (os_unfair_lock_s)monitorTaskLock
{
  return self->_monitorTaskLock;
}

- (void)setMonitorTaskLock:(os_unfair_lock_s)a3
{
  self->_monitorTaskLock = a3;
}

- (BOOL)tasksInitialized
{
  return self->_tasksInitialized;
}

- (void)setTasksInitialized:(BOOL)a3
{
  self->_tasksInitialized = a3;
}

- (BOOL)tasksEnqueued
{
  return self->_tasksEnqueued;
}

- (void)setTasksEnqueued:(BOOL)a3
{
  self->_tasksEnqueued = a3;
}

- (NSMutableDictionary)bridgeTasks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBridgeTasks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgeTasks, 0);
  objc_storeStrong((id *)&self->_monitorTaskSet, 0);
  objc_storeStrong((id *)&self->_monitorTask, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
}

@end
