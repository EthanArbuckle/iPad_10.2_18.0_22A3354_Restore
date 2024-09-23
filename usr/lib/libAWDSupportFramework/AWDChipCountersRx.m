@implementation AWDChipCountersRx

- (void)setRxframe:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_rxframe = a3;
}

- (void)setHasRxframe:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRxframe
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRxbyte:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_rxbyte = a3;
}

- (void)setHasRxbyte:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasRxbyte
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setRxerror:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_rxerror = a3;
}

- (void)setHasRxerror:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasRxerror
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setRxctl:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_rxctl = a3;
}

- (void)setHasRxctl:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasRxctl
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRxnobuf:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_rxnobuf = a3;
}

- (void)setHasRxnobuf:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRxnobuf
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRxrtry:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_rxrtry = a3;
}

- (void)setHasRxrtry:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRxrtry
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setRxnondata:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rxnondata = a3;
}

- (void)setHasRxnondata:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRxnondata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRxbadds:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_rxbadds = a3;
}

- (void)setHasRxbadds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasRxbadds
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRxbadcm:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_rxbadcm = a3;
}

- (void)setHasRxbadcm:(BOOL)a3
{
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasRxbadcm
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRxfragerr:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rxfragerr = a3;
}

- (void)setHasRxfragerr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRxfragerr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRxrunt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_rxrunt = a3;
}

- (void)setHasRxrunt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRxrunt
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setRxgiant:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_rxgiant = a3;
}

- (void)setHasRxgiant:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRxgiant
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRxnoscb:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rxnoscb = a3;
}

- (void)setHasRxnoscb:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRxnoscb
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRxbadproto:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_rxbadproto = a3;
}

- (void)setHasRxbadproto:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasRxbadproto
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRxbadsrcmac:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_rxbadsrcmac = a3;
}

- (void)setHasRxbadsrcmac:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasRxbadsrcmac
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRxbadda:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_rxbadda = a3;
}

- (void)setHasRxbadda:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasRxbadda
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRxfilter:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_rxfilter = a3;
}

- (void)setHasRxfilter:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($5146D2D40FA8CC3C8062BA4445AD9EBA)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRxfilter
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDChipCountersRx;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDChipCountersRx description](&v3, sel_description), -[AWDChipCountersRx dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxframe), CFSTR("rxframe"));
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxbyte), CFSTR("rxbyte"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxerror), CFSTR("rxerror"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxctl), CFSTR("rxctl"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxnobuf), CFSTR("rxnobuf"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxrtry), CFSTR("rxrtry"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxnondata), CFSTR("rxnondata"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxbadds), CFSTR("rxbadds"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxbadcm), CFSTR("rxbadcm"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxfragerr), CFSTR("rxfragerr"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxrunt), CFSTR("rxrunt"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxgiant), CFSTR("rxgiant"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxnoscb), CFSTR("rxnoscb"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxbadproto), CFSTR("rxbadproto"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
LABEL_35:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxbadda), CFSTR("rxbadda"));
    if ((*(_DWORD *)&self->_has & 0x100) == 0)
      return v3;
    goto LABEL_18;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxbadsrcmac), CFSTR("rxbadsrcmac"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_WORD *)&has & 0x100) != 0)
LABEL_18:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rxfilter), CFSTR("rxfilter"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDChipCountersRxReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $5146D2D40FA8CC3C8062BA4445AD9EBA has;

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0)
      return;
LABEL_35:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
    goto LABEL_35;
}

- (void)copyTo:(id)a3
{
  $5146D2D40FA8CC3C8062BA4445AD9EBA has;

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((_QWORD *)a3 + 11) = self->_rxframe;
    *((_DWORD *)a3 + 36) |= 0x400u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 6) = self->_rxbyte;
  *((_DWORD *)a3 + 36) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 8) = self->_rxerror;
  *((_DWORD *)a3 + 36) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 7) = self->_rxctl;
  *((_DWORD *)a3 + 36) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 13) = self->_rxnobuf;
  *((_DWORD *)a3 + 36) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)a3 + 16) = self->_rxrtry;
  *((_DWORD *)a3 + 36) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)a3 + 14) = self->_rxnondata;
  *((_DWORD *)a3 + 36) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)a3 + 3) = self->_rxbadds;
  *((_DWORD *)a3 + 36) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a3 + 1) = self->_rxbadcm;
  *((_DWORD *)a3 + 36) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)a3 + 10) = self->_rxfragerr;
  *((_DWORD *)a3 + 36) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)a3 + 17) = self->_rxrunt;
  *((_DWORD *)a3 + 36) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)a3 + 12) = self->_rxgiant;
  *((_DWORD *)a3 + 36) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)a3 + 15) = self->_rxnoscb;
  *((_DWORD *)a3 + 36) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)a3 + 4) = self->_rxbadproto;
  *((_DWORD *)a3 + 36) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)a3 + 5) = self->_rxbadsrcmac;
  *((_DWORD *)a3 + 36) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0)
      return;
LABEL_35:
    *((_QWORD *)a3 + 9) = self->_rxfilter;
    *((_DWORD *)a3 + 36) |= 0x100u;
    return;
  }
LABEL_34:
  *((_QWORD *)a3 + 2) = self->_rxbadda;
  *((_DWORD *)a3 + 36) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
    goto LABEL_35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((_QWORD *)result + 11) = self->_rxframe;
    *((_DWORD *)result + 36) |= 0x400u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 6) = self->_rxbyte;
  *((_DWORD *)result + 36) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 8) = self->_rxerror;
  *((_DWORD *)result + 36) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)result + 7) = self->_rxctl;
  *((_DWORD *)result + 36) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)result + 13) = self->_rxnobuf;
  *((_DWORD *)result + 36) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)result + 16) = self->_rxrtry;
  *((_DWORD *)result + 36) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)result + 14) = self->_rxnondata;
  *((_DWORD *)result + 36) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)result + 3) = self->_rxbadds;
  *((_DWORD *)result + 36) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)result + 1) = self->_rxbadcm;
  *((_DWORD *)result + 36) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)result + 10) = self->_rxfragerr;
  *((_DWORD *)result + 36) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)result + 17) = self->_rxrunt;
  *((_DWORD *)result + 36) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)result + 12) = self->_rxgiant;
  *((_DWORD *)result + 36) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)result + 15) = self->_rxnoscb;
  *((_DWORD *)result + 36) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)result + 4) = self->_rxbadproto;
  *((_DWORD *)result + 36) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)result + 5) = self->_rxbadsrcmac;
  *((_DWORD *)result + 36) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0)
      return result;
    goto LABEL_18;
  }
LABEL_35:
  *((_QWORD *)result + 2) = self->_rxbadda;
  *((_DWORD *)result + 36) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x100) == 0)
    return result;
LABEL_18:
  *((_QWORD *)result + 9) = self->_rxfilter;
  *((_DWORD *)result + 36) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $5146D2D40FA8CC3C8062BA4445AD9EBA has;
  int v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 36);
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_rxframe != *((_QWORD *)a3 + 11))
        goto LABEL_86;
    }
    else if ((v7 & 0x400) != 0)
    {
LABEL_86:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_rxbyte != *((_QWORD *)a3 + 6))
        goto LABEL_86;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_rxerror != *((_QWORD *)a3 + 8))
        goto LABEL_86;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_rxctl != *((_QWORD *)a3 + 7))
        goto LABEL_86;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_rxnobuf != *((_QWORD *)a3 + 13))
        goto LABEL_86;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_rxrtry != *((_QWORD *)a3 + 16))
        goto LABEL_86;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_rxnondata != *((_QWORD *)a3 + 14))
        goto LABEL_86;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_rxbadds != *((_QWORD *)a3 + 3))
        goto LABEL_86;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_rxbadcm != *((_QWORD *)a3 + 1))
        goto LABEL_86;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_rxfragerr != *((_QWORD *)a3 + 10))
        goto LABEL_86;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_rxrunt != *((_QWORD *)a3 + 17))
        goto LABEL_86;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_rxgiant != *((_QWORD *)a3 + 12))
        goto LABEL_86;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_rxnoscb != *((_QWORD *)a3 + 15))
        goto LABEL_86;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_rxbadproto != *((_QWORD *)a3 + 4))
        goto LABEL_86;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_rxbadsrcmac != *((_QWORD *)a3 + 5))
        goto LABEL_86;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_rxbadda != *((_QWORD *)a3 + 2))
        goto LABEL_86;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_86;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 36) & 0x100) == 0;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_rxfilter != *((_QWORD *)a3 + 9))
        goto LABEL_86;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $5146D2D40FA8CC3C8062BA4445AD9EBA has;
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
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v3 = 2654435761u * self->_rxframe;
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_rxbyte;
      if ((*(_BYTE *)&has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_rxerror;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_rxctl;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v6 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_rxnobuf;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v7 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_rxrtry;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v8 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_rxnondata;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v9 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_rxbadds;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v10 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_rxbadcm;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v11 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_rxfragerr;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_12:
    v13 = 2654435761u * self->_rxrunt;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v13 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    v14 = 2654435761u * self->_rxgiant;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v14 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_14:
    v15 = 2654435761u * self->_rxnoscb;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v15 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_15:
    v16 = 2654435761u * self->_rxbadproto;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  v16 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_16:
    v17 = 2654435761u * self->_rxbadsrcmac;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_17;
LABEL_34:
    v18 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_18;
LABEL_35:
    v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_33:
  v17 = 0;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_34;
LABEL_17:
  v18 = 2654435761u * self->_rxbadda;
  if ((*(_WORD *)&has & 0x100) == 0)
    goto LABEL_35;
LABEL_18:
  v19 = 2654435761u * self->_rxfilter;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  int v3;

  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x400) != 0)
  {
    self->_rxframe = *((_QWORD *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x400u;
    v3 = *((_DWORD *)a3 + 36);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_rxbyte = *((_QWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x80) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  self->_rxerror = *((_QWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  self->_rxctl = *((_QWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x1000) == 0)
  {
LABEL_6:
    if ((v3 & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  self->_rxnobuf = *((_QWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x8000) == 0)
  {
LABEL_7:
    if ((v3 & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  self->_rxrtry = *((_QWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x2000) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  self->_rxnondata = *((_QWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 4) == 0)
  {
LABEL_9:
    if ((v3 & 1) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  self->_rxbadds = *((_QWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  self->_rxbadcm = *((_QWORD *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x200) == 0)
  {
LABEL_11:
    if ((v3 & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  self->_rxfragerr = *((_QWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x10000) == 0)
  {
LABEL_12:
    if ((v3 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  self->_rxrunt = *((_QWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x800) == 0)
  {
LABEL_13:
    if ((v3 & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  self->_rxgiant = *((_QWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x4000) == 0)
  {
LABEL_14:
    if ((v3 & 8) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  self->_rxnoscb = *((_QWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 8) == 0)
  {
LABEL_15:
    if ((v3 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  self->_rxbadproto = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 0x10) == 0)
  {
LABEL_16:
    if ((v3 & 2) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  self->_rxbadsrcmac = *((_QWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 36);
  if ((v3 & 2) == 0)
  {
LABEL_17:
    if ((v3 & 0x100) == 0)
      return;
LABEL_35:
    self->_rxfilter = *((_QWORD *)a3 + 9);
    *(_DWORD *)&self->_has |= 0x100u;
    return;
  }
LABEL_34:
  self->_rxbadda = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 36) & 0x100) != 0)
    goto LABEL_35;
}

- (unint64_t)rxframe
{
  return self->_rxframe;
}

- (unint64_t)rxbyte
{
  return self->_rxbyte;
}

- (unint64_t)rxerror
{
  return self->_rxerror;
}

- (unint64_t)rxctl
{
  return self->_rxctl;
}

- (unint64_t)rxnobuf
{
  return self->_rxnobuf;
}

- (unint64_t)rxrtry
{
  return self->_rxrtry;
}

- (unint64_t)rxnondata
{
  return self->_rxnondata;
}

- (unint64_t)rxbadds
{
  return self->_rxbadds;
}

- (unint64_t)rxbadcm
{
  return self->_rxbadcm;
}

- (unint64_t)rxfragerr
{
  return self->_rxfragerr;
}

- (unint64_t)rxrunt
{
  return self->_rxrunt;
}

- (unint64_t)rxgiant
{
  return self->_rxgiant;
}

- (unint64_t)rxnoscb
{
  return self->_rxnoscb;
}

- (unint64_t)rxbadproto
{
  return self->_rxbadproto;
}

- (unint64_t)rxbadsrcmac
{
  return self->_rxbadsrcmac;
}

- (unint64_t)rxbadda
{
  return self->_rxbadda;
}

- (unint64_t)rxfilter
{
  return self->_rxfilter;
}

@end
