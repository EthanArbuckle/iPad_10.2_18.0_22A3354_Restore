@implementation MLRServiceConnection

- (MLRServiceConnection)initWithXPCConnection:(id)a3
{
  id v4;
  MLRServiceConnection *v5;
  void *v6;
  double v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  DESBundleRegistry *bundleRegistry;
  DESRecordStoreManager *v14;
  DESRecordStoreManager *recordStoreManager;
  MLRServiceConnection *v16;
  _QWORD *v17;
  MLRServiceConnection *v18;
  _QWORD v20[4];
  MLRServiceConnection *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MLRServiceConnection;
  v5 = -[MLRServiceConnection init](&v22, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    objc_msgSend(v6, "systemUptime");
    v5->_connectionStartTime = v7;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("MLRServiceConnection", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    objc_msgSend(v4, "_setQueue:", v5->_queue);
    objc_storeWeak((id *)&v5->_connection, v4);
    v12 = objc_claimAutoreleasedReturnValue(+[DESBundleRegistry sharedInstance](DESBundleRegistry, "sharedInstance"));
    bundleRegistry = v5->_bundleRegistry;
    v5->_bundleRegistry = (DESBundleRegistry *)v12;

    v14 = objc_opt_new(DESRecordStoreManager);
    recordStoreManager = v5->_recordStoreManager;
    v5->_recordStoreManager = v14;

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000B244;
    v20[3] = &unk_100018710;
    v16 = v5;
    v21 = v16;
    v17 = objc_retainBlock(v20);
    objc_msgSend(v4, "setInterruptionHandler:", v17);
    objc_msgSend(v4, "setInvalidationHandler:", v17);
    v18 = v16;

  }
  return v5;
}

- (void)fetchInstalledBundlesIdsWithCompletion:(id)a3
{
  NSXPCConnection **p_connection;
  void (**v5)(_QWORD);
  id WeakRetained;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  p_connection = &self->_connection;
  v5 = (void (**)(_QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  v7 = +[DESServiceAccess hasToolEntitlement:](DESServiceAccess, "hasToolEntitlement:", WeakRetained);

  if ((v7 & 1) != 0)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[DESBundleRegistry allBundleIds](self->_bundleRegistry, "allBundleIds"));
    v5[2](v5);

  }
  else
  {
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("fetchInstalledBundlesIdsWithCompletion may only be called by des_tool");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, v8));
    ((void (*)(void (**)(_QWORD), _QWORD, void *))v5[2])(v5, 0, v9);

  }
}

- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6
{
  id v7;
  uint64_t v8;
  id v9;

  if (a6)
  {
    v7 = a6;
    v8 = DESLogAndReturnSunsetError();
    v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    (*((void (**)(id, _QWORD, id))a6 + 2))(v7, 0, v9);

  }
}

- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  if (a4)
  {
    v5 = a4;
    v6 = DESLogAndReturnSunsetError();
    v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v7);

  }
}

- (void)fetchRecordsForBundleId:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  if (a4)
  {
    v5 = a4;
    v6 = DESLogAndReturnSunsetError();
    v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))a4 + 2))(v5, 0, 0, 0, v7);

  }
}

- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  unsigned __int8 v9;
  id v10;
  DESRecordStoreManager *recordStoreManager;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v14 = 0;
  v9 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:](DESServiceAccess, "hasRecordAccessToBundleId:connection:error:", v6, WeakRetained, &v14);
  v10 = v14;

  if ((v9 & 1) != 0)
  {
    recordStoreManager = self->_recordStoreManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000BBA4;
    v12[3] = &unk_100018968;
    v12[4] = self;
    v13 = v7;
    -[DESRecordStoreManager deleteAllSavedRecordsForBundleId:completion:](recordStoreManager, "deleteAllSavedRecordsForBundleId:completion:", v6, v12);

  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v10);
  }

}

- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  unsigned __int8 v12;
  id v13;
  DESRecordStoreManager *recordStoreManager;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v17 = 0;
  v12 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:](DESServiceAccess, "hasRecordAccessToBundleId:connection:error:", v8, WeakRetained, &v17);
  v13 = v17;

  if ((v12 & 1) != 0)
  {
    recordStoreManager = self->_recordStoreManager;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000BD60;
    v15[3] = &unk_100018968;
    v15[4] = self;
    v16 = v10;
    -[DESRecordStoreManager deleteSavedRecordForBundleId:identfier:completion:](recordStoreManager, "deleteSavedRecordForBundleId:identfier:completion:", v8, v9, v15);

  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v13);
  }

}

- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  if (a4)
  {
    v5 = a4;
    v6 = DESLogAndReturnSunsetError();
    v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v7);

  }
}

- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD, void *);
  id v8;
  id WeakRetained;
  unsigned __int8 v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v7 = (void (**)(id, _QWORD, void *))a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v15 = 0;
  v10 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:](DESServiceAccess, "hasRecordAccessToBundleId:connection:error:", v8, WeakRetained, &v15);

  v11 = v15;
  if ((v10 & 1) != 0)
  {
    if (v7)
    {
      v12 = DESLogAndReturnSunsetError();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v7[2](v7, 0, v13);

    }
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Uh oh %@", buf, 0xCu);
    }

    v7[2](v7, 0, v11);
  }

}

- (void)runEvaluationForBundleId:(id)a3 recipePath:(id)a4 recordUUIDs:(id)a5 attachments:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8
{
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  unsigned __int8 v15;
  id v16;
  DESSandBoxManager *v17;
  DESSandBoxManager *sandBoxExtension;
  DESSandBoxManager *v19;
  unsigned __int8 v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;

  v11 = a7;
  v12 = a8;
  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v25 = 0;
  v15 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:](DESServiceAccess, "hasRecordAccessToBundleId:connection:error:", v13, WeakRetained, &v25);

  v16 = v25;
  if ((v15 & 1) != 0)
  {
    v17 = (DESSandBoxManager *)objc_msgSend(objc_alloc((Class)DESSandBoxManager), "initWithExtensions:", v11);
    sandBoxExtension = self->_sandBoxExtension;
    self->_sandBoxExtension = v17;

    v19 = self->_sandBoxExtension;
    v24 = v16;
    v20 = -[DESSandBoxManager consumeExtensionsWithError:](v19, "consumeExtensionsWithError:", &v24);
    v21 = v24;

    if ((v20 & 1) != 0)
    {
      v22 = DESLogAndReturnSunsetError();
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, 0, v23);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v12 + 2))(v12, 0, 0, 0, v21);
    }
    v16 = v21;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v12 + 2))(v12, 0, 0, 0, v16);
  }

}

- (void)runLiveEvaluationForBundleId:(id)a3 taskSource:(int64_t)a4 baseURL:(id)a5 localeIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  unsigned __int8 v17;
  id v18;
  MLRTaskScheduler *v19;
  MLRSchedulingTask *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  MLRSchedulingTask *v25;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v24 = 0;
  v17 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:](DESServiceAccess, "hasRecordAccessToBundleId:connection:error:", v12, WeakRetained, &v24);
  v18 = v24;
  if ((v17 & 1) != 0)
  {
    v19 = -[MLRTaskScheduler initWithBaseURL:localeIdentifier:fromDesTool:]([MLRTaskScheduler alloc], "initWithBaseURL:localeIdentifier:fromDesTool:", v13, v14, WeakRetained != 0);
    v20 = -[MLRSchedulingTask initWithBundleIdentifier:taskSource:]([MLRSchedulingTask alloc], "initWithBundleIdentifier:taskSource:", v12, a4);
    v25 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000C2E0;
    v22[3] = &unk_100018670;
    v22[4] = self;
    v23 = v15;
    -[MLRTaskScheduler startTasks:completion:](v19, "startTasks:completion:", v21, v22);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v15 + 2))(v15, 0, v18);
  }

}

- (void)runLiveEvaluationForAllBundlesWithBaseURL:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  MLRTaskScheduler *v14;
  _QWORD v15[4];
  id v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if ((+[DESServiceAccess hasToolEntitlement:](DESServiceAccess, "hasToolEntitlement:", WeakRetained) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[DESBundleRegistry sharedInstance](DESBundleRegistry, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allUnrestrictedBundleIds"));

    v14 = -[MLRTaskScheduler initWithBaseURL:localeIdentifier:fromDesTool:]([MLRTaskScheduler alloc], "initWithBaseURL:localeIdentifier:fromDesTool:", v8, v9, WeakRetained != 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000C580;
    v15[3] = &unk_100018618;
    v16 = v10;
    -[MLRTaskScheduler startTasksForPluginIDs:completion:](v14, "startTasksForPluginIDs:completion:", v13, v15);

  }
  else
  {
    v17 = NSLocalizedDescriptionKey;
    v18 = CFSTR("runLiveEvaluationForAllBundles may only be called by des_tool");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v14 = (MLRTaskScheduler *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, v13));
    (*((void (**)(id, MLRTaskScheduler *))v10 + 2))(v10, v14);
  }

}

- (void)fetchTelemetryForBundleId:(id)a3 completion:(id)a4
{
  NSXPCConnection **p_connection;
  void (**v5)(id, _QWORD);
  id WeakRetained;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  p_connection = &self->_connection;
  v5 = (void (**)(id, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  v7 = +[DESServiceAccess hasToolEntitlement:](DESServiceAccess, "hasToolEntitlement:", WeakRetained);

  if ((v7 & 1) != 0)
  {
    v8 = DESLogAndReturnSunsetError();
    v11 = (id)objc_claimAutoreleasedReturnValue(v8);
    v5[2](v5, 0);

  }
  else
  {
    v12 = NSLocalizedDescriptionKey;
    v13 = CFSTR("fetchTelemetryForBundleId may only be called by des_tool");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, v9));
    ((void (*)(void (**)(id, _QWORD), _QWORD, void *))v5[2])(v5, 0, v10);

  }
}

- (void)setValue:(id)a3 forInfoKey:(id)a4 bundleID:(id)a5 completion:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)wakeUpWithCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)debugInfoStringForPluginID:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  v9 = objc_msgSend(objc_alloc((Class)DESDebugRecord), "initFromStoreWithPluginID:taskSource:", v6, 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v7));
  v5[2](v5, v8);

}

- (void)donateJSONResult:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  id WeakRetained;
  unsigned __int8 v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSErrorUserInfoKey v21;
  id v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v12 = +[DESServiceAccess hasMLRCtlEntitlement:](DESServiceAccess, "hasMLRCtlEntitlement:", WeakRetained);

  if ((v12 & 1) != 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_10000CB90((uint64_t)v8, (uint64_t)v9, v13);

    v14 = objc_msgSend(objc_alloc((Class)MLRTrialDediscoTaskResult), "initWithJSONResult:identifier:", v8, v9);
    if (!v14)
    {
      v17 = kDESDistributedEvaluationErrorDomain;
      v21 = NSLocalizedDescriptionKey;
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown identifier = %@"), v9));
      v22 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v17, 1303, v18));
      v10[2](v10, v19);

      goto LABEL_8;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 280));
    v20 = 0;
    objc_msgSend(v14, "submitWithTRIClient:error:", v15, &v20);
    v16 = v20;

  }
  else
  {
    v23 = NSLocalizedDescriptionKey;
    v24 = CFSTR("donateJSONResult may only be called by internal tool.");
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, v14));
  }
  v10[2](v10, v16);
LABEL_8:

}

- (BOOL)taskIsDeferred
{
  return 0;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_sandBoxExtension, 0);
  objc_storeStrong((id *)&self->_recordStoreManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleRegistry, 0);
  objc_destroyWeak((id *)&self->_connection);
}

@end
