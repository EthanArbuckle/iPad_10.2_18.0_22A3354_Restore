@implementation FRArticleNotificationPersonalizer

- (FRArticleNotificationPersonalizer)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRArticleNotificationPersonalizer init]";
    v7 = 2080;
    v8 = "FRArticleNotificationPersonalizer.m";
    v9 = 1024;
    v10 = 45;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRArticleNotificationPersonalizer init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FRArticleNotificationPersonalizer)initWithAppConfigurationManager:(id)a3 feedPersonalizerFactory:(id)a4
{
  id v7;
  id v8;
  FRArticleNotificationPersonalizer *v9;
  FRArticleNotificationPersonalizer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10001AFD8();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10001AF10();
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRArticleNotificationPersonalizer;
  v9 = -[FRArticleNotificationPersonalizer init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_feedPersonalizerFactory, a4);
  }

  return v10;
}

- (void)sortItems:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[5];
  _QWORD v32[4];
  NSObject *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)FCFileCoordinatedTodayPrivateDataTransactionQueue);
  v9 = FCURLForTodayPrivateDataTransactionQueue();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v8, "initWithFileURL:", v10);

  v12 = objc_alloc((Class)FCFileCoordinatedTodayDropbox);
  v13 = FCURLForTodayDropbox();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = objc_msgSend(v12, "initWithFileURL:", v14);

  v16 = objc_msgSend(objc_alloc((Class)FCReadablePrivateDataStorage), "initWithDropbox:transactionQueue:", v15, v11);
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_100003880;
  v37[4] = sub_100003890;
  v38 = 0;
  v17 = dispatch_group_create();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_100003880;
  v35[4] = sub_100003890;
  v36 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationPersonalizer appConfigurationManager](self, "appConfigurationManager"));
  dispatch_group_enter(v17);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100003898;
  v32[3] = &unk_100024AD8;
  v34 = v35;
  v19 = v17;
  v33 = v19;
  objc_msgSend(v18, "fetchAppConfigurationIfNeededWithCompletion:", v32);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000038D4;
  v31[3] = &unk_100024B00;
  v31[4] = v37;
  objc_msgSend(v16, "readPrivateDataSyncWithAccessor:", v31);
  v20 = FCDispatchQueueForQualityOfService(17);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100003908;
  v25[3] = &unk_100024B50;
  v25[4] = self;
  v26 = v18;
  v29 = v37;
  v30 = v35;
  v27 = v6;
  v28 = v7;
  v22 = v7;
  v23 = v6;
  v24 = v18;
  dispatch_group_notify(v19, v21, v25);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory
{
  return self->_feedPersonalizerFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedPersonalizerFactory, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
}

@end
