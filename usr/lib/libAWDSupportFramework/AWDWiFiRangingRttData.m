@implementation AWDWiFiRangingRttData

- (void)setFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFlags
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRtt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_rtt = a3;
}

- (void)setHasRtt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasRtt
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRssi
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSnr:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_snr = a3;
}

- (void)setHasSnr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSnr
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setCoreId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_coreId = a3;
}

- (void)setHasCoreId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCoreId
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setLosPeakRatio:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_losPeakRatio = a3;
}

- (void)setHasLosPeakRatio:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLosPeakRatio
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setBitErrorRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bitErrorRate = a3;
}

- (void)setHasBitErrorRate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBitErrorRate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPhyError:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_phyError = a3;
}

- (void)setHasPhyError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPhyError
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasStatus
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setPeerSnr:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_peerSnr = a3;
}

- (void)setHasPeerSnr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPeerSnr
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPeerLosPeakRatio:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_peerLosPeakRatio = a3;
}

- (void)setHasPeerLosPeakRatio:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPeerLosPeakRatio
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPeerCoreId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_peerCoreId = a3;
}

- (void)setHasPeerCoreId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPeerCoreId
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPeerBitErrorRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_peerBitErrorRate = a3;
}

- (void)setHasPeerBitErrorRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPeerBitErrorRate
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPeerPhyError:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_peerPhyError = a3;
}

- (void)setHasPeerPhyError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPeerPhyError
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiRangingRttData;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiRangingRttData description](&v3, sel_description), -[AWDWiFiRangingRttData dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flags), CFSTR("flags"));
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rtt), CFSTR("rtt"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rssi), CFSTR("rssi"));
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_snr), CFSTR("snr"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_coreId), CFSTR("coreId"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_losPeakRatio), CFSTR("losPeakRatio"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bitErrorRate), CFSTR("bitErrorRate"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_phyError), CFSTR("phyError"));
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_status), CFSTR("status"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerSnr), CFSTR("peerSnr"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerLosPeakRatio), CFSTR("peerLosPeakRatio"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerCoreId), CFSTR("peerCoreId"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      goto LABEL_15;
LABEL_31:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerPhyError), CFSTR("peerPhyError"));
    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_16;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peerBitErrorRate), CFSTR("peerBitErrorRate"));
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_31;
LABEL_15:
  if ((has & 2) != 0)
LABEL_16:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channel), CFSTR("channel"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiRangingRttDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 2) == 0)
      return;
LABEL_31:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_31;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_flags;
    *((_WORD *)a3 + 34) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 14) = self->_rtt;
  *((_WORD *)a3 + 34) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 13) = self->_rssi;
  *((_WORD *)a3 + 34) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 15) = self->_snr;
  *((_WORD *)a3 + 34) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 4) = self->_coreId;
  *((_WORD *)a3 + 34) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 6) = self->_losPeakRatio;
  *((_WORD *)a3 + 34) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 2) = self->_bitErrorRate;
  *((_WORD *)a3 + 34) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 12) = self->_phyError;
  *((_WORD *)a3 + 34) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 16) = self->_status;
  *((_WORD *)a3 + 34) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 11) = self->_peerSnr;
  *((_WORD *)a3 + 34) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 9) = self->_peerLosPeakRatio;
  *((_WORD *)a3 + 34) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 8) = self->_peerCoreId;
  *((_WORD *)a3 + 34) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 7) = self->_peerBitErrorRate;
  *((_WORD *)a3 + 34) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 2) == 0)
      return;
LABEL_31:
    *((_DWORD *)a3 + 3) = self->_channel;
    *((_WORD *)a3 + 34) |= 2u;
    return;
  }
LABEL_30:
  *((_DWORD *)a3 + 10) = self->_peerPhyError;
  *((_WORD *)a3 + 34) |= 0x100u;
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_flags;
    *((_WORD *)result + 34) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 14) = self->_rtt;
  *((_WORD *)result + 34) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 13) = self->_rssi;
  *((_WORD *)result + 34) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 15) = self->_snr;
  *((_WORD *)result + 34) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 4) = self->_coreId;
  *((_WORD *)result + 34) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 6) = self->_losPeakRatio;
  *((_WORD *)result + 34) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 2) = self->_bitErrorRate;
  *((_WORD *)result + 34) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 12) = self->_phyError;
  *((_WORD *)result + 34) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 16) = self->_status;
  *((_WORD *)result + 34) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 11) = self->_peerSnr;
  *((_WORD *)result + 34) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 9) = self->_peerLosPeakRatio;
  *((_WORD *)result + 34) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 8) = self->_peerCoreId;
  *((_WORD *)result + 34) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 7) = self->_peerBitErrorRate;
  *((_WORD *)result + 34) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 2) == 0)
      return result;
    goto LABEL_16;
  }
LABEL_31:
  *((_DWORD *)result + 10) = self->_peerPhyError;
  *((_WORD *)result + 34) |= 0x100u;
  if ((*(_WORD *)&self->_has & 2) == 0)
    return result;
LABEL_16:
  *((_DWORD *)result + 3) = self->_channel;
  *((_WORD *)result + 34) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 34);
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_flags != *((_DWORD *)a3 + 5))
        goto LABEL_76;
    }
    else if ((v7 & 8) != 0)
    {
LABEL_76:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x1000) == 0 || self->_rtt != *((_DWORD *)a3 + 14))
        goto LABEL_76;
    }
    else if ((*((_WORD *)a3 + 34) & 0x1000) != 0)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x800) == 0 || self->_rssi != *((_DWORD *)a3 + 13))
        goto LABEL_76;
    }
    else if ((*((_WORD *)a3 + 34) & 0x800) != 0)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x2000) == 0 || self->_snr != *((_DWORD *)a3 + 15))
        goto LABEL_76;
    }
    else if ((*((_WORD *)a3 + 34) & 0x2000) != 0)
    {
      goto LABEL_76;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_coreId != *((_DWORD *)a3 + 4))
        goto LABEL_76;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_76;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_losPeakRatio != *((_DWORD *)a3 + 6))
        goto LABEL_76;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_76;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_bitErrorRate != *((_DWORD *)a3 + 2))
        goto LABEL_76;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x400) == 0 || self->_phyError != *((_DWORD *)a3 + 12))
        goto LABEL_76;
    }
    else if ((*((_WORD *)a3 + 34) & 0x400) != 0)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x4000) == 0 || self->_status != *((_DWORD *)a3 + 16))
        goto LABEL_76;
    }
    else if ((*((_WORD *)a3 + 34) & 0x4000) != 0)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x200) == 0 || self->_peerSnr != *((_DWORD *)a3 + 11))
        goto LABEL_76;
    }
    else if ((*((_WORD *)a3 + 34) & 0x200) != 0)
    {
      goto LABEL_76;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_peerLosPeakRatio != *((_DWORD *)a3 + 9))
        goto LABEL_76;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_76;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_peerCoreId != *((_DWORD *)a3 + 8))
        goto LABEL_76;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_76;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_peerBitErrorRate != *((_DWORD *)a3 + 7))
        goto LABEL_76;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x100) == 0 || self->_peerPhyError != *((_DWORD *)a3 + 10))
        goto LABEL_76;
    }
    else if ((*((_WORD *)a3 + 34) & 0x100) != 0)
    {
      goto LABEL_76;
    }
    LOBYTE(v5) = (v7 & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_channel != *((_DWORD *)a3 + 3))
        goto LABEL_76;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v3 = 2654435761 * self->_flags;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_rtt;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_rssi;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_snr;
    if ((has & 4) != 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_coreId;
    if ((has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_losPeakRatio;
    if ((has & 1) != 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  v8 = 0;
  if ((has & 1) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_bitErrorRate;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_phyError;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_status;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_peerSnr;
    if ((has & 0x80) != 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  v12 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_peerLosPeakRatio;
    if ((has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  v13 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_peerCoreId;
    if ((has & 0x20) != 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  v14 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_peerBitErrorRate;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_15;
LABEL_30:
    v16 = 0;
    if ((has & 2) != 0)
      goto LABEL_16;
LABEL_31:
    v17 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_29:
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_30;
LABEL_15:
  v16 = 2654435761 * self->_peerPhyError;
  if ((has & 2) == 0)
    goto LABEL_31;
LABEL_16:
  v17 = 2654435761 * self->_channel;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 8) != 0)
  {
    self->_flags = *((_DWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 8u;
    v3 = *((_WORD *)a3 + 34);
    if ((v3 & 0x1000) == 0)
    {
LABEL_3:
      if ((v3 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)a3 + 34) & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_rtt = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x800) == 0)
  {
LABEL_4:
    if ((v3 & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  self->_rssi = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x2000) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  self->_snr = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x2000u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  self->_coreId = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 1) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  self->_losPeakRatio = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 1) == 0)
  {
LABEL_8:
    if ((v3 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  self->_bitErrorRate = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x400) == 0)
  {
LABEL_9:
    if ((v3 & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  self->_phyError = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x4000) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  self->_status = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x4000u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x200) == 0)
  {
LABEL_11:
    if ((v3 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  self->_peerSnr = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x80) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  self->_peerLosPeakRatio = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  self->_peerCoreId = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x20) == 0)
  {
LABEL_14:
    if ((v3 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  self->_peerBitErrorRate = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x100) == 0)
  {
LABEL_15:
    if ((v3 & 2) == 0)
      return;
LABEL_31:
    self->_channel = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    return;
  }
LABEL_30:
  self->_peerPhyError = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 34) & 2) != 0)
    goto LABEL_31;
}

- (unsigned)flags
{
  return self->_flags;
}

- (unsigned)rtt
{
  return self->_rtt;
}

- (int)rssi
{
  return self->_rssi;
}

- (unsigned)snr
{
  return self->_snr;
}

- (unsigned)coreId
{
  return self->_coreId;
}

- (unsigned)losPeakRatio
{
  return self->_losPeakRatio;
}

- (unsigned)bitErrorRate
{
  return self->_bitErrorRate;
}

- (unsigned)phyError
{
  return self->_phyError;
}

- (unsigned)status
{
  return self->_status;
}

- (unsigned)peerSnr
{
  return self->_peerSnr;
}

- (unsigned)peerLosPeakRatio
{
  return self->_peerLosPeakRatio;
}

- (unsigned)peerCoreId
{
  return self->_peerCoreId;
}

- (unsigned)peerBitErrorRate
{
  return self->_peerBitErrorRate;
}

- (unsigned)peerPhyError
{
  return self->_peerPhyError;
}

- (unsigned)channel
{
  return self->_channel;
}

@end
