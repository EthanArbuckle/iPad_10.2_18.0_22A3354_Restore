@implementation W5WiFiScanResult

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5WiFiScanResult;
  -[W5WiFiScanResult dealloc](&v3, sel_dealloc);
}

- (BOOL)supportsSecurity:(int64_t)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  BOOL v7;
  _BOOL4 v8;
  BOOL v9;
  _BOOL4 v10;
  BOOL v11;
  _BOOL4 v12;
  _BOOL4 v13;
  BOOL result;

  v5 = -[NSArray containsObject:](self->_supportedSecurityTypes, "containsObject:", &unk_24C24E010);
  v6 = -[NSArray containsObject:](self->_supportedSecurityTypes, "containsObject:", &unk_24C24E028);
  v7 = -[NSArray containsObject:](self->_supportedSecurityTypes, "containsObject:", &unk_24C24E040);
  v8 = -[NSArray containsObject:](self->_supportedSecurityTypes, "containsObject:", &unk_24C24E058);
  v9 = -[NSArray containsObject:](self->_supportedSecurityTypes, "containsObject:", &unk_24C24E070);
  v10 = -[NSArray containsObject:](self->_supportedSecurityTypes, "containsObject:", &unk_24C24E088);
  v11 = -[NSArray containsObject:](self->_supportedSecurityTypes, "containsObject:", &unk_24C24E0A0);
  v12 = -[NSArray containsObject:](self->_supportedSecurityTypes, "containsObject:", &unk_24C24E0B8);
  v13 = -[NSArray containsObject:](self->_supportedSecurityTypes, "containsObject:", &unk_24C24E0D0);
  result = 0;
  switch(a3)
  {
    case 0:
      result = !v5 && !v13 && !v12 && !v6 && !v8 && !v10 && !v7 && !v9;
      break;
    case 1:
    case 8:
      result = v5;
      break;
    case 2:
      result = v6;
      break;
    case 3:
      result = v6 || v8;
      break;
    case 4:
      result = v8;
      break;
    case 5:
      result = v10 && !v8;
      break;
    case 6:
      result = v10 || v8;
      break;
    case 9:
      result = v7;
      break;
    case 10:
      result = v7 || v9;
      break;
    case 11:
      result = v9;
      break;
    case 12:
      result = v11;
      break;
    case 14:
      result = v12;
      break;
    case 15:
      result = v13;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)strongestSupportedSecurity
{
  NSArray *v2;

  v2 = -[W5WiFiScanResult supportedSecurityTypes](self, "supportedSecurityTypes");
  if (-[NSArray containsObject:](v2, "containsObject:", &unk_24C24E0A0))
    return 12;
  if (-[NSArray containsObject:](v2, "containsObject:", &unk_24C24E070))
    return 11;
  if (-[NSArray containsObject:](v2, "containsObject:", &unk_24C24E040))
    return 9;
  if (-[NSArray containsObject:](v2, "containsObject:", &unk_24C24E088))
    return 5;
  if (-[NSArray containsObject:](v2, "containsObject:", &unk_24C24E058))
    return 4;
  if (-[NSArray containsObject:](v2, "containsObject:", &unk_24C24E028))
    return 2;
  return -[NSArray containsObject:](v2, "containsObject:", &unk_24C24E010);
}

- (BOOL)supportsPHYMode:(int)a3
{
  return (-[W5WiFiScanResult supportedPHYModes](self, "supportedPHYModes") & a3) != 0;
}

- (int)fastestSupportedPHYMode
{
  int v3;

  v3 = 256;
  if (!-[W5WiFiScanResult supportsPHYMode:](self, "supportsPHYMode:", 256))
  {
    v3 = 128;
    if (!-[W5WiFiScanResult supportsPHYMode:](self, "supportsPHYMode:", 128))
    {
      v3 = 16;
      if (!-[W5WiFiScanResult supportsPHYMode:](self, "supportsPHYMode:", 16))
      {
        v3 = 2;
        if (!-[W5WiFiScanResult supportsPHYMode:](self, "supportsPHYMode:", 2))
        {
          v3 = 8;
          if (!-[W5WiFiScanResult supportsPHYMode:](self, "supportsPHYMode:", 8))
          {
            if (-[W5WiFiScanResult supportsPHYMode:](self, "supportsPHYMode:", 4))
              return 4;
            else
              return 0;
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)isAirPortBaseStation:(id *)a3 modelID:(char *)a4
{
  NSString *v5;

  v5 = -[W5WiFiScanResult airPortBaseStationModelName](self, "airPortBaseStationModelName", a3, a4);
  if (a3 && v5)
    *a3 = v5;
  return a3 != 0;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("SSID: %@ (%@)\n"), -[W5WiFiScanResult ssidString](self, "ssidString"), -[W5WiFiScanResult ssid](self, "ssid"));
  objc_msgSend(v3, "appendFormat:", CFSTR("BSSID %@\n"), -[W5WiFiScanResult bssid](self, "bssid"));
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5WiFiScanResult;
  if (-[W5WiFiScanResult conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToScanResult:(id)a3
{
  _BOOL4 v5;

  if (!-[W5WiFiScanResult ssid](self, "ssid") && !objc_msgSend(a3, "ssid")
    || (v5 = -[NSData isEqualToData:](-[W5WiFiScanResult ssid](self, "ssid"), "isEqualToData:", objc_msgSend(a3, "ssid"))))
  {
    LOBYTE(v5) = !-[W5WiFiScanResult bssid](self, "bssid") && !objc_msgSend(a3, "bssid")
              || -[NSString isEqualToString:](-[W5WiFiScanResult bssid](self, "bssid"), "isEqualToString:", objc_msgSend(a3, "bssid"));
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5WiFiScanResult isEqualToScanResult:](self, "isEqualToScanResult:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](-[W5WiFiScanResult ssid](self, "ssid"), "hash");
  return -[NSString hash](-[W5WiFiScanResult bssid](self, "bssid"), "hash") ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5WiFiScanResult *v4;

  v4 = -[W5WiFiScanResult init](+[W5WiFiScanResult allocWithZone:](W5WiFiScanResult, "allocWithZone:", a3), "init");
  -[W5WiFiScanResult setScanRecord:](v4, "setScanRecord:", -[W5WiFiScanResult scanRecord](self, "scanRecord"));
  -[W5WiFiScanResult setSsid:](v4, "setSsid:", -[W5WiFiScanResult ssid](self, "ssid"));
  -[W5WiFiScanResult setSsidString:](v4, "setSsidString:", -[W5WiFiScanResult ssidString](self, "ssidString"));
  -[W5WiFiScanResult setBssid:](v4, "setBssid:", -[W5WiFiScanResult bssid](self, "bssid"));
  -[W5WiFiScanResult setChannel:](v4, "setChannel:", -[W5WiFiScanResult channel](self, "channel"));
  -[W5WiFiScanResult setCountryCode:](v4, "setCountryCode:", -[W5WiFiScanResult countryCode](self, "countryCode"));
  -[W5WiFiScanResult setSupportedSecurityTypes:](v4, "setSupportedSecurityTypes:", -[W5WiFiScanResult supportedSecurityTypes](self, "supportedSecurityTypes"));
  -[W5WiFiScanResult setSupportedPHYModes:](v4, "setSupportedPHYModes:", -[W5WiFiScanResult supportedPHYModes](self, "supportedPHYModes"));
  -[W5WiFiScanResult setBeaconInterval:](v4, "setBeaconInterval:", -[W5WiFiScanResult beaconInterval](self, "beaconInterval"));
  -[W5WiFiScanResult setRssi:](v4, "setRssi:", -[W5WiFiScanResult rssi](self, "rssi"));
  -[W5WiFiScanResult setNoise:](v4, "setNoise:", -[W5WiFiScanResult noise](self, "noise"));
  -[W5WiFiScanResult setIsAppleSWAP:](v4, "setIsAppleSWAP:", -[W5WiFiScanResult isAppleSWAP](self, "isAppleSWAP"));
  -[W5WiFiScanResult setIsPasspoint:](v4, "setIsPasspoint:", -[W5WiFiScanResult isPasspoint](self, "isPasspoint"));
  -[W5WiFiScanResult setIsIBSS:](v4, "setIsIBSS:", -[W5WiFiScanResult isIBSS](self, "isIBSS"));
  -[W5WiFiScanResult setIsPersonalHotspot:](v4, "setIsPersonalHotspot:", -[W5WiFiScanResult isPersonalHotspot](self, "isPersonalHotspot"));
  -[W5WiFiScanResult setAirPortBaseStationModelName:](v4, "setAirPortBaseStationModelName:", -[W5WiFiScanResult airPortBaseStationModelName](self, "airPortBaseStationModelName"));
  -[W5WiFiScanResult setSupportsWEPCipher:](v4, "setSupportsWEPCipher:", -[W5WiFiScanResult supportsWEPCipher](self, "supportsWEPCipher"));
  -[W5WiFiScanResult setSupportsTKIPCipher:](v4, "setSupportsTKIPCipher:", -[W5WiFiScanResult supportsTKIPCipher](self, "supportsTKIPCipher"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_scanRecord, CFSTR("_scanRecord"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ssid, CFSTR("_ssid"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_ssidString, CFSTR("_ssidString"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_bssid, CFSTR("_bssid"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_channel, CFSTR("_channel"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_countryCode, CFSTR("_countryCode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_airPortBaseStationModelName, CFSTR("_airPortBaseStationModelName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_supportedSecurityTypes, CFSTR("_supportedSecurityTypes"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_rssi, CFSTR("_rssi"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_noise, CFSTR("_noise"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_beaconInterval, CFSTR("_beaconInterval"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isIBSS, CFSTR("_isIBSS"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isPasspoint, CFSTR("_isPasspoint"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isPersonalHotspot, CFSTR("_isPersonalHotspot"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isAppleSWAP, CFSTR("_isAppleSWAP"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_supportedPHYModes, CFSTR("_supportedPHYModes"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_supportsWEPCipher, CFSTR("_supportsWEPCipher"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_supportsTKIPCipher, CFSTR("_supportsTKIPCipher"));
}

- (W5WiFiScanResult)initWithCoder:(id)a3
{
  W5WiFiScanResult *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)W5WiFiScanResult;
  v4 = -[W5WiFiScanResult init](&v8, sel_init);
  if (v4)
  {
    v4->_scanRecord = (NSDictionary *)(id)objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("_scanRecord"));
    v4->_ssid = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ssid"));
    v4->_ssidString = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ssidString"));
    v4->_bssid = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bssid"));
    v4->_airPortBaseStationModelName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_airPortBaseStationModelName"));
    v4->_countryCode = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_countryCode"));
    v4->_channel = (W5WiFiChannel *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_channel"));
    v4->_rssi = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_rssi"));
    v4->_noise = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_noise"));
    v4->_beaconInterval = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_beaconInterval"));
    v4->_isIBSS = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isIBSS"));
    v4->_isPersonalHotspot = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isPersonalHotspot"));
    v4->_isPasspoint = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isPasspoint"));
    v4->_isAppleSWAP = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_isAppleSWAP"));
    v4->_supportedPHYModes = objc_msgSend(a3, "decodeIntForKey:", CFSTR("_supportedPHYModes"));
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v4->_supportedSecurityTypes = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("_supportedSecurityTypes"));
    v4->_supportsWEPCipher = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_supportsWEPCipher"));
    v4->_supportsTKIPCipher = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_supportsTKIPCipher"));
  }
  return v4;
}

- (NSDictionary)scanRecord
{
  return self->_scanRecord;
}

- (void)setScanRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)ssidString
{
  return self->_ssidString;
}

- (void)setSsidString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)supportedSecurityTypes
{
  return self->_supportedSecurityTypes;
}

- (void)setSupportedSecurityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)supportedPHYModes
{
  return self->_supportedPHYModes;
}

- (void)setSupportedPHYModes:(int)a3
{
  self->_supportedPHYModes = a3;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (int64_t)noise
{
  return self->_noise;
}

- (void)setNoise:(int64_t)a3
{
  self->_noise = a3;
}

- (BOOL)isIBSS
{
  return self->_isIBSS;
}

- (void)setIsIBSS:(BOOL)a3
{
  self->_isIBSS = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)beaconInterval
{
  return self->_beaconInterval;
}

- (void)setBeaconInterval:(int64_t)a3
{
  self->_beaconInterval = a3;
}

- (BOOL)isPasspoint
{
  return self->_isPasspoint;
}

- (void)setIsPasspoint:(BOOL)a3
{
  self->_isPasspoint = a3;
}

- (BOOL)isPersonalHotspot
{
  return self->_isPersonalHotspot;
}

- (void)setIsPersonalHotspot:(BOOL)a3
{
  self->_isPersonalHotspot = a3;
}

- (BOOL)isAppleSWAP
{
  return self->_isAppleSWAP;
}

- (void)setIsAppleSWAP:(BOOL)a3
{
  self->_isAppleSWAP = a3;
}

- (NSString)airPortBaseStationModelName
{
  return self->_airPortBaseStationModelName;
}

- (void)setAirPortBaseStationModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (W5WiFiChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)supportsWEPCipher
{
  return self->_supportsWEPCipher;
}

- (void)setSupportsWEPCipher:(BOOL)a3
{
  self->_supportsWEPCipher = a3;
}

- (BOOL)supportsTKIPCipher
{
  return self->_supportsTKIPCipher;
}

- (void)setSupportsTKIPCipher:(BOOL)a3
{
  self->_supportsTKIPCipher = a3;
}

@end
