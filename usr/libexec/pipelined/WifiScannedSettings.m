@implementation WifiScannedSettings

- (WifiScannedSettings)initWithSettings:(id)a3 cached:(BOOL)a4 at:(duration<long)long initiatedAt:()std:(1000000000>>)a5 :(duration<long)long ratio<1
{
  id v11;
  WifiScannedSettings *v12;
  WifiScannedSettings *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WifiScannedSettings;
  v12 = -[WifiScannedSettings init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_settings, a3);
    v13->_cachedScan = a4;
    v13->_initiatedTimestamp = a6;
    v13->_timestamp = a5;
    v13->_wifiError = 0;
  }

  return v13;
}

- (BOOL)cachedScan
{
  return self->_cachedScan;
}

- (duration<long)timestamp
{
  return self->_timestamp;
}

- (WifiScannerSettings)settings
{
  return self->_settings;
}

- (int)wifiError
{
  return self->_wifiError;
}

- (BOOL)targettedSsid
{
  return self->_targettedSsid;
}

- (optional<int>)scanRssiThreshold
{
  return self->_scanRssiThreshold;
}

- (optional<BOOL>)merged
{
  return self->_merged;
}

- (duration<long)initiatedTimestamp
{
  return self->_initiatedTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 10) = 0;
  *((_BYTE *)self + 40) = 0;
  return self;
}

- (void)setWifiError:(int)a3
{
  self->_wifiError = a3;
}

- (WifiScannedSettings)init
{
  -[WifiScannedSettings doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WifiScannedSettings *v4;
  void *v5;
  WifiScannedSettings *v6;

  v4 = +[WifiScannedSettings allocWithZone:](WifiScannedSettings, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WifiScannedSettings settings](self, "settings"));
  v6 = -[WifiScannedSettings initWithSettings:cached:at:initiatedAt:](v4, "initWithSettings:cached:at:initiatedAt:", v5, -[WifiScannedSettings cachedScan](self, "cachedScan"), -[WifiScannedSettings timestamp](self, "timestamp"), -[WifiScannedSettings initiatedTimestamp](self, "initiatedTimestamp"));

  return v6;
}

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc((Class)NSString);
  if (self->_cachedScan)
    v4 = "true";
  else
    v4 = "false";
  return objc_msgSend(v3, "initWithFormat:", CFSTR("cached:%s,settings:%@,timestamp:%lld"), v4, self->_settings, self->_timestamp.__rep_);
}

- (void)setMerged:(optional<BOOL>)a3
{
  self->_merged = a3;
}

- (void)setScanRssiThreshold:(optional<int>)a3
{
  self->_scanRssiThreshold = a3;
}

- (void)setTargettedSsid:(BOOL)a3
{
  self->_targettedSsid = a3;
}

@end
