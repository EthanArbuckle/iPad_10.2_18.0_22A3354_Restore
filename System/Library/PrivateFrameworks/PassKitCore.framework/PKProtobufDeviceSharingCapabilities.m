@implementation PKProtobufDeviceSharingCapabilities

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasAltDSID
{
  return self->_altDSID != 0;
}

- (BOOL)hasDeviceRegion
{
  return self->_deviceRegion != 0;
}

- (void)setSupportsManatee:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_supportsManatee = a3;
}

- (void)setHasSupportsManatee:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportsManatee
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasFromDeviceVersion
{
  return self->_fromDeviceVersion != 0;
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
  v8.super_class = (Class)PKProtobufDeviceSharingCapabilities;
  -[PKProtobufDeviceSharingCapabilities description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufDeviceSharingCapabilities dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *handle;
  NSString *altDSID;
  NSString *deviceRegion;
  void *v8;
  NSData *fromDeviceVersion;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  handle = self->_handle;
  if (handle)
    objc_msgSend(v3, "setObject:forKey:", handle, CFSTR("handle"));
  altDSID = self->_altDSID;
  if (altDSID)
    objc_msgSend(v3, "setObject:forKey:", altDSID, CFSTR("altDSID"));
  deviceRegion = self->_deviceRegion;
  if (deviceRegion)
    objc_msgSend(v3, "setObject:forKey:", deviceRegion, CFSTR("deviceRegion"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsManatee);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("supportsManatee"));

  }
  fromDeviceVersion = self->_fromDeviceVersion;
  if (fromDeviceVersion)
    objc_msgSend(v3, "setObject:forKey:", fromDeviceVersion, CFSTR("fromDeviceVersion"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufDeviceSharingCapabilitiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_handle)
    PBDataWriterWriteStringField();
  if (self->_altDSID)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_deviceRegion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_fromDeviceVersion)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  v4[10] = self->_version;
  v5 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    v4 = v5;
  }
  if (self->_altDSID)
  {
    objc_msgSend(v5, "setAltDSID:");
    v4 = v5;
  }
  if (self->_deviceRegion)
  {
    objc_msgSend(v5, "setDeviceRegion:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v4 + 44) = self->_supportsManatee;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_fromDeviceVersion)
  {
    objc_msgSend(v5, "setFromDeviceVersion:");
    v4 = v5;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_version;
  v6 = -[NSString copyWithZone:](self->_handle, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_deviceRegion, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 44) = self->_supportsManatee;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v12 = -[NSData copyWithZone:](self->_fromDeviceVersion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *handle;
  NSString *altDSID;
  NSString *deviceRegion;
  char v8;
  NSData *fromDeviceVersion;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if (self->_version != *((_DWORD *)v4 + 10))
    goto LABEL_13;
  handle = self->_handle;
  if ((unint64_t)handle | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](handle, "isEqual:"))
      goto LABEL_13;
  }
  altDSID = self->_altDSID;
  if ((unint64_t)altDSID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](altDSID, "isEqual:"))
      goto LABEL_13;
  }
  deviceRegion = self->_deviceRegion;
  if ((unint64_t)deviceRegion | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceRegion, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0)
    {
      if (self->_supportsManatee)
      {
        if (*((_BYTE *)v4 + 44))
          goto LABEL_19;
      }
      else if (!*((_BYTE *)v4 + 44))
      {
        goto LABEL_19;
      }
    }
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
    goto LABEL_13;
LABEL_19:
  fromDeviceVersion = self->_fromDeviceVersion;
  if ((unint64_t)fromDeviceVersion | *((_QWORD *)v4 + 3))
    v8 = -[NSData isEqual:](fromDeviceVersion, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unsigned int version;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  version = self->_version;
  v4 = -[NSString hash](self->_handle, "hash");
  v5 = -[NSString hash](self->_altDSID, "hash");
  v6 = -[NSString hash](self->_deviceRegion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_supportsManatee;
  else
    v7 = 0;
  return v4 ^ v5 ^ v6 ^ v7 ^ (2654435761 * version) ^ -[NSData hash](self->_fromDeviceVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_version = *((_DWORD *)v4 + 10);
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[PKProtobufDeviceSharingCapabilities setHandle:](self, "setHandle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PKProtobufDeviceSharingCapabilities setAltDSID:](self, "setAltDSID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PKProtobufDeviceSharingCapabilities setDeviceRegion:](self, "setDeviceRegion:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_supportsManatee = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PKProtobufDeviceSharingCapabilities setFromDeviceVersion:](self, "setFromDeviceVersion:");
    v4 = v5;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (NSString)deviceRegion
{
  return self->_deviceRegion;
}

- (void)setDeviceRegion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRegion, a3);
}

- (BOOL)supportsManatee
{
  return self->_supportsManatee;
}

- (NSData)fromDeviceVersion
{
  return self->_fromDeviceVersion;
}

- (void)setFromDeviceVersion:(id)a3
{
  objc_storeStrong((id *)&self->_fromDeviceVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_fromDeviceVersion, 0);
  objc_storeStrong((id *)&self->_deviceRegion, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
