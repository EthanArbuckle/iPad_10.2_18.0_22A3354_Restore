@implementation FanCC

- (FanCC)initWithParams:(__CFDictionary *)a3
{
  FanCC *v4;
  FanCC *v5;
  unsigned int *p_currentFanRPM;
  unsigned int *p_minRPM;
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  const __CFDictionary *v11;
  io_service_t MatchingService;
  uint8_t buf[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FanCC;
  v4 = -[ComponentControl initWithCC::](&v15, "initWithCC::", 8, a3);
  v5 = v4;
  if (v4)
  {
    *(&v4->super.currentPower + 1) = 0;
    v4->fanRPM = 0;
    v4->previousFanRPM = 0;
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    p_currentFanRPM = &v4->currentFanRPM;
    if ((sub_1000048B0(a3, CFSTR("minRPM"), kCFNumberIntType, &v4->currentFanRPM) & 1) == 0
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100051E28();
    }
    p_minRPM = &v5->minRPM;
    if ((sub_1000048B0(a3, CFSTR("maxRPM"), kCFNumberIntType, &v5->minRPM) & 1) == 0
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100051DFC();
    }
    v8 = *p_currentFanRPM;
    v9 = *p_minRPM;
    if (*p_currentFanRPM > *p_minRPM)
    {
      v10 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "<Error> FanCC: maxRPM not greater than minRPM", buf, 2u);
        v9 = *p_minRPM;
        v8 = *p_currentFanRPM;
      }
    }
    *(float *)&v5->maxRPM = (float)((v9 - v8) / 0x64);
    v5->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%d Fan "), 8);
    v5->super.maxLoadingIndex = 101;
    v11 = IOServiceMatching("ApplePMPThermal");
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
    if (!MatchingService && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051DD0();
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&v5->scalingFactor)
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100051DA4();
    }
    IOObjectRelease(MatchingService);
    -[FanCC setFanRPM:](v5, "setFanRPM:", 0);
  }
  return v5;
}

- (void)defaultAction
{
  unsigned int previousValue;
  unsigned int currentFanRPM;
  uint64_t v5;
  unsigned int fanRPM;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  unsigned int v10;

  previousValue = self->super.previousValue;
  if (previousValue == 101)
  {
    *(&self->super.currentPower + 1) = 0;
  }
  else if (previousValue != self->super.maxLoadingIndex)
  {
    currentFanRPM = self->currentFanRPM + (int)(float)(*(float *)&self->maxRPM * (float)(100 - previousValue));
    if ((currentFanRPM & 0x80000000) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100051E54();
      currentFanRPM = 0;
    }
    *(&self->super.currentPower + 1) = currentFanRPM;
    if (self->currentFanRPM > currentFanRPM)
      currentFanRPM = self->currentFanRPM;
    *(&self->super.currentPower + 1) = currentFanRPM;
    if (self->minRPM < currentFanRPM)
      currentFanRPM = self->minRPM;
    *(&self->super.currentPower + 1) = currentFanRPM;
    dword_1000A2E40 = currentFanRPM;
  }
  self->super.maxLoadingIndex = self->super.previousValue;
  v5 = *(&self->super.currentPower + 1);
  fanRPM = self->fanRPM;
  if ((_DWORD)v5 != fanRPM)
  {
    if (byte_1000A2480)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 67109376;
        v8[1] = v5;
        v9 = 1024;
        v10 = fanRPM;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> FanCC: cur RPM %u, prev RPM %u", (uint8_t *)v8, 0xEu);
        v5 = *(&self->super.currentPower + 1);
      }
    }
    -[FanCC setFanRPM:](self, "setFanRPM:", v5);
  }
}

- (int)setFanRPM:(unsigned int)a3
{
  kern_return_t v5;
  NSObject *v7;
  int v8;
  uint64_t input;
  uint8_t buf[4];
  int v11;

  input = a3;
  v5 = IOConnectCallScalarMethod(LODWORD(self->scalingFactor), 0, &input, 1u, 0, 0);
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051E80();
  }
  else
  {
    self->fanRPM = a3;
    if (byte_1000A2480)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(&self->super.currentPower + 1);
        *(_DWORD *)buf = 67109120;
        v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> FanCC: set fan RPM to %u", buf, 8u);
      }
    }
  }
  return v5;
}

- (void)refreshTGraphTelemetry
{
  self->previousFanRPM = *(&self->super.currentPower + 1);
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FanCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3;
  unsigned int v6;
  __CFString *v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)FanCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)FanCC;
    v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1)
      v7 = CFSTR("FanCC current RPM");
    else
      v7 = 0;
    if ((_DWORD)v3 == v6)
      return CFSTR("FanCC target RPM");
    else
      return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)FanCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;
  int v6;
  const __CFAllocator *v7;
  uint64_t v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  v3 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)FanCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)FanCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }
  v9.receiver = self;
  v9.super_class = (Class)FanCC;
  v6 = v3 - -[ComponentControl numberOfFields](&v9, "numberOfFields");
  if (v6 == 1)
  {
    v7 = kCFAllocatorDefault;
    v8 = 148;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("%u"), *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }
  if (!v6)
  {
    v7 = kCFAllocatorDefault;
    v8 = 140;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("%u"), *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }
  return 0;
}

@end
