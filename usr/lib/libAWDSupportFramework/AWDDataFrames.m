@implementation AWDDataFrames

- (void)setDataFrames:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_dataFrames = a3;
}

- (void)setHasDataFrames:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDataFrames
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDataCFack:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dataCFack = a3;
}

- (void)setHasDataCFack:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDataCFack
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDataCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_dataCFpoll = a3;
}

- (void)setHasDataCFpoll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDataCFpoll
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDataCFackCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dataCFackCFpoll = a3;
}

- (void)setHasDataCFackCFpoll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDataCFackCFpoll
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNull:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_null = a3;
}

- (void)setHasNull:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNull
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCFack:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_cFack = a3;
}

- (void)setHasCFack:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCFack
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cFpoll = a3;
}

- (void)setHasCFpoll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCFpoll
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCFackCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cFackCFpoll = a3;
}

- (void)setHasCFackCFpoll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCFackCFpoll
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setQoSdata:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_qoSdata = a3;
}

- (void)setHasQoSdata:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasQoSdata
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setQoSdataCFack:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_qoSdataCFack = a3;
}

- (void)setHasQoSdataCFack:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasQoSdataCFack
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setQoSdataCFackCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_qoSdataCFackCFpoll = a3;
}

- (void)setHasQoSdataCFackCFpoll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasQoSdataCFackCFpoll
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setQoSnull:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_qoSnull = a3;
}

- (void)setHasQoSnull:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasQoSnull
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setQoSnodataCFpoll:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_qoSnodataCFpoll = a3;
}

- (void)setHasQoSnodataCFpoll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasQoSnodataCFpoll
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setQoSnodataCFack:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_qoSnodataCFack = a3;
}

- (void)setHasQoSnodataCFack:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasQoSnodataCFack
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDDataFrames;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDDataFrames description](&v3, sel_description), -[AWDDataFrames dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_dataFrames), CFSTR("dataFrames"));
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_dataCFack), CFSTR("dataCFack"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_dataCFpoll), CFSTR("dataCFpoll"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_dataCFackCFpoll), CFSTR("dataCFackCFpoll"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_null), CFSTR("null"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cFack), CFSTR("CFack"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cFpoll), CFSTR("CFpoll"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cFackCFpoll), CFSTR("CFackCFpoll"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_qoSdata), CFSTR("QoSdata"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_qoSdataCFack), CFSTR("QoSdataCFack"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_qoSdataCFackCFpoll), CFSTR("QoSdataCFackCFpoll"));
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
LABEL_29:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_qoSnodataCFpoll), CFSTR("QoSnodataCFpoll"));
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      return v3;
    goto LABEL_15;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_qoSnull), CFSTR("QoSnull"));
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x800) != 0)
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_qoSnodataCFack), CFSTR("QoSnodataCFack"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDDataFramesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
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
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0)
      return;
LABEL_29:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    goto LABEL_29;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_QWORD *)a3 + 7) = self->_dataFrames;
    *((_WORD *)a3 + 60) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 4) = self->_dataCFack;
  *((_WORD *)a3 + 60) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 6) = self->_dataCFpoll;
  *((_WORD *)a3 + 60) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 5) = self->_dataCFackCFpoll;
  *((_WORD *)a3 + 60) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 8) = self->_null;
  *((_WORD *)a3 + 60) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 1) = self->_cFack;
  *((_WORD *)a3 + 60) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 3) = self->_cFpoll;
  *((_WORD *)a3 + 60) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 2) = self->_cFackCFpoll;
  *((_WORD *)a3 + 60) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)a3 + 9) = self->_qoSdata;
  *((_WORD *)a3 + 60) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)a3 + 10) = self->_qoSdataCFack;
  *((_WORD *)a3 + 60) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)a3 + 11) = self->_qoSdataCFackCFpoll;
  *((_WORD *)a3 + 60) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a3 + 14) = self->_qoSnull;
  *((_WORD *)a3 + 60) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0)
      return;
LABEL_29:
    *((_QWORD *)a3 + 12) = self->_qoSnodataCFack;
    *((_WORD *)a3 + 60) |= 0x800u;
    return;
  }
LABEL_28:
  *((_QWORD *)a3 + 13) = self->_qoSnodataCFpoll;
  *((_WORD *)a3 + 60) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    goto LABEL_29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_QWORD *)result + 7) = self->_dataFrames;
    *((_WORD *)result + 60) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = self->_dataCFack;
  *((_WORD *)result + 60) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 6) = self->_dataCFpoll;
  *((_WORD *)result + 60) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 5) = self->_dataCFackCFpoll;
  *((_WORD *)result + 60) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 8) = self->_null;
  *((_WORD *)result + 60) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 1) = self->_cFack;
  *((_WORD *)result + 60) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)result + 3) = self->_cFpoll;
  *((_WORD *)result + 60) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)result + 2) = self->_cFackCFpoll;
  *((_WORD *)result + 60) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)result + 9) = self->_qoSdata;
  *((_WORD *)result + 60) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)result + 10) = self->_qoSdataCFack;
  *((_WORD *)result + 60) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)result + 11) = self->_qoSdataCFackCFpoll;
  *((_WORD *)result + 60) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)result + 14) = self->_qoSnull;
  *((_WORD *)result + 60) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0)
      return result;
    goto LABEL_15;
  }
LABEL_29:
  *((_QWORD *)result + 13) = self->_qoSnodataCFpoll;
  *((_WORD *)result + 60) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    return result;
LABEL_15:
  *((_QWORD *)result + 12) = self->_qoSnodataCFack;
  *((_WORD *)result + 60) |= 0x800u;
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
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_dataFrames != *((_QWORD *)a3 + 7))
        goto LABEL_71;
    }
    else if ((v7 & 0x40) != 0)
    {
LABEL_71:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_dataCFack != *((_QWORD *)a3 + 4))
        goto LABEL_71;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_dataCFpoll != *((_QWORD *)a3 + 6))
        goto LABEL_71;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_dataCFackCFpoll != *((_QWORD *)a3 + 5))
        goto LABEL_71;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_null != *((_QWORD *)a3 + 8))
        goto LABEL_71;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_cFack != *((_QWORD *)a3 + 1))
        goto LABEL_71;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_cFpoll != *((_QWORD *)a3 + 3))
        goto LABEL_71;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_cFackCFpoll != *((_QWORD *)a3 + 2))
        goto LABEL_71;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x100) == 0 || self->_qoSdata != *((_QWORD *)a3 + 9))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 60) & 0x100) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x200) == 0 || self->_qoSdataCFack != *((_QWORD *)a3 + 10))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 60) & 0x200) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x400) == 0 || self->_qoSdataCFackCFpoll != *((_QWORD *)a3 + 11))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 60) & 0x400) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x2000) == 0 || self->_qoSnull != *((_QWORD *)a3 + 14))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 60) & 0x2000) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x1000) == 0 || self->_qoSnodataCFpoll != *((_QWORD *)a3 + 13))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 60) & 0x1000) != 0)
    {
      goto LABEL_71;
    }
    LOBYTE(v5) = (v7 & 0x800) == 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x800) == 0 || self->_qoSnodataCFack != *((_QWORD *)a3 + 12))
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
  if ((has & 0x40) != 0)
  {
    v3 = 2654435761u * self->_dataFrames;
    if ((has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_dataCFack;
      if ((has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_dataCFpoll;
    if ((has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_dataCFackCFpoll;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_null;
    if ((has & 1) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v7 = 0;
  if ((has & 1) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_cFack;
    if ((has & 4) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_cFpoll;
    if ((has & 2) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v9 = 0;
  if ((has & 2) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_cFackCFpoll;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_qoSdata;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_qoSdataCFack;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    v13 = 2654435761u * self->_qoSdataCFackCFpoll;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_13:
    v14 = 2654435761u * self->_qoSnull;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_14;
LABEL_28:
    v15 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_15;
LABEL_29:
    v16 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_27:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_28;
LABEL_14:
  v15 = 2654435761u * self->_qoSnodataCFpoll;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_29;
LABEL_15:
  v16 = 2654435761u * self->_qoSnodataCFack;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x40) != 0)
  {
    self->_dataFrames = *((_QWORD *)a3 + 7);
    *(_WORD *)&self->_has |= 0x40u;
    v3 = *((_WORD *)a3 + 60);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_dataCFack = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_dataCFpoll = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_dataCFackCFpoll = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_null = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 1) == 0)
  {
LABEL_7:
    if ((v3 & 4) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  self->_cFack = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 4) == 0)
  {
LABEL_8:
    if ((v3 & 2) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  self->_cFpoll = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 2) == 0)
  {
LABEL_9:
    if ((v3 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  self->_cFackCFpoll = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x100) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  self->_qoSdata = *((_QWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x200) == 0)
  {
LABEL_11:
    if ((v3 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  self->_qoSdataCFack = *((_QWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x400) == 0)
  {
LABEL_12:
    if ((v3 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  self->_qoSdataCFackCFpoll = *((_QWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x2000) == 0)
  {
LABEL_13:
    if ((v3 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  self->_qoSnull = *((_QWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x2000u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x1000) == 0)
  {
LABEL_14:
    if ((v3 & 0x800) == 0)
      return;
LABEL_29:
    self->_qoSnodataCFack = *((_QWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 0x800u;
    return;
  }
LABEL_28:
  self->_qoSnodataCFpoll = *((_QWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)a3 + 60) & 0x800) != 0)
    goto LABEL_29;
}

- (unint64_t)dataFrames
{
  return self->_dataFrames;
}

- (unint64_t)dataCFack
{
  return self->_dataCFack;
}

- (unint64_t)dataCFpoll
{
  return self->_dataCFpoll;
}

- (unint64_t)dataCFackCFpoll
{
  return self->_dataCFackCFpoll;
}

- (unint64_t)null
{
  return self->_null;
}

- (unint64_t)cFack
{
  return self->_cFack;
}

- (unint64_t)cFpoll
{
  return self->_cFpoll;
}

- (unint64_t)cFackCFpoll
{
  return self->_cFackCFpoll;
}

- (unint64_t)qoSdata
{
  return self->_qoSdata;
}

- (unint64_t)qoSdataCFack
{
  return self->_qoSdataCFack;
}

- (unint64_t)qoSdataCFackCFpoll
{
  return self->_qoSdataCFackCFpoll;
}

- (unint64_t)qoSnull
{
  return self->_qoSnull;
}

- (unint64_t)qoSnodataCFpoll
{
  return self->_qoSnodataCFpoll;
}

- (unint64_t)qoSnodataCFack
{
  return self->_qoSnodataCFack;
}

@end
