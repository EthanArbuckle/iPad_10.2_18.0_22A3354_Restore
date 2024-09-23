@implementation AWDIDSQuickRelay

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSQuickRelay setServiceName:](self, "setServiceName:", 0);
  -[AWDIDSQuickRelay setSubServiceName:](self, "setSubServiceName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSQuickRelay;
  -[AWDIDSQuickRelay dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setEventType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEventType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setEventSubType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_eventSubType = a3;
}

- (void)setHasEventSubType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEventSubType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setResultCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_resultCode = a3;
}

- (void)setHasResultCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasResultCode
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTransportType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTransportType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setInterfaceType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasInterfaceType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSkeEnabled:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_skeEnabled = a3;
}

- (void)setHasSkeEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSkeEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsInitiator:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isInitiator = a3;
}

- (void)setHasIsInitiator:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsInitiator
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasProtocolVersion
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRetryCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_retryCount = a3;
}

- (void)setHasRetryCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRetryCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (BOOL)hasSubServiceName
{
  return self->_subServiceName != 0;
}

- (void)setProviderType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_providerType = a3;
}

- (void)setHasProviderType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasProviderType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSQuickRelay;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSQuickRelay description](&v3, sel_description), -[AWDIDSQuickRelay dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  NSString *serviceName;
  NSString *subServiceName;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_eventType), CFSTR("eventType"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_eventSubType), CFSTR("eventSubType"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_resultCode), CFSTR("resultCode"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_transportType), CFSTR("transportType"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_interfaceType), CFSTR("interfaceType"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_skeEnabled), CFSTR("skeEnabled"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isInitiator), CFSTR("isInitiator"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_protocolVersion), CFSTR("protocolVersion"));
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_retryCount), CFSTR("retryCount"));
LABEL_13:
  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend(v3, "setObject:forKey:", serviceName, CFSTR("serviceName"));
  subServiceName = self->_subServiceName;
  if (subServiceName)
    objc_msgSend(v3, "setObject:forKey:", subServiceName, CFSTR("subServiceName"));
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_providerType), CFSTR("providerType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSQuickRelayReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_12:
    PBDataWriterWriteUint32Field();
LABEL_13:
  if (self->_serviceName)
    PBDataWriterWriteStringField();
  if (self->_subServiceName)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_WORD *)a3 + 42) |= 2u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_eventType;
  *((_WORD *)a3 + 42) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 6) = self->_eventSubType;
  *((_WORD *)a3 + 42) |= 4u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 1) = self->_duration;
  *((_WORD *)a3 + 42) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 12) = self->_resultCode;
  *((_WORD *)a3 + 42) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 20) = self->_transportType;
  *((_WORD *)a3 + 42) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 8) = self->_interfaceType;
  *((_WORD *)a3 + 42) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 16) = self->_skeEnabled;
  *((_WORD *)a3 + 42) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 9) = self->_isInitiator;
  *((_WORD *)a3 + 42) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_29:
  *((_DWORD *)a3 + 10) = self->_protocolVersion;
  *((_WORD *)a3 + 42) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_12:
    *((_DWORD *)a3 + 13) = self->_retryCount;
    *((_WORD *)a3 + 42) |= 0x200u;
  }
LABEL_13:
  if (self->_serviceName)
    objc_msgSend(a3, "setServiceName:");
  if (self->_subServiceName)
    objc_msgSend(a3, "setSubServiceName:");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_providerType;
    *((_WORD *)a3 + 42) |= 0x80u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_WORD *)(v5 + 84) |= 2u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_eventType;
  *(_WORD *)(v5 + 84) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 24) = self->_eventSubType;
  *(_WORD *)(v5 + 84) |= 4u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *(_QWORD *)(v5 + 8) = self->_duration;
  *(_WORD *)(v5 + 84) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 48) = self->_resultCode;
  *(_WORD *)(v5 + 84) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 80) = self->_transportType;
  *(_WORD *)(v5 + 84) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 32) = self->_interfaceType;
  *(_WORD *)(v5 + 84) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 64) = self->_skeEnabled;
  *(_WORD *)(v5 + 84) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 36) = self->_isInitiator;
  *(_WORD *)(v5 + 84) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_25:
  *(_DWORD *)(v5 + 40) = self->_protocolVersion;
  *(_WORD *)(v5 + 84) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 52) = self->_retryCount;
    *(_WORD *)(v5 + 84) |= 0x200u;
  }
LABEL_13:

  *(_QWORD *)(v6 + 56) = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 72) = -[NSString copyWithZone:](self->_subServiceName, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_providerType;
    *(_WORD *)(v6 + 84) |= 0x80u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *serviceName;
  NSString *subServiceName;
  __int16 v10;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 42);
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_65;
    }
    else if ((v7 & 2) != 0)
    {
LABEL_65:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_eventType != *((_DWORD *)a3 + 7))
        goto LABEL_65;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_65;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_eventSubType != *((_DWORD *)a3 + 6))
        goto LABEL_65;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_65;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
        goto LABEL_65;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_65;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x100) == 0 || self->_resultCode != *((_DWORD *)a3 + 12))
        goto LABEL_65;
    }
    else if ((*((_WORD *)a3 + 42) & 0x100) != 0)
    {
      goto LABEL_65;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x800) == 0 || self->_transportType != *((_DWORD *)a3 + 20))
        goto LABEL_65;
    }
    else if ((*((_WORD *)a3 + 42) & 0x800) != 0)
    {
      goto LABEL_65;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_interfaceType != *((_DWORD *)a3 + 8))
        goto LABEL_65;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_65;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x400) == 0 || self->_skeEnabled != *((_DWORD *)a3 + 16))
        goto LABEL_65;
    }
    else if ((*((_WORD *)a3 + 42) & 0x400) != 0)
    {
      goto LABEL_65;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_isInitiator != *((_DWORD *)a3 + 9))
        goto LABEL_65;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_65;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_protocolVersion != *((_DWORD *)a3 + 10))
        goto LABEL_65;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_65;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x200) == 0 || self->_retryCount != *((_DWORD *)a3 + 13))
        goto LABEL_65;
    }
    else if ((*((_WORD *)a3 + 42) & 0x200) != 0)
    {
      goto LABEL_65;
    }
    serviceName = self->_serviceName;
    if (!((unint64_t)serviceName | *((_QWORD *)a3 + 7))
      || (v5 = -[NSString isEqual:](serviceName, "isEqual:")) != 0)
    {
      subServiceName = self->_subServiceName;
      if (!((unint64_t)subServiceName | *((_QWORD *)a3 + 9))
        || (v5 = -[NSString isEqual:](subServiceName, "isEqual:")) != 0)
      {
        v10 = *((_WORD *)a3 + 42);
        LOBYTE(v5) = (v10 & 0x80) == 0;
        if ((*(_WORD *)&self->_has & 0x80) != 0)
        {
          if ((v10 & 0x80) == 0 || self->_providerType != *((_DWORD *)a3 + 11))
            goto LABEL_65;
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v18 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
    {
LABEL_3:
      v17 = 2654435761 * self->_eventType;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v18 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v17 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v16 = 2654435761 * self->_eventSubType;
    if ((has & 1) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v16 = 0;
  if ((has & 1) != 0)
  {
LABEL_5:
    v15 = 2654435761u * self->_duration;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    v14 = 2654435761 * self->_resultCode;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_7:
    v4 = 2654435761 * self->_transportType;
    if ((has & 0x10) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    v5 = 2654435761 * self->_interfaceType;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    v6 = 2654435761 * self->_skeEnabled;
    if ((has & 0x20) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_10:
    v7 = 2654435761 * self->_isInitiator;
    if ((has & 0x40) != 0)
      goto LABEL_11;
LABEL_22:
    v8 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_21:
  v7 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_22;
LABEL_11:
  v8 = 2654435761 * self->_protocolVersion;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_12:
    v9 = 2654435761 * self->_retryCount;
    goto LABEL_24;
  }
LABEL_23:
  v9 = 0;
LABEL_24:
  v10 = -[NSString hash](self->_serviceName, "hash");
  v11 = -[NSString hash](self->_subServiceName, "hash");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v12 = 2654435761 * self->_providerType;
  else
    v12 = 0;
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)a3 + 42);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_eventType = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  self->_eventSubType = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  self->_duration = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  self->_resultCode = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  self->_transportType = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  self->_interfaceType = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  self->_skeEnabled = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  self->_isInitiator = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_29:
  self->_protocolVersion = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 42) & 0x200) != 0)
  {
LABEL_12:
    self->_retryCount = *((_DWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_13:
  if (*((_QWORD *)a3 + 7))
    -[AWDIDSQuickRelay setServiceName:](self, "setServiceName:");
  if (*((_QWORD *)a3 + 9))
    -[AWDIDSQuickRelay setSubServiceName:](self, "setSubServiceName:");
  if ((*((_WORD *)a3 + 42) & 0x80) != 0)
  {
    self->_providerType = *((_DWORD *)a3 + 11);
    *(_WORD *)&self->_has |= 0x80u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (unsigned)eventSubType
{
  return self->_eventSubType;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unsigned)resultCode
{
  return self->_resultCode;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (unsigned)interfaceType
{
  return self->_interfaceType;
}

- (unsigned)skeEnabled
{
  return self->_skeEnabled;
}

- (unsigned)isInitiator
{
  return self->_isInitiator;
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (unsigned)retryCount
{
  return self->_retryCount;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)subServiceName
{
  return self->_subServiceName;
}

- (void)setSubServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (unsigned)providerType
{
  return self->_providerType;
}

@end
