@implementation SCLPBScheduleRecurrence

- (BOOL)hasTimeInterval
{
  return self->_timeInterval != 0;
}

- (int)day
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_day;
  else
    return 1;
}

- (void)setDay:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_day = a3;
}

- (void)setHasDay:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDay
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)dayAsString:(int)a3
{
  if ((a3 - 1) < 7)
    return off_24E29BDF8[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDay:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUNDAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONDAY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TUESDAY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEDNESDAY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THURSDAY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRIDAY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SATURDAY")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 1;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SCLPBScheduleRecurrence;
  -[SCLPBScheduleRecurrence description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBScheduleRecurrence dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SCLPBTimeInterval *timeInterval;
  void *v5;
  unsigned int v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeInterval = self->_timeInterval;
  if (timeInterval)
  {
    -[SCLPBTimeInterval dictionaryRepresentation](timeInterval, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeInterval"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = self->_day - 1;
    if (v6 >= 7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_day);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_24E29BDF8[v6];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("day"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SCLPBScheduleRecurrenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_timeInterval)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_timeInterval)
  {
    v5 = v4;
    objc_msgSend(v4, "setTimeInterval:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_day;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SCLPBTimeInterval copyWithZone:](self->_timeInterval, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_day;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SCLPBTimeInterval *timeInterval;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  timeInterval = self->_timeInterval;
  if ((unint64_t)timeInterval | *((_QWORD *)v4 + 2))
  {
    if (!-[SCLPBTimeInterval isEqual:](timeInterval, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_day == *((_DWORD *)v4 + 2))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SCLPBTimeInterval hash](self->_timeInterval, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_day;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SCLPBTimeInterval *timeInterval;
  uint64_t v6;
  id v7;

  v4 = a3;
  timeInterval = self->_timeInterval;
  v6 = *((_QWORD *)v4 + 2);
  if (timeInterval)
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[SCLPBTimeInterval mergeFrom:](timeInterval, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[SCLPBScheduleRecurrence setTimeInterval:](self, "setTimeInterval:");
  }
  v4 = v7;
LABEL_7:
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_day = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (SCLPBTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_timeInterval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeInterval, 0);
}

@end
