@implementation OTEscrowRecordMetadataClientMetadata

- (void)setSecureBackupMetadataTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_secureBackupMetadataTimestamp = a3;
}

- (void)setHasSecureBackupMetadataTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSecureBackupMetadataTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSecureBackupNumericPassphraseLength:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_secureBackupNumericPassphraseLength = a3;
}

- (void)setHasSecureBackupNumericPassphraseLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecureBackupNumericPassphraseLength
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSecureBackupUsesComplexPassphrase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_secureBackupUsesComplexPassphrase = a3;
}

- (void)setHasSecureBackupUsesComplexPassphrase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSecureBackupUsesComplexPassphrase
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSecureBackupUsesNumericPassphrase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_secureBackupUsesNumericPassphrase = a3;
}

- (void)setHasSecureBackupUsesNumericPassphrase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSecureBackupUsesNumericPassphrase
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasDeviceColor
{
  return self->_deviceColor != 0;
}

- (BOOL)hasDeviceEnclosureColor
{
  return self->_deviceEnclosureColor != 0;
}

- (BOOL)hasDeviceMid
{
  return self->_deviceMid != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasDeviceModelClass
{
  return self->_deviceModelClass != 0;
}

- (BOOL)hasDeviceModelVersion
{
  return self->_deviceModelVersion != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (void)setDevicePlatform:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_devicePlatform = a3;
}

- (void)setHasDevicePlatform:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDevicePlatform
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)OTEscrowRecordMetadataClientMetadata;
  -[OTEscrowRecordMetadataClientMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTEscrowRecordMetadataClientMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSString *deviceColor;
  NSString *deviceEnclosureColor;
  NSString *deviceMid;
  NSString *deviceModel;
  NSString *deviceModelClass;
  NSString *deviceModelVersion;
  NSString *deviceName;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_secureBackupMetadataTimestamp);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("secure_backup_metadata_timestamp"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_secureBackupNumericPassphraseLength);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("secure_backup_numeric_passphrase_length"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_secureBackupUsesComplexPassphrase);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("secure_backup_uses_complex_passphrase"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_secureBackupUsesNumericPassphrase);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("secure_backup_uses_numeric_passphrase"));

  }
LABEL_6:
  deviceColor = self->_deviceColor;
  if (deviceColor)
    objc_msgSend(v3, "setObject:forKey:", deviceColor, CFSTR("device_color"));
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if (deviceEnclosureColor)
    objc_msgSend(v3, "setObject:forKey:", deviceEnclosureColor, CFSTR("device_enclosure_color"));
  deviceMid = self->_deviceMid;
  if (deviceMid)
    objc_msgSend(v3, "setObject:forKey:", deviceMid, CFSTR("device_mid"));
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("device_model"));
  deviceModelClass = self->_deviceModelClass;
  if (deviceModelClass)
    objc_msgSend(v3, "setObject:forKey:", deviceModelClass, CFSTR("device_model_class"));
  deviceModelVersion = self->_deviceModelVersion;
  if (deviceModelVersion)
    objc_msgSend(v3, "setObject:forKey:", deviceModelVersion, CFSTR("device_model_version"));
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKey:", deviceName, CFSTR("device_name"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_devicePlatform);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("device_platform"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTEscrowRecordMetadataClientMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_5:
    PBDataWriterWriteUint64Field();
LABEL_6:
  if (self->_deviceColor)
    PBDataWriterWriteStringField();
  if (self->_deviceEnclosureColor)
    PBDataWriterWriteStringField();
  if (self->_deviceMid)
    PBDataWriterWriteStringField();
  if (self->_deviceModel)
    PBDataWriterWriteStringField();
  if (self->_deviceModelClass)
    PBDataWriterWriteStringField();
  if (self->_deviceModelVersion)
    PBDataWriterWriteStringField();
  if (self->_deviceName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_secureBackupMetadataTimestamp;
    *((_BYTE *)v4 + 104) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_secureBackupNumericPassphraseLength;
  *((_BYTE *)v4 + 104) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_25:
  v4[4] = self->_secureBackupUsesComplexPassphrase;
  *((_BYTE *)v4 + 104) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v4[5] = self->_secureBackupUsesNumericPassphrase;
    *((_BYTE *)v4 + 104) |= 0x10u;
  }
LABEL_6:
  v6 = v4;
  if (self->_deviceColor)
  {
    objc_msgSend(v4, "setDeviceColor:");
    v4 = v6;
  }
  if (self->_deviceEnclosureColor)
  {
    objc_msgSend(v6, "setDeviceEnclosureColor:");
    v4 = v6;
  }
  if (self->_deviceMid)
  {
    objc_msgSend(v6, "setDeviceMid:");
    v4 = v6;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v6, "setDeviceModel:");
    v4 = v6;
  }
  if (self->_deviceModelClass)
  {
    objc_msgSend(v6, "setDeviceModelClass:");
    v4 = v6;
  }
  if (self->_deviceModelVersion)
  {
    objc_msgSend(v6, "setDeviceModelVersion:");
    v4 = v6;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v6, "setDeviceName:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_devicePlatform;
    *((_BYTE *)v4 + 104) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_secureBackupMetadataTimestamp;
    *(_BYTE *)(v5 + 104) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 24) = self->_secureBackupNumericPassphraseLength;
  *(_BYTE *)(v5 + 104) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  *(_QWORD *)(v5 + 32) = self->_secureBackupUsesComplexPassphrase;
  *(_BYTE *)(v5 + 104) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *(_QWORD *)(v5 + 40) = self->_secureBackupUsesNumericPassphrase;
    *(_BYTE *)(v5 + 104) |= 0x10u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_deviceColor, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_deviceEnclosureColor, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_deviceMid, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v12;

  v14 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v14;

  v16 = -[NSString copyWithZone:](self->_deviceModelClass, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v16;

  v18 = -[NSString copyWithZone:](self->_deviceModelVersion, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v18;

  v20 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v20;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_devicePlatform;
    *(_BYTE *)(v6 + 104) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *deviceColor;
  NSString *deviceEnclosureColor;
  NSString *deviceMid;
  NSString *deviceModel;
  NSString *deviceModelClass;
  NSString *deviceModelVersion;
  NSString *deviceName;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 2) == 0 || self->_secureBackupMetadataTimestamp != *((_QWORD *)v4 + 2))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 104) & 2) != 0)
  {
LABEL_40:
    v12 = 0;
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 4) == 0 || self->_secureBackupNumericPassphraseLength != *((_QWORD *)v4 + 3))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 104) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 8) == 0 || self->_secureBackupUsesComplexPassphrase != *((_QWORD *)v4 + 4))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 104) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 0x10) == 0 || self->_secureBackupUsesNumericPassphrase != *((_QWORD *)v4 + 5))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 104) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  deviceColor = self->_deviceColor;
  if ((unint64_t)deviceColor | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](deviceColor, "isEqual:"))
  {
    goto LABEL_40;
  }
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if ((unint64_t)deviceEnclosureColor | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](deviceEnclosureColor, "isEqual:"))
      goto LABEL_40;
  }
  deviceMid = self->_deviceMid;
  if ((unint64_t)deviceMid | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](deviceMid, "isEqual:"))
      goto LABEL_40;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:"))
      goto LABEL_40;
  }
  deviceModelClass = self->_deviceModelClass;
  if ((unint64_t)deviceModelClass | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](deviceModelClass, "isEqual:"))
      goto LABEL_40;
  }
  deviceModelVersion = self->_deviceModelVersion;
  if ((unint64_t)deviceModelVersion | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](deviceModelVersion, "isEqual:"))
      goto LABEL_40;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:"))
      goto LABEL_40;
  }
  v12 = (*((_BYTE *)v4 + 104) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 1) == 0 || self->_devicePlatform != *((_QWORD *)v4 + 1))
      goto LABEL_40;
    v12 = 1;
  }
LABEL_41:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  unint64_t v12;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v16 = 2654435761u * self->_secureBackupMetadataTimestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v14 = 2654435761u * self->_secureBackupNumericPassphraseLength;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v3 = 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v14 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v3 = 2654435761u * self->_secureBackupUsesComplexPassphrase;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v4 = 2654435761u * self->_secureBackupUsesNumericPassphrase;
    goto LABEL_10;
  }
LABEL_9:
  v4 = 0;
LABEL_10:
  v5 = -[NSString hash](self->_deviceColor, "hash", v14);
  v6 = -[NSString hash](self->_deviceEnclosureColor, "hash");
  v7 = -[NSString hash](self->_deviceMid, "hash");
  v8 = -[NSString hash](self->_deviceModel, "hash");
  v9 = -[NSString hash](self->_deviceModelClass, "hash");
  v10 = -[NSString hash](self->_deviceModelVersion, "hash");
  v11 = -[NSString hash](self->_deviceName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v12 = 2654435761u * self->_devicePlatform;
  else
    v12 = 0;
  return v15 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 104);
  if ((v5 & 2) != 0)
  {
    self->_secureBackupMetadataTimestamp = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 104);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*((_BYTE *)v4 + 104) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_secureBackupNumericPassphraseLength = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 104);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_25:
  self->_secureBackupUsesComplexPassphrase = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 104) & 0x10) != 0)
  {
LABEL_5:
    self->_secureBackupUsesNumericPassphrase = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_6:
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceColor:](self, "setDeviceColor:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceEnclosureColor:](self, "setDeviceEnclosureColor:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceMid:](self, "setDeviceMid:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceModel:](self, "setDeviceModel:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceModelClass:](self, "setDeviceModelClass:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceModelVersion:](self, "setDeviceModelVersion:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceName:](self, "setDeviceName:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
    self->_devicePlatform = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unint64_t)secureBackupMetadataTimestamp
{
  return self->_secureBackupMetadataTimestamp;
}

- (unint64_t)secureBackupNumericPassphraseLength
{
  return self->_secureBackupNumericPassphraseLength;
}

- (unint64_t)secureBackupUsesComplexPassphrase
{
  return self->_secureBackupUsesComplexPassphrase;
}

- (unint64_t)secureBackupUsesNumericPassphrase
{
  return self->_secureBackupUsesNumericPassphrase;
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceColor, a3);
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (void)setDeviceEnclosureColor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceEnclosureColor, a3);
}

- (NSString)deviceMid
{
  return self->_deviceMid;
}

- (void)setDeviceMid:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMid, a3);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (NSString)deviceModelClass
{
  return self->_deviceModelClass;
}

- (void)setDeviceModelClass:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModelClass, a3);
}

- (NSString)deviceModelVersion
{
  return self->_deviceModelVersion;
}

- (void)setDeviceModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModelVersion, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (unint64_t)devicePlatform
{
  return self->_devicePlatform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceModelVersion, 0);
  objc_storeStrong((id *)&self->_deviceModelClass, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceMid, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
}

@end
