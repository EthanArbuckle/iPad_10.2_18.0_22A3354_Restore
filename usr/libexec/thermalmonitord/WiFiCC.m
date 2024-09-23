@implementation WiFiCC

- (WiFiCC)initWithParams:(__CFDictionary *)a3
{
  WiFiCC *v4;
  WiFiCC *v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WiFiCC;
  v4 = -[ComponentControl initWithCC::](&v9, "initWithCC::", 9, 0);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%d WiFi "), 9);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    v6 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
    *(_QWORD *)(&v5->super.currentPower + 1) = v6;
    if (!v6)
    {
      v7 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004FEA0(v7);
    }
    -[ComponentControl updatePowerParameters:](v5, "updatePowerParameters:", a3);
    if (sub_100034168(a3, CFSTR("expectsCPMSSupport"), 0))
      -[ComponentControl setCPMSMitigationState:](v5, "setCPMSMitigationState:", 1);
  }
  return v5;
}

- (void)defaultAction
{
  unsigned int currentLoadingIndex;
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  _DWORD v7[2];

  currentLoadingIndex = self->super.currentLoadingIndex;
  if (currentLoadingIndex != self->super.maxLoadingIndex)
  {
    if (currentLoadingIndex >= 0x64)
      v4 = 100;
    else
      v4 = currentLoadingIndex;
    WiFiManagerClientSetThermalIndex(*(_QWORD *)(&self->super.currentPower + 1), v4);
    if (byte_1000A2480)
    {
      v5 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v6 = self->super.currentLoadingIndex;
        v7[0] = 67109120;
        v7[1] = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Set the WiFi maxLI to %d", (uint8_t *)v7, 8u);
      }
    }
    self->super.maxLoadingIndex = self->super.currentLoadingIndex;
  }
}

- (void)refreshTGraphTelemetry
{
  unsigned int ThermalIndex;
  int v4;
  NSObject *v5;

  ThermalIndex = WiFiManagerClientGetThermalIndex(*(_QWORD *)(&self->super.currentPower + 1), a2);
  *(_DWORD *)&self->super.allowLIOverride = ThermalIndex;
  if (ThermalIndex >= 0x66)
  {
    v4 = ThermalIndex;
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004FEE0(v4, v5);
  }
}

@end
