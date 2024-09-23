@implementation SBActionButtonMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v10;

  v5 = a4;
  v6 = a3 - 63;
  if (a3 - 63 <= 5)
  {
    NSStringFromAnalyticsEventType();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.springboard."), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v5;
    AnalyticsSendEventLazy();

  }
  return v6 < 6;
}

id __48__SBActionButtonMetric_handleEvent_withContext___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "eventPayload");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "coreAnalyticsRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
