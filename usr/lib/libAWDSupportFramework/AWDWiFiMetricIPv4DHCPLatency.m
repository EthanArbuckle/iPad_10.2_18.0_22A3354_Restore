@implementation AWDWiFiMetricIPv4DHCPLatency

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricIPv4DHCPLatency setPrivateMacType:](self, "setPrivateMacType:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricIPv4DHCPLatency;
  -[AWDWiFiMetricIPv4DHCPLatency dealloc](&v3, sel_dealloc);
}

- (void)setDhcpLatencyMilliSecs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dhcpLatencyMilliSecs = a3;
}

- (void)setHasDhcpLatencyMilliSecs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDhcpLatencyMilliSecs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSecurityType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDhcpLeaseMins:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dhcpLeaseMins = a3;
}

- (void)setHasDhcpLeaseMins:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDhcpLeaseMins
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (BOOL)hasPrivateMacType
{
  return self->_privateMacType != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricIPv4DHCPLatency;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricIPv4DHCPLatency description](&v3, sel_description), -[AWDWiFiMetricIPv4DHCPLatency dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *privateMacType;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dhcpLatencyMilliSecs), CFSTR("dhcpLatencyMilliSecs"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityType), CFSTR("securityType"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dhcpLeaseMins), CFSTR("dhcpLeaseMins"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
LABEL_6:
  privateMacType = self->_privateMacType;
  if (privateMacType)
    objc_msgSend(v3, "setObject:forKey:", privateMacType, CFSTR("privateMacType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricIPv4DHCPLatencyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_privateMacType)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;
  NSString *privateMacType;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_dhcpLatencyMilliSecs;
    *((_BYTE *)a3 + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_securityType;
  *((_BYTE *)a3 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  *((_QWORD *)a3 + 1) = self->_timestamp;
  *((_BYTE *)a3 + 36) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 5) = self->_dhcpLeaseMins;
    *((_BYTE *)a3 + 36) |= 4u;
  }
LABEL_6:
  privateMacType = self->_privateMacType;
  if (privateMacType)
    objc_msgSend(a3, "setPrivateMacType:", privateMacType);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_dhcpLatencyMilliSecs;
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 8) = self->_timestamp;
      *(_BYTE *)(v5 + 36) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_securityType;
  *(_BYTE *)(v5 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 20) = self->_dhcpLeaseMins;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
LABEL_6:

  v6[3] = -[NSString copyWithZone:](self->_privateMacType, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *privateMacType;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_dhcpLatencyMilliSecs != *((_DWORD *)a3 + 4))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 36) & 2) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 8) == 0 || self->_securityType != *((_DWORD *)a3 + 8))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 36) & 8) != 0)
    {
      goto LABEL_24;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
      goto LABEL_24;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_dhcpLeaseMins != *((_DWORD *)a3 + 5))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 36) & 4) != 0)
    {
      goto LABEL_24;
    }
    privateMacType = self->_privateMacType;
    if ((unint64_t)privateMacType | *((_QWORD *)a3 + 3))
      LOBYTE(v5) = -[NSString isEqual:](privateMacType, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_dhcpLatencyMilliSecs;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_securityType;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ -[NSString hash](self->_privateMacType, "hash");
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_dhcpLeaseMins;
  return v3 ^ v2 ^ v4 ^ v5 ^ -[NSString hash](self->_privateMacType, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 2) != 0)
  {
    self->_dhcpLatencyMilliSecs = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 36);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_securityType = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  self->_timestamp = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 36) & 4) != 0)
  {
LABEL_5:
    self->_dhcpLeaseMins = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_6:
  if (*((_QWORD *)a3 + 3))
    -[AWDWiFiMetricIPv4DHCPLatency setPrivateMacType:](self, "setPrivateMacType:");
}

- (unsigned)dhcpLatencyMilliSecs
{
  return self->_dhcpLatencyMilliSecs;
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)dhcpLeaseMins
{
  return self->_dhcpLeaseMins;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)privateMacType
{
  return self->_privateMacType;
}

- (void)setPrivateMacType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
