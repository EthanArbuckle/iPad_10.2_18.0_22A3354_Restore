@implementation FRUserOnboardingOperation

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRUserOnboardingOperation cloudContext](self, "cloudContext"));

  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C844();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRUserOnboardingOperation analyticsController](self, "analyticsController"));

  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C798();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRUserOnboardingOperation presubscribeService](self, "presubscribeService"));

  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C6EC();
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  return !v6 && v5 != 0;
}

- (void)performOperation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[6];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000398A4;
  v24[3] = &unk_1000DB710;
  v24[4] = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NFPromise firstly:](NFPromise, "firstly:", v24));
  v3 = zalgo();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000398AC;
  v23[3] = &unk_1000DB738;
  v23[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "thenOn:then:", v17, v23));
  v5 = zalgo();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000398B4;
  v22[3] = &unk_1000DB738;
  v22[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "thenOn:then:", v6, v22));
  v8 = zalgo();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000398BC;
  v21[3] = &unk_1000DB760;
  v21[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "thenOn:then:", v9, v21));
  v11 = zalgo();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000398E8;
  v20[3] = &unk_1000DB738;
  v20[4] = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "thenOn:then:", v12, v20));
  v14 = zalgo();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100039908;
  v19[3] = &unk_1000DB788;
  v19[4] = self;
  v16 = objc_msgSend(v13, "errorOn:error:", v15, v19);

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRUserOnboardingOperation userOnboardingCompletionHandler](self, "userOnboardingCompletionHandler"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FRUserOnboardingOperation userOnboardingCompletionHandler](self, "userOnboardingCompletionHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRUserOnboardingOperation onboardingVersion](self, "onboardingVersion"));
    ((void (**)(_QWORD, id, id))v5)[2](v5, objc_msgSend(v6, "integerValue"), v7);

  }
}

- (id)_determineUserID
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100039A04;
  v3[3] = &unk_1000DB7B0;
  v3[4] = self;
  return objc_msgSend(objc_alloc((Class)NFPromise), "initWithResolver:", v3);
}

- (id)_refreshAppConfig
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100039BB4;
  v3[3] = &unk_1000DB7B0;
  v3[4] = self;
  return objc_msgSend(objc_alloc((Class)NFPromise), "initWithResolver:", v3);
}

- (id)_refreshOnboardingVersion
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100039DB8;
  v3[3] = &unk_1000DB7B0;
  v3[4] = self;
  return objc_msgSend(objc_alloc((Class)NFPromise), "initWithResolver:", v3);
}

- (id)_presubscribe
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRUserOnboardingOperation cloudContext](self, "cloudContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "onboardingVersionNumber"));
  v6 = objc_msgSend(v5, "integerValue");

  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003A03C;
    v11[3] = &unk_1000DB710;
    v11[4] = self;
    v7 = sub_10003A03C((uint64_t)v11);
    v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003A110;
    v10[3] = &unk_1000DB7B0;
    v10[4] = self;
    v8 = objc_msgSend(objc_alloc((Class)NFPromise), "initWithResolver:", v10);
  }
  return v8;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (FRAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (void)setAnalyticsController:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsController, a3);
}

- (FRPresubscribeService)presubscribeService
{
  return self->_presubscribeService;
}

- (void)setPresubscribeService:(id)a3
{
  objc_storeStrong((id *)&self->_presubscribeService, a3);
}

- (id)userOnboardingCompletionHandler
{
  return self->_userOnboardingCompletionHandler;
}

- (void)setUserOnboardingCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)onboardingVersion
{
  return self->_onboardingVersion;
}

- (void)setOnboardingVersion:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingVersion, 0);
  objc_storeStrong(&self->_userOnboardingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_presubscribeService, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end
