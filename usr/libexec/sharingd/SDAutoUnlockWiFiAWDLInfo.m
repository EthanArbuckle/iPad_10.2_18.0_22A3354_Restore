@implementation SDAutoUnlockWiFiAWDLInfo

- (BOOL)hasMacAddress
{
  return self->_macAddress != 0;
}

- (void)setDiscoveryMetric:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_discoveryMetric = a3;
}

- (void)setHasDiscoveryMetric:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDiscoveryMetric
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMasterChannel:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_masterChannel = a3;
}

- (void)setHasMasterChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMasterChannel
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPreferredChannel:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_preferredChannel = a3;
}

- (void)setHasPreferredChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPreferredChannel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setChannelFlags:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channelFlags = a3;
}

- (void)setHasChannelFlags:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelFlags
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasExtraInfoData
{
  return self->_extraInfoData != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockWiFiAWDLInfo;
  v3 = -[SDAutoUnlockWiFiAWDLInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiAWDLInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *macAddress;
  char has;
  void *v7;
  NSData *extraInfoData;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  macAddress = self->_macAddress;
  if (macAddress)
    objc_msgSend(v3, "setObject:forKey:", macAddress, CFSTR("macAddress"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_discoveryMetric));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("discoveryMetric"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_masterChannel));
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("masterChannel"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_preferredChannel));
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("preferredChannel"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_channelFlags));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("channelFlags"));

  }
LABEL_8:
  extraInfoData = self->_extraInfoData;
  if (extraInfoData)
    objc_msgSend(v4, "setObject:forKey:", extraInfoData, CFSTR("extraInfoData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockWiFiAWDLInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *macAddress;
  char has;
  NSData *extraInfoData;
  id v8;

  v4 = a3;
  macAddress = self->_macAddress;
  v8 = v4;
  if (macAddress)
  {
    PBDataWriterWriteDataField(v4, macAddress, 1);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v8, self->_discoveryMetric, 2);
    v4 = v8;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field(v8, self->_masterChannel, 3);
  v4 = v8;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteUint32Field(v8, self->_preferredChannel, 4);
  v4 = v8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint32Field(v8, self->_channelFlags, 5);
    v4 = v8;
  }
LABEL_8:
  extraInfoData = self->_extraInfoData;
  if (extraInfoData)
  {
    PBDataWriterWriteDataField(v8, extraInfoData, 6);
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_macAddress)
  {
    objc_msgSend(v4, "setMacAddress:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 3) = self->_discoveryMetric;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 8) = self->_masterChannel;
  *((_BYTE *)v4 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)v4 + 9) = self->_preferredChannel;
  *((_BYTE *)v4 + 40) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 2) = self->_channelFlags;
    *((_BYTE *)v4 + 40) |= 1u;
  }
LABEL_8:
  if (self->_extraInfoData)
  {
    objc_msgSend(v6, "setExtraInfoData:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  char has;
  id v9;
  void *v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_macAddress, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 3) = self->_discoveryMetric;
    *((_BYTE *)v5 + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *((_DWORD *)v5 + 9) = self->_preferredChannel;
      *((_BYTE *)v5 + 40) |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 8) = self->_masterChannel;
  *((_BYTE *)v5 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 2) = self->_channelFlags;
    *((_BYTE *)v5 + 40) |= 1u;
  }
LABEL_6:
  v9 = -[NSData copyWithZone:](self->_extraInfoData, "copyWithZone:", a3);
  v10 = (void *)v5[2];
  v5[2] = v9;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *macAddress;
  NSData *extraInfoData;
  unsigned __int8 v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_26;
  macAddress = self->_macAddress;
  if ((unint64_t)macAddress | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](macAddress, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_discoveryMetric != *((_DWORD *)v4 + 3))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_26:
    v8 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_masterChannel != *((_DWORD *)v4 + 8))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_preferredChannel != *((_DWORD *)v4 + 9))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_channelFlags != *((_DWORD *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_26;
  }
  extraInfoData = self->_extraInfoData;
  if ((unint64_t)extraInfoData | *((_QWORD *)v4 + 2))
    v8 = -[NSData isEqual:](extraInfoData, "isEqual:");
  else
    v8 = 1;
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (unint64_t)-[NSData hash](self->_macAddress, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_discoveryMetric;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_masterChannel;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (unint64_t)-[NSData hash](self->_extraInfoData, "hash");
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_preferredChannel;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_channelFlags;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (unint64_t)-[NSData hash](self->_extraInfoData, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  char v5;
  unsigned int *v6;

  v4 = (unsigned int *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[SDAutoUnlockWiFiAWDLInfo setMacAddress:](self, "setMacAddress:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_discoveryMetric = v4[3];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((v4[10] & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_masterChannel = v4[8];
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  self->_preferredChannel = v4[9];
  *(_BYTE *)&self->_has |= 8u;
  if ((v4[10] & 1) != 0)
  {
LABEL_7:
    self->_channelFlags = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 2))
  {
    -[SDAutoUnlockWiFiAWDLInfo setExtraInfoData:](self, "setExtraInfoData:");
    v4 = v6;
  }

}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_storeStrong((id *)&self->_macAddress, a3);
}

- (unsigned)discoveryMetric
{
  return self->_discoveryMetric;
}

- (unsigned)masterChannel
{
  return self->_masterChannel;
}

- (unsigned)preferredChannel
{
  return self->_preferredChannel;
}

- (unsigned)channelFlags
{
  return self->_channelFlags;
}

- (NSData)extraInfoData
{
  return self->_extraInfoData;
}

- (void)setExtraInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_extraInfoData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_extraInfoData, 0);
}

@end
