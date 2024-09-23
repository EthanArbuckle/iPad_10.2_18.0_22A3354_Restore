@implementation AWDCoreRoutineLMPDailyAssessment

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

- (void)setDailyEvents:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dailyEvents = a3;
}

- (void)setHasDailyEvents:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDailyEvents
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEventsWithLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_eventsWithLocation = a3;
}

- (void)setHasEventsWithLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEventsWithLocation
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEventsWithMaybeLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_eventsWithMaybeLocation = a3;
}

- (void)setHasEventsWithMaybeLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEventsWithMaybeLocation
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setEventsWithLMPLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_eventsWithLMPLocation = a3;
}

- (void)setHasEventsWithLMPLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEventsWithLMPLocation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setVisitLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_visitLocation = a3;
}

- (void)setHasVisitLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVisitLocation
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setVisitMaybeLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_visitMaybeLocation = a3;
}

- (void)setHasVisitMaybeLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasVisitMaybeLocation
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setVisitLMPLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_visitLMPLocation = a3;
}

- (void)setHasVisitLMPLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasVisitLMPLocation
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPDailyAssessment;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLMPDailyAssessment description](&v3, sel_description), -[AWDCoreRoutineLMPDailyAssessment dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

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
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_dailyEvents), CFSTR("dailyEvents"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_eventsWithLocation), CFSTR("eventsWithLocation"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_eventsWithMaybeLocation), CFSTR("eventsWithMaybeLocation"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_eventsWithLMPLocation), CFSTR("eventsWithLMPLocation"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_visitMaybeLocation), CFSTR("visitMaybeLocation"));
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_visitLocation), CFSTR("visitLocation"));
  has = (char)self->_has;
  if (has < 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x20) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_visitLMPLocation), CFSTR("visitLMPLocation"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPDailyAssessmentReadFrom((uint64_t)self, (uint64_t)a3);
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
      goto LABEL_12;
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
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      return;
LABEL_17:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_17;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_dailyEvents;
  *((_BYTE *)a3 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)a3 + 6) = self->_eventsWithLocation;
  *((_BYTE *)a3 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 7) = self->_eventsWithMaybeLocation;
  *((_BYTE *)a3 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_eventsWithLMPLocation;
  *((_BYTE *)a3 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 9) = self->_visitLocation;
  *((_BYTE *)a3 + 44) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      return;
LABEL_17:
    *((_DWORD *)a3 + 8) = self->_visitLMPLocation;
    *((_BYTE *)a3 + 44) |= 0x20u;
    return;
  }
LABEL_16:
  *((_DWORD *)a3 + 10) = self->_visitMaybeLocation;
  *((_BYTE *)a3 + 44) |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_17;
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
    *((_BYTE *)result + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_dailyEvents;
  *((_BYTE *)result + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 6) = self->_eventsWithLocation;
  *((_BYTE *)result + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 7) = self->_eventsWithMaybeLocation;
  *((_BYTE *)result + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_eventsWithLMPLocation;
  *((_BYTE *)result + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 9) = self->_visitLocation;
  *((_BYTE *)result + 44) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_visitMaybeLocation;
  *((_BYTE *)result + 44) |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 8) = self->_visitLMPLocation;
  *((_BYTE *)result + 44) |= 0x20u;
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
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_40;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
      goto LABEL_40;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_dailyEvents != *((_DWORD *)a3 + 4))
        goto LABEL_40;
    }
    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
      goto LABEL_40;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_eventsWithLocation != *((_DWORD *)a3 + 6))
        goto LABEL_40;
    }
    else if ((*((_BYTE *)a3 + 44) & 8) != 0)
    {
      goto LABEL_40;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_eventsWithMaybeLocation != *((_DWORD *)a3 + 7))
        goto LABEL_40;
    }
    else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_40;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_eventsWithLMPLocation != *((_DWORD *)a3 + 5))
        goto LABEL_40;
    }
    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
      goto LABEL_40;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x40) == 0 || self->_visitLocation != *((_DWORD *)a3 + 9))
        goto LABEL_40;
    }
    else if ((*((_BYTE *)a3 + 44) & 0x40) != 0)
    {
      goto LABEL_40;
    }
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x80) == 0 || self->_visitMaybeLocation != *((_DWORD *)a3 + 10))
        goto LABEL_40;
    }
    else if ((*((_BYTE *)a3 + 44) & 0x80) != 0)
    {
LABEL_40:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 0x20) == 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x20) == 0 || self->_visitLMPLocation != *((_DWORD *)a3 + 8))
        goto LABEL_40;
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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_dailyEvents;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_eventsWithLocation;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_eventsWithMaybeLocation;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_eventsWithLMPLocation;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_visitLocation;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761 * self->_visitMaybeLocation;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_visitLMPLocation;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 44);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_dailyEvents = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_eventsWithLocation = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_eventsWithMaybeLocation = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  self->_eventsWithLMPLocation = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  self->_visitLocation = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x40u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 0x80) == 0)
  {
LABEL_8:
    if ((v3 & 0x20) == 0)
      return;
LABEL_17:
    self->_visitLMPLocation = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 0x20u;
    return;
  }
LABEL_16:
  self->_visitMaybeLocation = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x80u;
  if ((*((_BYTE *)a3 + 44) & 0x20) != 0)
    goto LABEL_17;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)dailyEvents
{
  return self->_dailyEvents;
}

- (int)eventsWithLocation
{
  return self->_eventsWithLocation;
}

- (int)eventsWithMaybeLocation
{
  return self->_eventsWithMaybeLocation;
}

- (int)eventsWithLMPLocation
{
  return self->_eventsWithLMPLocation;
}

- (int)visitLocation
{
  return self->_visitLocation;
}

- (int)visitMaybeLocation
{
  return self->_visitMaybeLocation;
}

- (int)visitLMPLocation
{
  return self->_visitLMPLocation;
}

@end
