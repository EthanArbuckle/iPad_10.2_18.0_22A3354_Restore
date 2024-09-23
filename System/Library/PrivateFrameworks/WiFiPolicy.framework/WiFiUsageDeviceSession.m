@implementation WiFiUsageDeviceSession

- (void)linkQualityDidChange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageDeviceSession;
  -[WiFiUsageSession linkQualityDidChange:](&v9, sel_linkQualityDidChange_, a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 > 86400.0)
  {
    -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s - session started on %@ (%fs ago) - ending it and restarting it"), "-[WiFiUsageDeviceSession linkQualityDidChange:]", v8, *(_QWORD *)&v7);

    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
    -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
  }
}

- (WiFiUsageDeviceSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  WiFiUsageDeviceSession *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageDeviceSession;
  result = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:](&v5, sel_initWithSessionType_andInterfaceName_andCapabilities_, 1, a3, a4);
  result->_firstDisplayOn = 1;
  return result;
}

- (void)displayStateDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageDeviceSession;
  -[WiFiUsageSession displayStateDidChange:](&v9, sel_displayStateDidChange_);
  if (v3)
  {
    if (self->_firstDisplayOn)
    {
      if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
      {
        NSLog(CFSTR("%s: device session started"), "-[WiFiUsageDeviceSession displayStateDidChange:]");
        -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
      }
      self->_firstDisplayOn = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    if (v8 > 86400.0)
      -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");

  }
}

- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  double v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  NSLog(CFSTR("%s:%u: isAwake[%u] wokenByWiFi[%u]\n"), a2, "-[WiFiUsageDeviceSession systemWakeStateDidChange:wokenByWiFi:]", 52, a3, a4);
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageDeviceSession;
  -[WiFiUsageSession systemWakeStateDidChange:wokenByWiFi:](&v8, sel_systemWakeStateDidChange_wokenByWiFi_, v5, v4);
  if (v5)
  {
    if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
    {
      NSLog(CFSTR("%s: device session started"), "-[WiFiUsageDeviceSession systemWakeStateDidChange:wokenByWiFi:]");
      -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
    }
  }
  else
  {
    -[WiFiUsageSession systemAwakeDuration](self, "systemAwakeDuration");
    if (v7 > 86400.0)
      -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
  }
}

- (id)metricName
{
  return CFSTR("com.apple.wifi.devicesession");
}

@end
