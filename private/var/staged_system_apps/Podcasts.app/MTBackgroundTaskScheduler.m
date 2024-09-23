@implementation MTBackgroundTaskScheduler

- (void)applicationWillEnterForeground:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = _MTLogCategoryBackgroundFetching(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "App will enter foreground", v6, 2u);
  }

  dispatch_async((dispatch_queue_t)self->_bgSchedulerQueue, &stru_1004A8BF0);
}

- (void)registerLaunchHandlers
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id obj;
  _QWORD v9[7];
  _QWORD v10[5];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = (id)qword_100567368;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v5);
        v10[0] = 0;
        v10[1] = v10;
        v10[2] = 0x3032000000;
        v10[3] = sub_1000466DC;
        v10[4] = sub_1000469E4;
        v11 = (id)objc_opt_new(objc_msgSend((id)qword_100567368, "objectForKey:", v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGTaskScheduler sharedScheduler](BGTaskScheduler, "sharedScheduler"));
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100094A38;
        v9[3] = &unk_1004A8BD0;
        v9[4] = v6;
        v9[5] = self;
        v9[6] = v10;
        objc_msgSend(v7, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v6, 0, v9);

        _Block_object_dispose(v10, 8);
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

+ (void)registerBackgroundTaskClass:(Class)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = (id)qword_100567368;
  objc_sync_enter(v4);
  if (!qword_100567368)
  {
    v5 = objc_opt_new(NSMutableDictionary);
    v6 = (void *)qword_100567368;
    qword_100567368 = (uint64_t)v5;

  }
  v7 = -[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &OBJC_PROTOCOL___MTBackgroundTask);
  if ((v7 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class identifier](a3, "identifier"));
    objc_msgSend((id)qword_100567368, "setObject:forKey:", a3, v10);

  }
  else
  {
    v11 = _MTLogCategoryBackgroundFetching(v7, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Invalid class registered in MTBackgroundTaskScheduler, must be an MTBackgroundTask", v13, 2u);
    }

  }
  objc_sync_exit(v4);

}

- (MTBackgroundTaskScheduler)init
{
  MTBackgroundTaskScheduler *v2;
  MTBackgroundTaskScheduler *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *bgSchedulerQueue;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTBackgroundTaskScheduler;
  v2 = -[MTBackgroundTaskScheduler init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    -[MTBackgroundTaskScheduler setBackgroundTaskId:](v2, "setBackgroundTaskId:", UIBackgroundTaskInvalid);
    v4 = dispatch_queue_create("MTBackgroundTaskScheduler.bgSchedulerQueue", 0);
    bgSchedulerQueue = v3->_bgSchedulerQueue;
    v3->_bgSchedulerQueue = (OS_dispatch_queue *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, "applicationWillEnterForeground:", MTApplicationWillEnterForegroundNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "applicationDidEnterBackground:", MTApplicationDidEnterBackgroundNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, "applicationWillTerminate:", MTApplicationWillTerminateNotification, 0);

    -[MTBackgroundTaskScheduler registerLaunchHandlers](v3, "registerLaunchHandlers");
  }
  return v3;
}

- (void)setBackgroundTaskId:(unint64_t)a3
{
  self->_backgroundTaskId = a3;
}

- (void)applicationDidEnterBackground:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = _MTLogCategoryBackgroundFetching(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "App did enter background", v6, 2u);
  }

  -[MTBackgroundTaskScheduler _takeAssertionAndSchedule](self, "_takeAssertionAndSchedule");
}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = _MTLogCategoryBackgroundFetching(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "App will terminate", v6, 2u);
  }

  -[MTBackgroundTaskScheduler _takeAssertionAndSchedule](self, "_takeAssertionAndSchedule");
}

- (void)_takeAssertionAndSchedule
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  _QWORD block[5];
  _QWORD v16[4];
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  id buf[2];
  _BYTE v25[128];

  v3 = _MTLogCategoryBackgroundFetching(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Take assertion and schedule", (uint8_t *)buf, 2u);
  }

  if (-[MTBackgroundTaskScheduler backgroundTaskId](self, "backgroundTaskId") != UIBackgroundTaskInvalid)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v5, "endBackgroundTask:", -[MTBackgroundTaskScheduler backgroundTaskId](self, "backgroundTaskId"));

    -[MTBackgroundTaskScheduler setBackgroundTaskId:](self, "setBackgroundTaskId:", UIBackgroundTaskInvalid);
  }
  objc_initWeak(buf, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MTBackgroundTaskScheduler-%@"), v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10009530C;
  v22[3] = &unk_1004A7570;
  objc_copyWeak(&v23, buf);
  -[MTBackgroundTaskScheduler setBackgroundTaskId:](self, "setBackgroundTaskId:", objc_msgSend(v7, "beginBackgroundTaskWithName:expirationHandler:", v14, v22));

  v8 = dispatch_group_create();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (id)qword_100567368;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        dispatch_group_enter(v8);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000953DC;
        v16[3] = &unk_1004A6200;
        v17 = v8;
        -[MTBackgroundTaskScheduler rescheduleTasksIfNotScheduledWithIdentifier:completion:](self, "rescheduleTasksIfNotScheduledWithIdentifier:completion:", v13, v16);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v10);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000953E4;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(buf);
}

- (void)rescheduleTasksIfNotScheduledWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *bgSchedulerQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MTBackgroundTaskScheduler *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  bgSchedulerQueue = self->_bgSchedulerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000954E4;
  block[3] = &unk_1004A8C40;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(bgSchedulerQueue, block);

}

- (void)rescheduleTasksWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *bgSchedulerQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)qword_100567368, "objectForKey:", v6);
  bgSchedulerQueue = self->_bgSchedulerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095778;
  block[3] = &unk_1004A8C68;
  v14 = v7;
  v15 = v8;
  v13 = v6;
  v10 = v7;
  v11 = v6;
  dispatch_async(bgSchedulerQueue, block);

}

- (unint64_t)backgroundTaskId
{
  return self->_backgroundTaskId;
}

- (OS_dispatch_queue)bgSchedulerQueue
{
  return self->_bgSchedulerQueue;
}

- (void)setBgSchedulerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bgSchedulerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgSchedulerQueue, 0);
}

@end
