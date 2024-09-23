@implementation AWDFaceTimeCallConnected

- (void)dealloc
{
  objc_super v3;

  -[AWDFaceTimeCallConnected setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallConnected;
  -[AWDFaceTimeCallConnected dealloc](&v3, sel_dealloc);
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setConnectDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectDuration = a3;
}

- (void)setHasConnectDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRemoteNetworkConnection:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_remoteNetworkConnection = a3;
}

- (void)setHasRemoteNetworkConnection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRemoteNetworkConnection
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLocalNetworkConnection:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_localNetworkConnection = a3;
}

- (void)setHasLocalNetworkConnection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLocalNetworkConnection
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setUsesRelay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_usesRelay = a3;
}

- (void)setHasUsesRelay:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUsesRelay
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCurrentNatType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_currentNatType = a3;
}

- (void)setHasCurrentNatType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCurrentNatType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRemoteNatType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_remoteNatType = a3;
}

- (void)setHasRemoteNatType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRemoteNatType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRelayConnectDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_relayConnectDuration = a3;
}

- (void)setHasRelayConnectDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRelayConnectDuration
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsVideo:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isVideo = a3;
}

- (void)setHasIsVideo:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsVideo
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setOnLockScreen:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_onLockScreen = a3;
}

- (void)setHasOnLockScreen:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasOnLockScreen
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallConnected;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDFaceTimeCallConnected description](&v3, sel_description), -[AWDFaceTimeCallConnected dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *guid;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectDuration), CFSTR("connectDuration"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_remoteNetworkConnection), CFSTR("remoteNetworkConnection"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_localNetworkConnection), CFSTR("localNetworkConnection"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_usesRelay), CFSTR("usesRelay"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_currentNatType), CFSTR("currentNatType"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_remoteNatType), CFSTR("remoteNatType"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
LABEL_25:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isVideo), CFSTR("isVideo"));
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      return v4;
    goto LABEL_14;
  }
LABEL_24:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_relayConnectDuration), CFSTR("relayConnectDuration"));
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_25;
LABEL_13:
  if ((has & 0x40) != 0)
LABEL_14:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_onLockScreen), CFSTR("onLockScreen"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFaceTimeCallConnectedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  if (self->_guid)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      return;
LABEL_25:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    goto LABEL_25;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 34) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 4) = self->_connectDuration;
  *((_WORD *)a3 + 34) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 15) = self->_remoteNetworkConnection;
  *((_WORD *)a3 + 34) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 11) = self->_localNetworkConnection;
  *((_WORD *)a3 + 34) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 5) = self->_connectionType;
  *((_WORD *)a3 + 34) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 16) = self->_usesRelay;
  *((_WORD *)a3 + 34) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 6) = self->_currentNatType;
  *((_WORD *)a3 + 34) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 14) = self->_remoteNatType;
  *((_WORD *)a3 + 34) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 13) = self->_relayConnectDuration;
  *((_WORD *)a3 + 34) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      return;
    goto LABEL_14;
  }
LABEL_25:
  *((_DWORD *)a3 + 10) = self->_isVideo;
  *((_WORD *)a3 + 34) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) == 0)
    return;
LABEL_14:
  *((_DWORD *)a3 + 12) = self->_onLockScreen;
  *((_WORD *)a3 + 34) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 68) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_connectDuration;
  *(_WORD *)(v5 + 68) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 60) = self->_remoteNetworkConnection;
  *(_WORD *)(v5 + 68) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 44) = self->_localNetworkConnection;
  *(_WORD *)(v5 + 68) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 20) = self->_connectionType;
  *(_WORD *)(v5 + 68) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 64) = self->_usesRelay;
  *(_WORD *)(v5 + 68) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 24) = self->_currentNatType;
  *(_WORD *)(v5 + 68) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 56) = self->_remoteNatType;
  *(_WORD *)(v5 + 68) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
LABEL_23:
    *(_DWORD *)(v5 + 40) = self->_isVideo;
    *(_WORD *)(v5 + 68) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      return (id)v5;
    goto LABEL_12;
  }
LABEL_22:
  *(_DWORD *)(v5 + 52) = self->_relayConnectDuration;
  *(_WORD *)(v5 + 68) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x40) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 48) = self->_onLockScreen;
    *(_WORD *)(v5 + 68) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *guid;
  __int16 has;
  __int16 v8;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((_QWORD *)a3 + 4)) || (v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      has = (__int16)self->_has;
      v8 = *((_WORD *)a3 + 34);
      if ((has & 1) != 0)
      {
        if ((v8 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_58;
      }
      else if ((v8 & 1) != 0)
      {
LABEL_58:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_connectDuration != *((_DWORD *)a3 + 4))
          goto LABEL_58;
      }
      else if ((v8 & 2) != 0)
      {
        goto LABEL_58;
      }
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x200) == 0 || self->_remoteNetworkConnection != *((_DWORD *)a3 + 15))
          goto LABEL_58;
      }
      else if ((*((_WORD *)a3 + 34) & 0x200) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_localNetworkConnection != *((_DWORD *)a3 + 11))
          goto LABEL_58;
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 5))
          goto LABEL_58;
      }
      else if ((v8 & 4) != 0)
      {
        goto LABEL_58;
      }
      if ((*(_WORD *)&self->_has & 0x400) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x400) == 0 || self->_usesRelay != *((_DWORD *)a3 + 16))
          goto LABEL_58;
      }
      else if ((*((_WORD *)a3 + 34) & 0x400) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_currentNatType != *((_DWORD *)a3 + 6))
          goto LABEL_58;
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_58;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x100) == 0 || self->_remoteNatType != *((_DWORD *)a3 + 14))
          goto LABEL_58;
      }
      else if ((*((_WORD *)a3 + 34) & 0x100) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_relayConnectDuration != *((_DWORD *)a3 + 13))
          goto LABEL_58;
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_58;
      }
      if ((has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_isVideo != *((_DWORD *)a3 + 10))
          goto LABEL_58;
      }
      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_58;
      }
      LOBYTE(v5) = (v8 & 0x40) == 0;
      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_onLockScreen != *((_DWORD *)a3 + 12))
          goto LABEL_58;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 has;
  unint64_t v5;
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

  v3 = -[NSString hash](self->_guid, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_connectDuration;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v5 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_remoteNetworkConnection;
    if ((has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_localNetworkConnection;
    if ((has & 4) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    v9 = 2654435761 * self->_connectionType;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    v10 = 2654435761 * self->_usesRelay;
    if ((has & 8) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v10 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    v11 = 2654435761 * self->_currentNatType;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    v12 = 2654435761 * self->_remoteNatType;
    if ((has & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v12 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_10:
    v13 = 2654435761 * self->_relayConnectDuration;
    if ((has & 0x10) != 0)
      goto LABEL_11;
LABEL_22:
    v14 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_12;
LABEL_23:
    v15 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_21:
  v13 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_22;
LABEL_11:
  v14 = 2654435761 * self->_isVideo;
  if ((has & 0x40) == 0)
    goto LABEL_23;
LABEL_12:
  v15 = 2654435761 * self->_onLockScreen;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  if (*((_QWORD *)a3 + 4))
    -[AWDFaceTimeCallConnected setGuid:](self, "setGuid:");
  v5 = *((_WORD *)a3 + 34);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)a3 + 34);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_connectDuration = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_remoteNetworkConnection = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_localNetworkConnection = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 34);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_connectionType = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_usesRelay = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)a3 + 34);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  self->_currentNatType = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  self->_remoteNatType = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x80) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  self->_relayConnectDuration = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 34);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0)
      return;
    goto LABEL_14;
  }
LABEL_25:
  self->_isVideo = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)a3 + 34) & 0x40) == 0)
    return;
LABEL_14:
  self->_onLockScreen = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x40u;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
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

- (unsigned)isVideo
{
  return self->_isVideo;
}

- (unsigned)onLockScreen
{
  return self->_onLockScreen;
}

@end
