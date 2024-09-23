@implementation FMDALFailureAnalyticsManager

- (FMDALFailureAnalyticsManager)initWithProvider:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  dispatch_queue_t v9;

  v7 = a3;
  v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_provider, a3);
    objc_storeStrong((id *)&self->_context, a4);
    v9 = dispatch_queue_create("FMDALFailureAnalytics.serialQueue", 0);
    -[FMDALFailureAnalyticsManager setSerialQueue:](self, "setSerialQueue:", v9);

  }
  return self;
}

- (void)performAnalytics:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDALFailureAnalyticsManager serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B14F0;
  v7[3] = &unk_1002C13E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)dispatchAnalytics:(id)a3
{
  id v4;
  FMDServiceProvider *provider;
  void *v6;
  FMDActivationLockFailureAnalytics *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  FMDActingRequestDecorator *v13;
  id v14;
  FMDActingRequestDecorator *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void **v35;
  uint64_t v36;
  id (*v37)(uint64_t);
  void *v38;
  FMDALFailureAnalyticsManager *v39;
  void **v40;
  uint64_t v41;
  id (*v42)(uint64_t);
  void *v43;
  id v44;
  uint8_t buf[4];
  void *v46;

  v4 = a3;
  provider = self->_provider;
  if (provider)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](provider, "account"));

    if (v6)
    {
      v7 = [FMDActivationLockFailureAnalytics alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self->_provider, "account"));
      v9 = -[FMDActivationLockFailureAnalytics initWithAccountAndError:error:](v7, "initWithAccountAndError:error:", v8, v4);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ServerDeviceInfo sharedInstance](ServerDeviceInfo, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self->_provider, "account"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceInfoForAccount:", v11));

      v13 = [FMDActingRequestDecorator alloc];
      v39 = self;
      v40 = _NSConcreteStackBlock;
      v41 = 3221225472;
      v42 = sub_1000B17A8;
      v43 = &unk_1002C1D20;
      v44 = v12;
      v35 = _NSConcreteStackBlock;
      v36 = 3221225472;
      v37 = sub_1000B17B0;
      v38 = &unk_1002C1D20;
      v14 = v12;
      v15 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v13, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", &stru_1002C4D68, &v40, 0, &v35);
      -[NSObject setDecorator:](v9, "setDecorator:", v15, v35, v36, v37, v38, v39, v40, v41, v42, v43);
      -[NSObject setCompletionHandler:](v9, "setCompletionHandler:", &stru_1002C4D88);
      v16 = sub_10005326C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject fm_logID](v9, "fm_logID"));
        *(_DWORD *)buf = 138412290;
        v46 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@:     request to disable locations.", buf, 0xCu);

      }
      -[FMDServiceProvider enqueueRequest:](self->_provider, "enqueueRequest:", v9);

    }
    else
    {
      v27 = sub_10005326C();
      v9 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10022D5AC(v9, v28, v29, v30, v31, v32, v33, v34);
    }
  }
  else
  {
    v19 = sub_10005326C();
    v9 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10022D578(v9, v20, v21, v22, v23, v24, v25, v26);
  }

}

- (FMDServiceProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
