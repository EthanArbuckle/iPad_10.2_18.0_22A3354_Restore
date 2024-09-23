@implementation AWDWiFiNWActivityBtCoexReqestReason

- (void)setAcl:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_acl = a3;
}

- (void)setHasAcl:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAcl
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSco:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_sco = a3;
}

- (void)setHasSco:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSco
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setEsco:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_esco = a3;
}

- (void)setHasEsco:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasEsco
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setA2dp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_a2dp = a3;
}

- (void)setHasA2dp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasA2dp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSniff:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_sniff = a3;
}

- (void)setHasSniff:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSniff
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setPagescan:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_pagescan = a3;
}

- (void)setHasPagescan:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPagescan
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setInquiryscan:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_inquiryscan = a3;
}

- (void)setHasInquiryscan:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasInquiryscan
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_page = a3;
}

- (void)setHasPage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPage
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setInquiry:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_inquiry = a3;
}

- (void)setHasInquiry:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasInquiry
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMss:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mss = a3;
}

- (void)setHasMss:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMss
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPark:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_park = a3;
}

- (void)setHasPark:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasPark
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setBle:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ble = a3;
}

- (void)setHasBle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBle
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setBlescan:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_blescan = a3;
}

- (void)setHasBlescan:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBlescan
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setOther:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_other = a3;
}

- (void)setHasOther:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasOther
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityBtCoexReqestReason;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityBtCoexReqestReason description](&v3, sel_description), -[AWDWiFiNWActivityBtCoexReqestReason dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_acl), CFSTR("acl"));
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sco), CFSTR("sco"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_esco), CFSTR("esco"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_a2dp), CFSTR("a2dp"));
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sniff), CFSTR("sniff"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_pagescan), CFSTR("pagescan"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_inquiryscan), CFSTR("inquiryscan"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_page), CFSTR("page"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_inquiry), CFSTR("inquiry"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mss), CFSTR("mss"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_park), CFSTR("park"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
LABEL_29:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_blescan), CFSTR("blescan"));
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      return v3;
    goto LABEL_15;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ble), CFSTR("ble"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x100) != 0)
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_other), CFSTR("other"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityBtCoexReqestReasonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      return;
LABEL_29:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    goto LABEL_29;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_acl;
    *((_WORD *)a3 + 32) |= 2u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 14) = self->_sco;
  *((_WORD *)a3 + 32) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 6) = self->_esco;
  *((_WORD *)a3 + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 2) = self->_a2dp;
  *((_WORD *)a3 + 32) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 15) = self->_sniff;
  *((_WORD *)a3 + 32) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 12) = self->_pagescan;
  *((_WORD *)a3 + 32) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 8) = self->_inquiryscan;
  *((_WORD *)a3 + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 11) = self->_page;
  *((_WORD *)a3 + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 7) = self->_inquiry;
  *((_WORD *)a3 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 9) = self->_mss;
  *((_WORD *)a3 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 13) = self->_park;
  *((_WORD *)a3 + 32) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 4) = self->_ble;
  *((_WORD *)a3 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      return;
LABEL_29:
    *((_DWORD *)a3 + 10) = self->_other;
    *((_WORD *)a3 + 32) |= 0x100u;
    return;
  }
LABEL_28:
  *((_DWORD *)a3 + 5) = self->_blescan;
  *((_WORD *)a3 + 32) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    goto LABEL_29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_acl;
    *((_WORD *)result + 32) |= 2u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 14) = self->_sco;
  *((_WORD *)result + 32) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 6) = self->_esco;
  *((_WORD *)result + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 2) = self->_a2dp;
  *((_WORD *)result + 32) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 15) = self->_sniff;
  *((_WORD *)result + 32) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 12) = self->_pagescan;
  *((_WORD *)result + 32) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 8) = self->_inquiryscan;
  *((_WORD *)result + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 11) = self->_page;
  *((_WORD *)result + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 7) = self->_inquiry;
  *((_WORD *)result + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 9) = self->_mss;
  *((_WORD *)result + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 13) = self->_park;
  *((_WORD *)result + 32) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 4) = self->_ble;
  *((_WORD *)result + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      return result;
    goto LABEL_15;
  }
LABEL_29:
  *((_DWORD *)result + 5) = self->_blescan;
  *((_WORD *)result + 32) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    return result;
LABEL_15:
  *((_DWORD *)result + 10) = self->_other;
  *((_WORD *)result + 32) |= 0x100u;
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
    v7 = *((_WORD *)a3 + 32);
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_acl != *((_DWORD *)a3 + 3))
        goto LABEL_71;
    }
    else if ((v7 & 2) != 0)
    {
LABEL_71:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x1000) == 0 || self->_sco != *((_DWORD *)a3 + 14))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 32) & 0x1000) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_esco != *((_DWORD *)a3 + 6))
        goto LABEL_71;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_a2dp != *((_DWORD *)a3 + 2))
        goto LABEL_71;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x2000) == 0 || self->_sniff != *((_DWORD *)a3 + 15))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 32) & 0x2000) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x400) == 0 || self->_pagescan != *((_DWORD *)a3 + 12))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 32) & 0x400) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_inquiryscan != *((_DWORD *)a3 + 8))
        goto LABEL_71;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x200) == 0 || self->_page != *((_DWORD *)a3 + 11))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 32) & 0x200) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_inquiry != *((_DWORD *)a3 + 7))
        goto LABEL_71;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_mss != *((_DWORD *)a3 + 9))
        goto LABEL_71;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_71;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x800) == 0 || self->_park != *((_DWORD *)a3 + 13))
        goto LABEL_71;
    }
    else if ((*((_WORD *)a3 + 32) & 0x800) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_ble != *((_DWORD *)a3 + 4))
        goto LABEL_71;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_71;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_blescan != *((_DWORD *)a3 + 5))
        goto LABEL_71;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_71;
    }
    LOBYTE(v5) = (v7 & 0x100) == 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x100) == 0 || self->_other != *((_DWORD *)a3 + 10))
        goto LABEL_71;
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

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v3 = 2654435761 * self->_acl;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_sco;
      if ((has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_esco;
    if ((has & 1) != 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v5 = 0;
  if ((has & 1) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_a2dp;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_sniff;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_pagescan;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_inquiryscan;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_page;
    if ((has & 0x20) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v10 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_inquiry;
    if ((has & 0x80) != 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v11 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_mss;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_park;
    if ((has & 4) != 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  v13 = 0;
  if ((has & 4) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_ble;
    if ((has & 8) != 0)
      goto LABEL_14;
LABEL_28:
    v15 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_15;
LABEL_29:
    v16 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_27:
  v14 = 0;
  if ((has & 8) == 0)
    goto LABEL_28;
LABEL_14:
  v15 = 2654435761 * self->_blescan;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_29;
LABEL_15:
  v16 = 2654435761 * self->_other;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 2) != 0)
  {
    self->_acl = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    v3 = *((_WORD *)a3 + 32);
    if ((v3 & 0x1000) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*((_WORD *)a3 + 32) & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_sco = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_esco = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_a2dp = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x2000) == 0)
  {
LABEL_6:
    if ((v3 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_sniff = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x2000u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x400) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  self->_pagescan = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  self->_inquiryscan = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x200) == 0)
  {
LABEL_9:
    if ((v3 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  self->_page = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x20) == 0)
  {
LABEL_10:
    if ((v3 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  self->_inquiry = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x80) == 0)
  {
LABEL_11:
    if ((v3 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  self->_mss = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x800) == 0)
  {
LABEL_12:
    if ((v3 & 4) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  self->_park = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 4) == 0)
  {
LABEL_13:
    if ((v3 & 8) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  self->_ble = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 8) == 0)
  {
LABEL_14:
    if ((v3 & 0x100) == 0)
      return;
LABEL_29:
    self->_other = *((_DWORD *)a3 + 10);
    *(_WORD *)&self->_has |= 0x100u;
    return;
  }
LABEL_28:
  self->_blescan = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 32) & 0x100) != 0)
    goto LABEL_29;
}

- (unsigned)acl
{
  return self->_acl;
}

- (unsigned)sco
{
  return self->_sco;
}

- (unsigned)esco
{
  return self->_esco;
}

- (unsigned)a2dp
{
  return self->_a2dp;
}

- (unsigned)sniff
{
  return self->_sniff;
}

- (unsigned)pagescan
{
  return self->_pagescan;
}

- (unsigned)inquiryscan
{
  return self->_inquiryscan;
}

- (unsigned)page
{
  return self->_page;
}

- (unsigned)inquiry
{
  return self->_inquiry;
}

- (unsigned)mss
{
  return self->_mss;
}

- (unsigned)park
{
  return self->_park;
}

- (unsigned)ble
{
  return self->_ble;
}

- (unsigned)blescan
{
  return self->_blescan;
}

- (unsigned)other
{
  return self->_other;
}

@end
