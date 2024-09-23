@implementation WiFiAnalyticsAWDWiFiNWActivityPerACTxCompletions

- (int)ac
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_ac;
  else
    return 0;
}

- (void)setAc:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_ac = a3;
}

- (void)setHasAc:(BOOL)a3
{
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAc
{
  return *(_DWORD *)&self->_has & 1;
}

- (id)acAsString:(int)a3
{
  if (a3 < 0xC)
    return *(&off_24CDDD860 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAc:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rx")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Tx")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TxBK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TxBE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TxVO")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TxVI")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RxSU")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TxSU")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RxOFDMA")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TxOFDMA")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RxMUMIMO")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TxMUMIMO")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSuccess:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSuccess
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setDurSinceLastSuccessfulComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_durSinceLastSuccessfulComp = a3;
}

- (void)setHasDurSinceLastSuccessfulComp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDurSinceLastSuccessfulComp
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setFailedComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_failedComp = a3;
}

- (void)setHasFailedComp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasFailedComp
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setDurSinceLastFailedComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_durSinceLastFailedComp = a3;
}

- (void)setHasDurSinceLastFailedComp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDurSinceLastFailedComp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setExpiredComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_expiredComp = a3;
}

- (void)setHasExpiredComp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasExpiredComp
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNoAckComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_noAckComp = a3;
}

- (void)setHasNoAckComp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNoAckComp
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setOtherErrComp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_otherErrComp = a3;
}

- (void)setHasOtherErrComp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasOtherErrComp
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDurSinceLastEnqueue:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_durSinceLastEnqueue = a3;
}

- (void)setHasDurSinceLastEnqueue:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDurSinceLastEnqueue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setQeuedPackets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_qeuedPackets = a3;
}

- (void)setHasQeuedPackets:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasQeuedPackets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSinceLastEnqueueHowManyFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_sinceLastEnqueueHowManyFailed = a3;
}

- (void)setHasSinceLastEnqueueHowManyFailed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSinceLastEnqueueHowManyFailed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSinceLastEnqueueHowManySuccess:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_sinceLastEnqueueHowManySuccess = a3;
}

- (void)setHasSinceLastEnqueueHowManySuccess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSinceLastEnqueueHowManySuccess
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setSinceLastSuccessHowManyFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_sinceLastSuccessHowManyFailed = a3;
}

- (void)setHasSinceLastSuccessHowManyFailed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSinceLastSuccessHowManyFailed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setDurSinceLastEnqueueAtLastCheck:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_durSinceLastEnqueueAtLastCheck = a3;
}

- (void)setHasDurSinceLastEnqueueAtLastCheck:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDurSinceLastEnqueueAtLastCheck
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSuccessfulCompletionsAtLastCheck:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_successfulCompletionsAtLastCheck = a3;
}

- (void)setHasSuccessfulCompletionsAtLastCheck:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSuccessfulCompletionsAtLastCheck
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setFailedCompletionsAtLastCheck:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_failedCompletionsAtLastCheck = a3;
}

- (void)setHasFailedCompletionsAtLastCheck:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasFailedCompletionsAtLastCheck
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setDpsNotifications:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_dpsNotifications = a3;
}

- (void)setHasDpsNotifications:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($10A57E178583965F6CC2878FB3337F9B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDpsNotifications
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityPerACTxCompletions;
  -[WiFiAnalyticsAWDWiFiNWActivityPerACTxCompletions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityPerACTxCompletions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $10A57E178583965F6CC2878FB3337F9B has;
  uint64_t ac;
  void *v6;
  void *v7;
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
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    ac = self->_ac;
    if (ac >= 0xC)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ac);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = *(&off_24CDDD860 + ac);
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ac"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_success);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("success"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_8:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_9;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durSinceLastSuccessfulComp);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("durSinceLastSuccessfulComp"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_failedComp);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("failedComp"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durSinceLastFailedComp);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("durSinceLastFailedComp"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_expiredComp);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("expiredComp"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_noAckComp);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("noAckComp"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_otherErrComp);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("otherErrComp"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durSinceLastEnqueue);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("durSinceLastEnqueue"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_qeuedPackets);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("qeuedPackets"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sinceLastEnqueueHowManyFailed);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("sinceLastEnqueueHowManyFailed"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sinceLastEnqueueHowManySuccess);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("sinceLastEnqueueHowManySuccess"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_19;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sinceLastSuccessHowManyFailed);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("sinceLastSuccessHowManyFailed"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durSinceLastEnqueueAtLastCheck);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("durSinceLastEnqueueAtLastCheck"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
LABEL_38:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_failedCompletionsAtLastCheck);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("failedCompletionsAtLastCheck"));

    if ((*(_DWORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_22;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_successfulCompletionsAtLastCheck);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("successfulCompletionsAtLastCheck"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
    goto LABEL_38;
LABEL_21:
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dpsNotifications);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dpsNotifications"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityPerACTxCompletionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $10A57E178583965F6CC2878FB3337F9B has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_17;
LABEL_35:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_has & 2) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_BYTE *)&has & 2) != 0)
LABEL_18:
    PBDataWriterWriteUint32Field();
LABEL_19:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $10A57E178583965F6CC2878FB3337F9B has;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[2] = self->_ac;
    v4[19] |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  v4[17] = self->_success;
  v4[19] |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  v4[7] = self->_durSinceLastSuccessfulComp;
  v4[19] |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  v4[9] = self->_failedComp;
  v4[19] |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  v4[6] = self->_durSinceLastFailedComp;
  v4[19] |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  v4[8] = self->_expiredComp;
  v4[19] |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  v4[11] = self->_noAckComp;
  v4[19] |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  v4[12] = self->_otherErrComp;
  v4[19] |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  v4[4] = self->_durSinceLastEnqueue;
  v4[19] |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  v4[13] = self->_qeuedPackets;
  v4[19] |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v4[14] = self->_sinceLastEnqueueHowManyFailed;
  v4[19] |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  v4[15] = self->_sinceLastEnqueueHowManySuccess;
  v4[19] |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  v4[16] = self->_sinceLastSuccessHowManyFailed;
  v4[19] |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  v4[5] = self->_durSinceLastEnqueueAtLastCheck;
  v4[19] |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_17;
LABEL_35:
    v4[10] = self->_failedCompletionsAtLastCheck;
    v4[19] |= 0x100u;
    if ((*(_DWORD *)&self->_has & 2) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  v4[18] = self->_successfulCompletionsAtLastCheck;
  v4[19] |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_18:
    v4[3] = self->_dpsNotifications;
    v4[19] |= 2u;
  }
LABEL_19:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $10A57E178583965F6CC2878FB3337F9B has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_ac;
    *((_DWORD *)result + 19) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 17) = self->_success;
  *((_DWORD *)result + 19) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 7) = self->_durSinceLastSuccessfulComp;
  *((_DWORD *)result + 19) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 9) = self->_failedComp;
  *((_DWORD *)result + 19) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 6) = self->_durSinceLastFailedComp;
  *((_DWORD *)result + 19) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 8) = self->_expiredComp;
  *((_DWORD *)result + 19) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 11) = self->_noAckComp;
  *((_DWORD *)result + 19) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 12) = self->_otherErrComp;
  *((_DWORD *)result + 19) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 4) = self->_durSinceLastEnqueue;
  *((_DWORD *)result + 19) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 13) = self->_qeuedPackets;
  *((_DWORD *)result + 19) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 14) = self->_sinceLastEnqueueHowManyFailed;
  *((_DWORD *)result + 19) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 15) = self->_sinceLastEnqueueHowManySuccess;
  *((_DWORD *)result + 19) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 16) = self->_sinceLastSuccessHowManyFailed;
  *((_DWORD *)result + 19) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 5) = self->_durSinceLastEnqueueAtLastCheck;
  *((_DWORD *)result + 19) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 18) = self->_successfulCompletionsAtLastCheck;
  *((_DWORD *)result + 19) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 2) == 0)
      return result;
    goto LABEL_18;
  }
LABEL_35:
  *((_DWORD *)result + 10) = self->_failedCompletionsAtLastCheck;
  *((_DWORD *)result + 19) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 2) == 0)
    return result;
LABEL_18:
  *((_DWORD *)result + 3) = self->_dpsNotifications;
  *((_DWORD *)result + 19) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  $10A57E178583965F6CC2878FB3337F9B has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_87;
  has = self->_has;
  v6 = v4[19];
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_ac != v4[2])
      goto LABEL_87;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_87:
    v7 = 0;
    goto LABEL_88;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_success != v4[17])
      goto LABEL_87;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_durSinceLastSuccessfulComp != v4[7])
      goto LABEL_87;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_failedComp != v4[9])
      goto LABEL_87;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_durSinceLastFailedComp != v4[6])
      goto LABEL_87;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_expiredComp != v4[8])
      goto LABEL_87;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_noAckComp != v4[11])
      goto LABEL_87;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_otherErrComp != v4[12])
      goto LABEL_87;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_durSinceLastEnqueue != v4[4])
      goto LABEL_87;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_qeuedPackets != v4[13])
      goto LABEL_87;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_sinceLastEnqueueHowManyFailed != v4[14])
      goto LABEL_87;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_sinceLastEnqueueHowManySuccess != v4[15])
      goto LABEL_87;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_sinceLastSuccessHowManyFailed != v4[16])
      goto LABEL_87;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_durSinceLastEnqueueAtLastCheck != v4[5])
      goto LABEL_87;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_successfulCompletionsAtLastCheck != v4[18])
      goto LABEL_87;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_failedCompletionsAtLastCheck != v4[10])
      goto LABEL_87;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_dpsNotifications != v4[3])
      goto LABEL_87;
    v7 = 1;
  }
  else
  {
    v7 = (v4[19] & 2) == 0;
  }
LABEL_88:

  return v7;
}

- (unint64_t)hash
{
  $10A57E178583965F6CC2878FB3337F9B has;
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
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v3 = 2654435761 * self->_ac;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_success;
      if ((*(_BYTE *)&has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_durSinceLastSuccessfulComp;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_failedComp;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v6 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_durSinceLastFailedComp;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v7 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_expiredComp;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v8 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_noAckComp;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v9 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_otherErrComp;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v10 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_durSinceLastEnqueue;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v11 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_qeuedPackets;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v12 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_sinceLastEnqueueHowManyFailed;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v13 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_sinceLastEnqueueHowManySuccess;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v14 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_sinceLastSuccessHowManyFailed;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v15 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_durSinceLastEnqueueAtLastCheck;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_successfulCompletionsAtLastCheck;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_17;
LABEL_34:
    v18 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_18;
LABEL_35:
    v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_33:
  v17 = 0;
  if ((*(_WORD *)&has & 0x100) == 0)
    goto LABEL_34;
LABEL_17:
  v18 = 2654435761 * self->_failedCompletionsAtLastCheck;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_35;
LABEL_18:
  v19 = 2654435761 * self->_dpsNotifications;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  int v5;

  v4 = a3;
  v5 = v4[19];
  if ((v5 & 1) != 0)
  {
    self->_ac = v4[2];
    *(_DWORD *)&self->_has |= 1u;
    v5 = v4[19];
    if ((v5 & 0x8000) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((v5 & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  self->_success = v4[17];
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = v4[19];
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  self->_durSinceLastSuccessfulComp = v4[7];
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = v4[19];
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  self->_failedComp = v4[9];
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = v4[19];
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  self->_durSinceLastFailedComp = v4[6];
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = v4[19];
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  self->_expiredComp = v4[8];
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = v4[19];
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  self->_noAckComp = v4[11];
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = v4[19];
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  self->_otherErrComp = v4[12];
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = v4[19];
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  self->_durSinceLastEnqueue = v4[4];
  *(_DWORD *)&self->_has |= 4u;
  v5 = v4[19];
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  self->_qeuedPackets = v4[13];
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = v4[19];
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  self->_sinceLastEnqueueHowManyFailed = v4[14];
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = v4[19];
  if ((v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((v5 & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  self->_sinceLastEnqueueHowManySuccess = v4[15];
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = v4[19];
  if ((v5 & 0x4000) == 0)
  {
LABEL_14:
    if ((v5 & 8) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  self->_sinceLastSuccessHowManyFailed = v4[16];
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = v4[19];
  if ((v5 & 8) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  self->_durSinceLastEnqueueAtLastCheck = v4[5];
  *(_DWORD *)&self->_has |= 8u;
  v5 = v4[19];
  if ((v5 & 0x10000) == 0)
  {
LABEL_16:
    if ((v5 & 0x100) == 0)
      goto LABEL_17;
LABEL_35:
    self->_failedCompletionsAtLastCheck = v4[10];
    *(_DWORD *)&self->_has |= 0x100u;
    if ((v4[19] & 2) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  self->_successfulCompletionsAtLastCheck = v4[18];
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = v4[19];
  if ((v5 & 0x100) != 0)
    goto LABEL_35;
LABEL_17:
  if ((v5 & 2) != 0)
  {
LABEL_18:
    self->_dpsNotifications = v4[3];
    *(_DWORD *)&self->_has |= 2u;
  }
LABEL_19:

}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)durSinceLastSuccessfulComp
{
  return self->_durSinceLastSuccessfulComp;
}

- (unsigned)failedComp
{
  return self->_failedComp;
}

- (unsigned)durSinceLastFailedComp
{
  return self->_durSinceLastFailedComp;
}

- (unsigned)expiredComp
{
  return self->_expiredComp;
}

- (unsigned)noAckComp
{
  return self->_noAckComp;
}

- (unsigned)otherErrComp
{
  return self->_otherErrComp;
}

- (unsigned)durSinceLastEnqueue
{
  return self->_durSinceLastEnqueue;
}

- (unsigned)qeuedPackets
{
  return self->_qeuedPackets;
}

- (unsigned)sinceLastEnqueueHowManyFailed
{
  return self->_sinceLastEnqueueHowManyFailed;
}

- (unsigned)sinceLastEnqueueHowManySuccess
{
  return self->_sinceLastEnqueueHowManySuccess;
}

- (unsigned)sinceLastSuccessHowManyFailed
{
  return self->_sinceLastSuccessHowManyFailed;
}

- (unsigned)durSinceLastEnqueueAtLastCheck
{
  return self->_durSinceLastEnqueueAtLastCheck;
}

- (unsigned)successfulCompletionsAtLastCheck
{
  return self->_successfulCompletionsAtLastCheck;
}

- (unsigned)failedCompletionsAtLastCheck
{
  return self->_failedCompletionsAtLastCheck;
}

- (unsigned)dpsNotifications
{
  return self->_dpsNotifications;
}

@end
