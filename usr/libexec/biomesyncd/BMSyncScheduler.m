@implementation BMSyncScheduler

- (BMSyncScheduler)initWithRapportSyncEngine:(id)a3 cloudKitSyncEngine:(id)a4 peerStatusTracker:(id)a5 database:(id)a6 queue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMSyncScheduler *v17;
  BMSyncScheduler *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMSyncScheduler;
  v17 = -[BMSyncScheduler init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rapportSyncEngine, a3);
    objc_storeStrong((id *)&v18->_cloudKitSyncEngine, a4);
    objc_storeStrong((id *)&v18->_peerStatusTracker, a5);
    objc_storeStrong((id *)&v18->_database, a6);
    objc_storeStrong((id *)&v18->_queue, a7);
  }

  return v18;
}

- (void)syncNowIfPolicyAllowsWithReason:(unint64_t)a3 transportType:(unint64_t)a4 activity:(id)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  unint64_t v12;

  v8 = a5;
  if (a4 == 3)
  {
    -[BMSyncScheduler syncCloudKitNowIfPolicyAllowsWithReason:activity:completionHandler:](self, "syncCloudKitNowIfPolicyAllowsWithReason:activity:completionHandler:", a3, v8, 0);
  }
  else if (a4 == 2)
  {
    -[BMSyncScheduler syncRapportNowIfPolicyAllowsWithReason:activity:completionHandler:](self, "syncRapportNowIfPolicyAllowsWithReason:activity:completionHandler:", a3, v8, 0);
  }
  else
  {
    v9 = __biome_log_for_category(11);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "unrecognized transport type (%lu)", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)syncAllTransportsNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  OS_dispatch_queue *queue;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  OS_dispatch_queue *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD block[5];
  id v23;
  NSObject *v24;
  unint64_t v25;
  uint8_t buf[16];

  v6 = a4;
  v7 = dispatch_group_create();
  v8 = __biome_log_for_category(11);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "syncNowIfPolicyAllowsWithReason: begin rapport sync", buf, 2u);
  }

  dispatch_group_enter(v7);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034460;
  block[3] = &unk_1000697D0;
  block[4] = self;
  v25 = a3;
  v11 = v6;
  v23 = v11;
  v12 = v7;
  v24 = v12;
  dispatch_sync((dispatch_queue_t)queue, block);
  v13 = __biome_log_for_category(11);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "syncNowIfPolicyAllowsWithReason: begin cloudkit sync", buf, 2u);
  }

  dispatch_group_enter(v12);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000344E8;
  v20[3] = &unk_100068C78;
  v21 = v12;
  v15 = v12;
  -[BMSyncScheduler syncCloudKitNowIfPolicyAllowsWithReason:activity:completionHandler:](self, "syncCloudKitNowIfPolicyAllowsWithReason:activity:completionHandler:", a3, v11, v20);
  v16 = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000344F0;
  v18[3] = &unk_100068B38;
  v19 = v11;
  v17 = v11;
  dispatch_group_notify(v15, (dispatch_queue_t)v16, v18);

}

- (BOOL)canPerformRapportSyncWithReason:(unint64_t)a3
{
  BOOL v3;
  double v5;
  double v6;
  double v7;
  double v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  int v22;
  const __CFString *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  double v29;

  if (a3 == 5)
    return 1;
  +[BMSyncPolicy minimumTimeBetweenSyncsForTransport:](BMSyncPolicy, "minimumTimeBetweenSyncsForTransport:", 2);
  v6 = v5;
  +[BMSyncPolicy minimumTimeBetweenSyncsAttemptsForTransport:](BMSyncPolicy, "minimumTimeBetweenSyncsAttemptsForTransport:", 2);
  v8 = v7;
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BMSyncDevicePeerStatusTracker lastSyncDateFromAnyDevice](self->_peerStatusTracker, "lastSyncDateFromAnyDevice"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase lastRapportSyncAttemptDate](self->_database, "lastRapportSyncAttemptDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v12 = v11;
  if (!v10)
  {
    v14 = INFINITY;
    if (v9)
      goto LABEL_5;
LABEL_7:
    v16 = INFINITY;
    goto LABEL_8;
  }
  objc_msgSend(v11, "timeIntervalSinceDate:", v10);
  v14 = v13;
  if (!v9)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(v12, "timeIntervalSinceDate:", v9);
  v16 = v15;
LABEL_8:
  v17 = __biome_log_for_category(11);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("never");
    v22 = 138544130;
    if (v9)
      v20 = v9;
    else
      v20 = CFSTR("never");
    v23 = v20;
    v24 = 2048;
    if (v10)
      v19 = v10;
    v25 = v16;
    v26 = 2114;
    v27 = v19;
    v28 = 2048;
    v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "last sync: %{public}@ (%f ago), last attempt: %{public}@ (%f ago)", (uint8_t *)&v22, 0x2Au);
  }

  if (v9 && v16 < v6 * 0.9 || (v3 = 1, v10) && v14 < v8 * 0.9)
    v3 = 0;

  return v3;
}

- (void)syncRapportNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  _xpc_activity_s *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  BMRapportSyncEngine *rapportSyncEngine;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[16];
  id v30;

  v8 = (_xpc_activity_s *)a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = objc_autoreleasePoolPush();
  if (-[BMSyncDatabase open](self->_database, "open"))
  {
    v11 = (id)os_transaction_create("com.apple.biome.syncNow");
    if (-[BMSyncScheduler canPerformRapportSyncWithReason:](self, "canPerformRapportSyncWithReason:", a3))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[BMSyncDatabase setLastRapportSyncAttemptDate:](self->_database, "setLastRapportSyncAttemptDate:", v12);

      if (v8)
        xpc_activity_set_state(v8, 4);
      -[BMRapportSyncEngine startClient](self->_rapportSyncEngine, "startClient");
      rapportSyncEngine = self->_rapportSyncEngine;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100034A80;
      v26[3] = &unk_1000697F8;
      v26[4] = self;
      v11 = v11;
      v27 = v11;
      v28 = v9;
      -[BMRapportSyncEngine syncNowWithReason:activity:completionHandler:](rapportSyncEngine, "syncNowWithReason:activity:completionHandler:", a3, v8, v26);

    }
    else
    {
      v19 = __biome_log_for_category(11);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "skipping rapport sync", buf, 2u);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine metricsCollector](self->_rapportSyncEngine, "metricsCollector"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sessionContext"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sessionID"));
      objc_msgSend(v21, "recordSessionStart:transport:reason:isReciprocal:", v23, 2, 2, 0);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sessionID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase lastRapportSyncDate](self->_database, "lastRapportSyncDate"));
      objc_msgSend(v21, "recordSessionEnd:lastSyncDate:", v24, v25);

      -[BMSyncDatabase clearCachedStatements](self->_database, "clearCachedStatements");
      if (v9)
        (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, &__NSArray0__struct, 0);

    }
    goto LABEL_18;
  }
  v14 = __biome_log_for_category(11);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to perform Rapport sync now, because database is not currently accessible", buf, 2u);
  }

  v16 = -[BMSyncDatabase state](self->_database, "state");
  if (v9)
  {
    if (v16 == 2)
      v17 = 2;
    else
      v17 = 3;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", BMSyncErrorDomain, v17, 0));
    v30 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v18);

LABEL_18:
  }
  objc_autoreleasePoolPop(v10);

}

- (void)syncRapportNowIfPolicyAllowsWithDevices:(id)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  id v10;
  _xpc_activity_s *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  BMRapportSyncEngine *rapportSyncEngine;
  uint64_t v17;
  NSObject *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[16];
  id v33;

  v10 = a3;
  v11 = (_xpc_activity_s *)a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13 = objc_autoreleasePoolPush();
  if (-[BMSyncDatabase open](self->_database, "open"))
  {
    v14 = (id)os_transaction_create("com.apple.biome.syncNowWithDevices");
    if (-[BMSyncScheduler canPerformRapportSyncWithReason:](self, "canPerformRapportSyncWithReason:", a4))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[BMSyncDatabase setLastRapportSyncAttemptDate:](self->_database, "setLastRapportSyncAttemptDate:", v15);

      if (v11)
        xpc_activity_set_state(v11, 4);
      -[BMRapportSyncEngine startClient](self->_rapportSyncEngine, "startClient");
      rapportSyncEngine = self->_rapportSyncEngine;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100034EDC;
      v29[3] = &unk_1000697F8;
      v29[4] = self;
      v14 = v14;
      v30 = v14;
      v31 = v12;
      -[BMRapportSyncEngine syncNowWithDevices:reason:activity:completionHandler:](rapportSyncEngine, "syncNowWithDevices:reason:activity:completionHandler:", v10, a4, v11, v29);

    }
    else
    {
      v22 = __biome_log_for_category(11);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "skipping filtered rapport sync", buf, 2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine metricsCollector](self->_rapportSyncEngine, "metricsCollector"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sessionContext"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sessionID"));
      objc_msgSend(v24, "recordSessionStart:transport:reason:isReciprocal:", v26, 2, 2, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sessionID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase lastRapportSyncDate](self->_database, "lastRapportSyncDate"));
      objc_msgSend(v24, "recordSessionEnd:lastSyncDate:", v27, v28);

      -[BMSyncDatabase clearCachedStatements](self->_database, "clearCachedStatements");
      if (v12)
        (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, &__NSArray0__struct, 0);

    }
    goto LABEL_18;
  }
  v17 = __biome_log_for_category(11);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Unable to perform filtered Rapport sync now, because database is not currently accessible", buf, 2u);
  }

  v19 = -[BMSyncDatabase state](self->_database, "state");
  if (v12)
  {
    if (v19 == 2)
      v20 = 2;
    else
      v20 = 3;
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", BMSyncErrorDomain, v20, 0));
    v33 = v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v21);

LABEL_18:
  }
  objc_autoreleasePoolPop(v13);

}

- (BOOL)canPerformCloudKitSyncWithReason:(unint64_t)a3
{
  BOOL v3;
  double v5;
  double v6;
  OS_dispatch_queue *queue;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (a3 == 5)
    return 1;
  +[BMSyncPolicy minimumTimeBetweenSyncsForTransport:](BMSyncPolicy, "minimumTimeBetweenSyncsForTransport:", 3);
  v6 = v5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10003513C;
  v18 = sub_10003514C;
  v19 = 0;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100035154;
  v13[3] = &unk_100069670;
  v13[4] = self;
  v13[5] = &v14;
  dispatch_sync((dispatch_queue_t)queue, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v9 = v8;
  if (v15[5])
  {
    objc_msgSend(v8, "timeIntervalSinceDate:");
    v11 = v15[5] == 0;
  }
  else
  {
    v11 = 1;
    v10 = INFINITY;
  }
  v3 = v10 >= v6 * 0.9 || v11;

  _Block_object_dispose(&v14, 8);
  return v3;
}

- (void)syncCloudKitNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  _xpc_activity_s *v8;
  id v9;
  void *v10;
  OS_dispatch_queue *queue;
  id v12;
  void *v13;
  OS_dispatch_queue *v14;
  BMCloudKitSyncEngine *cloudKitSyncEngine;
  uint64_t v16;
  NSObject *v17;
  OS_dispatch_queue *v18;
  _QWORD v19[5];
  uint8_t buf[8];
  _QWORD v21[5];
  _xpc_activity_s *v22;
  id v23;
  id v24;
  unint64_t v25;
  _QWORD v26[5];
  _QWORD block[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v8 = (_xpc_activity_s *)a4;
  v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035414;
  block[3] = &unk_100069820;
  block[4] = self;
  v12 = v9;
  v28 = v12;
  v29 = &v30;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (!*((_BYTE *)v31 + 24))
  {
    v13 = (void *)os_transaction_create("com.apple.biome.syncNow");
    if (-[BMSyncScheduler canPerformCloudKitSyncWithReason:](self, "canPerformCloudKitSyncWithReason:", a3))
    {
      v14 = self->_queue;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10003556C;
      v26[3] = &unk_100068B38;
      v26[4] = self;
      dispatch_sync((dispatch_queue_t)v14, v26);
      if (v8)
        xpc_activity_set_state(v8, 4);
      cloudKitSyncEngine = self->_cloudKitSyncEngine;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000355C4;
      v21[3] = &unk_100069848;
      v21[4] = self;
      v25 = a3;
      v22 = v8;
      v23 = v13;
      v24 = v12;
      -[BMCloudKitSyncEngine startWithCompletionBlock:](cloudKitSyncEngine, "startWithCompletionBlock:", v21);

    }
    else
    {
      v16 = __biome_log_for_category(11);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "skipping cloudkit sync", buf, 2u);
      }

      v18 = self->_queue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000358C0;
      v19[3] = &unk_100068B38;
      v19[4] = self;
      dispatch_sync((dispatch_queue_t)v18, v19);
      if (v12)
        (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, &__NSArray0__struct, 0);
    }

  }
  _Block_object_dispose(&v30, 8);
  objc_autoreleasePoolPop(v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_peerStatusTracker, 0);
  objc_storeStrong((id *)&self->_cloudKitSyncEngine, 0);
  objc_storeStrong((id *)&self->_rapportSyncEngine, 0);
}

@end
