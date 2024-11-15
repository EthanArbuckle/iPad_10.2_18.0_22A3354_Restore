@implementation WiFiUsageAccessPointProfileInfo

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_storeStrong((id *)&self->_bssid, a3);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_storeStrong((id *)&self->_ssid, a3);
}

- (NSDictionary)apProfileWPSInfo
{
  return self->_apProfileWPSInfo;
}

- (void)setApProfileWPSInfo:(id)a3
{
  objc_storeStrong((id *)&self->_apProfileWPSInfo, a3);
}

- (NSString)apProfileVersion
{
  return self->_apProfileVersion;
}

- (void)setApProfileVersion:(id)a3
{
  objc_storeStrong((id *)&self->_apProfileVersion, a3);
}

- (NSString)apProfile_shortID
{
  return self->_apProfile_shortID;
}

- (void)setApProfile_shortID:(id)a3
{
  objc_storeStrong((id *)&self->_apProfile_shortID, a3);
}

- (NSString)apProfileID
{
  return self->_apProfileID;
}

- (void)setApProfileID:(id)a3
{
  objc_storeStrong((id *)&self->_apProfileID, a3);
}

- (NSData)beacon
{
  return self->_beacon;
}

- (void)setBeacon:(id)a3
{
  objc_storeStrong((id *)&self->_beacon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beacon, 0);
  objc_storeStrong((id *)&self->_apProfileID, 0);
  objc_storeStrong((id *)&self->_apProfile_shortID, 0);
  objc_storeStrong((id *)&self->_apProfileVersion, 0);
  objc_storeStrong((id *)&self->_apProfileWPSInfo, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
}

@end
