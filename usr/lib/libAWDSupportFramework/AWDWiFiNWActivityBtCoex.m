@implementation AWDWiFiNWActivityBtCoex

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiNWActivityBtCoex setBtrequestReason:](self, "setBtrequestReason:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityBtCoex;
  -[AWDWiFiNWActivityBtCoex dealloc](&v3, sel_dealloc);
}

- (void)setRequest:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_request = a3;
}

- (void)setHasRequest:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRequest
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setGrant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_grant = a3;
}

- (void)setHasGrant:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasGrant
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setBtabort:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_btabort = a3;
}

- (void)setHasBtabort:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBtabort
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPsnullretrycount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_psnullretrycount = a3;
}

- (void)setHasPsnullretrycount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPsnullretrycount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setUcodehighlatency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_ucodehighlatency = a3;
}

- (void)setHasUcodehighlatency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasUcodehighlatency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCts:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_cts = a3;
}

- (void)setHasCts:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCts
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setPm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_pm = a3;
}

- (void)setHasPm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPm
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setWlantxpreempt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_wlantxpreempt = a3;
}

- (void)setHasWlantxpreempt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasWlantxpreempt
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setWlanrxpreempt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_wlanrxpreempt = a3;
}

- (void)setHasWlanrxpreempt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasWlanrxpreempt
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setAptxafterpm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_aptxafterpm = a3;
}

- (void)setHasAptxafterpm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAptxafterpm
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAudiogrant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_audiogrant = a3;
}

- (void)setHasAudiogrant:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAudiogrant
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAudiodeny:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_audiodeny = a3;
}

- (void)setHasAudiodeny:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAudiodeny
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setA2dpgrant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_a2dpgrant = a3;
}

- (void)setHasA2dpgrant:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasA2dpgrant
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setA2dpdeny:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_a2dpdeny = a3;
}

- (void)setHasA2dpdeny:(BOOL)a3
{
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasA2dpdeny
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSniffgrant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_sniffgrant = a3;
}

- (void)setHasSniffgrant:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSniffgrant
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setSniffdeny:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_sniffdeny = a3;
}

- (void)setHasSniffdeny:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($50FC93E31E005817C4FDB043B4F0901D)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSniffdeny
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasBtrequestReason
{
  return self->_btrequestReason != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityBtCoex;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityBtCoex description](&v3, sel_description), -[AWDWiFiNWActivityBtCoex dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $50FC93E31E005817C4FDB043B4F0901D has;
  AWDWiFiNWActivityBtCoexReqestReason *btrequestReason;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_request), CFSTR("request"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_grant), CFSTR("grant"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_duration), CFSTR("duration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_btabort), CFSTR("btabort"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_psnullretrycount), CFSTR("psnullretrycount"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ucodehighlatency), CFSTR("ucodehighlatency"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cts), CFSTR("cts"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_pm), CFSTR("pm"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wlantxpreempt), CFSTR("wlantxpreempt"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wlanrxpreempt), CFSTR("wlanrxpreempt"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_aptxafterpm), CFSTR("aptxafterpm"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_audiogrant), CFSTR("audiogrant"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_audiodeny), CFSTR("audiodeny"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_a2dpgrant), CFSTR("a2dpgrant"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_a2dpdeny), CFSTR("a2dpdeny"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sniffgrant), CFSTR("sniffgrant"));
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_18:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sniffdeny), CFSTR("sniffdeny"));
LABEL_19:
  btrequestReason = self->_btrequestReason;
  if (btrequestReason)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityBtCoexReqestReason dictionaryRepresentation](btrequestReason, "dictionaryRepresentation"), CFSTR("btrequestReason"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityBtCoexReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $50FC93E31E005817C4FDB043B4F0901D has;

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_18:
    PBDataWriterWriteUint32Field();
LABEL_19:
  if (self->_btrequestReason)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  $50FC93E31E005817C4FDB043B4F0901D has;
  AWDWiFiNWActivityBtCoexReqestReason *btrequestReason;

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *((_DWORD *)a3 + 15) = self->_request;
    *((_DWORD *)a3 + 21) |= 0x800u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 12) = self->_grant;
  *((_DWORD *)a3 + 21) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 11) = self->_duration;
  *((_DWORD *)a3 + 21) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 7) = self->_btabort;
  *((_DWORD *)a3 + 21) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 14) = self->_psnullretrycount;
  *((_DWORD *)a3 + 21) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 18) = self->_ucodehighlatency;
  *((_DWORD *)a3 + 21) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 10) = self->_cts;
  *((_DWORD *)a3 + 21) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 13) = self->_pm;
  *((_DWORD *)a3 + 21) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 20) = self->_wlantxpreempt;
  *((_DWORD *)a3 + 21) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 19) = self->_wlanrxpreempt;
  *((_DWORD *)a3 + 21) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 4) = self->_aptxafterpm;
  *((_DWORD *)a3 + 21) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 6) = self->_audiogrant;
  *((_DWORD *)a3 + 21) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 5) = self->_audiodeny;
  *((_DWORD *)a3 + 21) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 3) = self->_a2dpgrant;
  *((_DWORD *)a3 + 21) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 2) = self->_a2dpdeny;
  *((_DWORD *)a3 + 21) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_36:
  *((_DWORD *)a3 + 17) = self->_sniffgrant;
  *((_DWORD *)a3 + 21) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    *((_DWORD *)a3 + 16) = self->_sniffdeny;
    *((_DWORD *)a3 + 21) |= 0x1000u;
  }
LABEL_19:
  btrequestReason = self->_btrequestReason;
  if (btrequestReason)
    objc_msgSend(a3, "setBtrequestReason:", btrequestReason);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  $50FC93E31E005817C4FDB043B4F0901D has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_request;
    *(_DWORD *)(v5 + 84) |= 0x800u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_grant;
  *(_DWORD *)(v5 + 84) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 44) = self->_duration;
  *(_DWORD *)(v5 + 84) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 28) = self->_btabort;
  *(_DWORD *)(v5 + 84) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 56) = self->_psnullretrycount;
  *(_DWORD *)(v5 + 84) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 72) = self->_ucodehighlatency;
  *(_DWORD *)(v5 + 84) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 40) = self->_cts;
  *(_DWORD *)(v5 + 84) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 52) = self->_pm;
  *(_DWORD *)(v5 + 84) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 80) = self->_wlantxpreempt;
  *(_DWORD *)(v5 + 84) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 76) = self->_wlanrxpreempt;
  *(_DWORD *)(v5 + 84) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 16) = self->_aptxafterpm;
  *(_DWORD *)(v5 + 84) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 24) = self->_audiogrant;
  *(_DWORD *)(v5 + 84) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v5 + 20) = self->_audiodeny;
  *(_DWORD *)(v5 + 84) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v5 + 12) = self->_a2dpgrant;
  *(_DWORD *)(v5 + 84) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
LABEL_35:
    *(_DWORD *)(v5 + 68) = self->_sniffgrant;
    *(_DWORD *)(v5 + 84) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  *(_DWORD *)(v5 + 8) = self->_a2dpdeny;
  *(_DWORD *)(v5 + 84) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_18:
    *(_DWORD *)(v5 + 64) = self->_sniffdeny;
    *(_DWORD *)(v5 + 84) |= 0x1000u;
  }
LABEL_19:

  v6[4] = -[AWDWiFiNWActivityBtCoexReqestReason copyWithZone:](self->_btrequestReason, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $50FC93E31E005817C4FDB043B4F0901D has;
  int v7;
  AWDWiFiNWActivityBtCoexReqestReason *btrequestReason;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 21);
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_request != *((_DWORD *)a3 + 15))
        goto LABEL_89;
    }
    else if ((v7 & 0x800) != 0)
    {
LABEL_89:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_grant != *((_DWORD *)a3 + 12))
        goto LABEL_89;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_duration != *((_DWORD *)a3 + 11))
        goto LABEL_89;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_btabort != *((_DWORD *)a3 + 7))
        goto LABEL_89;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_psnullretrycount != *((_DWORD *)a3 + 14))
        goto LABEL_89;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_ucodehighlatency != *((_DWORD *)a3 + 18))
        goto LABEL_89;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_cts != *((_DWORD *)a3 + 10))
        goto LABEL_89;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_pm != *((_DWORD *)a3 + 13))
        goto LABEL_89;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_wlantxpreempt != *((_DWORD *)a3 + 20))
        goto LABEL_89;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_wlanrxpreempt != *((_DWORD *)a3 + 19))
        goto LABEL_89;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_aptxafterpm != *((_DWORD *)a3 + 4))
        goto LABEL_89;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_audiogrant != *((_DWORD *)a3 + 6))
        goto LABEL_89;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_audiodeny != *((_DWORD *)a3 + 5))
        goto LABEL_89;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_a2dpgrant != *((_DWORD *)a3 + 3))
        goto LABEL_89;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_a2dpdeny != *((_DWORD *)a3 + 2))
        goto LABEL_89;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_sniffgrant != *((_DWORD *)a3 + 17))
        goto LABEL_89;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_sniffdeny != *((_DWORD *)a3 + 16))
        goto LABEL_89;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_89;
    }
    btrequestReason = self->_btrequestReason;
    if ((unint64_t)btrequestReason | *((_QWORD *)a3 + 4))
      LOBYTE(v5) = -[AWDWiFiNWActivityBtCoexReqestReason isEqual:](btrequestReason, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $50FC93E31E005817C4FDB043B4F0901D has;
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
  uint64_t v18;
  uint64_t v19;

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v3 = 2654435761 * self->_request;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_grant;
      if ((*(_BYTE *)&has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_duration;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_btabort;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v6 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_psnullretrycount;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v7 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_ucodehighlatency;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v8 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_cts;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v9 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_pm;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_wlantxpreempt;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v11 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_wlanrxpreempt;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v12 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_aptxafterpm;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v13 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_audiogrant;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v14 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_audiodeny;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v15 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_a2dpgrant;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  v16 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_a2dpdeny;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_17;
LABEL_34:
    v18 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_18;
LABEL_35:
    v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[AWDWiFiNWActivityBtCoexReqestReason hash](self->_btrequestReason, "hash");
  }
LABEL_33:
  v17 = 0;
  if ((*(_WORD *)&has & 0x2000) == 0)
    goto LABEL_34;
LABEL_17:
  v18 = 2654435761 * self->_sniffgrant;
  if ((*(_WORD *)&has & 0x1000) == 0)
    goto LABEL_35;
LABEL_18:
  v19 = 2654435761 * self->_sniffdeny;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[AWDWiFiNWActivityBtCoexReqestReason hash](self->_btrequestReason, "hash");
}

- (void)mergeFrom:(id)a3
{
  int v3;
  uint64_t v4;

  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 0x800) != 0)
  {
    self->_request = *((_DWORD *)a3 + 15);
    *(_DWORD *)&self->_has |= 0x800u;
    v3 = *((_DWORD *)a3 + 21);
    if ((v3 & 0x100) == 0)
    {
LABEL_3:
      if ((v3 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((v3 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_grant = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x100u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 0x80) == 0)
  {
LABEL_4:
    if ((v3 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  self->_duration = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x80u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 0x20) == 0)
  {
LABEL_5:
    if ((v3 & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  self->_btabort = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 0x400) == 0)
  {
LABEL_6:
    if ((v3 & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  self->_psnullretrycount = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x400u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 0x4000) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  self->_ucodehighlatency = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  self->_cts = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 0x200) == 0)
  {
LABEL_9:
    if ((v3 & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  self->_pm = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 0x10000) == 0)
  {
LABEL_10:
    if ((v3 & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  self->_wlantxpreempt = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 0x8000) == 0)
  {
LABEL_11:
    if ((v3 & 4) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  self->_wlanrxpreempt = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x8000u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 4) == 0)
  {
LABEL_12:
    if ((v3 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  self->_aptxafterpm = *((_DWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 0x10) == 0)
  {
LABEL_13:
    if ((v3 & 8) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  self->_audiogrant = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 8) == 0)
  {
LABEL_14:
    if ((v3 & 2) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  self->_audiodeny = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 2) == 0)
  {
LABEL_15:
    if ((v3 & 1) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  self->_a2dpgrant = *((_DWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 2u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 1) == 0)
  {
LABEL_16:
    if ((v3 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  self->_a2dpdeny = *((_DWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 1u;
  v3 = *((_DWORD *)a3 + 21);
  if ((v3 & 0x2000) == 0)
  {
LABEL_17:
    if ((v3 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_37:
  self->_sniffgrant = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)a3 + 21) & 0x1000) != 0)
  {
LABEL_18:
    self->_sniffdeny = *((_DWORD *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_19:
  v4 = *((_QWORD *)a3 + 4);
  if (self->_btrequestReason)
  {
    if (v4)
      -[AWDWiFiNWActivityBtCoexReqestReason mergeFrom:](self->_btrequestReason, "mergeFrom:");
  }
  else if (v4)
  {
    -[AWDWiFiNWActivityBtCoex setBtrequestReason:](self, "setBtrequestReason:");
  }
}

- (unsigned)request
{
  return self->_request;
}

- (unsigned)grant
{
  return self->_grant;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)btabort
{
  return self->_btabort;
}

- (unsigned)psnullretrycount
{
  return self->_psnullretrycount;
}

- (unsigned)ucodehighlatency
{
  return self->_ucodehighlatency;
}

- (unsigned)cts
{
  return self->_cts;
}

- (unsigned)pm
{
  return self->_pm;
}

- (unsigned)wlantxpreempt
{
  return self->_wlantxpreempt;
}

- (unsigned)wlanrxpreempt
{
  return self->_wlanrxpreempt;
}

- (unsigned)aptxafterpm
{
  return self->_aptxafterpm;
}

- (unsigned)audiogrant
{
  return self->_audiogrant;
}

- (unsigned)audiodeny
{
  return self->_audiodeny;
}

- (unsigned)a2dpgrant
{
  return self->_a2dpgrant;
}

- (unsigned)a2dpdeny
{
  return self->_a2dpdeny;
}

- (unsigned)sniffgrant
{
  return self->_sniffgrant;
}

- (unsigned)sniffdeny
{
  return self->_sniffdeny;
}

- (AWDWiFiNWActivityBtCoexReqestReason)btrequestReason
{
  return self->_btrequestReason;
}

- (void)setBtrequestReason:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
