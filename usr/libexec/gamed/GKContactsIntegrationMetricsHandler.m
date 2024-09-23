@implementation GKContactsIntegrationMetricsHandler

- (GKContactsIntegrationMetricsHandler)init
{
  void *v3;
  GKContactsIntegrationMetricsHandler *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](GKAMPController, "controller"));
  v4 = -[GKContactsIntegrationMetricsHandler initWithAMPController:](self, "initWithAMPController:", v3);

  return v4;
}

- (GKContactsIntegrationMetricsHandler)initWithAMPController:(id)a3
{
  id v5;
  GKContactsIntegrationMetricsHandler *v6;
  GKContactsIntegrationMetricsHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKContactsIntegrationMetricsHandler;
  v6 = -[GKContactsIntegrationMetricsHandler init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ampController, a3);

  return v7;
}

- (void)recordContactInfoMatchCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];

  v7[0] = GKMetricsEventType;
  v7[1] = CFSTR("contactInfoMatchCount");
  v8[0] = CFSTR("contactsIntegration");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationMetricsHandler ampController](self, "ampController"));
  objc_msgSend(v6, "reportPerformanceEventWithHostAppBundleId:metricsFields:", GKDaemonIdentifier, v5);

}

- (void)recordContactRelationshipsFromResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[4];
  _QWORD v22[4];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v21[0] = GKMetricsEventType;
    v21[1] = CFSTR("contactContainsFriendHandle");
    v22[0] = CFSTR("contactsIntegration");
    v22[1] = &__kCFBooleanFalse;
    v21[2] = CFSTR("contactContainsNonFriendHandle");
    v21[3] = CFSTR("contactContainsUnknownHandle");
    v22[2] = &__kCFBooleanFalse;
    v22[3] = &__kCFBooleanFalse;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 4));
    v6 = objc_msgSend(v5, "mutableCopy");

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11), "relationship", (_QWORD)v16);
          if (v12 <= 2)
            objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, off_1002C1B98[v12]);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsIntegrationMetricsHandler ampController](self, "ampController"));
    v14 = GKDaemonIdentifier;
    v15 = objc_msgSend(v6, "copy");
    objc_msgSend(v13, "reportPerformanceEventWithHostAppBundleId:metricsFields:", v14, v15);

  }
}

- (GKAMPController)ampController
{
  return self->_ampController;
}

- (void)setAmpController:(id)a3
{
  objc_storeStrong((id *)&self->_ampController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ampController, 0);
}

@end
