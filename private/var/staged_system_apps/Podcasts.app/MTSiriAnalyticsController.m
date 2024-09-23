@implementation MTSiriAnalyticsController

- (MTSiriAnalyticsController)init
{
  MTSiriAnalyticsController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTSiriAnalyticsController;
  v2 = -[MTSiriAnalyticsController init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "playerRateChanged:", IMAVPlayerNotification_RateChanged, 0);

  }
  return v2;
}

- (void)observePlaybackStartEventForRefId:(id)a3
{
  id v4;

  v4 = a3;
  kdebug_trace(723517500, 0, 0, 0, 0);
  -[MTSiriAnalyticsController setPendingRequest:](self, "setPendingRequest:", v4);

}

- (void)playerRateChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  MTSiriAnalyticsController *v8;
  float v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = objc_opt_class(IMAVPlayer);
  v7 = objc_opt_class(v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = self;
    objc_sync_enter(v8);
    if (objc_msgSend(v5, "loadState") == (id)1)
    {
      objc_msgSend(v5, "actualRate");
      if (v9 > 0.0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSiriAnalyticsController pendingRequest](v8, "pendingRequest"));

        if (v10)
        {
          kdebug_trace(723517504, 0, 0, 0, 0);
          v17 = 0;
          v18 = &v17;
          v19 = 0x2050000000;
          v11 = (void *)qword_100567298;
          v20 = qword_100567298;
          if (!qword_100567298)
          {
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472;
            v16[2] = sub_10005D4B8;
            v16[3] = &unk_1004A6530;
            v16[4] = &v17;
            sub_10005D4B8((uint64_t)v16);
            v11 = (void *)v18[3];
          }
          v12 = objc_retainAutorelease(v11);
          _Block_object_dispose(&v17, 8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sharedAnalytics"));
          v21[0] = CFSTR("refId");
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTSiriAnalyticsController pendingRequest](v8, "pendingRequest"));
          v21[1] = CFSTR("bundleId");
          v22[0] = v14;
          v22[1] = kMTApplicationBundleIdentifier;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
          objc_msgSend(v13, "logEventWithType:context:", 2901, v15);

          -[MTSiriAnalyticsController setPendingRequest:](v8, "setPendingRequest:", 0);
        }
      }
    }
    objc_sync_exit(v8);

  }
}

- (NSString)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequest, 0);
}

@end
