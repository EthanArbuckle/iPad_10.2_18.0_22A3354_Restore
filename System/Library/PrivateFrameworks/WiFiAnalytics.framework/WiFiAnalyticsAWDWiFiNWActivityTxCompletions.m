@implementation WiFiAnalyticsAWDWiFiNWActivityTxCompletions

- (void)setSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSuccess
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setExpired:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_expired = a3;
}

- (void)setHasExpired:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasExpired
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNobuf:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_nobuf = a3;
}

- (void)setHasNobuf:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNobuf
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNoack:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_noack = a3;
}

- (void)setHasNoack:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNoack
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTxfailure:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txfailure = a3;
}

- (void)setHasTxfailure:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxfailure
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNoresources:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_noresources = a3;
}

- (void)setHasNoresources:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNoresources
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIoerror:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_ioerror = a3;
}

- (void)setHasIoerror:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIoerror
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setMbfree:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mbfree = a3;
}

- (void)setHasMbfree:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMbfree
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setChipmodeerror:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_chipmodeerror = a3;
}

- (void)setHasChipmodeerror:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasChipmodeerror
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNoremotepeer:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_noremotepeer = a3;
}

- (void)setHasNoremotepeer:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNoremotepeer
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setInternalerror:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_internalerror = a3;
}

- (void)setHasInternalerror:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInternalerror
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityTxCompletions;
  -[WiFiAnalyticsAWDWiFiNWActivityTxCompletions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityTxCompletions dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_success);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("success"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_expired);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("expired"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nobuf);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("nobuf"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_noack);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("noack"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txfailure);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("txfailure"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_noresources);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("noresources"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ioerror);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("ioerror"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mbfree);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("mbfree"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
LABEL_23:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_noremotepeer);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("noremotepeer"));

    if ((*(_WORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chipmodeerror);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("chipmodeerror"));

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 4) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_internalerror);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("internalerror"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityTxCompletionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
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
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
LABEL_23:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 4) != 0)
LABEL_12:
    PBDataWriterWriteUint32Field();
LABEL_13:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v4[11] = self->_success;
    *((_WORD *)v4 + 26) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_expired;
  *((_WORD *)v4 + 26) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v4[8] = self->_nobuf;
  *((_WORD *)v4 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v4[7] = self->_noack;
  *((_WORD *)v4 + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v4[12] = self->_txfailure;
  *((_WORD *)v4 + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v4[10] = self->_noresources;
  *((_WORD *)v4 + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v4[5] = self->_ioerror;
  *((_WORD *)v4 + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v4[6] = self->_mbfree;
  *((_WORD *)v4 + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
LABEL_23:
    v4[9] = self->_noremotepeer;
    *((_WORD *)v4 + 26) |= 0x80u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  v4[2] = self->_chipmodeerror;
  *((_WORD *)v4 + 26) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 4) != 0)
  {
LABEL_12:
    v4[4] = self->_internalerror;
    *((_WORD *)v4 + 26) |= 4u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)result + 11) = self->_success;
    *((_WORD *)result + 26) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_expired;
  *((_WORD *)result + 26) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 8) = self->_nobuf;
  *((_WORD *)result + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 7) = self->_noack;
  *((_WORD *)result + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 12) = self->_txfailure;
  *((_WORD *)result + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 10) = self->_noresources;
  *((_WORD *)result + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 5) = self->_ioerror;
  *((_WORD *)result + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 6) = self->_mbfree;
  *((_WORD *)result + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 2) = self->_chipmodeerror;
  *((_WORD *)result + 26) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      return result;
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)result + 9) = self->_noremotepeer;
  *((_WORD *)result + 26) |= 0x80u;
  if ((*(_WORD *)&self->_has & 4) == 0)
    return result;
LABEL_12:
  *((_DWORD *)result + 4) = self->_internalerror;
  *((_WORD *)result + 26) |= 4u;
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
    goto LABEL_57;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 26);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) == 0 || self->_success != *((_DWORD *)v4 + 11))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 26) & 0x200) != 0)
  {
LABEL_57:
    v7 = 0;
    goto LABEL_58;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_expired != *((_DWORD *)v4 + 3))
      goto LABEL_57;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_nobuf != *((_DWORD *)v4 + 8))
      goto LABEL_57;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_noack != *((_DWORD *)v4 + 7))
      goto LABEL_57;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0 || self->_txfailure != *((_DWORD *)v4 + 12))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_noresources != *((_DWORD *)v4 + 10))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_ioerror != *((_DWORD *)v4 + 5))
      goto LABEL_57;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mbfree != *((_DWORD *)v4 + 6))
      goto LABEL_57;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_chipmodeerror != *((_DWORD *)v4 + 2))
      goto LABEL_57;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_noremotepeer != *((_DWORD *)v4 + 9))
      goto LABEL_57;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_internalerror != *((_DWORD *)v4 + 4))
      goto LABEL_57;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 4) == 0;
  }
LABEL_58:

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

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v3 = 2654435761 * self->_success;
    if ((has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_expired;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_nobuf;
    if ((has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_noack;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_txfailure;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_noresources;
    if ((has & 8) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_ioerror;
    if ((has & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_mbfree;
    if ((has & 1) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((has & 1) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_chipmodeerror;
    if ((has & 0x80) != 0)
      goto LABEL_11;
LABEL_22:
    v12 = 0;
    if ((has & 4) != 0)
      goto LABEL_12;
LABEL_23:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  v11 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_22;
LABEL_11:
  v12 = 2654435761 * self->_noremotepeer;
  if ((has & 4) == 0)
    goto LABEL_23;
LABEL_12:
  v13 = 2654435761 * self->_internalerror;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x200) != 0)
  {
    self->_success = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x200u;
    v5 = *((_WORD *)v4 + 26);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_expired = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_nobuf = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_noack = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_txfailure = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_noresources = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_ioerror = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_mbfree = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
LABEL_23:
    self->_noremotepeer = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x80u;
    if ((*((_WORD *)v4 + 26) & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  self->_chipmodeerror = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x80) != 0)
    goto LABEL_23;
LABEL_11:
  if ((v5 & 4) != 0)
  {
LABEL_12:
    self->_internalerror = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_13:

}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)expired
{
  return self->_expired;
}

- (unsigned)nobuf
{
  return self->_nobuf;
}

- (unsigned)noack
{
  return self->_noack;
}

- (unsigned)txfailure
{
  return self->_txfailure;
}

- (unsigned)noresources
{
  return self->_noresources;
}

- (unsigned)ioerror
{
  return self->_ioerror;
}

- (unsigned)mbfree
{
  return self->_mbfree;
}

- (unsigned)chipmodeerror
{
  return self->_chipmodeerror;
}

- (unsigned)noremotepeer
{
  return self->_noremotepeer;
}

- (unsigned)internalerror
{
  return self->_internalerror;
}

@end
