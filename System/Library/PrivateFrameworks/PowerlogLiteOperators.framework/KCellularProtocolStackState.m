@implementation KCellularProtocolStackState

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

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  if (a3 < 0xC)
    return off_1E857D068[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPrevState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_OFF_OR_AIRPLANE_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_OOS_IDLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_OOS_NETWORK_SCAN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_IDLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_ESTABLISHING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_CONNECTED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_RELEASING")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_TX_RX_SUSPENDED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_OOS_SRLTE_NETWORK_SCAN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_OOS_HYBRID_NETWORK_SCAN")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_SRLTE_IDLE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_HYBRID_IDLE")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)currState
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_currState;
  else
    return 0;
}

- (void)setCurrState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_currState = a3;
}

- (void)setHasCurrState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)currStateAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E857D068[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCurrState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_OFF_OR_AIRPLANE_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_OOS_IDLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_OOS_NETWORK_SCAN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_IDLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_ESTABLISHING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_CONNECTED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_RELEASING")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_TX_RX_SUSPENDED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_OOS_SRLTE_NETWORK_SCAN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_OOS_HYBRID_NETWORK_SCAN")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_SRLTE_IDLE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KPS_STATE_HYBRID_IDLE")))
  {
    v4 = 11;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)KCellularProtocolStackState;
  -[KCellularProtocolStackState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCellularProtocolStackState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  uint64_t prevState;
  __CFString *v10;
  uint64_t currState;
  __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_subsId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("subs_id"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_14:
    currState = self->_currState;
    if (currState >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_currState);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E857D068[currState];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("curr_state"));

    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
    return v3;
  }
LABEL_10:
  prevState = self->_prevState;
  if (prevState >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_prevState);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E857D068[prevState];
  }
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("prev_state"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_14;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prevStateDurMs);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("prev_state_dur_ms"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularProtocolStackStateReadFrom((uint64_t)self, (uint64_t)a3);
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
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 8) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:

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
    *((_BYTE *)v4 + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_subsId;
  *((_BYTE *)v4 + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_11:
    *((_DWORD *)v4 + 4) = self->_currState;
    *((_BYTE *)v4 + 32) |= 2u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *((_DWORD *)v4 + 5) = self->_prevState;
  *((_BYTE *)v4 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 6) = self->_prevStateDurMs;
    *((_BYTE *)v4 + 32) |= 8u;
  }
LABEL_7:

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
    *((_BYTE *)result + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_subsId;
  *((_BYTE *)result + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 5) = self->_prevState;
  *((_BYTE *)result + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_currState;
  *((_BYTE *)result + 32) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 6) = self->_prevStateDurMs;
  *((_BYTE *)result + 32) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_26:
    v5 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0 || self->_subsId != *((_DWORD *)v4 + 7))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_prevState != *((_DWORD *)v4 + 5))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_currState != *((_DWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_26;
  }
  v5 = (*((_BYTE *)v4 + 32) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_prevStateDurMs != *((_DWORD *)v4 + 6))
      goto LABEL_26;
    v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_subsId;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
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
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_currState;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_prevStateDurMs;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_subsId = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
LABEL_11:
    self->_currState = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 32) & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_prevState = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 8) != 0)
  {
LABEL_6:
    self->_prevStateDurMs = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_7:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)prevStateDurMs
{
  return self->_prevStateDurMs;
}

@end
