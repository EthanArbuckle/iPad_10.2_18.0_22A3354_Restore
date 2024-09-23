@implementation W5DatabaseManager

+ (id)sharedObject
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007C138;
  block[3] = &unk_1000D6858;
  block[4] = a1;
  if (qword_1000FB758 != -1)
    dispatch_once(&qword_1000FB758, block);
  return (id)qword_1000FB750;
}

- (W5DatabaseManager)init
{
  W5DatabaseManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSFetchRequest *fetchLastHourFaultsDict;
  uint64_t v7;
  NSFetchRequest *fetchLastHourLinkTestsDict;
  uint64_t v9;
  NSFetchRequest *fetchLastHourRecoveriesDict;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)W5DatabaseManager;
  v2 = -[W5DatabaseManager init](&v12, "init");
  if (v2
    && (v3 = dispatch_queue_create("com.apple.wifivelocity.dbquery", 0),
        queue = v2->_queue,
        v2->_queue = (OS_dispatch_queue *)v3,
        queue,
        v2->_queue))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("Fault")));
    fetchLastHourFaultsDict = v2->_fetchLastHourFaultsDict;
    v2->_fetchLastHourFaultsDict = (NSFetchRequest *)v5;

    -[NSFetchRequest setResultType:](v2->_fetchLastHourFaultsDict, "setResultType:", 2);
    v7 = objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("LinkTest")));
    fetchLastHourLinkTestsDict = v2->_fetchLastHourLinkTestsDict;
    v2->_fetchLastHourLinkTestsDict = (NSFetchRequest *)v7;

    -[NSFetchRequest setResultType:](v2->_fetchLastHourLinkTestsDict, "setResultType:", 2);
    v9 = objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("Recovery")));
    fetchLastHourRecoveriesDict = v2->_fetchLastHourRecoveriesDict;
    v2->_fetchLastHourRecoveriesDict = (NSFetchRequest *)v9;

    -[NSFetchRequest setResultType:](v2->_fetchLastHourRecoveriesDict, "setResultType:", 2);
  }
  else
  {

    return 0;
  }
  return v2;
}

- (id)_getWAAnalyticsAccess
{
  WAAnalyticsAccess *v3;
  id v4;
  void *v5;
  WAAnalyticsAccess *v6;
  WAAnalyticsAccess *analyticsAccess;

  v3 = self->_analyticsAccess;
  if (!self->_analyticsAccess && sub_10007C2C8())
  {
    v4 = objc_msgSend(sub_10007C2C8(), "accessWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (WAAnalyticsAccess *)objc_msgSend(v5, "copy");
    analyticsAccess = self->_analyticsAccess;
    self->_analyticsAccess = v6;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  WAAnalyticsAccess *analyticsAccess;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  analyticsAccess = self->_analyticsAccess;
  if (analyticsAccess)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager _getWAAnalyticsAccess](self, "_getWAAnalyticsAccess"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainObjectContext"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007C458;
    v8[3] = &unk_1000D5268;
    v8[4] = self;
    objc_msgSend(v6, "performBlockAndWait:", v8);

    analyticsAccess = self->_analyticsAccess;
  }
  self->_analyticsAccess = 0;

  v7.receiver = self;
  v7.super_class = (Class)W5DatabaseManager;
  -[W5DatabaseManager dealloc](&v7, "dealloc");
}

- (void)remoteStoreUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  dispatch_queue_global_t v13;
  NSObject *v14;
  dispatch_queue_global_t v15;
  NSObject *v16;
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = a3;
  NSLog(CFSTR("Got NSNotification %@"), v4);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10007C6EC;
  v36 = sub_10007C6FC;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10007C6EC;
  v30 = sub_10007C6FC;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10007C6EC;
  v24 = sub_10007C6FC;
  v25 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[W5DatabaseManager fetchLastHourFaults](self, "fetchLastHourFaults"));
  v6 = (void *)v33[5];
  v33[5] = v5;

  v7 = objc_claimAutoreleasedReturnValue(-[W5DatabaseManager fetchLastHourLinkTests](self, "fetchLastHourLinkTests"));
  v8 = (void *)v27[5];
  v27[5] = v7;

  v9 = objc_claimAutoreleasedReturnValue(-[W5DatabaseManager fetchLastHourRecoveries](self, "fetchLastHourRecoveries"));
  v10 = (void *)v21[5];
  v21[5] = v9;

  if (v33[5])
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007C704;
    block[3] = &unk_1000D57B8;
    block[4] = self;
    block[5] = &v32;
    dispatch_async(v12, block);

  }
  if (v27[5])
  {
    v13 = dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10007C7FC;
    v18[3] = &unk_1000D57B8;
    v18[4] = self;
    v18[5] = &v26;
    dispatch_async(v14, v18);

  }
  if (v21[5])
  {
    v15 = dispatch_get_global_queue(0, 0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10007C8F4;
    v17[3] = &unk_1000D57B8;
    v17[4] = self;
    v17[5] = &v20;
    dispatch_async(v16, v17);

  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

}

- (id)performFetch:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10007C6EC;
  v19 = sub_10007C6FC;
  v20 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_10007C6EC;
  v13[4] = sub_10007C6FC;
  v14 = 0;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007CAE8;
  v9[3] = &unk_1000D7120;
  v9[4] = self;
  v10 = v4;
  v11 = &v15;
  v12 = v13;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = (id)v16[5];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

- (id)_performFetch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  int v39;
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager _getWAAnalyticsAccess](self, "_getWAAnalyticsAccess"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainObjectContext"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistentStoreCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "managedObjectModel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entitiesByName"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
  LOBYTE(v10) = objc_msgSend(v13, "containsObject:", v14);

  if ((v10 & 1) == 0)
  {
    v27 = sub_10008F56C();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
      v39 = 136315394;
      v40 = "-[W5DatabaseManager _performFetch:error:]";
      v41 = 2112;
      v42 = v29;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] %s: entityName %@ doesn't (yet) exist", &v39, 22);

    }
    goto LABEL_11;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager _getWAAnalyticsAccess](self, "_getWAAnalyticsAccess"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mainObjectContext"));
  v38 = 0;
  v17 = (const char *)objc_msgSend(v16, "countForFetchRequest:error:", v6, &v38);
  v18 = v38;

  v19 = sub_10008F56C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v21)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedDescription"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
      v39 = 138412802;
      v40 = (const char *)v6;
      v41 = 2112;
      v42 = v31;
      v43 = 2112;
      v44 = v32;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v20, 0, "[wifivelocity] Error with countForFetchRequest %@. %@ %@", &v39, 32);

    }
    goto LABEL_18;
  }
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
    v39 = 134218242;
    v40 = v17;
    v41 = 2112;
    v42 = v22;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v20, 0, "[wifivelocity] retrieving %lu entries from request.entityName %@", &v39, 22);

  }
  if (!v17)
  {
LABEL_11:
    v26 = 0;
    goto LABEL_12;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager _getWAAnalyticsAccess](self, "_getWAAnalyticsAccess"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mainObjectContext"));
  v37 = 0;
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "executeFetchRequest:error:", v6, &v37));
  v18 = v37;

  if (!v18)
  {
    v26 = 0;
    v7 = (void *)v25;
    goto LABEL_12;
  }
  v33 = sub_10008F56C();
  v20 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedDescription"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
    v39 = 138412802;
    v40 = (const char *)v6;
    v41 = 2112;
    v42 = v34;
    v43 = 2112;
    v44 = v35;
    LODWORD(v36) = 32;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v20, 0, "[wifivelocity] Error with executeFetchRequest %@. %@ %@", &v39, v36);

  }
  v7 = (void *)v25;
LABEL_18:

  if (*a4)
  {
    v26 = v18;
  }
  else
  {
    v26 = objc_retainAutorelease(v18);
    *a4 = v26;
  }
LABEL_12:

  return v7;
}

- (id)fetchLastHourFaults
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -3600.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("date >= %@"), v3));
  -[NSFetchRequest setPredicate:](self->_fetchLastHourFaultsDict, "setPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager performFetch:](self, "performFetch:", self->_fetchLastHourFaultsDict));

  return v5;
}

- (id)fetchLastHourLinkTests
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -3600.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("date >= %@"), v3));
  -[NSFetchRequest setPredicate:](self->_fetchLastHourLinkTestsDict, "setPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager performFetch:](self, "performFetch:", self->_fetchLastHourLinkTestsDict));

  return v5;
}

- (id)fetchLastHourRecoveries
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -3600.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("date >= %@"), v3));
  -[NSFetchRequest setPredicate:](self->_fetchLastHourRecoveriesDict, "setPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager performFetch:](self, "performFetch:", self->_fetchLastHourRecoveriesDict));

  return v5;
}

- (void)performFetchAndReply:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D20C;
  block[3] = &unk_1000D7148;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)setUpdatedFaultsCallback:(id)a3
{
  id updatedFaultsCallback;
  id v5;
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;

  v8 = a3;
  if (dispatch_get_specific(&self->_queue))
  {
    updatedFaultsCallback = self->_updatedFaultsCallback;
    self->_updatedFaultsCallback = 0;

    v5 = objc_retainBlock(v8);
    v6 = self->_updatedFaultsCallback;
    self->_updatedFaultsCallback = v5;
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007D3EC;
    block[3] = &unk_1000D7170;
    block[4] = self;
    v10 = v8;
    dispatch_sync(queue, block);
    v6 = v10;
  }

}

- (void)setUpdatedLinkTestsCallback:(id)a3
{
  id updatedLinkTestsCallback;
  id v5;
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;

  v8 = a3;
  if (dispatch_get_specific(&self->_queue))
  {
    updatedLinkTestsCallback = self->_updatedLinkTestsCallback;
    self->_updatedLinkTestsCallback = 0;

    v5 = objc_retainBlock(v8);
    v6 = self->_updatedLinkTestsCallback;
    self->_updatedLinkTestsCallback = v5;
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007D4EC;
    block[3] = &unk_1000D7170;
    block[4] = self;
    v10 = v8;
    dispatch_sync(queue, block);
    v6 = v10;
  }

}

- (void)setUpdatedRecoveriesCallback:(id)a3
{
  id updatedRecoveriesCallback;
  id v5;
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;

  v8 = a3;
  if (dispatch_get_specific(&self->_queue))
  {
    updatedRecoveriesCallback = self->_updatedRecoveriesCallback;
    self->_updatedRecoveriesCallback = 0;

    v5 = objc_retainBlock(v8);
    v6 = self->_updatedRecoveriesCallback;
    self->_updatedRecoveriesCallback = v5;
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007D5EC;
    block[3] = &unk_1000D7170;
    block[4] = self;
    v10 = v8;
    dispatch_sync(queue, block);
    v6 = v10;
  }

}

- (void)startEventMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D694;
  block[3] = &unk_1000D5268;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D800;
  block[3] = &unk_1000D5268;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)updatedFaultsCallback
{
  return self->_updatedFaultsCallback;
}

- (id)updatedLinkTestsCallback
{
  return self->_updatedLinkTestsCallback;
}

- (id)updatedRecoveriesCallback
{
  return self->_updatedRecoveriesCallback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedRecoveriesCallback, 0);
  objc_storeStrong(&self->_updatedLinkTestsCallback, 0);
  objc_storeStrong(&self->_updatedFaultsCallback, 0);
  objc_storeStrong((id *)&self->_fetchLastHourRecoveriesDict, 0);
  objc_storeStrong((id *)&self->_fetchLastHourLinkTestsDict, 0);
  objc_storeStrong((id *)&self->_fetchLastHourFaultsDict, 0);
  objc_storeStrong((id *)&self->_analyticsAccess, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
