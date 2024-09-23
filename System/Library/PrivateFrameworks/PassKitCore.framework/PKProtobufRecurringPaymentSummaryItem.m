@implementation PKProtobufRecurringPaymentSummaryItem

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIntervalUnit:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_intervalUnit = a3;
}

- (void)setHasIntervalUnit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIntervalUnit
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIntervalCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_intervalCount = a3;
}

- (void)setHasIntervalCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntervalCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDate
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)PKProtobufRecurringPaymentSummaryItem;
  -[PKProtobufRecurringPaymentSummaryItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufRecurringPaymentSummaryItem dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("startDate"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_intervalCount);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("intervalCount"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_intervalUnit);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("intervalUnit"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("endDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRecurringPaymentSummaryItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_startDate;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *((_DWORD *)v4 + 6) = self->_intervalCount;
      *((_BYTE *)v4 + 32) |= 4u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_intervalUnit;
  *((_BYTE *)v4 + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    v4[1] = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 32) |= 1u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_startDate;
    *((_BYTE *)result + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_intervalUnit;
  *((_BYTE *)result + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 6) = self->_intervalCount;
  *((_BYTE *)result + 32) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_5:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_endDate;
  *((_BYTE *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_startDate != *((double *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_intervalUnit != *((_DWORD *)v4 + 7))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_intervalCount != *((_DWORD *)v4 + 6))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_endDate != *((double *)v4 + 1))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startDate;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double endDate;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    startDate = self->_startDate;
    v6 = -startDate;
    if (startDate >= 0.0)
      v6 = self->_startDate;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 8) == 0)
  {
    v9 = 0;
    if ((has & 4) != 0)
      goto LABEL_11;
LABEL_17:
    v10 = 0;
    if ((has & 1) != 0)
      goto LABEL_12;
LABEL_18:
    v15 = 0;
    return v9 ^ v4 ^ v10 ^ v15;
  }
  v9 = 2654435761 * self->_intervalUnit;
  if ((has & 4) == 0)
    goto LABEL_17;
LABEL_11:
  v10 = 2654435761 * self->_intervalCount;
  if ((has & 1) == 0)
    goto LABEL_18;
LABEL_12:
  endDate = self->_endDate;
  v12 = -endDate;
  if (endDate >= 0.0)
    v12 = self->_endDate;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
  return v9 ^ v4 ^ v10 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_startDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      self->_intervalCount = *((_DWORD *)v4 + 6);
      *(_BYTE *)&self->_has |= 4u;
      if ((*((_BYTE *)v4 + 32) & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_intervalUnit = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 1) != 0)
  {
LABEL_5:
    self->_endDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_6:

}

- (double)startDate
{
  return self->_startDate;
}

- (unsigned)intervalUnit
{
  return self->_intervalUnit;
}

- (unsigned)intervalCount
{
  return self->_intervalCount;
}

- (double)endDate
{
  return self->_endDate;
}

@end
