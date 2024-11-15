@implementation AWDIDSSessionEnded

- (void)dealloc
{
  objc_super v3;

  -[AWDIDSSessionEnded setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSSessionEnded;
  -[AWDIDSSessionEnded dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setEndedReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_endedReason = a3;
}

- (void)setHasEndedReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasEndedReason
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setGenericError:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_genericError = a3;
}

- (void)setHasGenericError:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasGenericError
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setGameKitError:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_gameKitError = a3;
}

- (void)setHasGameKitError:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasGameKitError
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setConferenceMiscError:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_conferenceMiscError = a3;
}

- (void)setHasConferenceMiscError:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasConferenceMiscError
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCallDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_callDuration = a3;
}

- (void)setHasCallDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCallDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsNetworkEnabled:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isNetworkEnabled = a3;
}

- (void)setHasIsNetworkEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsNetworkEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsNetworkActive:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isNetworkActive = a3;
}

- (void)setHasIsNetworkActive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsNetworkActive
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsNetworkReachable:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isNetworkReachable = a3;
}

- (void)setHasIsNetworkReachable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsNetworkReachable
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNetworkCheckResult:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_networkCheckResult = a3;
}

- (void)setHasNetworkCheckResult:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasNetworkCheckResult
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setDataRate:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_dataRate = a3;
}

- (void)setHasDataRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasDataRate
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setGksError:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_gksError = a3;
}

- (void)setHasGksError:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasGksError
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setConnectDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_connectDuration = a3;
}

- (void)setHasConnectDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasConnectDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRemoteNetworkConnection:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_remoteNetworkConnection = a3;
}

- (void)setHasRemoteNetworkConnection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRemoteNetworkConnection
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setLocalNetworkConnection:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_localNetworkConnection = a3;
}

- (void)setHasLocalNetworkConnection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasLocalNetworkConnection
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasConnectionType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setUsesRelay:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_usesRelay = a3;
}

- (void)setHasUsesRelay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasUsesRelay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setCurrentNatType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_currentNatType = a3;
}

- (void)setHasCurrentNatType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCurrentNatType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setRemoteNatType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_remoteNatType = a3;
}

- (void)setHasRemoteNatType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRemoteNatType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRelayConnectDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_relayConnectDuration = a3;
}

- (void)setHasRelayConnectDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRelayConnectDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setIsInitiator:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isInitiator = a3;
}

- (void)setHasIsInitiator:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsInitiator
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasLinkQuality
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setGksReturnCode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_gksReturnCode = a3;
}

- (void)setHasGksReturnCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($6D1A0C2979084AACDB0C3EE8EF011343)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasGksReturnCode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIDSSessionEnded;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIDSSessionEnded description](&v3, sel_description), -[AWDIDSSessionEnded dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *guid;
  $6D1A0C2979084AACDB0C3EE8EF011343 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_endedReason), CFSTR("endedReason"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_genericError), CFSTR("genericError"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_gameKitError), CFSTR("gameKitError"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_conferenceMiscError), CFSTR("conferenceMiscError"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_callDuration), CFSTR("callDuration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isNetworkEnabled), CFSTR("isNetworkEnabled"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isNetworkActive), CFSTR("isNetworkActive"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isNetworkReachable), CFSTR("isNetworkReachable"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_networkCheckResult), CFSTR("networkCheckResult"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dataRate), CFSTR("dataRate"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_gksError), CFSTR("gksError"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectDuration), CFSTR("connectDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_remoteNetworkConnection), CFSTR("remoteNetworkConnection"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_localNetworkConnection), CFSTR("localNetworkConnection"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_usesRelay), CFSTR("usesRelay"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_currentNatType), CFSTR("currentNatType"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_remoteNatType), CFSTR("remoteNatType"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_relayConnectDuration), CFSTR("relayConnectDuration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_26;
LABEL_49:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      return v3;
    goto LABEL_27;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isInitiator), CFSTR("isInitiator"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
    goto LABEL_49;
LABEL_26:
  if ((*(_WORD *)&has & 0x800) != 0)
LABEL_27:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_gksReturnCode), CFSTR("gksReturnCode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSSessionEndedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $6D1A0C2979084AACDB0C3EE8EF011343 has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_guid)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_23;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_24;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x800) == 0)
      return;
LABEL_49:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
    goto LABEL_49;
}

- (void)copyTo:(id)a3
{
  $6D1A0C2979084AACDB0C3EE8EF011343 has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 29) |= 1u;
  }
  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_endedReason;
    *((_DWORD *)a3 + 29) |= 0x80u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 12) = self->_genericError;
  *((_DWORD *)a3 + 29) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 11) = self->_gameKitError;
  *((_DWORD *)a3 + 29) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 5) = self->_conferenceMiscError;
  *((_DWORD *)a3 + 29) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 4) = self->_callDuration;
  *((_DWORD *)a3 + 29) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 20) = self->_isNetworkEnabled;
  *((_DWORD *)a3 + 29) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 19) = self->_isNetworkActive;
  *((_DWORD *)a3 + 29) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 21) = self->_isNetworkReachable;
  *((_DWORD *)a3 + 29) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 24) = self->_networkCheckResult;
  *((_DWORD *)a3 + 29) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 9) = self->_dataRate;
  *((_DWORD *)a3 + 29) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 13) = self->_gksError;
  *((_DWORD *)a3 + 29) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 6) = self->_connectDuration;
  *((_DWORD *)a3 + 29) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 27) = self->_remoteNetworkConnection;
  *((_DWORD *)a3 + 29) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 23) = self->_localNetworkConnection;
  *((_DWORD *)a3 + 29) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 7) = self->_connectionType;
  *((_DWORD *)a3 + 29) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 28) = self->_usesRelay;
  *((_DWORD *)a3 + 29) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 8) = self->_currentNatType;
  *((_DWORD *)a3 + 29) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 26) = self->_remoteNatType;
  *((_DWORD *)a3 + 29) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 25) = self->_relayConnectDuration;
  *((_DWORD *)a3 + 29) |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 18) = self->_isInitiator;
  *((_DWORD *)a3 + 29) |= 0x1000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x800) == 0)
      return;
    goto LABEL_27;
  }
LABEL_49:
  *((_DWORD *)a3 + 22) = self->_linkQuality;
  *((_DWORD *)a3 + 29) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
    return;
LABEL_27:
  *((_DWORD *)a3 + 14) = self->_gksReturnCode;
  *((_DWORD *)a3 + 29) |= 0x800u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $6D1A0C2979084AACDB0C3EE8EF011343 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 116) |= 1u;
  }

  *(_QWORD *)(v6 + 64) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_endedReason;
    *(_DWORD *)(v6 + 116) |= 0x80u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x100) == 0)
        goto LABEL_6;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 48) = self->_genericError;
  *(_DWORD *)(v6 + 116) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v6 + 44) = self->_gameKitError;
  *(_DWORD *)(v6 + 116) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v6 + 20) = self->_conferenceMiscError;
  *(_DWORD *)(v6 + 116) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v6 + 16) = self->_callDuration;
  *(_DWORD *)(v6 + 116) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v6 + 80) = self->_isNetworkEnabled;
  *(_DWORD *)(v6 + 116) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v6 + 76) = self->_isNetworkActive;
  *(_DWORD *)(v6 + 116) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v6 + 84) = self->_isNetworkReachable;
  *(_DWORD *)(v6 + 116) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v6 + 96) = self->_networkCheckResult;
  *(_DWORD *)(v6 + 116) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v6 + 36) = self->_dataRate;
  *(_DWORD *)(v6 + 116) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v6 + 52) = self->_gksError;
  *(_DWORD *)(v6 + 116) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v6 + 24) = self->_connectDuration;
  *(_DWORD *)(v6 + 116) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v6 + 108) = self->_remoteNetworkConnection;
  *(_DWORD *)(v6 + 116) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v6 + 92) = self->_localNetworkConnection;
  *(_DWORD *)(v6 + 116) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v6 + 28) = self->_connectionType;
  *(_DWORD *)(v6 + 116) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v6 + 112) = self->_usesRelay;
  *(_DWORD *)(v6 + 116) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v6 + 32) = self->_currentNatType;
  *(_DWORD *)(v6 + 116) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v6 + 104) = self->_remoteNatType;
  *(_DWORD *)(v6 + 116) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v6 + 100) = self->_relayConnectDuration;
  *(_DWORD *)(v6 + 116) |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_24;
LABEL_47:
    *(_DWORD *)(v6 + 88) = self->_linkQuality;
    *(_DWORD *)(v6 + 116) |= 0x10000u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      return (id)v6;
    goto LABEL_25;
  }
LABEL_46:
  *(_DWORD *)(v6 + 72) = self->_isInitiator;
  *(_DWORD *)(v6 + 116) |= 0x1000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
    goto LABEL_47;
LABEL_24:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_25:
    *(_DWORD *)(v6 + 56) = self->_gksReturnCode;
    *(_DWORD *)(v6 + 116) |= 0x800u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $6D1A0C2979084AACDB0C3EE8EF011343 has;
  int v7;
  NSString *guid;
  int v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 29);
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_119;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_119:
      LOBYTE(v5) = 0;
      return v5;
    }
    guid = self->_guid;
    if ((unint64_t)guid | *((_QWORD *)a3 + 8))
    {
      v5 = -[NSString isEqual:](guid, "isEqual:");
      if (!v5)
        return v5;
      has = self->_has;
    }
    v9 = *((_DWORD *)a3 + 29);
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_endedReason != *((_DWORD *)a3 + 10))
        goto LABEL_119;
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v9 & 0x200) == 0 || self->_genericError != *((_DWORD *)a3 + 12))
        goto LABEL_119;
    }
    else if ((v9 & 0x200) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v9 & 0x100) == 0 || self->_gameKitError != *((_DWORD *)a3 + 11))
        goto LABEL_119;
    }
    else if ((v9 & 0x100) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v9 & 4) == 0 || self->_conferenceMiscError != *((_DWORD *)a3 + 5))
        goto LABEL_119;
    }
    else if ((v9 & 4) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v9 & 2) == 0 || self->_callDuration != *((_DWORD *)a3 + 4))
        goto LABEL_119;
    }
    else if ((v9 & 2) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v9 & 0x4000) == 0 || self->_isNetworkEnabled != *((_DWORD *)a3 + 20))
        goto LABEL_119;
    }
    else if ((v9 & 0x4000) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v9 & 0x2000) == 0 || self->_isNetworkActive != *((_DWORD *)a3 + 19))
        goto LABEL_119;
    }
    else if ((v9 & 0x2000) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v9 & 0x8000) == 0 || self->_isNetworkReachable != *((_DWORD *)a3 + 21))
        goto LABEL_119;
    }
    else if ((v9 & 0x8000) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v9 & 0x40000) == 0 || self->_networkCheckResult != *((_DWORD *)a3 + 24))
        goto LABEL_119;
    }
    else if ((v9 & 0x40000) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v9 & 0x40) == 0 || self->_dataRate != *((_DWORD *)a3 + 9))
        goto LABEL_119;
    }
    else if ((v9 & 0x40) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v9 & 0x400) == 0 || self->_gksError != *((_DWORD *)a3 + 13))
        goto LABEL_119;
    }
    else if ((v9 & 0x400) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_connectDuration != *((_DWORD *)a3 + 6))
        goto LABEL_119;
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v9 & 0x200000) == 0 || self->_remoteNetworkConnection != *((_DWORD *)a3 + 27))
        goto LABEL_119;
    }
    else if ((v9 & 0x200000) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v9 & 0x20000) == 0 || self->_localNetworkConnection != *((_DWORD *)a3 + 23))
        goto LABEL_119;
    }
    else if ((v9 & 0x20000) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v9 & 0x10) == 0 || self->_connectionType != *((_DWORD *)a3 + 7))
        goto LABEL_119;
    }
    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v9 & 0x400000) == 0 || self->_usesRelay != *((_DWORD *)a3 + 28))
        goto LABEL_119;
    }
    else if ((v9 & 0x400000) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v9 & 0x20) == 0 || self->_currentNatType != *((_DWORD *)a3 + 8))
        goto LABEL_119;
    }
    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v9 & 0x100000) == 0 || self->_remoteNatType != *((_DWORD *)a3 + 26))
        goto LABEL_119;
    }
    else if ((v9 & 0x100000) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v9 & 0x80000) == 0 || self->_relayConnectDuration != *((_DWORD *)a3 + 25))
        goto LABEL_119;
    }
    else if ((v9 & 0x80000) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v9 & 0x1000) == 0 || self->_isInitiator != *((_DWORD *)a3 + 18))
        goto LABEL_119;
    }
    else if ((v9 & 0x1000) != 0)
    {
      goto LABEL_119;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v9 & 0x10000) == 0 || self->_linkQuality != *((_DWORD *)a3 + 22))
        goto LABEL_119;
    }
    else if ((v9 & 0x10000) != 0)
    {
      goto LABEL_119;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 29) & 0x800) == 0;
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v9 & 0x800) == 0 || self->_gksReturnCode != *((_DWORD *)a3 + 14))
        goto LABEL_119;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  $6D1A0C2979084AACDB0C3EE8EF011343 has;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_guid, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    v6 = 2654435761 * self->_endedReason;
    if ((*(_WORD *)&has & 0x200) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_genericError;
      if ((*(_WORD *)&has & 0x100) != 0)
        goto LABEL_7;
      goto LABEL_29;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_gameKitError;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  v8 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_conferenceMiscError;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  v9 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_callDuration;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  v10 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_isNetworkEnabled;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  v11 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_isNetworkActive;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  v12 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_isNetworkReachable;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_networkCheckResult;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  v14 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_dataRate;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  v15 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_gksError;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  v16 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_connectDuration;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_remoteNetworkConnection;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_localNetworkConnection;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  v19 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_19:
    v20 = 2654435761 * self->_connectionType;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_20:
    v21 = 2654435761 * self->_usesRelay;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  v21 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_21:
    v22 = 2654435761 * self->_currentNatType;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_22;
    goto LABEL_44;
  }
LABEL_43:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_22:
    v23 = 2654435761 * self->_remoteNatType;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_23;
    goto LABEL_45;
  }
LABEL_44:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_23:
    v24 = 2654435761 * self->_relayConnectDuration;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_24;
    goto LABEL_46;
  }
LABEL_45:
  v24 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_24:
    v25 = 2654435761 * self->_isInitiator;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_25;
LABEL_47:
    v26 = 0;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_26;
LABEL_48:
    v27 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27;
  }
LABEL_46:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x10000) == 0)
    goto LABEL_47;
LABEL_25:
  v26 = 2654435761 * self->_linkQuality;
  if ((*(_WORD *)&has & 0x800) == 0)
    goto LABEL_48;
LABEL_26:
  v27 = 2654435761 * self->_gksReturnCode;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27;
}

- (void)mergeFrom:(id)a3
{
  int v5;

  if ((*((_BYTE *)a3 + 116) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 8))
    -[AWDIDSSessionEnded setGuid:](self, "setGuid:");
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x80) != 0)
  {
    self->_endedReason = *((_DWORD *)a3 + 10);
    *(_DWORD *)&self->_has |= 0x80u;
    v5 = *((_DWORD *)a3 + 29);
    if ((v5 & 0x200) == 0)
    {
LABEL_7:
      if ((v5 & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_31;
    }
  }
  else if ((v5 & 0x200) == 0)
  {
    goto LABEL_7;
  }
  self->_genericError = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  self->_gameKitError = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  self->_conferenceMiscError = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  self->_callDuration = *((_DWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x4000) == 0)
  {
LABEL_11:
    if ((v5 & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  self->_isNetworkEnabled = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x2000) == 0)
  {
LABEL_12:
    if ((v5 & 0x8000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  self->_isNetworkActive = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x8000) == 0)
  {
LABEL_13:
    if ((v5 & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  self->_isNetworkReachable = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x40000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  self->_networkCheckResult = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x40) == 0)
  {
LABEL_15:
    if ((v5 & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  self->_dataRate = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x400) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  self->_gksError = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 8) == 0)
  {
LABEL_17:
    if ((v5 & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  self->_connectDuration = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x200000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  self->_remoteNetworkConnection = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x200000u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x20000) == 0)
  {
LABEL_19:
    if ((v5 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  self->_localNetworkConnection = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x10) == 0)
  {
LABEL_20:
    if ((v5 & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  self->_connectionType = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x400000) == 0)
  {
LABEL_21:
    if ((v5 & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  self->_usesRelay = *((_DWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x20) == 0)
  {
LABEL_22:
    if ((v5 & 0x100000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  self->_currentNatType = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x100000) == 0)
  {
LABEL_23:
    if ((v5 & 0x80000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  self->_remoteNatType = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x80000) == 0)
  {
LABEL_24:
    if ((v5 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  self->_relayConnectDuration = *((_DWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x1000) == 0)
  {
LABEL_25:
    if ((v5 & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  self->_isInitiator = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)a3 + 29);
  if ((v5 & 0x10000) == 0)
  {
LABEL_26:
    if ((v5 & 0x800) == 0)
      return;
    goto LABEL_27;
  }
LABEL_49:
  self->_linkQuality = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)a3 + 29) & 0x800) == 0)
    return;
LABEL_27:
  self->_gksReturnCode = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
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
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unsigned)endedReason
{
  return self->_endedReason;
}

- (int)genericError
{
  return self->_genericError;
}

- (unsigned)gameKitError
{
  return self->_gameKitError;
}

- (unsigned)conferenceMiscError
{
  return self->_conferenceMiscError;
}

- (unsigned)callDuration
{
  return self->_callDuration;
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

- (unsigned)networkCheckResult
{
  return self->_networkCheckResult;
}

- (unsigned)dataRate
{
  return self->_dataRate;
}

- (int)gksError
{
  return self->_gksError;
}

- (unsigned)connectDuration
{
  return self->_connectDuration;
}

- (unsigned)remoteNetworkConnection
{
  return self->_remoteNetworkConnection;
}

- (unsigned)localNetworkConnection
{
  return self->_localNetworkConnection;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)usesRelay
{
  return self->_usesRelay;
}

- (unsigned)currentNatType
{
  return self->_currentNatType;
}

- (unsigned)remoteNatType
{
  return self->_remoteNatType;
}

- (unsigned)relayConnectDuration
{
  return self->_relayConnectDuration;
}

- (unsigned)isInitiator
{
  return self->_isInitiator;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (int)gksReturnCode
{
  return self->_gksReturnCode;
}

@end
