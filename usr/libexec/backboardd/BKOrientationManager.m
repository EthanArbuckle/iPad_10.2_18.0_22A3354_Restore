@implementation BKOrientationManager

- (BKOrientationManager)init
{
  id v3;
  BKOrientationManager *v4;

  v3 = objc_alloc_init((Class)CMDeviceOrientationManager);
  v4 = -[BKOrientationManager _initWithDeviceOrientationManager:](self, "_initWithDeviceOrientationManager:", v3);

  return v4;
}

- (id)_initWithDeviceOrientationManager:(id)a3
{
  id v5;
  char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t Serial;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BKOrientationManager;
  v6 = -[BKOrientationManager init](&v25, "init");
  if (v6)
  {
    v7 = BSDispatchQueueCreateWithFixedPriority("com.apple.backboardd.orientationManager", 0, 53);
    v8 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v7;

    v9 = objc_alloc_init((Class)NSOperationQueue);
    v10 = (void *)*((_QWORD *)v6 + 14);
    *((_QWORD *)v6 + 14) = v9;

    objc_msgSend(*((id *)v6 + 14), "setUnderlyingQueue:", *((_QWORD *)v6 + 1));
    Serial = BSDispatchQueueCreateSerial(CFSTR("com.apple.backboardd.orientationManager.observerCallout"));
    v12 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = Serial;

    v13 = objc_claimAutoreleasedReturnValue(+[BSCompoundAssertion assertionWithIdentifier:](BSCompoundAssertion, "assertionWithIdentifier:", CFSTR("BKOrientationManagerObservers")));
    v14 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v13;

    *((_QWORD *)v6 + 9) = -1;
    *((_QWORD *)v6 + 10) = -1;
    *((_QWORD *)v6 + 11) = -1;
    *((_QWORD *)v6 + 12) = 0;
    *(_OWORD *)(v6 + 56) = xmmword_1000B3DA0;
    *((_QWORD *)v6 + 5) = 0xBFF0000000000000;
    *((_DWORD *)v6 + 12) = -1082130432;
    v15 = objc_alloc_init((Class)NSMutableDictionary);
    v16 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v15;

    v17 = BSDispatchQueueCreateWithQualityOfService("com.apple.backboardd.orientationManagerNotify", 0, 25, 0);
    v18 = (void *)*((_QWORD *)v6 + 18);
    *((_QWORD *)v6 + 18) = v17;

    sub_100019E0C((uint64_t)v6, 0.0);
    sub_100019F64((uint64_t)v6, 0.0);
    objc_storeStrong((id *)v6 + 15, a3);
    sub_10008A3A8(v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
    v6[104] = objc_msgSend(v19, "ignoreAccelerometerAndOrientationEvents");

    v20 = objc_alloc((Class)BKIOHIDServiceMatcher);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](BKHIDSystemInterface, "sharedInstance"));
    v22 = objc_msgSend(v20, "initWithUsagePage:usage:builtIn:dataProvider:", 65280, 3, 1, v21);
    v23 = (void *)*((_QWORD *)v6 + 17);
    *((_QWORD *)v6 + 17) = v22;

    objc_msgSend(*((id *)v6 + 17), "startObserving:queue:", v6, *((_QWORD *)v6 + 1));
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[BKIOHIDServiceMatcher invalidate](self->_queue_HIDServiceMatcher, "invalidate");
  -[BSCompoundAssertion invalidate](self->_observers, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)BKOrientationManager;
  -[BKOrientationManager dealloc](&v4, "dealloc");
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  NSObject *queue;
  BKIOHIDServiceMatcher *v7;
  BKIOHIDServiceMatcher *queue_HIDServiceMatcher;
  void *v9;
  id v10;

  v10 = a4;
  queue = self->_queue;
  v7 = (BKIOHIDServiceMatcher *)a3;
  dispatch_assert_queue_V2(queue);
  queue_HIDServiceMatcher = self->_queue_HIDServiceMatcher;

  if (queue_HIDServiceMatcher == v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    objc_storeStrong((id *)&self->_queue_HIDService, v9);

  }
}

- (void)serviceDidDisappear:(id)a3
{
  NSObject *queue;
  id v5;
  BKIOHIDService **p_queue_HIDService;
  BKIOHIDService *queue_HIDService;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  queue_HIDService = self->_queue_HIDService;
  p_queue_HIDService = &self->_queue_HIDService;
  LODWORD(queue) = objc_msgSend(v5, "isEqual:", queue_HIDService);

  if ((_DWORD)queue)
    objc_storeStrong((id *)p_queue_HIDService, 0);
}

- (void)_queue_postUpdatedRawAccelerometerDeviceOrientation:(int64_t)a3
{
  NSObject *notifyQueue;
  _QWORD v4[6];

  notifyQueue = self->_notifyQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008A2A4;
  v4[3] = &unk_1000ECB60;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(notifyQueue, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_queue_HIDServiceMatcher, 0);
  objc_storeStrong((id *)&self->_queue_HIDService, 0);
  objc_storeStrong((id *)&self->_queue_orientationManager, 0);
  objc_storeStrong((id *)&self->_queue_orientationManagerOperationQueue, 0);
  objc_storeStrong((id *)&self->_queue_processDeathWatchers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerCalloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
