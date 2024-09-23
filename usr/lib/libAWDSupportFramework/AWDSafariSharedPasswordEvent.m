@implementation AWDSafariSharedPasswordEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)initiatedSharePasswordOutcome
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_initiatedSharePasswordOutcome;
  else
    return 0;
}

- (void)setInitiatedSharePasswordOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_initiatedSharePasswordOutcome = a3;
}

- (void)setHasInitiatedSharePasswordOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInitiatedSharePasswordOutcome
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)initiatedSharePasswordOutcomeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E208[a3];
}

- (int)StringAsInitiatedSharePasswordOutcome:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("COMPLETED")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CANCELLED")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("FAILED_WITH_ERROR")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ABORTED_DUE_TO_LOCKOUT")))
    return 3;
  return 0;
}

- (int)receivedSharedPasswordOutcome
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_receivedSharedPasswordOutcome;
  else
    return 0;
}

- (void)setReceivedSharedPasswordOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_receivedSharedPasswordOutcome = a3;
}

- (void)setHasReceivedSharedPasswordOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReceivedSharedPasswordOutcome
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)receivedSharedPasswordOutcomeAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E228[a3];
}

- (int)StringAsReceivedSharedPasswordOutcome:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NO_CONFLICT")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("UPDATE_EXISTING_PASSWORD_AFTER_CONFLICT")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("DO_NOT_UPDATE_EXISTING_PASSWORD_AFTER_CONFLICT")))
    return 2;
  return 0;
}

- (int)passwordSharingMechanism
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_passwordSharingMechanism;
  else
    return 0;
}

- (void)setPasswordSharingMechanism:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_passwordSharingMechanism = a3;
}

- (void)setHasPasswordSharingMechanism:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPasswordSharingMechanism
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)passwordSharingMechanismAsString:(int)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return CFSTR("AIRDROP");
}

- (int)StringAsPasswordSharingMechanism:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("AIRDROP"));
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSafariSharedPasswordEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSafariSharedPasswordEvent description](&v3, sel_description), -[AWDSafariSharedPasswordEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t initiatedSharePasswordOutcome;
  __CFString *v6;
  uint64_t receivedSharedPasswordOutcome;
  __CFString *v8;
  const __CFString *v9;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  initiatedSharePasswordOutcome = self->_initiatedSharePasswordOutcome;
  if (initiatedSharePasswordOutcome >= 4)
    v6 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_initiatedSharePasswordOutcome);
  else
    v6 = off_24C10E208[initiatedSharePasswordOutcome];
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("initiatedSharePasswordOutcome"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      return v3;
    goto LABEL_15;
  }
LABEL_11:
  receivedSharedPasswordOutcome = self->_receivedSharedPasswordOutcome;
  if (receivedSharedPasswordOutcome >= 3)
    v8 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_receivedSharedPasswordOutcome);
  else
    v8 = off_24C10E228[receivedSharedPasswordOutcome];
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("receivedSharedPasswordOutcome"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_15:
    if (self->_passwordSharingMechanism)
      v9 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_passwordSharingMechanism);
    else
      v9 = CFSTR("AIRDROP");
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("passwordSharingMechanism"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariSharedPasswordEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      return;
LABEL_9:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_8:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_9;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_initiatedSharePasswordOutcome;
  *((_BYTE *)a3 + 28) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      return;
LABEL_9:
    *((_DWORD *)a3 + 5) = self->_passwordSharingMechanism;
    *((_BYTE *)a3 + 28) |= 4u;
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 6) = self->_receivedSharedPasswordOutcome;
  *((_BYTE *)a3 + 28) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_BYTE *)result + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_initiatedSharePasswordOutcome;
  *((_BYTE *)result + 28) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 6) = self->_receivedSharedPasswordOutcome;
  *((_BYTE *)result + 28) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 5) = self->_passwordSharingMechanism;
  *((_BYTE *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 28) & 1) != 0)
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_initiatedSharePasswordOutcome != *((_DWORD *)a3 + 4))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 28) & 2) != 0)
    {
      goto LABEL_21;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 8) == 0 || self->_receivedSharedPasswordOutcome != *((_DWORD *)a3 + 6))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 28) & 8) != 0)
    {
      goto LABEL_21;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 28) & 4) == 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 4) == 0 || self->_passwordSharingMechanism != *((_DWORD *)a3 + 5))
        goto LABEL_21;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_initiatedSharePasswordOutcome;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_receivedSharedPasswordOutcome;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_passwordSharingMechanism;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 28);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_initiatedSharePasswordOutcome = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      return;
LABEL_9:
    self->_passwordSharingMechanism = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
    return;
  }
LABEL_8:
  self->_receivedSharedPasswordOutcome = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 28) & 4) != 0)
    goto LABEL_9;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end
