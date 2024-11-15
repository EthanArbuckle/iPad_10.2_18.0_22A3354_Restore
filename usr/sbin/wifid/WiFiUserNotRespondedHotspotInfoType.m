@implementation WiFiUserNotRespondedHotspotInfoType

- (WiFiUserNotRespondedHotspotInfoType)initWithHotspot:(id)a3
{
  id v5;
  WiFiUserNotRespondedHotspotInfoType *v6;
  WiFiUserNotRespondedHotspotInfoType *v7;
  uint64_t v8;
  NSDate *lastNotifiedAt;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WiFiUserNotRespondedHotspotInfoType;
  v6 = -[WiFiUserNotRespondedHotspotInfoType init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hotspotDevice, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    lastNotifiedAt = v7->_lastNotifiedAt;
    v7->_lastNotifiedAt = (NSDate *)v8;

  }
  return v7;
}

- (SFRemoteHotspotDevice)hotspotDevice
{
  return (SFRemoteHotspotDevice *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)lastNotifiedAt
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNotifiedAt, 0);
  objc_storeStrong((id *)&self->_hotspotDevice, 0);
}

@end
