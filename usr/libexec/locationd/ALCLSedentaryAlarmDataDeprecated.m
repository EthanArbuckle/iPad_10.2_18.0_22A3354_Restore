@implementation ALCLSedentaryAlarmDataDeprecated

- (id)typeAsString:(int)a3
{
  if (a3 >= 8)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_1021912E0[a3];
}

- (int)StringAsType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kAlarmTypeReminder")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kAlarmTypeFinal")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kAlarmTypeReset")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kAlarmTypeActiveReminder")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kAlarmTypeDrivingReminder")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kAlarmTypeDeskReminder")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kAlarmTypeTestSedentary")) & 1) != 0)
    return 6;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kAlarmTypeTestActive")))
    return 7;
  return 0;
}

- (void)setTimestamp:(double)a3
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

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLSedentaryAlarmDataDeprecated;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLSedentaryAlarmDataDeprecated description](&v3, "description"), -[ALCLSedentaryAlarmDataDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  uint64_t type;
  __CFString *v5;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firedTime), CFSTR("firedTime"));
  type = self->_type;
  if (type >= 8)
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
  else
    v5 = off_1021912E0[type];
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_didWake), CFSTR("didWake"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp), CFSTR("timestamp"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry), CFSTR("regularEntry"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100EE3AD0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteDoubleField(a3, 1, self->_firedTime);
  PBDataWriterWriteInt32Field(a3, self->_type, 2);
  PBDataWriterWriteBOOLField(a3, self->_didWake, 3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField(a3, 4, self->_timestamp);
  PBDataWriterWriteBOOLField(a3, self->_regularEntry, 5);
}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_firedTime;
  *((_DWORD *)a3 + 6) = self->_type;
  *((_BYTE *)a3 + 28) = self->_didWake;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  *((_BYTE *)a3 + 29) = self->_regularEntry;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_firedTime;
  *((_DWORD *)result + 6) = self->_type;
  *((_BYTE *)result + 28) = self->_didWake;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 32) |= 1u;
  }
  *((_BYTE *)result + 29) = self->_regularEntry;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_firedTime != *((double *)a3 + 1) || self->_type != *((_DWORD *)a3 + 6))
      goto LABEL_15;
    if (self->_didWake)
    {
      if (!*((_BYTE *)a3 + 28))
        goto LABEL_15;
    }
    else if (*((_BYTE *)a3 + 28))
    {
LABEL_15:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((double *)a3 + 2))
        goto LABEL_15;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
      goto LABEL_15;
    }
    v6 = *((unsigned __int8 *)a3 + 29);
    if (self->_regularEntry)
      LOBYTE(v5) = v6 != 0;
    else
      LOBYTE(v5) = v6 == 0;
  }
  return v5;
}

- (unint64_t)hash
{
  double firedTime;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t type;
  _BOOL4 didWake;
  unint64_t v14;
  double timestamp;
  double v16;
  long double v17;
  double v18;

  firedTime = self->_firedTime;
  v4 = -firedTime;
  if (firedTime >= 0.0)
    v4 = self->_firedTime;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  type = self->_type;
  didWake = self->_didWake;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v16 = -timestamp;
    if (timestamp >= 0.0)
      v16 = self->_timestamp;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  return (2654435761 * type) ^ v14 ^ (2654435761 * self->_regularEntry) ^ v11 ^ (2654435761 * didWake);
}

- (void)mergeFrom:(id)a3
{
  self->_firedTime = *((double *)a3 + 1);
  self->_type = *((_DWORD *)a3 + 6);
  self->_didWake = *((_BYTE *)a3 + 28);
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_timestamp = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  self->_regularEntry = *((_BYTE *)a3 + 29);
}

- (double)firedTime
{
  return self->_firedTime;
}

- (void)setFiredTime:(double)a3
{
  self->_firedTime = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)didWake
{
  return self->_didWake;
}

- (void)setDidWake:(BOOL)a3
{
  self->_didWake = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

- (void)setRegularEntry:(BOOL)a3
{
  self->_regularEntry = a3;
}

@end
