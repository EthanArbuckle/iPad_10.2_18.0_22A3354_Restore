@implementation WiFiNOIManager

+ (id)sharedWiFiNOIManagerWithQueue:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_opt_class(WiFiNOIManager);
  objc_sync_enter(v5);
  v6 = (id)qword_10026DBE0;
  if (!qword_10026DBE0)
  {
    v6 = objc_msgSend(objc_alloc((Class)a1), "initWithQueue:", a3);
    qword_10026DBE0 = (uint64_t)v6;
  }
  objc_sync_exit(v5);
  return v6;
}

- (WiFiNOIManager)initWithQueue:(id)a3
{
  WiFiNOIManager *v4;
  WiFiNOIManager *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NWNetworkOfInterestManager *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WiFiNOIManager;
  v4 = -[WiFiNOIManager init](&v15, "init");
  v5 = v4;
  if (!v4)
    goto LABEL_24;
  v4->_managerQueue = (OS_dispatch_queue *)a3;
  if (!a3)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: nil _managerQueue", "-[WiFiNOIManager initWithQueue:]");
    goto LABEL_23;
  }
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = dispatch_queue_create("com.apple.wifid.wifinoimanagerq", v6);
  v5->_dispatchQueue = (OS_dispatch_queue *)v7;
  if (!v7)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: nil _dispatchQueue", "-[WiFiNOIManager initWithQueue:]");
    goto LABEL_23;
  }
  v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  v5->_trackedHomeNetworks = v8;
  if (!v8)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _trackedHomeNetworks", "-[WiFiNOIManager initWithQueue:]");
    goto LABEL_23;
  }
  v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  v5->_trackedWorkNetworks = v9;
  if (!v9)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _trackedWorkNetworks", "-[WiFiNOIManager initWithQueue:]");
    goto LABEL_23;
  }
  v10 = (NWNetworkOfInterestManager *)objc_alloc_init((Class)NWNetworkOfInterestManager);
  v5->_noiManager = v10;
  if (!v10)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _noiManager", "-[WiFiNOIManager initWithQueue:]");
    goto LABEL_23;
  }
  -[NWNetworkOfInterestManager setQueue:](v10, "setQueue:", v5->_dispatchQueue);
  -[NWNetworkOfInterestManager setDelegate:](v5->_noiManager, "setDelegate:", v5);
  v5->_isTracking = 0;
  v5->_deviceClass = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0);
  v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v5->_sortedTopHomeNetworks = v11;
  if (!v11)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _sortedTopHomeNetworks", "-[WiFiNOIManager initWithQueue:]");
    goto LABEL_23;
  }
  v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v5->_sortedTopWorkNetworks = v12;
  if (!v12)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _sortedTopWorkNetworks", "-[WiFiNOIManager initWithQueue:]");
LABEL_23:
    objc_autoreleasePoolPop(v13);
LABEL_24:

    v5 = 0;
  }
  qword_10026DBE0 = (uint64_t)v5;
  return v5;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  NSMutableSet *trackedHomeNetworks;
  NSMutableSet *trackedWorkNetworks;
  objc_super v6;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);
  trackedHomeNetworks = self->_trackedHomeNetworks;
  if (trackedHomeNetworks)
  {
    -[NSMutableSet removeAllObjects](trackedHomeNetworks, "removeAllObjects");

  }
  trackedWorkNetworks = self->_trackedWorkNetworks;
  if (trackedWorkNetworks)
  {
    -[NSMutableSet removeAllObjects](trackedWorkNetworks, "removeAllObjects");

  }
  v6.receiver = self;
  v6.super_class = (Class)WiFiNOIManager;
  -[WiFiNOIManager dealloc](&v6, "dealloc");
}

- (void)asyncTrackNetworksOfInterest:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if ((self->_deviceClass | 2) == 3 && self->_isTracking != a3)
  {
    self->_isTracking = a3;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015A208;
    block[3] = &unk_10022EEE8;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (BOOL)setNetworkOfInterest:(__WiFiNetwork *)a3
{
  NSObject *dispatchQueue;
  BOOL v4;
  void *v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if ((self->_deviceClass | 2) != 3)
    return 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015A3D4;
    block[3] = &unk_100232A88;
    block[5] = &v8;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }
  else
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null network", "-[WiFiNOIManager setNetworkOfInterest:]");
    objc_autoreleasePoolPop(v6);
  }
  v4 = *((_BYTE *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)asyncScopeHomeNetworks
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015A604;
  block[3] = &unk_10022EEE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)asyncScopeWorkNetworks
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015A8AC;
  block[3] = &unk_10022EEE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)attemptHomeNetworkTransition:(id)a3
{
  NSObject *managerQueue;
  _QWORD block[5];

  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015AB54;
  block[3] = &unk_10022EEE8;
  block[4] = self;
  dispatch_async(managerQueue, block);
}

- (void)armHomeNetworkTransitionTimer:(__WiFiDeviceManager *)a3
{
  id v5;
  NSTimer *homeTransitionTimer;
  double v7;
  NSTimer *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_deviceClass != 7)
    return;
  if (!a3)
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: null manager", "-[WiFiNOIManager armHomeNetworkTransitionTimer:]");
    goto LABEL_15;
  }
  v5 = -[WiFiNOIManager copyHomeNetworkTransitionDate](self, "copyHomeNetworkTransitionDate");
  homeTransitionTimer = self->_homeTransitionTimer;
  v11 = v5;
  if (!homeTransitionTimer)
  {
    self->_deviceManager = a3;
    objc_msgSend(-[WiFiNOIManager getHomeNetworkNextTransitionDate:](self, "getHomeNetworkNextTransitionDate:", v5), "timeIntervalSinceNow");
    v8 = (NSTimer *)objc_msgSend(objc_alloc((Class)NSTimer), "initWithFireDate:interval:target:selector:userInfo:repeats:", v11, self, "attemptHomeNetworkTransition:", 0, 1, v7);
    self->_homeTransitionTimer = v8;
    if (v8)
    {
      -[NSRunLoop addTimer:forMode:](+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"), "addTimer:forMode:", self->_homeTransitionTimer, NSDefaultRunLoopMode);
      goto LABEL_8;
    }
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: _noiTransitionCheckTimer is NULL", "-[WiFiNOIManager armHomeNetworkTransitionTimer:]");
LABEL_15:
    objc_autoreleasePoolPop(v10);
    return;
  }
  -[NSTimer setFireDate:](homeTransitionTimer, "setFireDate:", v5);
LABEL_8:
  v9 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Armed NOI Transition Check Timer. Fire at %@", v11);
  objc_autoreleasePoolPop(v9);

}

- (void)disarmHomeNetworkTransitionTimer
{
  NSTimer *homeTransitionTimer;
  NSTimer **p_homeTransitionTimer;
  void *v4;

  if (self->_deviceClass == 7)
  {
    p_homeTransitionTimer = &self->_homeTransitionTimer;
    homeTransitionTimer = self->_homeTransitionTimer;
    if (homeTransitionTimer && -[NSTimer isValid](homeTransitionTimer, "isValid"))
    {
      -[NSTimer invalidate](*p_homeTransitionTimer, "invalidate");

      *p_homeTransitionTimer = 0;
      p_homeTransitionTimer[1] = 0;
    }
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Disarm NOI Transition Check Timer");
    objc_autoreleasePoolPop(v4);
  }
}

- (id)copyHomeNetworkTransitionDate
{
  NSDate *v3;
  NSCalendar *v4;
  NSDateComponents *v5;
  NSDateComponents *v6;
  NSDate *v7;
  NSDate *v8;
  NSDate *v9;
  void *v11;

  v3 = +[NSDate date](NSDate, "date");
  v4 = +[NSCalendar currentCalendar](NSCalendar, "currentCalendar");
  v5 = -[NSCalendar components:fromDate:](v4, "components:fromDate:", 25100, v3);
  if (!v5)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: null dateComponents", "-[WiFiNOIManager copyHomeNetworkTransitionDate]");
    goto LABEL_11;
  }
  v6 = v5;
  -[NSDateComponents setHour:](v5, "setHour:", 5);
  -[NSDateComponents setMinute:](v6, "setMinute:", 0);
  -[NSDateComponents setSecond:](v6, "setSecond:", 0);
  v7 = -[NSCalendar dateFromComponents:](v4, "dateFromComponents:", v6);
  if (!v7)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: null fireDate", "-[WiFiNOIManager copyHomeNetworkTransitionDate]");
LABEL_11:
    objc_autoreleasePoolPop(v11);
    return 0;
  }
  v8 = v7;
  if ((id)-[NSDate compare:](v7, "compare:", v3) != (id)1)
    v8 = -[WiFiNOIManager getHomeNetworkNextTransitionDate:](self, "getHomeNetworkNextTransitionDate:", v8);
  v9 = v8;
  return v8;
}

- (id)getHomeNetworkNextTransitionDate:(id)a3
{
  void *v4;
  NSCalendar *v5;
  id v6;
  NSDate *v7;

  v4 = objc_autoreleasePoolPush();
  v5 = +[NSCalendar currentCalendar](NSCalendar, "currentCalendar");
  v6 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v6, "setDay:", 1);
  v7 = -[NSCalendar dateByAddingComponents:toDate:options:](v5, "dateByAddingComponents:toDate:options:", v6, a3, 0);

  objc_autoreleasePoolPop(v4);
  return v7;
}

- (void)didStartTrackingNOI:(id)a3
{
  if (objc_msgSend(a3, "atHomeScopedNOI"))
  {
    -[NSMutableSet addObject:](self->_trackedHomeNetworks, "addObject:", a3);
    -[WiFiNOIManager asyncScopeHomeNetworks](self, "asyncScopeHomeNetworks");
  }
  if (objc_msgSend(a3, "atWorkScopedNOI"))
  {
    -[NSMutableSet addObject:](self->_trackedWorkNetworks, "addObject:", a3);
    -[WiFiNOIManager asyncScopeWorkNetworks](self, "asyncScopeWorkNetworks");
  }
}

- (void)didStopTrackingNOI:(id)a3
{
  if (objc_msgSend(a3, "atHomeScopedNOI"))
    -[NSMutableSet removeObject:](self->_trackedHomeNetworks, "removeObject:", a3);
  if (objc_msgSend(a3, "atWorkScopedNOI"))
    -[NSMutableSet removeObject:](self->_trackedWorkNetworks, "removeObject:", a3);
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  void *v5;
  NSMutableSet *trackedHomeNetworks;
  NSMutableSet *trackedWorkNetworks;

  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "didStopTrackingAllNOIs type %@", a3);
  objc_autoreleasePoolPop(v5);
  if (self->_isTracking)
  {
    self->_isTracking = 0;
    trackedHomeNetworks = self->_trackedHomeNetworks;
    if (trackedHomeNetworks)
    {
      -[NSMutableSet removeAllObjects](trackedHomeNetworks, "removeAllObjects");

      -[NSMutableArray removeAllObjects](self->_sortedTopHomeNetworks, "removeAllObjects");
    }
    trackedWorkNetworks = self->_trackedWorkNetworks;
    if (trackedWorkNetworks)
    {
      -[NSMutableSet removeAllObjects](trackedWorkNetworks, "removeAllObjects");

      -[NSMutableArray removeAllObjects](self->_sortedTopWorkNetworks, "removeAllObjects");
    }
    self->_trackedHomeNetworks = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_trackedWorkNetworks = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    -[WiFiNOIManager asyncTrackNetworksOfInterest:](self, "asyncTrackNetworksOfInterest:", 1);
  }
}

@end
