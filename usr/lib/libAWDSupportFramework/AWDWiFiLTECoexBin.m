@implementation AWDWiFiLTECoexBin

- (void)setRxframe:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rxframe = a3;
}

- (void)setHasRxframe:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRxframe
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTxframe:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_txframe = a3;
}

- (void)setHasTxframe:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTxframe
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRxrtry:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rxrtry = a3;
}

- (void)setHasRxrtry:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRxrtry
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTxretrans:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txretrans = a3;
}

- (void)setHasTxretrans:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxretrans
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTxnocts:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_txnocts = a3;
}

- (void)setHasTxnocts:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTxnocts
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTxrts:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_txrts = a3;
}

- (void)setHasTxrts:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTxrts
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTxdeauth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_txdeauth = a3;
}

- (void)setHasTxdeauth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTxdeauth
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTxassocreq:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_txassocreq = a3;
}

- (void)setHasTxassocreq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTxassocreq
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTxassocrsp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_txassocrsp = a3;
}

- (void)setHasTxassocrsp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTxassocrsp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTxreassocreq:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txreassocreq = a3;
}

- (void)setHasTxreassocreq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTxreassocreq
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTxreassocrsp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txreassocrsp = a3;
}

- (void)setHasTxreassocrsp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxreassocrsp
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setCtsnotrxafterrts:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ctsnotrxafterrts = a3;
}

- (void)setHasCtsnotrxafterrts:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCtsnotrxafterrts
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLTECoexBin;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiLTECoexBin description](&v3, sel_description), -[AWDWiFiLTECoexBin dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxframe), CFSTR("rxframe"));
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txframe), CFSTR("txframe"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxrtry), CFSTR("rxrtry"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txretrans), CFSTR("txretrans"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txnocts), CFSTR("txnocts"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txrts), CFSTR("txrts"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txdeauth), CFSTR("txdeauth"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txassocreq), CFSTR("txassocreq"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txassocrsp), CFSTR("txassocrsp"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
LABEL_25:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txreassocrsp), CFSTR("txreassocrsp"));
    if ((*(_WORD *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_txreassocreq), CFSTR("txreassocreq"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 1) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ctsnotrxafterrts), CFSTR("ctsnotrxafterrts"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiLTECoexBinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
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
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
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
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_rxframe;
    *((_WORD *)a3 + 52) |= 2u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 7) = self->_txframe;
  *((_WORD *)a3 + 52) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)a3 + 3) = self->_rxrtry;
  *((_WORD *)a3 + 52) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 11) = self->_txretrans;
  *((_WORD *)a3 + 52) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 8) = self->_txnocts;
  *((_WORD *)a3 + 52) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 12) = self->_txrts;
  *((_WORD *)a3 + 52) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 6) = self->_txdeauth;
  *((_WORD *)a3 + 52) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 4) = self->_txassocreq;
  *((_WORD *)a3 + 52) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 5) = self->_txassocrsp;
  *((_WORD *)a3 + 52) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 9) = self->_txreassocreq;
  *((_WORD *)a3 + 52) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      return;
LABEL_25:
    *((_QWORD *)a3 + 1) = self->_ctsnotrxafterrts;
    *((_WORD *)a3 + 52) |= 1u;
    return;
  }
LABEL_24:
  *((_QWORD *)a3 + 10) = self->_txreassocrsp;
  *((_WORD *)a3 + 52) |= 0x200u;
  if ((*(_WORD *)&self->_has & 1) != 0)
    goto LABEL_25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = self->_rxframe;
    *((_WORD *)result + 52) |= 2u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 7) = self->_txframe;
  *((_WORD *)result + 52) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 3) = self->_rxrtry;
  *((_WORD *)result + 52) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 11) = self->_txretrans;
  *((_WORD *)result + 52) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 8) = self->_txnocts;
  *((_WORD *)result + 52) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 12) = self->_txrts;
  *((_WORD *)result + 52) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 6) = self->_txdeauth;
  *((_WORD *)result + 52) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 4) = self->_txassocreq;
  *((_WORD *)result + 52) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)result + 5) = self->_txassocrsp;
  *((_WORD *)result + 52) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)result + 9) = self->_txreassocreq;
  *((_WORD *)result + 52) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      return result;
    goto LABEL_13;
  }
LABEL_25:
  *((_QWORD *)result + 10) = self->_txreassocrsp;
  *((_WORD *)result + 52) |= 0x200u;
  if ((*(_WORD *)&self->_has & 1) == 0)
    return result;
LABEL_13:
  *((_QWORD *)result + 1) = self->_ctsnotrxafterrts;
  *((_WORD *)result + 52) |= 1u;
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
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_rxframe != *((_QWORD *)a3 + 2))
        goto LABEL_61;
    }
    else if ((v7 & 2) != 0)
    {
LABEL_61:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_txframe != *((_QWORD *)a3 + 7))
        goto LABEL_61;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_rxrtry != *((_QWORD *)a3 + 3))
        goto LABEL_61;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x400) == 0 || self->_txretrans != *((_QWORD *)a3 + 11))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_txnocts != *((_QWORD *)a3 + 8))
        goto LABEL_61;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x800) == 0 || self->_txrts != *((_QWORD *)a3 + 12))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_txdeauth != *((_QWORD *)a3 + 6))
        goto LABEL_61;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_txassocreq != *((_QWORD *)a3 + 4))
        goto LABEL_61;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_txassocrsp != *((_QWORD *)a3 + 5))
        goto LABEL_61;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_txreassocreq != *((_QWORD *)a3 + 9))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x200) == 0 || self->_txreassocrsp != *((_QWORD *)a3 + 10))
        goto LABEL_61;
    }
    else if ((*((_WORD *)a3 + 52) & 0x200) != 0)
    {
      goto LABEL_61;
    }
    LOBYTE(v5) = (v7 & 1) == 0;
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_ctsnotrxafterrts != *((_QWORD *)a3 + 1))
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
  if ((has & 2) != 0)
  {
    v3 = 2654435761u * self->_rxframe;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_txframe;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_rxrtry;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_txretrans;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_txnocts;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_txrts;
    if ((has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_txdeauth;
    if ((has & 8) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_txassocreq;
    if ((has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_txassocrsp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_txreassocreq;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
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
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_24;
LABEL_12:
  v13 = 2654435761u * self->_txreassocrsp;
  if ((has & 1) == 0)
    goto LABEL_25;
LABEL_13:
  v14 = 2654435761u * self->_ctsnotrxafterrts;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 2) != 0)
  {
    self->_rxframe = *((_QWORD *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
    v3 = *((_WORD *)a3 + 52);
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_txframe = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_rxrtry = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x400) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_txretrans = *((_QWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_txnocts = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x800) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_txrts = *((_QWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 8) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_txdeauth = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 8) == 0)
  {
LABEL_9:
    if ((v3 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_txassocreq = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x10) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  self->_txassocrsp = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  self->_txreassocreq = *((_QWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x200) == 0)
  {
LABEL_12:
    if ((v3 & 1) == 0)
      return;
LABEL_25:
    self->_ctsnotrxafterrts = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    return;
  }
LABEL_24:
  self->_txreassocrsp = *((_QWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 52) & 1) != 0)
    goto LABEL_25;
}

- (unint64_t)rxframe
{
  return self->_rxframe;
}

- (unint64_t)txframe
{
  return self->_txframe;
}

- (unint64_t)rxrtry
{
  return self->_rxrtry;
}

- (unint64_t)txretrans
{
  return self->_txretrans;
}

- (unint64_t)txnocts
{
  return self->_txnocts;
}

- (unint64_t)txrts
{
  return self->_txrts;
}

- (unint64_t)txdeauth
{
  return self->_txdeauth;
}

- (unint64_t)txassocreq
{
  return self->_txassocreq;
}

- (unint64_t)txassocrsp
{
  return self->_txassocrsp;
}

- (unint64_t)txreassocreq
{
  return self->_txreassocreq;
}

- (unint64_t)txreassocrsp
{
  return self->_txreassocrsp;
}

- (unint64_t)ctsnotrxafterrts
{
  return self->_ctsnotrxafterrts;
}

@end
