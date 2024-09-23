@implementation AWDTCPConnectionInfo

- (void)setDnsResolutionLatency:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dnsResolutionLatency = a3;
}

- (void)setHasDnsResolutionLatency:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDnsResolutionLatency
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTcpHandshakeLatency:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_tcpHandshakeLatency = a3;
}

- (void)setHasTcpHandshakeLatency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTcpHandshakeLatency
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTlsLatency:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_tlsLatency = a3;
}

- (void)setHasTlsLatency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTlsLatency
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (int)interfaceType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_interfaceType;
  else
    return 1;
}

- (void)setInterfaceType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInterfaceType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)interfaceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E410[a3 - 1];
}

- (int)StringAsInterfaceType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("None")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WiFi")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("BT")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Cellular")))
    return 4;
  return 1;
}

- (void)setTcpRetransmissions:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_tcpRetransmissions = a3;
}

- (void)setHasTcpRetransmissions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTcpRetransmissions
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTcpTxBytes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_tcpTxBytes = a3;
}

- (void)setHasTcpTxBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTcpTxBytes
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTcpRxBytes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_tcpRxBytes = a3;
}

- (void)setHasTcpRxBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTcpRxBytes
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDTCPConnectionInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDTCPConnectionInfo description](&v3, sel_description), -[AWDTCPConnectionInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v6;
  __CFString *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dnsResolutionLatency), CFSTR("dnsResolutionLatency"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpHandshakeLatency), CFSTR("tcpHandshakeLatency"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tlsLatency), CFSTR("tlsLatency"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_13:
  v6 = self->_interfaceType - 1;
  if (v6 >= 4)
    v7 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_interfaceType);
  else
    v7 = off_24C10E410[v6];
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("interfaceType"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
LABEL_18:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpTxBytes), CFSTR("tcpTxBytes"));
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpRetransmissions), CFSTR("tcpRetransmissions"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_18;
LABEL_7:
  if ((has & 0x10) != 0)
LABEL_8:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tcpRxBytes), CFSTR("tcpRxBytes"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDTCPConnectionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      return;
LABEL_15:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_dnsResolutionLatency;
    *((_BYTE *)a3 + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_tcpHandshakeLatency;
  *((_BYTE *)a3 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 8) = self->_tlsLatency;
  *((_BYTE *)a3 + 36) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)a3 + 3) = self->_interfaceType;
  *((_BYTE *)a3 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 5) = self->_tcpRetransmissions;
  *((_BYTE *)a3 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      return;
LABEL_15:
    *((_DWORD *)a3 + 6) = self->_tcpRxBytes;
    *((_BYTE *)a3 + 36) |= 0x10u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 7) = self->_tcpTxBytes;
  *((_BYTE *)a3 + 36) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_dnsResolutionLatency;
    *((_BYTE *)result + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_tcpHandshakeLatency;
  *((_BYTE *)result + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 8) = self->_tlsLatency;
  *((_BYTE *)result + 36) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 3) = self->_interfaceType;
  *((_BYTE *)result + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 5) = self->_tcpRetransmissions;
  *((_BYTE *)result + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_tcpTxBytes;
  *((_BYTE *)result + 36) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_8:
  *((_DWORD *)result + 6) = self->_tcpRxBytes;
  *((_BYTE *)result + 36) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_dnsResolutionLatency != *((_DWORD *)a3 + 2))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
LABEL_36:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_tcpHandshakeLatency != *((_DWORD *)a3 + 4))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 36) & 4) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 0x40) == 0 || self->_tlsLatency != *((_DWORD *)a3 + 8))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 36) & 0x40) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_interfaceType != *((_DWORD *)a3 + 3))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 36) & 2) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 8) == 0 || self->_tcpRetransmissions != *((_DWORD *)a3 + 5))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 36) & 8) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 0x20) == 0 || self->_tcpTxBytes != *((_DWORD *)a3 + 7))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 36) & 0x20) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 0x10) == 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 0x10) == 0 || self->_tcpRxBytes != *((_DWORD *)a3 + 6))
        goto LABEL_36;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_dnsResolutionLatency;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_tcpHandshakeLatency;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_tlsLatency;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_interfaceType;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_tcpRetransmissions;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_tcpTxBytes;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_tcpRxBytes;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 1) != 0)
  {
    self->_dnsResolutionLatency = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 36);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_tcpHandshakeLatency = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_tlsLatency = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x40u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 2) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  self->_interfaceType = *((_DWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  self->_tcpRetransmissions = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0)
      return;
LABEL_15:
    self->_tcpRxBytes = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 0x10u;
    return;
  }
LABEL_14:
  self->_tcpTxBytes = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)a3 + 36) & 0x10) != 0)
    goto LABEL_15;
}

- (unsigned)dnsResolutionLatency
{
  return self->_dnsResolutionLatency;
}

- (unsigned)tcpHandshakeLatency
{
  return self->_tcpHandshakeLatency;
}

- (unsigned)tlsLatency
{
  return self->_tlsLatency;
}

- (unsigned)tcpRetransmissions
{
  return self->_tcpRetransmissions;
}

- (unsigned)tcpTxBytes
{
  return self->_tcpTxBytes;
}

- (unsigned)tcpRxBytes
{
  return self->_tcpRxBytes;
}

@end
