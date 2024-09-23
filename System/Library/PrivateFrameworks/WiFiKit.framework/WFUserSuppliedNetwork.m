@implementation WFUserSuppliedNetwork

- (BOOL)canBeDisplayedAsCurrent
{
  return 1;
}

- (id)hotspotBatteryLife
{
  return &unk_24DC5D678;
}

- (id)hotspotCellularProtocol
{
  return 0;
}

- (id)hotspotSignalStrength
{
  return 0;
}

- (BOOL)iOSHotspot
{
  return 0;
}

- (BOOL)isAdhoc
{
  return 0;
}

- (BOOL)isEnterprise
{
  return 0;
}

- (BOOL)isInstantHotspot
{
  return 0;
}

- (BOOL)isSecure
{
  return 0;
}

- (BOOL)isUnconfiguredAccessory
{
  return 0;
}

- (int64_t)rssi
{
  return 0;
}

- (float)scaledRSSI
{
  return 1.0;
}

- (unint64_t)signalBars
{
  return 3;
}

- (id)subtitle
{
  return 0;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)security
{
  return self->_security;
}

- (void)setSecurity:(int64_t)a3
{
  self->_security = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (__SecIdentity)TLSIdentity
{
  return self->_TLSIdentity;
}

- (void)setTLSIdentity:(__SecIdentity *)a3
{
  self->_TLSIdentity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end
