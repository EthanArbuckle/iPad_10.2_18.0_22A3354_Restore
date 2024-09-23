@implementation TVRMSServiceMessage

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasNetworkName
{
  return self->_networkName != 0;
}

- (BOOL)hasHostName
{
  return self->_hostName != 0;
}

- (void)setPort:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_port = a3;
}

- (void)setHasPort:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPort
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setServiceType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_serviceType = a3;
}

- (void)setHasServiceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasServiceType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setServiceDiscoverySource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_serviceDiscoverySource = a3;
}

- (void)setHasServiceDiscoverySource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServiceDiscoverySource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setServiceLegacyFlags:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_serviceLegacyFlags = a3;
}

- (void)setHasServiceLegacyFlags:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasServiceLegacyFlags
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasHomeSharingGroupKey
{
  return self->_homeSharingGroupKey != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TVRMSServiceMessage;
  -[TVRMSServiceMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSServiceMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *displayName;
  NSString *networkName;
  NSString *hostName;
  char has;
  void *v9;
  NSString *homeSharingGroupKey;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v3, "setObject:forKey:", displayName, CFSTR("displayName"));
  networkName = self->_networkName;
  if (networkName)
    objc_msgSend(v4, "setObject:forKey:", networkName, CFSTR("networkName"));
  hostName = self->_hostName;
  if (hostName)
    objc_msgSend(v4, "setObject:forKey:", hostName, CFSTR("hostName"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_port);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("port"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_serviceType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("serviceType"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_serviceDiscoverySource);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("serviceDiscoverySource"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_serviceLegacyFlags);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("serviceLegacyFlags"));

  }
LABEL_12:
  homeSharingGroupKey = self->_homeSharingGroupKey;
  if (homeSharingGroupKey)
    objc_msgSend(v4, "setObject:forKey:", homeSharingGroupKey, CFSTR("homeSharingGroupKey"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSServiceMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_networkName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_hostName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_11:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_12:
  if (self->_homeSharingGroupKey)
  {
    PBDataWriterWriteStringField();
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
  if (self->_displayName)
  {
    objc_msgSend(v4, "setDisplayName:");
    v4 = v6;
  }
  if (self->_networkName)
  {
    objc_msgSend(v6, "setNetworkName:");
    v4 = v6;
  }
  if (self->_hostName)
  {
    objc_msgSend(v6, "setHostName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_port;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 13) = self->_serviceType;
  *((_BYTE *)v4 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  *((_DWORD *)v4 + 11) = self->_serviceDiscoverySource;
  *((_BYTE *)v4 + 56) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 12) = self->_serviceLegacyFlags;
    *((_BYTE *)v4 + 56) |= 4u;
  }
LABEL_12:
  if (self->_homeSharingGroupKey)
  {
    objc_msgSend(v6, "setHomeSharingGroupKey:");
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
  char has;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_networkName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_hostName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_port;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 44) = self->_serviceDiscoverySource;
      *(_BYTE *)(v5 + 56) |= 2u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 52) = self->_serviceType;
  *(_BYTE *)(v5 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 48) = self->_serviceLegacyFlags;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
LABEL_6:
  v13 = -[NSString copyWithZone:](self->_homeSharingGroupKey, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *displayName;
  NSString *networkName;
  NSString *hostName;
  NSString *homeSharingGroupKey;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_30;
  }
  networkName = self->_networkName;
  if ((unint64_t)networkName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](networkName, "isEqual:"))
      goto LABEL_30;
  }
  hostName = self->_hostName;
  if ((unint64_t)hostName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](hostName, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_port != *((_DWORD *)v4 + 10))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_30:
    v9 = 0;
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_serviceType != *((_DWORD *)v4 + 13))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_serviceDiscoverySource != *((_DWORD *)v4 + 11))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_serviceLegacyFlags != *((_DWORD *)v4 + 12))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_30;
  }
  homeSharingGroupKey = self->_homeSharingGroupKey;
  if ((unint64_t)homeSharingGroupKey | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](homeSharingGroupKey, "isEqual:");
  else
    v9 = 1;
LABEL_31:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_displayName, "hash");
  v4 = -[NSString hash](self->_networkName, "hash");
  v5 = -[NSString hash](self->_hostName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_port;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_serviceType;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_homeSharingGroupKey, "hash");
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v8 = 2654435761 * self->_serviceDiscoverySource;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v9 = 2654435761 * self->_serviceLegacyFlags;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_homeSharingGroupKey, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  int *v6;

  v4 = (int *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[TVRMSServiceMessage setDisplayName:](self, "setDisplayName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[TVRMSServiceMessage setNetworkName:](self, "setNetworkName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[TVRMSServiceMessage setHostName:](self, "setHostName:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 1) != 0)
  {
    self->_port = v4[10];
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 56);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((v4[14] & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_serviceType = v4[13];
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  self->_serviceDiscoverySource = v4[11];
  *(_BYTE *)&self->_has |= 2u;
  if ((v4[14] & 4) != 0)
  {
LABEL_11:
    self->_serviceLegacyFlags = v4[12];
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 2))
  {
    -[TVRMSServiceMessage setHomeSharingGroupKey:](self, "setHomeSharingGroupKey:");
    v4 = v6;
  }

}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_networkName, a3);
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
  objc_storeStrong((id *)&self->_hostName, a3);
}

- (int)port
{
  return self->_port;
}

- (int)serviceType
{
  return self->_serviceType;
}

- (int)serviceDiscoverySource
{
  return self->_serviceDiscoverySource;
}

- (int)serviceLegacyFlags
{
  return self->_serviceLegacyFlags;
}

- (NSString)homeSharingGroupKey
{
  return self->_homeSharingGroupKey;
}

- (void)setHomeSharingGroupKey:(id)a3
{
  objc_storeStrong((id *)&self->_homeSharingGroupKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_homeSharingGroupKey, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
