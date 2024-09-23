@implementation AWDMDNSResponderResolveStatsResult

- (void)dealloc
{
  objc_super v3;

  -[AWDMDNSResponderResolveStatsResult setData:](self, "setData:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderResolveStatsResult;
  -[AWDMDNSResponderResolveStatsResult dealloc](&v3, sel_dealloc);
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DDB8[a3];
}

- (int)StringAsType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IPv4Addr")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IPv6Addr")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NegA")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NegAAAA")))
    return 3;
  return 0;
}

- (void)setCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(_BYTE *)&self->_has & 1;
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

- (BOOL)hasData
{
  return self->_data != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderResolveStatsResult;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMDNSResponderResolveStatsResult description](&v3, sel_description), -[AWDMDNSResponderResolveStatsResult dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t type;
  __CFString *v6;
  NSData *data;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    type = self->_type;
    if (type >= 4)
      v6 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    else
      v6 = off_24C10DDB8[type];
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_count), CFSTR("count"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_serverID), CFSTR("serverID"));
  data = self->_data;
  if (data)
    objc_msgSend(v3, "setObject:forKey:", data, CFSTR("data"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMDNSResponderResolveStatsResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:
  if (self->_data)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  char has;
  NSData *data;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_type;
    *((_BYTE *)a3 + 32) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 2) = self->_count;
  *((_BYTE *)a3 + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 6) = self->_serverID;
    *((_BYTE *)a3 + 32) |= 2u;
  }
LABEL_5:
  data = self->_data;
  if (data)
    objc_msgSend(a3, "setData:", data);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 8) = self->_count;
    *(_BYTE *)(v5 + 32) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 28) = self->_type;
  *(_BYTE *)(v5 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_serverID;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
LABEL_5:

  v6[2] = -[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *data;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_type != *((_DWORD *)a3 + 7))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 32) & 4) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_count != *((_DWORD *)a3 + 2))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
      goto LABEL_19;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_serverID != *((_DWORD *)a3 + 6))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 32) & 2) != 0)
    {
      goto LABEL_19;
    }
    data = self->_data;
    if ((unint64_t)data | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[NSData isEqual:](data, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ -[NSData hash](self->_data, "hash");
  }
  v2 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_count;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_serverID;
  return v3 ^ v2 ^ v4 ^ -[NSData hash](self->_data, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 4) != 0)
  {
    self->_type = *((_DWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 32);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_count = *((_DWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 32) & 2) != 0)
  {
LABEL_4:
    self->_serverID = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((_QWORD *)a3 + 2))
    -[AWDMDNSResponderResolveStatsResult setData:](self, "setData:");
}

- (unsigned)count
{
  return self->_count;
}

- (unsigned)serverID
{
  return self->_serverID;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
