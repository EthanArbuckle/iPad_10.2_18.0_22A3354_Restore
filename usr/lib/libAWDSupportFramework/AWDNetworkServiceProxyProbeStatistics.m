@implementation AWDNetworkServiceProxyProbeStatistics

- (void)dealloc
{
  objc_super v3;

  -[AWDNetworkServiceProxyProbeStatistics setLabel:](self, "setLabel:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyProbeStatistics;
  -[AWDNetworkServiceProxyProbeStatistics dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)interfaceType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_interfaceType;
  else
    return 1;
}

- (void)setInterfaceType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasInterfaceType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)interfaceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DE48[a3 - 1];
}

- (int)StringAsInterfaceType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyInterfaceType_WIFI")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyInterfaceType_CELLULAR")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyInterfaceType_WIRED")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyInterfaceType_VIRTUAL")))
    return 4;
  return 1;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setAlternateProbeTimeMsecs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_alternateProbeTimeMsecs = a3;
}

- (void)setHasAlternateProbeTimeMsecs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlternateProbeTimeMsecs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setGenericProbeTimeMsecs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_genericProbeTimeMsecs = a3;
}

- (void)setHasGenericProbeTimeMsecs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGenericProbeTimeMsecs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setGenericDNSProbeTimeMsecs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_genericDNSProbeTimeMsecs = a3;
}

- (void)setHasGenericDNSProbeTimeMsecs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenericDNSProbeTimeMsecs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)protocolType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_protocolType;
  else
    return 1;
}

- (void)setProtocolType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_protocolType = a3;
}

- (void)setHasProtocolType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasProtocolType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)protocolTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DE68[a3 - 1];
}

- (int)StringAsProtocolType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyProtocolType_IPv4")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyProtocolType_IPv6")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyProtocolType_NAT64")))
    return 3;
  return 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyProbeStatistics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNetworkServiceProxyProbeStatistics description](&v3, sel_description), -[AWDNetworkServiceProxyProbeStatistics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  __CFString *v6;
  NSString *label;
  char v8;
  unsigned int v9;
  __CFString *v10;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v5 = self->_interfaceType - 1;
    if (v5 >= 4)
      v6 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_interfaceType);
    else
      v6 = off_24C10DE48[v5];
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("interface_type"));
  }
  label = self->_label;
  if (label)
    objc_msgSend(v3, "setObject:forKey:", label, CFSTR("label"));
  v8 = (char)self->_has;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_alternateProbeTimeMsecs), CFSTR("alternate_probe_time_msecs"));
    v8 = (char)self->_has;
    if ((v8 & 4) == 0)
    {
LABEL_12:
      if ((v8 & 2) == 0)
        goto LABEL_13;
LABEL_17:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_genericDNSProbeTimeMsecs), CFSTR("generic_DNS_probe_time_msecs"));
      if ((*(_BYTE *)&self->_has & 0x20) == 0)
        return v3;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_genericProbeTimeMsecs), CFSTR("generic_probe_time_msecs"));
  v8 = (char)self->_has;
  if ((v8 & 2) != 0)
    goto LABEL_17;
LABEL_13:
  if ((v8 & 0x20) == 0)
    return v3;
LABEL_18:
  v9 = self->_protocolType - 1;
  if (v9 >= 3)
    v10 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_protocolType);
  else
    v10 = off_24C10DE68[v9];
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("protocol_type"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNetworkServiceProxyProbeStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_label)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = (char)self->_has;
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        goto LABEL_10;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  v5 = (char)self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      return;
LABEL_15:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_BYTE *)a3 + 60) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_interfaceType;
    *((_BYTE *)a3 + 60) |= 0x10u;
  }
  if (self->_label)
    objc_msgSend(a3, "setLabel:");
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_alternateProbeTimeMsecs;
    *((_BYTE *)a3 + 60) |= 1u;
    v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_10;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)a3 + 3) = self->_genericProbeTimeMsecs;
  *((_BYTE *)a3 + 60) |= 4u;
  v6 = (char)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0)
      return;
    goto LABEL_11;
  }
LABEL_15:
  *((_QWORD *)a3 + 2) = self->_genericDNSProbeTimeMsecs;
  *((_BYTE *)a3 + 60) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return;
LABEL_11:
  *((_DWORD *)a3 + 14) = self->_protocolType;
  *((_BYTE *)a3 + 60) |= 0x20u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  char v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_BYTE *)(v5 + 60) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_interfaceType;
    *(_BYTE *)(v5 + 60) |= 0x10u;
  }

  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_alternateProbeTimeMsecs;
    *(_BYTE *)(v6 + 60) |= 1u;
    v8 = (char)self->_has;
    if ((v8 & 4) == 0)
    {
LABEL_7:
      if ((v8 & 2) == 0)
        goto LABEL_8;
LABEL_13:
      *(_QWORD *)(v6 + 16) = self->_genericDNSProbeTimeMsecs;
      *(_BYTE *)(v6 + 60) |= 2u;
      if ((*(_BYTE *)&self->_has & 0x20) == 0)
        return (id)v6;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v6 + 24) = self->_genericProbeTimeMsecs;
  *(_BYTE *)(v6 + 60) |= 4u;
  v8 = (char)self->_has;
  if ((v8 & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v8 & 0x20) != 0)
  {
LABEL_9:
    *(_DWORD *)(v6 + 56) = self->_protocolType;
    *(_BYTE *)(v6 + 60) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *label;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 8) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 60) & 8) != 0)
    {
LABEL_34:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 0x10) == 0 || self->_interfaceType != *((_DWORD *)a3 + 10))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 60) & 0x10) != 0)
    {
      goto LABEL_34;
    }
    label = self->_label;
    if ((unint64_t)label | *((_QWORD *)a3 + 6))
    {
      v5 = -[NSString isEqual:](label, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 1) == 0 || self->_alternateProbeTimeMsecs != *((_QWORD *)a3 + 1))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 60) & 1) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 4) == 0 || self->_genericProbeTimeMsecs != *((_QWORD *)a3 + 3))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 60) & 4) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 2) == 0 || self->_genericDNSProbeTimeMsecs != *((_QWORD *)a3 + 2))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 60) & 2) != 0)
    {
      goto LABEL_34;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 60) & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 60) & 0x20) == 0 || self->_protocolType != *((_DWORD *)a3 + 14))
        goto LABEL_34;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_interfaceType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_label, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761u * self->_alternateProbeTimeMsecs;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_8:
      v7 = 2654435761u * self->_genericProbeTimeMsecs;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_9;
LABEL_13:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_10;
LABEL_14:
      v9 = 0;
      return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_9:
  v8 = 2654435761u * self->_genericDNSProbeTimeMsecs;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_10:
  v9 = 2654435761 * self->_protocolType;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char v6;

  v5 = *((_BYTE *)a3 + 60);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)a3 + 60);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_interfaceType = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)a3 + 6))
    -[AWDNetworkServiceProxyProbeStatistics setLabel:](self, "setLabel:");
  v6 = *((_BYTE *)a3 + 60);
  if ((v6 & 1) != 0)
  {
    self->_alternateProbeTimeMsecs = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)a3 + 60);
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_10;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)a3 + 60) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_genericProbeTimeMsecs = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)a3 + 60);
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0)
      return;
    goto LABEL_11;
  }
LABEL_15:
  self->_genericDNSProbeTimeMsecs = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 60) & 0x20) == 0)
    return;
LABEL_11:
  self->_protocolType = *((_DWORD *)a3 + 14);
  *(_BYTE *)&self->_has |= 0x20u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unint64_t)alternateProbeTimeMsecs
{
  return self->_alternateProbeTimeMsecs;
}

- (unint64_t)genericProbeTimeMsecs
{
  return self->_genericProbeTimeMsecs;
}

- (unint64_t)genericDNSProbeTimeMsecs
{
  return self->_genericDNSProbeTimeMsecs;
}

@end
