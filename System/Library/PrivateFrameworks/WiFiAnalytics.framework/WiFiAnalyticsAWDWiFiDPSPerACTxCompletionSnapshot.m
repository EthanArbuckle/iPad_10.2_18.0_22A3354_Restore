@implementation WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot

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

- (void)setDropped:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dropped = a3;
}

- (void)setHasDropped:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDropped
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNoBuf:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_noBuf = a3;
}

- (void)setHasNoBuf:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNoBuf
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNoResources:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_noResources = a3;
}

- (void)setHasNoResources:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNoResources
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNoAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_noAck = a3;
}

- (void)setHasNoAck:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNoAck
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setChipModeError:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_chipModeError = a3;
}

- (void)setHasChipModeError:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasChipModeError
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setExpired:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_expired = a3;
}

- (void)setHasExpired:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasExpired
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTxFailure:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txFailure = a3;
}

- (void)setHasTxFailure:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxFailure
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setFirmwareFreePacket:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_firmwareFreePacket = a3;
}

- (void)setHasFirmwareFreePacket:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFirmwareFreePacket
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setMaxRetries:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_maxRetries = a3;
}

- (void)setHasMaxRetries:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMaxRetries
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setForceLifetimeExp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_forceLifetimeExp = a3;
}

- (void)setHasForceLifetimeExp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasForceLifetimeExp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot;
  -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](self, "dictionaryRepresentation");
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
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dropped);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("dropped"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_noBuf);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("noBuf"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_noResources);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("noResources"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_noAck);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("noAck"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chipModeError);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("chipModeError"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_expired);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("expired"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txFailure);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("txFailure"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
LABEL_23:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxRetries);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("maxRetries"));

    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_firmwareFreePacket);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("firmwareFreePacket"));

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x10) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_forceLifetimeExp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("forceLifetimeExp"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshotReadFrom((uint64_t)self, (uint64_t)a3);
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
      if ((has & 0x80) == 0)
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
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
LABEL_23:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x10) != 0)
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
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_dropped;
  *((_WORD *)v4 + 26) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v4[9] = self->_noBuf;
  *((_WORD *)v4 + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v4[10] = self->_noResources;
  *((_WORD *)v4 + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v4[8] = self->_noAck;
  *((_WORD *)v4 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v4[2] = self->_chipModeError;
  *((_WORD *)v4 + 26) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v4[4] = self->_expired;
  *((_WORD *)v4 + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v4[12] = self->_txFailure;
  *((_WORD *)v4 + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
LABEL_23:
    v4[7] = self->_maxRetries;
    *((_WORD *)v4 + 26) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  v4[5] = self->_firmwareFreePacket;
  *((_WORD *)v4 + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x10) != 0)
  {
LABEL_12:
    v4[6] = self->_forceLifetimeExp;
    *((_WORD *)v4 + 26) |= 0x10u;
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
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_dropped;
  *((_WORD *)result + 26) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 9) = self->_noBuf;
  *((_WORD *)result + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_noResources;
  *((_WORD *)result + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 8) = self->_noAck;
  *((_WORD *)result + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 2) = self->_chipModeError;
  *((_WORD *)result + 26) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 4) = self->_expired;
  *((_WORD *)result + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 12) = self->_txFailure;
  *((_WORD *)result + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 5) = self->_firmwareFreePacket;
  *((_WORD *)result + 26) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)result + 7) = self->_maxRetries;
  *((_WORD *)result + 26) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) == 0)
    return result;
LABEL_12:
  *((_DWORD *)result + 6) = self->_forceLifetimeExp;
  *((_WORD *)result + 26) |= 0x10u;
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
    if ((v6 & 2) == 0 || self->_dropped != *((_DWORD *)v4 + 3))
      goto LABEL_57;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_noBuf != *((_DWORD *)v4 + 9))
      goto LABEL_57;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_noResources != *((_DWORD *)v4 + 10))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_noAck != *((_DWORD *)v4 + 8))
      goto LABEL_57;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_chipModeError != *((_DWORD *)v4 + 2))
      goto LABEL_57;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_expired != *((_DWORD *)v4 + 4))
      goto LABEL_57;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0 || self->_txFailure != *((_DWORD *)v4 + 12))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_firmwareFreePacket != *((_DWORD *)v4 + 5))
      goto LABEL_57;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_maxRetries != *((_DWORD *)v4 + 7))
      goto LABEL_57;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_forceLifetimeExp != *((_DWORD *)v4 + 6))
      goto LABEL_57;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x10) == 0;
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
      v4 = 2654435761 * self->_dropped;
      if ((has & 0x80) != 0)
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
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_noBuf;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_noResources;
    if ((has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_noAck;
    if ((has & 1) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((has & 1) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_chipModeError;
    if ((has & 4) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_expired;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_txFailure;
    if ((has & 8) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((has & 8) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_firmwareFreePacket;
    if ((has & 0x20) != 0)
      goto LABEL_11;
LABEL_22:
    v12 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_12;
LABEL_23:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  v11 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_22;
LABEL_11:
  v12 = 2654435761 * self->_maxRetries;
  if ((has & 0x10) == 0)
    goto LABEL_23;
LABEL_12:
  v13 = 2654435761 * self->_forceLifetimeExp;
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
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_dropped = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_noBuf = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_noResources = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_noAck = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_chipModeError = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_expired = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_txFailure = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      goto LABEL_11;
LABEL_23:
    self->_maxRetries = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 0x20u;
    if ((*((_WORD *)v4 + 26) & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  self->_firmwareFreePacket = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) != 0)
    goto LABEL_23;
LABEL_11:
  if ((v5 & 0x10) != 0)
  {
LABEL_12:
    self->_forceLifetimeExp = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_13:

}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)dropped
{
  return self->_dropped;
}

- (unsigned)noBuf
{
  return self->_noBuf;
}

- (unsigned)noResources
{
  return self->_noResources;
}

- (unsigned)noAck
{
  return self->_noAck;
}

- (unsigned)chipModeError
{
  return self->_chipModeError;
}

- (unsigned)expired
{
  return self->_expired;
}

- (unsigned)txFailure
{
  return self->_txFailure;
}

- (unsigned)firmwareFreePacket
{
  return self->_firmwareFreePacket;
}

- (unsigned)maxRetries
{
  return self->_maxRetries;
}

- (unsigned)forceLifetimeExp
{
  return self->_forceLifetimeExp;
}

@end
