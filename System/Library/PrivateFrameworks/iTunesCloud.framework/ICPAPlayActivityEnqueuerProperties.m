@implementation ICPAPlayActivityEnqueuerProperties

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICPAPlayActivityEnqueuerProperties;
  -[ICPAPlayActivityEnqueuerProperties description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPAPlayActivityEnqueuerProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v10;
  NSString *storeFrontID;
  void *v12;
  void *v14;
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_systemReleaseType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("systemReleaseType"));

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sBEnabled);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("SBEnabled"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_storeAccountID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("storeAccountID"));

  }
LABEL_13:
  storeFrontID = self->_storeFrontID;
  if (storeFrontID)
    objc_msgSend(v4, "setObject:forKey:", storeFrontID, CFSTR("storeFrontID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_privateListeningEnabled);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("privateListeningEnabled"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ICPAPlayActivityEnqueuerPropertiesReadFrom((uint64_t)self, (uint64_t)a3);
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
  char v10;
  NSString *storeFrontID;
  BOOL v12;

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
  v10 = *((_BYTE *)v4 + 68);
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
    v10 = *((_BYTE *)v4 + 68);
  }
  v12 = (v10 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v10 & 4) != 0)
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
      v12 = 1;
      goto LABEL_34;
    }
LABEL_33:
    v12 = 0;
  }
LABEL_34:

  return v12;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
