@implementation WFDetailContextWiFiModeConfig

- (WFDetailContextWiFiModeConfig)initWithConfigurable:(BOOL)a3 wifiMode:(int64_t)a4
{
  _BOOL8 v5;
  WFDetailContextWiFiModeConfig *v6;
  WFDetailContextWiFiModeConfig *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFDetailContextWiFiModeConfig;
  v6 = -[WFDetailContextWiFiModeConfig init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[WFDetailContextWiFiModeConfig setWifiModeConfigurable:](v6, "setWifiModeConfigurable:", v5);
    -[WFDetailContextWiFiModeConfig setWifiMode:](v7, "setWifiMode:", a4);
  }
  return v7;
}

- (BOOL)isWifiModeConfigurable
{
  return self->_wifiModeConfigurable;
}

- (void)setWifiModeConfigurable:(BOOL)a3
{
  self->_wifiModeConfigurable = a3;
}

- (int64_t)wifiMode
{
  return self->_wifiMode;
}

- (void)setWifiMode:(int64_t)a3
{
  self->_wifiMode = a3;
}

@end
