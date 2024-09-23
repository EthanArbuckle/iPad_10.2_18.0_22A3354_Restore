@implementation AWDOMICntrs

- (void)setHeOmitxSched:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_heOmitxSched = a3;
}

- (void)setHasHeOmitxSched:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHeOmitxSched
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHeOmitxSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_heOmitxSuccess = a3;
}

- (void)setHasHeOmitxSuccess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHeOmitxSuccess
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHeOmitxRetries:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_heOmitxRetries = a3;
}

- (void)setHasHeOmitxRetries:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHeOmitxRetries
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHeOmitxDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_heOmitxDur = a3;
}

- (void)setHasHeOmitxDur:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHeOmitxDur
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHeOmitxUlmucfg:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_heOmitxUlmucfg = a3;
}

- (void)setHasHeOmitxUlmucfg:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasHeOmitxUlmucfg
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHeOmitxUlmucfgAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_heOmitxUlmucfgAck = a3;
}

- (void)setHasHeOmitxUlmucfgAck:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasHeOmitxUlmucfgAck
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHeOmitxTxnsts:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_heOmitxTxnsts = a3;
}

- (void)setHasHeOmitxTxnsts:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHeOmitxTxnsts
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHeOmitxTxnstsAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_heOmitxTxnstsAck = a3;
}

- (void)setHasHeOmitxTxnstsAck:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasHeOmitxTxnstsAck
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHeOmitxDlmursdrec:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_heOmitxDlmursdrec = a3;
}

- (void)setHasHeOmitxDlmursdrec:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasHeOmitxDlmursdrec
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHeOmitxDlmursdrecAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_heOmitxDlmursdrecAck = a3;
}

- (void)setHasHeOmitxDlmursdrecAck:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasHeOmitxDlmursdrecAck
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDOMICntrs;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDOMICntrs description](&v3, sel_description), -[AWDOMICntrs dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heOmitxSched), CFSTR("he_omitx_sched"));
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heOmitxSuccess), CFSTR("he_omitx_success"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heOmitxRetries), CFSTR("he_omitx_retries"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heOmitxDur), CFSTR("he_omitx_dur"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heOmitxUlmucfg), CFSTR("he_omitx_ulmucfg"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heOmitxUlmucfgAck), CFSTR("he_omitx_ulmucfg_ack"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heOmitxTxnsts), CFSTR("he_omitx_txnsts"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heOmitxDlmursdrec), CFSTR("he_omitx_dlmursdrec"));
    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heOmitxTxnstsAck), CFSTR("he_omitx_txnsts_ack"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 2) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heOmitxDlmursdrecAck), CFSTR("he_omitx_dlmursdrec_ack"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDOMICntrsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      return;
LABEL_21:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_21;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_heOmitxSched;
    *((_WORD *)a3 + 24) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_heOmitxSuccess;
  *((_WORD *)a3 + 24) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_heOmitxRetries;
  *((_WORD *)a3 + 24) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 4) = self->_heOmitxDur;
  *((_WORD *)a3 + 24) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 10) = self->_heOmitxUlmucfg;
  *((_WORD *)a3 + 24) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 11) = self->_heOmitxUlmucfgAck;
  *((_WORD *)a3 + 24) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 8) = self->_heOmitxTxnsts;
  *((_WORD *)a3 + 24) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 9) = self->_heOmitxTxnstsAck;
  *((_WORD *)a3 + 24) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      return;
LABEL_21:
    *((_DWORD *)a3 + 3) = self->_heOmitxDlmursdrecAck;
    *((_WORD *)a3 + 24) |= 2u;
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 2) = self->_heOmitxDlmursdrec;
  *((_WORD *)a3 + 24) |= 1u;
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 6) = self->_heOmitxSched;
    *((_WORD *)result + 24) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_heOmitxSuccess;
  *((_WORD *)result + 24) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_heOmitxRetries;
  *((_WORD *)result + 24) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 4) = self->_heOmitxDur;
  *((_WORD *)result + 24) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_heOmitxUlmucfg;
  *((_WORD *)result + 24) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 11) = self->_heOmitxUlmucfgAck;
  *((_WORD *)result + 24) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 8) = self->_heOmitxTxnsts;
  *((_WORD *)result + 24) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 9) = self->_heOmitxTxnstsAck;
  *((_WORD *)result + 24) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      return result;
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 2) = self->_heOmitxDlmursdrec;
  *((_WORD *)result + 24) |= 1u;
  if ((*(_WORD *)&self->_has & 2) == 0)
    return result;
LABEL_11:
  *((_DWORD *)result + 3) = self->_heOmitxDlmursdrecAck;
  *((_WORD *)result + 24) |= 2u;
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
    v7 = *((_WORD *)a3 + 24);
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_heOmitxSched != *((_DWORD *)a3 + 6))
        goto LABEL_51;
    }
    else if ((v7 & 0x10) != 0)
    {
LABEL_51:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_heOmitxSuccess != *((_DWORD *)a3 + 7))
        goto LABEL_51;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_heOmitxRetries != *((_DWORD *)a3 + 5))
        goto LABEL_51;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_heOmitxDur != *((_DWORD *)a3 + 4))
        goto LABEL_51;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 24) & 0x100) == 0 || self->_heOmitxUlmucfg != *((_DWORD *)a3 + 10))
        goto LABEL_51;
    }
    else if ((*((_WORD *)a3 + 24) & 0x100) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 24) & 0x200) == 0 || self->_heOmitxUlmucfgAck != *((_DWORD *)a3 + 11))
        goto LABEL_51;
    }
    else if ((*((_WORD *)a3 + 24) & 0x200) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_heOmitxTxnsts != *((_DWORD *)a3 + 8))
        goto LABEL_51;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_heOmitxTxnstsAck != *((_DWORD *)a3 + 9))
        goto LABEL_51;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_heOmitxDlmursdrec != *((_DWORD *)a3 + 2))
        goto LABEL_51;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_51;
    }
    LOBYTE(v5) = (v7 & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_heOmitxDlmursdrecAck != *((_DWORD *)a3 + 3))
        goto LABEL_51;
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

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v3 = 2654435761 * self->_heOmitxSched;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_heOmitxSuccess;
      if ((has & 8) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_heOmitxRetries;
    if ((has & 4) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_heOmitxDur;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_heOmitxUlmucfg;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_heOmitxUlmucfgAck;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_heOmitxTxnsts;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_heOmitxTxnstsAck;
    if ((has & 1) != 0)
      goto LABEL_10;
LABEL_20:
    v11 = 0;
    if ((has & 2) != 0)
      goto LABEL_11;
LABEL_21:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  v10 = 0;
  if ((has & 1) == 0)
    goto LABEL_20;
LABEL_10:
  v11 = 2654435761 * self->_heOmitxDlmursdrec;
  if ((has & 2) == 0)
    goto LABEL_21;
LABEL_11:
  v12 = 2654435761 * self->_heOmitxDlmursdrecAck;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x10) != 0)
  {
    self->_heOmitxSched = *((_DWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 0x10u;
    v3 = *((_WORD *)a3 + 24);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_heOmitxSuccess = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 24);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_heOmitxRetries = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 24);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_heOmitxDur = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_heOmitxUlmucfg = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x200) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_heOmitxUlmucfgAck = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  self->_heOmitxTxnsts = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 1) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  self->_heOmitxTxnstsAck = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 24);
  if ((v3 & 1) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0)
      return;
LABEL_21:
    self->_heOmitxDlmursdrecAck = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    return;
  }
LABEL_20:
  self->_heOmitxDlmursdrec = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)a3 + 24) & 2) != 0)
    goto LABEL_21;
}

- (unsigned)heOmitxSched
{
  return self->_heOmitxSched;
}

- (unsigned)heOmitxSuccess
{
  return self->_heOmitxSuccess;
}

- (unsigned)heOmitxRetries
{
  return self->_heOmitxRetries;
}

- (unsigned)heOmitxDur
{
  return self->_heOmitxDur;
}

- (unsigned)heOmitxUlmucfg
{
  return self->_heOmitxUlmucfg;
}

- (unsigned)heOmitxUlmucfgAck
{
  return self->_heOmitxUlmucfgAck;
}

- (unsigned)heOmitxTxnsts
{
  return self->_heOmitxTxnsts;
}

- (unsigned)heOmitxTxnstsAck
{
  return self->_heOmitxTxnstsAck;
}

- (unsigned)heOmitxDlmursdrec
{
  return self->_heOmitxDlmursdrec;
}

- (unsigned)heOmitxDlmursdrecAck
{
  return self->_heOmitxDlmursdrecAck;
}

@end
