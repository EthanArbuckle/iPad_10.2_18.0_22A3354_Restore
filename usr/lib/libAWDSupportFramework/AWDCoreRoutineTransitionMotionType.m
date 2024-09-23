@implementation AWDCoreRoutineTransitionMotionType

- (void)setCoreRoutineTransitionMotionTypeStationary:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_coreRoutineTransitionMotionTypeStationary = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeStationary:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeStationary
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCoreRoutineTransitionMotionTypeWalking:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_coreRoutineTransitionMotionTypeWalking = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeWalking:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeWalking
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCoreRoutineTransitionMotionTypeRunning:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_coreRoutineTransitionMotionTypeRunning = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeRunning:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeRunning
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCoreRoutineTransitionMotionTypeAutomotive:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_coreRoutineTransitionMotionTypeAutomotive = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeAutomotive:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeAutomotive
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCoreRoutineTransitionMotionTypeCycling:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_coreRoutineTransitionMotionTypeCycling = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeCycling:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeCycling
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCoreRoutineTransitionMotionTypeUnknown:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_coreRoutineTransitionMotionTypeUnknown = a3;
}

- (void)setHasCoreRoutineTransitionMotionTypeUnknown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCoreRoutineTransitionMotionTypeUnknown
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineTransitionMotionType;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineTransitionMotionType description](&v3, sel_description), -[AWDCoreRoutineTransitionMotionType dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_coreRoutineTransitionMotionTypeStationary), CFSTR("CoreRoutineTransitionMotionTypeStationary"));
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_coreRoutineTransitionMotionTypeWalking), CFSTR("CoreRoutineTransitionMotionTypeWalking"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_coreRoutineTransitionMotionTypeRunning), CFSTR("CoreRoutineTransitionMotionTypeRunning"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_coreRoutineTransitionMotionTypeCycling), CFSTR("CoreRoutineTransitionMotionTypeCycling"));
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_coreRoutineTransitionMotionTypeAutomotive), CFSTR("CoreRoutineTransitionMotionTypeAutomotive"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x10) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_coreRoutineTransitionMotionTypeUnknown), CFSTR("CoreRoutineTransitionMotionTypeUnknown"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineTransitionMotionTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      return;
LABEL_13:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_coreRoutineTransitionMotionTypeStationary;
    *((_BYTE *)a3 + 32) |= 8u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_coreRoutineTransitionMotionTypeWalking;
  *((_BYTE *)a3 + 32) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)a3 + 4) = self->_coreRoutineTransitionMotionTypeRunning;
  *((_BYTE *)a3 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 2) = self->_coreRoutineTransitionMotionTypeAutomotive;
  *((_BYTE *)a3 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      return;
LABEL_13:
    *((_DWORD *)a3 + 6) = self->_coreRoutineTransitionMotionTypeUnknown;
    *((_BYTE *)a3 + 32) |= 0x10u;
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 3) = self->_coreRoutineTransitionMotionTypeCycling;
  *((_BYTE *)a3 + 32) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_coreRoutineTransitionMotionTypeStationary;
    *((_BYTE *)result + 32) |= 8u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_coreRoutineTransitionMotionTypeWalking;
  *((_BYTE *)result + 32) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_coreRoutineTransitionMotionTypeRunning;
  *((_BYTE *)result + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 2) = self->_coreRoutineTransitionMotionTypeAutomotive;
  *((_BYTE *)result + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 3) = self->_coreRoutineTransitionMotionTypeCycling;
  *((_BYTE *)result + 32) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 6) = self->_coreRoutineTransitionMotionTypeUnknown;
  *((_BYTE *)result + 32) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 8) == 0 || self->_coreRoutineTransitionMotionTypeStationary != *((_DWORD *)a3 + 5))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 32) & 8) != 0)
    {
LABEL_31:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 0x20) == 0 || self->_coreRoutineTransitionMotionTypeWalking != *((_DWORD *)a3 + 7))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 32) & 0x20) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_coreRoutineTransitionMotionTypeRunning != *((_DWORD *)a3 + 4))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 32) & 4) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_coreRoutineTransitionMotionTypeAutomotive != *((_DWORD *)a3 + 2))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
      goto LABEL_31;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_coreRoutineTransitionMotionTypeCycling != *((_DWORD *)a3 + 3))
        goto LABEL_31;
    }
    else if ((*((_BYTE *)a3 + 32) & 2) != 0)
    {
      goto LABEL_31;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 0x10) == 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 0x10) == 0 || self->_coreRoutineTransitionMotionTypeUnknown != *((_DWORD *)a3 + 6))
        goto LABEL_31;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v2 = 2654435761 * self->_coreRoutineTransitionMotionTypeStationary;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_coreRoutineTransitionMotionTypeWalking;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_coreRoutineTransitionMotionTypeRunning;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_coreRoutineTransitionMotionTypeAutomotive;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_coreRoutineTransitionMotionTypeCycling;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_coreRoutineTransitionMotionTypeUnknown;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 8) != 0)
  {
    self->_coreRoutineTransitionMotionTypeStationary = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 8u;
    v3 = *((_BYTE *)a3 + 32);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_coreRoutineTransitionMotionTypeWalking = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  self->_coreRoutineTransitionMotionTypeRunning = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  self->_coreRoutineTransitionMotionTypeAutomotive = *((_DWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0)
      return;
LABEL_13:
    self->_coreRoutineTransitionMotionTypeUnknown = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 0x10u;
    return;
  }
LABEL_12:
  self->_coreRoutineTransitionMotionTypeCycling = *((_DWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 32) & 0x10) != 0)
    goto LABEL_13;
}

- (unsigned)coreRoutineTransitionMotionTypeStationary
{
  return self->_coreRoutineTransitionMotionTypeStationary;
}

- (unsigned)coreRoutineTransitionMotionTypeWalking
{
  return self->_coreRoutineTransitionMotionTypeWalking;
}

- (unsigned)coreRoutineTransitionMotionTypeRunning
{
  return self->_coreRoutineTransitionMotionTypeRunning;
}

- (unsigned)coreRoutineTransitionMotionTypeAutomotive
{
  return self->_coreRoutineTransitionMotionTypeAutomotive;
}

- (unsigned)coreRoutineTransitionMotionTypeCycling
{
  return self->_coreRoutineTransitionMotionTypeCycling;
}

- (unsigned)coreRoutineTransitionMotionTypeUnknown
{
  return self->_coreRoutineTransitionMotionTypeUnknown;
}

@end
