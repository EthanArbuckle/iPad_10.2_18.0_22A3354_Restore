@implementation FROnboardingDataManager

- (FROnboardingDataManager)initWithFeldsparContext:(id)a3
{
  id v5;
  FROnboardingDataManager *v6;
  FROnboardingDataManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FROnboardingDataManager;
  v6 = -[FROnboardingDataManager init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_feldsparContext, a3);

  return v7;
}

- (void)suspendLoadingFeed
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FROnboardingDataManager: suspendLoadingFeed", v3, 2u);
  }
}

- (void)beginFetchingUserType
{
  FRUserOnboardingOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v3 = objc_alloc_init(FRUserOnboardingOperation);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FROnboardingDataManager feldsparContext](self, "feldsparContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cloudContext"));
  -[FRUserOnboardingOperation setCloudContext:](v3, "setCloudContext:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FROnboardingDataManager feldsparContext](self, "feldsparContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "analyticsController"));
  -[FRUserOnboardingOperation setAnalyticsController:](v3, "setAnalyticsController:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FROnboardingDataManager feldsparContext](self, "feldsparContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presubscribeService"));
  -[FRUserOnboardingOperation setPresubscribeService:](v3, "setPresubscribeService:", v9);

  -[FRUserOnboardingOperation setQualityOfService:](v3, "setQualityOfService:", 25);
  -[FRUserOnboardingOperation setRelativePriority:](v3, "setRelativePriority:", 1);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100064278;
  v11[3] = &unk_1000DDDF8;
  v11[4] = self;
  -[FRUserOnboardingOperation setUserOnboardingCompletionHandler:](v3, "setUserOnboardingCompletionHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue fc_sharedConcurrentQueue](NSOperationQueue, "fc_sharedConcurrentQueue"));
  objc_msgSend(v10, "addOperation:", v3);

}

- (void)beginLoadingFeed
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  v3 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FROnboardingDataManager: beginLoadingFeed", buf, 2u);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100064528;
  v4[3] = &unk_1000D9758;
  v4[4] = self;
  FCPerformBlockOnMainThread(v4);
}

- (void)completeOnboarding
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FROnboardingDataManager: completedOnboarding", v7, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FROnboardingDataManager feldsparContext](self, "feldsparContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cloudContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  objc_msgSend(v6, "updateOnboardingVersion");

}

- (TSWelcomeDataManagerTypeDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (void)setFeldsparContext:(id)a3
{
  objc_storeStrong((id *)&self->_feldsparContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feldsparContext, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
