@implementation AWDSiriNetworkAnalyzerRun

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setInterface:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_interface = a3;
}

- (void)setHasInterface:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasInterface
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsUserRequest:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isUserRequest = a3;
}

- (void)setHasIsUserRequest:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsUserRequest
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setAnalyzingSuccessfulRetry:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_analyzingSuccessfulRetry = a3;
}

- (void)setHasAnalyzingSuccessfulRetry:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasAnalyzingSuccessfulRetry
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setWwanPreferred:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_wwanPreferred = a3;
}

- (void)setHasWwanPreferred:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasWwanPreferred
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSendBufferBytesRemaining:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_sendBufferBytesRemaining = a3;
}

- (void)setHasSendBufferBytesRemaining:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSendBufferBytesRemaining
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setKnownURLLoadDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_knownURLLoadDuration = a3;
}

- (void)setHasKnownURLLoadDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasKnownURLLoadDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSiriURLLoadDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_siriURLLoadDuration = a3;
}

- (void)setHasSiriURLLoadDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSiriURLLoadDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSiriSaltURLLoadDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_siriSaltURLLoadDuration = a3;
}

- (void)setHasSiriSaltURLLoadDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSiriSaltURLLoadDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setGatewayStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_gatewayStatus = a3;
}

- (void)setHasGatewayStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasGatewayStatus
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setGatewayPingDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_gatewayPingDuration = a3;
}

- (void)setHasGatewayPingDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasGatewayPingDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setGatewayPingsSent:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_gatewayPingsSent = a3;
}

- (void)setHasGatewayPingsSent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasGatewayPingsSent
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setGatewayPingsDropped:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_gatewayPingsDropped = a3;
}

- (void)setHasGatewayPingsDropped:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasGatewayPingsDropped
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSiriNetworkAnalyzerRun;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSiriNetworkAnalyzerRun description](&v3, sel_description), -[AWDSiriNetworkAnalyzerRun dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_interface), CFSTR("interface"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserRequest), CFSTR("isUserRequest"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_analyzingSuccessfulRetry), CFSTR("analyzingSuccessfulRetry"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wwanPreferred), CFSTR("wwanPreferred"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sendBufferBytesRemaining), CFSTR("sendBufferBytesRemaining"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_knownURLLoadDuration), CFSTR("knownURLLoadDuration"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_siriURLLoadDuration), CFSTR("siriURLLoadDuration"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_siriSaltURLLoadDuration), CFSTR("siriSaltURLLoadDuration"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_gatewayStatus), CFSTR("gatewayStatus"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
LABEL_27:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_gatewayPingsSent), CFSTR("gatewayPingsSent"));
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_14;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_gatewayPingDuration), CFSTR("gatewayPingDuration"));
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x20) != 0)
LABEL_14:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_gatewayPingsDropped), CFSTR("gatewayPingsDropped"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSiriNetworkAnalyzerRunReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      return;
LABEL_27:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    goto LABEL_27;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 5) = self->_timestamp;
    *((_WORD *)a3 + 36) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 15) = self->_interface;
  *((_WORD *)a3 + 36) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_BYTE *)a3 + 69) = self->_isUserRequest;
  *((_WORD *)a3 + 36) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)a3 + 68) = self->_analyzingSuccessfulRetry;
  *((_WORD *)a3 + 36) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)a3 + 70) = self->_wwanPreferred;
  *((_WORD *)a3 + 36) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 16) = self->_sendBufferBytesRemaining;
  *((_WORD *)a3 + 36) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 2) = self->_knownURLLoadDuration;
  *((_WORD *)a3 + 36) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 4) = self->_siriURLLoadDuration;
  *((_WORD *)a3 + 36) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 3) = self->_siriSaltURLLoadDuration;
  *((_WORD *)a3 + 36) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 14) = self->_gatewayStatus;
  *((_WORD *)a3 + 36) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)a3 + 1) = self->_gatewayPingDuration;
  *((_WORD *)a3 + 36) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      return;
LABEL_27:
    *((_DWORD *)a3 + 12) = self->_gatewayPingsDropped;
    *((_WORD *)a3 + 36) |= 0x20u;
    return;
  }
LABEL_26:
  *((_DWORD *)a3 + 13) = self->_gatewayPingsSent;
  *((_WORD *)a3 + 36) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    goto LABEL_27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)result + 5) = self->_timestamp;
    *((_WORD *)result + 36) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 15) = self->_interface;
  *((_WORD *)result + 36) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)result + 69) = self->_isUserRequest;
  *((_WORD *)result + 36) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)result + 68) = self->_analyzingSuccessfulRetry;
  *((_WORD *)result + 36) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)result + 70) = self->_wwanPreferred;
  *((_WORD *)result + 36) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 16) = self->_sendBufferBytesRemaining;
  *((_WORD *)result + 36) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 2) = self->_knownURLLoadDuration;
  *((_WORD *)result + 36) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)result + 4) = self->_siriURLLoadDuration;
  *((_WORD *)result + 36) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)result + 3) = self->_siriSaltURLLoadDuration;
  *((_WORD *)result + 36) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 14) = self->_gatewayStatus;
  *((_WORD *)result + 36) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)result + 1) = self->_gatewayPingDuration;
  *((_WORD *)result + 36) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_14;
  }
LABEL_27:
  *((_DWORD *)result + 13) = self->_gatewayPingsSent;
  *((_WORD *)result + 36) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x20) == 0)
    return result;
LABEL_14:
  *((_DWORD *)result + 12) = self->_gatewayPingsDropped;
  *((_WORD *)result + 36) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 36);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_timestamp != *((_QWORD *)a3 + 5))
      goto LABEL_75;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 36) & 0x100) == 0 || self->_interface != *((_DWORD *)a3 + 15))
      goto LABEL_75;
  }
  else if ((*((_WORD *)a3 + 36) & 0x100) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 36) & 0x800) == 0)
      goto LABEL_75;
    if (self->_isUserRequest)
    {
      if (!*((_BYTE *)a3 + 69))
        goto LABEL_75;
    }
    else if (*((_BYTE *)a3 + 69))
    {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)a3 + 36) & 0x800) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 36) & 0x400) == 0)
      goto LABEL_75;
    if (self->_analyzingSuccessfulRetry)
    {
      if (!*((_BYTE *)a3 + 68))
        goto LABEL_75;
    }
    else if (*((_BYTE *)a3 + 68))
    {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)a3 + 36) & 0x400) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    if ((*((_WORD *)a3 + 36) & 0x1000) != 0)
      goto LABEL_75;
    goto LABEL_36;
  }
  if ((*((_WORD *)a3 + 36) & 0x1000) == 0)
    goto LABEL_75;
  if (self->_wwanPreferred)
  {
    if (!*((_BYTE *)a3 + 70))
      goto LABEL_75;
    goto LABEL_36;
  }
  if (*((_BYTE *)a3 + 70))
  {
LABEL_75:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_36:
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 36) & 0x200) == 0 || self->_sendBufferBytesRemaining != *((_DWORD *)a3 + 16))
      goto LABEL_75;
  }
  else if ((*((_WORD *)a3 + 36) & 0x200) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_knownURLLoadDuration != *((_QWORD *)a3 + 2))
      goto LABEL_75;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_siriURLLoadDuration != *((_QWORD *)a3 + 4))
      goto LABEL_75;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_siriSaltURLLoadDuration != *((_QWORD *)a3 + 3))
      goto LABEL_75;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_gatewayStatus != *((_DWORD *)a3 + 14))
      goto LABEL_75;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_gatewayPingDuration != *((_QWORD *)a3 + 1))
      goto LABEL_75;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_gatewayPingsSent != *((_DWORD *)a3 + 13))
      goto LABEL_75;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_75;
  }
  LOBYTE(v5) = (v7 & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_gatewayPingsDropped != *((_DWORD *)a3 + 12))
      goto LABEL_75;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_interface;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_isUserRequest;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_analyzingSuccessfulRetry;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_wwanPreferred;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_sendBufferBytesRemaining;
    if ((has & 2) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_knownURLLoadDuration;
    if ((has & 8) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_siriURLLoadDuration;
    if ((has & 4) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
  if ((has & 4) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_siriSaltURLLoadDuration;
    if ((has & 0x80) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v11 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_gatewayStatus;
    if ((has & 1) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v12 = 0;
  if ((has & 1) != 0)
  {
LABEL_12:
    v13 = 2654435761u * self->_gatewayPingDuration;
    if ((has & 0x40) != 0)
      goto LABEL_13;
LABEL_26:
    v14 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_14;
LABEL_27:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  v13 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_26;
LABEL_13:
  v14 = 2654435761 * self->_gatewayPingsSent;
  if ((has & 0x20) == 0)
    goto LABEL_27;
LABEL_14:
  v15 = 2654435761 * self->_gatewayPingsDropped;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    v3 = *((_WORD *)a3 + 36);
    if ((v3 & 0x100) == 0)
    {
LABEL_3:
      if ((v3 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*((_WORD *)a3 + 36) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_interface = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x800) == 0)
  {
LABEL_4:
    if ((v3 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_isUserRequest = *((_BYTE *)a3 + 69);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x400) == 0)
  {
LABEL_5:
    if ((v3 & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_analyzingSuccessfulRetry = *((_BYTE *)a3 + 68);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x1000) == 0)
  {
LABEL_6:
    if ((v3 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_wwanPreferred = *((_BYTE *)a3 + 70);
  *(_WORD *)&self->_has |= 0x1000u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x200) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_sendBufferBytesRemaining = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 2) == 0)
  {
LABEL_8:
    if ((v3 & 8) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_knownURLLoadDuration = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 8) == 0)
  {
LABEL_9:
    if ((v3 & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_siriURLLoadDuration = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 4) == 0)
  {
LABEL_10:
    if ((v3 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_siriSaltURLLoadDuration = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x80) == 0)
  {
LABEL_11:
    if ((v3 & 1) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  self->_gatewayStatus = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  self->_gatewayPingDuration = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 36);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 0x20) == 0)
      return;
LABEL_27:
    self->_gatewayPingsDropped = *((_DWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 0x20u;
    return;
  }
LABEL_26:
  self->_gatewayPingsSent = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 36) & 0x20) != 0)
    goto LABEL_27;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)interface
{
  return self->_interface;
}

- (BOOL)isUserRequest
{
  return self->_isUserRequest;
}

- (BOOL)analyzingSuccessfulRetry
{
  return self->_analyzingSuccessfulRetry;
}

- (BOOL)wwanPreferred
{
  return self->_wwanPreferred;
}

- (int)sendBufferBytesRemaining
{
  return self->_sendBufferBytesRemaining;
}

- (unint64_t)knownURLLoadDuration
{
  return self->_knownURLLoadDuration;
}

- (unint64_t)siriURLLoadDuration
{
  return self->_siriURLLoadDuration;
}

- (unint64_t)siriSaltURLLoadDuration
{
  return self->_siriSaltURLLoadDuration;
}

- (int)gatewayStatus
{
  return self->_gatewayStatus;
}

- (unint64_t)gatewayPingDuration
{
  return self->_gatewayPingDuration;
}

- (unsigned)gatewayPingsSent
{
  return self->_gatewayPingsSent;
}

- (unsigned)gatewayPingsDropped
{
  return self->_gatewayPingsDropped;
}

@end
