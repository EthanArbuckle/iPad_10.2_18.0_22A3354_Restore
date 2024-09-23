@implementation AWDPushKeepAliveFailed

- (void)dealloc
{
  objc_super v3;

  -[AWDPushKeepAliveFailed setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDPushKeepAliveFailed;
  -[AWDPushKeepAliveFailed dealloc](&v3, sel_dealloc);
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

- (void)setConnectionType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setError:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasError
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDualChannelState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dualChannelState = a3;
}

- (void)setHasDualChannelState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDualChannelState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setKeepAliveVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_keepAliveVersion = a3;
}

- (void)setHasKeepAliveVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasKeepAliveVersion
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTimeSinceLastSuccessfulKeepAlive:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_timeSinceLastSuccessfulKeepAlive = a3;
}

- (void)setHasTimeSinceLastSuccessfulKeepAlive:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTimeSinceLastSuccessfulKeepAlive
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLastKeepAliveInterval:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_lastKeepAliveInterval = a3;
}

- (void)setHasLastKeepAliveInterval:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLastKeepAliveInterval
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTimeSinceConnected:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_timeSinceConnected = a3;
}

- (void)setHasTimeSinceConnected:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTimeSinceConnected
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setCurrentGrowthStage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_currentGrowthStage = a3;
}

- (void)setHasCurrentGrowthStage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCurrentGrowthStage
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPushKeepAliveFailed;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPushKeepAliveFailed description](&v3, sel_description), -[AWDPushKeepAliveFailed dictionaryRepresentation](self, "dictionaryRepresentation"));
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
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_error), CFSTR("error"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dualChannelState), CFSTR("dualChannelState"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_keepAliveVersion), CFSTR("keepAliveVersion"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_timeSinceLastSuccessfulKeepAlive), CFSTR("timeSinceLastSuccessfulKeepAlive"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
LABEL_23:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_timeSinceConnected), CFSTR("timeSinceConnected"));
    if ((*(_WORD *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_13;
  }
LABEL_22:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lastKeepAliveInterval), CFSTR("lastKeepAliveInterval"));
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_23;
LABEL_12:
  if ((has & 4) != 0)
LABEL_13:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_currentGrowthStage), CFSTR("currentGrowthStage"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushKeepAliveFailedReadFrom((uint64_t)self, (uint64_t)a3);
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
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      return;
LABEL_23:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 4) != 0)
    goto LABEL_23;
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
    *((_WORD *)a3 + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_WORD *)a3 + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 12) = self->_linkQuality;
  *((_WORD *)a3 + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 7) = self->_error;
  *((_WORD *)a3 + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 6) = self->_dualChannelState;
  *((_WORD *)a3 + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 10) = self->_keepAliveVersion;
  *((_WORD *)a3 + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 14) = self->_timeSinceLastSuccessfulKeepAlive;
  *((_WORD *)a3 + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 11) = self->_lastKeepAliveInterval;
  *((_WORD *)a3 + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      return;
    goto LABEL_13;
  }
LABEL_23:
  *((_DWORD *)a3 + 13) = self->_timeSinceConnected;
  *((_WORD *)a3 + 30) |= 0x100u;
  if ((*(_WORD *)&self->_has & 4) == 0)
    return;
LABEL_13:
  *((_DWORD *)a3 + 5) = self->_currentGrowthStage;
  *((_WORD *)a3 + 30) |= 4u;
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
    *(_WORD *)(v5 + 60) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_connectionType;
  *(_WORD *)(v5 + 60) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 48) = self->_linkQuality;
  *(_WORD *)(v5 + 60) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 28) = self->_error;
  *(_WORD *)(v5 + 60) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 24) = self->_dualChannelState;
  *(_WORD *)(v5 + 60) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 40) = self->_keepAliveVersion;
  *(_WORD *)(v5 + 60) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 56) = self->_timeSinceLastSuccessfulKeepAlive;
  *(_WORD *)(v5 + 60) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
LABEL_21:
    *(_DWORD *)(v5 + 52) = self->_timeSinceConnected;
    *(_WORD *)(v5 + 60) |= 0x100u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_11;
  }
LABEL_20:
  *(_DWORD *)(v5 + 44) = self->_lastKeepAliveInterval;
  *(_WORD *)(v5 + 60) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 20) = self->_currentGrowthStage;
    *(_WORD *)(v5 + 60) |= 4u;
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
      v8 = *((_WORD *)a3 + 30);
      if ((has & 1) != 0)
      {
        if ((v8 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_53;
      }
      else if ((v8 & 1) != 0)
      {
LABEL_53:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4))
          goto LABEL_53;
      }
      else if ((v8 & 2) != 0)
      {
        goto LABEL_53;
      }
      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_linkQuality != *((_DWORD *)a3 + 12))
          goto LABEL_53;
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_53;
      }
      if ((has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_error != *((_DWORD *)a3 + 7))
          goto LABEL_53;
      }
      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_53;
      }
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_dualChannelState != *((_DWORD *)a3 + 6))
          goto LABEL_53;
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_53;
      }
      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_keepAliveVersion != *((_DWORD *)a3 + 10))
          goto LABEL_53;
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_53;
      }
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 30) & 0x200) == 0 || self->_timeSinceLastSuccessfulKeepAlive != *((_DWORD *)a3 + 14))
          goto LABEL_53;
      }
      else if ((*((_WORD *)a3 + 30) & 0x200) != 0)
      {
        goto LABEL_53;
      }
      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_lastKeepAliveInterval != *((_DWORD *)a3 + 11))
          goto LABEL_53;
      }
      else if ((v8 & 0x40) != 0)
      {
        goto LABEL_53;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 30) & 0x100) == 0 || self->_timeSinceConnected != *((_DWORD *)a3 + 13))
          goto LABEL_53;
      }
      else if ((*((_WORD *)a3 + 30) & 0x100) != 0)
      {
        goto LABEL_53;
      }
      LOBYTE(v5) = (v8 & 4) == 0;
      if ((has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_currentGrowthStage != *((_DWORD *)a3 + 5))
          goto LABEL_53;
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

  v3 = -[NSString hash](self->_guid, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_connectionType;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v5 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_linkQuality;
    if ((has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_error;
    if ((has & 8) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    v9 = 2654435761 * self->_dualChannelState;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v10 = 2654435761 * self->_keepAliveVersion;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_8:
    v11 = 2654435761 * self->_timeSinceLastSuccessfulKeepAlive;
    if ((has & 0x40) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v11 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_9:
    v12 = 2654435761 * self->_lastKeepAliveInterval;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
LABEL_20:
    v13 = 0;
    if ((has & 4) != 0)
      goto LABEL_11;
LABEL_21:
    v14 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_19:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_20;
LABEL_10:
  v13 = 2654435761 * self->_timeSinceConnected;
  if ((has & 4) == 0)
    goto LABEL_21;
LABEL_11:
  v14 = 2654435761 * self->_currentGrowthStage;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  if (*((_QWORD *)a3 + 4))
    -[AWDPushKeepAliveFailed setGuid:](self, "setGuid:");
  v5 = *((_WORD *)a3 + 30);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)a3 + 30);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_linkQuality = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  self->_error = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  self->_dualChannelState = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  self->_keepAliveVersion = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  self->_timeSinceLastSuccessfulKeepAlive = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  self->_lastKeepAliveInterval = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0)
      return;
    goto LABEL_13;
  }
LABEL_23:
  self->_timeSinceConnected = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 30) & 4) == 0)
    return;
LABEL_13:
  self->_currentGrowthStage = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
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

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (int)error
{
  return self->_error;
}

- (unsigned)dualChannelState
{
  return self->_dualChannelState;
}

- (unsigned)keepAliveVersion
{
  return self->_keepAliveVersion;
}

- (unsigned)timeSinceLastSuccessfulKeepAlive
{
  return self->_timeSinceLastSuccessfulKeepAlive;
}

- (unsigned)lastKeepAliveInterval
{
  return self->_lastKeepAliveInterval;
}

- (unsigned)timeSinceConnected
{
  return self->_timeSinceConnected;
}

- (unsigned)currentGrowthStage
{
  return self->_currentGrowthStage;
}

@end
