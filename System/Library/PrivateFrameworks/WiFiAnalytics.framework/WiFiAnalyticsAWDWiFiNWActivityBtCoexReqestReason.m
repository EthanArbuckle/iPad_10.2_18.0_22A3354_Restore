@implementation WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason

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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason;
  -[WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReason dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_acl);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("acl"));

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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sco);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sco"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_esco);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("esco"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_a2dp);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("a2dp"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sniff);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("sniff"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_pagescan);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("pagescan"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_inquiryscan);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("inquiryscan"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_page);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("page"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_inquiry);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("inquiry"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mss);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("mss"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_park);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("park"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_blescan);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("blescan"));

    if ((*(_WORD *)&self->_has & 0x100) == 0)
      return v3;
    goto LABEL_15;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ble);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("ble"));

  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x100) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_other);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("other"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityBtCoexReqestReasonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
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
      goto LABEL_19;
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
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
LABEL_29:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x100) != 0)
LABEL_15:
    PBDataWriterWriteUint32Field();
LABEL_16:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_acl;
    *((_WORD *)v4 + 32) |= 2u;
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
  v4[14] = self->_sco;
  *((_WORD *)v4 + 32) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  v4[6] = self->_esco;
  *((_WORD *)v4 + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  v4[2] = self->_a2dp;
  *((_WORD *)v4 + 32) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  v4[15] = self->_sniff;
  *((_WORD *)v4 + 32) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  v4[12] = self->_pagescan;
  *((_WORD *)v4 + 32) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  v4[8] = self->_inquiryscan;
  *((_WORD *)v4 + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  v4[11] = self->_page;
  *((_WORD *)v4 + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  v4[7] = self->_inquiry;
  *((_WORD *)v4 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  v4[9] = self->_mss;
  *((_WORD *)v4 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  v4[13] = self->_park;
  *((_WORD *)v4 + 32) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
LABEL_29:
    v4[5] = self->_blescan;
    *((_WORD *)v4 + 32) |= 8u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  v4[4] = self->_ble;
  *((_WORD *)v4 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x100) != 0)
  {
LABEL_15:
    v4[10] = self->_other;
    *((_WORD *)v4 + 32) |= 0x100u;
  }
LABEL_16:

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
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_72;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 32);
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_acl != *((_DWORD *)v4 + 3))
      goto LABEL_72;
  }
  else if ((v6 & 2) != 0)
  {
LABEL_72:
    v7 = 0;
    goto LABEL_73;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x1000) == 0 || self->_sco != *((_DWORD *)v4 + 14))
      goto LABEL_72;
  }
  else if ((*((_WORD *)v4 + 32) & 0x1000) != 0)
  {
    goto LABEL_72;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_esco != *((_DWORD *)v4 + 6))
      goto LABEL_72;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_72;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_a2dp != *((_DWORD *)v4 + 2))
      goto LABEL_72;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_72;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x2000) == 0 || self->_sniff != *((_DWORD *)v4 + 15))
      goto LABEL_72;
  }
  else if ((*((_WORD *)v4 + 32) & 0x2000) != 0)
  {
    goto LABEL_72;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x400) == 0 || self->_pagescan != *((_DWORD *)v4 + 12))
      goto LABEL_72;
  }
  else if ((*((_WORD *)v4 + 32) & 0x400) != 0)
  {
    goto LABEL_72;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_inquiryscan != *((_DWORD *)v4 + 8))
      goto LABEL_72;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_72;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0 || self->_page != *((_DWORD *)v4 + 11))
      goto LABEL_72;
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_72;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_inquiry != *((_DWORD *)v4 + 7))
      goto LABEL_72;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_72;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_mss != *((_DWORD *)v4 + 9))
      goto LABEL_72;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_72;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x800) == 0 || self->_park != *((_DWORD *)v4 + 13))
      goto LABEL_72;
  }
  else if ((*((_WORD *)v4 + 32) & 0x800) != 0)
  {
    goto LABEL_72;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_ble != *((_DWORD *)v4 + 4))
      goto LABEL_72;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_72;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_blescan != *((_DWORD *)v4 + 5))
      goto LABEL_72;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_72;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_other != *((_DWORD *)v4 + 10))
      goto LABEL_72;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x100) == 0;
  }
LABEL_73:

  return v7;
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
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_acl = *((_DWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)v4 + 32);
    if ((v5 & 0x1000) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_sco = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  self->_esco = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  self->_a2dp = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  self->_sniff = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x400) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  self->_pagescan = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  self->_inquiryscan = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  self->_page = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  self->_inquiry = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  self->_mss = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  self->_park = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_13:
    if ((v5 & 8) == 0)
      goto LABEL_14;
LABEL_29:
    self->_blescan = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v4 + 32) & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  self->_ble = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 8) != 0)
    goto LABEL_29;
LABEL_14:
  if ((v5 & 0x100) != 0)
  {
LABEL_15:
    self->_other = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_16:

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
