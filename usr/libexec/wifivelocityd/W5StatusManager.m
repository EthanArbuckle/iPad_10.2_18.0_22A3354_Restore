@implementation W5StatusManager

- (id)__wifi
{
  W5WiFiInterface *v3;

  if (!self->_wifi)
  {
    v3 = -[W5WiFiInterface initWithCoreWiFiInterface:]([W5WiFiInterface alloc], "initWithCoreWiFiInterface:", self->_corewifi);
    self->_wifi = v3;
    if (v3)
    {
      -[W5StatusManager __setupCallbacks](self, "__setupCallbacks");
      if (self->_isMonitoringEvents)
        -[W5StatusManager startEventMonitoring](self, "startEventMonitoring");
    }
  }
  return self->_wifi;
}

- (W5WiFiInterface)wifi
{
  NSObject *queue;
  W5WiFiInterface *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_1000496A4;
  v10 = sub_1000496B4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000496C0;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (W5WiFiInterface *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__bluetooth
{
  W5BluetoothController *v3;

  if (!self->_bluetooth)
  {
    v3 = objc_alloc_init(W5BluetoothController);
    self->_bluetooth = v3;
    if (-[W5BluetoothController isAvailable](v3, "isAvailable"))
    {
      -[W5StatusManager __setupCallbacks](self, "__setupCallbacks");
      if (self->_isMonitoringEvents)
        -[W5StatusManager startEventMonitoring](self, "startEventMonitoring");
    }
  }
  return self->_bluetooth;
}

- (W5BluetoothController)bluetooth
{
  NSObject *queue;
  W5BluetoothController *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_1000496A4;
  v10 = sub_1000496B4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004981C;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (W5BluetoothController *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (W5StatusManager)init
{
  W5StatusManager *v2;
  NSObject *v3;
  NSOperationQueue *v4;
  NSMutableArray *v5;
  CWFInterface *v6;
  W5IOPowerManagement *v7;
  W5IOPowerSource *v8;
  NSMutableDictionary *v9;
  W5DatabaseManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)W5StatusManager;
  v2 = -[W5StatusManager init](&v12, "init");
  if (!v2)
    goto LABEL_12;
  v3 = dispatch_queue_create("com.apple.wifivelocity.status", 0);
  v2->_queue = (OS_dispatch_queue *)v3;
  if (!v3)
    goto LABEL_12;
  dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0);
  v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  v2->_concurrentQueue = v4;
  if (!v4)
    goto LABEL_12;
  -[NSOperationQueue setMaxConcurrentOperationCount:](v4, "setMaxConcurrentOperationCount:", -1);
  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v2->_eventHistory = v5;
  if (!v5)
    goto LABEL_12;
  +[CWFInterface setLogRedactionDisabled:](CWFInterface, "setLogRedactionDisabled:", 1);
  v6 = (CWFInterface *)objc_msgSend(objc_alloc((Class)CWFInterface), "initWithServiceType:", 1);
  v2->_corewifi = v6;
  -[CWFInterface resume](v6, "resume");
  v7 = objc_alloc_init(W5IOPowerManagement);
  v2->_pm = v7;
  if (!v7)
    goto LABEL_12;
  v8 = objc_alloc_init(W5IOPowerSource);
  v2->_ps = v8;
  if (v8
    && (v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary),
        (v2->_cachedStatusUUIDMap = v9) != 0)
    && ((v2->_bootArgs = (NSArray *)objc_msgSend(sub_10008EF88(), "copy"),
         !+[W5FeatureAvailability diagnosticsModeEnabled](W5FeatureAvailability, "diagnosticsModeEnabled"))
     || (v10 = +[W5DatabaseManager sharedObject](W5DatabaseManager, "sharedObject"),
         (v2->_databaseManager = v10) != 0)))
  {
    v2->_diagnosticsModeManager = 0;
    -[W5StatusManager __setupCallbacks](v2, "__setupCallbacks");
  }
  else
  {
LABEL_12:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  NSObject *forceUpdateTimer;
  NSObject *coalesceUpdateTimer;
  NSObject *queue;
  objc_super v6;

  forceUpdateTimer = self->_forceUpdateTimer;
  if (forceUpdateTimer)
  {
    dispatch_source_cancel(forceUpdateTimer);
    dispatch_release((dispatch_object_t)self->_forceUpdateTimer);
  }
  coalesceUpdateTimer = self->_coalesceUpdateTimer;
  if (coalesceUpdateTimer)
  {
    dispatch_source_cancel(coalesceUpdateTimer);
    dispatch_release((dispatch_object_t)self->_coalesceUpdateTimer);
  }

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v6.receiver = self;
  v6.super_class = (Class)W5StatusManager;
  -[W5StatusManager dealloc](&v6, "dealloc");
}

- (void)setUpdatedWiFiStatusCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedWiFiStatusCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100049B74;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedAWDLStatusCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedAWDLStatusCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100049C40;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedNetworkStatusCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedNetworkStatusCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100049D0C;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedBluetoothStatusCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedBluetoothStatusCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100049DD8;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedPowerStatusCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerStatusCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100049EA4;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedWiFiCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedWiFiCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100049F70;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedPowerManagementCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerManagementCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004A03C;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedPowerSourceCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerSourceCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004A108;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setLowBatteryCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_lowBatteryCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004A1D4;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedBluetoothCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedBluetoothCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004A2A0;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedFaultsCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedFaultsCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004A36C;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedLinkTestsCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedLinkTestsCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004A438;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedRecoveriesCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedRecoveriesCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004A504;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)queryStatusAndReply:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004A5A0;
  v4[3] = &unk_1000D5FC8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)status
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_1000496A4;
  v10 = sub_1000496B4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004A6BC;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)wifiStatus
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_1000496A4;
  v10 = sub_1000496B4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004A7C4;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)awdlStatus
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_1000496A4;
  v10 = sub_1000496B4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004A8CC;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)bluetoothStatus
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_1000496A4;
  v10 = sub_1000496B4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004A9D0;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)networkStatus
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_1000496A4;
  v10 = sub_1000496B4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004AAD4;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)powerStatus
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_1000496A4;
  v10 = sub_1000496B4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004ABD8;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)cachedStatusWithUUID:(id)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_1000496A4;
  v11 = sub_1000496B4;
  v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004ACE0;
  block[3] = &unk_1000D6AB0;
  block[4] = a3;
  block[5] = self;
  block[6] = &v7;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)clearCachedStatusWithUUID:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004ADB4;
  v4[3] = &unk_1000D5C48;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

- (id)eventHistory
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_1000496A4;
  v10 = sub_1000496B4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004AEB4;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startEventMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AF4C;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B010;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__forceUpdateTrigger
{
  OS_dispatch_source *v3;
  NSObject *forceUpdateTimer;
  dispatch_time_t v5;
  _QWORD handler[5];

  if (!self->_forceUpdateTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    self->_forceUpdateTimer = v3;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004B154;
    handler[3] = &unk_1000D5C98;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
    forceUpdateTimer = self->_forceUpdateTimer;
    v5 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(forceUpdateTimer, v5, 0x2540BE400uLL, 0);
    dispatch_resume((dispatch_object_t)self->_forceUpdateTimer);
  }
}

- (void)__updateStatusCoalesce
{
  OS_dispatch_source *v3;
  NSObject *coalesceUpdateTimer;
  dispatch_time_t v5;
  _QWORD handler[5];

  if (!self->_coalesceUpdateTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    self->_coalesceUpdateTimer = v3;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004B2F8;
    handler[3] = &unk_1000D5C98;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
    coalesceUpdateTimer = self->_coalesceUpdateTimer;
    v5 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(coalesceUpdateTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_coalesceUpdateTimer);
  }
}

- (int64_t)__airDropDiscoverableMode
{
  int64_t result;
  id v3;

  result = -[NSFileManager contentsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsAtPath:", CFSTR("/var/mobile/Library/Preferences/com.apple.sharingd.plist"));
  if (result)
  {
    v3 = objc_msgSend(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", result, 0, 0, 0), "objectForKey:", CFSTR("DiscoverableMode"));
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Contacts Only")) & 1) != 0)
    {
      return 1;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Everyone")))
    {
      return 2;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)__isSnifferSupported
{
  id v2;

  v2 = -[W5StatusManager __wifi](self, "__wifi");
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "isSnifferSupported");
  return (char)v2;
}

- (id)__queryPowerStatus
{
  id v3;

  v3 = objc_alloc_init((Class)W5PowerStatus);
  objc_msgSend(v3, "setPowerSourceType:", -[W5IOPowerSource powerSourceType](self->_ps, "powerSourceType"));
  objc_msgSend(v3, "setBatteryWarningLevel:", -[W5IOPowerSource batteryWarningLevel](self->_ps, "batteryWarningLevel"));
  -[W5IOPowerSource internalBatteryLevel](self->_ps, "internalBatteryLevel");
  objc_msgSend(v3, "setInternalBatteryLevel:");
  objc_msgSend(v3, "setPowerStateCaps:", -[W5IOPowerManagement caps](self->_pm, "caps"));
  return v3;
}

- (id)__queryAWDLStatus
{
  id v3;
  id v4;
  id v5;

  v3 = objc_alloc_init((Class)W5AWDLStatus);
  v4 = -[W5StatusManager __wifi](self, "__wifi");
  v5 = -[CWFInterface AWDL](self->_corewifi, "AWDL");
  objc_msgSend(v3, "setMacAddress:", objc_msgSend(v5, "MACAddress"));
  objc_msgSend(v3, "setHardwareMACAddress:", objc_msgSend(v5, "hardwareMACAddress"));
  objc_msgSend(v3, "setInterfaceName:", objc_msgSend(v5, "interfaceName"));
  objc_msgSend(v3, "setPower:", objc_msgSend(v5, "powerOn"));
  objc_msgSend(v3, "setIpv6Addresses:", objc_msgSend(v5, "IPv6Addresses"));
  objc_msgSend(v3, "setIsAWDLRealTimeMode:", objc_msgSend(v4, "isAWDLRealTimeMode"));
  objc_msgSend(v3, "setAwdlSyncEnabled:", -[CWFInterface AWDLSyncEnabled](self->_corewifi, "AWDLSyncEnabled"));
  objc_msgSend(v3, "setAwdlSyncState:", -[CWFInterface AWDLSyncState](self->_corewifi, "AWDLSyncState"));
  objc_msgSend(v3, "setAwdlSyncChannelSequence:", -[CWFInterface AWDLSyncChannelSequence](self->_corewifi, "AWDLSyncChannelSequence"));
  objc_msgSend(v3, "setAwdlStrategy:", -[CWFInterface AWDLStrategy](self->_corewifi, "AWDLStrategy"));
  objc_msgSend(v3, "setAwdlElectionParameters:", -[CWFInterface AWDLElectionParameters](self->_corewifi, "AWDLElectionParameters"));
  objc_msgSend(v3, "setAwdlMasterChannel:", -[CWFInterface AWDLMasterChannel](self->_corewifi, "AWDLMasterChannel"));
  objc_msgSend(v3, "setAwdlSecondaryMasterChannel:", -[CWFInterface AWDLSecondaryMasterChannel](self->_corewifi, "AWDLSecondaryMasterChannel"));
  objc_msgSend(v3, "setAwdlOpMode:", -[CWFInterface AWDLOpMode](self->_corewifi, "AWDLOpMode"));
  objc_msgSend(v3, "setAwdlSyncParameters:", -[CWFInterface AWDLSyncParameters](self->_corewifi, "AWDLSyncParameters"));
  objc_msgSend(v3, "setAwdlSidecarDiagnostics:", -[CWFInterface AWDLSidecarDiagnostics](self->_corewifi, "AWDLSidecarDiagnostics"));
  objc_msgSend(v3, "setAirDropDiscoverableMode:", -[W5StatusManager __airDropDiscoverableMode](self, "__airDropDiscoverableMode"));
  return v3;
}

- (id)__queryBluetoothStatus
{
  id v3;
  id v4;

  v3 = objc_alloc_init((Class)W5BluetoothStatus);
  v4 = -[W5StatusManager __bluetooth](self, "__bluetooth");
  objc_msgSend(v3, "setAddress:", objc_msgSend(v4, "address"));
  objc_msgSend(v3, "setPowerOn:", objc_msgSend(v4, "powerOn"));
  objc_msgSend(v3, "setIsDiscoverable:", objc_msgSend(v4, "isDiscoverable"));
  objc_msgSend(v3, "setIsConnectable:", objc_msgSend(v4, "isConnectable"));
  objc_msgSend(v3, "setIsScanning:", objc_msgSend(v4, "isScanning"));
  objc_msgSend(v3, "setDevices:", objc_msgSend(v4, "devices"));
  return v3;
}

- (id)__queryNetworkStatus
{
  id v3;

  v3 = objc_alloc_init((Class)W5NetworkStatus);
  objc_msgSend(v3, "setPrimaryIPv4InterfaceName:", -[CWFInterface globalIPv4InterfaceName](self->_corewifi, "globalIPv4InterfaceName"));
  objc_msgSend(v3, "setPrimaryIPv4ServiceName:", -[CWFInterface globalIPv4NetworkServiceName](self->_corewifi, "globalIPv4NetworkServiceName"));
  objc_msgSend(v3, "setPrimaryIPv4ServiceID:", -[CWFInterface globalIPv4NetworkServiceID](self->_corewifi, "globalIPv4NetworkServiceID"));
  objc_msgSend(v3, "setPrimaryIPv6InterfaceName:", -[CWFInterface globalIPv6InterfaceName](self->_corewifi, "globalIPv6InterfaceName"));
  objc_msgSend(v3, "setPrimaryIPv6ServiceName:", -[CWFInterface globalIPv6NetworkServiceName](self->_corewifi, "globalIPv6NetworkServiceName"));
  objc_msgSend(v3, "setPrimaryIPv6ServiceID:", -[CWFInterface globalIPv6NetworkServiceID](self->_corewifi, "globalIPv6NetworkServiceID"));
  objc_msgSend(v3, "setPrimaryIPv4Addresses:", -[CWFInterface globalIPv4Addresses](self->_corewifi, "globalIPv4Addresses"));
  objc_msgSend(v3, "setPrimaryIPv6Addresses:", -[CWFInterface globalIPv6Addresses](self->_corewifi, "globalIPv6Addresses"));
  objc_msgSend(v3, "setPrimaryIPv4Router:", -[CWFInterface globalIPv4RouterAddress](self->_corewifi, "globalIPv4RouterAddress"));
  objc_msgSend(v3, "setPrimaryIPv4Router:", -[CWFInterface globalIPv6RouterAddress](self->_corewifi, "globalIPv6RouterAddress"));
  objc_msgSend(v3, "setPrimaryDNSAddresses:", -[CWFInterface globalDNSServerAddresses](self->_corewifi, "globalDNSServerAddresses"));
  objc_msgSend(v3, "setIsAppleReachable:", -[CWFInterface reachabilityFlags](self->_corewifi, "reachabilityFlags"));
  return v3;
}

- (id)__queryDiagnosticsModes
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[NSArray filteredArrayUsingPredicate:](-[W5DiagnosticsModeManager allDiagnostics](self->_diagnosticsModeManager, "allDiagnostics"), "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.state >= %d AND SELF.state <= %d"), 3, 10));
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "timestampFor:", 3);
        if (v10
          && -[NSDateComponents day](-[NSCalendar components:fromDate:toDate:options:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "components:fromDate:toDate:options:", 16, v10, +[NSDate date](NSDate, "date"), 0), "day") <= 7)
        {
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)__queryWiFiStatusIncludingScanCache:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;

  v3 = a3;
  v5 = objc_alloc_init((Class)W5WiFiStatus);
  v6 = -[W5StatusManager __wifi](self, "__wifi");
  objc_msgSend(v5, "setMacAddress:", -[CWFInterface MACAddress](self->_corewifi, "MACAddress"));
  objc_msgSend(v5, "setHardwareMACAddress:", -[CWFInterface hardwareMACAddress](self->_corewifi, "hardwareMACAddress"));
  objc_msgSend(v5, "setCapabilities:", -[CWFInterface capabilities](self->_corewifi, "capabilities"));
  objc_msgSend(v5, "setInterfaceName:", -[CWFInterface interfaceName](self->_corewifi, "interfaceName"));
  objc_msgSend(v5, "setPowerOn:", -[CWFInterface powerOn](self->_corewifi, "powerOn"));
  objc_msgSend(v5, "setPower:", -[CWFInterface powerState](self->_corewifi, "powerState"));
  objc_msgSend(v5, "setOpMode:", -[CWFInterface opMode](self->_corewifi, "opMode"));
  objc_msgSend(v5, "setSsid:", -[CWFInterface SSID](self->_corewifi, "SSID"));
  objc_msgSend(v5, "setEapolControlMode:", -[CWFInterface EAP8021XControlMode](self->_corewifi, "EAP8021XControlMode"));
  objc_msgSend(v5, "setEapolSupplicantState:", -[CWFInterface EAP8021XSupplicantState](self->_corewifi, "EAP8021XSupplicantState"));
  objc_msgSend(v5, "setSsidString:", -[CWFInterface networkName](self->_corewifi, "networkName"));
  objc_msgSend(v5, "setBssid:", -[CWFInterface BSSID](self->_corewifi, "BSSID"));
  objc_msgSend(v5, "setSecurity:", objc_msgSend(v6, "security"));
  -[CWFInterface txRate](self->_corewifi, "txRate");
  objc_msgSend(v5, "setTxRate:");
  objc_msgSend(v5, "setRssi:", -[CWFInterface RSSI](self->_corewifi, "RSSI"));
  objc_msgSend(v5, "setCca:", -[CWFInterface CCA](self->_corewifi, "CCA"));
  objc_msgSend(v5, "setNoise:", -[CWFInterface noise](self->_corewifi, "noise"));
  objc_msgSend(v5, "setPhyMode:", -[CWFInterface PHYMode](self->_corewifi, "PHYMode"));
  objc_msgSend(v5, "setChannel:", objc_msgSend(v6, "channel"));
  objc_msgSend(v5, "setLinkQualityUpdates:", objc_msgSend(v6, "linkQualityUpdates"));
  objc_msgSend(v5, "setSupportedChannels:", objc_msgSend(v6, "supportedChannels"));
  objc_msgSend(v5, "setCountryCode:", -[CWFInterface countryCode](self->_corewifi, "countryCode"));
  objc_msgSend(v5, "setMcsIndex:", -[CWFInterface MCSIndex](self->_corewifi, "MCSIndex"));
  objc_msgSend(v5, "setGuardInterval:", -[CWFInterface guardInterval](self->_corewifi, "guardInterval"));
  objc_msgSend(v5, "setNumberOfSpacialStreams:", -[CWFInterface numberOfSpatialStreams](self->_corewifi, "numberOfSpatialStreams"));
  objc_msgSend(v5, "setNetworkServiceID:", -[CWFInterface networkServiceID](self->_corewifi, "networkServiceID"));
  objc_msgSend(v5, "setIpv4ConfigMethod:", objc_msgSend(v6, "ipv4ConfigMethod"));
  objc_msgSend(v5, "setIpv6ConfigMethod:", objc_msgSend(v6, "ipv6ConfigMethod"));
  objc_msgSend(v5, "setIpv4Addresses:", -[CWFInterface IPv4Addresses](self->_corewifi, "IPv4Addresses"));
  objc_msgSend(v5, "setIpv4RouterAddress:", -[CWFInterface IPv4RouterAddress](self->_corewifi, "IPv4RouterAddress"));
  objc_msgSend(v5, "setIpv6Addresses:", -[CWFInterface IPv6Addresses](self->_corewifi, "IPv6Addresses"));
  objc_msgSend(v5, "setIpv6RouterAddress:", -[CWFInterface IPv6RouterAddress](self->_corewifi, "IPv6RouterAddress"));
  objc_msgSend(v5, "setDnsAddresses:", -[CWFInterface DNSServerAddresses](self->_corewifi, "DNSServerAddresses"));
  objc_msgSend(v5, "setLastJoinedScanResult:", objc_msgSend(v6, "currentNetwork"));
  objc_msgSend(v5, "setLastJoinedPreferredNetwork:", objc_msgSend(v6, "currentPreferredNetwork"));
  objc_msgSend(v5, "setSmartCCADesenseSupported:", objc_msgSend(v6, "smartCCADesenseSupported"));
  objc_msgSend(v5, "setSmartCCADesenseUSBPresence:", objc_msgSend(v6, "smartCCADesenseUSBPresence"));
  objc_msgSend(v5, "setIsSnifferSupported:", -[W5StatusManager __isSnifferSupported](self, "__isSnifferSupported"));
  if (v3)
    objc_msgSend(v5, "setCachedScanResults:", objc_msgSend(v6, "scanCache:", 1));
  return v5;
}

- (id)__queryLastHourFaultsStatus
{
  return objc_msgSend(objc_alloc((Class)W5SummaryFaults), "initWithSummaryFaults:", -[W5DatabaseManager fetchLastHourFaults](self->_databaseManager, "fetchLastHourFaults"));
}

- (id)__queryLastHourLinkTestsStatus
{
  return objc_msgSend(objc_alloc((Class)W5SummaryLinkTests), "initWithSummaryLinkTests:", -[W5DatabaseManager fetchLastHourLinkTests](self->_databaseManager, "fetchLastHourLinkTests"));
}

- (id)__queryLastHourRecoveriesStatus
{
  return objc_msgSend(objc_alloc((Class)W5SummaryRecoveries), "initWithSummaryRecoveries:", -[W5DatabaseManager fetchLastHourRecoveries](self->_databaseManager, "fetchLastHourRecoveries"));
}

- (id)__queryStatusIncludingWiFiScanCache:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = objc_alloc_init((Class)W5Status);
  objc_msgSend(v5, "setWifi:", -[W5StatusManager __queryWiFiStatusIncludingScanCache:](self, "__queryWiFiStatusIncludingScanCache:", v3));
  objc_msgSend(v5, "setAwdl:", -[W5StatusManager __queryAWDLStatus](self, "__queryAWDLStatus"));
  objc_msgSend(v5, "setBluetooth:", -[W5StatusManager __queryBluetoothStatus](self, "__queryBluetoothStatus"));
  objc_msgSend(v5, "setNetwork:", -[W5StatusManager __queryNetworkStatus](self, "__queryNetworkStatus"));
  objc_msgSend(v5, "setDiagnosticsModes:", -[W5StatusManager __queryDiagnosticsModes](self, "__queryDiagnosticsModes"));
  objc_msgSend(v5, "setPower:", -[W5StatusManager __queryPowerStatus](self, "__queryPowerStatus"));
  objc_msgSend(v5, "setLastHrFaults:", -[W5StatusManager __queryLastHourFaultsStatus](self, "__queryLastHourFaultsStatus"));
  objc_msgSend(v5, "setLastHrLinkTests:", -[W5StatusManager __queryLastHourLinkTestsStatus](self, "__queryLastHourLinkTestsStatus"));
  objc_msgSend(v5, "setLastHrRecoveries:", -[W5StatusManager __queryLastHourRecoveriesStatus](self, "__queryLastHourRecoveriesStatus"));
  return v5;
}

- (void)__updateStatus
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  const char *v20;
  const __CFString *v21;
  id v22;
  const __CFString *v23;
  id v24;
  const __CFString *v25;
  id v26;
  const __CFString *v27;
  id v28;
  const __CFString *v29;
  id v30;
  const __CFString *v31;
  id v32;
  const __CFString *v33;
  id v34;
  const __CFString *v35;
  id v36;
  int v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;

  v3 = -[W5StatusManager __queryStatusIncludingWiFiScanCache:](self, "__queryStatusIncludingWiFiScanCache:", 0);
  if ((-[W5Status isEqual:](self->_updateStatus, "isEqual:", v3) & 1) == 0)
  {
    if ((objc_msgSend(-[W5Status wifi](self->_updateStatus, "wifi"), "isEqual:", objc_msgSend(v3, "wifi")) & 1) == 0&& self->_updatedWiFiStatusCallback)
    {
      v4 = sub_10008F56C();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        v39 = 2080;
        v40 = "W5StatusManager.m";
        v41 = 1024;
        v42 = 856;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v4, 0, "[wifivelocity] %s (%s:%u) WiFi status has changed, notifying clients", (const char *)&v37, v20, (_DWORD)v21);
      }
      v5 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v5, "setEventID:", 1);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v5, "setTimestamp:");
      v35 = CFSTR("WiFiStatus");
      v36 = objc_msgSend(v3, "wifi");
      objc_msgSend(v5, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
      (*((void (**)(void))self->_updatedWiFiStatusCallback + 2))();
    }
    if ((objc_msgSend(-[W5Status awdl](self->_updateStatus, "awdl"), "isEqual:", objc_msgSend(v3, "awdl")) & 1) == 0&& self->_updatedAWDLStatusCallback)
    {
      v6 = sub_10008F56C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        v39 = 2080;
        v40 = "W5StatusManager.m";
        v41 = 1024;
        v42 = 868;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) AWDL status has changed, notifying clients", (const char *)&v37, v20, (_DWORD)v21);
      }
      v7 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v7, "setEventID:", 2);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v7, "setTimestamp:");
      v33 = CFSTR("AWDLStatus");
      v34 = objc_msgSend(v3, "awdl");
      objc_msgSend(v7, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
      (*((void (**)(void))self->_updatedAWDLStatusCallback + 2))();
    }
    if ((objc_msgSend(-[W5Status network](self->_updateStatus, "network"), "isEqual:", objc_msgSend(v3, "network")) & 1) == 0&& self->_updatedNetworkStatusCallback)
    {
      v8 = sub_10008F56C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        v39 = 2080;
        v40 = "W5StatusManager.m";
        v41 = 1024;
        v42 = 880;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) Network status has changed, notifying clients", (const char *)&v37, v20, (_DWORD)v21);
      }
      v9 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v9, "setEventID:", 4);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v9, "setTimestamp:");
      v31 = CFSTR("NetworkStatus");
      v32 = objc_msgSend(v3, "network");
      objc_msgSend(v9, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      (*((void (**)(void))self->_updatedNetworkStatusCallback + 2))();
    }
    if ((objc_msgSend(-[W5Status bluetooth](self->_updateStatus, "bluetooth"), "isEqual:", objc_msgSend(v3, "bluetooth")) & 1) == 0&& self->_updatedBluetoothStatusCallback)
    {
      v10 = sub_10008F56C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        v39 = 2080;
        v40 = "W5StatusManager.m";
        v41 = 1024;
        v42 = 892;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) Bluetooth status has changed, notifying clients", (const char *)&v37, v20, (_DWORD)v21);
      }
      v11 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v11, "setEventID:", 3);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v11, "setTimestamp:");
      v29 = CFSTR("BluetoothStatus");
      v30 = objc_msgSend(v3, "bluetooth");
      objc_msgSend(v11, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
      (*((void (**)(void))self->_updatedBluetoothStatusCallback + 2))();
    }
    if ((objc_msgSend(-[W5Status power](self->_updateStatus, "power"), "isEqual:", objc_msgSend(v3, "power")) & 1) == 0&& self->_updatedPowerStatusCallback)
    {
      v12 = sub_10008F56C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        v39 = 2080;
        v40 = "W5StatusManager.m";
        v41 = 1024;
        v42 = 904;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) Power status has changed, notifying clients", (const char *)&v37, v20, (_DWORD)v21);
      }
      v13 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v13, "setEventID:", 5);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v13, "setTimestamp:");
      v27 = CFSTR("PowerStatus");
      v28 = objc_msgSend(v3, "power");
      objc_msgSend(v13, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
      (*((void (**)(void))self->_updatedPowerStatusCallback + 2))();
    }
    if ((objc_msgSend(-[W5Status lastHrFaults](self->_updateStatus, "lastHrFaults"), "isEqual:", objc_msgSend(v3, "lastHrFaults")) & 1) == 0&& self->_updatedFaultsCallback)
    {
      v14 = sub_10008F56C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        v39 = 2080;
        v40 = "W5StatusManager.m";
        v41 = 1024;
        v42 = 916;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) Last Hour Faults status has changed, notifying clients", (const char *)&v37, v20, (_DWORD)v21);
      }
      v15 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v15, "setEventID:", 39);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v15, "setTimestamp:");
      v25 = CFSTR("LastHourFaultsStatus");
      v26 = objc_msgSend(v3, "lastHrFaults");
      objc_msgSend(v15, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      (*((void (**)(void))self->_updatedFaultsCallback + 2))();
    }
    if ((objc_msgSend(-[W5Status lastHrLinkTests](self->_updateStatus, "lastHrLinkTests"), "isEqual:", objc_msgSend(v3, "lastHrLinkTests")) & 1) == 0&& self->_updatedLinkTestsCallback)
    {
      v16 = sub_10008F56C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        v39 = 2080;
        v40 = "W5StatusManager.m";
        v41 = 1024;
        v42 = 928;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) Last Hour Link Tests status has changed, notifying clients", (const char *)&v37, v20, (_DWORD)v21);
      }
      v17 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v17, "setEventID:", 40);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v17, "setTimestamp:");
      v23 = CFSTR("LastHourLinkTestsStatus");
      v24 = objc_msgSend(v3, "lastHrLinkTests");
      objc_msgSend(v17, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      (*((void (**)(void))self->_updatedLinkTestsCallback + 2))();
    }
    if ((objc_msgSend(-[W5Status lastHrRecoveries](self->_updateStatus, "lastHrRecoveries"), "isEqual:", objc_msgSend(v3, "lastHrRecoveries")) & 1) == 0&& self->_updatedRecoveriesCallback)
    {
      v18 = sub_10008F56C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136315650;
        v38 = "-[W5StatusManager __updateStatus]";
        v39 = 2080;
        v40 = "W5StatusManager.m";
        v41 = 1024;
        v42 = 940;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) Last Hour Recoveries status has changed, notifying clients", (const char *)&v37, v20, (_DWORD)v21);
      }
      v19 = objc_alloc_init((Class)W5Event);
      objc_msgSend(v19, "setEventID:", 41);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v19, "setTimestamp:");
      v21 = CFSTR("LastHourRecoveriesStatus");
      v22 = objc_msgSend(v3, "lastHrRecoveries");
      objc_msgSend(v19, "setInfo:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      (*((void (**)(void))self->_updatedRecoveriesCallback + 2))();
    }

    self->_updateStatus = (W5Status *)objc_msgSend(v3, "copy");
  }
}

- (void)__addEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_eventHistory, "addObject:", a3);
  if ((unint64_t)-[NSMutableArray count](self->_eventHistory, "count") >= 0x65)
    -[NSMutableArray removeObjectAtIndex:](self->_eventHistory, "removeObjectAtIndex:", 0);
}

- (void)addEvent:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004CA2C;
  v4[3] = &unk_1000D5C48;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)__setupCallbacks
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004CBC8;
  v10[3] = &unk_1000D6AD8;
  v10[4] = self;
  -[W5WiFiInterface setUpdatedWiFiCallback:](self->_wifi, "setUpdatedWiFiCallback:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004CC70;
  v9[3] = &unk_1000D6AD8;
  v9[4] = self;
  -[W5BluetoothController setUpdatedBluetoothCallback:](self->_bluetooth, "setUpdatedBluetoothCallback:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004CD18;
  v8[3] = &unk_1000D6AD8;
  v8[4] = self;
  -[W5IOPowerManagement setUpdatedPowerManagementCallback:](self->_pm, "setUpdatedPowerManagementCallback:", v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004CDC0;
  v7[3] = &unk_1000D6AD8;
  v7[4] = self;
  -[W5IOPowerSource setUpdatedPowerSourceCallback:](self->_ps, "setUpdatedPowerSourceCallback:", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004CE68;
  v6[3] = &unk_1000D6AD8;
  v6[4] = self;
  -[W5IOPowerSource setLowBatteryCallback:](self->_ps, "setLowBatteryCallback:", v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004CF10;
  v5[3] = &unk_1000D6AD8;
  v5[4] = self;
  -[W5DatabaseManager setUpdatedFaultsCallback:](self->_databaseManager, "setUpdatedFaultsCallback:", v5);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004CFB8;
  v4[3] = &unk_1000D6AD8;
  v4[4] = self;
  -[W5DatabaseManager setUpdatedLinkTestsCallback:](self->_databaseManager, "setUpdatedLinkTestsCallback:", v4);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004D060;
  v3[3] = &unk_1000D6AD8;
  v3[4] = self;
  -[W5DatabaseManager setUpdatedRecoveriesCallback:](self->_databaseManager, "setUpdatedRecoveriesCallback:", v3);
}

- (CWFInterface)corewifi
{
  return (CWFInterface *)objc_getProperty(self, a2, 80, 1);
}

- (W5WiFiInterface)awdl
{
  return (W5WiFiInterface *)objc_getProperty(self, a2, 64, 1);
}

- (W5WiFiInterface)nan
{
  return (W5WiFiInterface *)objc_getProperty(self, a2, 72, 1);
}

- (W5IOPowerManagement)pm
{
  return (W5IOPowerManagement *)objc_getProperty(self, a2, 104, 1);
}

- (W5IOPowerSource)ps
{
  return (W5IOPowerSource *)objc_getProperty(self, a2, 112, 1);
}

- (W5DatabaseManager)databaseManager
{
  return (W5DatabaseManager *)objc_getProperty(self, a2, 120, 1);
}

- (W5DiagnosticsModeManager)diagnosticsModeManager
{
  return (W5DiagnosticsModeManager *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDiagnosticsModeManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (id)updatedWiFiStatusCallback
{
  return self->_updatedWiFiStatusCallback;
}

- (id)updatedAWDLStatusCallback
{
  return self->_updatedAWDLStatusCallback;
}

- (id)updatedNetworkStatusCallback
{
  return self->_updatedNetworkStatusCallback;
}

- (id)updatedBluetoothStatusCallback
{
  return self->_updatedBluetoothStatusCallback;
}

- (id)updatedPowerStatusCallback
{
  return self->_updatedPowerStatusCallback;
}

- (id)updatedWiFiCallback
{
  return self->_updatedWiFiCallback;
}

- (id)updatedBluetoothCallback
{
  return self->_updatedBluetoothCallback;
}

- (id)updatedPowerManagementCallback
{
  return self->_updatedPowerManagementCallback;
}

- (id)updatedPowerSourceCallback
{
  return self->_updatedPowerSourceCallback;
}

- (id)lowBatteryCallback
{
  return self->_lowBatteryCallback;
}

- (id)updatedFaultsCallback
{
  return self->_updatedFaultsCallback;
}

- (id)updatedLinkTestsCallback
{
  return self->_updatedLinkTestsCallback;
}

- (id)updatedRecoveriesCallback
{
  return self->_updatedRecoveriesCallback;
}

- (NSOperationQueue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (NSArray)bootArgs
{
  return self->_bootArgs;
}

@end
