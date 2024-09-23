@implementation PFCoreAnalyticsChannel

- (void)sendEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEventLazy();
}

@end
