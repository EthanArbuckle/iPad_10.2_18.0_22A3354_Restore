@implementation CitySelectorAnalyticsManager

- (CitySelectorAnalyticsManager)init
{
  CitySelectorAnalyticsManager *v2;
  CitySelectorAnalyticsManager *v3;
  uint64_t v4;
  uint64_t v5;
  OS_dispatch_queue *utilityQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CitySelectorAnalyticsManager;
  v2 = -[CitySelectorAnalyticsManager init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->event.target = 27;
    v4 = geo_dispatch_queue_create_with_qos("CitySelectorAnalyticsManager.utilityQueue", 17);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    utilityQueue = v3->_utilityQueue;
    v3->_utilityQueue = (OS_dispatch_queue *)v5;

  }
  return v3;
}

- (void)citySelectorRevealed
{
  NSObject *utilityQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A236DC;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)logEvent
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", self->event.action, self->event.target, 0);
}

- (void)cleanUp
{
  self->event.action = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilityQueue, 0);
}

@end
