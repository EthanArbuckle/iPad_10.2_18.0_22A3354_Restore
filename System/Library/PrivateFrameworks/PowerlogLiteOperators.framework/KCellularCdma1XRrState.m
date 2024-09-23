@implementation KCellularCdma1XRrState

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

- (void)setPrevCpState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_prevCpState = a3;
}

- (void)setHasPrevCpState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPrevCpState
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCurrCpState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_currCpState = a3;
}

- (void)setHasCurrCpState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrCpState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPrevStateDurMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_prevStateDurMs = a3;
}

- (void)setHasPrevStateDurMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPrevStateDurMs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)currNormalizedState
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_currNormalizedState;
  else
    return 0;
}

- (void)setCurrNormalizedState:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_currNormalizedState = a3;
}

- (void)setHasCurrNormalizedState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCurrNormalizedState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)currNormalizedStateAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E857BD90[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCurrNormalizedState:(id)a3
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)KCellularCdma1XRrState;
  -[KCellularCdma1XRrState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCellularCdma1XRrState dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t currNormalizedState;
  __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_subsId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("subs_id"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prevCpState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("prev_cp_state"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prevStateDurMs);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("prev_state_dur_ms"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currCpState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("curr_cp_state"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_12;
LABEL_6:
  if ((has & 4) == 0)
    return v3;
LABEL_13:
  currNormalizedState = self->_currNormalizedState;
  if (currNormalizedState >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_currNormalizedState);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E857BD90[currNormalizedState];
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("curr_normalized_state"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularCdma1XRrStateReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 4) != 0)
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
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 8) = self->_subsId;
  *((_BYTE *)v4 + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)v4 + 6) = self->_prevCpState;
  *((_BYTE *)v4 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    *((_DWORD *)v4 + 7) = self->_prevStateDurMs;
    *((_BYTE *)v4 + 36) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_DWORD *)v4 + 4) = self->_currCpState;
  *((_BYTE *)v4 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 5) = self->_currNormalizedState;
    *((_BYTE *)v4 + 36) |= 4u;
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
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_subsId;
  *((_BYTE *)result + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 6) = self->_prevCpState;
  *((_BYTE *)result + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 4) = self->_currCpState;
  *((_BYTE *)result + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_prevStateDurMs;
  *((_BYTE *)result + 36) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 5) = self->_currNormalizedState;
  *((_BYTE *)result + 36) |= 4u;
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
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 8))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_prevCpState != *((_DWORD *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_currCpState != *((_DWORD *)v4 + 4))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_prevStateDurMs != *((_DWORD *)v4 + 7))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  v5 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_currNormalizedState != *((_DWORD *)v4 + 5))
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
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_subsId;
      if ((*(_BYTE *)&self->_has & 8) != 0)
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
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_prevCpState;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_currCpState;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_prevStateDurMs;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_currNormalizedState;
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
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_subsId = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_prevCpState = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    self->_prevStateDurMs = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_currCpState = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 4) != 0)
  {
LABEL_7:
    self->_currNormalizedState = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_8:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)prevCpState
{
  return self->_prevCpState;
}

- (unsigned)currCpState
{
  return self->_currCpState;
}

- (unsigned)prevStateDurMs
{
  return self->_prevStateDurMs;
}

@end
