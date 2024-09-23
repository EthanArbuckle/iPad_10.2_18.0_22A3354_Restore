@implementation WiFiUsageBatterySaveSession

- (WiFiUsageBatterySaveSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  WiFiUsageBatterySaveSession *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageBatterySaveSession;
  result = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:](&v5, sel_initWithSessionType_andInterfaceName_andCapabilities_, 7, a3, a4);
  result->_batterySaveMode = 0;
  return result;
}

- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    if (!self->_batterySaveMode)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "-[WiFiUsageBatterySaveSession updateWowState:lpasState:lowPowerState:batterySaverState:]";
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Battery save mode session started", buf, 0xCu);
      }
      -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
      self->_batterySaveMode = 1;
    }
  }
  else if (self->_batterySaveMode)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WiFiUsageBatterySaveSession updateWowState:lpasState:lowPowerState:batterySaverState:]";
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Battery save session ended", buf, 0xCu);
    }
    self->_batterySaveMode = 0;
    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
  }
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageBatterySaveSession;
  -[WiFiUsageSession updateWowState:lpasState:lowPowerState:batterySaverState:](&v11, sel_updateWowState_lpasState_lowPowerState_batterySaverState_, v9, v8, v7, v6);
}

- (id)metricName
{
  return CFSTR("com.apple.wifi.batterysavesession");
}

@end
