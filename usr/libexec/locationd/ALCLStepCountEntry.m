@implementation ALCLStepCountEntry

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPace:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pace = a3;
}

- (void)setHasPace:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPace
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRecordId:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_recordId = a3;
}

- (void)setHasRecordId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecordId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLStepCountEntry;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLStepCountEntry description](&v3, "description"), -[ALCLStepCountEntry dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp), CFSTR("timestamp"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_count), CFSTR("count"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_distance), CFSTR("distance"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_floorsAscended), CFSTR("floorsAscended"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_floorsDescended), CFSTR("floorsDescended"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_pace), CFSTR("pace"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_recordId), CFSTR("recordId"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry), CFSTR("regularEntry"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004BFBFC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteDoubleField(a3, 1, self->_timestamp);
  PBDataWriterWriteUint32Field(a3, self->_count, 2);
  PBDataWriterWriteDoubleField(a3, 3, self->_distance);
  PBDataWriterWriteUint32Field(a3, self->_floorsAscended, 4);
  PBDataWriterWriteUint32Field(a3, self->_floorsDescended, 5);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 6, self->_pace);
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field(a3, self->_recordId, 7);
  PBDataWriterWriteBOOLField(a3, self->_regularEntry, 8);
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)a3 + 52) |= 2u;
  }
  *((_DWORD *)a3 + 8) = self->_count;
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_distance;
  *((_DWORD *)a3 + 9) = self->_floorsAscended;
  *((_DWORD *)a3 + 10) = self->_floorsDescended;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_pace;
    *((_BYTE *)a3 + 52) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_recordId;
    *((_BYTE *)a3 + 52) |= 4u;
  }
  *((_BYTE *)a3 + 48) = self->_regularEntry;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 52) |= 2u;
  }
  *((_DWORD *)result + 8) = self->_count;
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_distance;
  *((_DWORD *)result + 9) = self->_floorsAscended;
  *((_DWORD *)result + 10) = self->_floorsDescended;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_pace;
    *((_BYTE *)result + 52) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 11) = self->_recordId;
    *((_BYTE *)result + 52) |= 4u;
  }
  *((_BYTE *)result + 48) = self->_regularEntry;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_timestamp != *((double *)a3 + 3))
        goto LABEL_23;
    }
    else if ((*((_BYTE *)a3 + 52) & 2) != 0)
    {
LABEL_23:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (self->_count != *((_DWORD *)a3 + 8)
      || self->_distance != *((double *)a3 + 1)
      || self->_floorsAscended != *((_DWORD *)a3 + 9)
      || self->_floorsDescended != *((_DWORD *)a3 + 10))
    {
      goto LABEL_23;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_pace != *((double *)a3 + 2))
        goto LABEL_23;
    }
    else if ((*((_BYTE *)a3 + 52) & 1) != 0)
    {
      goto LABEL_23;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_recordId != *((_DWORD *)a3 + 11))
        goto LABEL_23;
    }
    else if ((*((_BYTE *)a3 + 52) & 4) != 0)
    {
      goto LABEL_23;
    }
    v6 = *((unsigned __int8 *)a3 + 48);
    if (self->_regularEntry)
      LOBYTE(v5) = v6 != 0;
    else
      LOBYTE(v5) = v6 == 0;
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int count;
  double distance;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int floorsAscended;
  unsigned int floorsDescended;
  unint64_t v25;
  double pace;
  double v27;
  long double v28;
  double v29;
  uint64_t v30;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    timestamp = self->_timestamp;
    v6 = -timestamp;
    if (timestamp >= 0.0)
      v6 = self->_timestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v9 = fmod(v7, 1.84467441e19);
    v10 = 2654435761u * (unint64_t)v9;
    v11 = v10 + (unint64_t)v8;
    if (v8 <= 0.0)
      v11 = 2654435761u * (unint64_t)v9;
    v12 = v10 - (unint64_t)fabs(v8);
    if (v8 < 0.0)
      v4 = v12;
    else
      v4 = v11;
  }
  else
  {
    v4 = 0;
  }
  count = self->_count;
  distance = self->_distance;
  v15 = -distance;
  if (distance >= 0.0)
    v15 = self->_distance;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  v19 = v18 + (unint64_t)v17;
  v20 = fabs(v17);
  if (v17 <= 0.0)
    v19 = v18;
  v21 = v18 - (unint64_t)v20;
  if (v17 < 0.0)
    v22 = v21;
  else
    v22 = v19;
  floorsAscended = self->_floorsAscended;
  floorsDescended = self->_floorsDescended;
  if ((has & 1) != 0)
  {
    pace = self->_pace;
    v27 = -pace;
    if (pace >= 0.0)
      v27 = self->_pace;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
      if ((has & 4) == 0)
        goto LABEL_28;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
      if ((has & 4) == 0)
      {
LABEL_28:
        v30 = 0;
        return (2654435761 * count) ^ (2654435761 * floorsAscended) ^ (2654435761 * floorsDescended) ^ v25 ^ v30 ^ (2654435761 * self->_regularEntry) ^ v4 ^ v22;
      }
    }
  }
  else
  {
    v25 = 0;
    if ((has & 4) == 0)
      goto LABEL_28;
  }
  v30 = 2654435761 * self->_recordId;
  return (2654435761 * count) ^ (2654435761 * floorsAscended) ^ (2654435761 * floorsDescended) ^ v25 ^ v30 ^ (2654435761 * self->_regularEntry) ^ v4 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  if ((*((_BYTE *)a3 + 52) & 2) != 0)
  {
    self->_timestamp = *((double *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
  self->_count = *((_DWORD *)a3 + 8);
  self->_distance = *((double *)a3 + 1);
  self->_floorsAscended = *((_DWORD *)a3 + 9);
  self->_floorsDescended = *((_DWORD *)a3 + 10);
  v3 = *((_BYTE *)a3 + 52);
  if ((v3 & 1) != 0)
  {
    self->_pace = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 52);
  }
  if ((v3 & 4) != 0)
  {
    self->_recordId = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 4u;
  }
  self->_regularEntry = *((_BYTE *)a3 + 48);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  self->_count = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (unsigned)floorsAscended
{
  return self->_floorsAscended;
}

- (void)setFloorsAscended:(unsigned int)a3
{
  self->_floorsAscended = a3;
}

- (unsigned)floorsDescended
{
  return self->_floorsDescended;
}

- (void)setFloorsDescended:(unsigned int)a3
{
  self->_floorsDescended = a3;
}

- (double)pace
{
  return self->_pace;
}

- (int)recordId
{
  return self->_recordId;
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
