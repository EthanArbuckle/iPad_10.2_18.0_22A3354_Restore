@implementation AWDMacCountersRx

- (void)setRxdfrmucastmbss:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rxdfrmucastmbss = a3;
}

- (void)setHasRxdfrmucastmbss:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRxdfrmucastmbss
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRxmfrmucastmbss:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rxmfrmucastmbss = a3;
}

- (void)setHasRxmfrmucastmbss:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRxmfrmucastmbss
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setRxcfrmucast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rxcfrmucast = a3;
}

- (void)setHasRxcfrmucast:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRxcfrmucast
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRxrtsucast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_rxrtsucast = a3;
}

- (void)setHasRxrtsucast:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasRxrtsucast
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setRxctsucast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rxctsucast = a3;
}

- (void)setHasRxctsucast:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRxctsucast
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRxackucast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rxackucast = a3;
}

- (void)setHasRxackucast:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRxackucast
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRxdfrmocast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rxdfrmocast = a3;
}

- (void)setHasRxdfrmocast:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRxdfrmocast
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRxmfrmocast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_rxmfrmocast = a3;
}

- (void)setHasRxmfrmocast:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRxmfrmocast
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRxcfrmocast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rxcfrmocast = a3;
}

- (void)setHasRxcfrmocast:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRxcfrmocast
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRxrtsocast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_rxrtsocast = a3;
}

- (void)setHasRxrtsocast:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasRxrtsocast
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setRxctsocast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rxctsocast = a3;
}

- (void)setHasRxctsocast:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRxctsocast
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRxdfrmmcast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rxdfrmmcast = a3;
}

- (void)setHasRxdfrmmcast:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRxdfrmmcast
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRxmfrmmcast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rxmfrmmcast = a3;
}

- (void)setHasRxmfrmmcast:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRxmfrmmcast
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRxcfrmmcast:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rxcfrmmcast = a3;
}

- (void)setHasRxcfrmmcast:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRxcfrmmcast
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMacCountersRx;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMacCountersRx description](&v3, sel_description), -[AWDMacCountersRx dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxdfrmucastmbss), CFSTR("rxdfrmucastmbss"));
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxmfrmucastmbss), CFSTR("rxmfrmucastmbss"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxcfrmucast), CFSTR("rxcfrmucast"));
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxrtsucast), CFSTR("rxrtsucast"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxctsucast), CFSTR("rxctsucast"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxackucast), CFSTR("rxackucast"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxdfrmocast), CFSTR("rxdfrmocast"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxmfrmocast), CFSTR("rxmfrmocast"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxcfrmocast), CFSTR("rxcfrmocast"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxrtsocast), CFSTR("rxrtsocast"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxctsocast), CFSTR("rxctsocast"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
LABEL_29:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxmfrmmcast), CFSTR("rxmfrmmcast"));
    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_15;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxdfrmmcast), CFSTR("rxdfrmmcast"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 2) != 0)
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxcfrmmcast), CFSTR("rxcfrmmcast"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMacCountersRxReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      return;
LABEL_29:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_29;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_QWORD *)a3 + 9) = self->_rxdfrmucastmbss;
    *((_WORD *)a3 + 60) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 12) = self->_rxmfrmucastmbss;
  *((_WORD *)a3 + 60) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 4) = self->_rxcfrmucast;
  *((_WORD *)a3 + 60) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 14) = self->_rxrtsucast;
  *((_WORD *)a3 + 60) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 6) = self->_rxctsucast;
  *((_WORD *)a3 + 60) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 1) = self->_rxackucast;
  *((_WORD *)a3 + 60) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 8) = self->_rxdfrmocast;
  *((_WORD *)a3 + 60) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 11) = self->_rxmfrmocast;
  *((_WORD *)a3 + 60) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)a3 + 3) = self->_rxcfrmocast;
  *((_WORD *)a3 + 60) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)a3 + 13) = self->_rxrtsocast;
  *((_WORD *)a3 + 60) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)a3 + 5) = self->_rxctsocast;
  *((_WORD *)a3 + 60) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a3 + 7) = self->_rxdfrmmcast;
  *((_WORD *)a3 + 60) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      return;
LABEL_29:
    *((_QWORD *)a3 + 2) = self->_rxcfrmmcast;
    *((_WORD *)a3 + 60) |= 2u;
    return;
  }
LABEL_28:
  *((_QWORD *)a3 + 10) = self->_rxmfrmmcast;
  *((_WORD *)a3 + 60) |= 0x200u;
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_QWORD *)result + 9) = self->_rxdfrmucastmbss;
    *((_WORD *)result + 60) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 12) = self->_rxmfrmucastmbss;
  *((_WORD *)result + 60) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 4) = self->_rxcfrmucast;
  *((_WORD *)result + 60) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 14) = self->_rxrtsucast;
  *((_WORD *)result + 60) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 6) = self->_rxctsucast;
  *((_WORD *)result + 60) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 1) = self->_rxackucast;
  *((_WORD *)result + 60) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)result + 8) = self->_rxdfrmocast;
  *((_WORD *)result + 60) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)result + 11) = self->_rxmfrmocast;
  *((_WORD *)result + 60) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)result + 3) = self->_rxcfrmocast;
  *((_WORD *)result + 60) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)result + 13) = self->_rxrtsocast;
  *((_WORD *)result + 60) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)result + 5) = self->_rxctsocast;
  *((_WORD *)result + 60) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)result + 7) = self->_rxdfrmmcast;
  *((_WORD *)result + 60) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      return result;
    goto LABEL_15;
  }
LABEL_29:
  *((_QWORD *)result + 10) = self->_rxmfrmmcast;
  *((_WORD *)result + 60) |= 0x200u;
  if ((*(_WORD *)&self->_has & 2) == 0)
    return result;
LABEL_15:
  *((_QWORD *)result + 2) = self->_rxcfrmmcast;
  *((_WORD *)result + 60) |= 2u;
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
    v7 = *((_WORD *)a3 + 60);
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x100) == 0 || self->_rxdfrmucastmbss != *((_QWORD *)a3 + 9))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 60) & 0x100) != 0)
    {
LABEL_71:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x800) == 0 || self->_rxmfrmucastmbss != *((_QWORD *)a3 + 12))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 60) & 0x800) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_rxcfrmucast != *((_QWORD *)a3 + 4))
        goto LABEL_71;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x2000) == 0 || self->_rxrtsucast != *((_QWORD *)a3 + 14))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 60) & 0x2000) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_rxctsucast != *((_QWORD *)a3 + 6))
        goto LABEL_71;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_rxackucast != *((_QWORD *)a3 + 1))
        goto LABEL_71;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_rxdfrmocast != *((_QWORD *)a3 + 8))
        goto LABEL_71;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x400) == 0 || self->_rxmfrmocast != *((_QWORD *)a3 + 11))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 60) & 0x400) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_rxcfrmocast != *((_QWORD *)a3 + 3))
        goto LABEL_71;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x1000) == 0 || self->_rxrtsocast != *((_QWORD *)a3 + 13))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 60) & 0x1000) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_rxctsocast != *((_QWORD *)a3 + 5))
        goto LABEL_71;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_rxdfrmmcast != *((_QWORD *)a3 + 7))
        goto LABEL_71;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x200) == 0 || self->_rxmfrmmcast != *((_QWORD *)a3 + 10))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 60) & 0x200) != 0)
    {
      goto LABEL_71;
    }
    LOBYTE(v5) = (v7 & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_rxcfrmmcast != *((_QWORD *)a3 + 2))
        goto LABEL_71;
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
  unint64_t v15;
  unint64_t v16;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v3 = 2654435761u * self->_rxdfrmucastmbss;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_rxmfrmucastmbss;
      if ((has & 8) != 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_rxcfrmucast;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_rxrtsucast;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_rxctsucast;
    if ((has & 1) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v7 = 0;
  if ((has & 1) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_rxackucast;
    if ((has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v8 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_rxdfrmocast;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_rxmfrmocast;
    if ((has & 4) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v10 = 0;
  if ((has & 4) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_rxcfrmocast;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_rxrtsocast;
    if ((has & 0x10) != 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v12 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_12:
    v13 = 2654435761u * self->_rxctsocast;
    if ((has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  v13 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    v14 = 2654435761u * self->_rxdfrmmcast;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_14;
LABEL_28:
    v15 = 0;
    if ((has & 2) != 0)
      goto LABEL_15;
LABEL_29:
    v16 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_27:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_28;
LABEL_14:
  v15 = 2654435761u * self->_rxmfrmmcast;
  if ((has & 2) == 0)
    goto LABEL_29;
LABEL_15:
  v16 = 2654435761u * self->_rxcfrmmcast;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x100) != 0)
  {
    self->_rxdfrmucastmbss = *((_QWORD *)a3 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    v3 = *((_WORD *)a3 + 60);
    if ((v3 & 0x800) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*((_WORD *)a3 + 60) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_rxmfrmucastmbss = *((_QWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_rxcfrmucast = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x2000) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_rxrtsucast = *((_QWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x2000u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_rxctsucast = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 1) == 0)
  {
LABEL_7:
    if ((v3 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  self->_rxackucast = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x80) == 0)
  {
LABEL_8:
    if ((v3 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  self->_rxdfrmocast = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x400) == 0)
  {
LABEL_9:
    if ((v3 & 4) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  self->_rxmfrmocast = *((_QWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 4) == 0)
  {
LABEL_10:
    if ((v3 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  self->_rxcfrmocast = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x1000) == 0)
  {
LABEL_11:
    if ((v3 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  self->_rxrtsocast = *((_QWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x1000u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x10) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  self->_rxctsocast = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  self->_rxdfrmmcast = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x200) == 0)
  {
LABEL_14:
    if ((v3 & 2) == 0)
      return;
LABEL_29:
    self->_rxcfrmmcast = *((_QWORD *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
    return;
  }
LABEL_28:
  self->_rxmfrmmcast = *((_QWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 60) & 2) != 0)
    goto LABEL_29;
}

- (unint64_t)rxdfrmucastmbss
{
  return self->_rxdfrmucastmbss;
}

- (unint64_t)rxmfrmucastmbss
{
  return self->_rxmfrmucastmbss;
}

- (unint64_t)rxcfrmucast
{
  return self->_rxcfrmucast;
}

- (unint64_t)rxrtsucast
{
  return self->_rxrtsucast;
}

- (unint64_t)rxctsucast
{
  return self->_rxctsucast;
}

- (unint64_t)rxackucast
{
  return self->_rxackucast;
}

- (unint64_t)rxdfrmocast
{
  return self->_rxdfrmocast;
}

- (unint64_t)rxmfrmocast
{
  return self->_rxmfrmocast;
}

- (unint64_t)rxcfrmocast
{
  return self->_rxcfrmocast;
}

- (unint64_t)rxrtsocast
{
  return self->_rxrtsocast;
}

- (unint64_t)rxctsocast
{
  return self->_rxctsocast;
}

- (unint64_t)rxdfrmmcast
{
  return self->_rxdfrmmcast;
}

- (unint64_t)rxmfrmmcast
{
  return self->_rxmfrmmcast;
}

- (unint64_t)rxcfrmmcast
{
  return self->_rxcfrmmcast;
}

@end
