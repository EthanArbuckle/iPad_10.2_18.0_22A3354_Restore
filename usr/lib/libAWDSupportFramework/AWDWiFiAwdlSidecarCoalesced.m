@implementation AWDWiFiAwdlSidecarCoalesced

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiAwdlSidecarCoalesced setSelfSidecarBssSteering:](self, "setSelfSidecarBssSteering:", 0);
  -[AWDWiFiAwdlSidecarCoalesced setRemoteSidecarBssSteering:](self, "setRemoteSidecarBssSteering:", 0);
  -[AWDWiFiAwdlSidecarCoalesced setSelfSidecarPeerTraffic:](self, "setSelfSidecarPeerTraffic:", 0);
  -[AWDWiFiAwdlSidecarCoalesced setRemoteSidecarPeerTraffic:](self, "setRemoteSidecarPeerTraffic:", 0);
  -[AWDWiFiAwdlSidecarCoalesced setSessionUUID:](self, "setSessionUUID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiAwdlSidecarCoalesced;
  -[AWDWiFiAwdlSidecarCoalesced dealloc](&v3, sel_dealloc);
}

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

- (void)setSelfFgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_selfFgDuration = a3;
}

- (void)setHasSelfFgDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSelfFgDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSelfBgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_selfBgDuration = a3;
}

- (void)setHasSelfBgDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSelfBgDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSelfBgEntryCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_selfBgEntryCount = a3;
}

- (void)setHasSelfBgEntryCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSelfBgEntryCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSelfPeerRssi24G:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_selfPeerRssi24G = a3;
}

- (void)setHasSelfPeerRssi24G:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSelfPeerRssi24G
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSelfPeerRssi5G:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_selfPeerRssi5G = a3;
}

- (void)setHasSelfPeerRssi5G:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSelfPeerRssi5G
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSelfIsSDB:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_selfIsSDB = a3;
}

- (void)setHasSelfIsSDB:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasSelfIsSDB
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setRemoteFgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_remoteFgDuration = a3;
}

- (void)setHasRemoteFgDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRemoteFgDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRemoteBgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_remoteBgDuration = a3;
}

- (void)setHasRemoteBgDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRemoteBgDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRemoteBgEntryCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_remoteBgEntryCount = a3;
}

- (void)setHasRemoteBgEntryCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRemoteBgEntryCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRemotePeerRssi24G:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_remotePeerRssi24G = a3;
}

- (void)setHasRemotePeerRssi24G:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRemotePeerRssi24G
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRemotePeerRssi5G:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_remotePeerRssi5G = a3;
}

- (void)setHasRemotePeerRssi5G:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRemotePeerRssi5G
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRemotefIsSDB:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_remotefIsSDB = a3;
}

- (void)setHasRemotefIsSDB:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasRemotefIsSDB
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasSelfSidecarBssSteering
{
  return self->_selfSidecarBssSteering != 0;
}

- (BOOL)hasRemoteSidecarBssSteering
{
  return self->_remoteSidecarBssSteering != 0;
}

- (BOOL)hasSelfSidecarPeerTraffic
{
  return self->_selfSidecarPeerTraffic != 0;
}

- (BOOL)hasRemoteSidecarPeerTraffic
{
  return self->_remoteSidecarPeerTraffic != 0;
}

- (void)setPencilOnCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_pencilOnCount = a3;
}

- (void)setHasPencilOnCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPencilOnCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPencilOffCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_pencilOffCount = a3;
}

- (void)setHasPencilOffCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPencilOffCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiAwdlSidecarCoalesced;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiAwdlSidecarCoalesced description](&v3, sel_description), -[AWDWiFiAwdlSidecarCoalesced dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  AWDSidecarBssSteering *selfSidecarBssSteering;
  AWDSidecarBssSteering *remoteSidecarBssSteering;
  AWDSidecarPeerTraffic *selfSidecarPeerTraffic;
  AWDSidecarPeerTraffic *remoteSidecarPeerTraffic;
  __int16 v9;
  NSString *sessionUUID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_selfFgDuration), CFSTR("selfFgDuration"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_selfBgDuration), CFSTR("selfBgDuration"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_selfBgEntryCount), CFSTR("selfBgEntryCount"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_selfPeerRssi24G), CFSTR("selfPeerRssi24G"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_selfPeerRssi5G), CFSTR("selfPeerRssi5G"));
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_selfIsSDB), CFSTR("selfIsSDB"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_remoteFgDuration), CFSTR("remoteFgDuration"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_remoteBgDuration), CFSTR("remoteBgDuration"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_remoteBgEntryCount), CFSTR("remoteBgEntryCount"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_remotePeerRssi24G), CFSTR("remotePeerRssi24G"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_remotePeerRssi5G), CFSTR("remotePeerRssi5G"));
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
LABEL_14:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_remotefIsSDB), CFSTR("remotefIsSDB"));
LABEL_15:
  selfSidecarBssSteering = self->_selfSidecarBssSteering;
  if (selfSidecarBssSteering)
    objc_msgSend(v3, "setObject:forKey:", -[AWDSidecarBssSteering dictionaryRepresentation](selfSidecarBssSteering, "dictionaryRepresentation"), CFSTR("selfSidecarBssSteering"));
  remoteSidecarBssSteering = self->_remoteSidecarBssSteering;
  if (remoteSidecarBssSteering)
    objc_msgSend(v3, "setObject:forKey:", -[AWDSidecarBssSteering dictionaryRepresentation](remoteSidecarBssSteering, "dictionaryRepresentation"), CFSTR("remoteSidecarBssSteering"));
  selfSidecarPeerTraffic = self->_selfSidecarPeerTraffic;
  if (selfSidecarPeerTraffic)
    objc_msgSend(v3, "setObject:forKey:", -[AWDSidecarPeerTraffic dictionaryRepresentation](selfSidecarPeerTraffic, "dictionaryRepresentation"), CFSTR("selfSidecarPeerTraffic"));
  remoteSidecarPeerTraffic = self->_remoteSidecarPeerTraffic;
  if (remoteSidecarPeerTraffic)
    objc_msgSend(v3, "setObject:forKey:", -[AWDSidecarPeerTraffic dictionaryRepresentation](remoteSidecarPeerTraffic, "dictionaryRepresentation"), CFSTR("remoteSidecarPeerTraffic"));
  v9 = (__int16)self->_has;
  if ((v9 & 0x40) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_pencilOnCount), CFSTR("pencilOnCount"));
    v9 = (__int16)self->_has;
  }
  if ((v9 & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_pencilOffCount), CFSTR("pencilOffCount"));
  sessionUUID = self->_sessionUUID;
  if (sessionUUID)
    objc_msgSend(v3, "setObject:forKey:", sessionUUID, CFSTR("sessionUUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiAwdlSidecarCoalescedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
LABEL_14:
    PBDataWriterWriteBOOLField();
LABEL_15:
  if (self->_selfSidecarBssSteering)
    PBDataWriterWriteSubmessage();
  if (self->_remoteSidecarBssSteering)
    PBDataWriterWriteSubmessage();
  if (self->_selfSidecarPeerTraffic)
    PBDataWriterWriteSubmessage();
  if (self->_remoteSidecarPeerTraffic)
    PBDataWriterWriteSubmessage();
  v5 = (__int16)self->_has;
  if ((v5 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (__int16)self->_has;
  }
  if ((v5 & 0x20) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_sessionUUID)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v6;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 5) = self->_timestamp;
    *((_WORD *)a3 + 66) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 4) = self->_selfFgDuration;
  *((_WORD *)a3 + 66) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)a3 + 3) = self->_selfBgDuration;
  *((_WORD *)a3 + 66) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 22) = self->_selfBgEntryCount;
  *((_WORD *)a3 + 66) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 23) = self->_selfPeerRssi24G;
  *((_WORD *)a3 + 66) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 24) = self->_selfPeerRssi5G;
  *((_WORD *)a3 + 66) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  *((_BYTE *)a3 + 129) = self->_selfIsSDB;
  *((_WORD *)a3 + 66) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)a3 + 2) = self->_remoteFgDuration;
  *((_WORD *)a3 + 66) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)a3 + 1) = self->_remoteBgDuration;
  *((_WORD *)a3 + 66) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 14) = self->_remoteBgEntryCount;
  *((_WORD *)a3 + 66) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 15) = self->_remotePeerRssi24G;
  *((_WORD *)a3 + 66) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_40:
  *((_DWORD *)a3 + 16) = self->_remotePeerRssi5G;
  *((_WORD *)a3 + 66) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_14:
    *((_BYTE *)a3 + 128) = self->_remotefIsSDB;
    *((_WORD *)a3 + 66) |= 0x2000u;
  }
LABEL_15:
  if (self->_selfSidecarBssSteering)
    objc_msgSend(a3, "setSelfSidecarBssSteering:");
  if (self->_remoteSidecarBssSteering)
    objc_msgSend(a3, "setRemoteSidecarBssSteering:");
  if (self->_selfSidecarPeerTraffic)
    objc_msgSend(a3, "setSelfSidecarPeerTraffic:");
  if (self->_remoteSidecarPeerTraffic)
    objc_msgSend(a3, "setRemoteSidecarPeerTraffic:");
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 13) = self->_pencilOnCount;
    *((_WORD *)a3 + 66) |= 0x40u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_pencilOffCount;
    *((_WORD *)a3 + 66) |= 0x20u;
  }
  if (self->_sessionUUID)
    objc_msgSend(a3, "setSessionUUID:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  __int16 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_timestamp;
    *(_WORD *)(v5 + 132) |= 0x10u;
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
  *(_QWORD *)(v5 + 32) = self->_selfFgDuration;
  *(_WORD *)(v5 + 132) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *(_QWORD *)(v5 + 24) = self->_selfBgDuration;
  *(_WORD *)(v5 + 132) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 88) = self->_selfBgEntryCount;
  *(_WORD *)(v5 + 132) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 92) = self->_selfPeerRssi24G;
  *(_WORD *)(v5 + 132) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 96) = self->_selfPeerRssi5G;
  *(_WORD *)(v5 + 132) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(_BYTE *)(v5 + 129) = self->_selfIsSDB;
  *(_WORD *)(v5 + 132) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *(_QWORD *)(v5 + 16) = self->_remoteFgDuration;
  *(_WORD *)(v5 + 132) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *(_QWORD *)(v5 + 8) = self->_remoteBgDuration;
  *(_WORD *)(v5 + 132) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 56) = self->_remoteBgEntryCount;
  *(_WORD *)(v5 + 132) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 60) = self->_remotePeerRssi24G;
  *(_WORD *)(v5 + 132) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_31:
  *(_DWORD *)(v5 + 64) = self->_remotePeerRssi5G;
  *(_WORD *)(v5 + 132) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_14:
    *(_BYTE *)(v5 + 128) = self->_remotefIsSDB;
    *(_WORD *)(v5 + 132) |= 0x2000u;
  }
LABEL_15:

  *(_QWORD *)(v6 + 104) = -[AWDSidecarBssSteering copyWithZone:](self->_selfSidecarBssSteering, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 72) = -[AWDSidecarBssSteering copyWithZone:](self->_remoteSidecarBssSteering, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 112) = -[AWDSidecarPeerTraffic copyWithZone:](self->_selfSidecarPeerTraffic, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 80) = -[AWDSidecarPeerTraffic copyWithZone:](self->_remoteSidecarPeerTraffic, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_pencilOnCount;
    *(_WORD *)(v6 + 132) |= 0x40u;
    v8 = (__int16)self->_has;
  }
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_pencilOffCount;
    *(_WORD *)(v6 + 132) |= 0x20u;
  }

  *(_QWORD *)(v6 + 120) = -[NSString copyWithZone:](self->_sessionUUID, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  AWDSidecarBssSteering *selfSidecarBssSteering;
  AWDSidecarBssSteering *remoteSidecarBssSteering;
  AWDSidecarPeerTraffic *selfSidecarPeerTraffic;
  AWDSidecarPeerTraffic *remoteSidecarPeerTraffic;
  __int16 v12;
  __int16 v13;
  NSString *sessionUUID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 66);
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_timestamp != *((_QWORD *)a3 + 5))
        goto LABEL_69;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_selfFgDuration != *((_QWORD *)a3 + 4))
        goto LABEL_69;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_selfBgDuration != *((_QWORD *)a3 + 3))
        goto LABEL_69;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 66) & 0x400) == 0 || self->_selfBgEntryCount != *((_DWORD *)a3 + 22))
        goto LABEL_69;
    }
    else if ((*((_WORD *)a3 + 66) & 0x400) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 66) & 0x800) == 0 || self->_selfPeerRssi24G != *((_DWORD *)a3 + 23))
        goto LABEL_69;
    }
    else if ((*((_WORD *)a3 + 66) & 0x800) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 66) & 0x1000) == 0 || self->_selfPeerRssi5G != *((_DWORD *)a3 + 24))
        goto LABEL_69;
    }
    else if ((*((_WORD *)a3 + 66) & 0x1000) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
    {
      if ((*((_WORD *)a3 + 66) & 0x4000) == 0)
        goto LABEL_69;
      if (self->_selfIsSDB)
      {
        if (!*((_BYTE *)a3 + 129))
          goto LABEL_69;
      }
      else if (*((_BYTE *)a3 + 129))
      {
        goto LABEL_69;
      }
    }
    else if ((*((_WORD *)a3 + 66) & 0x4000) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_remoteFgDuration != *((_QWORD *)a3 + 2))
        goto LABEL_69;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_remoteBgDuration != *((_QWORD *)a3 + 1))
        goto LABEL_69;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_remoteBgEntryCount != *((_DWORD *)a3 + 14))
        goto LABEL_69;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 66) & 0x100) == 0 || self->_remotePeerRssi24G != *((_DWORD *)a3 + 15))
        goto LABEL_69;
    }
    else if ((*((_WORD *)a3 + 66) & 0x100) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 66) & 0x200) == 0 || self->_remotePeerRssi5G != *((_DWORD *)a3 + 16))
        goto LABEL_69;
    }
    else if ((*((_WORD *)a3 + 66) & 0x200) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 66) & 0x2000) == 0)
        goto LABEL_69;
      if (self->_remotefIsSDB)
      {
        if (!*((_BYTE *)a3 + 128))
          goto LABEL_69;
      }
      else if (*((_BYTE *)a3 + 128))
      {
        goto LABEL_69;
      }
    }
    else if ((*((_WORD *)a3 + 66) & 0x2000) != 0)
    {
      goto LABEL_69;
    }
    selfSidecarBssSteering = self->_selfSidecarBssSteering;
    if (!((unint64_t)selfSidecarBssSteering | *((_QWORD *)a3 + 13))
      || (v5 = -[AWDSidecarBssSteering isEqual:](selfSidecarBssSteering, "isEqual:")) != 0)
    {
      remoteSidecarBssSteering = self->_remoteSidecarBssSteering;
      if (!((unint64_t)remoteSidecarBssSteering | *((_QWORD *)a3 + 9))
        || (v5 = -[AWDSidecarBssSteering isEqual:](remoteSidecarBssSteering, "isEqual:")) != 0)
      {
        selfSidecarPeerTraffic = self->_selfSidecarPeerTraffic;
        if (!((unint64_t)selfSidecarPeerTraffic | *((_QWORD *)a3 + 14))
          || (v5 = -[AWDSidecarPeerTraffic isEqual:](selfSidecarPeerTraffic, "isEqual:")) != 0)
        {
          remoteSidecarPeerTraffic = self->_remoteSidecarPeerTraffic;
          if (!((unint64_t)remoteSidecarPeerTraffic | *((_QWORD *)a3 + 10))
            || (v5 = -[AWDSidecarPeerTraffic isEqual:](remoteSidecarPeerTraffic, "isEqual:")) != 0)
          {
            v12 = (__int16)self->_has;
            v13 = *((_WORD *)a3 + 66);
            if ((v12 & 0x40) != 0)
            {
              if ((v13 & 0x40) == 0 || self->_pencilOnCount != *((_DWORD *)a3 + 13))
                goto LABEL_69;
            }
            else if ((v13 & 0x40) != 0)
            {
              goto LABEL_69;
            }
            if ((v12 & 0x20) != 0)
            {
              if ((v13 & 0x20) == 0 || self->_pencilOffCount != *((_DWORD *)a3 + 12))
                goto LABEL_69;
              goto LABEL_93;
            }
            if ((v13 & 0x20) == 0)
            {
LABEL_93:
              sessionUUID = self->_sessionUUID;
              if ((unint64_t)sessionUUID | *((_QWORD *)a3 + 15))
                LOBYTE(v5) = -[NSString isEqual:](sessionUUID, "isEqual:");
              else
                LOBYTE(v5) = 1;
              return v5;
            }
LABEL_69:
            LOBYTE(v5) = 0;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v24 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
    {
LABEL_3:
      v23 = 2654435761u * self->_selfFgDuration;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else
  {
    v24 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v23 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v22 = 2654435761u * self->_selfBgDuration;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v22 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    v21 = 2654435761 * self->_selfBgEntryCount;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v21 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    v20 = 2654435761 * self->_selfPeerRssi24G;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v20 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_7:
    v19 = 2654435761 * self->_selfPeerRssi5G;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v19 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_8:
    v18 = 2654435761 * self->_selfIsSDB;
    if ((has & 2) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v18 = 0;
  if ((has & 2) != 0)
  {
LABEL_9:
    v17 = 2654435761u * self->_remoteFgDuration;
    if ((has & 1) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v17 = 0;
  if ((has & 1) != 0)
  {
LABEL_10:
    v4 = 2654435761u * self->_remoteBgDuration;
    if ((has & 0x80) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    v5 = 2654435761 * self->_remoteBgEntryCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    v6 = 2654435761 * self->_remotePeerRssi24G;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_13;
LABEL_26:
    v7 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_14;
    goto LABEL_27;
  }
LABEL_25:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_26;
LABEL_13:
  v7 = 2654435761 * self->_remotePeerRssi5G;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_14:
    v8 = 2654435761 * self->_remotefIsSDB;
    goto LABEL_28;
  }
LABEL_27:
  v8 = 0;
LABEL_28:
  v9 = -[AWDSidecarBssSteering hash](self->_selfSidecarBssSteering, "hash");
  v10 = -[AWDSidecarBssSteering hash](self->_remoteSidecarBssSteering, "hash");
  v11 = -[AWDSidecarPeerTraffic hash](self->_selfSidecarPeerTraffic, "hash");
  v12 = -[AWDSidecarPeerTraffic hash](self->_remoteSidecarPeerTraffic, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 0x40) != 0)
  {
    v14 = 2654435761 * self->_pencilOnCount;
    if ((v13 & 0x20) != 0)
      goto LABEL_30;
LABEL_32:
    v15 = 0;
    return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ -[NSString hash](self->_sessionUUID, "hash");
  }
  v14 = 0;
  if ((v13 & 0x20) == 0)
    goto LABEL_32;
LABEL_30:
  v15 = 2654435761 * self->_pencilOffCount;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ -[NSString hash](self->_sessionUUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  AWDSidecarBssSteering *selfSidecarBssSteering;
  uint64_t v7;
  AWDSidecarBssSteering *remoteSidecarBssSteering;
  uint64_t v9;
  AWDSidecarPeerTraffic *selfSidecarPeerTraffic;
  uint64_t v11;
  AWDSidecarPeerTraffic *remoteSidecarPeerTraffic;
  uint64_t v13;
  __int16 v14;

  v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)a3 + 66);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_selfFgDuration = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 66);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  self->_selfBgDuration = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  self->_selfBgEntryCount = *((_DWORD *)a3 + 22);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x800) == 0)
  {
LABEL_6:
    if ((v5 & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  self->_selfPeerRssi24G = *((_DWORD *)a3 + 23);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x1000) == 0)
  {
LABEL_7:
    if ((v5 & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  self->_selfPeerRssi5G = *((_DWORD *)a3 + 24);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x4000) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  self->_selfIsSDB = *((_BYTE *)a3 + 129);
  *(_WORD *)&self->_has |= 0x4000u;
  v5 = *((_WORD *)a3 + 66);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  self->_remoteFgDuration = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 66);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  self->_remoteBgDuration = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  self->_remoteBgEntryCount = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  self->_remotePeerRssi24G = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_29:
  self->_remotePeerRssi5G = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 66) & 0x2000) != 0)
  {
LABEL_14:
    self->_remotefIsSDB = *((_BYTE *)a3 + 128);
    *(_WORD *)&self->_has |= 0x2000u;
  }
LABEL_15:
  selfSidecarBssSteering = self->_selfSidecarBssSteering;
  v7 = *((_QWORD *)a3 + 13);
  if (selfSidecarBssSteering)
  {
    if (v7)
      -[AWDSidecarBssSteering mergeFrom:](selfSidecarBssSteering, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDWiFiAwdlSidecarCoalesced setSelfSidecarBssSteering:](self, "setSelfSidecarBssSteering:");
  }
  remoteSidecarBssSteering = self->_remoteSidecarBssSteering;
  v9 = *((_QWORD *)a3 + 9);
  if (remoteSidecarBssSteering)
  {
    if (v9)
      -[AWDSidecarBssSteering mergeFrom:](remoteSidecarBssSteering, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDWiFiAwdlSidecarCoalesced setRemoteSidecarBssSteering:](self, "setRemoteSidecarBssSteering:");
  }
  selfSidecarPeerTraffic = self->_selfSidecarPeerTraffic;
  v11 = *((_QWORD *)a3 + 14);
  if (selfSidecarPeerTraffic)
  {
    if (v11)
      -[AWDSidecarPeerTraffic mergeFrom:](selfSidecarPeerTraffic, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDWiFiAwdlSidecarCoalesced setSelfSidecarPeerTraffic:](self, "setSelfSidecarPeerTraffic:");
  }
  remoteSidecarPeerTraffic = self->_remoteSidecarPeerTraffic;
  v13 = *((_QWORD *)a3 + 10);
  if (remoteSidecarPeerTraffic)
  {
    if (v13)
      -[AWDSidecarPeerTraffic mergeFrom:](remoteSidecarPeerTraffic, "mergeFrom:");
  }
  else if (v13)
  {
    -[AWDWiFiAwdlSidecarCoalesced setRemoteSidecarPeerTraffic:](self, "setRemoteSidecarPeerTraffic:");
  }
  v14 = *((_WORD *)a3 + 66);
  if ((v14 & 0x40) != 0)
  {
    self->_pencilOnCount = *((_DWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x40u;
    v14 = *((_WORD *)a3 + 66);
  }
  if ((v14 & 0x20) != 0)
  {
    self->_pencilOffCount = *((_DWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)a3 + 15))
    -[AWDWiFiAwdlSidecarCoalesced setSessionUUID:](self, "setSessionUUID:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)selfFgDuration
{
  return self->_selfFgDuration;
}

- (unint64_t)selfBgDuration
{
  return self->_selfBgDuration;
}

- (unsigned)selfBgEntryCount
{
  return self->_selfBgEntryCount;
}

- (int)selfPeerRssi24G
{
  return self->_selfPeerRssi24G;
}

- (int)selfPeerRssi5G
{
  return self->_selfPeerRssi5G;
}

- (BOOL)selfIsSDB
{
  return self->_selfIsSDB;
}

- (unint64_t)remoteFgDuration
{
  return self->_remoteFgDuration;
}

- (unint64_t)remoteBgDuration
{
  return self->_remoteBgDuration;
}

- (unsigned)remoteBgEntryCount
{
  return self->_remoteBgEntryCount;
}

- (int)remotePeerRssi24G
{
  return self->_remotePeerRssi24G;
}

- (int)remotePeerRssi5G
{
  return self->_remotePeerRssi5G;
}

- (BOOL)remotefIsSDB
{
  return self->_remotefIsSDB;
}

- (AWDSidecarBssSteering)selfSidecarBssSteering
{
  return self->_selfSidecarBssSteering;
}

- (void)setSelfSidecarBssSteering:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (AWDSidecarBssSteering)remoteSidecarBssSteering
{
  return self->_remoteSidecarBssSteering;
}

- (void)setRemoteSidecarBssSteering:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (AWDSidecarPeerTraffic)selfSidecarPeerTraffic
{
  return self->_selfSidecarPeerTraffic;
}

- (void)setSelfSidecarPeerTraffic:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (AWDSidecarPeerTraffic)remoteSidecarPeerTraffic
{
  return self->_remoteSidecarPeerTraffic;
}

- (void)setRemoteSidecarPeerTraffic:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (unsigned)pencilOnCount
{
  return self->_pencilOnCount;
}

- (unsigned)pencilOffCount
{
  return self->_pencilOffCount;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
