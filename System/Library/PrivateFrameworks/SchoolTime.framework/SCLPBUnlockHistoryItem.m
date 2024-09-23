@implementation SCLPBUnlockHistoryItem

- (void)setStartTimeIntervalSinceReferenceDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startTimeIntervalSinceReferenceDate = a3;
}

- (void)setHasStartTimeIntervalSinceReferenceDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartTimeIntervalSinceReferenceDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCalendarIdentifier
{
  return self->_calendarIdentifier != 0;
}

- (BOOL)hasTimeZoneName
{
  return self->_timeZoneName != 0;
}

- (void)setScheduleStartHour:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_scheduleStartHour = a3;
}

- (void)setHasScheduleStartHour:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasScheduleStartHour
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setScheduleStartMinute:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_scheduleStartMinute = a3;
}

- (void)setHasScheduleStartMinute:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScheduleStartMinute
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setScheduleEndHour:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_scheduleEndHour = a3;
}

- (void)setHasScheduleEndHour:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScheduleEndHour
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setScheduleEndMinute:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_scheduleEndMinute = a3;
}

- (void)setHasScheduleEndMinute:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasScheduleEndMinute
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SCLPBUnlockHistoryItem;
  -[SCLPBUnlockHistoryItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBUnlockHistoryItem dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *calendarIdentifier;
  NSString *timeZoneName;
  char v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_startTimeIntervalSinceReferenceDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("startTimeIntervalSinceReferenceDate"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration"));

  }
  calendarIdentifier = self->_calendarIdentifier;
  if (calendarIdentifier)
    objc_msgSend(v3, "setObject:forKey:", calendarIdentifier, CFSTR("calendarIdentifier"));
  timeZoneName = self->_timeZoneName;
  if (timeZoneName)
    objc_msgSend(v3, "setObject:forKey:", timeZoneName, CFSTR("timeZoneName"));
  v9 = (char)self->_has;
  if ((v9 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scheduleStartHour);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("scheduleStartHour"));

    v9 = (char)self->_has;
    if ((v9 & 0x20) == 0)
    {
LABEL_11:
      if ((v9 & 4) == 0)
        goto LABEL_12;
LABEL_17:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scheduleEndHour);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("scheduleEndHour"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v3;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scheduleStartMinute);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("scheduleStartMinute"));

  v9 = (char)self->_has;
  if ((v9 & 4) != 0)
    goto LABEL_17;
LABEL_12:
  if ((v9 & 8) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scheduleEndMinute);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("scheduleEndMinute"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SCLPBUnlockHistoryItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_calendarIdentifier)
    PBDataWriterWriteStringField();
  if (self->_timeZoneName)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
    if ((v5 & 0x20) == 0)
    {
LABEL_11:
      if ((v5 & 4) == 0)
        goto LABEL_12;
LABEL_17:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  v5 = (char)self->_has;
  if ((v5 & 4) != 0)
    goto LABEL_17;
LABEL_12:
  if ((v5 & 8) != 0)
LABEL_13:
    PBDataWriterWriteUint32Field();
LABEL_14:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_startTimeIntervalSinceReferenceDate;
    *((_BYTE *)v4 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_duration;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v7 = v4;
  if (self->_calendarIdentifier)
  {
    objc_msgSend(v4, "setCalendarIdentifier:");
    v4 = v7;
  }
  if (self->_timeZoneName)
  {
    objc_msgSend(v7, "setTimeZoneName:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_scheduleStartHour;
    *((_BYTE *)v4 + 56) |= 0x10u;
    v6 = (char)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0)
        goto LABEL_12;
LABEL_17:
      *((_DWORD *)v4 + 8) = self->_scheduleEndHour;
      *((_BYTE *)v4 + 56) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 11) = self->_scheduleStartMinute;
  *((_BYTE *)v4 + 56) |= 0x20u;
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
    goto LABEL_17;
LABEL_12:
  if ((v6 & 8) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 9) = self->_scheduleEndMinute;
    *((_BYTE *)v4 + 56) |= 8u;
  }
LABEL_14:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_startTimeIntervalSinceReferenceDate;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_calendarIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_timeZoneName, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v10;

  v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_scheduleStartHour;
    *(_BYTE *)(v6 + 56) |= 0x10u;
    v12 = (char)self->_has;
    if ((v12 & 0x20) == 0)
    {
LABEL_7:
      if ((v12 & 4) == 0)
        goto LABEL_8;
LABEL_13:
      *(_DWORD *)(v6 + 32) = self->_scheduleEndHour;
      *(_BYTE *)(v6 + 56) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v6;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 44) = self->_scheduleStartMinute;
  *(_BYTE *)(v6 + 56) |= 0x20u;
  v12 = (char)self->_has;
  if ((v12 & 4) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v12 & 8) != 0)
  {
LABEL_9:
    *(_DWORD *)(v6 + 36) = self->_scheduleEndMinute;
    *(_BYTE *)(v6 + 56) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *calendarIdentifier;
  NSString *timeZoneName;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_startTimeIntervalSinceReferenceDate != *((double *)v4 + 2))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_35:
    v7 = 0;
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_duration != *((double *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_35;
  }
  calendarIdentifier = self->_calendarIdentifier;
  if ((unint64_t)calendarIdentifier | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](calendarIdentifier, "isEqual:"))
  {
    goto LABEL_35;
  }
  timeZoneName = self->_timeZoneName;
  if ((unint64_t)timeZoneName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](timeZoneName, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_scheduleStartHour != *((_DWORD *)v4 + 10))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) == 0 || self->_scheduleStartMinute != *((_DWORD *)v4 + 11))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_scheduleEndHour != *((_DWORD *)v4 + 8))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_35;
  }
  v7 = (*((_BYTE *)v4 + 56) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_scheduleEndMinute != *((_DWORD *)v4 + 9))
      goto LABEL_35;
    v7 = 1;
  }
LABEL_36:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startTimeIntervalSinceReferenceDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double duration;
  double v11;
  long double v12;
  double v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    startTimeIntervalSinceReferenceDate = self->_startTimeIntervalSinceReferenceDate;
    v6 = -startTimeIntervalSinceReferenceDate;
    if (startTimeIntervalSinceReferenceDate >= 0.0)
      v6 = self->_startTimeIntervalSinceReferenceDate;
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
  if ((has & 1) != 0)
  {
    duration = self->_duration;
    v11 = -duration;
    if (duration >= 0.0)
      v11 = self->_duration;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v14 = -[NSString hash](self->_calendarIdentifier, "hash");
  v15 = -[NSString hash](self->_timeZoneName, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v16 = 2654435761 * self->_scheduleStartHour;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_19:
      v17 = 2654435761 * self->_scheduleStartMinute;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_20;
LABEL_24:
      v18 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_21;
LABEL_25:
      v19 = 0;
      return v9 ^ v4 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
    }
  }
  else
  {
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_19;
  }
  v17 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_24;
LABEL_20:
  v18 = 2654435761 * self->_scheduleEndHour;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_25;
LABEL_21:
  v19 = 2654435761 * self->_scheduleEndMinute;
  return v9 ^ v4 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_startTimeIntervalSinceReferenceDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 1) != 0)
  {
    self->_duration = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[SCLPBUnlockHistoryItem setCalendarIdentifier:](self, "setCalendarIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[SCLPBUnlockHistoryItem setTimeZoneName:](self, "setTimeZoneName:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 56);
  if ((v6 & 0x10) != 0)
  {
    self->_scheduleStartHour = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)v4 + 56);
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0)
        goto LABEL_12;
LABEL_17:
      self->_scheduleEndHour = *((_DWORD *)v4 + 8);
      *(_BYTE *)&self->_has |= 4u;
      if ((*((_BYTE *)v4 + 56) & 8) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 0x20) == 0)
  {
    goto LABEL_11;
  }
  self->_scheduleStartMinute = *((_DWORD *)v4 + 11);
  *(_BYTE *)&self->_has |= 0x20u;
  v6 = *((_BYTE *)v4 + 56);
  if ((v6 & 4) != 0)
    goto LABEL_17;
LABEL_12:
  if ((v6 & 8) != 0)
  {
LABEL_13:
    self->_scheduleEndMinute = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_14:

}

- (double)startTimeIntervalSinceReferenceDate
{
  return self->_startTimeIntervalSinceReferenceDate;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_calendarIdentifier, a3);
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (void)setTimeZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneName, a3);
}

- (unsigned)scheduleStartHour
{
  return self->_scheduleStartHour;
}

- (unsigned)scheduleStartMinute
{
  return self->_scheduleStartMinute;
}

- (unsigned)scheduleEndHour
{
  return self->_scheduleEndHour;
}

- (unsigned)scheduleEndMinute
{
  return self->_scheduleEndMinute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end
