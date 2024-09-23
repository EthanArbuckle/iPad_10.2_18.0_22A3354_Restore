@implementation AWDWiFiNWActivityPerACTxCompletions

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
  if (a3 >= 6)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_24C10E670 + a3);
}

- (int)StringAsAc:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Rx")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Tx")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TxBK")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TxBE")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TxVO")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("TxVI")))
    return 5;
  return 0;
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
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityPerACTxCompletions;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityPerACTxCompletions description](&v3, sel_description), -[AWDWiFiNWActivityPerACTxCompletions dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $10A57E178583965F6CC2878FB3337F9B has;
  uint64_t ac;
  uint64_t v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    ac = self->_ac;
    if (ac >= 6)
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ac);
    else
      v6 = (uint64_t)*(&off_24C10E670 + ac);
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ac"));
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_success), CFSTR("success"));
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
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durSinceLastSuccessfulComp), CFSTR("durSinceLastSuccessfulComp"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_failedComp), CFSTR("failedComp"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durSinceLastFailedComp), CFSTR("durSinceLastFailedComp"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_expiredComp), CFSTR("expiredComp"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_noAckComp), CFSTR("noAckComp"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_otherErrComp), CFSTR("otherErrComp"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durSinceLastEnqueue), CFSTR("durSinceLastEnqueue"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_qeuedPackets), CFSTR("qeuedPackets"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sinceLastEnqueueHowManyFailed), CFSTR("sinceLastEnqueueHowManyFailed"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sinceLastEnqueueHowManySuccess), CFSTR("sinceLastEnqueueHowManySuccess"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_19;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sinceLastSuccessHowManyFailed), CFSTR("sinceLastSuccessHowManyFailed"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durSinceLastEnqueueAtLastCheck), CFSTR("durSinceLastEnqueueAtLastCheck"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
LABEL_38:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_failedCompletionsAtLastCheck), CFSTR("failedCompletionsAtLastCheck"));
    if ((*(_DWORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_22;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_successfulCompletionsAtLastCheck), CFSTR("successfulCompletionsAtLastCheck"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
    goto LABEL_38;
LABEL_21:
  if ((*(_BYTE *)&has & 2) != 0)
LABEL_22:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dpsNotifications), CFSTR("dpsNotifications"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityPerACTxCompletionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $10A57E178583965F6CC2878FB3337F9B has;

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
      goto LABEL_21;
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
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 2) == 0)
      return;
LABEL_35:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 2) != 0)
    goto LABEL_35;
}

- (void)copyTo:(id)a3
{
  $10A57E178583965F6CC2878FB3337F9B has;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_ac;
    *((_DWORD *)a3 + 19) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 17) = self->_success;
  *((_DWORD *)a3 + 19) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 7) = self->_durSinceLastSuccessfulComp;
  *((_DWORD *)a3 + 19) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 9) = self->_failedComp;
  *((_DWORD *)a3 + 19) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 6) = self->_durSinceLastFailedComp;
  *((_DWORD *)a3 + 19) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 8) = self->_expiredComp;
  *((_DWORD *)a3 + 19) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 11) = self->_noAckComp;
  *((_DWORD *)a3 + 19) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 12) = self->_otherErrComp;
  *((_DWORD *)a3 + 19) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 4) = self->_durSinceLastEnqueue;
  *((_DWORD *)a3 + 19) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 13) = self->_qeuedPackets;
  *((_DWORD *)a3 + 19) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 14) = self->_sinceLastEnqueueHowManyFailed;
  *((_DWORD *)a3 + 19) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 15) = self->_sinceLastEnqueueHowManySuccess;
  *((_DWORD *)a3 + 19) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 16) = self->_sinceLastSuccessHowManyFailed;
  *((_DWORD *)a3 + 19) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 5) = self->_durSinceLastEnqueueAtLastCheck;
  *((_DWORD *)a3 + 19) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 18) = self->_successfulCompletionsAtLastCheck;
  *((_DWORD *)a3 + 19) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 2) == 0)
      return;
LABEL_35:
    *((_DWORD *)a3 + 3) = self->_dpsNotifications;
    *((_DWORD *)a3 + 19) |= 2u;
    return;
  }
LABEL_34:
  *((_DWORD *)a3 + 10) = self->_failedCompletionsAtLastCheck;
  *((_DWORD *)a3 + 19) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 2) != 0)
    goto LABEL_35;
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
  int v5;
  $10A57E178583965F6CC2878FB3337F9B has;
  int v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 19);
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_ac != *((_DWORD *)a3 + 2))
        goto LABEL_86;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_86:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_success != *((_DWORD *)a3 + 17))
        goto LABEL_86;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_durSinceLastSuccessfulComp != *((_DWORD *)a3 + 7))
        goto LABEL_86;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_failedComp != *((_DWORD *)a3 + 9))
        goto LABEL_86;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_durSinceLastFailedComp != *((_DWORD *)a3 + 6))
        goto LABEL_86;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_expiredComp != *((_DWORD *)a3 + 8))
        goto LABEL_86;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_noAckComp != *((_DWORD *)a3 + 11))
        goto LABEL_86;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_otherErrComp != *((_DWORD *)a3 + 12))
        goto LABEL_86;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_durSinceLastEnqueue != *((_DWORD *)a3 + 4))
        goto LABEL_86;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_qeuedPackets != *((_DWORD *)a3 + 13))
        goto LABEL_86;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_sinceLastEnqueueHowManyFailed != *((_DWORD *)a3 + 14))
        goto LABEL_86;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_sinceLastEnqueueHowManySuccess != *((_DWORD *)a3 + 15))
        goto LABEL_86;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_sinceLastSuccessHowManyFailed != *((_DWORD *)a3 + 16))
        goto LABEL_86;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_durSinceLastEnqueueAtLastCheck != *((_DWORD *)a3 + 5))
        goto LABEL_86;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_successfulCompletionsAtLastCheck != *((_DWORD *)a3 + 18))
        goto LABEL_86;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_86;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_failedCompletionsAtLastCheck != *((_DWORD *)a3 + 10))
        goto LABEL_86;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_86;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 19) & 2) == 0;
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_dpsNotifications != *((_DWORD *)a3 + 3))
        goto LABEL_86;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
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
  int v3;

  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 1) != 0)
  {
    self->_ac = *((_DWORD *)a3 + 2);
    *(_DWORD *)&self->_has |= 1u;
    v3 = *((_DWORD *)a3 + 19);
    if ((v3 & 0x8000) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((v3 & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  self->_success = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x8000u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  self->_durSinceLastSuccessfulComp = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  self->_failedComp = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x80u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  self->_durSinceLastFailedComp = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  self->_expiredComp = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x200) == 0)
  {
LABEL_8:
    if ((v3 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  self->_noAckComp = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x400) == 0)
  {
LABEL_9:
    if ((v3 & 4) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  self->_otherErrComp = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x400u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 4) == 0)
  {
LABEL_10:
    if ((v3 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  self->_durSinceLastEnqueue = *((_DWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x800) == 0)
  {
LABEL_11:
    if ((v3 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  self->_qeuedPackets = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x800u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x1000) == 0)
  {
LABEL_12:
    if ((v3 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  self->_sinceLastEnqueueHowManyFailed = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x2000) == 0)
  {
LABEL_13:
    if ((v3 & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  self->_sinceLastEnqueueHowManySuccess = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x4000) == 0)
  {
LABEL_14:
    if ((v3 & 8) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  self->_sinceLastSuccessHowManyFailed = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 8) == 0)
  {
LABEL_15:
    if ((v3 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  self->_durSinceLastEnqueueAtLastCheck = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x10000) == 0)
  {
LABEL_16:
    if ((v3 & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  self->_successfulCompletionsAtLastCheck = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 19);
  if ((v3 & 0x100) == 0)
  {
LABEL_17:
    if ((v3 & 2) == 0)
      return;
LABEL_35:
    self->_dpsNotifications = *((_DWORD *)a3 + 3);
    *(_DWORD *)&self->_has |= 2u;
    return;
  }
LABEL_34:
  self->_failedCompletionsAtLastCheck = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)a3 + 19) & 2) != 0)
    goto LABEL_35;
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
