@implementation AWDVPNSession

- (void)dealloc
{
  objc_super v3;

  -[AWDVPNSession setProtocol:](self, "setProtocol:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDVPNSession;
  -[AWDVPNSession dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasProtocol
{
  return self->_protocol != 0;
}

- (void)setTriggerType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_triggerType = a3;
}

- (void)setHasTriggerType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTriggerType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTriggerTrafficClass:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_triggerTrafficClass = a3;
}

- (void)setHasTriggerTrafficClass:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTriggerTrafficClass
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIpv4Installed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_ipv4Installed = a3;
}

- (void)setHasIpv4Installed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIpv4Installed
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIpv6Installed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_ipv6Installed = a3;
}

- (void)setHasIpv6Installed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIpv6Installed
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setProxyInstalled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_proxyInstalled = a3;
}

- (void)setHasProxyInstalled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasProxyInstalled
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setAppVpnUsed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_appVpnUsed = a3;
}

- (void)setHasAppVpnUsed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasAppVpnUsed
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSystemAuthenMethod:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_systemAuthenMethod = a3;
}

- (void)setHasSystemAuthenMethod:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSystemAuthenMethod
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setUserAuthenMethod:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_userAuthenMethod = a3;
}

- (void)setHasUserAuthenMethod:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUserAuthenMethod
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setDisconnectReason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_disconnectReason = a3;
}

- (void)setHasDisconnectReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDisconnectReason
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setConnectFailed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_connectFailed = a3;
}

- (void)setHasConnectFailed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasConnectFailed
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setReassertCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_reassertCount = a3;
}

- (void)setHasReassertCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasReassertCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setInBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_inBytes = a3;
}

- (void)setHasInBytes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasInBytes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setOutBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_outBytes = a3;
}

- (void)setHasOutBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasOutBytes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDVPNSession;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDVPNSession description](&v3, sel_description), -[AWDVPNSession dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *protocol;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_WORD *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  protocol = self->_protocol;
  if (protocol)
    objc_msgSend(v3, "setObject:forKey:", protocol, CFSTR("protocol"));
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_triggerType), CFSTR("trigger_type"));
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_triggerTrafficClass), CFSTR("trigger_traffic_class"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ipv4Installed), CFSTR("ipv4_installed"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ipv6Installed), CFSTR("ipv6_installed"));
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_proxyInstalled), CFSTR("proxy_installed"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_appVpnUsed), CFSTR("app_vpn_used"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_systemAuthenMethod), CFSTR("system_authen_method"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_userAuthenMethod), CFSTR("user_authen_method"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_disconnectReason), CFSTR("disconnect_reason"));
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_connectFailed), CFSTR("connect_failed"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_duration), CFSTR("duration"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_17:
    if ((has & 1) == 0)
      goto LABEL_18;
LABEL_33:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_inBytes), CFSTR("in_bytes"));
    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_19;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reassertCount), CFSTR("reassert_count"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_33;
LABEL_18:
  if ((has & 2) != 0)
LABEL_19:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_outBytes), CFSTR("out_bytes"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDVPNSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  if ((*(_WORD *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_protocol)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_17:
    if ((has & 1) == 0)
      goto LABEL_18;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_18:
    if ((has & 2) == 0)
      return;
LABEL_33:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_33;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_WORD *)a3 + 40) |= 4u;
  }
  if (self->_protocol)
    objc_msgSend(a3, "setProtocol:");
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)a3 + 17) = self->_triggerType;
    *((_WORD *)a3 + 40) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 16) = self->_triggerTrafficClass;
  *((_WORD *)a3 + 40) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 10) = self->_ipv4Installed;
  *((_WORD *)a3 + 40) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 11) = self->_ipv6Installed;
  *((_WORD *)a3 + 40) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_BYTE *)a3 + 78) = self->_proxyInstalled;
  *((_WORD *)a3 + 40) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_BYTE *)a3 + 76) = self->_appVpnUsed;
  *((_WORD *)a3 + 40) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 15) = self->_systemAuthenMethod;
  *((_WORD *)a3 + 40) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 18) = self->_userAuthenMethod;
  *((_WORD *)a3 + 40) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 8) = self->_disconnectReason;
  *((_WORD *)a3 + 40) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  *((_BYTE *)a3 + 77) = self->_connectFailed;
  *((_WORD *)a3 + 40) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 9) = self->_duration;
  *((_WORD *)a3 + 40) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_17:
    if ((has & 1) == 0)
      goto LABEL_18;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 14) = self->_reassertCount;
  *((_WORD *)a3 + 40) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_18:
    if ((has & 2) == 0)
      return;
    goto LABEL_19;
  }
LABEL_33:
  *((_QWORD *)a3 + 1) = self->_inBytes;
  *((_WORD *)a3 + 40) |= 1u;
  if ((*(_WORD *)&self->_has & 2) == 0)
    return;
LABEL_19:
  *((_QWORD *)a3 + 2) = self->_outBytes;
  *((_WORD *)a3 + 40) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_WORD *)(v5 + 80) |= 4u;
  }

  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_protocol, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_triggerType;
    *(_WORD *)(v6 + 80) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 64) = self->_triggerTrafficClass;
  *(_WORD *)(v6 + 80) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 40) = self->_ipv4Installed;
  *(_WORD *)(v6 + 80) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v6 + 44) = self->_ipv6Installed;
  *(_WORD *)(v6 + 80) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *(_BYTE *)(v6 + 78) = self->_proxyInstalled;
  *(_WORD *)(v6 + 80) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *(_BYTE *)(v6 + 76) = self->_appVpnUsed;
  *(_WORD *)(v6 + 80) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v6 + 60) = self->_systemAuthenMethod;
  *(_WORD *)(v6 + 80) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v6 + 72) = self->_userAuthenMethod;
  *(_WORD *)(v6 + 80) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v6 + 32) = self->_disconnectReason;
  *(_WORD *)(v6 + 80) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *(_BYTE *)(v6 + 77) = self->_connectFailed;
  *(_WORD *)(v6 + 80) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v6 + 36) = self->_duration;
  *(_WORD *)(v6 + 80) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 1) == 0)
      goto LABEL_16;
LABEL_31:
    *(_QWORD *)(v6 + 8) = self->_inBytes;
    *(_WORD *)(v6 + 80) |= 1u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      return (id)v6;
    goto LABEL_17;
  }
LABEL_30:
  *(_DWORD *)(v6 + 56) = self->_reassertCount;
  *(_WORD *)(v6 + 80) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_31;
LABEL_16:
  if ((has & 2) != 0)
  {
LABEL_17:
    *(_QWORD *)(v6 + 16) = self->_outBytes;
    *(_WORD *)(v6 + 80) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *protocol;
  __int16 v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 40);
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
      goto LABEL_88;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_88;
  }
  protocol = self->_protocol;
  if ((unint64_t)protocol | *((_QWORD *)a3 + 6))
  {
    v5 = -[NSString isEqual:](protocol, "isEqual:");
    if (!v5)
      return v5;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)a3 + 40);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x400) == 0 || self->_triggerType != *((_DWORD *)a3 + 17))
      goto LABEL_88;
  }
  else if ((*((_WORD *)a3 + 40) & 0x400) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x200) == 0 || self->_triggerTrafficClass != *((_DWORD *)a3 + 16))
      goto LABEL_88;
  }
  else if ((*((_WORD *)a3 + 40) & 0x200) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_ipv4Installed != *((_DWORD *)a3 + 10))
      goto LABEL_88;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_ipv6Installed != *((_DWORD *)a3 + 11))
      goto LABEL_88;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x4000) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x4000) == 0)
      goto LABEL_88;
    if (self->_proxyInstalled)
    {
      if (!*((_BYTE *)a3 + 78))
        goto LABEL_88;
    }
    else if (*((_BYTE *)a3 + 78))
    {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x4000) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x1000) == 0)
      goto LABEL_88;
    if (self->_appVpnUsed)
    {
      if (!*((_BYTE *)a3 + 76))
        goto LABEL_88;
    }
    else if (*((_BYTE *)a3 + 76))
    {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x1000) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x100) == 0 || self->_systemAuthenMethod != *((_DWORD *)a3 + 15))
      goto LABEL_88;
  }
  else if ((*((_WORD *)a3 + 40) & 0x100) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x800) == 0 || self->_userAuthenMethod != *((_DWORD *)a3 + 18))
      goto LABEL_88;
  }
  else if ((*((_WORD *)a3 + 40) & 0x800) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_disconnectReason != *((_DWORD *)a3 + 8))
      goto LABEL_88;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x2000) == 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x2000) != 0)
      goto LABEL_88;
    goto LABEL_69;
  }
  if ((*((_WORD *)a3 + 40) & 0x2000) == 0)
    goto LABEL_88;
  if (self->_connectFailed)
  {
    if (!*((_BYTE *)a3 + 77))
      goto LABEL_88;
    goto LABEL_69;
  }
  if (*((_BYTE *)a3 + 77))
  {
LABEL_88:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_69:
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_duration != *((_DWORD *)a3 + 9))
      goto LABEL_88;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_reassertCount != *((_DWORD *)a3 + 14))
      goto LABEL_88;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_inBytes != *((_QWORD *)a3 + 1))
      goto LABEL_88;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_88;
  }
  LOBYTE(v5) = (v9 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_outBytes != *((_QWORD *)a3 + 2))
      goto LABEL_88;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  __int16 has;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  if ((*(_WORD *)&self->_has & 4) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_protocol, "hash");
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v6 = 2654435761 * self->_triggerType;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_triggerTrafficClass;
      if ((has & 0x20) != 0)
        goto LABEL_7;
      goto LABEL_21;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_ipv4Installed;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_ipv6Installed;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_proxyInstalled;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_appVpnUsed;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_systemAuthenMethod;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_userAuthenMethod;
    if ((has & 8) != 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  v13 = 0;
  if ((has & 8) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_disconnectReason;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_connectFailed;
    if ((has & 0x10) != 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_28:
  v15 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_duration;
    if ((has & 0x80) != 0)
      goto LABEL_16;
    goto LABEL_30;
  }
LABEL_29:
  v16 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_reassertCount;
    if ((has & 1) != 0)
      goto LABEL_17;
LABEL_31:
    v18 = 0;
    if ((has & 2) != 0)
      goto LABEL_18;
LABEL_32:
    v19 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_30:
  v17 = 0;
  if ((has & 1) == 0)
    goto LABEL_31;
LABEL_17:
  v18 = 2654435761u * self->_inBytes;
  if ((has & 2) == 0)
    goto LABEL_32;
LABEL_18:
  v19 = 2654435761u * self->_outBytes;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  if ((*((_WORD *)a3 + 40) & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 6))
    -[AWDVPNSession setProtocol:](self, "setProtocol:");
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x400) != 0)
  {
    self->_triggerType = *((_DWORD *)a3 + 17);
    *(_WORD *)&self->_has |= 0x400u;
    v5 = *((_WORD *)a3 + 40);
    if ((v5 & 0x200) == 0)
    {
LABEL_7:
      if ((v5 & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x200) == 0)
  {
    goto LABEL_7;
  }
  self->_triggerTrafficClass = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  self->_ipv4Installed = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  self->_ipv6Installed = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x4000) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  self->_proxyInstalled = *((_BYTE *)a3 + 78);
  *(_WORD *)&self->_has |= 0x4000u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  self->_appVpnUsed = *((_BYTE *)a3 + 76);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  self->_systemAuthenMethod = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 8) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  self->_userAuthenMethod = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  self->_disconnectReason = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  self->_connectFailed = *((_BYTE *)a3 + 77);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_16:
    if ((v5 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  self->_duration = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_17:
    if ((v5 & 1) == 0)
      goto LABEL_18;
    goto LABEL_33;
  }
LABEL_32:
  self->_reassertCount = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_18:
    if ((v5 & 2) == 0)
      return;
    goto LABEL_19;
  }
LABEL_33:
  self->_inBytes = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)a3 + 40) & 2) == 0)
    return;
LABEL_19:
  self->_outBytes = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unsigned)triggerType
{
  return self->_triggerType;
}

- (unsigned)triggerTrafficClass
{
  return self->_triggerTrafficClass;
}

- (unsigned)ipv4Installed
{
  return self->_ipv4Installed;
}

- (unsigned)ipv6Installed
{
  return self->_ipv6Installed;
}

- (BOOL)proxyInstalled
{
  return self->_proxyInstalled;
}

- (BOOL)appVpnUsed
{
  return self->_appVpnUsed;
}

- (unsigned)systemAuthenMethod
{
  return self->_systemAuthenMethod;
}

- (unsigned)userAuthenMethod
{
  return self->_userAuthenMethod;
}

- (unsigned)disconnectReason
{
  return self->_disconnectReason;
}

- (BOOL)connectFailed
{
  return self->_connectFailed;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)reassertCount
{
  return self->_reassertCount;
}

- (unint64_t)inBytes
{
  return self->_inBytes;
}

- (unint64_t)outBytes
{
  return self->_outBytes;
}

@end
