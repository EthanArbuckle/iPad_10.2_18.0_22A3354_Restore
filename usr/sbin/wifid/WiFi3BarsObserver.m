@implementation WiFi3BarsObserver

+ (id)sharedWiFi3BarsObserver
{
  void *v2;
  void *v3;

  v2 = objc_autoreleasePoolPush();
  if (qword_10026DC20 != -1)
    dispatch_once(&qword_10026DC20, &stru_100233238);
  v3 = (void *)qword_10026DC18;
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (void)fetch3BarsNetworksForLocation:(id)a3
{
  id v4;

  v4 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connectionToService, "remoteObjectProxyWithErrorHandler:", &stru_1002332C8);
  if (v4)
    objc_msgSend(v4, "fetch3BarsNetworksForLocation:", a3);
}

- (WiFi3BarsObserver)init
{
  WiFi3BarsObserver *v2;
  NSXPCConnection *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WiFi3BarsObserver;
  v2 = -[WiFi3BarsObserver init](&v7, "init");
  if (v2)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:", CFSTR("com.apple.wifi.ThreeBarsXPCService"));
    v2->_connectionToService = v3;
    if (v3)
    {
      -[NSXPCConnection setRemoteObjectInterface:](v2->_connectionToService, "setRemoteObjectInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___TBXPCServiceProtocol));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100168238;
      v6[3] = &unk_10022EEE8;
      v6[4] = v2;
      -[NSXPCConnection setInvalidationHandler:](v2->_connectionToService, "setInvalidationHandler:", v6);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100168300;
      v5[3] = &unk_10022EEE8;
      v5[4] = v2;
      -[NSXPCConnection setInterruptionHandler:](v2->_connectionToService, "setInterruptionHandler:", v5);
      -[NSXPCConnection resume](v2->_connectionToService, "resume");
      v2->_timerQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wifid.3BarsObserverTimer", 0);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connectionToService, "invalidate");
  dispatch_release((dispatch_object_t)self->_timerQueue);
  v3.receiver = self;
  v3.super_class = (Class)WiFi3BarsObserver;
  -[WiFi3BarsObserver dealloc](&v3, "dealloc");
}

- (void)_installDeferMonitorForActivity:(id)a3 proxy:(id)a4
{
  OS_dispatch_source *v7;
  NSObject *timer;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[7];
  _QWORD handler[5];

  v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_timerQueue);
  self->_timer = v7;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100168534;
  handler[3] = &unk_10022EEE8;
  handler[4] = self;
  dispatch_source_set_cancel_handler((dispatch_source_t)v7, handler);
  self->_activityStartTimestamp = +[NSDate date](NSDate, "date");
  timer = self->_timer;
  v9 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(timer, v9, 0x12A05F200uLL, 0x12A05F200uLL);
  v10 = self->_timer;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100168564;
  v11[3] = &unk_100232518;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a3;
  dispatch_source_set_event_handler(v10, v11);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)run3BarsObserver:(void *)a3 withActivity:(id)a4 withCompletion:(id)a5
{
  id *v9;
  NSXPCConnection *connectionToService;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  _QWORD v15[5];

  if (!sub_10008C218((uint64_t)a3))
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: availability engine is not enabled", "-[WiFi3BarsObserver run3BarsObserver:withActivity:withCompletion:]");
    v9 = 0;
LABEL_13:
    objc_autoreleasePoolPop(v13);
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
    if (!v9)
      return;
    goto LABEL_6;
  }
  v9 = sub_1000063A4((id *)a3);
  if (!sub_1000A14B8((uint64_t)a3, (uint64_t)v9))
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: location not valid", "-[WiFi3BarsObserver run3BarsObserver:withActivity:withCompletion:]");
    goto LABEL_13;
  }
  connectionToService = self->_connectionToService;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100168874;
  v15[3] = &unk_100233260;
  v15[4] = a5;
  v11 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connectionToService, "remoteObjectProxyWithErrorHandler:", v15);
  if (v11)
  {
    v12 = v11;
    -[WiFi3BarsObserver _installDeferMonitorForActivity:proxy:](self, "_installDeferMonitorForActivity:proxy:", a4, v11);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001688EC;
    v14[3] = &unk_100233288;
    v14[4] = self;
    v14[5] = a5;
    objc_msgSend(v12, "maintenanceTask:location:predictedForDuration:maxPredictedLocations:completionHandler:", 104857600, v9, 1, v14, 86400.0);
  }
  if (v9)
LABEL_6:
    CFRelease(v9);
}

- (void)_cleanupMaintenanceTask
{
  void *v3;
  NSObject *timer;

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: cleaning maintenance task", "-[WiFi3BarsObserver _cleanupMaintenanceTask]");
  objc_autoreleasePoolPop(v3);
  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
}

- (void)prune3BarsNetworks:(unint64_t)a3
{
  id v4;

  v4 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connectionToService, "remoteObjectProxyWithErrorHandler:", &stru_1002332E8);
  if (v4)
    objc_msgSend(v4, "prune3BarsNetworks:", a3);
}

- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4
{
  id v6;

  v6 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connectionToService, "remoteObjectProxyWithErrorHandler:", &stru_100233308);
  if (v6)
    objc_msgSend(v6, "forceFetch3BarsNetworkMatchingBSSID:completionHandler:", a3, a4);
}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  self->_timer = (OS_dispatch_source *)a3;
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimerQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
