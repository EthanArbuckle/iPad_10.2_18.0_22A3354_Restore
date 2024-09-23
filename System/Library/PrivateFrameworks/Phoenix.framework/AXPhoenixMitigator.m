@implementation AXPhoenixMitigator

- (AXPhoenixMitigator)initWithDelegate:(id)a3 configuration:(id)a4
{
  AXPhoenixMitigator *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSMutableArray *v7;
  NSMutableArray *monitors;
  uint64_t v9;
  AXEventProcessor *eventProcessor;
  AXPhoenixMitigator *v12;
  AXPhoenixMitigator *v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t (*v18)(id *, void *);
  void *v19;
  id v20;
  id v21;
  objc_super v22;
  id v23;
  id location[2];
  AXPhoenixMitigator *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v4 = v25;
  v25 = 0;
  v22.receiver = v4;
  v22.super_class = (Class)AXPhoenixMitigator;
  v14 = -[AXPhoenixMitigator init](&v22, sel_init);
  v25 = v14;
  objc_storeStrong((id *)&v25, v14);
  if (v14)
  {
    objc_storeStrong((id *)&v25->_delegate, location[0]);
    v5 = dispatch_queue_create("Serial EventMonitor queue", 0);
    queue = v25->_queue;
    v25->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    monitors = v25->_monitors;
    v25->_monitors = v7;

    objc_storeStrong((id *)&v25->_configuration, v23);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE00620]), "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:", CFSTR("BackTapEventTap"), 36, 0, 0);
    eventProcessor = v25->_eventProcessor;
    v25->_eventProcessor = (AXEventProcessor *)v9;

    -[AXEventProcessor setHIDEventFilterMask:](v25->_eventProcessor, "setHIDEventFilterMask:", 1);
    objc_initWeak(&v21, v25);
    v15 = MEMORY[0x24BDAC760];
    v16 = -1073741824;
    v17 = 0;
    v18 = __53__AXPhoenixMitigator_initWithDelegate_configuration___block_invoke;
    v19 = &unk_24F18F108;
    objc_copyWeak(&v20, &v21);
    -[AXEventProcessor setHIDEventHandler:](v25->_eventProcessor, "setHIDEventHandler:", &v15);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v21);
  }
  v12 = v25;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v12;
}

uint64_t __53__AXPhoenixMitigator_initWithDelegate_configuration___block_invoke(id *a1, void *a2)
{
  uint64_t v2;
  __int16 v3;
  char v4;
  char v5;
  uint64_t v6;
  id v8;
  BOOL v9;
  char v11;
  id v12;
  id v13[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13[1] = a1;
  v13[0] = objc_loadWeakRetained(a1 + 4);
  if ((objc_msgSend(location[0], "isTouchDown") & 1) != 0)
  {
    v2 = mach_absolute_time();
    objc_msgSend(v13[0], "setTouchOn:timestamp:", 1, MachAbsoluteTimeToTimeIntervalSinceBoot(v2));
  }
  else
  {
    v8 = (id)objc_msgSend(location[0], "handInfo");
    v3 = objc_msgSend(v8, "initialFingerCount");
    if (v4 | (v3 == 0))
      v5 = 1;
    else
      v5 = 0;
    v11 = 0;
    v9 = 0;
    if ((v5 & 1) == 0)
    {
      v12 = (id)objc_msgSend(location[0], "handInfo");
      v11 = 1;
      v9 = (unsigned __int16)objc_msgSend(v12, "currentFingerCount") == 0;
    }
    if ((v11 & 1) != 0)

    if (v9)
    {
      v6 = mach_absolute_time();
      objc_msgSend(v13[0], "setTouchOn:timestamp:", 0, MachAbsoluteTimeToTimeIntervalSinceBoot(v6));
    }
  }
  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (void)startWithCompletion:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  id location[2];
  AXPhoenixMitigator *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v11, v13);
  queue = v13->_queue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __42__AXPhoenixMitigator_startWithCompletion___block_invoke;
  v8 = &unk_24F18F130;
  objc_copyWeak(&v10, &v11);
  v9 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(location, 0);
}

void __42__AXPhoenixMitigator_startWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  id location;
  id v7[3];
  uint64_t v8;
  const __CFString *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7[2] = (id)a1;
  v7[1] = (id)a1;
  v7[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7[0])
  {
    location = (id)AXLogBackTap();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)"-[AXPhoenixMitigator startWithCompletion:]_block_invoke");
      _os_log_impl(&dword_228CDB000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Subscribe to event monitors...", v10, 0xCu);
    }
    objc_storeStrong(&location, 0);
    objc_msgSend(v7[0], "_subscribeEventMonitors");
    objc_msgSend(*((id *)v7[0] + 6), "beginHandlingHIDEventsForReason:", CFSTR("BackTapEventTap"));
    *((_BYTE *)v7[0] + 40) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 32);
    v1 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0FC8];
    v9 = CFSTR("Nil instance starting mitigator");
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v3 = (id)objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("AXPhoenixErrorDomain"), 1001);
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);

  }
  objc_storeStrong(v7, 0);
}

- (void)stop
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8;
  id location[2];
  AXPhoenixMitigator *v10;

  v10 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  queue = v10->_queue;
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __26__AXPhoenixMitigator_stop__block_invoke;
  v7 = &unk_24F18F158;
  objc_copyWeak(&v8, location);
  dispatch_async(queue, &v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(location);
}

void __26__AXPhoenixMitigator_stop__block_invoke(id *a1)
{
  os_log_t oslog;
  id location[3];
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v3, (uint64_t)"-[AXPhoenixMitigator stop]_block_invoke");
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Unsubscribe to event monitors...", v3, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(location[0], "_unsubscribeEventMonitors");
    objc_msgSend(*((id *)location[0] + 6), "endHandlingHIDEventsForReason:", CFSTR("BackTapEventTap"));
    *((_BYTE *)location[0] + 40) = 0;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)isRunning
{
  NSObject *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10[2];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  AXPhoenixMitigator *v17;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  queue = self->_queue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __31__AXPhoenixMitigator_isRunning__block_invoke;
  v9 = &unk_24F18F180;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  v4 = *((_BYTE *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

uint64_t __31__AXPhoenixMitigator_isRunning__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40) & 1;
  return result;
}

- (void)shouldTriggerDoubleTapEventWithTapData:(id)a3 completion:(id)a4
{
  id location[2];
  AXPhoenixMitigator *v5;
  $01BB1521EC52D44A8E7628F5261DCEC8 v6;

  v6 = a3;
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  -[AXPhoenixMitigator _shouldTriggerEventWithTapData:isDoubleTap:completion:](v5, "_shouldTriggerEventWithTapData:isDoubleTap:completion:", 1, location[0], v6.var0, v6.var1, v6.var2, v6.var3);
  objc_storeStrong(location, 0);
}

- (void)shouldTriggerTripleTapEventWithTapData:(id)a3 completion:(id)a4
{
  id location[2];
  AXPhoenixMitigator *v5;
  $01BB1521EC52D44A8E7628F5261DCEC8 v6;

  v6 = a3;
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  -[AXPhoenixMitigator _shouldTriggerEventWithTapData:isDoubleTap:completion:](v5, "_shouldTriggerEventWithTapData:isDoubleTap:completion:", 0, location[0], v6.var0, v6.var1, v6.var2, v6.var3);
  objc_storeStrong(location, 0);
}

- (void)_shouldTriggerEventWithTapData:(id)a3 isDoubleTap:(BOOL)a4 completion:(id)a5
{
  double var2;
  id v6;
  BOOL v7;
  id v8;
  char v9;
  BOOL v10;
  BOOL v11;
  id location;
  BOOL v13;
  SEL v14;
  AXPhoenixMitigator *v15;
  $01BB1521EC52D44A8E7628F5261DCEC8 v16;

  v16 = a3;
  v15 = self;
  v14 = a2;
  v13 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v11 = 0;
  v11 = !-[AXPhoenixMitigatorConfiguration disableWhenDisplayOff](v15->_configuration, "disableWhenDisplayOff");
  v10 = 0;
  v10 = !-[AXPhoenixMitigatorConfiguration disableWhenDeviceLocked](v15->_configuration, "disableWhenDeviceLocked");
  v9 = 0;
  v8 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (-[AXPhoenixMitigatorConfiguration disableWhenDisplayOff](v15->_configuration, "disableWhenDisplayOff"))
  {
    if (-[AXPhoenixMitigator displayOn](v15, "displayOn") && v15->_lastDisplayOnTimestamp < v16.var1)
      v11 = 1;
    else
      objc_msgSend(v8, "appendString:", CFSTR("Display off"));
  }
  if (-[AXPhoenixMitigatorConfiguration disableWhenDeviceLocked](v15->_configuration, "disableWhenDeviceLocked"))
  {
    if (-[AXPhoenixMitigator deviceLocked](v15, "deviceLocked") || v15->_lastDeviceUnlockedTimestamp >= v16.var1)
      objc_msgSend(v8, "appendString:", CFSTR("Device locked"));
    else
      v10 = 1;
  }
  var2 = v16.var2;
  if (v16.var2 < 0.4 || (var2 = v16.var3, v16.var3 < 0.4))
    objc_msgSend(v8, "appendString:", CFSTR("Tapped too light"), var2);
  if (-[AXPhoenixMitigator touchOn](v15, "touchOn", var2))
  {
    v9 = 1;
    objc_msgSend(v8, "appendFormat:", CFSTR("Touch on"));
  }
  v7 = objc_msgSend(v8, "length") == 0;
  if (location)
  {
    v6 = -[AXPhoenixMitigator _contextInfo:](v15, "_contextInfo:", v13);
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("reason"));
    (*((void (**)(id, BOOL, id, id))location + 2))(location, v7, v6, v8);
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
}

- (id)configuration
{
  return self->_configuration;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  AXPhoenixMitigator *v4;

  v4 = self;
  v3 = a2;
  -[AXPhoenixMitigator _unsubscribeEventMonitors](self, "_unsubscribeEventMonitors");
  -[AXEventProcessor cleanup](v4->_eventProcessor, "cleanup");
  -[AXEventProcessor endHandlingHIDEventsForReason:](v4->_eventProcessor, "endHandlingHIDEventsForReason:", CFSTR("BackTapEventTap"));
  v2.receiver = v4;
  v2.super_class = (Class)AXPhoenixMitigator;
  -[AXPhoenixMitigator dealloc](&v2, sel_dealloc);
}

- (void)setIsHandHeld:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  os_log_t oslog;
  BOOL v8;
  SEL v9;
  AXPhoenixMitigator *v10;
  uint8_t v11[56];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = self;
  v9 = a2;
  v8 = a3;
  if (self->_isHandHeld != a3)
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10->_isHandHeld);
      v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
      v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10->_lastWakeGestureTimestamp);
      v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10->_lastDismissalTimestamp);
      __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64((uint64_t)v11, (uint64_t)"-[AXPhoenixMitigator setIsHandHeld:]", (uint64_t)v6, (uint64_t)v5, (uint64_t)v4, (uint64_t)v3);
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s IsHandHeld: %@ -> %@ (lastWake %@, lastSleep %@)", v11, 0x34u);

    }
    objc_storeStrong((id *)&oslog, 0);
    v10->_isHandHeld = v8;
  }
}

- (void)setDisplayOn:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  os_log_t oslog;
  BOOL v8;
  SEL v9;
  AXPhoenixMitigator *v10;
  uint8_t v11[56];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = self;
  v9 = a2;
  v8 = a3;
  oslog = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10->_displayOn);
    v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10->_lastDisplayOnTimestamp);
    v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10->_lastDisplayOffTimestamp);
    __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64((uint64_t)v11, (uint64_t)"-[AXPhoenixMitigator setDisplayOn:]", (uint64_t)v6, (uint64_t)v5, (uint64_t)v4, (uint64_t)v3);
    _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s DisplayOn: %@ -> %@ (lastDisplayOn %@, lastDisplayOff %@)", v11, 0x34u);

  }
  objc_storeStrong((id *)&oslog, 0);
  v10->_displayOn = v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AXPhoenixMitigatorDelegate phoenixMitigator:displayOnDidChange:](v10->_delegate, "phoenixMitigator:displayOnDidChange:", v10, v8);
}

- (void)setDeviceLocked:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  os_log_t oslog;
  BOOL v8;
  SEL v9;
  AXPhoenixMitigator *v10;
  uint8_t v11[56];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = self;
  v9 = a2;
  v8 = a3;
  if (self->_deviceLocked != a3)
  {
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10->_deviceLocked);
      v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
      v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10->_lastDeviceLockedTimestamp);
      v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10->_lastDeviceUnlockedTimestamp);
      __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64((uint64_t)v11, (uint64_t)"-[AXPhoenixMitigator setDeviceLocked:]", (uint64_t)v6, (uint64_t)v5, (uint64_t)v4, (uint64_t)v3);
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s DeviceLocked: %@ -> %@ (lastDeviceLocked %@, lastDeviceUnlocked %@)", v11, 0x34u);

    }
    objc_storeStrong((id *)&oslog, 0);
    v10->_deviceLocked = v8;
  }
}

- (void)setTouchOn:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  os_log_t oslog;
  BOOL v8;
  SEL v9;
  AXPhoenixMitigator *v10;
  uint8_t v11[56];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = self;
  v9 = a2;
  v8 = a3;
  if (self->_touchOn != a3)
  {
    -[AXPhoenixMitigatorDelegate phoenixMitigator:touchOnDidChange:](v10->_delegate, "phoenixMitigator:touchOnDidChange:", v10, v8);
    oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10->_touchOn);
      v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
      v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10->_lastTouchInteractionGainTimestamp);
      v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10->_lastTouchInteractionLossTimestamp);
      __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64((uint64_t)v11, (uint64_t)"-[AXPhoenixMitigator setTouchOn:]", (uint64_t)v6, (uint64_t)v5, (uint64_t)v4, (uint64_t)v3);
      _os_log_impl(&dword_228CDB000, oslog, OS_LOG_TYPE_INFO, "[PHOENIX] %s TouchOn: %@ -> %@ (gained %@, lost %@)", v11, 0x34u);

    }
    objc_storeStrong((id *)&oslog, 0);
    v10->_touchOn = v8;
  }
}

- (id)_contextInfo:(BOOL)a3
{
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  SEL v10;
  AXPhoenixMitigator *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v11 = self;
  v10 = a2;
  v9 = a3;
  v12[0] = CFSTR("screenLocked");
  v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_deviceLocked);
  v13[0] = v6;
  v12[1] = CFSTR("handHeld");
  v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11->_isHandHeld);
  v13[1] = v5;
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);

  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  v7 = (id)objc_msgSend(v3, "initWithDictionary:", v8);
  objc_storeStrong(&v8, 0);
  return v7;
}

- (void)_subscribeEventMonitors
{
  AXPhoenixDisplayStatusMonitor *v2;
  AXPhoenixWakeGestureMonitor *v4;
  AXPhoenixDeviceLockMonitor *v5;

  v4 = +[AXPhoenixWakeGestureMonitor sharedInstance](AXPhoenixWakeGestureMonitor, "sharedInstance");
  -[AXPhoenixMitigator _subscribeEventMonitor:](self, "_subscribeEventMonitor:");

  v5 = +[AXPhoenixDeviceLockMonitor sharedInstance](AXPhoenixDeviceLockMonitor, "sharedInstance");
  -[AXPhoenixMitigator _subscribeEventMonitor:](self, "_subscribeEventMonitor:");

  if (-[AXPhoenixMitigatorConfiguration disableWhenDisplayOff](self->_configuration, "disableWhenDisplayOff"))
  {
    v2 = +[AXPhoenixDisplayStatusMonitor sharedInstance](AXPhoenixDisplayStatusMonitor, "sharedInstance");
    -[AXPhoenixMitigator _subscribeEventMonitor:](self, "_subscribeEventMonitor:");

  }
}

- (void)_subscribeEventMonitor:(id)a3
{
  id location[2];
  AXPhoenixMitigator *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    objc_msgSend(location[0], "addObserver:", v4);
    -[NSMutableArray addObject:](v4->_monitors, "addObject:", location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)_unsubscribeEventMonitors
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *obj;
  uint64_t v8;
  _QWORD __b[8];
  id v10;
  SEL v11;
  AXPhoenixMitigator *v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  v11 = a2;
  memset(__b, 0, sizeof(__b));
  obj = v12->_monitors;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v10 = *(id *)(__b[1] + 8 * v5);
      objc_msgSend(v10, "removeObserver:", v12, v6);
      ++v5;
      v6 = v2;
      if (v3 + 1 >= v2)
      {
        v5 = 0;
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
        if (!v6)
          break;
      }
    }
  }

  -[NSMutableArray removeAllObjects](v12->_monitors, "removeAllObjects");
}

- (void)phoenixEventMonitorDidReceiveEvent:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  id v10;
  id location[2];
  AXPhoenixMitigator *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v10, v12);
  queue = v12->_queue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __57__AXPhoenixMitigator_phoenixEventMonitorDidReceiveEvent___block_invoke;
  v8 = &unk_24F18F158;
  objc_copyWeak(&v9, &v10);
  dispatch_async(queue, &v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v10);
  objc_storeStrong(location, 0);
}

void __57__AXPhoenixMitigator_phoenixEventMonitorDidReceiveEvent___block_invoke(id *a1)
{
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  objc_storeStrong(location, 0);
}

- (void)setTouchOn:(BOOL)a3 timestamp:(double)a4
{
  BOOL v4;

  v4 = a3;
  if (a3)
    -[AXPhoenixMitigator setLastTouchInteractionGainTimestamp:](self, "setLastTouchInteractionGainTimestamp:", a4);
  else
    -[AXPhoenixMitigator setLastTouchInteractionLossTimestamp:](self, "setLastTouchInteractionLossTimestamp:", a4);
  -[AXPhoenixMitigator setTouchOn:](self, "setTouchOn:", v4);
}

- (void)phoenixDeviceLockMonitor:(id)a3 didReceiveDeviceLockStateChanged:(BOOL)a4 timestamp:(double)a5
{
  NSObject *queue;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13[2];
  BOOL v14;
  id v15;
  double v16;
  BOOL v17;
  id location[2];
  AXPhoenixMitigator *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v16 = a5;
  objc_initWeak(&v15, v19);
  queue = v19->_queue;
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __90__AXPhoenixMitigator_phoenixDeviceLockMonitor_didReceiveDeviceLockStateChanged_timestamp___block_invoke;
  v12 = &unk_24F18F1A8;
  objc_copyWeak(v13, &v15);
  v14 = v17;
  v13[1] = *(id *)&v16;
  dispatch_async(queue, &v8);
  objc_destroyWeak(v13);
  objc_destroyWeak(&v15);
  objc_storeStrong(location, 0);
}

void __90__AXPhoenixMitigator_phoenixDeviceLockMonitor_didReceiveDeviceLockStateChanged_timestamp___block_invoke(uint64_t a1)
{
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (location[0])
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      objc_msgSend(location[0], "setLastDeviceLockedTimestamp:", *(double *)(a1 + 40));
    else
      objc_msgSend(location[0], "setLastDeviceUnlockedTimestamp:", *(double *)(a1 + 40));
    objc_msgSend(location[0], "setDeviceLocked:", *(_BYTE *)(a1 + 48) & 1);
  }
  objc_storeStrong(location, 0);
}

- (void)phoenixDisplayStatusMonitor:(id)a3 didReceiveDisplayStateChanged:(BOOL)a4 timestamp:(double)a5
{
  NSObject *queue;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13[2];
  BOOL v14;
  id v15;
  double v16;
  BOOL v17;
  id location[2];
  AXPhoenixMitigator *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v16 = a5;
  objc_initWeak(&v15, v19);
  queue = v19->_queue;
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __90__AXPhoenixMitigator_phoenixDisplayStatusMonitor_didReceiveDisplayStateChanged_timestamp___block_invoke;
  v12 = &unk_24F18F1A8;
  objc_copyWeak(v13, &v15);
  v14 = v17;
  v13[1] = *(id *)&v16;
  dispatch_async(queue, &v8);
  objc_destroyWeak(v13);
  objc_destroyWeak(&v15);
  objc_storeStrong(location, 0);
}

void __90__AXPhoenixMitigator_phoenixDisplayStatusMonitor_didReceiveDisplayStateChanged_timestamp___block_invoke(uint64_t a1)
{
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (location[0])
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      objc_msgSend(location[0], "setLastDisplayOnTimestamp:", *(double *)(a1 + 40));
    else
      objc_msgSend(location[0], "setLastDisplayOffTimestamp:", *(double *)(a1 + 40));
    objc_msgSend(location[0], "setDisplayOn:", *(_BYTE *)(a1 + 48) & 1);
  }
  objc_storeStrong(location, 0);
}

- (void)gestureMonitorDidReceiveWakeGesture:(id)a3 timestamp:(double)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12[2];
  id v13;
  double v14;
  id location[2];
  AXPhoenixMitigator *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  objc_initWeak(&v13, v16);
  queue = v16->_queue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __68__AXPhoenixMitigator_gestureMonitorDidReceiveWakeGesture_timestamp___block_invoke;
  v10 = &unk_24F18F1D0;
  objc_copyWeak(v12, &v13);
  v12[1] = *(id *)&v14;
  v11 = location[0];
  dispatch_async(queue, &v6);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(location, 0);
}

void __68__AXPhoenixMitigator_gestureMonitorDidReceiveWakeGesture_timestamp___block_invoke(uint64_t a1)
{
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (location[0])
  {
    objc_msgSend(location[0], "setLastWakeGestureTimestamp:", *(double *)(a1 + 48));
    objc_msgSend(location[0], "setIsHandHeld:", objc_msgSend(*(id *)(a1 + 32), "isDeviceHandheld") & 1);
  }
  objc_storeStrong(location, 0);
}

- (void)gestureMonitorDidReceiveSleepGesture:(id)a3 timestamp:(double)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12[2];
  id v13;
  double v14;
  id location[2];
  AXPhoenixMitigator *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  objc_initWeak(&v13, v16);
  queue = v16->_queue;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __69__AXPhoenixMitigator_gestureMonitorDidReceiveSleepGesture_timestamp___block_invoke;
  v10 = &unk_24F18F1D0;
  objc_copyWeak(v12, &v13);
  v12[1] = *(id *)&v14;
  v11 = location[0];
  dispatch_async(queue, &v6);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(location, 0);
}

void __69__AXPhoenixMitigator_gestureMonitorDidReceiveSleepGesture_timestamp___block_invoke(uint64_t a1)
{
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (location[0])
  {
    objc_msgSend(location[0], "setLastDismissalTimestamp:", *(double *)(a1 + 48));
    objc_msgSend(location[0], "setIsHandHeld:", objc_msgSend(*(id *)(a1 + 32), "isDeviceHandheld") & 1);
  }
  objc_storeStrong(location, 0);
}

- (int)policyOption
{
  return self->_policyOption;
}

- (void)setPolicyOption:(int)a3
{
  self->_policyOption = a3;
}

- (BOOL)isHandHeld
{
  return self->_isHandHeld;
}

- (double)lastWakeGestureTimestamp
{
  return self->_lastWakeGestureTimestamp;
}

- (void)setLastWakeGestureTimestamp:(double)a3
{
  self->_lastWakeGestureTimestamp = a3;
}

- (double)lastDismissalTimestamp
{
  return self->_lastDismissalTimestamp;
}

- (void)setLastDismissalTimestamp:(double)a3
{
  self->_lastDismissalTimestamp = a3;
}

- (BOOL)touchOn
{
  return self->_touchOn;
}

- (double)lastTouchInteractionGainTimestamp
{
  return self->_lastTouchInteractionGainTimestamp;
}

- (void)setLastTouchInteractionGainTimestamp:(double)a3
{
  self->_lastTouchInteractionGainTimestamp = a3;
}

- (double)lastTouchInteractionLossTimestamp
{
  return self->_lastTouchInteractionLossTimestamp;
}

- (void)setLastTouchInteractionLossTimestamp:(double)a3
{
  self->_lastTouchInteractionLossTimestamp = a3;
}

- (BOOL)displayOn
{
  return self->_displayOn;
}

- (double)lastDisplayOnTimestamp
{
  return self->_lastDisplayOnTimestamp;
}

- (void)setLastDisplayOnTimestamp:(double)a3
{
  self->_lastDisplayOnTimestamp = a3;
}

- (double)lastDisplayOffTimestamp
{
  return self->_lastDisplayOffTimestamp;
}

- (void)setLastDisplayOffTimestamp:(double)a3
{
  self->_lastDisplayOffTimestamp = a3;
}

- (BOOL)deviceLocked
{
  return self->_deviceLocked;
}

- (double)lastDeviceLockedTimestamp
{
  return self->_lastDeviceLockedTimestamp;
}

- (void)setLastDeviceLockedTimestamp:(double)a3
{
  self->_lastDeviceLockedTimestamp = a3;
}

- (double)lastDeviceUnlockedTimestamp
{
  return self->_lastDeviceUnlockedTimestamp;
}

- (void)setLastDeviceUnlockedTimestamp:(double)a3
{
  self->_lastDeviceUnlockedTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
