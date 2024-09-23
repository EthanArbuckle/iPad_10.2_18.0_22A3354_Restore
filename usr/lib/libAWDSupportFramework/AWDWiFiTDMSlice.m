@implementation AWDWiFiTDMSlice

- (void)setTxaONCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txaONCount = a3;
}

- (void)setHasTxaONCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxaONCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTxaTimeoutCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_txaTimeoutCount = a3;
}

- (void)setHasTxaTimeoutCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTxaTimeoutCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTxaPORCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txaPORCount = a3;
}

- (void)setHasTxaPORCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxaPORCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTxPathEnableReqCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_txPathEnableReqCount = a3;
}

- (void)setHasTxPathEnableReqCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTxPathEnableReqCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTxPathMuteCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_txPathMuteCount = a3;
}

- (void)setHasTxPathMuteCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTxPathMuteCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTxPriorityCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txPriorityCount = a3;
}

- (void)setHasTxPriorityCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTxPriorityCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTxDeferredCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_txDeferredCount = a3;
}

- (void)setHasTxDeferredCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTxDeferredCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTxMuteCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_txMuteCount = a3;
}

- (void)setHasTxMuteCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTxMuteCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAckTxPowerBackoffCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_ackTxPowerBackoffCount = a3;
}

- (void)setHasAckTxPowerBackoffCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAckTxPowerBackoffCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTxaDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_txaDuration = a3;
}

- (void)setHasTxaDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTxaDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTxPriDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_txPriDuration = a3;
}

- (void)setHasTxPriDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTxPriDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTxDeferDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_txDeferDuration = a3;
}

- (void)setHasTxDeferDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTxDeferDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiTDMSlice;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiTDMSlice description](&v3, sel_description), -[AWDWiFiTDMSlice dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txaONCount), CFSTR("txaONCount"));
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txaTimeoutCount), CFSTR("txaTimeoutCount"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txaPORCount), CFSTR("txaPORCount"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txPathEnableReqCount), CFSTR("txPathEnableReqCount"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txPathMuteCount), CFSTR("txPathMuteCount"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txPriorityCount), CFSTR("txPriorityCount"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txDeferredCount), CFSTR("txDeferredCount"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txMuteCount), CFSTR("txMuteCount"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ackTxPowerBackoffCount), CFSTR("ackTxPowerBackoffCount"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
LABEL_25:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txPriDuration), CFSTR("txPriDuration"));
    if ((*(_WORD *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txaDuration), CFSTR("txaDuration"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 1) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txDeferDuration), CFSTR("txDeferDuration"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiTDMSliceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      return;
LABEL_25:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 1) != 0)
    goto LABEL_25;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_txaONCount;
    *((_WORD *)a3 + 34) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 16) = self->_txaTimeoutCount;
  *((_WORD *)a3 + 34) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 15) = self->_txaPORCount;
  *((_WORD *)a3 + 34) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 11) = self->_txPathEnableReqCount;
  *((_WORD *)a3 + 34) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 12) = self->_txPathMuteCount;
  *((_WORD *)a3 + 34) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 13) = self->_txPriorityCount;
  *((_WORD *)a3 + 34) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 9) = self->_txDeferredCount;
  *((_WORD *)a3 + 34) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 10) = self->_txMuteCount;
  *((_WORD *)a3 + 34) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 8) = self->_ackTxPowerBackoffCount;
  *((_WORD *)a3 + 34) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 3) = self->_txaDuration;
  *((_WORD *)a3 + 34) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      return;
LABEL_25:
    *((_QWORD *)a3 + 1) = self->_txDeferDuration;
    *((_WORD *)a3 + 34) |= 1u;
    return;
  }
LABEL_24:
  *((_QWORD *)a3 + 2) = self->_txPriDuration;
  *((_WORD *)a3 + 34) |= 2u;
  if ((*(_WORD *)&self->_has & 1) != 0)
    goto LABEL_25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)result + 14) = self->_txaONCount;
    *((_WORD *)result + 34) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 16) = self->_txaTimeoutCount;
  *((_WORD *)result + 34) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 15) = self->_txaPORCount;
  *((_WORD *)result + 34) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 11) = self->_txPathEnableReqCount;
  *((_WORD *)result + 34) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 12) = self->_txPathMuteCount;
  *((_WORD *)result + 34) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 13) = self->_txPriorityCount;
  *((_WORD *)result + 34) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 9) = self->_txDeferredCount;
  *((_WORD *)result + 34) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 10) = self->_txMuteCount;
  *((_WORD *)result + 34) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 8) = self->_ackTxPowerBackoffCount;
  *((_WORD *)result + 34) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)result + 3) = self->_txaDuration;
  *((_WORD *)result + 34) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      return result;
    goto LABEL_13;
  }
LABEL_25:
  *((_QWORD *)result + 2) = self->_txPriDuration;
  *((_WORD *)result + 34) |= 2u;
  if ((*(_WORD *)&self->_has & 1) == 0)
    return result;
LABEL_13:
  *((_QWORD *)result + 1) = self->_txDeferDuration;
  *((_WORD *)result + 34) |= 1u;
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
    if ((has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x200) == 0 || self->_txaONCount != *((_DWORD *)a3 + 14))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 34) & 0x200) != 0)
    {
LABEL_61:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x800) == 0 || self->_txaTimeoutCount != *((_DWORD *)a3 + 16))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 34) & 0x800) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x400) == 0 || self->_txaPORCount != *((_DWORD *)a3 + 15))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 34) & 0x400) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_txPathEnableReqCount != *((_DWORD *)a3 + 11))
        goto LABEL_61;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_txPathMuteCount != *((_DWORD *)a3 + 12))
        goto LABEL_61;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x100) == 0 || self->_txPriorityCount != *((_DWORD *)a3 + 13))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 34) & 0x100) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_txDeferredCount != *((_DWORD *)a3 + 9))
        goto LABEL_61;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_txMuteCount != *((_DWORD *)a3 + 10))
        goto LABEL_61;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_ackTxPowerBackoffCount != *((_DWORD *)a3 + 8))
        goto LABEL_61;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_txaDuration != *((_QWORD *)a3 + 3))
        goto LABEL_61;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_txPriDuration != *((_QWORD *)a3 + 2))
        goto LABEL_61;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_61;
    }
    LOBYTE(v5) = (v7 & 1) == 0;
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_txDeferDuration != *((_QWORD *)a3 + 1))
        goto LABEL_61;
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
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v3 = 2654435761 * self->_txaONCount;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_txaTimeoutCount;
      if ((*(_WORD *)&self->_has & 0x400) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_txaPORCount;
    if ((has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_txPathEnableReqCount;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_txPathMuteCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_txPriorityCount;
    if ((has & 0x10) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_txDeferredCount;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_txMuteCount;
    if ((has & 8) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  if ((has & 8) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_ackTxPowerBackoffCount;
    if ((has & 4) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_txaDuration;
    if ((has & 2) != 0)
      goto LABEL_12;
LABEL_24:
    v13 = 0;
    if ((has & 1) != 0)
      goto LABEL_13;
LABEL_25:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  v12 = 0;
  if ((has & 2) == 0)
    goto LABEL_24;
LABEL_12:
  v13 = 2654435761u * self->_txPriDuration;
  if ((has & 1) == 0)
    goto LABEL_25;
LABEL_13:
  v14 = 2654435761u * self->_txDeferDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x200) != 0)
  {
    self->_txaONCount = *((_DWORD *)a3 + 14);
    *(_WORD *)&self->_has |= 0x200u;
    v3 = *((_WORD *)a3 + 34);
    if ((v3 & 0x800) == 0)
    {
LABEL_3:
      if ((v3 & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*((_WORD *)a3 + 34) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_txaTimeoutCount = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x400) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_txaPORCount = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_txPathEnableReqCount = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_txPathMuteCount = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_txPriorityCount = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_txDeferredCount = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x20) == 0)
  {
LABEL_9:
    if ((v3 & 8) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_txMuteCount = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 8) == 0)
  {
LABEL_10:
    if ((v3 & 4) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  self->_ackTxPowerBackoffCount = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 4) == 0)
  {
LABEL_11:
    if ((v3 & 2) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  self->_txaDuration = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 34);
  if ((v3 & 2) == 0)
  {
LABEL_12:
    if ((v3 & 1) == 0)
      return;
LABEL_25:
    self->_txDeferDuration = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    return;
  }
LABEL_24:
  self->_txPriDuration = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 34) & 1) != 0)
    goto LABEL_25;
}

- (unsigned)txaONCount
{
  return self->_txaONCount;
}

- (unsigned)txaTimeoutCount
{
  return self->_txaTimeoutCount;
}

- (unsigned)txaPORCount
{
  return self->_txaPORCount;
}

- (unsigned)txPathEnableReqCount
{
  return self->_txPathEnableReqCount;
}

- (unsigned)txPathMuteCount
{
  return self->_txPathMuteCount;
}

- (unsigned)txPriorityCount
{
  return self->_txPriorityCount;
}

- (unsigned)txDeferredCount
{
  return self->_txDeferredCount;
}

- (unsigned)txMuteCount
{
  return self->_txMuteCount;
}

- (unsigned)ackTxPowerBackoffCount
{
  return self->_ackTxPowerBackoffCount;
}

- (unint64_t)txaDuration
{
  return self->_txaDuration;
}

- (unint64_t)txPriDuration
{
  return self->_txPriDuration;
}

- (unint64_t)txDeferDuration
{
  return self->_txDeferDuration;
}

@end
