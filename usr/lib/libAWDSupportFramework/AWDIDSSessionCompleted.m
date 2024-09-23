@implementation AWDIDSSessionCompleted

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSSessionCompleted setGuid:](self, "setGuid:", 0);
  -[AWDIDSSessionCompleted setServiceName:](self, "setServiceName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSSessionCompleted;
  -[AWDIDSSessionCompleted dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setSessionProtocolVersionNumber:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_sessionProtocolVersionNumber = a3;
}

- (void)setHasSessionProtocolVersionNumber:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSessionProtocolVersionNumber
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (void)setClientType:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_clientType = a3;
}

- (void)setHasClientType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasClientType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsQREnabled:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isQREnabled = a3;
}

- (void)setHasIsQREnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsQREnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIsUsingQRDirectly:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isUsingQRDirectly = a3;
}

- (void)setHasIsUsingQRDirectly:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsUsingQRDirectly
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsInitiator:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_isInitiator = a3;
}

- (void)setHasIsInitiator:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasIsInitiator
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setIsLegacySessionType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_isLegacySessionType = a3;
}

- (void)setHasIsLegacySessionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasIsLegacySessionType
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setIsWithDefaultPairedDevice:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isWithDefaultPairedDevice = a3;
}

- (void)setHasIsWithDefaultPairedDevice:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsWithDefaultPairedDevice
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTransportType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTransportType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setLinkProtocol:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_linkProtocol = a3;
}

- (void)setHasLinkProtocol:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasLinkProtocol
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setEndedReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_endedReason = a3;
}

- (void)setHasEndedReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasEndedReason
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDurationOfSession:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_durationOfSession = a3;
}

- (void)setHasDurationOfSession:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDurationOfSession
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDurationToConnect:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_durationToConnect = a3;
}

- (void)setHasDurationToConnect:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDurationToConnect
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsNetworkEnabled:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_isNetworkEnabled = a3;
}

- (void)setHasIsNetworkEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasIsNetworkEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setIsNetworkActive:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_isNetworkActive = a3;
}

- (void)setHasIsNetworkActive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasIsNetworkActive
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setIsNetworkReachable:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isNetworkReachable = a3;
}

- (void)setHasIsNetworkReachable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsNetworkReachable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsWifiInterfaceDisallowed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isWifiInterfaceDisallowed = a3;
}

- (void)setHasIsWifiInterfaceDisallowed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsWifiInterfaceDisallowed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsCellularInterfaceDisallowed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_isCellularInterfaceDisallowed = a3;
}

- (void)setHasIsCellularInterfaceDisallowed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasIsCellularInterfaceDisallowed
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setLinkType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasLinkType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setDestinationType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_destinationType = a3;
}

- (void)setHasDestinationType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($3B920ED2EB9737C6C2ACFDD5192FBFC0)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDestinationType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSSessionCompleted;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSSessionCompleted description](&v3, sel_description), -[AWDIDSSessionCompleted dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *guid;
  NSString *serviceName;
  $3B920ED2EB9737C6C2ACFDD5192FBFC0 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sessionProtocolVersionNumber), CFSTR("sessionProtocolVersionNumber"));
  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend(v3, "setObject:forKey:", serviceName, CFSTR("serviceName"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_clientType), CFSTR("clientType"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_12;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isQREnabled), CFSTR("isQREnabled"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isUsingQRDirectly), CFSTR("isUsingQRDirectly"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isInitiator), CFSTR("isInitiator"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isLegacySessionType), CFSTR("isLegacySessionType"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isWithDefaultPairedDevice), CFSTR("isWithDefaultPairedDevice"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_transportType), CFSTR("transportType"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_linkProtocol), CFSTR("linkProtocol"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_19;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_endedReason), CFSTR("endedReason"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durationOfSession), CFSTR("durationOfSession"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durationToConnect), CFSTR("durationToConnect"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isNetworkEnabled), CFSTR("isNetworkEnabled"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isNetworkActive), CFSTR("isNetworkActive"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isNetworkReachable), CFSTR("isNetworkReachable"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isWifiInterfaceDisallowed), CFSTR("isWifiInterfaceDisallowed"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_26;
LABEL_45:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_linkType), CFSTR("linkType"));
    if ((*(_DWORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_27;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isCellularInterfaceDisallowed), CFSTR("isCellularInterfaceDisallowed"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
    goto LABEL_45;
LABEL_26:
  if ((*(_BYTE *)&has & 4) != 0)
LABEL_27:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_destinationType), CFSTR("destinationType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSSessionCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $3B920ED2EB9737C6C2ACFDD5192FBFC0 has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_guid)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_serviceName)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_12;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_26;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 4) == 0)
      return;
LABEL_45:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 4) != 0)
    goto LABEL_45;
}

- (void)copyTo:(id)a3
{
  $3B920ED2EB9737C6C2ACFDD5192FBFC0 has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 28) |= 1u;
  }
  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    *((_DWORD *)a3 + 26) = self->_sessionProtocolVersionNumber;
    *((_DWORD *)a3 + 28) |= 0x40000u;
  }
  if (self->_serviceName)
    objc_msgSend(a3, "setServiceName:");
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_clientType;
    *((_DWORD *)a3 + 28) |= 2u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_12;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)a3 + 18) = self->_isQREnabled;
  *((_DWORD *)a3 + 28) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 19) = self->_isUsingQRDirectly;
  *((_DWORD *)a3 + 28) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 13) = self->_isInitiator;
  *((_DWORD *)a3 + 28) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 14) = self->_isLegacySessionType;
  *((_DWORD *)a3 + 28) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 21) = self->_isWithDefaultPairedDevice;
  *((_DWORD *)a3 + 28) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 27) = self->_transportType;
  *((_DWORD *)a3 + 28) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 22) = self->_linkProtocol;
  *((_DWORD *)a3 + 28) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_19;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 8) = self->_endedReason;
  *((_DWORD *)a3 + 28) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 6) = self->_durationOfSession;
  *((_DWORD *)a3 + 28) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 7) = self->_durationToConnect;
  *((_DWORD *)a3 + 28) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 16) = self->_isNetworkEnabled;
  *((_DWORD *)a3 + 28) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 15) = self->_isNetworkActive;
  *((_DWORD *)a3 + 28) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 17) = self->_isNetworkReachable;
  *((_DWORD *)a3 + 28) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 20) = self->_isWifiInterfaceDisallowed;
  *((_DWORD *)a3 + 28) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_26;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 12) = self->_isCellularInterfaceDisallowed;
  *((_DWORD *)a3 + 28) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 4) == 0)
      return;
    goto LABEL_27;
  }
LABEL_45:
  *((_DWORD *)a3 + 23) = self->_linkType;
  *((_DWORD *)a3 + 28) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 4) == 0)
    return;
LABEL_27:
  *((_DWORD *)a3 + 5) = self->_destinationType;
  *((_DWORD *)a3 + 28) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $3B920ED2EB9737C6C2ACFDD5192FBFC0 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 112) |= 1u;
  }

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_sessionProtocolVersionNumber;
    *(_DWORD *)(v6 + 112) |= 0x40000u;
  }

  *(_QWORD *)(v6 + 96) = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_clientType;
    *(_DWORD *)(v6 + 112) |= 2u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_8;
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 72) = self->_isQREnabled;
  *(_DWORD *)(v6 + 112) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v6 + 76) = self->_isUsingQRDirectly;
  *(_DWORD *)(v6 + 112) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v6 + 52) = self->_isInitiator;
  *(_DWORD *)(v6 + 112) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v6 + 56) = self->_isLegacySessionType;
  *(_DWORD *)(v6 + 112) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v6 + 84) = self->_isWithDefaultPairedDevice;
  *(_DWORD *)(v6 + 112) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v6 + 108) = self->_transportType;
  *(_DWORD *)(v6 + 112) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v6 + 88) = self->_linkProtocol;
  *(_DWORD *)(v6 + 112) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v6 + 32) = self->_endedReason;
  *(_DWORD *)(v6 + 112) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v6 + 24) = self->_durationOfSession;
  *(_DWORD *)(v6 + 112) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v6 + 28) = self->_durationToConnect;
  *(_DWORD *)(v6 + 112) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v6 + 64) = self->_isNetworkEnabled;
  *(_DWORD *)(v6 + 112) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v6 + 60) = self->_isNetworkActive;
  *(_DWORD *)(v6 + 112) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v6 + 68) = self->_isNetworkReachable;
  *(_DWORD *)(v6 + 112) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v6 + 80) = self->_isWifiInterfaceDisallowed;
  *(_DWORD *)(v6 + 112) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_22;
LABEL_41:
    *(_DWORD *)(v6 + 92) = self->_linkType;
    *(_DWORD *)(v6 + 112) |= 0x20000u;
    if ((*(_DWORD *)&self->_has & 4) == 0)
      return (id)v6;
    goto LABEL_23;
  }
LABEL_40:
  *(_DWORD *)(v6 + 48) = self->_isCellularInterfaceDisallowed;
  *(_DWORD *)(v6 + 112) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
    goto LABEL_41;
LABEL_22:
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_23:
    *(_DWORD *)(v6 + 20) = self->_destinationType;
    *(_DWORD *)(v6 + 112) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $3B920ED2EB9737C6C2ACFDD5192FBFC0 has;
  int v7;
  NSString *guid;
  int v9;
  NSString *serviceName;
  int v11;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 28);
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_107;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_107:
      LOBYTE(v5) = 0;
      return v5;
    }
    guid = self->_guid;
    if ((unint64_t)guid | *((_QWORD *)a3 + 5))
    {
      v5 = -[NSString isEqual:](guid, "isEqual:");
      if (!v5)
        return v5;
      has = self->_has;
    }
    v9 = *((_DWORD *)a3 + 28);
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v9 & 0x40000) == 0 || self->_sessionProtocolVersionNumber != *((_DWORD *)a3 + 26))
        goto LABEL_107;
    }
    else if ((v9 & 0x40000) != 0)
    {
      goto LABEL_107;
    }
    serviceName = self->_serviceName;
    if ((unint64_t)serviceName | *((_QWORD *)a3 + 12))
    {
      v5 = -[NSString isEqual:](serviceName, "isEqual:");
      if (!v5)
        return v5;
      has = self->_has;
    }
    v11 = *((_DWORD *)a3 + 28);
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v11 & 2) == 0 || self->_clientType != *((_DWORD *)a3 + 4))
        goto LABEL_107;
    }
    else if ((v11 & 2) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v11 & 0x1000) == 0 || self->_isQREnabled != *((_DWORD *)a3 + 18))
        goto LABEL_107;
    }
    else if ((v11 & 0x1000) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v11 & 0x2000) == 0 || self->_isUsingQRDirectly != *((_DWORD *)a3 + 19))
        goto LABEL_107;
    }
    else if ((v11 & 0x2000) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v11 & 0x80) == 0 || self->_isInitiator != *((_DWORD *)a3 + 13))
        goto LABEL_107;
    }
    else if ((v11 & 0x80) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v11 & 0x100) == 0 || self->_isLegacySessionType != *((_DWORD *)a3 + 14))
        goto LABEL_107;
    }
    else if ((v11 & 0x100) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v11 & 0x8000) == 0 || self->_isWithDefaultPairedDevice != *((_DWORD *)a3 + 21))
        goto LABEL_107;
    }
    else if ((v11 & 0x8000) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v11 & 0x80000) == 0 || self->_transportType != *((_DWORD *)a3 + 27))
        goto LABEL_107;
    }
    else if ((v11 & 0x80000) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v11 & 0x10000) == 0 || self->_linkProtocol != *((_DWORD *)a3 + 22))
        goto LABEL_107;
    }
    else if ((v11 & 0x10000) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v11 & 0x20) == 0 || self->_endedReason != *((_DWORD *)a3 + 8))
        goto LABEL_107;
    }
    else if ((v11 & 0x20) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v11 & 8) == 0 || self->_durationOfSession != *((_DWORD *)a3 + 6))
        goto LABEL_107;
    }
    else if ((v11 & 8) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v11 & 0x10) == 0 || self->_durationToConnect != *((_DWORD *)a3 + 7))
        goto LABEL_107;
    }
    else if ((v11 & 0x10) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v11 & 0x400) == 0 || self->_isNetworkEnabled != *((_DWORD *)a3 + 16))
        goto LABEL_107;
    }
    else if ((v11 & 0x400) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v11 & 0x200) == 0 || self->_isNetworkActive != *((_DWORD *)a3 + 15))
        goto LABEL_107;
    }
    else if ((v11 & 0x200) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v11 & 0x800) == 0 || self->_isNetworkReachable != *((_DWORD *)a3 + 17))
        goto LABEL_107;
    }
    else if ((v11 & 0x800) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v11 & 0x4000) == 0 || self->_isWifiInterfaceDisallowed != *((_DWORD *)a3 + 20))
        goto LABEL_107;
    }
    else if ((v11 & 0x4000) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v11 & 0x40) == 0 || self->_isCellularInterfaceDisallowed != *((_DWORD *)a3 + 12))
        goto LABEL_107;
    }
    else if ((v11 & 0x40) != 0)
    {
      goto LABEL_107;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v11 & 0x20000) == 0 || self->_linkType != *((_DWORD *)a3 + 23))
        goto LABEL_107;
    }
    else if ((v11 & 0x20000) != 0)
    {
      goto LABEL_107;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 28) & 4) == 0;
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v11 & 4) == 0 || self->_destinationType != *((_DWORD *)a3 + 5))
        goto LABEL_107;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  $3B920ED2EB9737C6C2ACFDD5192FBFC0 has;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_guid, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    v5 = 2654435761 * self->_sessionProtocolVersionNumber;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_serviceName, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    v8 = 2654435761 * self->_clientType;
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
LABEL_9:
      v9 = 2654435761 * self->_isQREnabled;
      if ((*(_WORD *)&has & 0x2000) != 0)
        goto LABEL_10;
      goto LABEL_28;
    }
  }
  else
  {
    v8 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_9;
  }
  v9 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_10:
    v10 = 2654435761 * self->_isUsingQRDirectly;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  v10 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_11:
    v11 = 2654435761 * self->_isInitiator;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  v11 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_12:
    v12 = 2654435761 * self->_isLegacySessionType;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v12 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_13:
    v13 = 2654435761 * self->_isWithDefaultPairedDevice;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_14:
    v14 = 2654435761 * self->_transportType;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_15:
    v15 = 2654435761 * self->_linkProtocol;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  v15 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_16:
    v16 = 2654435761 * self->_endedReason;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  v16 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_17:
    v17 = 2654435761 * self->_durationOfSession;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_18;
    goto LABEL_36;
  }
LABEL_35:
  v17 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_18:
    v18 = 2654435761 * self->_durationToConnect;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_36:
  v18 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_19:
    v19 = 2654435761 * self->_isNetworkEnabled;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_20;
    goto LABEL_38;
  }
LABEL_37:
  v19 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_20:
    v20 = 2654435761 * self->_isNetworkActive;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_21;
    goto LABEL_39;
  }
LABEL_38:
  v20 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_21:
    v21 = 2654435761 * self->_isNetworkReachable;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_22;
    goto LABEL_40;
  }
LABEL_39:
  v21 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_22:
    v22 = 2654435761 * self->_isWifiInterfaceDisallowed;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_23;
    goto LABEL_41;
  }
LABEL_40:
  v22 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_23:
    v23 = 2654435761 * self->_isCellularInterfaceDisallowed;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_24;
LABEL_42:
    v24 = 0;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_25;
LABEL_43:
    v25 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25;
  }
LABEL_41:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0)
    goto LABEL_42;
LABEL_24:
  v24 = 2654435761 * self->_linkType;
  if ((*(_BYTE *)&has & 4) == 0)
    goto LABEL_43;
LABEL_25:
  v25 = 2654435761 * self->_destinationType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  int v5;

  if ((*((_BYTE *)a3 + 112) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 5))
    -[AWDIDSSessionCompleted setGuid:](self, "setGuid:");
  if ((*((_BYTE *)a3 + 114) & 4) != 0)
  {
    self->_sessionProtocolVersionNumber = *((_DWORD *)a3 + 26);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  if (*((_QWORD *)a3 + 12))
    -[AWDIDSSessionCompleted setServiceName:](self, "setServiceName:");
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 2) != 0)
  {
    self->_clientType = *((_DWORD *)a3 + 4);
    *(_DWORD *)&self->_has |= 2u;
    v5 = *((_DWORD *)a3 + 28);
    if ((v5 & 0x1000) == 0)
    {
LABEL_11:
      if ((v5 & 0x2000) == 0)
        goto LABEL_12;
      goto LABEL_31;
    }
  }
  else if ((v5 & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  self->_isQREnabled = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x2000) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  self->_isUsingQRDirectly = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x80) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  self->_isInitiator = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x100) == 0)
  {
LABEL_14:
    if ((v5 & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  self->_isLegacySessionType = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x8000) == 0)
  {
LABEL_15:
    if ((v5 & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  self->_isWithDefaultPairedDevice = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x80000) == 0)
  {
LABEL_16:
    if ((v5 & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  self->_transportType = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x10000) == 0)
  {
LABEL_17:
    if ((v5 & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  self->_linkProtocol = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_18:
    if ((v5 & 8) == 0)
      goto LABEL_19;
    goto LABEL_38;
  }
LABEL_37:
  self->_endedReason = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_19:
    if ((v5 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_39;
  }
LABEL_38:
  self->_durationOfSession = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_20:
    if ((v5 & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_40;
  }
LABEL_39:
  self->_durationToConnect = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x400) == 0)
  {
LABEL_21:
    if ((v5 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_41;
  }
LABEL_40:
  self->_isNetworkEnabled = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x200) == 0)
  {
LABEL_22:
    if ((v5 & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_42;
  }
LABEL_41:
  self->_isNetworkActive = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x800) == 0)
  {
LABEL_23:
    if ((v5 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_43;
  }
LABEL_42:
  self->_isNetworkReachable = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x4000) == 0)
  {
LABEL_24:
    if ((v5 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_44;
  }
LABEL_43:
  self->_isWifiInterfaceDisallowed = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x40) == 0)
  {
LABEL_25:
    if ((v5 & 0x20000) == 0)
      goto LABEL_26;
    goto LABEL_45;
  }
LABEL_44:
  self->_isCellularInterfaceDisallowed = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)a3 + 28);
  if ((v5 & 0x20000) == 0)
  {
LABEL_26:
    if ((v5 & 4) == 0)
      return;
    goto LABEL_27;
  }
LABEL_45:
  self->_linkType = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  if ((*((_DWORD *)a3 + 28) & 4) == 0)
    return;
LABEL_27:
  self->_destinationType = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unsigned)sessionProtocolVersionNumber
{
  return self->_sessionProtocolVersionNumber;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (int)clientType
{
  return self->_clientType;
}

- (unsigned)isQREnabled
{
  return self->_isQREnabled;
}

- (unsigned)isUsingQRDirectly
{
  return self->_isUsingQRDirectly;
}

- (unsigned)isInitiator
{
  return self->_isInitiator;
}

- (unsigned)isLegacySessionType
{
  return self->_isLegacySessionType;
}

- (unsigned)isWithDefaultPairedDevice
{
  return self->_isWithDefaultPairedDevice;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (unsigned)linkProtocol
{
  return self->_linkProtocol;
}

- (unsigned)endedReason
{
  return self->_endedReason;
}

- (unsigned)durationOfSession
{
  return self->_durationOfSession;
}

- (unsigned)durationToConnect
{
  return self->_durationToConnect;
}

- (unsigned)isNetworkEnabled
{
  return self->_isNetworkEnabled;
}

- (unsigned)isNetworkActive
{
  return self->_isNetworkActive;
}

- (unsigned)isNetworkReachable
{
  return self->_isNetworkReachable;
}

- (unsigned)isWifiInterfaceDisallowed
{
  return self->_isWifiInterfaceDisallowed;
}

- (unsigned)isCellularInterfaceDisallowed
{
  return self->_isCellularInterfaceDisallowed;
}

- (unsigned)linkType
{
  return self->_linkType;
}

- (unsigned)destinationType
{
  return self->_destinationType;
}

@end
