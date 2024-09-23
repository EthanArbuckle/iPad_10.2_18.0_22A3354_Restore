@implementation TBAnalytics

uint64_t __28__TBAnalytics_captureEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventDictionary");
}

+ (void)captureEvent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "eventName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    if (v3)
    {
      v6 = v3;
      AnalyticsSendEventLazy();

    }
    else
    {
      NSLog(CFSTR("%s: event is nil for event name %@"), "+[TBAnalytics captureEvent:]", v4);
    }
  }
  else
  {
    NSLog(CFSTR("%s: event name is nil"), "+[TBAnalytics captureEvent:]");
  }

}

@end
