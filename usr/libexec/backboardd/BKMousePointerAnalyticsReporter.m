@implementation BKMousePointerAnalyticsReporter

- (BKMousePointerAnalyticsReporter)init
{
  BKMousePointerAnalyticsReporter *v2;
  uint64_t v3;
  NSCalendar *gregorianCalendar;
  dispatch_queue_t v5;
  OS_dispatch_queue *analyticsReportingQueue;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKMousePointerAnalyticsReporter;
  v2 = -[BKMousePointerAnalyticsReporter init](&v9, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
    gregorianCalendar = v2->_gregorianCalendar;
    v2->_gregorianCalendar = (NSCalendar *)v3;

    v5 = dispatch_queue_create("BKMousePointerAnalyticsReporter Core Analytics Queue", 0);
    analyticsReportingQueue = v2->_analyticsReportingQueue;
    v2->_analyticsReportingQueue = (OS_dispatch_queue *)v5;

    v2->_lastReportedPeriodicTriggerTime = BSContinuousMachTimeNow(v7);
  }
  return v2;
}

- (void)setMousePointerController:(id)a3
{
  BKMousePointerController *v5;
  BKMousePointerController *mousePointerController;
  BKMousePointerController *v7;
  BKMousePointerController *v8;

  v5 = (BKMousePointerController *)a3;
  mousePointerController = self->_mousePointerController;
  v8 = v5;
  if (mousePointerController != v5)
  {
    -[BKMousePointerController removeGlobalDevicePreferencesObserver:](mousePointerController, "removeGlobalDevicePreferencesObserver:", self);
    objc_storeStrong((id *)&self->_mousePointerController, a3);
    v7 = self->_mousePointerController;
    if (v7)
      -[BKMousePointerController addGlobalDevicePreferencesObserver:](v7, "addGlobalDevicePreferencesObserver:", self);
  }

}

- (void)evaluatePeriodicReportingTrigger
{
  void *v3;
  void *v4;
  NSObject *analyticsReportingQueue;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  if (BSContinuousMachTimeNow(self) - self->_lastReportedPeriodicTriggerTime > 86400.0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerController globalDevicePreferences](self->_mousePointerController, "globalDevicePreferences"));
    v4 = v3;
    if (v3)
    {
      analyticsReportingQueue = self->_analyticsReportingQueue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100024738;
      v7[3] = &unk_1000ECD80;
      v7[4] = self;
      v8 = v3;
      dispatch_async(analyticsReportingQueue, v7);
      self->_lastReportedPeriodicTriggerTime = BSContinuousMachTimeNow(v6);

    }
  }
}

- (void)availableDevicesDidChange
{
  void *v3;
  NSObject *analyticsReportingQueue;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerController globalDevicePreferences](self->_mousePointerController, "globalDevicePreferences"));
  analyticsReportingQueue = self->_analyticsReportingQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002472C;
  v6[3] = &unk_1000ECD80;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(analyticsReportingQueue, v6);

}

- (void)mousePointerGlobalDevicePreferencesDidChange:(id)a3
{
  id v4;
  NSObject *analyticsReportingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  analyticsReportingQueue = self->_analyticsReportingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002394C;
  v7[3] = &unk_1000ECD80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(analyticsReportingQueue, v7);

}

- (BKMousePointerController)mousePointerController
{
  return self->_mousePointerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mousePointerController, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_analyticsReportingQueue, 0);
}

@end
