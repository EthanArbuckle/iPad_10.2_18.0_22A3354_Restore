@implementation AWDMETRICSCellularPowerLogLTERRCStateChange

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  uint64_t state;
  __CFString *v7;
  uint64_t prevState;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t cause;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  state = self->_state;
  if (state >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_state);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E8577F90[state];
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("state"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_13:
  prevState = self->_prevState;
  if (prevState >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_prevState);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E8577F90[prevState];
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("prev_state"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_subsId);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("subs_id"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_19;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prevStateDurMs);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("prev_state_dur_ms"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_18;
LABEL_6:
  if ((has & 2) == 0)
    return v3;
LABEL_19:
  cause = self->_cause;
  v13 = CFSTR("EMERGENCY");
  switch((int)cause)
  {
    case 0:
      break;
    case 1:
      v13 = CFSTR("HIGH_PRIORITY");
      break;
    case 2:
      v13 = CFSTR("MT_ACCESS");
      break;
    case 3:
      v13 = CFSTR("MO_SIGNALING");
      break;
    case 4:
      v13 = CFSTR("MO_DATA");
      break;
    case 5:
      v13 = CFSTR("MO_CSFB");
      break;
    case 6:
      v13 = CFSTR("DELAY_TOLERANT_ACCESS");
      break;
    case 7:
      v13 = CFSTR("MAX");
      break;
    default:
      if ((_DWORD)cause == 254)
      {
        v13 = CFSTR("NONE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), cause);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cause"));

  return v3;
}

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

- (int)state
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_state;
  else
    return 0;
}

- (void)setState:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasState
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 < 8)
    return off_1E8577F90[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INACTIVE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IDLE_NOT_CAMPED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IDLE_CAMPED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUSPENDED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IRAT_TO_LTE_STARTED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLOSING")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)prevState
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_prevState;
  else
    return 0;
}

- (void)setPrevState:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_prevState = a3;
}

- (void)setHasPrevState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPrevState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)prevStateAsString:(int)a3
{
  if (a3 < 8)
    return off_1E8577F90[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPrevState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INACTIVE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IDLE_NOT_CAMPED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IDLE_CAMPED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUSPENDED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IRAT_TO_LTE_STARTED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLOSING")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPrevStateDurMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_prevStateDurMs = a3;
}

- (void)setHasPrevStateDurMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPrevStateDurMs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (int)cause
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_cause;
  else
    return 0;
}

- (void)setCause:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cause = a3;
}

- (void)setHasCause:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCause
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)causeAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("EMERGENCY");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("HIGH_PRIORITY");
      return v3;
    case 2:
      return CFSTR("MT_ACCESS");
    case 3:
      return CFSTR("MO_SIGNALING");
    case 4:
      return CFSTR("MO_DATA");
    case 5:
      return CFSTR("MO_CSFB");
    case 6:
      return CFSTR("DELAY_TOLERANT_ACCESS");
    case 7:
      return CFSTR("MAX");
    default:
      if (a3 == 254)
        return CFSTR("NONE");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMERGENCY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGH_PRIORITY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MT_ACCESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MO_SIGNALING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MO_DATA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MO_CSFB")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DELAY_TOLERANT_ACCESS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAX")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")))
  {
    v4 = 254;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularPowerLogLTERRCStateChange;
  -[AWDMETRICSCellularPowerLogLTERRCStateChange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDMETRICSCellularPowerLogLTERRCStateChange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogLTERRCStateChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 2) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_state;
  *((_BYTE *)v4 + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)v4 + 5) = self->_prevState;
  *((_BYTE *)v4 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    *((_DWORD *)v4 + 8) = self->_subsId;
    *((_BYTE *)v4 + 36) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_DWORD *)v4 + 6) = self->_prevStateDurMs;
  *((_BYTE *)v4 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 2) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 4) = self->_cause;
    *((_BYTE *)v4 + 36) |= 2u;
  }
LABEL_8:

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
    *((_BYTE *)result + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_state;
  *((_BYTE *)result + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_prevState;
  *((_BYTE *)result + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_prevStateDurMs;
  *((_BYTE *)result + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 8) = self->_subsId;
  *((_BYTE *)result + 36) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 4) = self->_cause;
  *((_BYTE *)result + 36) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_31:
    v5 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_state != *((_DWORD *)v4 + 7))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_prevState != *((_DWORD *)v4 + 5))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_prevStateDurMs != *((_DWORD *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 8))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  v5 = (*((_BYTE *)v4 + 36) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_cause != *((_DWORD *)v4 + 4))
      goto LABEL_31;
    v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_state;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_prevState;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_prevStateDurMs;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_subsId;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_cause;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_state = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_prevState = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    self->_subsId = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 0x20u;
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_prevStateDurMs = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 2) != 0)
  {
LABEL_7:
    self->_cause = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_8:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)prevStateDurMs
{
  return self->_prevStateDurMs;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
