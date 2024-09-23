@implementation ALCLStrideCalEntryDeprecated

- (void)setRecordId:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recordId = a3;
}

- (void)setHasRecordId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (void)setRegularEntry:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_regularEntry = a3;
}

- (void)setHasRegularEntry:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRegularEntry
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLStrideCalEntryDeprecated;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLStrideCalEntryDeprecated description](&v3, "description"), -[ALCLStrideCalEntryDeprecated dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_recordId), CFSTR("recordId"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pacebin), CFSTR("pacebin"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_kvalue), CFSTR("kvalue"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_kvalueTrack), CFSTR("kvalueTrack"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_score), CFSTR("score"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry), CFSTR("regularEntry"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1005CA4C4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field(a3, self->_recordId, 1);
  PBDataWriterWriteUint32Field(a3, self->_pacebin, 2);
  PBDataWriterWriteDoubleField(a3, 3, self->_kvalue);
  PBDataWriterWriteDoubleField(a3, 4, self->_kvalueTrack);
  PBDataWriterWriteDoubleField(a3, 5, self->_score);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 6, self->_timestamp);
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteBOOLField(a3, self->_regularEntry, 7);
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_recordId;
    *((_BYTE *)a3 + 52) |= 2u;
  }
  *((_DWORD *)a3 + 10) = self->_pacebin;
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_kvalue;
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_kvalueTrack;
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_score;
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return;
LABEL_7:
    *((_BYTE *)a3 + 48) = self->_regularEntry;
    *((_BYTE *)a3 + 52) |= 4u;
    return;
  }
  *((_QWORD *)a3 + 4) = *(_QWORD *)&self->_timestamp;
  *((_BYTE *)a3 + 52) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)result + 11) = self->_recordId;
    *((_BYTE *)result + 52) |= 2u;
  }
  *((_DWORD *)result + 10) = self->_pacebin;
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_kvalue;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_kvalueTrack;
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_score;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 4) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 52) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_BYTE *)result + 48) = self->_regularEntry;
    *((_BYTE *)result + 52) |= 4u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_recordId != *((_DWORD *)a3 + 11))
        goto LABEL_18;
    }
    else if ((*((_BYTE *)a3 + 52) & 2) != 0)
    {
      goto LABEL_18;
    }
    if (self->_pacebin != *((_DWORD *)a3 + 10)
      || self->_kvalue != *((double *)a3 + 1)
      || self->_kvalueTrack != *((double *)a3 + 2)
      || self->_score != *((double *)a3 + 3))
    {
      goto LABEL_18;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_timestamp != *((double *)a3 + 4))
        goto LABEL_18;
    }
    else if ((*((_BYTE *)a3 + 52) & 1) != 0)
    {
      goto LABEL_18;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 52) & 4) == 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 4) == 0)
      {
LABEL_18:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_regularEntry)
      {
        if (!*((_BYTE *)a3 + 48))
          goto LABEL_18;
      }
      else if (*((_BYTE *)a3 + 48))
      {
        goto LABEL_18;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  unsigned int pacebin;
  double kvalue;
  double v7;
  long double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double kvalueTrack;
  double v16;
  long double v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double score;
  double v25;
  long double v26;
  double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  double timestamp;
  double v35;
  long double v36;
  double v37;
  uint64_t v38;

  has = (char)self->_has;
  if ((has & 2) != 0)
    v4 = 2654435761 * self->_recordId;
  else
    v4 = 0;
  pacebin = self->_pacebin;
  kvalue = self->_kvalue;
  v7 = -kvalue;
  if (kvalue >= 0.0)
    v7 = self->_kvalue;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = fmod(v8, 1.84467441e19);
  v11 = 2654435761u * (unint64_t)v10;
  v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0)
    v12 = 2654435761u * (unint64_t)v10;
  v13 = v11 - (unint64_t)fabs(v9);
  if (v9 < 0.0)
    v14 = v13;
  else
    v14 = v12;
  kvalueTrack = self->_kvalueTrack;
  v16 = -kvalueTrack;
  if (kvalueTrack >= 0.0)
    v16 = self->_kvalueTrack;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = fmod(v17, 1.84467441e19);
  v20 = 2654435761u * (unint64_t)v19;
  v21 = v20 + (unint64_t)v18;
  if (v18 <= 0.0)
    v21 = 2654435761u * (unint64_t)v19;
  v22 = v20 - (unint64_t)fabs(v18);
  if (v18 < 0.0)
    v23 = v22;
  else
    v23 = v21;
  score = self->_score;
  v25 = -score;
  if (score >= 0.0)
    v25 = self->_score;
  v26 = floor(v25 + 0.5);
  v27 = (v25 - v26) * 1.84467441e19;
  v28 = fmod(v26, 1.84467441e19);
  v29 = 2654435761u * (unint64_t)v28;
  v30 = v29 + (unint64_t)v27;
  if (v27 <= 0.0)
    v30 = 2654435761u * (unint64_t)v28;
  v31 = v29 - (unint64_t)fabs(v27);
  if (v27 < 0.0)
    v32 = v31;
  else
    v32 = v30;
  if ((has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v35 = -timestamp;
    if (timestamp >= 0.0)
      v35 = self->_timestamp;
    v36 = floor(v35 + 0.5);
    v37 = (v35 - v36) * 1.84467441e19;
    v33 = 2654435761u * (unint64_t)fmod(v36, 1.84467441e19);
    if (v37 >= 0.0)
    {
      if (v37 > 0.0)
        v33 += (unint64_t)v37;
      if ((has & 4) == 0)
        goto LABEL_36;
    }
    else
    {
      v33 -= (unint64_t)fabs(v37);
      if ((has & 4) == 0)
      {
LABEL_36:
        v38 = 0;
        return (2654435761 * pacebin) ^ v23 ^ v4 ^ v14 ^ v32 ^ v33 ^ v38;
      }
    }
  }
  else
  {
    v33 = 0;
    if ((has & 4) == 0)
      goto LABEL_36;
  }
  v38 = 2654435761 * self->_regularEntry;
  return (2654435761 * pacebin) ^ v23 ^ v4 ^ v14 ^ v32 ^ v33 ^ v38;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 52) & 2) != 0)
  {
    self->_recordId = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 2u;
  }
  self->_pacebin = *((_DWORD *)a3 + 10);
  self->_kvalue = *((double *)a3 + 1);
  self->_kvalueTrack = *((double *)a3 + 2);
  self->_score = *((double *)a3 + 3);
  if ((*((_BYTE *)a3 + 52) & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 52) & 4) == 0)
      return;
LABEL_7:
    self->_regularEntry = *((_BYTE *)a3 + 48);
    *(_BYTE *)&self->_has |= 4u;
    return;
  }
  self->_timestamp = *((double *)a3 + 4);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 52) & 4) != 0)
    goto LABEL_7;
}

- (int)recordId
{
  return self->_recordId;
}

- (unsigned)pacebin
{
  return self->_pacebin;
}

- (void)setPacebin:(unsigned int)a3
{
  self->_pacebin = a3;
}

- (double)kvalue
{
  return self->_kvalue;
}

- (void)setKvalue:(double)a3
{
  self->_kvalue = a3;
}

- (double)kvalueTrack
{
  return self->_kvalueTrack;
}

- (void)setKvalueTrack:(double)a3
{
  self->_kvalueTrack = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

@end
