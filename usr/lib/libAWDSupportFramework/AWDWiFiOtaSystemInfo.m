@implementation AWDWiFiOtaSystemInfo

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiOtaSystemInfo setBeaconInfo:](self, "setBeaconInfo:", 0);
  -[AWDWiFiOtaSystemInfo setSsid:](self, "setSsid:", 0);
  -[AWDWiFiOtaSystemInfo setBssid:](self, "setBssid:", 0);
  -[AWDWiFiOtaSystemInfo setWpsResponseType:](self, "setWpsResponseType:", 0);
  -[AWDWiFiOtaSystemInfo setWpsManufacturerElement:](self, "setWpsManufacturerElement:", 0);
  -[AWDWiFiOtaSystemInfo setWpsModelName:](self, "setWpsModelName:", 0);
  -[AWDWiFiOtaSystemInfo setWpsModelNumber:](self, "setWpsModelNumber:", 0);
  -[AWDWiFiOtaSystemInfo setWpsPrimaryDeviceTypeCategory:](self, "setWpsPrimaryDeviceTypeCategory:", 0);
  -[AWDWiFiOtaSystemInfo setWpsPrimaryDeviceTypeSubCategory:](self, "setWpsPrimaryDeviceTypeSubCategory:", 0);
  -[AWDWiFiOtaSystemInfo setWpsDeviceNameElement:](self, "setWpsDeviceNameElement:", 0);
  -[AWDWiFiOtaSystemInfo setWpsDeviceNameData:](self, "setWpsDeviceNameData:", 0);
  -[AWDWiFiOtaSystemInfo setWpsConfigMethods:](self, "setWpsConfigMethods:", 0);
  -[AWDWiFiOtaSystemInfo setLocale:](self, "setLocale:", 0);
  -[AWDWiFiOtaSystemInfo setLocaleSource:](self, "setLocaleSource:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiOtaSystemInfo;
  -[AWDWiFiOtaSystemInfo dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBeaconInfo
{
  return self->_beaconInfo != 0;
}

- (BOOL)hasSsid
{
  return self->_ssid != 0;
}

- (BOOL)hasBssid
{
  return self->_bssid != 0;
}

- (BOOL)hasWpsResponseType
{
  return self->_wpsResponseType != 0;
}

- (BOOL)hasWpsManufacturerElement
{
  return self->_wpsManufacturerElement != 0;
}

- (BOOL)hasWpsModelName
{
  return self->_wpsModelName != 0;
}

- (BOOL)hasWpsModelNumber
{
  return self->_wpsModelNumber != 0;
}

- (BOOL)hasWpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory != 0;
}

- (BOOL)hasWpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory != 0;
}

- (BOOL)hasWpsDeviceNameElement
{
  return self->_wpsDeviceNameElement != 0;
}

- (BOOL)hasWpsDeviceNameData
{
  return self->_wpsDeviceNameData != 0;
}

- (BOOL)hasWpsConfigMethods
{
  return self->_wpsConfigMethods != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasLocaleSource
{
  return self->_localeSource != 0;
}

- (void)setChannel:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChannel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setChannelWidth:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_channelWidth = a3;
}

- (void)setHasChannelWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasChannelWidth
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiOtaSystemInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiOtaSystemInfo description](&v3, sel_description), -[AWDWiFiOtaSystemInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSData *beaconInfo;
  NSString *ssid;
  NSString *bssid;
  NSString *wpsResponseType;
  NSString *wpsManufacturerElement;
  NSString *wpsModelName;
  NSString *wpsModelNumber;
  NSString *wpsPrimaryDeviceTypeCategory;
  NSString *wpsPrimaryDeviceTypeSubCategory;
  NSString *wpsDeviceNameElement;
  NSString *wpsDeviceNameData;
  NSString *wpsConfigMethods;
  NSString *locale;
  NSString *localeSource;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  beaconInfo = self->_beaconInfo;
  if (beaconInfo)
    objc_msgSend(v3, "setObject:forKey:", beaconInfo, CFSTR("beaconInfo"));
  ssid = self->_ssid;
  if (ssid)
    objc_msgSend(v3, "setObject:forKey:", ssid, CFSTR("ssid"));
  bssid = self->_bssid;
  if (bssid)
    objc_msgSend(v3, "setObject:forKey:", bssid, CFSTR("bssid"));
  wpsResponseType = self->_wpsResponseType;
  if (wpsResponseType)
    objc_msgSend(v3, "setObject:forKey:", wpsResponseType, CFSTR("wpsResponseType"));
  wpsManufacturerElement = self->_wpsManufacturerElement;
  if (wpsManufacturerElement)
    objc_msgSend(v3, "setObject:forKey:", wpsManufacturerElement, CFSTR("wpsManufacturerElement"));
  wpsModelName = self->_wpsModelName;
  if (wpsModelName)
    objc_msgSend(v3, "setObject:forKey:", wpsModelName, CFSTR("wpsModelName"));
  wpsModelNumber = self->_wpsModelNumber;
  if (wpsModelNumber)
    objc_msgSend(v3, "setObject:forKey:", wpsModelNumber, CFSTR("wpsModelNumber"));
  wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;
  if (wpsPrimaryDeviceTypeCategory)
    objc_msgSend(v3, "setObject:forKey:", wpsPrimaryDeviceTypeCategory, CFSTR("wpsPrimaryDeviceTypeCategory"));
  wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;
  if (wpsPrimaryDeviceTypeSubCategory)
    objc_msgSend(v3, "setObject:forKey:", wpsPrimaryDeviceTypeSubCategory, CFSTR("wpsPrimaryDeviceTypeSubCategory"));
  wpsDeviceNameElement = self->_wpsDeviceNameElement;
  if (wpsDeviceNameElement)
    objc_msgSend(v3, "setObject:forKey:", wpsDeviceNameElement, CFSTR("wpsDeviceNameElement"));
  wpsDeviceNameData = self->_wpsDeviceNameData;
  if (wpsDeviceNameData)
    objc_msgSend(v3, "setObject:forKey:", wpsDeviceNameData, CFSTR("wpsDeviceNameData"));
  wpsConfigMethods = self->_wpsConfigMethods;
  if (wpsConfigMethods)
    objc_msgSend(v3, "setObject:forKey:", wpsConfigMethods, CFSTR("wpsConfigMethods"));
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKey:", locale, CFSTR("locale"));
  localeSource = self->_localeSource;
  if (localeSource)
    objc_msgSend(v3, "setObject:forKey:", localeSource, CFSTR("localeSource"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channel), CFSTR("channel"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelWidth), CFSTR("channelWidth"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiOtaSystemInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_beaconInfo)
    PBDataWriterWriteDataField();
  if (self->_ssid)
    PBDataWriterWriteStringField();
  if (self->_bssid)
    PBDataWriterWriteStringField();
  if (self->_wpsResponseType)
    PBDataWriterWriteStringField();
  if (self->_wpsManufacturerElement)
    PBDataWriterWriteStringField();
  if (self->_wpsModelName)
    PBDataWriterWriteStringField();
  if (self->_wpsModelNumber)
    PBDataWriterWriteStringField();
  if (self->_wpsPrimaryDeviceTypeCategory)
    PBDataWriterWriteStringField();
  if (self->_wpsPrimaryDeviceTypeSubCategory)
    PBDataWriterWriteStringField();
  if (self->_wpsDeviceNameElement)
    PBDataWriterWriteStringField();
  if (self->_wpsDeviceNameData)
    PBDataWriterWriteStringField();
  if (self->_wpsConfigMethods)
    PBDataWriterWriteStringField();
  if (self->_locale)
    PBDataWriterWriteStringField();
  if (self->_localeSource)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 136) |= 1u;
  }
  if (self->_beaconInfo)
    objc_msgSend(a3, "setBeaconInfo:");
  if (self->_ssid)
    objc_msgSend(a3, "setSsid:");
  if (self->_bssid)
    objc_msgSend(a3, "setBssid:");
  if (self->_wpsResponseType)
    objc_msgSend(a3, "setWpsResponseType:");
  if (self->_wpsManufacturerElement)
    objc_msgSend(a3, "setWpsManufacturerElement:");
  if (self->_wpsModelName)
    objc_msgSend(a3, "setWpsModelName:");
  if (self->_wpsModelNumber)
    objc_msgSend(a3, "setWpsModelNumber:");
  if (self->_wpsPrimaryDeviceTypeCategory)
    objc_msgSend(a3, "setWpsPrimaryDeviceTypeCategory:");
  if (self->_wpsPrimaryDeviceTypeSubCategory)
    objc_msgSend(a3, "setWpsPrimaryDeviceTypeSubCategory:");
  if (self->_wpsDeviceNameElement)
    objc_msgSend(a3, "setWpsDeviceNameElement:");
  if (self->_wpsDeviceNameData)
    objc_msgSend(a3, "setWpsDeviceNameData:");
  if (self->_wpsConfigMethods)
    objc_msgSend(a3, "setWpsConfigMethods:");
  if (self->_locale)
    objc_msgSend(a3, "setLocale:");
  if (self->_localeSource)
    objc_msgSend(a3, "setLocaleSource:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_channel;
    *((_BYTE *)a3 + 136) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_channelWidth;
    *((_BYTE *)a3 + 136) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 136) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[NSData copyWithZone:](self->_beaconInfo, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 56) = -[NSString copyWithZone:](self->_ssid, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_bssid, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 128) = -[NSString copyWithZone:](self->_wpsResponseType, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 88) = -[NSString copyWithZone:](self->_wpsManufacturerElement, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 96) = -[NSString copyWithZone:](self->_wpsModelName, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 104) = -[NSString copyWithZone:](self->_wpsModelNumber, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 112) = -[NSString copyWithZone:](self->_wpsPrimaryDeviceTypeCategory, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 120) = -[NSString copyWithZone:](self->_wpsPrimaryDeviceTypeSubCategory, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 80) = -[NSString copyWithZone:](self->_wpsDeviceNameElement, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 72) = -[NSString copyWithZone:](self->_wpsDeviceNameData, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 64) = -[NSString copyWithZone:](self->_wpsConfigMethods, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_localeSource, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_channel;
    *(_BYTE *)(v6 + 136) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_channelWidth;
    *(_BYTE *)(v6 + 136) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *beaconInfo;
  NSString *ssid;
  NSString *bssid;
  NSString *wpsResponseType;
  NSString *wpsManufacturerElement;
  NSString *wpsModelName;
  NSString *wpsModelNumber;
  NSString *wpsPrimaryDeviceTypeCategory;
  NSString *wpsPrimaryDeviceTypeSubCategory;
  NSString *wpsDeviceNameElement;
  NSString *wpsDeviceNameData;
  NSString *wpsConfigMethods;
  NSString *locale;
  NSString *localeSource;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 136) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 136) & 1) != 0)
    {
LABEL_44:
      LOBYTE(v5) = 0;
      return v5;
    }
    beaconInfo = self->_beaconInfo;
    if (!((unint64_t)beaconInfo | *((_QWORD *)a3 + 2)) || (v5 = -[NSData isEqual:](beaconInfo, "isEqual:")) != 0)
    {
      ssid = self->_ssid;
      if (!((unint64_t)ssid | *((_QWORD *)a3 + 7)) || (v5 = -[NSString isEqual:](ssid, "isEqual:")) != 0)
      {
        bssid = self->_bssid;
        if (!((unint64_t)bssid | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](bssid, "isEqual:")) != 0)
        {
          wpsResponseType = self->_wpsResponseType;
          if (!((unint64_t)wpsResponseType | *((_QWORD *)a3 + 16))
            || (v5 = -[NSString isEqual:](wpsResponseType, "isEqual:")) != 0)
          {
            wpsManufacturerElement = self->_wpsManufacturerElement;
            if (!((unint64_t)wpsManufacturerElement | *((_QWORD *)a3 + 11))
              || (v5 = -[NSString isEqual:](wpsManufacturerElement, "isEqual:")) != 0)
            {
              wpsModelName = self->_wpsModelName;
              if (!((unint64_t)wpsModelName | *((_QWORD *)a3 + 12))
                || (v5 = -[NSString isEqual:](wpsModelName, "isEqual:")) != 0)
              {
                wpsModelNumber = self->_wpsModelNumber;
                if (!((unint64_t)wpsModelNumber | *((_QWORD *)a3 + 13))
                  || (v5 = -[NSString isEqual:](wpsModelNumber, "isEqual:")) != 0)
                {
                  wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;
                  if (!((unint64_t)wpsPrimaryDeviceTypeCategory | *((_QWORD *)a3 + 14))
                    || (v5 = -[NSString isEqual:](wpsPrimaryDeviceTypeCategory, "isEqual:")) != 0)
                  {
                    wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;
                    if (!((unint64_t)wpsPrimaryDeviceTypeSubCategory | *((_QWORD *)a3 + 15))
                      || (v5 = -[NSString isEqual:](wpsPrimaryDeviceTypeSubCategory, "isEqual:")) != 0)
                    {
                      wpsDeviceNameElement = self->_wpsDeviceNameElement;
                      if (!((unint64_t)wpsDeviceNameElement | *((_QWORD *)a3 + 10))
                        || (v5 = -[NSString isEqual:](wpsDeviceNameElement, "isEqual:")) != 0)
                      {
                        wpsDeviceNameData = self->_wpsDeviceNameData;
                        if (!((unint64_t)wpsDeviceNameData | *((_QWORD *)a3 + 9))
                          || (v5 = -[NSString isEqual:](wpsDeviceNameData, "isEqual:")) != 0)
                        {
                          wpsConfigMethods = self->_wpsConfigMethods;
                          if (!((unint64_t)wpsConfigMethods | *((_QWORD *)a3 + 8))
                            || (v5 = -[NSString isEqual:](wpsConfigMethods, "isEqual:")) != 0)
                          {
                            locale = self->_locale;
                            if (!((unint64_t)locale | *((_QWORD *)a3 + 5))
                              || (v5 = -[NSString isEqual:](locale, "isEqual:")) != 0)
                            {
                              localeSource = self->_localeSource;
                              if (!((unint64_t)localeSource | *((_QWORD *)a3 + 6))
                                || (v5 = -[NSString isEqual:](localeSource, "isEqual:")) != 0)
                              {
                                if ((*(_BYTE *)&self->_has & 2) != 0)
                                {
                                  if ((*((_BYTE *)a3 + 136) & 2) == 0 || self->_channel != *((_DWORD *)a3 + 8))
                                    goto LABEL_44;
                                }
                                else if ((*((_BYTE *)a3 + 136) & 2) != 0)
                                {
                                  goto LABEL_44;
                                }
                                LOBYTE(v5) = (*((_BYTE *)a3 + 136) & 4) == 0;
                                if ((*(_BYTE *)&self->_has & 4) != 0)
                                {
                                  if ((*((_BYTE *)a3 + 136) & 4) == 0 || self->_channelWidth != *((_DWORD *)a3 + 9))
                                    goto LABEL_44;
                                  LOBYTE(v5) = 1;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  unint64_t v20;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v20 = 2654435761u * self->_timestamp;
  else
    v20 = 0;
  v19 = -[NSData hash](self->_beaconInfo, "hash");
  v18 = -[NSString hash](self->_ssid, "hash");
  v17 = -[NSString hash](self->_bssid, "hash");
  v16 = -[NSString hash](self->_wpsResponseType, "hash");
  v15 = -[NSString hash](self->_wpsManufacturerElement, "hash");
  v3 = -[NSString hash](self->_wpsModelName, "hash");
  v4 = -[NSString hash](self->_wpsModelNumber, "hash");
  v5 = -[NSString hash](self->_wpsPrimaryDeviceTypeCategory, "hash");
  v6 = -[NSString hash](self->_wpsPrimaryDeviceTypeSubCategory, "hash");
  v7 = -[NSString hash](self->_wpsDeviceNameElement, "hash");
  v8 = -[NSString hash](self->_wpsDeviceNameData, "hash");
  v9 = -[NSString hash](self->_wpsConfigMethods, "hash");
  v10 = -[NSString hash](self->_locale, "hash");
  v11 = -[NSString hash](self->_localeSource, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v12 = 2654435761 * self->_channel;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v13 = 0;
    return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  v12 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v13 = 2654435761 * self->_channelWidth;
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 136) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDWiFiOtaSystemInfo setBeaconInfo:](self, "setBeaconInfo:");
  if (*((_QWORD *)a3 + 7))
    -[AWDWiFiOtaSystemInfo setSsid:](self, "setSsid:");
  if (*((_QWORD *)a3 + 3))
    -[AWDWiFiOtaSystemInfo setBssid:](self, "setBssid:");
  if (*((_QWORD *)a3 + 16))
    -[AWDWiFiOtaSystemInfo setWpsResponseType:](self, "setWpsResponseType:");
  if (*((_QWORD *)a3 + 11))
    -[AWDWiFiOtaSystemInfo setWpsManufacturerElement:](self, "setWpsManufacturerElement:");
  if (*((_QWORD *)a3 + 12))
    -[AWDWiFiOtaSystemInfo setWpsModelName:](self, "setWpsModelName:");
  if (*((_QWORD *)a3 + 13))
    -[AWDWiFiOtaSystemInfo setWpsModelNumber:](self, "setWpsModelNumber:");
  if (*((_QWORD *)a3 + 14))
    -[AWDWiFiOtaSystemInfo setWpsPrimaryDeviceTypeCategory:](self, "setWpsPrimaryDeviceTypeCategory:");
  if (*((_QWORD *)a3 + 15))
    -[AWDWiFiOtaSystemInfo setWpsPrimaryDeviceTypeSubCategory:](self, "setWpsPrimaryDeviceTypeSubCategory:");
  if (*((_QWORD *)a3 + 10))
    -[AWDWiFiOtaSystemInfo setWpsDeviceNameElement:](self, "setWpsDeviceNameElement:");
  if (*((_QWORD *)a3 + 9))
    -[AWDWiFiOtaSystemInfo setWpsDeviceNameData:](self, "setWpsDeviceNameData:");
  if (*((_QWORD *)a3 + 8))
    -[AWDWiFiOtaSystemInfo setWpsConfigMethods:](self, "setWpsConfigMethods:");
  if (*((_QWORD *)a3 + 5))
    -[AWDWiFiOtaSystemInfo setLocale:](self, "setLocale:");
  if (*((_QWORD *)a3 + 6))
    -[AWDWiFiOtaSystemInfo setLocaleSource:](self, "setLocaleSource:");
  v5 = *((_BYTE *)a3 + 136);
  if ((v5 & 2) != 0)
  {
    self->_channel = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 136);
  }
  if ((v5 & 4) != 0)
  {
    self->_channelWidth = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)beaconInfo
{
  return self->_beaconInfo;
}

- (void)setBeaconInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)wpsResponseType
{
  return self->_wpsResponseType;
}

- (void)setWpsResponseType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSString)wpsManufacturerElement
{
  return self->_wpsManufacturerElement;
}

- (void)setWpsManufacturerElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSString)wpsModelName
{
  return self->_wpsModelName;
}

- (void)setWpsModelName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSString)wpsModelNumber
{
  return self->_wpsModelNumber;
}

- (void)setWpsModelNumber:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSString)wpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory;
}

- (void)setWpsPrimaryDeviceTypeCategory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSString)wpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory;
}

- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSString)wpsDeviceNameElement
{
  return self->_wpsDeviceNameElement;
}

- (void)setWpsDeviceNameElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)wpsDeviceNameData
{
  return self->_wpsDeviceNameData;
}

- (void)setWpsDeviceNameData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSString)wpsConfigMethods
{
  return self->_wpsConfigMethods;
}

- (void)setWpsConfigMethods:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)localeSource
{
  return self->_localeSource;
}

- (void)setLocaleSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)channelWidth
{
  return self->_channelWidth;
}

@end
