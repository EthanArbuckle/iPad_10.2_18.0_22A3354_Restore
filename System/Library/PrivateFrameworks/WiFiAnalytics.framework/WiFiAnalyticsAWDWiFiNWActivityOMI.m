@implementation WiFiAnalyticsAWDWiFiNWActivityOMI

- (void)setScheduled:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_scheduled = a3;
}

- (void)setHasScheduled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasScheduled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSuccess
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setRetries:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_retries = a3;
}

- (void)setHasRetries:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRetries
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCompletionDelay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_completionDelay = a3;
}

- (void)setHasCompletionDelay:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCompletionDelay
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setULMUReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_uLMUReq = a3;
}

- (void)setHasULMUReq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasULMUReq
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setULMUAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_uLMUAck = a3;
}

- (void)setHasULMUAck:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasULMUAck
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setTxNSTSReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_txNSTSReq = a3;
}

- (void)setHasTxNSTSReq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasTxNSTSReq
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setTxNSTSAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_txNSTSAck = a3;
}

- (void)setHasTxNSTSAck:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTxNSTSAck
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setRxNSSReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rxNSSReq = a3;
}

- (void)setHasRxNSSReq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRxNSSReq
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRxNSSAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rxNSSAck = a3;
}

- (void)setHasRxNSSAck:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRxNSSAck
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setChBWReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_chBWReq = a3;
}

- (void)setHasChBWReq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasChBWReq
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setChBWAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_chBWAck = a3;
}

- (void)setHasChBWAck:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasChBWAck
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setERSUReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_eRSUReq = a3;
}

- (void)setHasERSUReq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasERSUReq
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setERSUAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_eRSUAck = a3;
}

- (void)setHasERSUAck:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasERSUAck
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDLResoundReq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dLResoundReq = a3;
}

- (void)setHasDLResoundReq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDLResoundReq
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDLResoundAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dLResoundAck = a3;
}

- (void)setHasDLResoundAck:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDLResoundAck
{
  return (*(_WORD *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityOMI;
  -[WiFiAnalyticsAWDWiFiNWActivityOMI description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityOMI dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scheduled);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("scheduled"));

    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_success);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("success"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_retries);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("retries"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_completionDelay);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("completionDelay"));

  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_uLMUReq);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("ULMUReq"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_uLMUAck);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("ULMUAck"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txNSTSReq);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("TxNSTSReq"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txNSTSAck);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("TxNSTSAck"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rxNSSReq);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("RxNSSReq"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rxNSSAck);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("RxNSSAck"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chBWReq);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("ChBWReq"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chBWAck);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("ChBWAck"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_eRSUReq);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("ERSUReq"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
LABEL_33:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dLResoundReq);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("DLResoundReq"));

    if ((*(_WORD *)&self->_has & 8) == 0)
      return v3;
    goto LABEL_17;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_eRSUAck);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("ERSUAck"));

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_33;
LABEL_16:
  if ((has & 8) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dLResoundAck);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("DLResoundAck"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityOMIReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
LABEL_33:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_33;
LABEL_16:
  if ((has & 8) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field();
LABEL_18:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v4[12] = self->_scheduled;
    *((_WORD *)v4 + 36) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_success;
  *((_WORD *)v4 + 36) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v4[9] = self->_retries;
  *((_WORD *)v4 + 36) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v4[4] = self->_completionDelay;
  *((_WORD *)v4 + 36) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v4[17] = self->_uLMUReq;
  *((_WORD *)v4 + 36) |= 0x8000u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v4[16] = self->_uLMUAck;
  *((_WORD *)v4 + 36) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v4[15] = self->_txNSTSReq;
  *((_WORD *)v4 + 36) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v4[14] = self->_txNSTSAck;
  *((_WORD *)v4 + 36) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v4[11] = self->_rxNSSReq;
  *((_WORD *)v4 + 36) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v4[10] = self->_rxNSSAck;
  *((_WORD *)v4 + 36) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v4[3] = self->_chBWReq;
  *((_WORD *)v4 + 36) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v4[2] = self->_chBWAck;
  *((_WORD *)v4 + 36) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v4[8] = self->_eRSUReq;
  *((_WORD *)v4 + 36) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
LABEL_33:
    v4[6] = self->_dLResoundReq;
    *((_WORD *)v4 + 36) |= 0x10u;
    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  v4[7] = self->_eRSUAck;
  *((_WORD *)v4 + 36) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_33;
LABEL_16:
  if ((has & 8) != 0)
  {
LABEL_17:
    v4[5] = self->_dLResoundAck;
    *((_WORD *)v4 + 36) |= 8u;
  }
LABEL_18:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)result + 12) = self->_scheduled;
    *((_WORD *)result + 36) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 13) = self->_success;
  *((_WORD *)result + 36) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 9) = self->_retries;
  *((_WORD *)result + 36) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 4) = self->_completionDelay;
  *((_WORD *)result + 36) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 17) = self->_uLMUReq;
  *((_WORD *)result + 36) |= 0x8000u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 16) = self->_uLMUAck;
  *((_WORD *)result + 36) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 15) = self->_txNSTSReq;
  *((_WORD *)result + 36) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 14) = self->_txNSTSAck;
  *((_WORD *)result + 36) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 11) = self->_rxNSSReq;
  *((_WORD *)result + 36) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 10) = self->_rxNSSAck;
  *((_WORD *)result + 36) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 3) = self->_chBWReq;
  *((_WORD *)result + 36) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 2) = self->_chBWAck;
  *((_WORD *)result + 36) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 8) = self->_eRSUReq;
  *((_WORD *)result + 36) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 7) = self->_eRSUAck;
  *((_WORD *)result + 36) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 8) == 0)
      return result;
    goto LABEL_17;
  }
LABEL_33:
  *((_DWORD *)result + 6) = self->_dLResoundReq;
  *((_WORD *)result + 36) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) == 0)
    return result;
LABEL_17:
  *((_DWORD *)result + 5) = self->_dLResoundAck;
  *((_WORD *)result + 36) |= 8u;
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
    goto LABEL_82;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 36);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x400) == 0 || self->_scheduled != *((_DWORD *)v4 + 12))
      goto LABEL_82;
  }
  else if ((*((_WORD *)v4 + 36) & 0x400) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x800) == 0 || self->_success != *((_DWORD *)v4 + 13))
      goto LABEL_82;
  }
  else if ((*((_WORD *)v4 + 36) & 0x800) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_retries != *((_DWORD *)v4 + 9))
      goto LABEL_82;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_completionDelay != *((_DWORD *)v4 + 4))
      goto LABEL_82;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x8000) == 0 || self->_uLMUReq != *((_DWORD *)v4 + 17))
      goto LABEL_82;
  }
  else if ((*((_WORD *)v4 + 36) & 0x8000) != 0)
  {
LABEL_82:
    v7 = 0;
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x4000) == 0 || self->_uLMUAck != *((_DWORD *)v4 + 16))
      goto LABEL_82;
  }
  else if ((*((_WORD *)v4 + 36) & 0x4000) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x2000) == 0 || self->_txNSTSReq != *((_DWORD *)v4 + 15))
      goto LABEL_82;
  }
  else if ((*((_WORD *)v4 + 36) & 0x2000) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x1000) == 0 || self->_txNSTSAck != *((_DWORD *)v4 + 14))
      goto LABEL_82;
  }
  else if ((*((_WORD *)v4 + 36) & 0x1000) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x200) == 0 || self->_rxNSSReq != *((_DWORD *)v4 + 11))
      goto LABEL_82;
  }
  else if ((*((_WORD *)v4 + 36) & 0x200) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x100) == 0 || self->_rxNSSAck != *((_DWORD *)v4 + 10))
      goto LABEL_82;
  }
  else if ((*((_WORD *)v4 + 36) & 0x100) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_chBWReq != *((_DWORD *)v4 + 3))
      goto LABEL_82;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_chBWAck != *((_DWORD *)v4 + 2))
      goto LABEL_82;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_eRSUReq != *((_DWORD *)v4 + 8))
      goto LABEL_82;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_eRSUAck != *((_DWORD *)v4 + 7))
      goto LABEL_82;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dLResoundReq != *((_DWORD *)v4 + 6))
      goto LABEL_82;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dLResoundAck != *((_DWORD *)v4 + 5))
      goto LABEL_82;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 8) == 0;
  }
LABEL_83:

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
  uint64_t v17;
  uint64_t v18;

  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v3 = 2654435761 * self->_scheduled;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_success;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_retries;
    if ((has & 4) != 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_completionDelay;
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_uLMUReq;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_uLMUAck;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_txNSTSReq;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_txNSTSAck;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_rxNSSReq;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_rxNSSAck;
    if ((has & 2) != 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  v12 = 0;
  if ((has & 2) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_chBWReq;
    if ((has & 1) != 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  v13 = 0;
  if ((has & 1) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_chBWAck;
    if ((has & 0x40) != 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  v14 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_eRSUReq;
    if ((has & 0x20) != 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_eRSUAck;
    if ((has & 0x10) != 0)
      goto LABEL_16;
LABEL_32:
    v17 = 0;
    if ((has & 8) != 0)
      goto LABEL_17;
LABEL_33:
    v18 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
LABEL_31:
  v16 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_32;
LABEL_16:
  v17 = 2654435761 * self->_dLResoundReq;
  if ((has & 8) == 0)
    goto LABEL_33;
LABEL_17:
  v18 = 2654435761 * self->_dLResoundAck;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x400) != 0)
  {
    self->_scheduled = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x400u;
    v5 = *((_WORD *)v4 + 36);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_success = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  self->_retries = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  self->_completionDelay = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x8000) == 0)
  {
LABEL_6:
    if ((v5 & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  self->_uLMUReq = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x8000u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x4000) == 0)
  {
LABEL_7:
    if ((v5 & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  self->_uLMUAck = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x4000u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x2000) == 0)
  {
LABEL_8:
    if ((v5 & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  self->_txNSTSReq = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x1000) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  self->_txNSTSAck = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  self->_rxNSSReq = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  self->_rxNSSAck = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  self->_chBWReq = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 1) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  self->_chBWAck = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_14:
    if ((v5 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  self->_eRSUReq = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_15:
    if ((v5 & 0x10) == 0)
      goto LABEL_16;
LABEL_33:
    self->_dLResoundReq = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 0x10u;
    if ((*((_WORD *)v4 + 36) & 8) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  self->_eRSUAck = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x10) != 0)
    goto LABEL_33;
LABEL_16:
  if ((v5 & 8) != 0)
  {
LABEL_17:
    self->_dLResoundAck = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_18:

}

- (unsigned)scheduled
{
  return self->_scheduled;
}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)retries
{
  return self->_retries;
}

- (unsigned)completionDelay
{
  return self->_completionDelay;
}

- (unsigned)uLMUReq
{
  return self->_uLMUReq;
}

- (unsigned)uLMUAck
{
  return self->_uLMUAck;
}

- (unsigned)txNSTSReq
{
  return self->_txNSTSReq;
}

- (unsigned)txNSTSAck
{
  return self->_txNSTSAck;
}

- (unsigned)rxNSSReq
{
  return self->_rxNSSReq;
}

- (unsigned)rxNSSAck
{
  return self->_rxNSSAck;
}

- (unsigned)chBWReq
{
  return self->_chBWReq;
}

- (unsigned)chBWAck
{
  return self->_chBWAck;
}

- (unsigned)eRSUReq
{
  return self->_eRSUReq;
}

- (unsigned)eRSUAck
{
  return self->_eRSUAck;
}

- (unsigned)dLResoundReq
{
  return self->_dLResoundReq;
}

- (unsigned)dLResoundAck
{
  return self->_dLResoundAck;
}

@end
