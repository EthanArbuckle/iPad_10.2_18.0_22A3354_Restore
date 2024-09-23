@implementation SolarDetectorSemantic

- (int)numberOfFields
{
  return 3;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  const __CFAllocator *v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  switch(a3)
  {
    case 2:
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), self->_currentSemanticLux);
    case 1:
      v3 = kCFAllocatorDefault;
      v5 = -[SolarDetectorSemantic isContextTriggered](self, "isContextTriggered");
      v6 = 100;
      if (!v5)
        v6 = 0;
      v7 = v6;
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), v7);
    case 0:
      v3 = kCFAllocatorDefault;
      v7 = -[SolarDetectorSemantic getContextState](self, "getContextState");
      return (__CFString *)CFStringCreateWithFormat(v3, 0, CFSTR("%d"), v7);
  }
  return 0;
}

- (BOOL)isContextTriggered
{
  return -[SolarDetectorSemantic getContextState](self, "getContextState") == 5;
}

- (int)getContextState
{
  int sunlightOverrideState;

  sunlightOverrideState = self->_sunlightOverrideState;
  if (sunlightOverrideState < 0)
    return 1;
  if (sunlightOverrideState)
    return 5;
  return self->_currentSemanticAmbientLightLevel;
}

- (BOOL)synchContext
{
  id v3;
  void *v4;
  int v5;
  OS_dispatch_queue *update_queue;
  _QWORD block[5];

  if (self->super._infoOnlySensorsActive)
  {
    v3 = -[BrightnessSystemClient copyPropertyForKey:](self->_brightnessSystemClient, "copyPropertyForKey:", CFSTR("TrustedLux"));
    if (v3)
    {
      v4 = v3;
      self->_currentSemanticLux = objc_msgSend(v3, "intValue");

    }
    else
    {
      self->_currentSemanticLux = -127;
    }
  }
  v5 = dword_1000A249C;
  self->_sunlightOverrideState = dword_1000A249C;
  if (self->_sunlightOverrideStatePrevious != v5)
  {
    self->_sunlightOverrideStatePrevious = v5;
    update_queue = self->_update_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002894C;
    block[3] = &unk_10007D248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)update_queue, block);
  }
  return 1;
}

- (SolarDetectorSemantic)init
{
  SolarDetectorSemantic *v2;
  SolarDetectorSemantic *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BrightnessSystemClient *v12;
  NSObject *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SolarDetectorSemantic;
  v2 = -[SolarDetectorSemantic init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v2->super.ctxType = 0;
    v2->super._infoOnlySensorsActive = 0;
    v2->_currentSemanticLux = -127;
    v2->_sunlightState = -1;
    v2->_sunlightStatePrevious = -1;
    v2->_sunlightOverrideState = 0;
    v2->_sunlightOverrideStatePrevious = 0;
    v2->_update_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.solar", 0);
    if (notify_register_check("com.apple.system.thermalsunlightstate", &v3->_thermalSunlightStateToken))
    {
      v4 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100050FD4(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    -[SolarDetectorSemantic updateCurrentSemanticAmbientLightLevel:](v3, "updateCurrentSemanticAmbientLightLevel:", 0);
    v12 = (BrightnessSystemClient *)objc_alloc_init((Class)BrightnessSystemClient);
    v3->_brightnessSystemClient = v12;
    if (v12)
    {
      -[SolarDetectorSemantic initializeSemanticBrightnessHandling](v3, "initializeSemanticBrightnessHandling");
    }
    else
    {
      v13 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100050F54(v13);
    }
    if (byte_1000A2DC0)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 14, CFSTR("zETM"), 14);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 13, CFSTR("zETM"), 13);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 12, CFSTR("zETM"), 12);
      *(float *)&dword_1000A2AF0 = (float)v3->_currentSemanticAmbientLightLevel;
      *(float *)&dword_1000A2AF8 = (float)v3->_currentSemanticLux;
      dword_1000A2AF4 = 0;
    }
    -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "addtGraphDataSource:", v3);
  }
  return v3;
}

- (void)initializeSemanticBrightnessHandling
{
  id v3;
  id v4;
  id v5;
  BrightnessSystemClient *brightnessSystemClient;
  _QWORD v7[5];

  v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", "SemanticAmbientLightLevel");
  v4 = -[BrightnessSystemClient copyPropertyForKey:](self->_brightnessSystemClient, "copyPropertyForKey:", v3);
  -[SolarDetectorSemantic handleBrightnessClientNotification:value:](self, "handleBrightnessClientNotification:value:", v3, v4);

  v5 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v3, 0);
  brightnessSystemClient = self->_brightnessSystemClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028808;
  v7[3] = &unk_10007DC38;
  v7[4] = self;
  -[BrightnessSystemClient registerNotificationBlock:forProperties:](brightnessSystemClient, "registerNotificationBlock:forProperties:", v7, v5);

}

- (void)handleBrightnessClientNotification:(id)a3 value:(id)a4
{
  NSObject *v6;
  int v7;
  id v8;

  if (a3 && a4 && !strncmp((const char *)objc_msgSend(a3, "UTF8String"), "SemanticAmbientLightLevel", 0x19uLL))
  {
    if ((objc_opt_respondsToSelector(a4, "intValue") & 1) != 0)
    {
      -[SolarDetectorSemantic updateCurrentSemanticAmbientLightLevel:](self, "updateCurrentSemanticAmbientLightLevel:", objc_msgSend(a4, "intValue"));
    }
    else
    {
      -[SolarDetectorSemantic updateCurrentSemanticAmbientLightLevel:](self, "updateCurrentSemanticAmbientLightLevel:", 0);
      if (byte_1000A2480)
      {
        v6 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v7 = 138412290;
          v8 = a4;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> brightness callback %@", (uint8_t *)&v7, 0xCu);
        }
      }
    }
  }
}

- (void)updateCurrentSemanticAmbientLightLevel:(int)a3
{
  OS_dispatch_queue *update_queue;
  _QWORD v4[5];
  int v5;

  update_queue = self->_update_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000289BC;
  v4[3] = &unk_10007DC60;
  v4[4] = self;
  v5 = a3;
  dispatch_async((dispatch_queue_t)update_queue, v4);
}

- (void)processPotentialSolarStateChange:(BOOL)a3
{
  BOOL v3;
  int v5;
  TGraphSampler *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (self->_currentSemanticAmbientLightLevel)
    v3 = 0;
  else
    v3 = !a3;
  if (!v3)
  {
    v5 = -[SolarDetectorSemantic isContextTriggered](self, "isContextTriggered", a3);
    self->_sunlightState = v5;
    if (self->_sunlightStatePrevious != v5)
    {
      self->_sunlightStatePrevious = v5;
      v6 = +[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance");
      if (self->_sunlightState)
        v7 = 100;
      else
        v7 = 0;
      -[TGraphSampler updatePowerlogMiscState:value:](v6, "updatePowerlogMiscState:value:", 2, v7);
      if (self->_sunlightState)
        v8 = 100;
      else
        v8 = 0;
      if (notify_set_state(self->_thermalSunlightStateToken, v8))
      {
        v9 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100051008(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      *(float *)&dword_1000A2AF4 = (float)self->_sunlightState;
    }
  }
}

- (void)setInfoOnlySensorsActive:(BOOL)a3
{
  self->super._infoOnlySensorsActive = a3;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_10007DC80[a3];
}

@end
