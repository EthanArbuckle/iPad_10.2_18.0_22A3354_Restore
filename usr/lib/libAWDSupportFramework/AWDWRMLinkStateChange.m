@implementation AWDWRMLinkStateChange

- (void)dealloc
{
  objc_super v3;

  -[AWDWRMLinkStateChange setBundleID:](self, "setBundleID:", 0);
  -[AWDWRMLinkStateChange setTriggerType:](self, "setTriggerType:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMLinkStateChange;
  -[AWDWRMLinkStateChange dealloc](&v3, sel_dealloc);
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

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setSiriApp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_siriApp = a3;
}

- (void)setHasSiriApp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSiriApp
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setIsTriggeredByProximityChange:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isTriggeredByProximityChange = a3;
}

- (void)setHasIsTriggeredByProximityChange:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsTriggeredByProximityChange
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setOldLinkState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_oldLinkState = a3;
}

- (void)setHasOldLinkState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasOldLinkState
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNewLinkState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_newLinkState = a3;
}

- (void)setHasNewLinkState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNewLinkState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWifiProximity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_wifiProximity = a3;
}

- (void)setHasWifiProximity:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasWifiProximity
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setCcAssertion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_ccAssertion = a3;
}

- (void)setHasCcAssertion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCcAssertion
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setEnableCMAS:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_enableCMAS = a3;
}

- (void)setHasEnableCMAS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasEnableCMAS
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setEnableTelephony:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_enableTelephony = a3;
}

- (void)setHasEnableTelephony:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEnableTelephony
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setWifiRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_wifiRssi = a3;
}

- (void)setHasWifiRssi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasWifiRssi
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setBtRssi:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_btRssi = a3;
}

- (void)setHasBtRssi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBtRssi
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMModeState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mModeState = a3;
}

- (void)setHasMModeState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMModeState
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMModeStateDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_mModeStateDuration = a3;
}

- (void)setHasMModeStateDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasMModeStateDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPrevMModeState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_prevMModeState = a3;
}

- (void)setHasPrevMModeState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPrevMModeState
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasTriggerType
{
  return self->_triggerType != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWRMLinkStateChange;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWRMLinkStateChange description](&v3, sel_description), -[AWDWRMLinkStateChange dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *bundleID;
  __int16 has;
  NSString *triggerType;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_WORD *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_siriApp), CFSTR("siriApp"));
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x200) == 0)
        goto LABEL_8;
      goto LABEL_24;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isTriggeredByProximityChange), CFSTR("isTriggeredByProximityChange"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_oldLinkState), CFSTR("oldLinkState"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_newLinkState), CFSTR("newLinkState"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiProximity), CFSTR("wifiProximity"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccAssertion), CFSTR("ccAssertion"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enableCMAS), CFSTR("enableCMAS"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enableTelephony), CFSTR("enableTelephony"));
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_wifiRssi), CFSTR("wifiRssi"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_btRssi), CFSTR("btRssi"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_16:
    if ((has & 1) == 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mModeState), CFSTR("MModeState"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_17:
    if ((has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mModeStateDuration), CFSTR("MModeStateDuration"));
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_18:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_prevMModeState), CFSTR("prevMModeState"));
LABEL_19:
  triggerType = self->_triggerType;
  if (triggerType)
    objc_msgSend(v3, "setObject:forKey:", triggerType, CFSTR("triggerType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMLinkStateChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  if ((*(_WORD *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x200) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteSint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteSint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_16:
    if ((has & 1) == 0)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_17:
    if ((has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_18:
    PBDataWriterWriteUint32Field();
LABEL_19:
  if (self->_triggerType)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  __int16 has;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_WORD *)a3 + 48) |= 2u;
  }
  if (self->_bundleID)
    objc_msgSend(a3, "setBundleID:");
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    *((_DWORD *)a3 + 18) = self->_siriApp;
    *((_WORD *)a3 + 48) |= 0x800u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x200) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 13) = self->_isTriggeredByProximityChange;
  *((_WORD *)a3 + 48) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 16) = self->_oldLinkState;
  *((_WORD *)a3 + 48) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 15) = self->_newLinkState;
  *((_WORD *)a3 + 48) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 22) = self->_wifiProximity;
  *((_WORD *)a3 + 48) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 10) = self->_ccAssertion;
  *((_WORD *)a3 + 48) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 11) = self->_enableCMAS;
  *((_WORD *)a3 + 48) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 12) = self->_enableTelephony;
  *((_WORD *)a3 + 48) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 23) = self->_wifiRssi;
  *((_WORD *)a3 + 48) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 6) = self->_btRssi;
  *((_WORD *)a3 + 48) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_16:
    if ((has & 1) == 0)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 14) = self->_mModeState;
  *((_WORD *)a3 + 48) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_17:
    if ((has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_32:
  *((_QWORD *)a3 + 1) = self->_mModeStateDuration;
  *((_WORD *)a3 + 48) |= 1u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_18:
    *((_DWORD *)a3 + 17) = self->_prevMModeState;
    *((_WORD *)a3 + 48) |= 0x400u;
  }
LABEL_19:
  if (self->_triggerType)
    objc_msgSend(a3, "setTriggerType:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_WORD *)(v5 + 96) |= 2u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_siriApp;
    *(_WORD *)(v6 + 96) |= 0x800u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_20;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 52) = self->_isTriggeredByProximityChange;
  *(_WORD *)(v6 + 96) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v6 + 64) = self->_oldLinkState;
  *(_WORD *)(v6 + 96) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 60) = self->_newLinkState;
  *(_WORD *)(v6 + 96) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v6 + 88) = self->_wifiProximity;
  *(_WORD *)(v6 + 96) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v6 + 40) = self->_ccAssertion;
  *(_WORD *)(v6 + 96) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v6 + 44) = self->_enableCMAS;
  *(_WORD *)(v6 + 96) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v6 + 48) = self->_enableTelephony;
  *(_WORD *)(v6 + 96) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v6 + 92) = self->_wifiRssi;
  *(_WORD *)(v6 + 96) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v6 + 24) = self->_btRssi;
  *(_WORD *)(v6 + 96) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 1) == 0)
      goto LABEL_15;
LABEL_29:
    *(_QWORD *)(v6 + 8) = self->_mModeStateDuration;
    *(_WORD *)(v6 + 96) |= 1u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_28:
  *(_DWORD *)(v6 + 56) = self->_mModeState;
  *(_WORD *)(v6 + 96) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_29;
LABEL_15:
  if ((has & 0x400) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 68) = self->_prevMModeState;
    *(_WORD *)(v6 + 96) |= 0x400u;
  }
LABEL_17:

  *(_QWORD *)(v6 + 80) = -[NSString copyWithZone:](self->_triggerType, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *bundleID;
  __int16 v9;
  NSString *triggerType;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 48);
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_77;
    }
    else if ((v7 & 2) != 0)
    {
LABEL_77:
      LOBYTE(v5) = 0;
      return v5;
    }
    bundleID = self->_bundleID;
    if ((unint64_t)bundleID | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSString isEqual:](bundleID, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v9 = *((_WORD *)a3 + 48);
    if ((has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x800) == 0 || self->_siriApp != *((_DWORD *)a3 + 18))
        goto LABEL_77;
    }
    else if ((*((_WORD *)a3 + 48) & 0x800) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 0x40) != 0)
    {
      if ((v9 & 0x40) == 0 || self->_isTriggeredByProximityChange != *((_DWORD *)a3 + 13))
        goto LABEL_77;
    }
    else if ((v9 & 0x40) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x200) == 0 || self->_oldLinkState != *((_DWORD *)a3 + 16))
        goto LABEL_77;
    }
    else if ((*((_WORD *)a3 + 48) & 0x200) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x100) == 0 || self->_newLinkState != *((_DWORD *)a3 + 15))
        goto LABEL_77;
    }
    else if ((*((_WORD *)a3 + 48) & 0x100) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x1000) == 0 || self->_wifiProximity != *((_DWORD *)a3 + 22))
        goto LABEL_77;
    }
    else if ((*((_WORD *)a3 + 48) & 0x1000) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_ccAssertion != *((_DWORD *)a3 + 10))
        goto LABEL_77;
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 0x10) != 0)
    {
      if ((v9 & 0x10) == 0 || self->_enableCMAS != *((_DWORD *)a3 + 11))
        goto LABEL_77;
    }
    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 0x20) != 0)
    {
      if ((v9 & 0x20) == 0 || self->_enableTelephony != *((_DWORD *)a3 + 12))
        goto LABEL_77;
    }
    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x2000) == 0 || self->_wifiRssi != *((_DWORD *)a3 + 23))
        goto LABEL_77;
    }
    else if ((*((_WORD *)a3 + 48) & 0x2000) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 4) != 0)
    {
      if ((v9 & 4) == 0 || self->_btRssi != *((_DWORD *)a3 + 6))
        goto LABEL_77;
    }
    else if ((v9 & 4) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_mModeState != *((_DWORD *)a3 + 14))
        goto LABEL_77;
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 1) != 0)
    {
      if ((v9 & 1) == 0 || self->_mModeStateDuration != *((_QWORD *)a3 + 1))
        goto LABEL_77;
    }
    else if ((v9 & 1) != 0)
    {
      goto LABEL_77;
    }
    if ((has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x400) == 0 || self->_prevMModeState != *((_DWORD *)a3 + 17))
        goto LABEL_77;
    }
    else if ((*((_WORD *)a3 + 48) & 0x400) != 0)
    {
      goto LABEL_77;
    }
    triggerType = self->_triggerType;
    if ((unint64_t)triggerType | *((_QWORD *)a3 + 10))
      LOBYTE(v5) = -[NSString isEqual:](triggerType, "isEqual:");
    else
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
  unint64_t v17;
  uint64_t v18;

  if ((*(_WORD *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_bundleID, "hash");
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    v6 = 2654435761 * self->_siriApp;
    if ((has & 0x40) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_isTriggeredByProximityChange;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_7;
      goto LABEL_20;
    }
  }
  else
  {
    v6 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_oldLinkState;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_newLinkState;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_wifiProximity;
    if ((has & 8) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
  if ((has & 8) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_ccAssertion;
    if ((has & 0x10) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v11 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_enableCMAS;
    if ((has & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v12 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_enableTelephony;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_wifiRssi;
    if ((has & 4) != 0)
      goto LABEL_14;
    goto LABEL_27;
  }
LABEL_26:
  v14 = 0;
  if ((has & 4) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_btRssi;
    if ((has & 0x80) != 0)
      goto LABEL_15;
    goto LABEL_28;
  }
LABEL_27:
  v15 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_mModeState;
    if ((has & 1) != 0)
      goto LABEL_16;
LABEL_29:
    v17 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_17;
LABEL_30:
    v18 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ -[NSString hash](self->_triggerType, "hash");
  }
LABEL_28:
  v16 = 0;
  if ((has & 1) == 0)
    goto LABEL_29;
LABEL_16:
  v17 = 2654435761u * self->_mModeStateDuration;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_30;
LABEL_17:
  v18 = 2654435761 * self->_prevMModeState;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ -[NSString hash](self->_triggerType, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;

  if ((*((_WORD *)a3 + 48) & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDWRMLinkStateChange setBundleID:](self, "setBundleID:");
  v5 = *((_WORD *)a3 + 48);
  if ((v5 & 0x800) != 0)
  {
    self->_siriApp = *((_DWORD *)a3 + 18);
    *(_WORD *)&self->_has |= 0x800u;
    v5 = *((_WORD *)a3 + 48);
    if ((v5 & 0x40) == 0)
    {
LABEL_7:
      if ((v5 & 0x200) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_7;
  }
  self->_isTriggeredByProximityChange = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 48);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  self->_oldLinkState = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)a3 + 48);
  if ((v5 & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  self->_newLinkState = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 48);
  if ((v5 & 0x1000) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  self->_wifiProximity = *((_DWORD *)a3 + 22);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)a3 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  self->_ccAssertion = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  self->_enableCMAS = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  self->_enableTelephony = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 48);
  if ((v5 & 0x2000) == 0)
  {
LABEL_14:
    if ((v5 & 4) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  self->_wifiRssi = *((_DWORD *)a3 + 23);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)a3 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_15:
    if ((v5 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  self->_btRssi = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 48);
  if ((v5 & 0x80) == 0)
  {
LABEL_16:
    if ((v5 & 1) == 0)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  self->_mModeState = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_17:
    if ((v5 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_32:
  self->_mModeStateDuration = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)a3 + 48) & 0x400) != 0)
  {
LABEL_18:
    self->_prevMModeState = *((_DWORD *)a3 + 17);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_19:
  if (*((_QWORD *)a3 + 10))
    -[AWDWRMLinkStateChange setTriggerType:](self, "setTriggerType:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)siriApp
{
  return self->_siriApp;
}

- (unsigned)isTriggeredByProximityChange
{
  return self->_isTriggeredByProximityChange;
}

- (unsigned)oldLinkState
{
  return self->_oldLinkState;
}

- (unsigned)newLinkState
{
  return self->_newLinkState;
}

- (unsigned)wifiProximity
{
  return self->_wifiProximity;
}

- (unsigned)ccAssertion
{
  return self->_ccAssertion;
}

- (unsigned)enableCMAS
{
  return self->_enableCMAS;
}

- (unsigned)enableTelephony
{
  return self->_enableTelephony;
}

- (int)wifiRssi
{
  return self->_wifiRssi;
}

- (int)btRssi
{
  return self->_btRssi;
}

- (unsigned)mModeState
{
  return self->_mModeState;
}

- (unint64_t)mModeStateDuration
{
  return self->_mModeStateDuration;
}

- (unsigned)prevMModeState
{
  return self->_prevMModeState;
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
