@implementation SBAnalyticsCoreAnalyticsEventHandler

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a4;
  NSStringFromAnalyticsEventType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "coreAnalyticsRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  return 1;
}

@end
