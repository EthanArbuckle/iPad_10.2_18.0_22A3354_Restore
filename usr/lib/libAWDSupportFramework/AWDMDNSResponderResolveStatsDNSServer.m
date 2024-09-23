@implementation AWDMDNSResponderResolveStatsDNSServer

- (void)dealloc
{
  objc_super v3;

  -[AWDMDNSResponderResolveStatsDNSServer setAddress:](self, "setAddress:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderResolveStatsDNSServer;
  -[AWDMDNSResponderResolveStatsDNSServer dealloc](&v3, sel_dealloc);
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (int)networkType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_networkType;
  else
    return 0;
}

- (void)setNetworkType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNetworkType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (!a3)
    return CFSTR("NonCellular");
  if (a3 == 1)
    return CFSTR("Cellular");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsNetworkType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NonCellular")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("Cellular"));
}

- (void)setServerID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_serverID = a3;
}

- (void)setHasServerID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServerID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderResolveStatsDNSServer;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMDNSResponderResolveStatsDNSServer description](&v3, sel_description), -[AWDMDNSResponderResolveStatsDNSServer dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *address;
  char has;
  int networkType;
  const __CFString *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  address = self->_address;
  if (address)
    objc_msgSend(v3, "setObject:forKey:", address, CFSTR("address"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    networkType = self->_networkType;
    if (networkType)
    {
      if (networkType == 1)
        v8 = CFSTR("Cellular");
      else
        v8 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_networkType);
    }
    else
    {
      v8 = CFSTR("NonCellular");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("networkType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_serverID), CFSTR("serverID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMDNSResponderResolveStatsDNSServerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_address)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has;

  if (self->_address)
    objc_msgSend(a3, "setAddress:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_networkType;
    *((_BYTE *)a3 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_serverID;
    *((_BYTE *)a3 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 8) = -[NSData copyWithZone:](self->_address, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_networkType;
    *(_BYTE *)(v5 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_serverID;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *address;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    address = self->_address;
    if (!((unint64_t)address | *((_QWORD *)a3 + 1)) || (v5 = -[NSData isEqual:](address, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_networkType != *((_DWORD *)a3 + 4))
          goto LABEL_13;
      }
      else if ((*((_BYTE *)a3 + 24) & 1) != 0)
      {
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 2) == 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_serverID != *((_DWORD *)a3 + 5))
          goto LABEL_13;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_address, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_networkType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_serverID;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 1))
    -[AWDMDNSResponderResolveStatsDNSServer setAddress:](self, "setAddress:");
  v5 = *((_BYTE *)a3 + 24);
  if ((v5 & 1) != 0)
  {
    self->_networkType = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_serverID = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (NSData)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (unsigned)serverID
{
  return self->_serverID;
}

@end
