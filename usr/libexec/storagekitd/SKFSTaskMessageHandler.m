@implementation SKFSTaskMessageHandler

- (SKFSTaskMessageHandler)initWithProgress:(id)a3 dispatchGroup:(id)a4
{
  id v7;
  id v8;
  SKFSTaskMessageHandler *v9;
  SKFSTaskMessageHandler *v10;
  NSError *error;
  NSObject *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SKFSTaskMessageHandler;
  v9 = -[SKFSTaskMessageHandler init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_progress, a3);
    objc_storeStrong((id *)&v10->_group, a4);
    error = v10->_error;
    v10->_error = 0;

    v10->_taskDone = 0;
    v12 = objc_claimAutoreleasedReturnValue(-[SKFSTaskMessageHandler group](v10, "group"));
    dispatch_group_enter(v12);

  }
  return v10;
}

- (NSError)error
{
  SKFSTaskMessageHandler *v2;
  NSError *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_error;
  objc_sync_exit(v2);

  return v3;
}

- (void)setError:(id)a3
{
  SKFSTaskMessageHandler *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v6)
    objc_storeStrong((id *)&v5->_error, a3);
  objc_sync_exit(v5);

}

- (void)completed:(id)a3 replyHandler:(id)a4
{
  __CFString *v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;

  v6 = (__CFString *)a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (-[SKFSTaskMessageHandler taskDone](self, "taskDone"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](SKBaseManager, "sharedManager"));
    objc_msgSend(v8, "logEvent:eventPayloadBuilder:", CFSTR("com.apple.StorageKit.log.fault"), &stru_1000456E8);

    v9 = sub_10000BA9C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKFSTaskMessageHandler taskID](self, "taskID"));
      v18 = 136315650;
      v19 = "-[SKFSTaskMessageHandler completed:replyHandler:]";
      v20 = 2112;
      v21 = (uint64_t)v11;
      v22 = 2112;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%s: Reached an extra completion callback for task %@, error %@", (uint8_t *)&v18, 0x20u);

    }
  }
  else
  {
    v12 = sub_10000BA9C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_claimAutoreleasedReturnValue(-[SKFSTaskMessageHandler taskID](self, "taskID"));
      v15 = (void *)v14;
      v16 = &stru_100046738;
      v18 = 136315650;
      v19 = "-[SKFSTaskMessageHandler completed:replyHandler:]";
      v20 = 2112;
      if (v6)
        v16 = v6;
      v21 = v14;
      v22 = 2112;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Task %@ done %@", (uint8_t *)&v18, 0x20u);

    }
    -[SKFSTaskMessageHandler setError:](self, "setError:", v6);
    v17 = objc_claimAutoreleasedReturnValue(-[SKFSTaskMessageHandler group](self, "group"));
    dispatch_group_leave(v17);

    self->_taskDone = 1;
  }
  v7[2](v7, 0, v6);

}

- (void)logMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKFSTaskMessageHandler progress](self, "progress"));
  objc_msgSend(v5, "setLocalizedAdditionalDescription:", v4);

}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
  (*((void (**)(id, const __CFString *, _QWORD))a4 + 2))(a4, &stru_100046738, 0);
}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (void)getLocalizationSetup:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  (*((void (**)(id, id, void *, _QWORD))a3 + 2))(v4, v6, v5, 0);

}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)taskDone
{
  return self->_taskDone;
}

- (NSUUID)taskID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTaskID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
