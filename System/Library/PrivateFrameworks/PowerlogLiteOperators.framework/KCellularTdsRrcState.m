@implementation KCellularTdsRrcState

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

- (int)rrcState
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_rrcState;
  else
    return 0;
}

- (void)setRrcState:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_rrcState = a3;
}

- (void)setHasRrcState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRrcState
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)rrcStateAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("KTDS_RRC_STATE_CELL_DCH");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("KTDS_RRC_STATE_CELL_FACH");
      return v3;
    case 2:
      return CFSTR("KTDS_RRC_STATE_CELL_PCH");
    case 3:
      return CFSTR("KTDS_RRC_STATE_URA_PCH");
    case 4:
      return CFSTR("KTDS_RRC_STATE_IDLE");
    case 5:
      return CFSTR("KTDS_RRC_STATE_WAIT");
    case 6:
      return CFSTR("KTDS_RRC_STATE_CELL_BARRED");
    case 7:
      return CFSTR("KTDS_RRC_STATE_NULL");
    default:
      if (a3 == 255)
        return CFSTR("KTDS_RRC_STATE_INACTIVE");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsRrcState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_CELL_DCH")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_CELL_FACH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_CELL_PCH")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_URA_PCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_IDLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_WAIT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_CELL_BARRED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_NULL")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_INACTIVE")))
  {
    v4 = 255;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)newRrcState
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_newRrcState;
  else
    return 0;
}

- (void)setNewRrcState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_newRrcState = a3;
}

- (void)setHasNewRrcState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNewRrcState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)newRrcStateAsString:(int)a3
{
  id result;

  result = CFSTR("KTDS_RRC_STATE_CELL_DCH");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("KTDS_RRC_STATE_CELL_FACH");
      break;
    case 2:
      result = CFSTR("KTDS_RRC_STATE_CELL_PCH");
      break;
    case 3:
      result = CFSTR("KTDS_RRC_STATE_URA_PCH");
      break;
    case 4:
      result = CFSTR("KTDS_RRC_STATE_IDLE");
      break;
    case 5:
      result = CFSTR("KTDS_RRC_STATE_WAIT");
      break;
    case 6:
      result = CFSTR("KTDS_RRC_STATE_CELL_BARRED");
      break;
    case 7:
      result = CFSTR("KTDS_RRC_STATE_NULL");
      break;
    default:
      if (a3 == 255)
      {
        result = CFSTR("KTDS_RRC_STATE_INACTIVE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
        result = (id)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return result;
}

- (int)StringAsNewRrcState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_CELL_DCH")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_CELL_FACH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_CELL_PCH")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_URA_PCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_IDLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_WAIT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_CELL_BARRED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_NULL")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KTDS_RRC_STATE_INACTIVE")))
  {
    v4 = 255;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPrevStateDurMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_prevStateDurMs = a3;
}

- (void)setHasPrevStateDurMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPrevStateDurMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)KCellularTdsRrcState;
  -[KCellularTdsRrcState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCellularTdsRrcState dictionaryRepresentation](self, "dictionaryRepresentation");
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
  int rrcState;
  __CFString *v9;
  int newRrcState;
  __CFString *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  rrcState = self->_rrcState;
  v9 = CFSTR("KTDS_RRC_STATE_CELL_DCH");
  switch(rrcState)
  {
    case 0:
      break;
    case 1:
      v9 = CFSTR("KTDS_RRC_STATE_CELL_FACH");
      break;
    case 2:
      v9 = CFSTR("KTDS_RRC_STATE_CELL_PCH");
      break;
    case 3:
      v9 = CFSTR("KTDS_RRC_STATE_URA_PCH");
      break;
    case 4:
      v9 = CFSTR("KTDS_RRC_STATE_IDLE");
      break;
    case 5:
      v9 = CFSTR("KTDS_RRC_STATE_WAIT");
      break;
    case 6:
      v9 = CFSTR("KTDS_RRC_STATE_CELL_BARRED");
      break;
    case 7:
      v9 = CFSTR("KTDS_RRC_STATE_NULL");
      break;
    default:
      if (rrcState == 255)
      {
        v9 = CFSTR("KTDS_RRC_STATE_INACTIVE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rrcState);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rrc_state"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_prevStateDurMs);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("prev_state_dur_ms"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_21:
  newRrcState = self->_newRrcState;
  v11 = CFSTR("KTDS_RRC_STATE_CELL_DCH");
  switch(newRrcState)
  {
    case 0:
      break;
    case 1:
      v11 = CFSTR("KTDS_RRC_STATE_CELL_FACH");
      break;
    case 2:
      v11 = CFSTR("KTDS_RRC_STATE_CELL_PCH");
      break;
    case 3:
      v11 = CFSTR("KTDS_RRC_STATE_URA_PCH");
      break;
    case 4:
      v11 = CFSTR("KTDS_RRC_STATE_IDLE");
      break;
    case 5:
      v11 = CFSTR("KTDS_RRC_STATE_WAIT");
      break;
    case 6:
      v11 = CFSTR("KTDS_RRC_STATE_CELL_BARRED");
      break;
    case 7:
      v11 = CFSTR("KTDS_RRC_STATE_NULL");
      break;
    default:
      if (newRrcState == 255)
      {
        v11 = CFSTR("KTDS_RRC_STATE_INACTIVE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_newRrcState);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("new_rrc_state"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_33;
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_subsId);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularTdsRrcStateReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_rrcState;
  *((_BYTE *)v4 + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    *((_DWORD *)v4 + 5) = self->_prevStateDurMs;
    *((_BYTE *)v4 + 32) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *((_DWORD *)v4 + 4) = self->_newRrcState;
  *((_BYTE *)v4 + 32) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 7) = self->_subsId;
    *((_BYTE *)v4 + 32) |= 0x10u;
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_rrcState;
  *((_BYTE *)result + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_newRrcState;
  *((_BYTE *)result + 32) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_prevStateDurMs;
  *((_BYTE *)result + 32) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 7) = self->_subsId;
  *((_BYTE *)result + 32) |= 0x10u;
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
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_rrcState != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_newRrcState != *((_DWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_prevStateDurMs != *((_DWORD *)v4 + 5))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_26;
  }
  v5 = (*((_BYTE *)v4 + 32) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0 || self->_subsId != *((_DWORD *)v4 + 7))
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
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_rrcState;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_newRrcState;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_prevStateDurMs;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_subsId;
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
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_rrcState = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
LABEL_11:
    self->_prevStateDurMs = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_newRrcState = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 0x10) != 0)
  {
LABEL_6:
    self->_subsId = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_7:

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
