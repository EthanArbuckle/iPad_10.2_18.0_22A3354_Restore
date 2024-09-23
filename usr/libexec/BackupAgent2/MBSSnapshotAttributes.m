@implementation MBSSnapshotAttributes

- (void)dealloc
{
  objc_super v3;

  -[MBSSnapshotAttributes setDeviceName:](self, "setDeviceName:", 0);
  -[MBSSnapshotAttributes setProductVersion:](self, "setProductVersion:", 0);
  -[MBSSnapshotAttributes setBuildVersion:](self, "setBuildVersion:", 0);
  -[MBSSnapshotAttributes setKeybagUUID:](self, "setKeybagUUID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MBSSnapshotAttributes;
  -[MBSSnapshotAttributes dealloc](&v3, "dealloc");
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasProductVersion
{
  return self->_productVersion != 0;
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (void)setKeybagID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_keybagID = a3;
}

- (void)setHasKeybagID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKeybagID
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasKeybagUUID
{
  return self->_keybagUUID != 0;
}

- (int)backupReason
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_backupReason;
  else
    return 0;
}

- (void)setBackupReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_backupReason = a3;
}

- (void)setHasBackupReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBackupReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)backupType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_backupType;
  else
    return 0;
}

- (void)setBackupType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_backupType = a3;
}

- (void)setHasBackupType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBackupType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBSSnapshotAttributes;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[MBSSnapshotAttributes description](&v3, "description"), -[MBSSnapshotAttributes dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *deviceName;
  NSString *productVersion;
  NSString *buildVersion;
  NSData *keybagUUID;
  char has;
  uint64_t backupReason;
  __CFString *v11;
  uint64_t backupType;
  __CFString *v13;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  productVersion = self->_productVersion;
  if (productVersion)
    objc_msgSend(v4, "setObject:forKey:", productVersion, CFSTR("productVersion"));
  buildVersion = self->_buildVersion;
  if (buildVersion)
    objc_msgSend(v4, "setObject:forKey:", buildVersion, CFSTR("buildVersion"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_keybagID), CFSTR("keybagID"));
  keybagUUID = self->_keybagUUID;
  if (keybagUUID)
    objc_msgSend(v4, "setObject:forKey:", keybagUUID, CFSTR("keybagUUID"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    backupReason = self->_backupReason;
    if (backupReason >= 3)
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_backupReason);
    else
      v11 = off_1000D93B0[backupReason];
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("backupReason"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    backupType = self->_backupType;
    if (backupType >= 3)
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_backupType);
    else
      v13 = off_1000D93C8[backupType];
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("backupType"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000B698((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *deviceName;
  NSString *productVersion;
  NSString *buildVersion;
  NSData *keybagUUID;
  char has;

  deviceName = self->_deviceName;
  if (deviceName)
    PBDataWriterWriteStringField(a3, deviceName, 1);
  productVersion = self->_productVersion;
  if (productVersion)
    PBDataWriterWriteStringField(a3, productVersion, 2);
  buildVersion = self->_buildVersion;
  if (buildVersion)
    PBDataWriterWriteStringField(a3, buildVersion, 3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field(a3, self->_keybagID, 4);
  keybagUUID = self->_keybagUUID;
  if (keybagUUID)
    PBDataWriterWriteDataField(a3, keybagUUID, 5);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_backupReason, 6);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field(a3, self->_backupType, 7);
}

- (void)copyTo:(id)a3
{
  char has;

  if (self->_deviceName)
    objc_msgSend(a3, "setDeviceName:");
  if (self->_productVersion)
    objc_msgSend(a3, "setProductVersion:");
  if (self->_buildVersion)
    objc_msgSend(a3, "setBuildVersion:");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_keybagID;
    *((_BYTE *)a3 + 56) |= 4u;
  }
  if (self->_keybagUUID)
    objc_msgSend(a3, "setKeybagUUID:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_backupReason;
    *((_BYTE *)a3 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_backupType;
    *((_BYTE *)a3 + 56) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  char has;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");

  v5[3] = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v5[6] = -[NSString copyWithZone:](self->_productVersion, "copyWithZone:", a3);

  v5[2] = -[NSString copyWithZone:](self->_buildVersion, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_keybagID;
    *((_BYTE *)v5 + 56) |= 4u;
  }

  v5[5] = -[NSData copyWithZone:](self->_keybagUUID, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_backupReason;
    *((_BYTE *)v5 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 3) = self->_backupType;
    *((_BYTE *)v5 + 56) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *deviceName;
  NSString *productVersion;
  NSString *buildVersion;
  char has;
  NSData *keybagUUID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self));
  if (v5)
  {
    deviceName = self->_deviceName;
    if (!((unint64_t)deviceName | *((_QWORD *)a3 + 3))
      || (v5 = -[NSString isEqual:](deviceName, "isEqual:")) != 0)
    {
      productVersion = self->_productVersion;
      if (!((unint64_t)productVersion | *((_QWORD *)a3 + 6))
        || (v5 = -[NSString isEqual:](productVersion, "isEqual:")) != 0)
      {
        buildVersion = self->_buildVersion;
        if (!((unint64_t)buildVersion | *((_QWORD *)a3 + 2))
          || (v5 = -[NSString isEqual:](buildVersion, "isEqual:")) != 0)
        {
          has = (char)self->_has;
          if ((has & 4) != 0)
          {
            if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_keybagID != *((_DWORD *)a3 + 8))
              goto LABEL_25;
          }
          else if ((*((_BYTE *)a3 + 56) & 4) != 0)
          {
LABEL_25:
            LOBYTE(v5) = 0;
            return v5;
          }
          keybagUUID = self->_keybagUUID;
          if ((unint64_t)keybagUUID | *((_QWORD *)a3 + 5))
          {
            v5 = -[NSData isEqual:](keybagUUID, "isEqual:");
            if (!v5)
              return v5;
            has = (char)self->_has;
          }
          if ((has & 1) != 0)
          {
            if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_backupReason != *((_DWORD *)a3 + 2))
              goto LABEL_25;
          }
          else if ((*((_BYTE *)a3 + 56) & 1) != 0)
          {
            goto LABEL_25;
          }
          LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 2) == 0;
          if ((has & 2) != 0)
          {
            if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_backupType != *((_DWORD *)a3 + 3))
              goto LABEL_25;
            LOBYTE(v5) = 1;
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
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_deviceName, "hash");
  v4 = -[NSString hash](self->_productVersion, "hash");
  v5 = -[NSString hash](self->_buildVersion, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_keybagID;
  else
    v6 = 0;
  v7 = (unint64_t)-[NSData hash](self->_keybagUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_backupReason;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v9 = 2654435761 * self->_backupType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 3))
    -[MBSSnapshotAttributes setDeviceName:](self, "setDeviceName:");
  if (*((_QWORD *)a3 + 6))
    -[MBSSnapshotAttributes setProductVersion:](self, "setProductVersion:");
  if (*((_QWORD *)a3 + 2))
    -[MBSSnapshotAttributes setBuildVersion:](self, "setBuildVersion:");
  if ((*((_BYTE *)a3 + 56) & 4) != 0)
  {
    self->_keybagID = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 5))
    -[MBSSnapshotAttributes setKeybagUUID:](self, "setKeybagUUID:");
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 1) != 0)
  {
    self->_backupReason = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_backupType = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)keybagID
{
  return self->_keybagID;
}

- (NSData)keybagUUID
{
  return self->_keybagUUID;
}

- (void)setKeybagUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
