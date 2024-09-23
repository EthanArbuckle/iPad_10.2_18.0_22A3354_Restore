@implementation AWDLibnetcoreTCPTFOStatsReport

- (void)setNumTfoCookieReq:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numTfoCookieReq = a3;
}

- (void)setHasNumTfoCookieReq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumTfoCookieReq
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumTfoCookieRcv:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numTfoCookieRcv = a3;
}

- (void)setHasNumTfoCookieRcv:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumTfoCookieRcv
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumTfoFallback:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numTfoFallback = a3;
}

- (void)setHasNumTfoFallback:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumTfoFallback
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumTfoSynDataSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numTfoSynDataSent = a3;
}

- (void)setHasNumTfoSynDataSent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNumTfoSynDataSent
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumTfoSynDataAcked:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numTfoSynDataAcked = a3;
}

- (void)setHasNumTfoSynDataAcked:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumTfoSynDataAcked
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumTfoSynDataRcv:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numTfoSynDataRcv = a3;
}

- (void)setHasNumTfoSynDataRcv:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumTfoSynDataRcv
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumTfoCookieReqRcv:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numTfoCookieReqRcv = a3;
}

- (void)setHasNumTfoCookieReqRcv:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumTfoCookieReqRcv
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumTfoCookieSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numTfoCookieSent = a3;
}

- (void)setHasNumTfoCookieSent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumTfoCookieSent
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumTfoCookieInvalid:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numTfoCookieInvalid = a3;
}

- (void)setHasNumTfoCookieInvalid:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasNumTfoCookieInvalid
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumTfoBlackholed:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_numTfoBlackholed = a3;
}

- (void)setHasNumTfoBlackholed:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasNumTfoBlackholed
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPTFOStatsReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLibnetcoreTCPTFOStatsReport description](&v3, sel_description), -[AWDLibnetcoreTCPTFOStatsReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numTfoCookieReq), CFSTR("numTfoCookieReq"));
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numTfoCookieRcv), CFSTR("numTfoCookieRcv"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numTfoFallback), CFSTR("numTfoFallback"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numTfoSynDataSent), CFSTR("numTfoSynDataSent"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numTfoSynDataAcked), CFSTR("numTfoSynDataAcked"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numTfoSynDataRcv), CFSTR("numTfoSynDataRcv"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numTfoCookieReqRcv), CFSTR("numTfoCookieReqRcv"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numTfoCookieInvalid), CFSTR("numTfoCookieInvalid"));
    if ((*(_WORD *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numTfoCookieSent), CFSTR("numTfoCookieSent"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 1) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numTfoBlackholed), CFSTR("numTfoBlackholed"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreTCPTFOStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      return;
LABEL_21:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 1) != 0)
    goto LABEL_21;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_numTfoCookieReq;
    *((_WORD *)a3 + 44) |= 8u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 3) = self->_numTfoCookieRcv;
  *((_WORD *)a3 + 44) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)a3 + 7) = self->_numTfoFallback;
  *((_WORD *)a3 + 44) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)a3 + 10) = self->_numTfoSynDataSent;
  *((_WORD *)a3 + 44) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)a3 + 8) = self->_numTfoSynDataAcked;
  *((_WORD *)a3 + 44) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 9) = self->_numTfoSynDataRcv;
  *((_WORD *)a3 + 44) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 5) = self->_numTfoCookieReqRcv;
  *((_WORD *)a3 + 44) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 6) = self->_numTfoCookieSent;
  *((_WORD *)a3 + 44) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      return;
LABEL_21:
    *((_QWORD *)a3 + 1) = self->_numTfoBlackholed;
    *((_WORD *)a3 + 44) |= 1u;
    return;
  }
LABEL_20:
  *((_QWORD *)a3 + 2) = self->_numTfoCookieInvalid;
  *((_WORD *)a3 + 44) |= 2u;
  if ((*(_WORD *)&self->_has & 1) != 0)
    goto LABEL_21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)result + 4) = self->_numTfoCookieReq;
    *((_WORD *)result + 44) |= 8u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 3) = self->_numTfoCookieRcv;
  *((_WORD *)result + 44) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 7) = self->_numTfoFallback;
  *((_WORD *)result + 44) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 10) = self->_numTfoSynDataSent;
  *((_WORD *)result + 44) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 8) = self->_numTfoSynDataAcked;
  *((_WORD *)result + 44) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 9) = self->_numTfoSynDataRcv;
  *((_WORD *)result + 44) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 5) = self->_numTfoCookieReqRcv;
  *((_WORD *)result + 44) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 6) = self->_numTfoCookieSent;
  *((_WORD *)result + 44) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      return result;
    goto LABEL_11;
  }
LABEL_21:
  *((_QWORD *)result + 2) = self->_numTfoCookieInvalid;
  *((_WORD *)result + 44) |= 2u;
  if ((*(_WORD *)&self->_has & 1) == 0)
    return result;
LABEL_11:
  *((_QWORD *)result + 1) = self->_numTfoBlackholed;
  *((_WORD *)result + 44) |= 1u;
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
    v7 = *((_WORD *)a3 + 44);
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_numTfoCookieReq != *((_QWORD *)a3 + 4))
        goto LABEL_51;
    }
    else if ((v7 & 8) != 0)
    {
LABEL_51:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_numTfoCookieRcv != *((_QWORD *)a3 + 3))
        goto LABEL_51;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_numTfoFallback != *((_QWORD *)a3 + 7))
        goto LABEL_51;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 44) & 0x200) == 0 || self->_numTfoSynDataSent != *((_QWORD *)a3 + 10))
        goto LABEL_51;
    }
    else if ((*((_WORD *)a3 + 44) & 0x200) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_numTfoSynDataAcked != *((_QWORD *)a3 + 8))
        goto LABEL_51;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 44) & 0x100) == 0 || self->_numTfoSynDataRcv != *((_QWORD *)a3 + 9))
        goto LABEL_51;
    }
    else if ((*((_WORD *)a3 + 44) & 0x100) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_numTfoCookieReqRcv != *((_QWORD *)a3 + 5))
        goto LABEL_51;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_numTfoCookieSent != *((_QWORD *)a3 + 6))
        goto LABEL_51;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_numTfoCookieInvalid != *((_QWORD *)a3 + 2))
        goto LABEL_51;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_51;
    }
    LOBYTE(v5) = (v7 & 1) == 0;
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_numTfoBlackholed != *((_QWORD *)a3 + 1))
        goto LABEL_51;
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

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v3 = 2654435761u * self->_numTfoCookieReq;
    if ((has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_numTfoCookieRcv;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_numTfoFallback;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_numTfoSynDataSent;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_numTfoSynDataAcked;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_numTfoSynDataRcv;
    if ((has & 0x10) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_numTfoCookieReqRcv;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_numTfoCookieSent;
    if ((has & 2) != 0)
      goto LABEL_10;
LABEL_20:
    v11 = 0;
    if ((has & 1) != 0)
      goto LABEL_11;
LABEL_21:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  v10 = 0;
  if ((has & 2) == 0)
    goto LABEL_20;
LABEL_10:
  v11 = 2654435761u * self->_numTfoCookieInvalid;
  if ((has & 1) == 0)
    goto LABEL_21;
LABEL_11:
  v12 = 2654435761u * self->_numTfoBlackholed;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 8) != 0)
  {
    self->_numTfoCookieReq = *((_QWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 8u;
    v3 = *((_WORD *)a3 + 44);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_numTfoCookieRcv = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_numTfoFallback = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x200) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_numTfoSynDataSent = *((_QWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_numTfoSynDataAcked = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_numTfoSynDataRcv = *((_QWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  self->_numTfoCookieReqRcv = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x20) == 0)
  {
LABEL_9:
    if ((v3 & 2) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  self->_numTfoCookieSent = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 44);
  if ((v3 & 2) == 0)
  {
LABEL_10:
    if ((v3 & 1) == 0)
      return;
LABEL_21:
    self->_numTfoBlackholed = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    return;
  }
LABEL_20:
  self->_numTfoCookieInvalid = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 44) & 1) != 0)
    goto LABEL_21;
}

- (unint64_t)numTfoCookieReq
{
  return self->_numTfoCookieReq;
}

- (unint64_t)numTfoCookieRcv
{
  return self->_numTfoCookieRcv;
}

- (unint64_t)numTfoFallback
{
  return self->_numTfoFallback;
}

- (unint64_t)numTfoSynDataSent
{
  return self->_numTfoSynDataSent;
}

- (unint64_t)numTfoSynDataAcked
{
  return self->_numTfoSynDataAcked;
}

- (unint64_t)numTfoSynDataRcv
{
  return self->_numTfoSynDataRcv;
}

- (unint64_t)numTfoCookieReqRcv
{
  return self->_numTfoCookieReqRcv;
}

- (unint64_t)numTfoCookieSent
{
  return self->_numTfoCookieSent;
}

- (unint64_t)numTfoCookieInvalid
{
  return self->_numTfoCookieInvalid;
}

- (unint64_t)numTfoBlackholed
{
  return self->_numTfoBlackholed;
}

@end
