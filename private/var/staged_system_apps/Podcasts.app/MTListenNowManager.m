@implementation MTListenNowManager

- (void)_endBackgroundTask:(BOOL)a3
{
  _BOOL4 v3;
  MTListenNowManager *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTListenNowManager setUpdateCount:](v4, "setUpdateCount:", (char *)-[MTListenNowManager updateCount](v4, "updateCount") - 1);
  if ((!-[MTListenNowManager updateCount](v4, "updateCount") || v3)
    && -[MTListenNowManager backgroundTaskIdentifier](v4, "backgroundTaskIdentifier") != UIBackgroundTaskInvalid)
  {
    v5 = _MTLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = &stru_1004C6D40;
      if (v3)
        v7 = CFSTR("(expired)");
      v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MTListenNowManager ending background task %@", (uint8_t *)&v9, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v8, "endBackgroundTask:", -[MTListenNowManager backgroundTaskIdentifier](v4, "backgroundTaskIdentifier"));

    -[MTListenNowManager setBackgroundTaskIdentifier:](v4, "setBackgroundTaskIdentifier:", UIBackgroundTaskInvalid);
  }
  if (-[MTListenNowManager backgroundTaskIdentifier](v4, "backgroundTaskIdentifier") == UIBackgroundTaskInvalid)
    -[MTListenNowManager setUpdateCount:](v4, "setUpdateCount:", 0);
  objc_sync_exit(v4);

}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unint64_t)a3
{
  self->_updateCount = a3;
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)_beginBackgroundTask
{
  MTListenNowManager *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  -[MTListenNowManager setUpdateCount:](v2, "setUpdateCount:", (char *)-[MTListenNowManager updateCount](v2, "updateCount") + 1);
  if (-[MTListenNowManager backgroundTaskIdentifier](v2, "backgroundTaskIdentifier") == UIBackgroundTaskInvalid)
  {
    v3 = _MTLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MTListenNowManager starting background task", buf, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E4CE0;
    v6[3] = &unk_1004A6200;
    v6[4] = v2;
    -[MTListenNowManager setBackgroundTaskIdentifier:](v2, "setBackgroundTaskIdentifier:", objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Listen now manager"), v6));

  }
  objc_sync_exit(v2);

}

- (void)processListenNowEpisodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  if (-[MTListenNowManager automaticallySuggestsEpisodes](self, "automaticallySuggestsEpisodes"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_1000467DC;
    v18 = sub_100046A64;
    v19 = 0;
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_1000482C8;
    v11 = &unk_1004A6F38;
    v13 = &v14;
    v12 = v4;
    objc_msgSend(v6, "performBlockAndWait:", &v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTUpcomingMediaController sharedInstance](MTUpcomingMediaController, "sharedInstance", v8, v9, v10, v11));
    objc_msgSend(v7, "setSuggestedEpisodeUuids:", v15[5]);

    _Block_object_dispose(&v14, 8);
  }

}

- (MTListenNowManager)init
{
  MTListenNowManager *v2;
  MTListenNowManager *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;
  _QWORD v22[2];

  v21.receiver = self;
  v21.super_class = (Class)MTListenNowManager;
  v2 = -[MTListenNowManager init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    -[MTListenNowManager setAutomaticallySuggestsEpisodes:](v2, "setAutomaticallySuggestsEpisodes:", 1);
    objc_initWeak(&location, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", kMTEpisodeEntityName));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTListenNowManager _predicate](v3, "_predicate"));
    objc_msgSend(v4, "setPredicate:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForListenNow](MTEpisode, "sortDescriptorsForListenNow"));
    objc_msgSend(v4, "setSortDescriptors:", v6);

    v7 = objc_alloc((Class)MTPropertyChangeQueryObserver);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "privateQueueContext"));
    v10 = objc_msgSend(v7, "initWithFetchRequest:managedObjectContext:", v4, v9);
    -[MTListenNowManager setListenNowQueryObserver:](v3, "setListenNowQueryObserver:", v10);

    v22[0] = kEpisodeListenNowEpisode;
    v22[1] = kEpisodePodcastUuid;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTListenNowManager listenNowQueryObserver](v3, "listenNowQueryObserver"));
    objc_msgSend(v12, "setPropertyKeys:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTListenNowManager listenNowQueryObserver](v3, "listenNowQueryObserver"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000047F0;
    v18[3] = &unk_1004AA708;
    objc_copyWeak(&v19, &location);
    v14 = objc_msgSend(v13, "addResultsChangedHandler:", v18);

    v3->_backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    v15 = dispatch_queue_create("MTListenNowManager", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (MTPropertyChangeQueryObserver)listenNowQueryObserver
{
  return self->_listenNowQueryObserver;
}

- (void)update
{
  NSObject *workQueue;
  _QWORD block[5];

  -[MTListenNowManager _beginBackgroundTask](self, "_beginBackgroundTask");
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005114;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)startObservingChanges
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048308;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)setListenNowQueryObserver:(id)a3
{
  objc_storeStrong((id *)&self->_listenNowQueryObserver, a3);
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (void)setAutomaticallySuggestsEpisodes:(BOOL)a3
{
  self->_automaticallySuggestsEpisodes = a3;
}

- (BOOL)automaticallySuggestsEpisodes
{
  return self->_automaticallySuggestsEpisodes;
}

- (id)_predicate
{
  return +[MTEpisode predicateForListenNow](MTEpisode, "predicateForListenNow");
}

- (void)_endBackgroundTask
{
  -[MTListenNowManager _endBackgroundTask:](self, "_endBackgroundTask:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[MTListenNowManager stopObservingChanges](self, "stopObservingChanges");
  v3.receiver = self;
  v3.super_class = (Class)MTListenNowManager;
  -[MTListenNowManager dealloc](&v3, "dealloc");
}

- (void)stopObservingChanges
{
  void *v3;
  NSObject *workQueue;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTListenNowManager listenNowQueryObserver](self, "listenNowQueryObserver"));
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E4BC4;
  block[3] = &unk_1004A6200;
  v7 = v3;
  v5 = v3;
  dispatch_async(workQueue, block);

}

- (void)results:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E4C50;
  v7[3] = &unk_1004A63C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenNowQueryObserver, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
