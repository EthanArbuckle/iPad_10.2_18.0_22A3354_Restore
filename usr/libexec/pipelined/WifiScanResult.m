@implementation WifiScanResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
}

- (WifiScanResult)initWithAge:(duration<long)long bssid:()std:(1000000000>>)a3 :(id)a4 ratio<1 ssid:(id)a5 channel:(int)a6 rssi:(int)a7 flags:(unsigned int)a8 adHoc:(BOOL)a9 personalHotspot:(BOOL)a10 captive:(BOOL)a11 mode:(int)a12
{
  id v19;
  id v20;
  WifiScanResult *v21;
  WifiScanResult *v22;
  WifiScanResult *v23;
  objc_super v25;

  v19 = a4;
  v20 = a5;
  v25.receiver = self;
  v25.super_class = (Class)WifiScanResult;
  v21 = -[WifiScanResult init](&v25, "init");
  v22 = v21;
  if (v21)
  {
    v21->_age = a3;
    objc_storeStrong((id *)&v21->_bssid, a4);
    objc_storeStrong((id *)&v22->_ssid, a5);
    v22->_rssi = a7;
    v22->_channelFlags = a8;
    v22->_adHoc = a9;
    v22->_personalHotspot = a10;
    v22->_captive = a11;
    v22->_channel = a6;
    v22->_mode = a12;
    v23 = v22;
  }

  return v22;
}

- (BOOL)personalHotspot
{
  return self->_personalHotspot;
}

- (duration<long)age
{
  return self->_age;
}

- (int)rssi
{
  return self->_rssi;
}

- (BOOL)requestsAnonymity
{
  return -[NSString hasSuffix:](self->_ssid, "hasSuffix:", CFSTR("_nomap"));
}

- (int)mode
{
  return self->_mode;
}

- (unsigned)channelFlags
{
  return self->_channelFlags;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (BOOL)adHoc
{
  return self->_adHoc;
}

- (int)channel
{
  return self->_channel;
}

- (WifiScanResult)init
{
  -[WifiScanResult doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (double)ageTimeInterval
{
  return (double)self->_age.__rep_ / 1000000000.0;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("channel: %d, bssid: %@, ssid: %@, rssi: %d, age: %lld"), self->_channel, self->_bssid, self->_ssid, self->_rssi, self->_age.__rep_ / 1000000);
}

- (BOOL)captive
{
  return self->_captive;
}

- (NSString)ssid
{
  return self->_ssid;
}

@end
