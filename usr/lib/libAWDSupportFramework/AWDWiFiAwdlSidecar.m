@implementation AWDWiFiAwdlSidecar

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiAwdlSidecar setSidecarBssSteering:](self, "setSidecarBssSteering:", 0);
  -[AWDWiFiAwdlSidecar setSidecarPeerTraffic:](self, "setSidecarPeerTraffic:", 0);
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiAwdlSidecar;
  -[AWDWiFiAwdlSidecar dealloc](&v3, sel_dealloc);
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

- (void)setFgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_fgDuration = a3;
}

- (void)setHasFgDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasFgDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bgDuration = a3;
}

- (void)setHasBgDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBgDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setBgEntryCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_bgEntryCount = a3;
}

- (void)setHasBgEntryCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBgEntryCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPeerRssi24G:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_peerRssi24G = a3;
}

- (void)setHasPeerRssi24G:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPeerRssi24G
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPeerRssi5G:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_peerRssi5G = a3;
}

- (void)setHasPeerRssi5G:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPeerRssi5G
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsSDB:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isSDB = a3;
}

- (void)setHasIsSDB:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsSDB
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasSidecarBssSteering
{
  return self->_sidecarBssSteering != 0;
}

- (BOOL)hasSidecarPeerTraffic
{
  return self->_sidecarPeerTraffic != 0;
}

- (void)setDfspState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dfspState = a3;
}

- (void)setHasDfspState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDfspState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setInfraDisconnectedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_infraDisconnectedCount = a3;
}

- (void)setHasInfraDisconnectedCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasInfraDisconnectedCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (unint64_t)channelSequencesCount
{
  return self->_channelSequences.count;
}

- (unsigned)channelSequences
{
  return self->_channelSequences.list;
}

- (void)clearChannelSequences
{
  PBRepeatedUInt32Clear();
}

- (void)addChannelSequence:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)channelSequenceAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_channelSequences;
  unint64_t count;

  p_channelSequences = &self->_channelSequences;
  count = self->_channelSequences.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_channelSequences->list[a3];
}

- (void)setChannelSequences:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiAwdlSidecar;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiAwdlSidecar description](&v3, sel_description), -[AWDWiFiAwdlSidecar dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  AWDSidecarBssSteering *sidecarBssSteering;
  AWDSidecarPeerTraffic *sidecarPeerTraffic;
  __int16 v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_fgDuration), CFSTR("fgDuration"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bgDuration), CFSTR("bgDuration"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bgEntryCount), CFSTR("bgEntryCount"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_peerRssi24G), CFSTR("peerRssi24G"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_peerRssi5G), CFSTR("peerRssi5G"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_8:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSDB), CFSTR("isSDB"));
LABEL_9:
  sidecarBssSteering = self->_sidecarBssSteering;
  if (sidecarBssSteering)
    objc_msgSend(v3, "setObject:forKey:", -[AWDSidecarBssSteering dictionaryRepresentation](sidecarBssSteering, "dictionaryRepresentation"), CFSTR("sidecarBssSteering"));
  sidecarPeerTraffic = self->_sidecarPeerTraffic;
  if (sidecarPeerTraffic)
    objc_msgSend(v3, "setObject:forKey:", -[AWDSidecarPeerTraffic dictionaryRepresentation](sidecarPeerTraffic, "dictionaryRepresentation"), CFSTR("sidecarPeerTraffic"));
  v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dfspState), CFSTR("dfspState"));
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_infraDisconnectedCount), CFSTR("infraDisconnectedCount"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("channelSequence"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiAwdlSidecarReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_channelSequences;
  unint64_t v7;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  if (self->_sidecarBssSteering)
    PBDataWriterWriteSubmessage();
  if (self->_sidecarPeerTraffic)
    PBDataWriterWriteSubmessage();
  v5 = (__int16)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (__int16)self->_has;
  }
  if ((v5 & 0x20) != 0)
    PBDataWriterWriteUint32Field();
  p_channelSequences = &self->_channelSequences;
  if (p_channelSequences->count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < p_channelSequences->count);
  }
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 6) = self->_timestamp;
    *((_WORD *)a3 + 50) |= 4u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 5) = self->_fgDuration;
  *((_WORD *)a3 + 50) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)a3 + 4) = self->_bgDuration;
  *((_WORD *)a3 + 50) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 14) = self->_bgEntryCount;
  *((_WORD *)a3 + 50) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 17) = self->_peerRssi24G;
  *((_WORD *)a3 + 50) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_27:
  *((_DWORD *)a3 + 18) = self->_peerRssi5G;
  *((_WORD *)a3 + 50) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    *((_BYTE *)a3 + 96) = self->_isSDB;
    *((_WORD *)a3 + 50) |= 0x100u;
  }
LABEL_9:
  if (self->_sidecarBssSteering)
    objc_msgSend(a3, "setSidecarBssSteering:");
  if (self->_sidecarPeerTraffic)
    objc_msgSend(a3, "setSidecarPeerTraffic:");
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 15) = self->_dfspState;
    *((_WORD *)a3 + 50) |= 0x10u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_infraDisconnectedCount;
    *((_WORD *)a3 + 50) |= 0x20u;
  }
  if (-[AWDWiFiAwdlSidecar channelSequencesCount](self, "channelSequencesCount"))
  {
    objc_msgSend(a3, "clearChannelSequences");
    v7 = -[AWDWiFiAwdlSidecar channelSequencesCount](self, "channelSequencesCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(a3, "addChannelSequence:", -[AWDWiFiAwdlSidecar channelSequenceAtIndex:](self, "channelSequenceAtIndex:", i));
    }
  }
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
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_timestamp;
    *(_WORD *)(v5 + 100) |= 4u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 40) = self->_fgDuration;
  *(_WORD *)(v5 + 100) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *(_QWORD *)(v5 + 32) = self->_bgDuration;
  *(_WORD *)(v5 + 100) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 56) = self->_bgEntryCount;
  *(_WORD *)(v5 + 100) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 68) = self->_peerRssi24G;
  *(_WORD *)(v5 + 100) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_19:
  *(_DWORD *)(v5 + 72) = self->_peerRssi5G;
  *(_WORD *)(v5 + 100) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 96) = self->_isSDB;
    *(_WORD *)(v5 + 100) |= 0x100u;
  }
LABEL_9:

  *(_QWORD *)(v6 + 80) = -[AWDSidecarBssSteering copyWithZone:](self->_sidecarBssSteering, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 88) = -[AWDSidecarPeerTraffic copyWithZone:](self->_sidecarPeerTraffic, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_dfspState;
    *(_WORD *)(v6 + 100) |= 0x10u;
    v8 = (__int16)self->_has;
  }
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_infraDisconnectedCount;
    *(_WORD *)(v6 + 100) |= 0x20u;
  }
  PBRepeatedUInt32Copy();
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  __int16 has;
  __int16 v6;
  AWDSidecarBssSteering *sidecarBssSteering;
  AWDSidecarPeerTraffic *sidecarPeerTraffic;
  __int16 v9;
  __int16 v10;

  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  has = (__int16)self->_has;
  v6 = *((_WORD *)a3 + 50);
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 6))
      return 0;
  }
  else if ((v6 & 4) != 0)
  {
    return 0;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_fgDuration != *((_QWORD *)a3 + 5))
      return 0;
  }
  else if ((v6 & 2) != 0)
  {
    return 0;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_bgDuration != *((_QWORD *)a3 + 4))
      return 0;
  }
  else if ((v6 & 1) != 0)
  {
    return 0;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_bgEntryCount != *((_DWORD *)a3 + 14))
      return 0;
  }
  else if ((v6 & 8) != 0)
  {
    return 0;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_peerRssi24G != *((_DWORD *)a3 + 17))
      return 0;
  }
  else if ((v6 & 0x40) != 0)
  {
    return 0;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_peerRssi5G != *((_DWORD *)a3 + 18))
      return 0;
  }
  else if ((v6 & 0x80) != 0)
  {
    return 0;
  }
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    if ((*((_WORD *)a3 + 50) & 0x100) != 0)
      return 0;
LABEL_40:
    sidecarBssSteering = self->_sidecarBssSteering;
    if ((unint64_t)sidecarBssSteering | *((_QWORD *)a3 + 10)
      && !-[AWDSidecarBssSteering isEqual:](sidecarBssSteering, "isEqual:"))
    {
      return 0;
    }
    sidecarPeerTraffic = self->_sidecarPeerTraffic;
    if ((unint64_t)sidecarPeerTraffic | *((_QWORD *)a3 + 11))
    {
      if (!-[AWDSidecarPeerTraffic isEqual:](sidecarPeerTraffic, "isEqual:"))
        return 0;
    }
    v9 = (__int16)self->_has;
    v10 = *((_WORD *)a3 + 50);
    if ((v9 & 0x10) != 0)
    {
      if ((v10 & 0x10) == 0 || self->_dfspState != *((_DWORD *)a3 + 15))
        return 0;
    }
    else if ((v10 & 0x10) != 0)
    {
      return 0;
    }
    if ((v9 & 0x20) != 0)
    {
      if ((v10 & 0x20) == 0 || self->_infraDisconnectedCount != *((_DWORD *)a3 + 16))
        return 0;
    }
    else if ((v10 & 0x20) != 0)
    {
      return 0;
    }
    return PBRepeatedUInt32IsEqual();
  }
  if ((*((_WORD *)a3 + 50) & 0x100) != 0)
  {
    if (self->_isSDB)
    {
      if (!*((_BYTE *)a3 + 96))
        return 0;
      goto LABEL_40;
    }
    if (!*((_BYTE *)a3 + 96))
      goto LABEL_40;
  }
  return 0;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v16 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_fgDuration;
      if ((has & 1) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v16 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 1) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_bgDuration;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_bgEntryCount;
    if ((has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_peerRssi24G;
    if ((has & 0x80) != 0)
      goto LABEL_7;
LABEL_14:
    v8 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v7 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_14;
LABEL_7:
  v8 = 2654435761 * self->_peerRssi5G;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_isSDB;
    goto LABEL_16;
  }
LABEL_15:
  v9 = 0;
LABEL_16:
  v10 = -[AWDSidecarBssSteering hash](self->_sidecarBssSteering, "hash");
  v11 = -[AWDSidecarPeerTraffic hash](self->_sidecarPeerTraffic, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 0x10) != 0)
  {
    v13 = 2654435761 * self->_dfspState;
    if ((v12 & 0x20) != 0)
      goto LABEL_18;
LABEL_20:
    v14 = 0;
    return v4 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ PBRepeatedUInt32Hash();
  }
  v13 = 0;
  if ((v12 & 0x20) == 0)
    goto LABEL_20;
LABEL_18:
  v14 = 2654435761 * self->_infraDisconnectedCount;
  return v4 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  AWDSidecarBssSteering *sidecarBssSteering;
  uint64_t v7;
  AWDSidecarPeerTraffic *sidecarPeerTraffic;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;

  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 4u;
    v5 = *((_WORD *)a3 + 50);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_fgDuration = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_bgDuration = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_bgEntryCount = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_peerRssi24G = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  self->_peerRssi5G = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)a3 + 50) & 0x100) != 0)
  {
LABEL_8:
    self->_isSDB = *((_BYTE *)a3 + 96);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_9:
  sidecarBssSteering = self->_sidecarBssSteering;
  v7 = *((_QWORD *)a3 + 10);
  if (sidecarBssSteering)
  {
    if (v7)
      -[AWDSidecarBssSteering mergeFrom:](sidecarBssSteering, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDWiFiAwdlSidecar setSidecarBssSteering:](self, "setSidecarBssSteering:");
  }
  sidecarPeerTraffic = self->_sidecarPeerTraffic;
  v9 = *((_QWORD *)a3 + 11);
  if (sidecarPeerTraffic)
  {
    if (v9)
      -[AWDSidecarPeerTraffic mergeFrom:](sidecarPeerTraffic, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDWiFiAwdlSidecar setSidecarPeerTraffic:](self, "setSidecarPeerTraffic:");
  }
  v10 = *((_WORD *)a3 + 50);
  if ((v10 & 0x10) != 0)
  {
    self->_dfspState = *((_DWORD *)a3 + 15);
    *(_WORD *)&self->_has |= 0x10u;
    v10 = *((_WORD *)a3 + 50);
  }
  if ((v10 & 0x20) != 0)
  {
    self->_infraDisconnectedCount = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x20u;
  }
  v11 = objc_msgSend(a3, "channelSequencesCount");
  if (v11)
  {
    v12 = v11;
    for (i = 0; i != v12; ++i)
      -[AWDWiFiAwdlSidecar addChannelSequence:](self, "addChannelSequence:", objc_msgSend(a3, "channelSequenceAtIndex:", i));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)fgDuration
{
  return self->_fgDuration;
}

- (unint64_t)bgDuration
{
  return self->_bgDuration;
}

- (unsigned)bgEntryCount
{
  return self->_bgEntryCount;
}

- (int)peerRssi24G
{
  return self->_peerRssi24G;
}

- (int)peerRssi5G
{
  return self->_peerRssi5G;
}

- (BOOL)isSDB
{
  return self->_isSDB;
}

- (AWDSidecarBssSteering)sidecarBssSteering
{
  return self->_sidecarBssSteering;
}

- (void)setSidecarBssSteering:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (AWDSidecarPeerTraffic)sidecarPeerTraffic
{
  return self->_sidecarPeerTraffic;
}

- (void)setSidecarPeerTraffic:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unsigned)dfspState
{
  return self->_dfspState;
}

- (unsigned)infraDisconnectedCount
{
  return self->_infraDisconnectedCount;
}

@end
