@implementation TRILogTime

- (void)setSecondsSince1970:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_secondsSince1970 = a3;
}

- (void)setHasSecondsSince1970:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecondsSince1970
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSecondsFromUtc:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_secondsFromUtc = a3;
}

- (void)setHasSecondsFromUtc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecondsFromUtc
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMinutesDstOffset:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minutesDstOffset = a3;
}

- (void)setHasMinutesDstOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinutesDstOffset
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TRILogTime;
  -[TRILogTime description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRILogTime dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_secondsFromUtc);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("seconds_from_utc"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_secondsSince1970);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("seconds_since_1970"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_minutesDstOffset);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("minutes_dst_offset"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRILogTimeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v4[5] = self->_secondsFromUtc;
    *((_BYTE *)v4 + 24) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_QWORD *)v4 + 1) = self->_secondsSince1970;
  *((_BYTE *)v4 + 24) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[4] = self->_minutesDstOffset;
    *((_BYTE *)v4 + 24) |= 2u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_secondsSince1970;
    *((_BYTE *)result + 24) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_secondsFromUtc;
  *((_BYTE *)result + 24) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 4) = self->_minutesDstOffset;
  *((_BYTE *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_secondsSince1970 != *((_QWORD *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_secondsFromUtc != *((_DWORD *)v4 + 5))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_minutesDstOffset != *((_DWORD *)v4 + 4))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761u * self->_secondsSince1970;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_secondsFromUtc;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_minutesDstOffset;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_secondsFromUtc = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_secondsSince1970 = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 2) != 0)
  {
LABEL_4:
    self->_minutesDstOffset = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:

}

- (unint64_t)secondsSince1970
{
  return self->_secondsSince1970;
}

- (int)secondsFromUtc
{
  return self->_secondsFromUtc;
}

- (int)minutesDstOffset
{
  return self->_minutesDstOffset;
}

+ (id)logTimeFromDate:(id)a3
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  objc_msgSend(a3, "timeIntervalSince1970");
  v4 = v3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSecondsSince1970:", (unint64_t)v4);
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondsFromUtc:", objc_msgSend(v6, "secondsFromGMT"));
  objc_msgSend(v6, "daylightSavingTimeOffset");
  objc_msgSend(v5, "setMinutesDstOffset:", ((int)v7 / 60));

  return v5;
}

@end
