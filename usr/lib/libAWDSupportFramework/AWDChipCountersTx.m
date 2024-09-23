@implementation AWDChipCountersTx

- (void)setTxframe:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_txframe = a3;
}

- (void)setHasTxframe:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTxframe
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTxbyte:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_txbyte = a3;
}

- (void)setHasTxbyte:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTxbyte
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTxretrans:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txretrans = a3;
}

- (void)setHasTxretrans:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxretrans
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTxerror:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_txerror = a3;
}

- (void)setHasTxerror:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTxerror
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTxctl:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_txctl = a3;
}

- (void)setHasTxctl:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTxctl
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTxprshort:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txprshort = a3;
}

- (void)setHasTxprshort:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTxprshort
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTxserr:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_txserr = a3;
}

- (void)setHasTxserr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTxserr
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTxnobuf:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_txnobuf = a3;
}

- (void)setHasTxnobuf:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTxnobuf
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTxnoassoc:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_txnoassoc = a3;
}

- (void)setHasTxnoassoc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTxnoassoc
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTxrunt:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txrunt = a3;
}

- (void)setHasTxrunt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxrunt
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTxchit:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_txchit = a3;
}

- (void)setHasTxchit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTxchit
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTxcmiss:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_txcmiss = a3;
}

- (void)setHasTxcmiss:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTxcmiss
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDChipCountersTx;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDChipCountersTx description](&v3, sel_description), -[AWDChipCountersTx dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txframe), CFSTR("txframe"));
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txbyte), CFSTR("txbyte"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txretrans), CFSTR("txretrans"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txerror), CFSTR("txerror"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txctl), CFSTR("txctl"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txprshort), CFSTR("txprshort"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txserr), CFSTR("txserr"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txnobuf), CFSTR("txnobuf"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txnoassoc), CFSTR("txnoassoc"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
LABEL_25:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txchit), CFSTR("txchit"));
    if ((*(_WORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txrunt), CFSTR("txrunt"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 4) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txcmiss), CFSTR("txcmiss"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDChipCountersTxReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
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
    if ((has & 4) == 0)
      return;
LABEL_25:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 4) != 0)
    goto LABEL_25;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_QWORD *)a3 + 6) = self->_txframe;
    *((_WORD *)a3 + 52) |= 0x20u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 1) = self->_txbyte;
  *((_WORD *)a3 + 52) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)a3 + 10) = self->_txretrans;
  *((_WORD *)a3 + 52) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 5) = self->_txerror;
  *((_WORD *)a3 + 52) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 4) = self->_txctl;
  *((_WORD *)a3 + 52) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 9) = self->_txprshort;
  *((_WORD *)a3 + 52) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 12) = self->_txserr;
  *((_WORD *)a3 + 52) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 8) = self->_txnobuf;
  *((_WORD *)a3 + 52) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 7) = self->_txnoassoc;
  *((_WORD *)a3 + 52) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 11) = self->_txrunt;
  *((_WORD *)a3 + 52) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      return;
LABEL_25:
    *((_QWORD *)a3 + 3) = self->_txcmiss;
    *((_WORD *)a3 + 52) |= 4u;
    return;
  }
LABEL_24:
  *((_QWORD *)a3 + 2) = self->_txchit;
  *((_WORD *)a3 + 52) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
    goto LABEL_25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_QWORD *)result + 6) = self->_txframe;
    *((_WORD *)result + 52) |= 0x20u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = self->_txbyte;
  *((_WORD *)result + 52) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 10) = self->_txretrans;
  *((_WORD *)result + 52) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 5) = self->_txerror;
  *((_WORD *)result + 52) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 4) = self->_txctl;
  *((_WORD *)result + 52) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 9) = self->_txprshort;
  *((_WORD *)result + 52) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 12) = self->_txserr;
  *((_WORD *)result + 52) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 8) = self->_txnobuf;
  *((_WORD *)result + 52) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)result + 7) = self->_txnoassoc;
  *((_WORD *)result + 52) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)result + 11) = self->_txrunt;
  *((_WORD *)result + 52) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      return result;
    goto LABEL_13;
  }
LABEL_25:
  *((_QWORD *)result + 2) = self->_txchit;
  *((_WORD *)result + 52) |= 2u;
  if ((*(_WORD *)&self->_has & 4) == 0)
    return result;
LABEL_13:
  *((_QWORD *)result + 3) = self->_txcmiss;
  *((_WORD *)result + 52) |= 4u;
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
    v7 = *((_WORD *)a3 + 52);
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_txframe != *((_QWORD *)a3 + 6))
        goto LABEL_61;
    }
    else if ((v7 & 0x20) != 0)
    {
LABEL_61:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_txbyte != *((_QWORD *)a3 + 1))
        goto LABEL_61;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x200) == 0 || self->_txretrans != *((_QWORD *)a3 + 10))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x200) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_txerror != *((_QWORD *)a3 + 5))
        goto LABEL_61;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_txctl != *((_QWORD *)a3 + 4))
        goto LABEL_61;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_txprshort != *((_QWORD *)a3 + 9))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x800) == 0 || self->_txserr != *((_QWORD *)a3 + 12))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_txnobuf != *((_QWORD *)a3 + 8))
        goto LABEL_61;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_txnoassoc != *((_QWORD *)a3 + 7))
        goto LABEL_61;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x400) == 0 || self->_txrunt != *((_QWORD *)a3 + 11))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_txchit != *((_QWORD *)a3 + 2))
        goto LABEL_61;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_61;
    }
    LOBYTE(v5) = (v7 & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_txcmiss != *((_QWORD *)a3 + 3))
        goto LABEL_61;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v3 = 2654435761u * self->_txframe;
    if ((has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_txbyte;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_txretrans;
    if ((has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_txerror;
    if ((has & 8) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_txctl;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_txprshort;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_txserr;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_txnobuf;
    if ((has & 0x40) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_txnoassoc;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_txrunt;
    if ((has & 2) != 0)
      goto LABEL_12;
LABEL_24:
    v13 = 0;
    if ((has & 4) != 0)
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
  v13 = 2654435761u * self->_txchit;
  if ((has & 4) == 0)
    goto LABEL_25;
LABEL_13:
  v14 = 2654435761u * self->_txcmiss;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x20) != 0)
  {
    self->_txframe = *((_QWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    v3 = *((_WORD *)a3 + 52);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_txbyte = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x200) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_txretrans = *((_QWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_txerror = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_txctl = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_txprshort = *((_QWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x800) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_txserr = *((_QWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_txnobuf = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x40) == 0)
  {
LABEL_10:
    if ((v3 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  self->_txnoassoc = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x400) == 0)
  {
LABEL_11:
    if ((v3 & 2) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  self->_txrunt = *((_QWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 2) == 0)
  {
LABEL_12:
    if ((v3 & 4) == 0)
      return;
LABEL_25:
    self->_txcmiss = *((_QWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    return;
  }
LABEL_24:
  self->_txchit = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 52) & 4) != 0)
    goto LABEL_25;
}

- (unint64_t)txframe
{
  return self->_txframe;
}

- (unint64_t)txbyte
{
  return self->_txbyte;
}

- (unint64_t)txretrans
{
  return self->_txretrans;
}

- (unint64_t)txerror
{
  return self->_txerror;
}

- (unint64_t)txctl
{
  return self->_txctl;
}

- (unint64_t)txprshort
{
  return self->_txprshort;
}

- (unint64_t)txserr
{
  return self->_txserr;
}

- (unint64_t)txnobuf
{
  return self->_txnobuf;
}

- (unint64_t)txnoassoc
{
  return self->_txnoassoc;
}

- (unint64_t)txrunt
{
  return self->_txrunt;
}

- (unint64_t)txchit
{
  return self->_txchit;
}

- (unint64_t)txcmiss
{
  return self->_txcmiss;
}

@end
