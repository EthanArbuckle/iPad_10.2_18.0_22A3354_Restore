@implementation W5BGTaskManager

- (W5BGTaskManager)init
{
  uint64_t v2;
  W5BGTaskManager *v3;
  objc_super v5;

  self->_scheduler = 0;
  v5.receiver = self;
  v5.super_class = (Class)W5BGTaskManager;
  v3 = -[W5BGTaskManager init](&v5, "init");
  if (v3)
  {
    if (objc_opt_class(BGSystemTaskScheduler, v2))
      v3->_scheduler = (BGSystemTaskScheduler *)+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler");
    else
      return 0;
  }
  return v3;
}

- (BOOL)scheduleRepeatingTask:(id)a3 interval:(double)a4 repeatingTask:(id)a5
{
  NSObject *v9;
  unsigned __int8 v10;
  BGSystemTaskScheduler *scheduler;
  NSObject *v12;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  const __CFString *v17;
  NSObject *v18;
  const __CFString *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;

  if (-[NSMutableArray containsObject:](self->_registeredIdentifiers, "containsObject:"))
  {
    v9 = sub_10008F56C();
    v10 = 0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315906;
      v21 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
      v22 = 2080;
      v23 = "W5BGTaskManager.m";
      v24 = 1024;
      v25 = 39;
      v26 = 2114;
      v27 = a3;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) Task: %{public}@ already registered", &v20, 38);
      return 0;
    }
  }
  else
  {
    scheduler = self->_scheduler;
    if (!scheduler)
      return 0;
    if ((-[BGSystemTaskScheduler registerForTaskWithIdentifier:usingQueue:launchHandler:](scheduler, "registerForTaskWithIdentifier:usingQueue:launchHandler:", a3, 0, a5) & 1) == 0)
    {
      v18 = sub_10008F56C();
      v10 = 0;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        return v10;
      v20 = 136315906;
      v21 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
      v22 = 2080;
      v23 = "W5BGTaskManager.m";
      v24 = 1024;
      v25 = 49;
      v26 = 2114;
      v27 = a3;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) Failed to register task: %{public}@", &v20, 38);
      return 0;
    }
    if (-[BGSystemTaskScheduler taskRequestForIdentifier:](self->_scheduler, "taskRequestForIdentifier:", a3))
    {
      v12 = sub_10008F56C();
      v10 = 0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315906;
        v21 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
        v22 = 2080;
        v23 = "W5BGTaskManager.m";
        v24 = 1024;
        v25 = 52;
        v26 = 2114;
        v27 = a3;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) Task: %{public}@ already exists", &v20, 38);
        return 0;
      }
    }
    else
    {
      v14 = objc_msgSend(objc_alloc((Class)BGRepeatingSystemTaskRequest), "initWithIdentifier:", a3);
      objc_msgSend(v14, "setRequiresNetworkConnectivity:", 0);
      objc_msgSend(v14, "setRequiresExternalPower:", 0);
      objc_msgSend(v14, "setInterval:", a4);
      objc_msgSend(v14, "setMinDurationBetweenInstances:", a4);
      objc_msgSend(v14, "setShouldWakeDevice:", 0);
      v19 = 0;
      v10 = objc_msgSend(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"), "submitTaskRequest:error:", v14, &v19);
      v15 = sub_10008F56C();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if ((v10 & 1) != 0)
      {
        if (v16)
        {
          v20 = 136315906;
          v21 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
          v22 = 2080;
          v23 = "W5BGTaskManager.m";
          v24 = 1024;
          v25 = 69;
          v26 = 2114;
          v27 = a3;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) Scheduled periodic task: %{public}@", &v20, 38);
        }
        -[NSMutableArray addObject:](self->_registeredIdentifiers, "addObject:", a3);
      }
      else if (v16)
      {
        v17 = v19;
        if (!v19)
          v17 = CFSTR("Unknown");
        v20 = 136315906;
        v21 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
        v22 = 2080;
        v23 = "W5BGTaskManager.m";
        v24 = 1024;
        v25 = 65;
        v26 = 2114;
        v27 = (id)v17;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) Failed to submit task with error: %{public}@", &v20, 38);
      }
    }
  }
  return v10;
}

- (void)stopAllRepeatingTasks
{
  char *v3;
  NSObject *v4;
  char *i;
  char *v6;
  NSObject *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  char *v18;

  if (self->_scheduler)
  {
    v3 = (char *)-[NSMutableArray count](self->_registeredIdentifiers, "count");
    v4 = sub_10008F56C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = "-[W5BGTaskManager stopAllRepeatingTasks]";
      v13 = 2080;
      v14 = "W5BGTaskManager.m";
      v15 = 1024;
      v16 = 87;
      v17 = 2048;
      v18 = v3;
      LODWORD(v8) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) #Registered Tasks: %ld", (const char *)&v11, v8, v9, v10);
    }
    if (v3)
    {
      for (i = 0; i != v3; ++i)
      {
        v6 = (char *)-[NSMutableArray objectAtIndex:](self->_registeredIdentifiers, "objectAtIndex:", i);
        if (-[BGSystemTaskScheduler deregisterTaskWithIdentifier:](self->_scheduler, "deregisterTaskWithIdentifier:", v6))
        {
          v7 = sub_10008F56C();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v11 = 136315906;
            v12 = "-[W5BGTaskManager stopAllRepeatingTasks]";
            v13 = 2080;
            v14 = "W5BGTaskManager.m";
            v15 = 1024;
            v16 = 94;
            v17 = 2114;
            v18 = v6;
            LODWORD(v8) = 38;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) Succeafully de-registered task: %{public}@", &v11, v8);
          }
          -[NSMutableArray removeObjectAtIndex:](self->_registeredIdentifiers, "removeObjectAtIndex:", i);
        }
      }
    }
  }
}

- (void)dealloc
{
  BGSystemTaskScheduler *scheduler;
  NSMutableArray *registeredIdentifiers;
  objc_super v5;

  scheduler = self->_scheduler;
  if (scheduler)

  registeredIdentifiers = self->_registeredIdentifiers;
  if (registeredIdentifiers)

  v5.receiver = self;
  v5.super_class = (Class)W5BGTaskManager;
  -[W5BGTaskManager dealloc](&v5, "dealloc");
}

- (BGSystemTaskScheduler)scheduler
{
  return (BGSystemTaskScheduler *)objc_getProperty(self, a2, 8, 1);
}

- (void)setScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)registeredIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRegisteredIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
