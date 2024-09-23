@implementation SSVPBPlayActivityEnqueuerProperties

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (BOOL)hasDeviceGUID
{
  return self->_deviceGUID != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasTimeZoneName
{
  return self->_timeZoneName != 0;
}

- (int)systemReleaseType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_systemReleaseType;
  else
    return 0;
}

- (void)setSystemReleaseType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_systemReleaseType = a3;
}

- (void)setHasSystemReleaseType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSystemReleaseType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)systemReleaseTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E47BA428[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSystemReleaseType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOMER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARRIER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVELOPER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INTERNAL")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSBEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_sBEnabled = a3;
}

- (void)setHasSBEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSBEnabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setStoreAccountID:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_storeAccountID = a3;
}

- (void)setHasStoreAccountID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStoreAccountID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasStoreFrontID
{
  return self->_storeFrontID != 0;
}

- (void)setPrivateListeningEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_privateListeningEnabled = a3;
}

- (void)setHasPrivateListeningEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPrivateListeningEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SSVPBPlayActivityEnqueuerProperties;
  -[SSVPBPlayActivityEnqueuerProperties description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEnqueuerProperties dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *buildVersion;
  NSString *deviceGUID;
  NSString *deviceName;
  NSString *timeZoneName;
  char has;
  uint64_t systemReleaseType;
  __CFString *v11;
  void *v12;
  void *v13;
  NSString *storeFrontID;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  buildVersion = self->_buildVersion;
  if (buildVersion)
    objc_msgSend(v3, "setObject:forKey:", buildVersion, CFSTR("buildVersion"));
  deviceGUID = self->_deviceGUID;
  if (deviceGUID)
    objc_msgSend(v4, "setObject:forKey:", deviceGUID, CFSTR("deviceGUID"));
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v4, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  timeZoneName = self->_timeZoneName;
  if (timeZoneName)
    objc_msgSend(v4, "setObject:forKey:", timeZoneName, CFSTR("timeZoneName"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    systemReleaseType = self->_systemReleaseType;
    if (systemReleaseType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_systemReleaseType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E47BA428[systemReleaseType];
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("systemReleaseType"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sBEnabled);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("SBEnabled"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_storeAccountID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("storeAccountID"));

  }
  storeFrontID = self->_storeFrontID;
  if (storeFrontID)
    objc_msgSend(v4, "setObject:forKey:", storeFrontID, CFSTR("storeFrontID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_privateListeningEnabled);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("privateListeningEnabled"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SSVPBPlayActivityEnqueuerPropertiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_buildVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_deviceGUID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_timeZoneName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 1) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
LABEL_13:
  if (self->_storeFrontID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_buildVersion)
  {
    objc_msgSend(v4, "setBuildVersion:");
    v4 = v6;
  }
  if (self->_deviceGUID)
  {
    objc_msgSend(v6, "setDeviceGUID:");
    v4 = v6;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v6, "setDeviceName:");
    v4 = v6;
  }
  if (self->_timeZoneName)
  {
    objc_msgSend(v6, "setTimeZoneName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_systemReleaseType;
    *((_BYTE *)v4 + 68) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 1) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_BYTE *)v4 + 65) = self->_sBEnabled;
  *((_BYTE *)v4 + 68) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_12:
    *((_QWORD *)v4 + 1) = self->_storeAccountID;
    *((_BYTE *)v4 + 68) |= 1u;
  }
LABEL_13:
  if (self->_storeFrontID)
  {
    objc_msgSend(v6, "setStoreFrontID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 64) = self->_privateListeningEnabled;
    *((_BYTE *)v4 + 68) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char has;
  uint64_t v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_buildVersion, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_deviceGUID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_timeZoneName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_systemReleaseType;
    *(_BYTE *)(v5 + 68) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 65) = self->_sBEnabled;
  *(_BYTE *)(v5 + 68) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 8) = self->_storeAccountID;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
LABEL_5:
  v15 = -[NSString copyWithZone:](self->_storeFrontID, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_privateListeningEnabled;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *buildVersion;
  NSString *deviceGUID;
  NSString *deviceName;
  NSString *timeZoneName;
  char has;
  NSString *storeFrontID;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](buildVersion, "isEqual:"))
      goto LABEL_33;
  }
  deviceGUID = self->_deviceGUID;
  if ((unint64_t)deviceGUID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceGUID, "isEqual:"))
      goto LABEL_33;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:"))
      goto LABEL_33;
  }
  timeZoneName = self->_timeZoneName;
  if ((unint64_t)timeZoneName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](timeZoneName, "isEqual:"))
      goto LABEL_33;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_systemReleaseType != *((_DWORD *)v4 + 12))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0)
      goto LABEL_33;
    if (self->_sBEnabled)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_33;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_33;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_storeAccountID != *((_QWORD *)v4 + 1))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_33;
  }
  storeFrontID = self->_storeFrontID;
  if ((unint64_t)storeFrontID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](storeFrontID, "isEqual:"))
      goto LABEL_33;
    has = (char)self->_has;
  }
  v11 = (*((_BYTE *)v4 + 68) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) != 0)
    {
      if (self->_privateListeningEnabled)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_33;
      }
      else if (*((_BYTE *)v4 + 64))
      {
        goto LABEL_33;
      }
      v11 = 1;
      goto LABEL_34;
    }
LABEL_33:
    v11 = 0;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_buildVersion, "hash");
  v4 = -[NSString hash](self->_deviceGUID, "hash");
  v5 = -[NSString hash](self->_deviceName, "hash");
  v6 = -[NSString hash](self->_timeZoneName, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v7 = 2654435761 * self->_systemReleaseType;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v8 = 2654435761 * self->_sBEnabled;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v9 = 2654435761u * self->_storeAccountID;
    goto LABEL_8;
  }
LABEL_7:
  v9 = 0;
LABEL_8:
  v10 = -[NSString hash](self->_storeFrontID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_privateListeningEnabled;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[SSVPBPlayActivityEnqueuerProperties setBuildVersion:](self, "setBuildVersion:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[SSVPBPlayActivityEnqueuerProperties setDeviceGUID:](self, "setDeviceGUID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[SSVPBPlayActivityEnqueuerProperties setDeviceName:](self, "setDeviceName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[SSVPBPlayActivityEnqueuerProperties setTimeZoneName:](self, "setTimeZoneName:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 2) != 0)
  {
    self->_systemReleaseType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 68);
    if ((v5 & 8) == 0)
    {
LABEL_11:
      if ((v5 & 1) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 8) == 0)
  {
    goto LABEL_11;
  }
  self->_sBEnabled = *((_BYTE *)v4 + 65);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_12:
    self->_storeAccountID = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 5))
  {
    -[SSVPBPlayActivityEnqueuerProperties setStoreFrontID:](self, "setStoreFrontID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    self->_privateListeningEnabled = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (void)setDeviceGUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceGUID, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (void)setTimeZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneName, a3);
}

- (BOOL)sBEnabled
{
  return self->_sBEnabled;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (void)setStoreFrontID:(id)a3
{
  objc_storeStrong((id *)&self->_storeFrontID, a3);
}

- (BOOL)privateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
