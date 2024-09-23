@implementation AmbientLightSensorComponent

- (AmbientLightSensorComponent)init
{
  AmbientLightSensorComponent *v2;
  AmbientLightSensorComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AmbientLightSensorComponent;
  v2 = -[AmbientLightSensorComponent init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->ALS_FS = 0;
    v2->ALS_IR = 0;
    v2->IR_PRED = 0;
    v2->super.ctxType = 0;
    v2->previousSunlightLoadingIndexValue = 0;
    v2->sunlightLoadingIndexValue = 0;
    v2->temperature = 0;
    v2->thermalSunlightStateToken = -1;
    if (notify_register_check("com.apple.system.thermalsunlightstate", &v2->thermalSunlightStateToken)
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F154();
    }
    -[AmbientLightSensorComponent initHIDServices](v3, "initHIDServices");
    -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "addtGraphDataSource:", v3);
  }
  return v3;
}

- (int)getContextState
{
  return self->sunlightLoadingIndexValue;
}

- (BOOL)isContextTriggered
{
  return self->sunlightLoadingIndexValue == 100;
}

- (void)initHIDServices
{
  __IOHIDEventSystemClient *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  __CFArray *v6;
  const __CFArray *v7;
  __IOHIDServiceClient *ValueAtIndex;

  if (!self->_hidEventSystem)
  {
    v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault, a2);
    self->_hidEventSystem = v3;
    if (v3)
    {
      v4 = sub_100035A50(65280, 4);
      if (v4)
      {
        v5 = v4;
        IOHIDEventSystemClientSetMatching(self->_hidEventSystem, v4);
        IOHIDEventSystemClientScheduleWithRunLoop(self->_hidEventSystem, qword_1000A2470, kCFRunLoopDefaultMode);
        CFRelease(v5);
        v6 = -[AmbientLightSensorComponent copySensorArray](self, "copySensorArray");
        if (v6)
        {
          v7 = v6;
          if (CFArrayGetCount(v6) >= 1)
          {
            ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v7, 0);
            self->_service = ValueAtIndex;
            if (ValueAtIndex)
            {
              IOHIDServiceClientRegisterRemovalCallback(ValueAtIndex, sub_100034578, 0, 0);
            }
            else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            {
              sub_10004F1AC();
            }
          }
          CFRelease(v7);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F180();
    }
  }
}

- (BOOL)synchContext
{
  __IOHIDServiceClient *service;
  uint64_t v4;
  const void *v5;
  int IntegerValue;
  int v7;
  int v8;
  int sunlightLoadingIndexValue;
  _BOOL4 v10;
  unsigned int temperature;
  TGraphSampler *v12;
  uint64_t v13;

  service = self->_service;
  if (!service)
  {
    -[AmbientLightSensorComponent initHIDServices](self, "initHIDServices");
LABEL_11:
    LOBYTE(v10) = 0;
    return v10;
  }
  v4 = IOHIDServiceClientCopyEvent(service, 12, 0, 0);
  if (!v4)
  {
    v10 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
    if (!v10)
      return v10;
    sub_10004F1D8();
    goto LABEL_11;
  }
  v5 = (const void *)v4;
  self->ALS_FS = IOHIDEventGetIntegerValue(v4, 786433);
  IntegerValue = IOHIDEventGetIntegerValue(v5, 786434);
  self->ALS_IR = IntegerValue;
  v7 = (int)((double)self->ALS_FS * -0.234 + 500.0 + (double)IntegerValue * 0.234);
  self->IR_PRED = v7;
  v8 = (int)((double)self->ALS_IR * 0.5 + 50.0 + (double)v7 * -0.5);
  if (v8 <= -350)
    v8 = -350;
  if (v8 >= 450)
    v8 = 450;
  self->temperature = v8;
  CFRelease(v5);
  self->previousSunlightLoadingIndexValue = self->sunlightLoadingIndexValue;
  if (dword_1000A249C < 0)
    goto LABEL_17;
  if (dword_1000A249C)
    goto LABEL_9;
  temperature = self->temperature;
  if ((temperature & 0x80000000) != 0)
  {
LABEL_17:
    sunlightLoadingIndexValue = 0;
    self->sunlightLoadingIndexValue = 0;
    goto LABEL_18;
  }
  if (temperature <= 0x64)
  {
    sunlightLoadingIndexValue = self->sunlightLoadingIndexValue;
    goto LABEL_18;
  }
LABEL_9:
  sunlightLoadingIndexValue = 100;
  self->sunlightLoadingIndexValue = 100;
LABEL_18:
  if (sunlightLoadingIndexValue == self->previousSunlightLoadingIndexValue
    || ((v12 = +[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"),
         self->sunlightLoadingIndexValue)
      ? (v13 = 100)
      : (v13 = 0),
        -[TGraphSampler updatePowerlogMiscState:value:](v12, "updatePowerlogMiscState:value:", 2, v13),
        !notify_set_state(self->thermalSunlightStateToken, self->sunlightLoadingIndexValue)))
  {
    LOBYTE(v10) = 1;
    return v10;
  }
  v10 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    sub_10004F204();
    goto LABEL_11;
  }
  return v10;
}

- (__CFArray)copySensorArray
{
  CFArrayRef v3;
  const __CFArray *v4;
  CFTypeID v5;
  __CFArray *Mutable;
  CFIndex v7;
  __IOHIDServiceClient *ValueAtIndex;
  int v9;
  __CFArray *Copy;
  __IOHIDEventSystemClient *hidEventSystem;
  NSObject *v14;
  const __CFArray *v15;

  v3 = IOHIDEventSystemClientCopyServices(self->_hidEventSystem);
  v4 = v3;
  if (!v3 || (v5 = CFGetTypeID(v3), v5 != CFArrayGetTypeID()) || CFArrayGetCount(v4) <= 0)
  {
    hidEventSystem = self->_hidEventSystem;
    if (hidEventSystem)
    {
      IOHIDEventSystemClientUnscheduleWithRunLoop(hidEventSystem, qword_1000A2470, kCFRunLoopDefaultMode);
      CFRelease(self->_hidEventSystem);
      self->_hidEventSystem = 0;
    }
    v14 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004F230(v14);
      if (!v4)
        return 0;
    }
    else if (!v4)
    {
      return 0;
    }
    v15 = v4;
LABEL_21:
    CFRelease(v15);
    return 0;
  }
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (CFArrayGetCount(v4) >= 1)
  {
    v7 = 0;
    do
    {
      ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v4, v7);
      v9 = sub_100035B20(ValueAtIndex, CFSTR("PrimaryUsage"));
      if (sub_100035B20(ValueAtIndex, CFSTR("PrimaryUsagePage")) == 65280 && v9 == 4)
        CFArrayAppendValue(Mutable, ValueAtIndex);
      ++v7;
    }
    while (CFArrayGetCount(v4) > v7);
  }
  CFRelease(v4);
  if (!CFArrayGetCount(Mutable))
  {
    v15 = Mutable;
    goto LABEL_21;
  }
  if (Mutable)
  {
    Copy = CFArrayCreateCopy(kCFAllocatorDefault, Mutable);
    CFRelease(Mutable);
    return Copy;
  }
  return 0;
}

- (int)numberOfFields
{
  return 3;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_10007D2B8[a3];
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), *(unsigned int *)((char *)&self->super.super.isa + *off_10007D2D0[a3]));
}

- (int)temperature
{
  return self->temperature;
}

- (int)ALS_FS
{
  return self->ALS_FS;
}

- (int)ALS_IR
{
  return self->ALS_IR;
}

- (int)IR_PRED
{
  return self->IR_PRED;
}

@end
