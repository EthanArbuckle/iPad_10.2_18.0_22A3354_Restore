@implementation CLCKVO2MaxCalorimetryInput

- (void)setStartTime:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMets:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_mets = a3;
}

- (void)setHasMets:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMets
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setMetSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_metSource = a3;
}

- (void)setHasMetSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMetSource
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHr:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_hr = a3;
}

- (void)setHasHr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHr
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHrConfidence:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_hrConfidence = a3;
}

- (void)setHasHrConfidence:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasHrConfidence
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setGradeType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_gradeType = a3;
}

- (void)setHasGradeType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasGradeType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setGrade:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_grade = a3;
}

- (void)setHasGrade:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasGrade
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasGPS:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_hasGPS = a3;
}

- (void)setHasHasGPS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasHasGPS
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasStrideCal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_hasStrideCal = a3;
}

- (void)setHasHasStrideCal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasHasStrideCal
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setWorkoutType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWorkoutType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCadence:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_cadence = a3;
}

- (void)setHasCadence:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCadence
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPace:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pace = a3;
}

- (void)setHasPace:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPace
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIsStroller:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isStroller = a3;
}

- (void)setHasIsStroller:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsStroller
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHrTime:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hrTime = a3;
}

- (void)setHasHrTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHrTime
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxCalorimetryInput;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[CLCKVO2MaxCalorimetryInput description](&v3, "description"), -[CLCKVO2MaxCalorimetryInput dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  double v4;
  __int16 has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime), CFSTR("startTime"));
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v4 = self->_mets;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("mets"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_metSource), CFSTR("metSource"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *(float *)&v4 = self->_hr;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("hr"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *(float *)&v4 = self->_hrConfidence;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("hrConfidence"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_gradeType), CFSTR("gradeType"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_grade), CFSTR("grade"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasGPS), CFSTR("hasGPS"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasStrideCal), CFSTR("hasStrideCal"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_workoutType), CFSTR("workoutType"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_cadence), CFSTR("cadence"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
LABEL_29:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isStroller), CFSTR("isStroller"));
    if ((*(_WORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_15;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_pace), CFSTR("pace"));
  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 4) != 0)
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrTime), CFSTR("hrTime"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100CEDD74((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1, self->_startTime);
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField(a3, 2, self->_mets);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field(a3, self->_metSource, 3);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteFloatField(a3, 4, self->_hr);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteFloatField(a3, 5, self->_hrConfidence);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field(a3, self->_gradeType, 6);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField(a3, 7, self->_grade);
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField(a3, self->_hasGPS, 8);
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField(a3, self->_hasStrideCal, 9);
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field(a3, self->_workoutType, 10);
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField(a3, 11, self->_cadence);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField(a3, 12, self->_pace);
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      return;
LABEL_29:
    PBDataWriterWriteDoubleField(a3, 14, self->_hrTime);
    return;
  }
LABEL_28:
  PBDataWriterWriteBOOLField(a3, self->_isStroller, 13);
  if ((*(_WORD *)&self->_has & 4) != 0)
    goto LABEL_29;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 5) = *(_QWORD *)&self->_startTime;
    *((_WORD *)a3 + 38) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 16) = LODWORD(self->_mets);
  *((_WORD *)a3 + 38) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 15) = self->_metSource;
  *((_WORD *)a3 + 38) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 13) = LODWORD(self->_hr);
  *((_WORD *)a3 + 38) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 14) = LODWORD(self->_hrConfidence);
  *((_WORD *)a3 + 38) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 12) = self->_gradeType;
  *((_WORD *)a3 + 38) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_grade;
  *((_WORD *)a3 + 38) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)a3 + 72) = self->_hasGPS;
  *((_WORD *)a3 + 38) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_BYTE *)a3 + 73) = self->_hasStrideCal;
  *((_WORD *)a3 + 38) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 17) = self->_workoutType;
  *((_WORD *)a3 + 38) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_cadence;
  *((_WORD *)a3 + 38) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a3 + 4) = *(_QWORD *)&self->_pace;
  *((_WORD *)a3 + 38) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      return;
LABEL_29:
    *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_hrTime;
    *((_WORD *)a3 + 38) |= 4u;
    return;
  }
LABEL_28:
  *((_BYTE *)a3 + 74) = self->_isStroller;
  *((_WORD *)a3 + 38) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 4) != 0)
    goto LABEL_29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)result + 5) = *(_QWORD *)&self->_startTime;
    *((_WORD *)result + 38) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 16) = LODWORD(self->_mets);
  *((_WORD *)result + 38) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 15) = self->_metSource;
  *((_WORD *)result + 38) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 13) = LODWORD(self->_hr);
  *((_WORD *)result + 38) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 14) = LODWORD(self->_hrConfidence);
  *((_WORD *)result + 38) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 12) = self->_gradeType;
  *((_WORD *)result + 38) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_grade;
  *((_WORD *)result + 38) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_BYTE *)result + 72) = self->_hasGPS;
  *((_WORD *)result + 38) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_BYTE *)result + 73) = self->_hasStrideCal;
  *((_WORD *)result + 38) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 17) = self->_workoutType;
  *((_WORD *)result + 38) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_cadence;
  *((_WORD *)result + 38) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_pace;
  *((_WORD *)result + 38) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      return result;
    goto LABEL_15;
  }
LABEL_29:
  *((_BYTE *)result + 74) = self->_isStroller;
  *((_WORD *)result + 38) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 4) == 0)
    return result;
LABEL_15:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_hrTime;
  *((_WORD *)result + 38) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 38);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_startTime != *((double *)a3 + 5))
      goto LABEL_80;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x200) == 0 || self->_mets != *((float *)a3 + 16))
      goto LABEL_80;
  }
  else if ((*((_WORD *)a3 + 38) & 0x200) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x100) == 0 || self->_metSource != *((_DWORD *)a3 + 15))
      goto LABEL_80;
  }
  else if ((*((_WORD *)a3 + 38) & 0x100) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_hr != *((float *)a3 + 13))
      goto LABEL_80;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_hrConfidence != *((float *)a3 + 14))
      goto LABEL_80;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_gradeType != *((_DWORD *)a3 + 12))
      goto LABEL_80;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_grade != *((double *)a3 + 2))
      goto LABEL_80;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x800) == 0)
      goto LABEL_80;
    if (self->_hasGPS)
    {
      if (!*((_BYTE *)a3 + 72))
        goto LABEL_80;
    }
    else if (*((_BYTE *)a3 + 72))
    {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)a3 + 38) & 0x800) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x1000) == 0)
      goto LABEL_80;
    if (self->_hasStrideCal)
    {
      if (!*((_BYTE *)a3 + 73))
        goto LABEL_80;
    }
    else if (*((_BYTE *)a3 + 73))
    {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)a3 + 38) & 0x1000) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x400) == 0 || self->_workoutType != *((_DWORD *)a3 + 17))
      goto LABEL_80;
  }
  else if ((*((_WORD *)a3 + 38) & 0x400) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_cadence != *((double *)a3 + 1))
      goto LABEL_80;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_pace != *((double *)a3 + 4))
      goto LABEL_80;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x2000) != 0)
      goto LABEL_80;
    goto LABEL_76;
  }
  if ((*((_WORD *)a3 + 38) & 0x2000) == 0)
    goto LABEL_80;
  if (self->_isStroller)
  {
    if (!*((_BYTE *)a3 + 74))
      goto LABEL_80;
    goto LABEL_76;
  }
  if (*((_BYTE *)a3 + 74))
  {
LABEL_80:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_76:
  LOBYTE(v5) = (v7 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_hrTime != *((double *)a3 + 3))
      goto LABEL_80;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double startTime;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float mets;
  float v11;
  float v12;
  float v13;
  float hr;
  float v15;
  float v16;
  float v17;
  unint64_t v18;
  unint64_t v19;
  float hrConfidence;
  float v21;
  float v22;
  float v23;
  double grade;
  double v25;
  long double v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  double cadence;
  double v32;
  long double v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  double pace;
  double v39;
  long double v40;
  double v41;
  uint64_t v42;
  double hrTime;
  double v44;
  long double v45;
  double v46;
  unint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    startTime = self->_startTime;
    v6 = -startTime;
    if (startTime >= 0.0)
      v6 = self->_startTime;
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
  if ((has & 0x200) != 0)
  {
    mets = self->_mets;
    v11 = -mets;
    if (mets >= 0.0)
      v11 = self->_mets;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 0x100) != 0)
  {
    v53 = 2654435761 * self->_metSource;
    if ((has & 0x40) != 0)
      goto LABEL_19;
LABEL_24:
    v18 = 0;
    goto LABEL_27;
  }
  v53 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_24;
LABEL_19:
  hr = self->_hr;
  v15 = -hr;
  if (hr >= 0.0)
    v15 = self->_hr;
  v16 = floorf(v15 + 0.5);
  v17 = (float)(v15 - v16) * 1.8447e19;
  v18 = 2654435761u * (unint64_t)fmodf(v16, 1.8447e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabsf(v17);
  }
LABEL_27:
  if ((has & 0x80) != 0)
  {
    hrConfidence = self->_hrConfidence;
    v21 = -hrConfidence;
    if (hrConfidence >= 0.0)
      v21 = self->_hrConfidence;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((has & 0x20) != 0)
  {
    v51 = 2654435761 * self->_gradeType;
    if ((has & 2) != 0)
      goto LABEL_37;
LABEL_42:
    v28 = 0;
    goto LABEL_45;
  }
  v51 = 0;
  if ((has & 2) == 0)
    goto LABEL_42;
LABEL_37:
  grade = self->_grade;
  v25 = -grade;
  if (grade >= 0.0)
    v25 = self->_grade;
  v26 = floor(v25 + 0.5);
  v27 = (v25 - v26) * 1.84467441e19;
  v28 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
  if (v27 >= 0.0)
  {
    if (v27 > 0.0)
      v28 += (unint64_t)v27;
  }
  else
  {
    v28 -= (unint64_t)fabs(v27);
  }
LABEL_45:
  if ((has & 0x800) != 0)
    v50 = 2654435761 * self->_hasGPS;
  else
    v50 = 0;
  v54 = v4;
  v52 = v18;
  if ((has & 0x1000) != 0)
    v49 = 2654435761 * self->_hasStrideCal;
  else
    v49 = 0;
  v29 = v9;
  if ((has & 0x400) != 0)
  {
    v30 = 2654435761 * self->_workoutType;
    if ((has & 1) != 0)
      goto LABEL_53;
LABEL_58:
    v35 = 0;
    goto LABEL_61;
  }
  v30 = 0;
  if ((has & 1) == 0)
    goto LABEL_58;
LABEL_53:
  cadence = self->_cadence;
  v32 = -cadence;
  if (cadence >= 0.0)
    v32 = self->_cadence;
  v33 = floor(v32 + 0.5);
  v34 = (v32 - v33) * 1.84467441e19;
  v35 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
  if (v34 >= 0.0)
  {
    if (v34 > 0.0)
      v35 += (unint64_t)v34;
  }
  else
  {
    v35 -= (unint64_t)fabs(v34);
  }
LABEL_61:
  v36 = v19;
  if ((has & 8) != 0)
  {
    pace = self->_pace;
    v39 = -pace;
    if (pace >= 0.0)
      v39 = self->_pace;
    v40 = floor(v39 + 0.5);
    v41 = (v39 - v40) * 1.84467441e19;
    v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0)
        v37 += (unint64_t)v41;
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    v37 = 0;
  }
  if ((has & 0x2000) != 0)
  {
    v42 = 2654435761 * self->_isStroller;
    if ((has & 4) != 0)
      goto LABEL_71;
LABEL_76:
    v47 = 0;
    return v29 ^ v54 ^ v53 ^ v52 ^ v36 ^ v51 ^ v28 ^ v50 ^ v49 ^ v30 ^ v35 ^ v37 ^ v42 ^ v47;
  }
  v42 = 0;
  if ((has & 4) == 0)
    goto LABEL_76;
LABEL_71:
  hrTime = self->_hrTime;
  v44 = -hrTime;
  if (hrTime >= 0.0)
    v44 = self->_hrTime;
  v45 = floor(v44 + 0.5);
  v46 = (v44 - v45) * 1.84467441e19;
  v47 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
  if (v46 >= 0.0)
  {
    if (v46 > 0.0)
      v47 += (unint64_t)v46;
  }
  else
  {
    v47 -= (unint64_t)fabs(v46);
  }
  return v29 ^ v54 ^ v53 ^ v52 ^ v36 ^ v51 ^ v28 ^ v50 ^ v49 ^ v30 ^ v35 ^ v37 ^ v42 ^ v47;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x10) != 0)
  {
    self->_startTime = *((double *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    v3 = *((_WORD *)a3 + 38);
    if ((v3 & 0x200) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*((_WORD *)a3 + 38) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_mets = *((float *)a3 + 16);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_metSource = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_hr = *((float *)a3 + 13);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_hrConfidence = *((float *)a3 + 14);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  self->_gradeType = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 2) == 0)
  {
LABEL_8:
    if ((v3 & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  self->_grade = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x800) == 0)
  {
LABEL_9:
    if ((v3 & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  self->_hasGPS = *((_BYTE *)a3 + 72);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x1000) == 0)
  {
LABEL_10:
    if ((v3 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  self->_hasStrideCal = *((_BYTE *)a3 + 73);
  *(_WORD *)&self->_has |= 0x1000u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x400) == 0)
  {
LABEL_11:
    if ((v3 & 1) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  self->_workoutType = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 1) == 0)
  {
LABEL_12:
    if ((v3 & 8) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  self->_cadence = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 8) == 0)
  {
LABEL_13:
    if ((v3 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  self->_pace = *((double *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x2000) == 0)
  {
LABEL_14:
    if ((v3 & 4) == 0)
      return;
LABEL_29:
    self->_hrTime = *((double *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    return;
  }
LABEL_28:
  self->_isStroller = *((_BYTE *)a3 + 74);
  *(_WORD *)&self->_has |= 0x2000u;
  if ((*((_WORD *)a3 + 38) & 4) != 0)
    goto LABEL_29;
}

- (double)startTime
{
  return self->_startTime;
}

- (float)mets
{
  return self->_mets;
}

- (int)metSource
{
  return self->_metSource;
}

- (float)hr
{
  return self->_hr;
}

- (float)hrConfidence
{
  return self->_hrConfidence;
}

- (int)gradeType
{
  return self->_gradeType;
}

- (double)grade
{
  return self->_grade;
}

- (BOOL)hasGPS
{
  return self->_hasGPS;
}

- (BOOL)hasStrideCal
{
  return self->_hasStrideCal;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (double)cadence
{
  return self->_cadence;
}

- (double)pace
{
  return self->_pace;
}

- (BOOL)isStroller
{
  return self->_isStroller;
}

- (double)hrTime
{
  return self->_hrTime;
}

@end
