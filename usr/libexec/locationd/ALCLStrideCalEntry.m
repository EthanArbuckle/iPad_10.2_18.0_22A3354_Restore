@implementation ALCLStrideCalEntry

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

- (void)setPacebin:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_pacebin = a3;
}

- (void)setHasPacebin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPacebin
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
  *(_BYTE *)&self->_has |= 8u;
  self->_regularEntry = a3;
}

- (void)setHasRegularEntry:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRegularEntry
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLStrideCalEntry;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLStrideCalEntry description](&v3, "description"), -[ALCLStrideCalEntry dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_recordId), CFSTR("recordId"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime), CFSTR("startTime"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pacebin), CFSTR("pacebin"));
  *(float *)&v4 = self->_kvalue;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("kvalue"));
  *(float *)&v5 = self->_kvalueTrack;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5), CFSTR("kvalueTrack"));
  *(float *)&v6 = self->_score;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("score"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_endTime), CFSTR("endTime"));
  *(float *)&v7 = self->_distance;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7), CFSTR("distance"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_steps), CFSTR("steps"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_session), CFSTR("session"));
  *(float *)&v8 = self->_speed;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8), CFSTR("speed"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry), CFSTR("regularEntry"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004BB7FC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field(a3, self->_recordId, 1);
  PBDataWriterWriteDoubleField(a3, 2, self->_startTime);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field(a3, self->_pacebin, 3);
  PBDataWriterWriteFloatField(a3, 4, self->_kvalue);
  PBDataWriterWriteFloatField(a3, 5, self->_kvalueTrack);
  PBDataWriterWriteFloatField(a3, 6, self->_score);
  PBDataWriterWriteDoubleField(a3, 7, self->_endTime);
  PBDataWriterWriteFloatField(a3, 8, self->_distance);
  PBDataWriterWriteInt32Field(a3, self->_steps, 9);
  PBDataWriterWriteInt32Field(a3, self->_session, 10);
  PBDataWriterWriteFloatField(a3, 11, self->_speed);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 12, self->_timestamp);
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteBOOLField(a3, self->_regularEntry, 13);
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_recordId;
    *((_BYTE *)a3 + 72) |= 4u;
  }
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_startTime;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_pacebin;
    *((_BYTE *)a3 + 72) |= 2u;
  }
  *((_DWORD *)a3 + 9) = LODWORD(self->_kvalue);
  *((_DWORD *)a3 + 10) = LODWORD(self->_kvalueTrack);
  *((_DWORD *)a3 + 13) = LODWORD(self->_score);
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_endTime;
  *((_DWORD *)a3 + 8) = LODWORD(self->_distance);
  *((_DWORD *)a3 + 16) = self->_steps;
  *((_DWORD *)a3 + 14) = self->_session;
  *((_DWORD *)a3 + 15) = LODWORD(self->_speed);
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return;
LABEL_9:
    *((_BYTE *)a3 + 68) = self->_regularEntry;
    *((_BYTE *)a3 + 72) |= 8u;
    return;
  }
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_timestamp;
  *((_BYTE *)a3 + 72) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)result + 12) = self->_recordId;
    *((_BYTE *)result + 72) |= 4u;
  }
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_startTime;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)result + 11) = self->_pacebin;
    *((_BYTE *)result + 72) |= 2u;
  }
  *((_DWORD *)result + 9) = LODWORD(self->_kvalue);
  *((_DWORD *)result + 10) = LODWORD(self->_kvalueTrack);
  *((_DWORD *)result + 13) = LODWORD(self->_score);
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_endTime;
  *((_DWORD *)result + 8) = LODWORD(self->_distance);
  *((_DWORD *)result + 16) = self->_steps;
  *((_DWORD *)result + 14) = self->_session;
  *((_DWORD *)result + 15) = LODWORD(self->_speed);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 72) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_BYTE *)result + 68) = self->_regularEntry;
    *((_BYTE *)result + 72) |= 8u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 4) == 0 || self->_recordId != *((_DWORD *)a3 + 12))
        goto LABEL_28;
    }
    else if ((*((_BYTE *)a3 + 72) & 4) != 0)
    {
      goto LABEL_28;
    }
    if (self->_startTime != *((double *)a3 + 2))
    {
LABEL_28:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 2) == 0 || self->_pacebin != *((_DWORD *)a3 + 11))
        goto LABEL_28;
    }
    else if ((*((_BYTE *)a3 + 72) & 2) != 0)
    {
      goto LABEL_28;
    }
    if (self->_kvalue != *((float *)a3 + 9)
      || self->_kvalueTrack != *((float *)a3 + 10)
      || self->_score != *((float *)a3 + 13)
      || self->_endTime != *((double *)a3 + 1)
      || self->_distance != *((float *)a3 + 8)
      || self->_steps != *((_DWORD *)a3 + 16)
      || self->_session != *((_DWORD *)a3 + 14)
      || self->_speed != *((float *)a3 + 15))
    {
      goto LABEL_28;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 1) == 0 || self->_timestamp != *((double *)a3 + 3))
        goto LABEL_28;
    }
    else if ((*((_BYTE *)a3 + 72) & 1) != 0)
    {
      goto LABEL_28;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 72) & 8) == 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 8) == 0)
        goto LABEL_28;
      if (self->_regularEntry)
      {
        if (!*((_BYTE *)a3 + 68))
          goto LABEL_28;
      }
      else if (*((_BYTE *)a3 + 68))
      {
        goto LABEL_28;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  double startTime;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float kvalue;
  float v13;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  float kvalueTrack;
  float v21;
  float v22;
  float v23;
  float v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  float score;
  float v30;
  float v31;
  float v32;
  float v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  double endTime;
  double v39;
  long double v40;
  double v41;
  double v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  float distance;
  float v48;
  float v49;
  float v50;
  float v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t steps;
  unint64_t v56;
  uint64_t session;
  float speed;
  float v59;
  float v60;
  float v61;
  float v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  double timestamp;
  double v69;
  long double v70;
  double v71;
  uint64_t v72;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;

  has = (char)self->_has;
  if ((has & 4) != 0)
    v77 = 2654435761 * self->_recordId;
  else
    v77 = 0;
  startTime = self->_startTime;
  v5 = -startTime;
  if (startTime >= 0.0)
    v5 = self->_startTime;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = fmod(v6, 1.84467441e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabs(v7);
  if (v7 >= 0.0)
    v11 = v10;
  v76 = v11;
  if ((has & 2) != 0)
    v75 = 2654435761 * self->_pacebin;
  else
    v75 = 0;
  kvalue = self->_kvalue;
  v13 = -kvalue;
  if (kvalue >= 0.0)
    v13 = self->_kvalue;
  v14 = floorf(v13 + 0.5);
  v15 = (float)(v13 - v14) * 1.8447e19;
  v16 = fmodf(v14, 1.8447e19);
  v17 = 2654435761u * (unint64_t)v16;
  v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0)
    v18 = 2654435761u * (unint64_t)v16;
  v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 >= 0.0)
    v19 = v18;
  v74 = v19;
  kvalueTrack = self->_kvalueTrack;
  v21 = -kvalueTrack;
  if (kvalueTrack >= 0.0)
    v21 = self->_kvalueTrack;
  v22 = floorf(v21 + 0.5);
  v23 = (float)(v21 - v22) * 1.8447e19;
  v24 = fmodf(v22, 1.8447e19);
  v25 = 2654435761u * (unint64_t)v24;
  v26 = v25 + (unint64_t)v23;
  if (v23 <= 0.0)
    v26 = 2654435761u * (unint64_t)v24;
  v27 = v25 - (unint64_t)fabsf(v23);
  if (v23 < 0.0)
    v28 = v27;
  else
    v28 = v26;
  score = self->_score;
  v30 = -score;
  if (score >= 0.0)
    v30 = self->_score;
  v31 = floorf(v30 + 0.5);
  v32 = (float)(v30 - v31) * 1.8447e19;
  v33 = fmodf(v31, 1.8447e19);
  v34 = 2654435761u * (unint64_t)v33;
  v35 = v34 + (unint64_t)v32;
  if (v32 <= 0.0)
    v35 = 2654435761u * (unint64_t)v33;
  v36 = v34 - (unint64_t)fabsf(v32);
  if (v32 < 0.0)
    v37 = v36;
  else
    v37 = v35;
  endTime = self->_endTime;
  v39 = -endTime;
  if (endTime >= 0.0)
    v39 = self->_endTime;
  v40 = floor(v39 + 0.5);
  v41 = (v39 - v40) * 1.84467441e19;
  v42 = fmod(v40, 1.84467441e19);
  v43 = 2654435761u * (unint64_t)v42;
  v44 = v43 + (unint64_t)v41;
  if (v41 <= 0.0)
    v44 = 2654435761u * (unint64_t)v42;
  v45 = v43 - (unint64_t)fabs(v41);
  if (v41 < 0.0)
    v46 = v45;
  else
    v46 = v44;
  distance = self->_distance;
  v48 = -distance;
  if (distance >= 0.0)
    v48 = self->_distance;
  v49 = floorf(v48 + 0.5);
  v50 = (float)(v48 - v49) * 1.8447e19;
  v51 = fmodf(v49, 1.8447e19);
  v52 = 2654435761u * (unint64_t)v51;
  v53 = v52 + (unint64_t)v50;
  if (v50 <= 0.0)
    v53 = 2654435761u * (unint64_t)v51;
  v54 = v52 - (unint64_t)fabsf(v50);
  steps = self->_steps;
  if (v50 < 0.0)
    v56 = v54;
  else
    v56 = v53;
  session = self->_session;
  speed = self->_speed;
  v59 = -speed;
  if (speed >= 0.0)
    v59 = self->_speed;
  v60 = floorf(v59 + 0.5);
  v61 = (float)(v59 - v60) * 1.8447e19;
  v62 = fmodf(v60, 1.8447e19);
  v63 = 2654435761u * (unint64_t)v62;
  v64 = v63 + (unint64_t)v61;
  if (v61 <= 0.0)
    v64 = 2654435761u * (unint64_t)v62;
  v65 = v63 - (unint64_t)fabsf(v61);
  if (v61 < 0.0)
    v66 = v65;
  else
    v66 = v64;
  if ((has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v69 = -timestamp;
    if (timestamp >= 0.0)
      v69 = self->_timestamp;
    v70 = floor(v69 + 0.5);
    v71 = (v69 - v70) * 1.84467441e19;
    v67 = 2654435761u * (unint64_t)fmod(v70, 1.84467441e19);
    if (v71 >= 0.0)
    {
      if (v71 > 0.0)
        v67 += (unint64_t)v71;
      if ((has & 8) == 0)
        goto LABEL_65;
    }
    else
    {
      v67 -= (unint64_t)fabs(v71);
      if ((has & 8) == 0)
      {
LABEL_65:
        v72 = 0;
        return v76 ^ v77 ^ v75 ^ v74 ^ v28 ^ v37 ^ v46 ^ v56 ^ (2654435761 * steps) ^ (2654435761 * session) ^ v66 ^ v67 ^ v72;
      }
    }
  }
  else
  {
    v67 = 0;
    if ((has & 8) == 0)
      goto LABEL_65;
  }
  v72 = 2654435761 * self->_regularEntry;
  return v76 ^ v77 ^ v75 ^ v74 ^ v28 ^ v37 ^ v46 ^ v56 ^ (2654435761 * steps) ^ (2654435761 * session) ^ v66 ^ v67 ^ v72;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 72) & 4) != 0)
  {
    self->_recordId = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }
  self->_startTime = *((double *)a3 + 2);
  if ((*((_BYTE *)a3 + 72) & 2) != 0)
  {
    self->_pacebin = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 2u;
  }
  self->_kvalue = *((float *)a3 + 9);
  self->_kvalueTrack = *((float *)a3 + 10);
  self->_score = *((float *)a3 + 13);
  self->_endTime = *((double *)a3 + 1);
  self->_distance = *((float *)a3 + 8);
  self->_steps = *((_DWORD *)a3 + 16);
  self->_session = *((_DWORD *)a3 + 14);
  self->_speed = *((float *)a3 + 15);
  if ((*((_BYTE *)a3 + 72) & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 72) & 8) == 0)
      return;
LABEL_9:
    self->_regularEntry = *((_BYTE *)a3 + 68);
    *(_BYTE *)&self->_has |= 8u;
    return;
  }
  self->_timestamp = *((double *)a3 + 3);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 72) & 8) != 0)
    goto LABEL_9;
}

- (int)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (unsigned)pacebin
{
  return self->_pacebin;
}

- (float)kvalue
{
  return self->_kvalue;
}

- (void)setKvalue:(float)a3
{
  self->_kvalue = a3;
}

- (float)kvalueTrack
{
  return self->_kvalueTrack;
}

- (void)setKvalueTrack:(float)a3
{
  self->_kvalueTrack = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (float)distance
{
  return self->_distance;
}

- (void)setDistance:(float)a3
{
  self->_distance = a3;
}

- (int)steps
{
  return self->_steps;
}

- (void)setSteps:(int)a3
{
  self->_steps = a3;
}

- (int)session
{
  return self->_session;
}

- (void)setSession:(int)a3
{
  self->_session = a3;
}

- (float)speed
{
  return self->_speed;
}

- (void)setSpeed:(float)a3
{
  self->_speed = a3;
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
